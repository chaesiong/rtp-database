CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CP_SYNC_GATHER_STATS_INDEX" (
       pLOG_CLASS           in VARCHAR2,       
       pTABLE_NAME          in VARCHAR2, -- For Log
       pTABLE_DESTINATION   in VARCHAR2, -- For Log
       pDB_OWNER            in VARCHAR2,
       pPROCESS_BY          in VARCHAR2,
       pCP_STATUS           OUT VARCHAR2) 
is
  pLOG_LEVEL       VARCHAR2(64)     := 'INFO'; 
  pREMARK          VARCHAR2(4000)   := NULL; 
  pLOG_ERROR       VARCHAR2(4000)   := NULL; 
  pSTART_DATE      TIMESTAMP        := SYSTIMESTAMP; 
  pCOMMAND         VARCHAR2(4000)   := NULL; 
  pLOG_METHOD      VARCHAR2(64)     := 'IndexGatherStats';
begin
  
  /* SP for Create Index & PK */
  pCP_STATUS     := 'N'; 
  pCOMMAND := 'BEGIN
          SYS.DBMS_STATS.GATHER_TABLE_STATS (
           OWNNAME           => ''' || pDB_OWNER || '''
          ,TABNAME           => ''' || pTABLE_DESTINATION || '''
          ,ESTIMATE_PERCENT  => 30
          ,METHOD_OPT        => ''FOR ALL COLUMNS SIZE 1''
          ,DEGREE            => 4
          ,CASCADE           => TRUE
          ,NO_INVALIDATE  => FALSE);
          END;';
         
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
     
end CP_SYNC_GATHER_STATS_INDEX;
/
  GRANT EXECUTE ON "PIBICSDM2"."CP_SYNC_GATHER_STATS_INDEX" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."CP_SYNC_GATHER_STATS_INDEX" TO "BIOSAADM";
