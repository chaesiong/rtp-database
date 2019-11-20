CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CP_SYNC_CREATE_INDEX" (
       pCP_MODE             in VARCHAR2, -- 1-PK, 2-UniqIndex, 3-NonIndex
       pLOG_CLASS           in VARCHAR2,
       pLOG_METHOD_REC      in VARCHAR2,
       pTABLE_NAME          in VARCHAR2, -- For Log
       pTABLE_DESTINATION   in VARCHAR2, -- TB create index
       pINDEX_NAME          in VARCHAR2,    
       pINDEX_COLUMN        in VARCHAR2, 
       pPROCESS_BY          in VARCHAR2,      
       pCP_STATUS           OUT VARCHAR2) 
is
  pLOG_LEVEL       VARCHAR2(64)     := 'INFO'; 
  pREMARK          VARCHAR2(4000)   := NULL; 
  pLOG_ERROR       VARCHAR2(4000)   := NULL; 
  pSTART_DATE      TIMESTAMP        := SYSTIMESTAMP; 
  pCOMMAND         VARCHAR2(4000)   := NULL; 
  pLOG_METHOD      VARCHAR2(64)     := NULL;
begin
  
  /* SP for Create Index & PK */
  pCP_STATUS     := 'N';
  
  IF pCP_MODE = '1'
    THEN
       pLOG_METHOD    := pLOG_METHOD_REC || 'CreatePrimaryKey';
       pCOMMAND := 'ALTER TABLE ' || pTABLE_DESTINATION 
                   || ' ADD CONSTRAINT ' || pINDEX_NAME || ' PRIMARY KEY (' || pINDEX_COLUMN || ') USING INDEX TABLESPACE TS_PIBICSDM_IDX';
                   
  ELSIF pCP_MODE = '2'
    THEN 
      pLOG_METHOD    := pLOG_METHOD_REC || 'CreateUniqueIndex';
      pCOMMAND := 'CREATE UNIQUE INDEX ' || pINDEX_NAME || ' ON ' || pTABLE_DESTINATION || '(' || pINDEX_COLUMN || ') TABLESPACE TS_PIBICSDM_IDX'
                     || ' COMPUTE STATISTICS ';
  ELSIF pCP_MODE = '3'
    THEN
      pLOG_METHOD    := pLOG_METHOD_REC || 'NonClusteredIndex';
      pCOMMAND := 'CREATE INDEX ' || pINDEX_NAME || ' ON ' || pTABLE_DESTINATION || '(' || pINDEX_COLUMN || ') TABLESPACE TS_PIBICSDM_IDX';
                               
  END IF; 
  
  BEGIN
     EXECUTE IMMEDIATE pCOMMAND;
     pCP_STATUS        := 'Y';
  EXCEPTION           
     WHEN OTHERS THEN
       DBMS_OUTPUT.PUT_LINE(SQLERRM);
       pLOG_LEVEL      := 'ERROR';
       pLOG_ERROR      := SQLERRM;
       pCP_STATUS      := 'N';
  END;     
  
  -------- Keep Log        
  CP_SYNC_INSERT_LOG(pTABLE_NAME, pLOG_LEVEL, pLOG_CLASS, pLOG_METHOD, pREMARK, pLOG_ERROR, pSTART_DATE, pCOMMAND, pPROCESS_BY); 
     
end CP_SYNC_CREATE_INDEX;
/
  GRANT EXECUTE ON "PIBICSDM2"."CP_SYNC_CREATE_INDEX" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."CP_SYNC_CREATE_INDEX" TO "BIOSAADM";
