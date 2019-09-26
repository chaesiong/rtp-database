CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CP_SYNC_CREATE_TABLE" (
       pLOG_CLASS           in VARCHAR2,
       pLOG_METHOD          in VARCHAR2,
       pCP_MODE             in VARCHAR2, -- 1- Create with Data, 2-Create without Data
       pTABLE_NAME          in VARCHAR2, -- For Log
       pTABLE_SOURCE        in VARCHAR2, 
       pTABLE_DESTINATION   in VARCHAR2,
       pPROCESS_BY          in VARCHAR2,
       pCP_STATUS           OUT VARCHAR2) 
is
  pLOG_LEVEL       VARCHAR2(64)     := 'INFO'; 
  pREMARK          VARCHAR2(4000)   := NULL; 
  pLOG_ERROR       VARCHAR2(4000)   := NULL; 
  pSTART_DATE      TIMESTAMP        := SYSTIMESTAMP; 
  pCOMMAND         VARCHAR2(4000)   := NULL; 
  
begin
    
  /* SP for Create Table */
  pCP_STATUS     := 'N';
  
  IF pCP_MODE = '1'
    THEN
      pCOMMAND  := 'CREATE TABLE ' || pTABLE_SOURCE || ' AS SELECT /*+ NO_QUERY_TRANSFORMATION */ * FROM ' || pTABLE_DESTINATION;
 
  ELSIF pCP_MODE = '2' 
    THEN
      pCOMMAND  := 'CREATE TABLE ' || pTABLE_SOURCE || ' AS SELECT /*+ NO_QUERY_TRANSFORMATION */ * FROM ' || pTABLE_DESTINATION || ' WHERE 1=0';
  END IF;
  
  DBMS_OUTPUT.PUT_LINE(pLOG_METHOD || ' : ' || pTABLE_SOURCE);
        
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
  DBMS_OUTPUT.PUT_LINE(pLOG_METHOD || ' Status: ' || pCP_STATUS);  
  
end CP_SYNC_CREATE_TABLE;
/
