CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_FW_USER" 
IS
   var_rows   NUMBER;
BEGIN
   /*   Create date : 25-12-2018    */


  EXECUTE IMMEDIATE 'DROP TABLE FW_USER_PIBICS_BAK PURGE';
  EXECUTE IMMEDIATE 'CREATE TABLE FW_USER_PIBICS_BAK AS SELECT  * FROM FW_USER';
  
  EXECUTE IMMEDIATE 'DELETE FROM FW_USER_PIBICS';  
  EXECUTE IMMEDIATE 'INSERT INTO FW_USER_PIBICS SELECT * FROM FW_USER@PIBICS_PROD';
 
  var_rows := SQL%ROWCOUNT;  
  COMMIT;


   INSERT INTO IMPORT_LOG
        VALUES ('FW_USER_PIBICS', var_rows, SYSDATE);

   COMMIT;
   
    
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      NULL;
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END P_FW_USER;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_FW_USER" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_FW_USER" TO "BIOSAADM";
