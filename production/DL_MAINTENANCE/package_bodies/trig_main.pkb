CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_MAINTENANCE"."TRIG_MAIN" is

  procedure log(p_message in varchar2, p_data in clob) is
    pragma autonomous_transaction;
  begin
    insert into trig_log
      (tstamp, message, add_data)
    values
      (sysdate, p_message, p_data);
    commit;
  exception
    when others then
      null;
  end;

  function del_audit(p_schema in varchar2, p_table in varchar2) return number is
    v_trig_del varchar2(32000) := G_TRG_DEL;
  begin
    v_trig_del := replace(v_trig_del, '%%TABLE_NAME%%', upper(p_table));
    v_trig_del := replace(v_trig_del, '%%SCHEMA_NAME%%', upper(p_schema));
    log('Removing Trigger for ' || p_table, v_trig_del);
    execute immediate (v_trig_del);
    return 0;
  exception
    when others then
      return - 1;
  end;

  function add_audit(p_schema in varchar2, p_table in varchar2) return number is
    v_trig_create  varchar2(32000) := G_TRG_CREATE;
    v_body         varchar2(32000);
    v_colvars_name varchar2(32000);
    v_colvars_old  varchar2(32000);
    v_colvars_new  varchar2(32000);
  begin
    v_trig_create := replace(v_trig_create,
                             '%%TABLE_NAME%%',
                             upper(p_table));
    v_trig_create := replace(v_trig_create,
                             '%%SCHEMA_NAME%%',
                             upper(p_schema));
    v_trig_create := replace(v_trig_create,
                             '%%SYSDATE%%',
                             to_char(sysdate, 'dd.mm.yyyy hh24:mi:ss'));

    v_colvars_name := 'v_colname:= dl_maintenance.trig_main.t_array ( ';
    v_colvars_old  := 'v_coldata_old:= dl_maintenance.trig_main.t_array ( ';
    v_colvars_new  := 'v_coldata_new:= dl_maintenance.trig_main.t_array ( ';

    v_body := v_body || 'dl_maintenance.trig_main.trigger(''' ||
              upper(p_schema) || ''',''' || upper(p_table) ||
              ''',v_rowid,v_mode,dl_common.pkg_session.get_audit_user(),v_colname,v_coldata_old,v_coldata_new);' ||
              chr(10);

    for r_c1rec in (select o.name      tname,
                           u.username,
                           cc.COMMENTS,
                           c.name      cname,
                           c.type#
                      from sys.col$             c,
                           sys.obj$             o,
                           sys.all_col_comments cc,
                           dba_users            u
                     where c.obj# = o.obj#
                       and upper(o.name) = upper(p_table)
                       and upper(u.USERNAME) = upper(p_schema)
                       and u.USERNAME = cc.owner
                       and o.owner# = u.USER_ID
                       and cc.TABLE_NAME(+) = o.name
                       and cc.COLUMN_NAME = c.name
                       and (cc.COMMENTS not like 'XA%' or
                           cc.comments is null)
                       and c.type# in (1, 2, 12)
                     order by c.col#) loop
      v_colvars_name := v_colvars_name || '''' || r_c1rec.cname || ''',';
      if r_c1rec.type# <> 12 then
        v_colvars_old := v_colvars_old || ':old.' || r_c1rec.cname || ',';
        v_colvars_new := v_colvars_new || ':new.' || r_c1rec.cname || ',';
      else
        v_colvars_old := v_colvars_old || 'to_char(:old.' || r_c1rec.cname ||
                         ',''dd.mm.yyyy hh24:mi:ss''),';
        v_colvars_new := v_colvars_new || 'to_char(:new.' || r_c1rec.cname ||
                         ',''dd.mm.yyyy hh24:mi:ss''),';
      end if;
    end loop;
    v_colvars_name := substr(v_colvars_name, 1, length(v_colvars_name) - 1) || ');';
    v_colvars_old  := substr(v_colvars_old, 1, length(v_colvars_old) - 1) || ');';
    v_colvars_new  := substr(v_colvars_new, 1, length(v_colvars_new) - 1) || ');';

    v_trig_create := replace(v_trig_create,
                             '%%COLVARS%%',
                             v_colvars_name || chr(10) || v_colvars_new ||
                             chr(10) || v_colvars_old || chr(10));
    v_trig_create := replace(v_trig_create, '%%BODY%%', v_body);
    log('Creating Trigger for ' || p_table, v_trig_create);
    execute immediate (v_trig_create);
    return 0;
    /* exception
    when others then
      return - 1;*/
  end;


  function search_value(p_search in varchar2,p_name in out t_array,p_value in out t_array) return varchar2 is
    i number;
  begin
    for i in 1..p_name.count loop
      if p_name(i)=p_search then
        return(p_value(i));
      end if;
    end loop;
    return(null);
  end;


  function build_id_array(p_table in varchar2, p_rowid in varchar2,  p_col_name  in out t_array,
                      p_col_old   in out t_array,
                      p_col_new   in out t_array
                      )
    return t_link is
    v_arr t_link;
    v_temp varchar2(1000);
  begin
     if p_table = 'IDENTITIES' then
      v_arr(1):=search_value('KEY_VALUE',p_col_name,p_col_new);
    end if;

    if p_table = 'BLACKLIST_CASES' then
      v_temp:=search_value('ID',p_col_name,p_col_new);
      select ci.identity
        bulk collect
        into v_arr from
          dl_blacklist.blacklist_case_identities ci
       where ci.blacklist_case = v_temp;
     end if;

    if p_table = 'BLACKLIST_CASE_IDENTITIES' then
      v_arr(1):=search_value('IDENTITY',p_col_name,p_col_new);
    end if;

    if p_table = 'TRAVEL_DOCS' then
      v_arr(1):=search_value('IDENTITY',p_col_name,p_col_new);
    end if;

    return v_arr;
  end;

  function debug_par_dump ( p_col_name  in out t_array,
                      p_col_old   in out t_array,
                      p_col_new   in out t_array) return clob is

    v_debug_col_name clob :='p_col_name := dl_maintenance.trig_main.t_array (';
    v_debug_col_old clob :='p_col_old := dl_maintenance.trig_main.t_array (';
    v_debug_col_new clob :='p_col_new := dl_maintenance.trig_main.t_array (';
    v_out clob;
    i number;
  begin

     for i in 1..p_col_name.count loop
       v_debug_col_name:=v_debug_col_name||''''||p_col_name(i)||''',';
       v_debug_col_old:=v_debug_col_old||''''||p_col_old(i)||''',';
       v_debug_col_new:=v_debug_col_new||''''||p_col_new(i)||''',';
     end loop;
     v_out:=substr(v_debug_col_name,1,length(v_debug_col_name)-1)||');'||chr(10) ||
     substr(v_debug_col_old,1,length(v_debug_col_old)-1)||');'||chr(10) ||
     substr(v_debug_col_new,1,length(v_debug_col_new)-1)||');'||chr(10);
     return(v_out);
   end;

  procedure trigger(p_schema    in varchar2,
                      p_table     in varchar2,
                      p_rowid     in varchar2,
                      p_operation in varchar2,
                      p_user      in varchar2,
                      p_col_name  in out t_array,
                      p_col_old   in out t_array,
                      p_col_new   in out t_array) is
    v_link1      t_link;
    v_link2      t_link;
    v_link3      t_link;
    v_link4      t_link;
    v_identities t_link;
    i            number;
    j            number;
    v_debug clob;
  begin
    v_link1(1)  := null;
    v_link2(1)  := null;
    v_link3(1)  := null;
    v_link4(1)  := null;

    v_debug:=debug_par_dump(p_col_name,p_col_old,p_col_new);
    log('CALL: '||p_table||'/'||p_rowid||'/'||p_operation,v_debug);
    if p_table = 'IDENTITIES' or p_table = 'BLACKLIST_CASES' or
       p_table = 'BLACKLIST_CASE_IDENTITIES' or p_table = 'TRAVEL_DOCS' then
      if P_OPERATION='D' then   
        v_identities := build_id_array(p_table, p_rowid,p_col_name,p_col_old,p_col_OLD);
      else
        v_identities := build_id_array(p_table, p_rowid,p_col_name,p_col_old,p_col_new);
      end if;
      i := 1;
      for r_c1rec in (select ci.identity, c.id, ci.id ci_id, td.key_value
                        from dl_blacklist.blacklist_case_identities ci,
                             dl_blacklist.blacklist_cases c,
                             dl_blacklist.travel_docs td,
                             table(v_identities) ti
                       where ci.blacklist_case = c.id
                         and td.identity(+) = ci.identity
                         and ci.identity = ti.column_value) loop
        v_link1(i) := r_c1rec.identity;
        v_link2(i) := r_c1rec.id;
        v_link3(i) := r_c1rec.ci_id;
        v_link4(i) := r_c1rec.key_value;
        i := i + 1;
      end loop;
    end if;


    for i in 1 .. v_link1.count loop
      insert into global_audit
        (audit_schema,
         audit_table,
         audit_rowid,
         operation,
         audit_level,
         link_col_1,
         link_col_2,
         link_col_3,
         link_col_4,
         action_user)
      values
        (p_schema,
         p_table,
         p_rowid,
         p_operation,
         1,
         v_link1(i),
         v_link2(i),
         v_link3(i),
         v_link4(i),
         p_user);
    end loop;

    for j in 1 .. p_col_name.count loop
      if (nvl(p_col_old(j),'#') <> nvl(p_col_new(j),'#')) or (p_operation = 'I') then
        for i in 1 .. v_link1.count loop
          insert into global_audit
            (audit_schema,
             audit_table,
             audit_column,
             audit_rowid,
             operation,
             value_old,
             value_new,
             audit_level,
             link_col_1,
             link_col_2,
             link_col_3,
             link_col_4,
             action_user)
          values
            (p_schema,
             p_table,
             p_col_name(j),
             p_rowid,
             p_operation,
             p_col_old(j),
             p_col_new(j),
             2,
             v_link1(i),
             v_link2(i),
             v_link3(i),
             v_link4(i),
             p_user);

        end loop;
      end if;
    end loop;

  end;

begin
  null;
end trig_main;
/
  GRANT EXECUTE ON "DL_MAINTENANCE"."TRIG_MAIN" TO PUBLIC;
