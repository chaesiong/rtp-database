CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CP_SYNC_INSERT_TABLE" (
       pLOG_CLASS           in VARCHAR2,
       pLOG_METHOD          in VARCHAR2,       
       pTABLE_NAME          in VARCHAR2, -- For Log
       pTABLE_SOURCE        in VARCHAR2, 
       pTABLE_DESTINATION   in VARCHAR2,
       pDB_OWNER            in VARCHAR2,
       pPROCESS_BY          in VARCHAR2,
       pCP_STATUS           OUT VARCHAR2) 
is
  pLOG_LEVEL       VARCHAR2(64)     := 'INFO'; 
  pREMARK          VARCHAR2(4000)   := NULL; 
  pLOG_ERROR       VARCHAR2(4000)   := NULL; 
  pSTART_DATE      TIMESTAMP        := SYSTIMESTAMP;
  
  pCOMMAND         VARCHAR2(4000)   := NULL; 
  pCOMMAND_P1      VARCHAR2(50)     := NULL; 
  pCOMMAND_P2      VARCHAR2(50)     := NULL; 
  pCOMMAND_P3      VARCHAR2(300)     := NULL; 
  
  pCOMMAND_COLUMN  VARCHAR2(3500)   := NULL; 
  
begin
       
  pCP_STATUS     := 'N';
  
  BEGIN
    
    SELECT  LISTAGG(COLUMN_NAME, ', ') WITHIN GROUP (ORDER BY COLUMN_ID)   INTO pCOMMAND_COLUMN  
    FROM ALL_TAB_COLUMNS 
    WHERE OWNER=pDB_OWNER AND TABLE_NAME=pTABLE_NAME
    ORDER BY COLUMN_ID;  
    
    pCOMMAND_P1    := 'INSERT INTO ' || pTABLE_DESTINATION || '(' ;
    pCOMMAND_P2    := ') SELECT /*+ NO_QUERY_TRANSFORMATION */ ';
    pCOMMAND_P3    := ' FROM ' || pTABLE_SOURCE;
    
    IF LENGTH(pCOMMAND_P1 || pCOMMAND_COLUMN || pCOMMAND_P2 || pCOMMAND_COLUMN || pCOMMAND_P3) > 4000
      THEN
        
      pCOMMAND    := pCOMMAND_P3;
      EXECUTE IMMEDIATE pCOMMAND_P1 || pCOMMAND_COLUMN || pCOMMAND_P2 || pCOMMAND_COLUMN || pCOMMAND_P3;
      
    ELSE
      
      pCOMMAND      := pCOMMAND_P1 || pCOMMAND_COLUMN || pCOMMAND_P2 || pCOMMAND_COLUMN || pCOMMAND_P3;      
      EXECUTE IMMEDIATE pCOMMAND;
      
    END IF;
      
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
     
end CP_SYNC_INSERT_TABLE;
/
