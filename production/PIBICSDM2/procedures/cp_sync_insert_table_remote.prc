CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CP_SYNC_INSERT_TABLE_REMOTE" (
       pLOG_CLASS           in VARCHAR2,
       pLOG_METHOD          in VARCHAR2,       
       pTABLE_NAME          in VARCHAR2, -- For Log
       pTABLE_SOURCE        in VARCHAR2, 
       pTABLE_DESTINATION   in VARCHAR2,       
       pDB_OWNER            in VARCHAR2,     
       pCONDITION_NAME      in VARCHAR2,    
       pCONDITION_TYPE      in VARCHAR2,
       pCONDITION_FORMAT    in VARCHAR2,     
       pCONDITION_START_TIMESTAMP in TIMESTAMP,
       pCONDITION_END_TIMESTAMP   in TIMESTAMP,       
       pPROCESS_BY          in VARCHAR2,
       
       pCP_STATUS           OUT VARCHAR2) 
is
  pLOG_LEVEL       VARCHAR2(64)     := 'INFO'; 
  pREMARK          VARCHAR2(4000)   := NULL; 
  pLOG_ERROR       VARCHAR2(4000)   := NULL; 
  pSTART_DATE      TIMESTAMP        := SYSTIMESTAMP;
  
  pCOMMAND         VARCHAR2(4000)   := NULL; 
  pCOMMAND_P1      VARCHAR2(50)     := NULL; 
  pCOMMAND_P2      VARCHAR2(100)    := NULL; 
  pCOMMAND_P3      VARCHAR2(1000)   := NULL;   
  pCOMMAND_P4      VARCHAR2(100)    := NULL;   
  pCOMMAND_WHERE   VARCHAR2(500)    := NULL; 
  pCOMMAND_COLUMN  VARCHAR2(3500)   := NULL; 
  
  pLENGTH_P          NUMBER         := NULL;    
  pLENGTH_COLUMN     NUMBER         := NULL; 
  pLENGTH_COMMAND    NUMBER         := NULL; 
  pCOMMAND_CONDITION_START_DATE  VARCHAR2(100) := NULL; 
  pCOMMAND_CONDITION_END_DATE    VARCHAR2(100) := NULL; 
begin
       
  pCP_STATUS     := 'N';
  
  
  -------- Where Condition for Scope data
  IF pCONDITION_TYPE = 'DATE'
    THEN
      
      IF pCONDITION_FORMAT = 'yyyymmddhh24mi'
        THEN
          pCOMMAND_WHERE   := ' WHERE TO_CHAR(' || pCONDITION_NAME || ' , ''yyyymmddhh24mi'') >= TO_CHAR(''' ||  pCONDITION_START_TIMESTAMP ||  ' , ''yyyymmddhh24mi'')'
                              || ' AND TO_CHAR(' || pCONDITION_NAME || ' , ''yyyymmddhh24mi'')  <= TO_CHAR('''  ||  pCONDITION_END_TIMESTAMP || ' , ''yyyymmddhh24mi'')';
          
      ELSE
          pCOMMAND_WHERE   := ' WHERE TO_CHAR(' || pCONDITION_NAME || ' , ''yyyymmddhh24mi'') >= TO_CHAR(''' ||  pCONDITION_START_TIMESTAMP ||  ' , ''yyyymmddhh24mi'')'
                              || ' AND TO_CHAR(' || pCONDITION_NAME || ' , ''yyyymmddhh24mi'')  <= TO_CHAR('''  ||  pCONDITION_END_TIMESTAMP || ' , ''yyyymmddhh24mi'')';
          
      END IF;
      
  ELSE
    
      IF pCONDITION_FORMAT = 'yyyymmdd'
        THEN
          
          pCOMMAND_CONDITION_START_DATE := TO_CHAR(pCONDITION_START_TIMESTAMP, 'yyyymmdd');
          pCOMMAND_CONDITION_END_DATE   := TO_CHAR(pCONDITION_END_TIMESTAMP, 'yyyymmdd');      
          
          pCOMMAND_WHERE   := ' WHERE TO_CHAR(' || pCONDITION_NAME || ' , ''yyyymmdd'') >=  TO_CHAR(''' ||  pCOMMAND_CONDITION_START_DATE || ''')'
                           || ' AND TO_CHAR(' || pCONDITION_NAME || ' , ''yyyymmdd'')   <= TO_CHAR('''  ||  pCOMMAND_CONDITION_END_DATE || ''')';    
       
       ELSIF pCONDITION_FORMAT = 'TRUNC'
        THEN     
          pCOMMAND_CONDITION_START_DATE := TO_CHAR(TRUNC(pCONDITION_START_TIMESTAMP));
          pCOMMAND_CONDITION_END_DATE   := TO_CHAR(TRUNC(pCONDITION_END_TIMESTAMP));
          
          pCOMMAND_WHERE   := ' WHERE TRUNC(' || pCONDITION_NAME || ') >= ''' || pCOMMAND_CONDITION_START_DATE || ''''
                           || ' AND TRUNC(' || pCONDITION_NAME || ')   <= ''' || pCOMMAND_CONDITION_END_DATE || ''''; 
                                           
       ELSE
         
        pCOMMAND_WHERE       := ' WHERE ' || pCONDITION_NAME || ' >= '''|| pCONDITION_START_TIMESTAMP || ''''
                             || ' AND ' || pCONDITION_NAME || ' <= ''' || pCONDITION_END_TIMESTAMP || '''';
      
      END IF;
      
  END IF;
  
  BEGIN
      
    SELECT  LISTAGG(COLUMN_NAME, ', ') WITHIN GROUP (ORDER BY COLUMN_ID)   INTO pCOMMAND_COLUMN  
    FROM ALL_TAB_COLUMNS 
    WHERE OWNER=pDB_OWNER AND TABLE_NAME=pTABLE_NAME
    ORDER BY COLUMN_ID;  
    
    pCOMMAND_P1    := 'INSERT INTO ' || pTABLE_DESTINATION || '(' ; 
    pCOMMAND_P2    := ')'
                      || ' WITH remote_rows AS'
                      || ' ( SELECT /*+ NO_QUERY_TRANSFORMATION */ ';
    pCOMMAND_P3    := ' FROM ' || pTABLE_SOURCE || pCOMMAND_WHERE || ')';    
    pCOMMAND_P4    := ' SELECT   *  FROM remote_rows';
        
    pLENGTH_P        := LENGTH(pCOMMAND_P1)+ LENGTH(pCOMMAND_P2) +LENGTH(pCOMMAND_P3) + LENGTH(pCOMMAND_P4) ;
    pLENGTH_COLUMN   := LENGTH(pCOMMAND_COLUMN);
    pLENGTH_COMMAND  := pLENGTH_P + pLENGTH_COLUMN + pLENGTH_COLUMN;
    pREMARK          := 'Length Command : ' || pLENGTH_COMMAND;
    
    IF pLENGTH_COMMAND > 3950
      THEN
        
      pCOMMAND    := pCOMMAND_P3;
      EXECUTE IMMEDIATE pCOMMAND_P1 || pCOMMAND_COLUMN || pCOMMAND_P2 || pCOMMAND_COLUMN || pCOMMAND_P3 || pCOMMAND_P4;
      
    ELSE
      
      pCOMMAND      := pCOMMAND_P1 || pCOMMAND_COLUMN || pCOMMAND_P2 || pCOMMAND_COLUMN || pCOMMAND_P3 || pCOMMAND_P4;      
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
     
end CP_SYNC_INSERT_TABLE_REMOTE;
/
