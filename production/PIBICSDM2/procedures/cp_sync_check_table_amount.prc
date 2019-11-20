CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CP_SYNC_CHECK_TABLE_AMOUNT" (
       pTABLE_NAME                in VARCHAR2, -- For Log 
       pCONDITION_COLUMN          in VARCHAR2, -- 0 - NonCodition, 1 - CreateDate, 2 - UpdateDate
       pPROCESS_BY                in VARCHAR2,
       pCONDITION_START_DATE      in DATE DEFAULT CAST(SYSTIMESTAMP AS DATE) ,
       pCONDITION_END_DATE        in DATE DEFAULT CAST(SYSTIMESTAMP AS DATE) 
       ) 
is
  pLOG_LEVEL      VARCHAR2(64)     := 'INFO'; 
  pLOG_CLASS      VARCHAR2(64)     := 'CheckTableAmount';  
  pLOG_METHOD     VARCHAR2(64)     := 'CheckTableAmount';
  pREMARK          VARCHAR2(4000)   := NULL; 
  pLOG_ERROR       VARCHAR2(4000)   := NULL; 
  pSTART_DATE      TIMESTAMP        := SYSTIMESTAMP;
  pSTART_DATE_DETAIL      TIMESTAMP        := SYSTIMESTAMP;
  
  pDBLINK         VARCHAR2(255)    := NULL;
  pCOMMAND         VARCHAR2(4000) := NULL; 
  pCOMMAND_P1      VARCHAR2(1000)  := NULL;   
  pCOMMAND_P2      VARCHAR2(50)  := NULL; 
  pCOMMAND_P3      VARCHAR2(1000)  := NULL; 
  pCOMMAND_CS      VARCHAR2(50)    := NULL; 
  pCOMMAND_CD      VARCHAR2(50)    := NULL; 
  --pCOMMAND_P3      VARCHAR2(1000)   := NULL;     
  pCOMMAND_WHERE   VARCHAR2(500)    := NULL; 
  pCOMMAND_CONDITION_NAME        VARCHAR2(100) := NULL; 
  pCOMMAND_CONDITION_START_DATE  VARCHAR2(100) := NULL; 
  pCOMMAND_CONDITION_END_DATE    VARCHAR2(100) := NULL; 
