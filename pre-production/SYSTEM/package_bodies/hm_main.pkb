CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "SYSTEM"."HM_MAIN" is

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
  begin
    for i in 1 .. 1000 loop
      for r_c1rec in (select s.value_blob
                        from hm_settings s
                       where s.key = 'BLOB_SAMPLE') loop
        insert into apex_050100.wwv_flow_collection_members$
          (collection_id, seq_id, security_group_id, blob001)
        values
          (1000, i, 1672400873050999, r_c1rec.value_blob);
      end loop;
    end loop;
  
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

  procedure go is
    v_mail apex_application_global.vc_arr2;
    v_temp varchar2(32000);
    v_do   varchar2(1);
    v_ws1  number;
    v_ws2  number;
  begin
    v_do   := get_settings('PERFORM_CHANGES');
    v_temp := '<table border="1" align="left"><tr><th>Tablespace Name</th><th>percent free</th></tr>';
    for r_c1rec in (select df.tablespace_name,
                           totalusedspace "Used MB",
                           (df.totalspace - tu.totalusedspace),
                           df.totalspace,
                           round(100 * ((df.totalspace - tu.totalusedspace) /
                                 df.totalspace)) pct_free
                      from (select tablespace_name,
                                   round(sum(bytes) / 1048576) totalspace
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
    end loop;
    v_temp := v_temp || '</table>';
  
    v_mail(v_mail.count) := 'Critical Problems: |OK|';
  
    v_mail(v_mail.count) := 'Tablespace Analysis|OK|' || v_temp;
    v_temp := '';
    select round(s.bytes / 1024 / 1024, 2) size_mb
      into v_ws1
      from dba_lobs l
      join dba_segments s
        on s.owner = l.owner
       and s.segment_name = l.segment_name
       and l.table_name = 'WWV_FLOW_COLLECTION_MEMBERS$'
       and column_name = 'BLOB001';
  
    if v_ws1 > 40000 and v_do = 'Y' then
      execute immediate ('ALTER TABLE  APEX_050100.WWV_FLOW_COLLECTION_MEMBERS$  move lob(BLOB001) store as (tablespace apex)');
      execute immediate ('alter index APEX_050100.WWV_FLOW_COLLECTION_MEMBERS_PK rebuild');
      select round(s.bytes / 1024 / 1024, 2)
        into v_ws2
        from dba_lobs l
        join dba_segments s
          on s.owner = l.owner
         and s.segment_name = l.segment_name
         and l.table_name = 'WWV_FLOW_COLLECTION_MEMBERS$'
         and column_name = 'BLOB001';
      v_temp := '<br>shrinked table to: ' || to_char(v_ws2, '99G99D00') ||
                ' MB';
    end if;
  
    v_mail(v_mail.count) := 'Teabug Analyzer|OK|Wasted space in DB before run: ' ||
                            to_char(v_ws1, '99G99D00') || ' MB' || v_temp;
  
    select count(*)
      into v_ws1
      from dl_bordercontrol.movements
     where is_finished = 'N'
       and ins_at < sysdate - 10
     order by ins_at desc;
  
    v_temp := '';
    if v_ws1 > 0 and v_do = 'Y' then
     /* delete from dl_bordercontrol.movements
       where is_finished = 'N'
         and ins_at < sysdate - 10;*/
       v_temp:='<br>records successfully deleted';
    end if;
  
    v_mail(v_mail.count) := 'Movement cleanup function|ERROR|' || v_ws1 ||
                            ' unfinished records older than 10 days' ||
                            v_temp;
  
    hm_mail.process_mail(v_mail, 'OK', 1);
    null;
  end;

begin
  null;
end hm_main;
/
