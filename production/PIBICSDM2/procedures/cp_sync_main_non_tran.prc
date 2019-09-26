CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CP_SYNC_MAIN_NON_TRAN" (
       vMode            in VARCHAR2  DEFAULT 'A',   -- Mode A - AutoSystem , M - Manual
       pTABLE_NAME      in VARCHAR2  DEFAULT 'ALL', -- All Table, Fix Table
       pPROCESS_BY      in VARCHAR2  DEFAULT 'AutoSystem' -- Procees By System Or User
) 
is
  pLOG_LEVEL      VARCHAR2(64)     := 'INFO'; 
  pLOG_CLASS      VARCHAR2(64)     := 'SynchronizeNonTransaction';  
  pLOG_METHOD     VARCHAR2(64)     := 'SynchronizeNonTransaction';
  pREMARK         VARCHAR2(4000)   := NULL; 
  pLOG_ERROR      VARCHAR2(4000)   := NULL; 
  pSTART_DATE     TIMESTAMP        := SYSTIMESTAMP; 
  pCOMMAND        VARCHAR2(4000)   := NULL;
  
  pDBLINK         VARCHAR2(255)    := NULL;
  pDB_OWNER       VARCHAR2(64)     := NULL;
begin
  
  IF vMode = 'M'
    THEN
     pLOG_CLASS                 := pLOG_CLASS || 'Manual';
  END IF;
  
  -------- Get Config  
  SELECT CONFIG_VALUE INTO pDBLINK    FROM SYS_SYNC_CONFIG WHERE STATUS='Y' AND CONFIG_NAME = 'DB_LINK_SOURCE_SYNC';
  SELECT CONFIG_VALUE INTO pDB_OWNER  FROM SYS_SYNC_CONFIG WHERE STATUS='Y' AND CONFIG_NAME = 'DB_OWNER'; 
  
  
  -------- Case: Auto Synchronize & Manual All Table
  IF (vMode = 'A' OR vMode = 'M') AND  pTABLE_NAME = 'ALL'
     THEN
       
        FOR REC IN (  SELECT TABLE_NAME
                      FROM SYS_SYNC_NON_TRAN
                      WHERE STATUS='Y'
                      ORDER BY SEQ_NO DESC
        )  
        LOOP
             
           CP_SYNC_PROCESS_NON_TRAN(pLOG_CLASS, pDBLINK, pDB_OWNER, REC.TABLE_NAME, pPROCESS_BY);
             
        END LOOP;
        
        
  -------- Case: Manual Fix Table
  ELSIF vMode = 'M'  
     THEN  
        
        DECLARE        
          pCHK_TB    VARCHAR2(500)    := NULL;  
        BEGIN
          BEGIN
            
            SELECT TABLE_NAME INTO pCHK_TB
            FROM SYS_SYNC_NON_TRAN
            WHERE STATUS='Y' AND TABLE_NAME = pTABLE_NAME;
             
            CP_SYNC_PROCESS_NON_TRAN(pLOG_CLASS, pDBLINK, pDB_OWNER, pCHK_TB, pPROCESS_BY);
                         
         EXCEPTION                        
             WHEN OTHERS THEN
             DBMS_OUTPUT.PUT_LINE(SQLERRM);
             pLOG_LEVEL      := 'ERROR';
             pLOG_ERROR      := SQLERRM;
             pREMARK    := 'Unable to process SynchronizeManual!! --> TableName: ' || pTABLE_NAME;
         END;          
        END;
        
  ELSE
     pLOG_LEVEL := 'ERROR'; 
     pREMARK    := 'Unable to process SynchronizeManual!! --> Mode: ' || vMode;   
  END IF;
         
  -------- Keep Log        
  pLOG_METHOD   := 'AllSynchronizeNonTransaction';
  CP_SYNC_INSERT_LOG(pTABLE_NAME, pLOG_LEVEL, pLOG_CLASS, pLOG_METHOD, pREMARK, pLOG_ERROR, pSTART_DATE, pCOMMAND, pPROCESS_BY); 
        
end CP_SYNC_MAIN_NON_TRAN;
/