begin
    
  -------- Get Config  
  SELECT CONFIG_VALUE INTO pDBLINK    FROM SYS_SYNC_CONFIG WHERE STATUS='Y' AND CONFIG_NAME = 'DB_LINK_SOURCE_SYNC';
  
  -- Prepare Parameter
  --pCOMMAND_CS         := 'AMOUNT_SOURCE';
  --pCOMMAND_CD         := 'AMOUNT_DESTINATION';
  
   IF pCONDITION_COLUMN = '1' THEN
        pCOMMAND_CONDITION_NAME := 'CREATE_DATE';
   ELSIF pCONDITION_COLUMN = '2'  THEN
        pCOMMAND_CONDITION_NAME := 'UPDATE_DATE';
   ELSE
        pCOMMAND_CONDITION_NAME := 'NoConditon'; 
   END IF;
  
   pCOMMAND_CONDITION_START_DATE := TO_CHAR(pCONDITION_START_DATE, 'yyyymmdd');
   pCOMMAND_CONDITION_END_DATE   := TO_CHAR(pCONDITION_END_DATE, 'yyyymmdd');      
       
     
  IF pCONDITION_COLUMN IN ('1','2')
    THEN
     
     -- GetData Source
       
     pCOMMAND_WHERE   := ' WHERE TO_CHAR(' || pCOMMAND_CONDITION_NAME || ' , ''yyyymmdd'') >=  TO_CHAR(''' ||  pCOMMAND_CONDITION_START_DATE || ''')'
                     || ' AND TO_CHAR(' || pCOMMAND_CONDITION_NAME || ' , ''yyyymmdd'')   <= TO_CHAR('''  ||  pCOMMAND_CONDITION_END_DATE || ''')';    
                  
    pCOMMAND_P1    := 'INSERT INTO TMP_SYNC_CHECK_TABLE_AMOUNT_TMP(DATE_CHECK,AMOUNT,TYPE_CHECK)'
                      || ' WITH remote_rows AS'
                      || ' ( SELECT /*+ NO_QUERY_TRANSFORMATION */ '
                      || ' to_char(' || pCOMMAND_CONDITION_NAME || ',''yyyymmdd'') ,  Count(*)';
    pCOMMAND_P2    := ' FROM ';
    pCOMMAND_P3    := pCOMMAND_WHERE 
                      || ' group by to_char(' || pCOMMAND_CONDITION_NAME || ',''yyyymmdd'')'
                      || ' order by to_char(' || pCOMMAND_CONDITION_NAME || ',''yyyymmdd'')'
                      || ')'                    
                      || ' SELECT   *  FROM remote_rows';
          
   ELSE
    pCOMMAND_P1    := 'INSERT INTO TMP_SYNC_CHECK_TABLE_AMOUNT_TMP(AMOUNT,TYPE_CHECK)'
                      || ' WITH remote_rows AS'
                      || ' ( SELECT /*+ NO_QUERY_TRANSFORMATION */ '
                      || ' Count(*)';
   pCOMMAND_P2    :=  ' FROM ';
   pCOMMAND_P3    :=  ')'             
                      || ' SELECT   *  FROM remote_rows';
       
 END IF;      
     
  BEGIN
    
     -- Truncate Table
     pLOG_METHOD     := 'TruncateTableAmountTmp';
     pCOMMAND        := 'TRUNCATE TABLE TMP_SYNC_CHECK_TABLE_AMOUNT_TMP';
     EXECUTE IMMEDIATE pCOMMAND;
     CP_SYNC_INSERT_LOG(pTABLE_NAME, pLOG_LEVEL, pLOG_CLASS, pLOG_METHOD, pREMARK, pLOG_ERROR, pSTART_DATE_DETAIL, pCOMMAND, pPROCESS_BY);
     pSTART_DATE_DETAIL   := SYSTIMESTAMP;
     
     pLOG_METHOD     := 'TruncateTableAmount';
     pCOMMAND        := 'TRUNCATE TABLE TMP_SYNC_CHECK_TABLE_AMOUNT';
     EXECUTE IMMEDIATE pCOMMAND;
     CP_SYNC_INSERT_LOG(pTABLE_NAME, pLOG_LEVEL, pLOG_CLASS, pLOG_METHOD, pREMARK, pLOG_ERROR, pSTART_DATE_DETAIL, pCOMMAND, pPROCESS_BY);
     pSTART_DATE_DETAIL   := SYSTIMESTAMP;
      
    -- Insert Amout
    pLOG_METHOD     := 'InsertAmoutSource';
    pCOMMAND      := pCOMMAND_P1 || ',1' || pCOMMAND_P2 || pTABLE_NAME || pDBLINK || pCOMMAND_P3;  
    EXECUTE IMMEDIATE pCOMMAND;
    CP_SYNC_INSERT_LOG(pTABLE_NAME, pLOG_LEVEL, pLOG_CLASS, pLOG_METHOD, pREMARK, pLOG_ERROR, pSTART_DATE_DETAIL, pCOMMAND, pPROCESS_BY);
    pSTART_DATE_DETAIL   := SYSTIMESTAMP;
    
    pLOG_METHOD     := 'InsertAmoutDestination';
    pCOMMAND      := pCOMMAND_P1 || ',2' || pCOMMAND_P2 || pTABLE_NAME || pCOMMAND_P3;  
    EXECUTE IMMEDIATE pCOMMAND;
    CP_SYNC_INSERT_LOG(pTABLE_NAME, pLOG_LEVEL, pLOG_CLASS, pLOG_METHOD, pREMARK, pLOG_ERROR, pSTART_DATE_DETAIL, pCOMMAND, pPROCESS_BY);
    pSTART_DATE_DETAIL   := SYSTIMESTAMP;
    
    -- FullFill Temp
    IF pCONDITION_COLUMN = '0'
      THEN
        
       pLOG_METHOD     := 'FullFill-DateDefault';
        pCOMMAND     := 'UPDATE TMP_SYNC_CHECK_TABLE_AMOUNT_TMP'
                        || ' SET'
                        || ' DATE_CHECK = ''' || pCOMMAND_CONDITION_START_DATE || '''';
                  
      EXECUTE IMMEDIATE pCOMMAND;
      CP_SYNC_INSERT_LOG(pTABLE_NAME, pLOG_LEVEL, pLOG_CLASS, pLOG_METHOD, pREMARK, pLOG_ERROR, pSTART_DATE_DETAIL, pCOMMAND, pPROCESS_BY);
      pSTART_DATE_DETAIL   := SYSTIMESTAMP;
        
    END IF;
     
     pLOG_METHOD     := 'FullFill-Source';
     pCOMMAND     := 'INSERT INTO TMP_SYNC_CHECK_TABLE_AMOUNT(DATE_CHECK,AMOUNT_SOURCE)'
                       || ' SELECT  DATE_CHECK,AMOUNT'
                       || ' FROM TMP_SYNC_CHECK_TABLE_AMOUNT_TMP'
                       || ' WHERE TYPE_CHECK = 1';
            
    EXECUTE IMMEDIATE pCOMMAND;
    CP_SYNC_INSERT_LOG(pTABLE_NAME, pLOG_LEVEL, pLOG_CLASS, pLOG_METHOD, pREMARK, pLOG_ERROR, pSTART_DATE_DETAIL, pCOMMAND, pPROCESS_BY);
    pSTART_DATE_DETAIL   := SYSTIMESTAMP;
      
     pLOG_METHOD     := 'FullFill-Destination';
     pCOMMAND      := 'MERGE INTO TMP_SYNC_CHECK_TABLE_AMOUNT T1'
                      || ' USING (SELECT DATE_CHECK,AMOUNT FROM TMP_SYNC_CHECK_TABLE_AMOUNT_TMP'
                       || ' WHERE TYPE_CHECK = 2) T2'
                       || ' ON (T1.DATE_CHECK= T2.DATE_CHECK)'
                       || ' WHEN MATCHED THEN'
                       || ' UPDATE SET T1.AMOUNT_DESTINATION = NVL(T2.AMOUNT,0)'; 
       
    EXECUTE IMMEDIATE pCOMMAND;
    CP_SYNC_INSERT_LOG(pTABLE_NAME, pLOG_LEVEL, pLOG_CLASS, pLOG_METHOD, pREMARK, pLOG_ERROR, pSTART_DATE_DETAIL, pCOMMAND, pPROCESS_BY);
    pSTART_DATE_DETAIL   := SYSTIMESTAMP;
      
     pLOG_METHOD     := 'FullFill-Diff';
     pCOMMAND      := 'UPDATE TMP_SYNC_CHECK_TABLE_AMOUNT'
                      || ' SET'
                      || ' TABLE_NAME = ''' || pTABLE_NAME || ''''
                      || ' , CONDITION_NAME = ''' || pCOMMAND_CONDITION_NAME || ''''
                      || ' , DIFF_AMOUNT = AMOUNT_SOURCE - AMOUNT_DESTINATION' ;
            
    EXECUTE IMMEDIATE pCOMMAND;
    CP_SYNC_INSERT_LOG(pTABLE_NAME, pLOG_LEVEL, pLOG_CLASS, pLOG_METHOD, pREMARK, pLOG_ERROR, pSTART_DATE_DETAIL, pCOMMAND, pPROCESS_BY);
    pSTART_DATE_DETAIL   := SYSTIMESTAMP;
      
    
  EXCEPTION           
     WHEN OTHERS THEN
       DBMS_OUTPUT.PUT_LINE(SQLERRM);
       pLOG_LEVEL      := 'ERROR';
       pLOG_ERROR      := SQLERRM;
  END; 
  
  -------- Keep Log        
  pLOG_METHOD     := 'AllCheckTableAmount';
  pREMARK         := 'Condition: ' || pCOMMAND_CONDITION_NAME || ', DateStart: ' || pCOMMAND_CONDITION_START_DATE || ', DateEnd: ' || pCOMMAND_CONDITION_END_DATE;
  CP_SYNC_INSERT_LOG(pTABLE_NAME, pLOG_LEVEL, pLOG_CLASS, pLOG_METHOD, pREMARK, pLOG_ERROR, pSTART_DATE, pCOMMAND, pPROCESS_BY); 
      
end CP_SYNC_CHECK_TABLE_AMOUNT;
/
  GRANT EXECUTE ON "PIBICSDM2"."CP_SYNC_CHECK_TABLE_AMOUNT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."CP_SYNC_CHECK_TABLE_AMOUNT" TO "PIBICSAPP";
  GRANT EXECUTE ON "PIBICSDM2"."CP_SYNC_CHECK_TABLE_AMOUNT" TO "BIOSAADM";
