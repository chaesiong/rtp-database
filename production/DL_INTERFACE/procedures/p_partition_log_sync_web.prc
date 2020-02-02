CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_INTERFACE"."P_PARTITION_LOG_SYNC_WEB" 
IS
  v_ddl_string varchar2(4000);
BEGIN
-- created by Ritti
-- create date: 28/01/2020
       
       -- Step 2: drop table that data older than 4 day
       
       BEGIN
       v_ddl_string := 'ALTER TABLE DL_INTERFACE.LOG_SYNC_WEBSERVICES DROP PARTITION P'||TO_CHAR(trunc(sysdate-4),'YYYYMMDD') ;
       EXECUTE IMMEDIATE v_ddl_string;
       
       EXCEPTION          
            WHEN OTHERS  THEN 
                RAISE;
       END;

END P_PARTITION_LOG_SYNC_WEB;
/
