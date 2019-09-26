CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_REASON_M" (v_dstart varchar2,v_dend varchar2)
IS

 var_rows NUMBER;
 vstdate DATE;
 veddate DATE;

BEGIN
 /* Create date : 10-6-2109 */
 --v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
 --v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

 vstdate :=sysdate;


 MERGE INTO PIBICSDM2.REASON DM
  USING (SELECT * 
     FROM PIBICS.REASON@PIBICS_PROD
     WHERE CREATE_DATE >= TO_DATE(v_dstart,'yyyymmdd')
      AND CREATE_DATE < TO_DATE(v_dend,'yyyymmdd')
      AND UPDATE_DATE IS NULL) P
  ON (DM.REASON_SEQNO = P.REASON_SEQNO)
 WHEN MATCHED 
 THEN 
  UPDATE SET      DM.REASONCD = P.REASONCD,
     DM.REASONNM = P.REASONNM,
     DM.ACTFLAG = P.ACTFLAG,
     DM.CREATE_DATE = P.CREATE_DATE,
     DM.CREATE_BY = P.CREATE_BY,
     DM.UPDATE_DATE = P.UPDATE_DATE,
     DM.UPDATE_BY = P.UPDATE_BY,
     DM.VERSION = P.VERSION
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.REASON_SEQNO,
     DM.REASONCD,
     DM.REASONNM,
     DM.ACTFLAG,
     DM.CREATE_DATE,
     DM.CREATE_BY,
     DM.UPDATE_DATE,
     DM.UPDATE_BY,
     DM.VERSION) 
  VALUES (     P.REASON_SEQNO,
     P.REASONCD,
     P.REASONNM,
     P.ACTFLAG,
     P.CREATE_DATE,
     P.CREATE_BY,
     P.UPDATE_DATE,
     P.UPDATE_BY,
     P.VERSION);



 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG
  VALUES ('REASON_C_M', var_rows, SYSDATE);
 veddate :=sysdate;
 INSERT INTO IMPORT_LOG_DETAIL 
 VALUES ('REASON_C_M', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);

 COMMIT;




 vstdate :=sysdate;


 MERGE INTO PIBICSDM2.REASON DM
  USING (SELECT * 
     FROM PIBICS.REASON@PIBICS_PROD
     WHERE UPDATE_DATE >= TO_DATE(v_dstart,'yyyymmdd')
      AND UPDATE_DATE < TO_DATE(v_dend,'yyyymmdd')) P
  ON (DM.REASON_SEQNO = P.REASON_SEQNO)
 WHEN MATCHED 
 THEN 
  UPDATE SET      DM.REASONCD = P.REASONCD,
     DM.REASONNM = P.REASONNM,
     DM.ACTFLAG = P.ACTFLAG,
     DM.CREATE_DATE = P.CREATE_DATE,
     DM.CREATE_BY = P.CREATE_BY,
     DM.UPDATE_DATE = P.UPDATE_DATE,
     DM.UPDATE_BY = P.UPDATE_BY,
     DM.VERSION = P.VERSION
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.REASON_SEQNO,
     DM.REASONCD,
     DM.REASONNM,
     DM.ACTFLAG,
     DM.CREATE_DATE,
     DM.CREATE_BY,
     DM.UPDATE_DATE,
     DM.UPDATE_BY,
     DM.VERSION) 
VALUES (     P.REASON_SEQNO,
     P.REASONCD,
     P.REASONNM,
     P.ACTFLAG,
     P.CREATE_DATE,
     P.CREATE_BY,
     P.UPDATE_DATE,
     P.UPDATE_BY,
     P.VERSION);



 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG
  VALUES ('REASON_U_M', var_rows, SYSDATE);
 veddate :=sysdate;
 INSERT INTO IMPORT_LOG_DETAIL 
 VALUES ('REASON_U_M', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);

 COMMIT;


EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
  NULL;
 WHEN OTHERS
 THEN
 -- Consider logging the error and then re-raise
  RAISE;
END P_REASON_M;
/
