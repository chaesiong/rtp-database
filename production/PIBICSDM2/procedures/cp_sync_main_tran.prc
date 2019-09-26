CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CP_SYNC_MAIN_TRAN" (
       vMode            in VARCHAR2  DEFAULT 'A',           -- Mode A - AutoSystem , M - Manual
       vConDateStart    in TIMESTAMP DEFAULT SYSTIMESTAMP,
       vConDateEnd      in TIMESTAMP DEFAULT SYSTIMESTAMP,
       pTABLE_NAME      in VARCHAR2  DEFAULT 'ALL',
       pPROCESS_BY      in VARCHAR2  DEFAULT 'AutoSystem'-- Procees By System Or User
       ) 
is
  pLOG_LEVEL      VARCHAR2(64)     := 'INFO'; 
  pLOG_CLASS      VARCHAR2(64)     := 'SynchronizeTransaction';  
  pLOG_METHOD     VARCHAR2(64)     := 'SynchronizeTransaction';
  pREMARK         VARCHAR2(4000)   := NULL; 
  pLOG_ERROR      VARCHAR2(4000)   := NULL; 
  pSTART_DATE     TIMESTAMP        := SYSTIMESTAMP; 
  pCOMMAND        VARCHAR2(4000)   := NULL;
  
  pDBLINK         VARCHAR2(255)    := NULL;
  pDB_OWNER       VARCHAR2(64)     := NULL;
  
  pCONDITION_START_TIMESTAMP TIMESTAMP       := SYSTIMESTAMP;   
  pCONDITION_END_TIMESTAMP   TIMESTAMP       := SYSTIMESTAMP;  
  
  pLAST_STATUS    VARCHAR2(1)      := '1';
begin
  
  IF vMode = 'M'
    THEN
     pLOG_CLASS                 := pLOG_CLASS || 'Manual';
     pCONDITION_START_TIMESTAMP := vConDateStart;
     pCONDITION_END_TIMESTAMP   := vConDateEnd;
     pLAST_STATUS               := '2';
  END IF;
  
  -------- Get Config  
  SELECT CONFIG_VALUE INTO pDBLINK    FROM SYS_SYNC_CONFIG WHERE STATUS='Y' AND CONFIG_NAME = 'DB_LINK_SOURCE_SYNC';
  SELECT CONFIG_VALUE INTO pDB_OWNER  FROM SYS_SYNC_CONFIG WHERE STATUS='Y' AND CONFIG_NAME = 'DB_OWNER'; 
     
  
  -------- Case: Auto Synchronize & Manual All Table
  IF (vMode = 'A' OR vMode = 'M') AND  pTABLE_NAME = 'ALL'
     THEN
       
        FOR REC IN (  SELECT  --ROW_NUMBER() OVER(PARTITION BY A.TABLE_NAME ORDER BY A.SEQ_NO DESC, B.SEQ_NO ASC) AS ROWS_NO,
                              A.TABLE_NAME, B.LAST_SYNC_END, 
                              B.CONDITION_NAME, B.CONDITION_TYPE, B.CONDITION_FORMAT
                      FROM SYS_SYNC_TRAN A
                      INNER JOIN SYS_SYNC_TRAN_CONDITION B ON B.TABLE_NAME = A.TABLE_NAME
                      WHERE A.STATUS = 'Y'
                            AND B.STATUS = 'Y'
                      ORDER BY A.SEQ_NO DESC, B.SEQ_NO DESC
        )  
        LOOP
             
           IF vMode = 'A'
              THEN
               pCONDITION_START_TIMESTAMP := CAST(REC.LAST_SYNC_END AS DATE);
           END IF;
            
           CP_SYNC_PROCESS_TRAN(pLOG_CLASS, pDBLINK, pDB_OWNER, REC.TABLE_NAME, 
                                REC.CONDITION_NAME, REC.CONDITION_TYPE, REC.CONDITION_FORMAT,     
                                pCONDITION_START_TIMESTAMP, pCONDITION_END_TIMESTAMP, pLAST_STATUS, pPROCESS_BY);
                       
        END LOOP;
        
        
  -------- Case: Manual Fix Table
  ELSIF vMode = 'M'  
     THEN  
        
        FOR REC IN (  SELECT  --ROW_NUMBER() OVER(PARTITION BY A.TABLE_NAME ORDER BY A.SEQ_NO DESC, B.SEQ_NO ASC) AS ROWS_NO,
                              A.TABLE_NAME, B.LAST_SYNC_END,
                              B.CONDITION_NAME, B.CONDITION_TYPE, B.CONDITION_FORMAT
                      FROM SYS_SYNC_TRAN A
                      INNER JOIN SYS_SYNC_TRAN_CONDITION B ON B.TABLE_NAME = A.TABLE_NAME
                      WHERE A.STATUS = 'Y'
                            AND B.STATUS = 'Y'
                            AND A.TABLE_NAME = pTABLE_NAME
                      ORDER BY A.SEQ_NO DESC, B.SEQ_NO DESC
        )  
        LOOP
             
           CP_SYNC_PROCESS_TRAN(pLOG_CLASS, pDBLINK, pDB_OWNER, REC.TABLE_NAME, 
                                REC.CONDITION_NAME, REC.CONDITION_TYPE, REC.CONDITION_FORMAT,     
                                pCONDITION_START_TIMESTAMP, pCONDITION_END_TIMESTAMP, pLAST_STATUS, pPROCESS_BY);
             
        END LOOP;
        
  ELSE
     pLOG_LEVEL := 'ERROR'; 
     pREMARK    := 'Unable to process SynchronizeManual!! --> Mode: ' || vMode;   
  END IF;
               
  -------- Keep Log        
  pLOG_METHOD   := 'AllSynchronizeTransaction';
  CP_SYNC_INSERT_LOG(pTABLE_NAME, pLOG_LEVEL, pLOG_CLASS, pLOG_METHOD, pREMARK, pLOG_ERROR, pSTART_DATE, pCOMMAND, pPROCESS_BY); 
     
end CP_SYNC_MAIN_TRAN;
/
