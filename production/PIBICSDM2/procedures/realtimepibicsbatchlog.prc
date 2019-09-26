CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."REALTIMEPIBICSBATCHLOG" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       REALTIMEPIBICSBATCHLOG
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        5/20/2013   ARSOM       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     REALTIMEPIBICSBATCHLOG
      Sysdate:         5/20/2013
      Date and Time:   5/20/2013, 4:59:50 PM, and 5/20/2013 4:59:50 PM
      Username:        ARSOM (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
begin
declare
PRROW number;
ERROW number;
STARTPROCESS number;
ENDPROCESS number;
begin
    PRROW:=NULL;
    ERROW:=NULL;
    STARTPROCESS:=NULL;
    ENDPROCESS:=NULL;
    
    BEGIN
        SELECT COUNT('X') INTO PRROW from ws_tmlog where TYPEDATA = 'PIBICS' and  issuccess = 'Y' and to_char(logdate, 'yyyymmdd') = to_char(sysdate -1, 'yyyymmdd');
    EXCEPTION WHEN NO_DATA_FOUND THEN
        PRROW:= NULL;
    END;
    
    BEGIN
         SELECT COUNT('X') INTO ERROW  from ws_tmpibics where sequenceno in (
            select sequenceno from ws_tmlog where typedata = 'PIBICS' and issuccess = 'N' and to_char(logdate, 'yyyymmdd') = to_char(sysdate -1, 'yyyymmdd'))
            and falsetype = '1';
    EXCEPTION WHEN NO_DATA_FOUND THEN
        ERROW:= NULL;
    END;
    
     BEGIN
        select max(SENDDATETIME) INTO STARTPROCESS  from ws_tmlog where TYPEDATA = 'PIBICS' and  issuccess = 'Y' and to_char(logdate, 'yyyymmdd') = to_char(sysdate -1, 'yyyymmdd');
    EXCEPTION WHEN NO_DATA_FOUND THEN
        STARTPROCESS:= NULL;
    END;
    
     BEGIN
        select min(SENDDATETIME) INTO ENDPROCESS  from ws_tmlog where TYPEDATA = 'PIBICS' and  issuccess = 'Y' and to_char(logdate, 'yyyymmdd') = to_char(sysdate -1, 'yyyymmdd');
    EXCEPTION WHEN NO_DATA_FOUND THEN
        ENDPROCESS:= NULL;
    END;
     /*   
    DBMS_OUTPUT.PUT_LINE('PRROW '||PRROW);
    DBMS_OUTPUT.PUt_LINE('ERROW '||ERROW);
    DBMS_OUTPUT.PUt_LINE('STARTPROCESS '||STARTPROCESS);
    DBMS_OUTPUT.PUt_LINE('ENDPROCESS '||ENDPROCESS);
    */
    
           INSERT INTO BATCHLOG (BATCHLOGNO, BATCH_SRC, FILE_TYPE, FILE_NAME, FILE_SIZE, TOTALROW, PRROW, 
           ERRROW, STARTPROCESS, ENDPROCESS, STATUS, CREUSR, 
            CREDTE, TFSTATUS, TOTALINS, TOTALUPD, TOTALDEL, NOTE, DATAFILEERROR, TRANSFERDTE) 
            VALUES ( BATCHLOG_SEQ.nextval,'TVL','3','TVL'||to_char(sysdate -1, 'YYMMDD'),null,PRROW+ERROW,PRROW,
             ERROW ,to_date(STARTPROCESS,'YYYYMMDDHH24MISS'),to_date(ENDPROCESS,'YYYYMMDDHH24MISS'),  '1' ,'TVLAUTO',
         SYSDATE, 'Y', '0', '0', '0',null ,null ,null);
           
           commit;
    
end;

END REALTIMEPIBICSBATCHLOG;
/
