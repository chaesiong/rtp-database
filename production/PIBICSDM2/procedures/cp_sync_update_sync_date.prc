CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CP_SYNC_UPDATE_SYNC_DATE" (
       pLOG_CLASS           in VARCHAR2,
       pLOG_METHOD          in VARCHAR2,       
       pCP_MODE             in VARCHAR2, -- 1- Sync NonTran, 2- Sync Tran
       pCP_MODE_UPDATE      in VARCHAR2, -- 1- Update, 2-NoUpdate But Keep ParameterConditons to Remark
       pTABLE_NAME          in VARCHAR2, -- For Log       
       pCONDITION_START_TIMESTAMP in TIMESTAMP,
       pCONDITION_END_TIMESTAMP   in TIMESTAMP,
       pPROCESS_BY          in VARCHAR2
) 
is
  pLOG_LEVEL       VARCHAR2(64)     := 'INFO'; 
  pREMARK          VARCHAR2(4000)   := NULL; 
  pLOG_ERROR       VARCHAR2(4000)   := NULL; 
  pSTART_DATE      TIMESTAMP        := SYSTIMESTAMP;
  
  pCOMMAND         VARCHAR2(4000)   := NULL; 
begin
  
  IF pCP_MODE = 1
    THEN
                 
      pCOMMAND       := 'UPDATE SYS_SYNC_NON_TRAN SET LAST_SYNC_DATE = ''' || pSTART_DATE || ''''
                     || ' WHERE TABLE_NAME = ''' || pTABLE_NAME || '''';
      
  ELSIF pCP_MODE = 2
    THEN
            
      pCOMMAND       := 'UPDATE SYS_SYNC_TRAN_CONDITION SET LAST_SYNC_START = ''' || pCONDITION_START_TIMESTAMP || ''''
                     || ', LAST_SYNC_END = ''' || pCONDITION_END_TIMESTAMP || ''''
                     || ' WHERE TABLE_NAME = ''' || pTABLE_NAME || '''';
     
      pREMARK        := 'ParameterDateStart: ' || TO_CHAR(CAST(pCONDITION_START_TIMESTAMP AS TIMESTAMP WITH TIME ZONE), 'YYYY-MM-DD"T"HH24:MI:SS.FF TZH:TZM')
                     || ', ParameterDateEnd: ' || TO_CHAR(CAST(pCONDITION_END_TIMESTAMP AS TIMESTAMP WITH TIME ZONE), 'YYYY-MM-DD"T"HH24:MI:SS.FF TZH:TZM');
                   
  END IF;
  
                     
  IF pCP_MODE_UPDATE = 1
    
    THEN
      BEGIN
         EXECUTE IMMEDIATE pCOMMAND;
      EXCEPTION           
         WHEN OTHERS THEN
           DBMS_OUTPUT.PUT_LINE(SQLERRM);
           pLOG_LEVEL      := 'ERROR';
           pLOG_ERROR      := SQLERRM;
      END;
      
  END IF;
  -------- Keep Log        
  CP_SYNC_INSERT_LOG(pTABLE_NAME, pLOG_LEVEL, pLOG_CLASS, pLOG_METHOD, pREMARK, pLOG_ERROR, pSTART_DATE, pCOMMAND, pPROCESS_BY); 
     
end CP_SYNC_UPDATE_SYNC_DATE;
/
  GRANT EXECUTE ON "PIBICSDM2"."CP_SYNC_UPDATE_SYNC_DATE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."CP_SYNC_UPDATE_SYNC_DATE" TO "BIOSAADM";
