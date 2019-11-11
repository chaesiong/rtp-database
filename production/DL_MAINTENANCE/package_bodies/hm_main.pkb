CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_MAINTENANCE"."HM_MAIN" is

  procedure xtest is
  begin
    execute immediate ('alter index APEX_050100.WWV_FLOW_COLLECTION_MEMBERS_PK rebuild ONLINE');
  end;

  function get_settings(p_key in varchar2) return varchar2 is
    v_temp varchar2(32000);
  begin
    select s.value into v_temp from hm_settings s where s.key = p_key;
    return v_temp;
  exception
    when others then
      return(null);
  end;

  procedure generate_testdata is
    v_session number;
    v_sec     number;
    v_sample  blob;
  begin
    delete from apex_050100.wwv_flow_collections$ where id = 1000;
    delete from apex_050100.wwv_flow_collection_members$ m
     where m.collection_id = 1000;
    commit;
    select s.value_blob
      into v_sample
      from hm_settings s
     where s.key = 'BLOB_SAMPLE';
    select max(id) into v_session from apex_050100.wwv_flow_sessions$ s;
    select s.security_group_id
      into v_sec
      from apex_050100.wwv_flow_sessions$ s
     where s.id = v_session;
    insert into apex_050100.wwv_flow_collections$
      (id,
       session_id,
       security_group_id,
       flow_id,
       user_id,
       collection_name,
       collection_changed,
       created_on)
    values
      (1000, v_session, v_sec, 500, 'nobody', 'Teabug', 'Y', sysdate);
    for i in 1 .. 1000 loop

      insert into apex_050100.wwv_flow_collection_members$
        (collection_id, seq_id, security_group_id, blob001)
      values
        (1000, i, v_sec, v_sample);
      commit;
    end loop;
    delete from apex_050100.wwv_flow_collections$ where id = 1000;
    delete from apex_050100.wwv_flow_collection_members$ m
     where m.collection_id = 1000;
    commit;
  end;

  procedure init_scheduler is
    v_job number;
  begin

    dbms_scheduler.create_job(job_name        => 'HM_MAIN_Scheduler',
                              job_type        => 'PLSQL_BLOCK',
                              job_action      => 'begin hm_main.go; end;',
                              start_date      => trunc(sysdate),
                              repeat_interval => 'FREQ = MINUTELY; INTERVAL = 10',
                              auto_drop       => false, -- Default ist TRUE
                              enabled         => true); -- Default ist FALSE
    /* exception
    when others then
      null;*/
  end;

  procedure log(p_message in varchar2, p_data in clob) is
    pragma autonomous_transaction;
  begin
    insert into hm_log
      (tstamp, message, add_data)
    values
      (sysdate, p_message, p_data);
    commit;
  exception
    when others then
      null;
  end;
  function xdecode(p_error in number) return varchar2 is
  begin
    if p_error = 1 then
      return('ERROR');
    else
      return('OK');
    end if;
  end;

  procedure go is
    v_mail         apex_application_global.vc_arr2;
    v_temp         varchar2(32000);
    v_do           varchar2(1);
    v_ws1          number;
    v_ws2          number;
    v_error        number := 0;
    v_global_error number := 0;
    v_shrink_start date;
    v_shrink_end   date;
  begin
    v_shrink_start := to_date(to_char(sysdate, 'dd.mm.yyyy') || ' ' ||
                              get_settings('SHRINK_TIME_START'),
                              'dd.mm.yyyy hh24:mi');
    v_shrink_end   := to_date(to_char(sysdate, 'dd.mm.yyyy') || ' ' ||
                              get_settings('SHRINK_TIME_END'),
                              'dd.mm.yyyy hh24:mi');

    v_do := get_settings('PERFORM_CHANGES');
    log('Scheduler started, v_do=' || v_do, '');
    v_temp := '<table border="1" align="left"><tr><th>Tablespace Name</th><th>percent free</th></tr>';
    for r_c1rec in (select /* +RULE*/
                     df.tablespace_name,
                     totalusedspace "Used MB",
                     (df.totalspace - tu.totalusedspace),
                     df.totalspace,
                     round(100 * ((df.totalspace - tu.totalusedspace) /
                           df.totalspace)) pct_free
                      from (select tablespace_name,
                                   round(sum(abs(bytes)) / 1048576) totalspace
                              from dba_data_files
                             group by tablespace_name) df,
                           (select round(sum(bytes) / (1024 * 1024)) totalusedspace,
                                   tablespace_name
                              from sys.dba_segments
                             group by tablespace_name) tu
                     where df.tablespace_name = tu.tablespace_name
                       and tu.tablespace_name not like '%LOB%'
                     order by tablespace_name) loop
      v_temp := v_temp || '<tr><th>' || r_c1rec.tablespace_name ||
                '</th><th>' || r_c1rec.pct_free || '%</th></tr>';
      if r_c1rec.pct_free < 5 then
        v_error := 1;
      end if;
    end loop;
    v_temp := v_temp || '</table>';

    v_mail(v_mail.count) := 'Critical Problems: |OK|';

    v_mail(v_mail.count) := 'Tablespace Analysis|' || xdecode(v_error) || '|' ||
                            v_temp;

    log('TS analyze complete, error:' || v_error, '');
    v_global_error := v_global_error + v_error;
    v_error        := 0;
    v_temp         := '';
    select round(s.bytes / 1024 / 1024, 2) size_mb
      into v_ws1
      from dba_lobs l
      join dba_segments s
        on s.owner = l.owner
       and s.segment_name = l.segment_name
       and l.table_name = 'WWV_FLOW_COLLECTION_MEMBERS$'
       and column_name = 'BLOB001';

    if v_ws1 > 10000 and v_do = 'Y' and sysdate between v_shrink_start and
       v_shrink_end then
      if get_settings('FEATURE_SHRINK') = 'Y' then
        log('Shrink started (' || v_ws1 || ')', '');
        execute immediate ('ALTER TABLE  APEX_050100.WWV_FLOW_COLLECTION_MEMBERS$  move lob(BLOB001) store as (tablespace apex)');
        log('Shrink complete', '');
        execute immediate ('alter index APEX_050100.WWV_FLOW_COLLECTION_MEMBERS_PK rebuild ONLINE');
        log('Index rebuild  complete', '');
        v_error := 1;
        select round(s.bytes / 1024 / 1024, 2)
          into v_ws2
          from dba_lobs l
          join dba_segments s
            on s.owner = l.owner
           and s.segment_name = l.segment_name
           and l.table_name = 'WWV_FLOW_COLLECTION_MEMBERS$'
           and column_name = 'BLOB001';
        v_temp := '<br>shrinked table to: ' || to_char(v_ws2, '999999D00') ||
                  ' MB';
      else
        v_temp := '<br>No action taken (feature disabled)';
      end if;
    end if;
    log('End of Shrink, error:' || v_error, '');
    v_mail(v_mail.count) := 'Teabug Analyzer|' || xdecode(v_error) ||
                            '|Wasted space in DB before run: ' ||
                            to_char(v_ws1, '999999D00') || ' MB' || v_temp;

    v_global_error := v_global_error + v_error;
    v_error        := 0;

    select count(*)
      into v_ws1
      from dl_bordercontrol.movements
     where is_finished = 'N'
       and ins_at < sysdate - 10
     order by ins_at desc;

    v_temp := '';
    if v_ws1 > 0 and v_do = 'Y' then
      if get_settings('FEATURE_MOVEMENTS') = 'Y' then
        delete from dl_bordercontrol.movements
         where is_finished = 'N'
           and ins_at < sysdate - 10;
        v_temp  := '<br>' || sql%rowcount ||
                   ' records successfully deleted';
        v_error := 1;
      else
        v_temp := '<br>No action taken (feature disabled)';
      end if;
    end if;
    log('DL_MOVEMENTS check complete, error:' || v_error, '');
    v_mail(v_mail.count) := 'Movement cleanup function|'||xdecode(v_error)||'|' || v_ws1 ||
                            ' unfinished records older than 10 days' ||
                            v_temp;
    v_global_error := v_global_error + v_error;
    v_error := 0;

    if --(sysdate -
       --to_date(get_settings('LAST_MAIL'), 'dd.mm.yyyy hh24:mi:ss') > 1) or
       (v_global_error > 0) then
      log('Mail sent global_error:' || v_global_error, '');
      if v_global_error > 0 then
        v_mail(0) := 'Critical Problems: |ERROR|';
        hm_mail.process_mail(v_mail, 'ERROR', v_global_error);
      else
        hm_mail.process_mail(v_mail, 'OK', 0);
        update hm_settings h
           set h.value = to_char(sysdate, 'dd.mm.yyyy hh24:mi:ss')
         where h.key = 'LAST_MAIL';
      end if;
      commit;
    end if;

  end;

begin
  null;
end hm_main;
/
  GRANT EXECUTE ON "DL_MAINTENANCE"."HM_MAIN" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_MAINTENANCE"."HM_MAIN" TO "BIOSUPPORT";
