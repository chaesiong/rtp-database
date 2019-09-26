CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."PROC_DELETE_DATA" AS 
 cur_data SYS_REFCURSOR;
 v_table_name varchar2(500);
 v_sql  varchar2(500);
BEGIN
  open cur_data for Select table_name 
                    from all_tables
                    where owner='SERVAPP' and
                          table_name not in('AMAPPMODULE','AMAPPSTATUS','AMSECPERMISS'
                          ,'AMSECPERMISSGROUP','AMSECPERMISSMASTER'
                          ,'AMSECPERMISSMODULE','ERRORCODEMASTER'
                          ,'MBDEPARTMENT','MBMEMBERMASTER','MBMEMBERTYPE','MBPOSITION','MSCS_SYS_CONFIG'
                          ,'MSCS_ERRORCODEMASTER');
  LOOP
      FETCH cur_data
      INTO v_table_name;
      EXIT WHEN cur_data%NOTFOUND;
      
      v_sql := 'delete from '|| v_table_name;
       EXECUTE IMMEDIATE v_sql;
      end loop ;
    CLOSE cur_data;
  exception when others then
   rollback;
        raise_application_error(-20001,'An error was encountered - PROC_DELETE_DATA'||SQLCODE||'-ERROR-'||SQLERRM); 
END PROC_DELETE_DATA;
/
