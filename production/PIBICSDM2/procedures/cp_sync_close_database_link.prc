CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CP_SYNC_CLOSE_DATABASE_LINK" (
       pLOG_CLASS           in VARCHAR2,
       pLOG_METHOD          in VARCHAR2,
       pTABLE_NAME          in VARCHAR2, -- For Log 
       pDBLINK              in VARCHAR2,
       pPROCESS_BY          in VARCHAR2
       ) 
is
  pLOG_LEVEL       VARCHAR2(64)     := 'INFO'; 
  pREMARK          VARCHAR2(4000)   := NULL; 
  pLOG_ERROR       VARCHAR2(4000)   := NULL; 
  pSTART_DATE      TIMESTAMP        := SYSTIMESTAMP;
  
  pCOMMAND          VARCHAR2(4000) := NULL; 
begin
    
  DECLARE
      DATABASE_LINK_IS_NOT_OPEN EXCEPTION;
      PRAGMA EXCEPTION_INIT(DATABASE_LINK_IS_NOT_OPEN, -2081);
  BEGIN
      DBMS_SESSION.CLOSE_DATABASE_LINK(pDBLINK); 
      pREMARK  := 'Close Database Link : ' || pDBLINK;
    
  EXCEPTION 
      WHEN DATABASE_LINK_IS_NOT_OPEN THEN 
          NULL;
          pREMARK  := 'Not Open Database Link : ' || pDBLINK;
  END;
  
  DBMS_OUTPUT.PUT_LINE(pREMARK);
  -------- Keep Log        
  CP_SYNC_INSERT_LOG(pTABLE_NAME, pLOG_LEVEL, pLOG_CLASS, pLOG_METHOD, pREMARK, pLOG_ERROR, pSTART_DATE, pCOMMAND, pPROCESS_BY); 
      
end CP_SYNC_CLOSE_DATABASE_LINK;
/
