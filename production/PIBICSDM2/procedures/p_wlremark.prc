CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_WLREMARK" 
IS
 v_dstart VARCHAR2 (15);
 v_dend VARCHAR2 (15);
 var_rows NUMBER;
 vstdate date;
 veddate date;

BEGIN
 /* Create date : 6-12-2108 */
 v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'YYYYMMDD');
 v_dend := TO_CHAR (TRUNC (SYSDATE), 'YYYYMMDD');

  vstdate :=sysdate;

 MERGE INTO PIBICSDM2.WLREMARK DM
  USING (SELECT A.*
     FROM PIBICS.WLREMARK@PIBICS_PROD A
     INNER JOIN PIBICS.WATCHLIST@PIBICS_PROD B
     ON (A.WLCD = B.WLCD)
     WHERE TO_CHAR(B.CREDTE,'YYYYMMDD') >= v_dstart
      AND TO_CHAR(B.CREDTE,'YYYYMMDD') <= v_dend
      AND B.UPDDTE IS NULL) P
  ON (DM.WLCD = P.WLCD AND DM.SEQNO = P.SEQNO)
 WHEN MATCHED 
 THEN 
  UPDATE SET      
     DM.REMK = P.REMK
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.WLCD,
     DM.SEQNO,
     DM.REMK) 
  VALUES (     P.WLCD,
     P.SEQNO,
     P.REMK);



 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG   VALUES ('WLREMARK_C', var_rows, SYSDATE);

  veddate :=sysdate;
  INSERT INTO IMPORT_LOG_DETAIL VALUES ('WLREMARK_C', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);
  COMMIT;
  
  vstdate :=sysdate;

 MERGE INTO PIBICSDM2.WLREMARK DM
  USING (SELECT A.*
     FROM PIBICS.WLREMARK@PIBICS_PROD A
     INNER JOIN PIBICS.WATCHLIST@PIBICS_PROD B
     ON (A.WLCD = B.WLCD)
     WHERE TO_CHAR(B.UPDDTE,'YYYYMMDD') >= v_dstart
      AND TO_CHAR(B.UPDDTE,'YYYYMMDD') <= v_dend) P
  ON (DM.WLCD = P.WLCD AND DM.SEQNO = P.SEQNO)
 WHEN MATCHED 
 THEN 
  UPDATE SET      
     DM.REMK = P.REMK
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.WLCD,
     DM.SEQNO,
     DM.REMK) 
VALUES (     P.WLCD,
     P.SEQNO,
     P.REMK);



 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG   VALUES ('WLREMARK_U', var_rows, SYSDATE);
 
  veddate :=sysdate;
  INSERT INTO IMPORT_LOG_DETAIL VALUES ('WLREMARK_U', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);
  COMMIT;


EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
  NULL;
 WHEN OTHERS
 THEN
 -- Consider logging the error and then re-raise
  RAISE;
END P_WLREMARK;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_WLREMARK" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_WLREMARK" TO "BIOSAADM";
