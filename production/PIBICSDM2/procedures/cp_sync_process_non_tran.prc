CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CP_SYNC_PROCESS_NON_TRAN" (
       pLOG_CLASS       in VARCHAR2,      
       pDBLINK          in VARCHAR2,
       pDB_OWNER        in VARCHAR2,
       pTABLE_NAME      in VARCHAR2,
       pPROCESS_BY      in VARCHAR2) 
is
  pLOG_LEVEL      VARCHAR2(64)     := 'INFO';  
  pLOG_METHOD     VARCHAR2(64)     := 'SynchronizeNonTransaction';
  pREMARK         VARCHAR2(4000)   := NULL; 
  pLOG_ERROR      VARCHAR2(4000)   := NULL; 
  pSTART_DATE     TIMESTAMP        := SYSTIMESTAMP; 
  pCOMMAND        VARCHAR2(4000)   := NULL;
  
  pTB_SOURCE      VARCHAR2(255)    := NULL;
  pTB_DESTINATION VARCHAR2(255)    := NULL;
  
  pCP_STATUS      VARCHAR2(1)      := 'N';
begin
       
  pTB_SOURCE       := pTABLE_NAME || pDBLINK; 
  pTB_DESTINATION  := 'TMP_SYNC_MAS_' || pTABLE_NAME;
  
    
  -- 1. Drop Temp Table (Temp for New Data Sync)
  pLOG_METHOD  := 'DropTempTable';
  CP_SYNC_DROP_TABLE(pLOG_CLASS, pLOG_METHOD, '2', pTABLE_NAME, pTB_DESTINATION, pPROCESS_BY, pCP_STATUS);
      
  
  -- DropMode=2 Then Status return Y Alway
  -- 2. Create Temp Table (Without Data)     
  --    Schema Temp = Table in BiO (Becuase Source Data Pibics is change anytime)
  IF pCP_STATUS = 'Y'
    THEN
      
      pCP_STATUS   := 'N';
      pLOG_METHOD  := 'CreateTempTable';
      CP_SYNC_CREATE_TABLE(pLOG_CLASS, pLOG_METHOD, '2', pTABLE_NAME, pTB_DESTINATION, pTABLE_NAME, pPROCESS_BY, pCP_STATUS);        
      
  END IF;
  
  
   -- 3. Insert Data from Source to Destination (Pibics to Bio Temp)
  IF pCP_STATUS = 'Y'    
    THEN
    
      pCP_STATUS      := 'N';
      pLOG_METHOD     := 'InsertDataToTempTable';    
      CP_SYNC_INSERT_TABLE(pLOG_CLASS, pLOG_METHOD, pTABLE_NAME, pTB_SOURCE, pTB_DESTINATION, pDB_OWNER, pPROCESS_BY, pCP_STATUS); 
      
  END IF;
     
  
   -- 4. Create Index on Temp Table But Ignore Status 
   IF pCP_STATUS = 'Y'     
    THEN       
      
       pLOG_METHOD     := 'GetherStatsToTempTable';
       CP_SYNC_GATHER_STATS_INDEX(pLOG_CLASS, pTABLE_NAME, pTB_DESTINATION, pDB_OWNER, pPROCESS_BY, pCP_STATUS);
       
       pLOG_METHOD     := 'CreateIndexToTempTable';      
       -- Create Index not check if exist becuase process drop temp table alway
       DECLARE        
          pCOLUMN_KEY_PK    VARCHAR2(500)    := NULL;  
        BEGIN
          BEGIN
            
            SELECT LISTAGG((COLS.COLUMN_NAME), ', ') WITHIN GROUP (ORDER BY COLS.COLUMN_NAME)  
            INTO pCOLUMN_KEY_PK
            FROM ALL_CONSTRAINTS CONS, ALL_CONS_COLUMNS COLS
            WHERE COLS.TABLE_NAME = pTABLE_NAME
                  AND CONS.CONSTRAINT_TYPE = 'P'
                  AND CONS.CONSTRAINT_NAME = COLS.CONSTRAINT_NAME
                  AND CONS.OWNER = COLS.OWNER
                  AND CONS.OWNER = pDB_OWNER;
             
           CP_SYNC_CREATE_INDEX('1',pLOG_CLASS, pLOG_METHOD, pTABLE_NAME, pTB_DESTINATION, pTB_DESTINATION || '_PK', pCOLUMN_KEY_PK,  pPROCESS_BY, pCP_STATUS);
                         
         EXCEPTION                        
             WHEN OTHERS THEN
             DBMS_OUTPUT.PUT_LINE(SQLERRM);
             pLOG_LEVEL      := 'ERROR';
             pLOG_ERROR      := SQLERRM;
             pREMARK    := 'Unable to process found primary key!! --> TableName: ' || pTABLE_NAME;
         END;          
        END;
        
       pCP_STATUS := 'Y'; 
       
  END IF;
  
   -- 5. Merge Data from Source to Destination (Temp to Table)
  IF pCP_STATUS = 'Y'    
    THEN
    
      pCP_STATUS   := 'N';
      pLOG_METHOD  := 'MergeDataFromTempToTable';  
      pTB_SOURCE      := pTB_DESTINATION; 
      pTB_DESTINATION := pTABLE_NAME; 
      CP_SYNC_MERGE_TABLE(pLOG_CLASS, pLOG_METHOD, pTABLE_NAME, pTB_SOURCE, pTB_DESTINATION, pDB_OWNER, pPROCESS_BY, pCP_STATUS); 
      
  END IF;
  
  IF pCP_STATUS = 'Y'    
    THEN
      
      pLOG_METHOD  := 'UpdateLastSync';        
      CP_SYNC_UPDATE_SYNC_DATE(pLOG_CLASS, pLOG_METHOD,'1','1', pTABLE_NAME, NULL, NULL, pPROCESS_BY);
      
  END IF;
  
  -------- Keep Log        
  pLOG_METHOD   := 'Synchronize';
  CP_SYNC_INSERT_LOG(pTABLE_NAME, pLOG_LEVEL, pLOG_CLASS, pLOG_METHOD, pREMARK, pLOG_ERROR, pSTART_DATE, pCOMMAND, pPROCESS_BY); 
        
end CP_SYNC_PROCESS_NON_TRAN;
/
  GRANT EXECUTE ON "PIBICSDM2"."CP_SYNC_PROCESS_NON_TRAN" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."CP_SYNC_PROCESS_NON_TRAN" TO "BIOSAADM";
