CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CP_SYNC_INSERT_LOG" (
       pTABLE_NAME       in VARCHAR2,
       pLOG_LEVEL        in VARCHAR2,
       pLOG_CLASS        in VARCHAR2,
       pLOG_METHOD       in VARCHAR2,
       pREMARK           in VARCHAR2, 
       pLOG_ERROR        in VARCHAR2,
       pSTART_DATE       in TIMESTAMP,
       pCOMMAND          in VARCHAR2,
       pPROCESS_BY       in VARCHAR2) 
is
       pEND_DATE        TIMESTAMP       := SYSTIMESTAMP;
       pPROCESSING_TIME  NUMBER(18,5)   := 0; 
       pISTART_DATE      NUMBER         := 0;
       pIEND_DATE        NUMBER         := 0;
begin
       /* 
       DBMS_OUTPUT.PUT_LINE('Day: ' || (extract( day from systimestamp - pSTART_DATE )*24*60*60*1000));
       DBMS_OUTPUT.PUT_LINE('hour: ' || ( extract( hour from systimestamp - pSTART_DATE )*60*60*1000));
       DBMS_OUTPUT.PUT_LINE('minute: ' || ( extract( minute from systimestamp - pSTART_DATE )*60*1000));
       DBMS_OUTPUT.PUT_LINE('second: ' || ( round(extract( second from systimestamp - pSTART_DATE )*1000)));
        */     
  pISTART_DATE              := TO_NUMBER(TO_CHAR(CAST(pSTART_DATE AS DATE), 'YYYYMMDD'));
  pIEND_DATE                := TO_NUMBER(TO_CHAR(CAST(pEND_DATE AS DATE), 'YYYYMMDD'));
  pPROCESSING_TIME          := (extract(day from systimestamp - pSTART_DATE )*24*60*60*1000) 
                               + (extract( hour from systimestamp - pSTART_DATE )*60*60*1000) 
                               + (extract(minute from systimestamp - pSTART_DATE )*60*1000) 
                               + (extract(second from systimestamp - pSTART_DATE) * 1000);       
  INSERT INTO SYS_SYNC_LOG (ID, LOG_LEVEL, LOG_CLASS, LOG_METHOD, REMARK, ERROR_MSG, START_DATETIME, END_DATETIME, PROCESSING_TIME, TABLE_NAME, QUERY_COMMAND, ISTART_DATE, IEND_DATE, PROCESS_BY) 
  VALUES(SYS_SYNC_LOG_id_sequence.NEXTVAL , pLOG_LEVEL, pLOG_CLASS, pLOG_METHOD, pREMARK, pLOG_ERROR, pSTART_DATE, pEND_DATE, pPROCESSING_TIME, pTABLE_NAME, pCOMMAND, pISTART_DATE, pIEND_DATE, pPROCESS_BY);
  
  COMMIT;
  
end CP_SYNC_INSERT_LOG;
/
