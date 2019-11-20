CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CP_SYNC_DROP_TABLE" (
       pLOG_CLASS           in VARCHAR2,
       pLOG_METHOD          in VARCHAR2,
       pCP_MODE             in VARCHAR2, -- 1- Check Before Drop (Y/N), 2- Aka Not Check (Y)
       pTABLE_NAME          in VARCHAR2, -- For Log
       pTABLE_SOURCE        in VARCHAR2, -- For Drop
       pPROCESS_BY          in VARCHAR2,
       pCP_STATUS           OUT VARCHAR2) 
is
  pLOG_LEVEL       VARCHAR2(64)     := 'INFO'; 
  pREMARK          VARCHAR2(4000)   := NULL; 
  pLOG_ERROR       VARCHAR2(4000)   := NULL; 
  pSTART_DATE      TIMESTAMP        := SYSTIMESTAMP;
  
  pCOMMAND          VARCHAR2(4000) := NULL; 
begin
  
  /* SP for Drop Table */
  pCP_STATUS     := 'N';
  
  pCOMMAND          := 'DROP TABLE ' || pTABLE_SOURCE;
  
  -- Drop Table if Exist
  DECLARE CNT NUMBER;
  BEGIN
    
    SELECT COUNT(*) INTO CNT FROM USER_TABLES WHERE TABLE_NAME = pTABLE_SOURCE;
    IF CNT <> 0 THEN
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
    ELSE
      pREMARK             := 'Not Found Table : ' || pTABLE_SOURCE;
    END IF;
    
  END;  
    
  IF pCP_MODE = '2'
    THEN
     pCP_STATUS        := 'Y';
  END IF;
  
  DBMS_OUTPUT.PUT_LINE(pLOG_METHOD || ' : ' || pTABLE_SOURCE);
     
  -------- Keep Log        
  CP_SYNC_INSERT_LOG(pTABLE_NAME, pLOG_LEVEL, pLOG_CLASS, pLOG_METHOD, pREMARK, pLOG_ERROR, pSTART_DATE, pCOMMAND, pPROCESS_BY); 
      
end CP_SYNC_DROP_TABLE;
/
  GRANT EXECUTE ON "PIBICSDM2"."CP_SYNC_DROP_TABLE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."CP_SYNC_DROP_TABLE" TO "BIOSAADM";
