CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CP_SYNC_MERGE_TABLE" (
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
  pCOMMAND_P1      VARCHAR2(800)    := NULL; 
  pCOMMAND_P2      VARCHAR2(50)     := NULL; 
  pCOMMAND_P3      VARCHAR2(50)     := NULL; 
  pCOMMAND_P4      VARCHAR2(10)     := NULL; 
  
  pLENGTH_P        NUMBER           := NULL;
    
  pLENGTH_COLUMN     NUMBER           := NULL; 
  pLENGTH_COLUMN_A   NUMBER           := NULL; 
  pLENGTH_COLUMN_B   NUMBER           := NULL;   
  pLENGTH_COLUMN_AB   NUMBER           := NULL; 
  pCOMMAND_COLUMN_KEY  VARCHAR2(500)   := NULL; 
  pCOMMAND_COLUMN_A    VARCHAR2(4000)   := NULL; 
  pCOMMAND_COLUMN_B    VARCHAR2(4000)   := NULL;
  pCOMMAND_COLUMN_AB   VARCHAR2(4000)   := NULL;
  
  pLENGTH_COMMAND      NUMBER           := NULL; 
       
begin
       
  pCP_STATUS     := 'N';

  BEGIN
         
  
    DELETE FROM SYS_SYNC_TMP_PK;     
    INSERT INTO SYS_SYNC_TMP_PK (COLUMN_NAME) 
    SELECT COLS.COLUMN_NAME
    FROM ALL_CONSTRAINTS CONS, ALL_CONS_COLUMNS COLS
    WHERE COLS.TABLE_NAME = pTABLE_NAME
          AND CONS.CONSTRAINT_TYPE = 'P'
          AND CONS.CONSTRAINT_NAME = COLS.CONSTRAINT_NAME
          AND CONS.OWNER = COLS.OWNER
          AND CONS.OWNER = pDB_OWNER;
          
    
    SELECT LISTAGG(('A.' || COLUMN_NAME || '=B.' || COLUMN_NAME), ' AND ') WITHIN GROUP (ORDER BY COLUMN_NAME)   
    INTO pCOMMAND_COLUMN_KEY
    FROM SYS_SYNC_TMP_PK;
          
    
    SELECT LENGTH( LISTAGG(('A.' || COLUMN_NAME), ', ') WITHIN GROUP (ORDER BY COLUMN_ID) ),
           LENGTH( LISTAGG(('B.' || COLUMN_NAME), ', ') WITHIN GROUP (ORDER BY COLUMN_ID) ),           
           LISTAGG(('A.' || COLUMN_NAME), ', ') WITHIN GROUP (ORDER BY COLUMN_ID),
           LISTAGG(('B.' || COLUMN_NAME), ', ') WITHIN GROUP (ORDER BY COLUMN_ID)
    INTO pLENGTH_COLUMN_A, pLENGTH_COLUMN_B, pCOMMAND_COLUMN_A, pCOMMAND_COLUMN_B
    FROM ALL_TAB_COLUMNS 
    WHERE OWNER=pDB_OWNER AND TABLE_NAME=pTABLE_NAME
    ORDER BY COLUMN_ID;  
    
    
    SELECT LENGTH( LISTAGG(('A.' || COLUMN_NAME || '=B.' || COLUMN_NAME), ', ') WITHIN GROUP (ORDER BY COLUMN_ID)) , 
           LISTAGG(('A.' || COLUMN_NAME || '=B.' || COLUMN_NAME), ', ') WITHIN GROUP (ORDER BY COLUMN_ID)    
    INTO pLENGTH_COLUMN_AB, pCOMMAND_COLUMN_AB
    FROM ALL_TAB_COLUMNS 
    WHERE OWNER=pDB_OWNER AND TABLE_NAME=pTABLE_NAME AND COLUMN_NAME NOT IN (SELECT COLUMN_NAME FROM SYS_SYNC_TMP_PK)
    ORDER BY COLUMN_ID;  
          
    
    pCOMMAND_P1    := 'MERGE INTO ' || pTABLE_DESTINATION || ' A '
                      || ' USING (  SELECT * FROM ' || pTABLE_SOURCE || ' ) B'
                      || ' ON (' || pCOMMAND_COLUMN_KEY ||')'
                      || ' WHEN MATCHED'
                      || ' THEN'
                      || ' UPDATE SET ';     
                               
    pCOMMAND_P2    := ' WHEN NOT MATCHED'
                      || ' THEN'
                      || ' INSERT (';   
                                    
    pCOMMAND_P3    := ') VALUES (';
                                    
    pCOMMAND_P4    := ')';
     
    
    pLENGTH_P      := LENGTH(pCOMMAND_P1)+ LENGTH(pCOMMAND_P2) +LENGTH(pCOMMAND_P3)+ LENGTH(pCOMMAND_P4);
    pLENGTH_COLUMN := pLENGTH_COLUMN_A + pLENGTH_COLUMN_B + pLENGTH_COLUMN_AB;
    pLENGTH_COMMAND := pLENGTH_P + pLENGTH_COLUMN;
    
    /*
    DBMS_OUTPUT.PUT_LINE('Length P1 : ' || LENGTH(pCOMMAND_P1));
    DBMS_OUTPUT.PUT_LINE('Length P2 : ' || LENGTH(pCOMMAND_P2));
    DBMS_OUTPUT.PUT_LINE('Length P3 : ' || LENGTH(pCOMMAND_P3));
    DBMS_OUTPUT.PUT_LINE('Length P4 : ' || LENGTH(pCOMMAND_P4));
    DBMS_OUTPUT.PUT_LINE('Length P All : ' || pLENGTH_P);
    
    DBMS_OUTPUT.PUT_LINE('Length Column A : ' || pLENGTH_COLUMN_A);
    DBMS_OUTPUT.PUT_LINE('Length Column B : ' || pLENGTH_COLUMN_B);
    DBMS_OUTPUT.PUT_LINE('Length Column AB : ' || pLENGTH_COLUMN_AB);
    DBMS_OUTPUT.PUT_LINE('Length Column All : ' || pLENGTH_COLUMN);
    
    DBMS_OUTPUT.PUT_LINE('Length All : ' || pLENGTH_COMMAND);
    */
    
    pREMARK         := 'Length Command : ' || pLENGTH_COMMAND;
    
    IF pLENGTH_COMMAND > 3950 
    THEN
      pCOMMAND    := pCOMMAND_COLUMN_KEY;
      EXECUTE IMMEDIATE pCOMMAND_P1 || pCOMMAND_COLUMN_AB || pCOMMAND_P2 || pCOMMAND_COLUMN_A || pCOMMAND_P3 || pCOMMAND_COLUMN_B || pCOMMAND_P4;
      
    ELSE
      
      pCOMMAND      := pCOMMAND_P1 || pCOMMAND_COLUMN_AB || pCOMMAND_P2 || pCOMMAND_COLUMN_A || pCOMMAND_P3 || pCOMMAND_COLUMN_B || pCOMMAND_P4;      
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
       
end CP_SYNC_MERGE_TABLE;
/
  GRANT EXECUTE ON "PIBICSDM2"."CP_SYNC_MERGE_TABLE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."CP_SYNC_MERGE_TABLE" TO "BIOSAADM";
