CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CP_SYNC_CHECK_TABLE_AMOUNT_DAILY" (
       pCONDITION_START_DATE      in DATE DEFAULT TRUNC (SYSDATE-5) ,
       pCONDITION_END_DATE        in DATE DEFAULT TRUNC (SYSDATE-1) ,
       pPROCESS_BY      in VARCHAR2  DEFAULT 'AutoSystem'-- Procees By System Or User
)
is
  pLOG_LEVEL                VARCHAR2(64)     := 'INFO'; 
  pLOG_CLASS                VARCHAR2(64)     := 'CheckTableAmountDaily';  
  pLOG_METHOD               VARCHAR2(64)     := 'CheckTableAmountDaily';
  pREMARK                   VARCHAR2(4000)   := NULL; 
  pLOG_ERROR                VARCHAR2(4000)   := NULL; 
  pSTART_DATE               TIMESTAMP        := SYSTIMESTAMP;
  
  pConditionColumn  VARCHAR2(1)    := '0';
begin
  
  DELETE FROM TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY;
  
  FOR REC IN (      SELECT      A.TABLE_NAME, B.CONDITION_NAME
                    FROM SYS_SYNC_TRAN A
                    INNER JOIN SYS_SYNC_TRAN_CONDITION B ON B.TABLE_NAME = A.TABLE_NAME
                    WHERE A.STATUS = 'Y'
                          AND B.STATUS = 'Y'
                    ORDER BY A.SEQ_NO DESC, B.SEQ_NO DESC
      )  
      LOOP
        
        IF REC.CONDITION_NAME = 'CREATE_DATE'
          THEN
           pConditionColumn := '1';
        ELSE
           pConditionColumn := '2';
        END IF;
        
        CP_SYNC_CHECK_TABLE_AMOUNT(REC.TABLE_NAME, pConditionColumn, pPROCESS_BY, pCONDITION_START_DATE, pCONDITION_END_DATE);
        
        INSERT INTO TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY(TABLE_NAME, CONDITION_NAME, DATE_CHECK, AMOUNT_SOURCE, AMOUNT_DESTINATION, DIFF_AMOUNT)
        SELECT TABLE_NAME, CONDITION_NAME, DATE_CHECK, AMOUNT_SOURCE, AMOUNT_DESTINATION, DIFF_AMOUNT
        FROM TMP_SYNC_CHECK_TABLE_AMOUNT;
        
      END LOOP;
        
  -------- Keep Log        
  pLOG_METHOD     := 'AllCheckTableAmount';
  CP_SYNC_INSERT_LOG(NULL, pLOG_LEVEL, pLOG_CLASS, pLOG_METHOD, pREMARK, pLOG_ERROR, pSTART_DATE, NULL, pPROCESS_BY); 
      
end CP_SYNC_CHECK_TABLE_AMOUNT_DAILY;
/
