CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_OCCUPATION" 
IS
 v_dstart VARCHAR2 (15);
 v_dend VARCHAR2 (15);
 var_rows NUMBER;
 vstdate DATE;
 veddate DATE;

BEGIN
 /* Create date : 10-6-2109 */
 v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
 v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

 vstdate :=sysdate;


 MERGE INTO PIBICSDM2.OCCUPATION DM
  USING (SELECT * 
     FROM PIBICS.OCCUPATION@PIBICS_PROD
     WHERE CREATE_DATE >= TO_DATE(v_dstart,'yyyymmdd')
      AND CREATE_DATE < TO_DATE(v_dend,'yyyymmdd')
      AND UPDATE_DATE IS NULL) P
  ON (DM.OCC_SEQNO = P.OCC_SEQNO)
 WHEN MATCHED 
 THEN 
  UPDATE SET      DM.OCCCD = P.OCCCD,
     DM.OCCTNM = P.OCCTNM,
     DM.OCCENM = P.OCCENM,
     DM.ACTFLAG = P.ACTFLAG,
     DM.CREATE_BY = P.CREATE_BY,
     DM.CREATE_DATE = P.CREATE_DATE,
     DM.UPDATE_BY = P.UPDATE_BY,
     DM.UPDATE_DATE = P.UPDATE_DATE,
     DM.VERSION = P.VERSION
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.OCC_SEQNO,
     DM.OCCCD,
     DM.OCCTNM,
     DM.OCCENM,
     DM.ACTFLAG,
     DM.CREATE_BY,
     DM.CREATE_DATE,
     DM.UPDATE_BY,
     DM.UPDATE_DATE,
     DM.VERSION) 
  VALUES (     P.OCC_SEQNO,
     P.OCCCD,
     P.OCCTNM,
     P.OCCENM,
     P.ACTFLAG,
     P.CREATE_BY,
     P.CREATE_DATE,
     P.UPDATE_BY,
     P.UPDATE_DATE,
     P.VERSION);



 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG
  VALUES ('OCCUPATION_C', var_rows, SYSDATE);
 veddate :=sysdate;
 INSERT INTO IMPORT_LOG_DETAIL 
 VALUES ('OCCUPATION_C', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);

 COMMIT;




 vstdate :=sysdate;


 MERGE INTO PIBICSDM2.OCCUPATION DM
  USING (SELECT * 
     FROM PIBICS.OCCUPATION@PIBICS_PROD
     WHERE UPDATE_DATE >= TO_DATE(v_dstart,'yyyymmdd')
      AND UPDATE_DATE < TO_DATE(v_dend,'yyyymmdd')) P
  ON (DM.OCC_SEQNO = P.OCC_SEQNO)
 WHEN MATCHED 
 THEN 
  UPDATE SET      DM.OCCCD = P.OCCCD,
     DM.OCCTNM = P.OCCTNM,
     DM.OCCENM = P.OCCENM,
     DM.ACTFLAG = P.ACTFLAG,
     DM.CREATE_BY = P.CREATE_BY,
     DM.CREATE_DATE = P.CREATE_DATE,
     DM.UPDATE_BY = P.UPDATE_BY,
     DM.UPDATE_DATE = P.UPDATE_DATE,
     DM.VERSION = P.VERSION
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.OCC_SEQNO,
     DM.OCCCD,
     DM.OCCTNM,
     DM.OCCENM,
     DM.ACTFLAG,
     DM.CREATE_BY,
     DM.CREATE_DATE,
     DM.UPDATE_BY,
     DM.UPDATE_DATE,
     DM.VERSION) 
VALUES (     P.OCC_SEQNO,
     P.OCCCD,
     P.OCCTNM,
     P.OCCENM,
     P.ACTFLAG,
     P.CREATE_BY,
     P.CREATE_DATE,
     P.UPDATE_BY,
     P.UPDATE_DATE,
     P.VERSION);



 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG
  VALUES ('OCCUPATION_U', var_rows, SYSDATE);
 veddate :=sysdate;
 INSERT INTO IMPORT_LOG_DETAIL 
 VALUES ('OCCUPATION_U', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);

 COMMIT;


EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
  NULL;
 WHEN OTHERS
 THEN
 -- Consider logging the error and then re-raise
  RAISE;
END P_OCCUPATION;
/
