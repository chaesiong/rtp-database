CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_INTERFACE"."P_PARTITION_LOG_BL_HITS" 
IS
  v_ddl_string varchar2(4000);
BEGIN
-- created by Ritti
-- create date: 28/01/2020
       -- Step 1: backup data to DL_INTERFACE.LOG_BLACKLIST_HITS_HIST
       BEGIN
       
        v_ddl_string := 'insert into DL_INTERFACE.LOG_BLACKLIST_HITS_HIST
                         select /*+  index(LOG_BLACKLIST_HITS LOG_BLACKLIST_HITS_IDX1)*/
                         KEY_VALUE,DML_AT,DML_BY,DML_TYPE,INS_AT,INS_BY,SENDER_SYSTEM,SENDER_USER,SENDER_OBJECT_ID,RESPONSE,ELAPSED_TIME_SECONDS,NUMBER_OF_HITS    
                         from  DL_INTERFACE.LOG_BLACKLIST_HITS where ins_at between to_date('''
                         ||TO_CHAR(trunc(sysdate-1),'DDMMYYYY')||''',''DDMMYYYY'')'||' and to_date('''||TO_CHAR(trunc(sysdate),'DDMMYYYY')||''',''DDMMYYYY'')';
       
       EXECUTE IMMEDIATE v_ddl_string;
       commit;
       
       EXCEPTION 
                WHEN OTHERS  THEN  
                    RAISE;
       END;
       -- Step 2: drop table that data older than 2 day
       BEGIN
       v_ddl_string := 'ALTER TABLE DL_INTERFACE.LOG_BLACKLIST_HITS DROP PARTITION P'||TO_CHAR(trunc(sysdate-2),'YYYYMMDD') ;
       EXECUTE IMMEDIATE v_ddl_string;
       
       EXCEPTION          
            WHEN OTHERS  THEN 
                RAISE;
       END;

END P_PARTITION_LOG_BL_HITS;
/
