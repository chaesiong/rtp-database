CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_DELETE_WATCHLIST_M" 
(
    v_dstart IN VARCHAR2 
) IS
    v_dstart2 VARCHAR2(15);
    var_rows   NUMBER;
    vstdate    DATE;
    veddate    DATE;
    settype2 VARCHAR2(15);
    
BEGIN
  
  v_dstart2 := v_dstart;
--1 day  TO_CHAR (SYSDATE-1, 'dd/mm/yyyy')
--1 hour TO_CHAR(SYSDATE-(1/24),'dd/mm/yyyy')
--20 min TO_CHAR (SYSDATE-(20/24/60), 'dd/mm/yyyy')
  IF (v_dstart2 = '' OR v_dstart2 IS NULL) THEN v_dstart2 := TO_CHAR (SYSDATE-1, 'dd/mm/yyyy');
  END IF;

  --WATCHLIST
  vstdate := SYSDATE;
  DELETE FROM PIBICSDM2.WATCHLIST WHERE WLCD IN (
    SELECT WLCD FROM PIBICSDM2.WATCHLISTLOG 
        WHERE TO_CHAR(LOGDTE,'dd/mm/yyyy') = v_dstart2 AND LOGFLAG = 'D'
  );  
  var_rows := SQL%ROWCOUNT;
  veddate := SYSDATE;
  INSERT INTO IMPORT_LOG
        VALUES ('WATCHLIST_D_M', var_rows, SYSDATE);
  INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('WATCHLIST_D_M', var_rows, SYSDATE,
                v_dstart2, v_dstart2, vstdate, veddate);
  COMMIT;
  
  --WATCHLISTNM
  vstdate := SYSDATE;
  DELETE FROM PIBICSDM2.WATCHLISTNM WHERE WLCD IN (
    SELECT WLCD FROM PIBICSDM2.WATCHLISTLOG 
        WHERE TO_CHAR(LOGDTE,'dd/mm/yyyy') = v_dstart2 AND LOGFLAG = 'D'
  );
  var_rows := SQL%ROWCOUNT;
  veddate := SYSDATE;
  INSERT INTO IMPORT_LOG
        VALUES ('WATCHLISTNM_D_M', var_rows, SYSDATE);
  INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('WATCHLISTNM_D_M', var_rows, SYSDATE,
                v_dstart2, v_dstart2, vstdate, veddate);
  COMMIT;
  
  --WLINDICATECARD
  vstdate := SYSDATE;
  DELETE FROM PIBICSDM2.WLINDICATECARD WHERE WLCD IN (
    SELECT WLCD FROM PIBICSDM2.WATCHLISTLOG 
        WHERE TO_CHAR(LOGDTE,'dd/mm/yyyy') = v_dstart2 AND LOGFLAG = 'D'
  );
  var_rows := SQL%ROWCOUNT;
  veddate := SYSDATE;
  INSERT INTO IMPORT_LOG
        VALUES ('WLINDICATECARD_D_M', var_rows, SYSDATE);
  INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('WLINDICATECARD_D_M', var_rows, SYSDATE,
                v_dstart2, v_dstart2, vstdate, veddate);        
  COMMIT;
  
  --WLRELATION
  vstdate := SYSDATE;
  DELETE FROM PIBICSDM2.WLRELATION WHERE WLCD IN (
    SELECT WLCD FROM PIBICSDM2.WATCHLISTLOG 
        WHERE TO_CHAR(LOGDTE,'dd/mm/yyyy') = v_dstart2 AND LOGFLAG = 'D'
  );
  var_rows := SQL%ROWCOUNT;
  veddate := SYSDATE;
  INSERT INTO IMPORT_LOG
        VALUES ('WLRELATION_D_M', var_rows, SYSDATE);
  INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('WLRELATION_D_M', var_rows, SYSDATE,
                v_dstart2, v_dstart2, vstdate, veddate);
  COMMIT;
  
  --WLREMARK
  vstdate := SYSDATE;
  DELETE FROM PIBICSDM2.WLREMARK WHERE WLCD IN (
    SELECT WLCD FROM PIBICSDM2.WATCHLISTLOG 
        WHERE TO_CHAR(LOGDTE,'dd/mm/yyyy') = v_dstart2 AND LOGFLAG = 'D'
  );
  var_rows := SQL%ROWCOUNT;
  veddate := SYSDATE;
  INSERT INTO IMPORT_LOG
        VALUES ('WLREMARK_D_M', var_rows, SYSDATE);
  INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('WLREMARK_D_M', var_rows, SYSDATE,
                v_dstart2, v_dstart2, vstdate, veddate);
  COMMIT;
  
  /*IF (settype2 = '' OR settype2 IS NULL) THEN settype2 := 'N';
  END IF;
 
  UPDATE DL_BLACKLIST.BLACKLIST_CASES SET IS_ACTIVE = settype2 WHERE CASE_NUMBER IN (
    SELECT WLCD FROM PIBICSDM2.WATCHLISTLOG 
        WHERE TO_CHAR(LOGDTE,'dd/mm/yyyy') = v_dstart AND LOGFLAG = 'D'
  );
  COMMIT;*/
  
END P_DELETE_WATCHLIST_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_DELETE_WATCHLIST_M" TO "BIOSAADM";
