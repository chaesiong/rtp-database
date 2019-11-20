CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_AGCCONTACT_M" (v_dstart varchar2,v_dend varchar2)
IS

 var_rows NUMBER;
 vstdate DATE;
 veddate DATE;
 
BEGIN
 /* Create date : 10-6-2109 */
 --v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
 --v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

 vstdate :=sysdate;


 MERGE INTO PIBICSDM2.AGCCONTACT DM
  USING (SELECT * 
     FROM PIBICS.AGCCONTACT@PIBICS_PROD
     WHERE CREATE_DATE >= TO_DATE(v_dstart,'yyyymmdd')
      AND CREATE_DATE < TO_DATE(v_dend,'yyyymmdd')
      AND UPDATE_DATE IS NULL) P
  ON (DM.AGCCONT_SEQNO = P.AGCCONT_SEQNO)
 WHEN MATCHED 
 THEN 
  UPDATE SET      DM.AGCCONTCD = P.AGCCONTCD,
     DM.AGCCONTNM = P.AGCCONTNM,
     DM.AGCCONTFLAG = P.AGCCONTFLAG,
     DM.CREATE_BY = P.CREATE_BY,
     DM.CREATE_DATE = P.CREATE_DATE,
     DM.UPDATE_BY = P.UPDATE_BY,
     DM.UPDATE_DATE = P.UPDATE_DATE,
     DM.VERSION = P.VERSION,
     DM.SORT = P.SORT
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.AGCCONT_SEQNO,
     DM.AGCCONTCD,
     DM.AGCCONTNM,
     DM.AGCCONTFLAG,
     DM.CREATE_BY,
     DM.CREATE_DATE,
     DM.UPDATE_BY,
     DM.UPDATE_DATE,
     DM.VERSION,
     DM.SORT) 
  VALUES (     P.AGCCONT_SEQNO,
     P.AGCCONTCD,
     P.AGCCONTNM,
     P.AGCCONTFLAG,
     P.CREATE_BY,
     P.CREATE_DATE,
     P.UPDATE_BY,
     P.UPDATE_DATE,
     P.VERSION,
     P.SORT);



 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG
  VALUES ('AGCCONTACT_C_M', var_rows, SYSDATE);
 veddate :=sysdate;
 INSERT INTO IMPORT_LOG_DETAIL 
 VALUES ('AGCCONTACT_C_M', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);

 COMMIT;




 vstdate :=sysdate;


 MERGE INTO PIBICSDM2.AGCCONTACT DM
  USING (SELECT * 
     FROM PIBICS.AGCCONTACT@PIBICS_PROD
     WHERE UPDATE_DATE >= TO_DATE(v_dstart,'yyyymmdd')
      AND UPDATE_DATE < TO_DATE(v_dend,'yyyymmdd')) P
  ON (DM.AGCCONT_SEQNO = P.AGCCONT_SEQNO)
 WHEN MATCHED 
 THEN 
  UPDATE SET      DM.AGCCONTCD = P.AGCCONTCD,
     DM.AGCCONTNM = P.AGCCONTNM,
     DM.AGCCONTFLAG = P.AGCCONTFLAG,
     DM.CREATE_BY = P.CREATE_BY,
     DM.CREATE_DATE = P.CREATE_DATE,
     DM.UPDATE_BY = P.UPDATE_BY,
     DM.UPDATE_DATE = P.UPDATE_DATE,
     DM.VERSION = P.VERSION,
     DM.SORT = P.SORT
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.AGCCONT_SEQNO,
     DM.AGCCONTCD,
     DM.AGCCONTNM,
     DM.AGCCONTFLAG,
     DM.CREATE_BY,
     DM.CREATE_DATE,
     DM.UPDATE_BY,
     DM.UPDATE_DATE,
     DM.VERSION,
     DM.SORT) 
VALUES (     P.AGCCONT_SEQNO,
     P.AGCCONTCD,
     P.AGCCONTNM,
     P.AGCCONTFLAG,
     P.CREATE_BY,
     P.CREATE_DATE,
     P.UPDATE_BY,
     P.UPDATE_DATE,
     P.VERSION,
     P.SORT);



 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG
  VALUES ('AGCCONTACT_U_M', var_rows, SYSDATE);
 veddate :=sysdate;
 INSERT INTO IMPORT_LOG_DETAIL 
 VALUES ('AGCCONTACT_U_M', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);

 COMMIT;


EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
  NULL;
 WHEN OTHERS
 THEN
 -- Consider logging the error and then re-raise
  RAISE;
END P_AGCCONTACT_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_AGCCONTACT_M" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_AGCCONTACT_M" TO "BIOSAADM";
