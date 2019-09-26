CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_OPERATIONREF_M" (v_dstart varchar2,v_dend varchar2)
IS

 var_rows NUMBER;
 vstdate DATE;
 veddate DATE;

BEGIN
 /* Create date : 10-6-2109 */
 --v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
 --v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

 vstdate :=sysdate;


 MERGE INTO PIBICSDM2.OPERATIONREF DM
  USING (SELECT * 
     FROM PIBICS.OPERATIONREF@PIBICS_PROD
     WHERE CREATE_DATE >= TO_DATE(v_dstart,'yyyymmdd')
      AND CREATE_DATE < TO_DATE(v_dend,'yyyymmdd')
      AND UPDATE_DATE IS NULL) P
  ON (DM.OPER_SEQNO = P.OPER_SEQNO)
 WHEN MATCHED 
 THEN 
  UPDATE SET      DM.OPERCD = P.OPERCD,
     DM.OPERREF = P.OPERREF,
     DM.OPERFLAG = P.OPERFLAG,
     DM.CREATE_BY = P.CREATE_BY,
     DM.CREATE_DATE = P.CREATE_DATE,
     DM.UPDATE_BY = P.UPDATE_BY,
     DM.UPDATE_DATE = P.UPDATE_DATE,
     DM.VERSION = P.VERSION
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.OPER_SEQNO,
     DM.OPERCD,
     DM.OPERREF,
     DM.OPERFLAG,
     DM.CREATE_BY,
     DM.CREATE_DATE,
     DM.UPDATE_BY,
     DM.UPDATE_DATE,
     DM.VERSION) 
  VALUES (     P.OPER_SEQNO,
     P.OPERCD,
     P.OPERREF,
     P.OPERFLAG,
     P.CREATE_BY,
     P.CREATE_DATE,
     P.UPDATE_BY,
     P.UPDATE_DATE,
     P.VERSION);



 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG
  VALUES ('OPERATIONREF_C_M', var_rows, SYSDATE);
 veddate :=sysdate;
 INSERT INTO IMPORT_LOG_DETAIL 
 VALUES ('OPERATIONREF_C_M', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);

 COMMIT;




 vstdate :=sysdate;


 MERGE INTO PIBICSDM2.OPERATIONREF DM
  USING (SELECT * 
     FROM PIBICS.OPERATIONREF@PIBICS_PROD
     WHERE UPDATE_DATE >= TO_DATE(v_dstart,'yyyymmdd')
      AND UPDATE_DATE < TO_DATE(v_dend,'yyyymmdd')) P
  ON (DM.OPER_SEQNO = P.OPER_SEQNO)
 WHEN MATCHED 
 THEN 
  UPDATE SET      DM.OPERCD = P.OPERCD,
     DM.OPERREF = P.OPERREF,
     DM.OPERFLAG = P.OPERFLAG,
     DM.CREATE_BY = P.CREATE_BY,
     DM.CREATE_DATE = P.CREATE_DATE,
     DM.UPDATE_BY = P.UPDATE_BY,
     DM.UPDATE_DATE = P.UPDATE_DATE,
     DM.VERSION = P.VERSION
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.OPER_SEQNO,
     DM.OPERCD,
     DM.OPERREF,
     DM.OPERFLAG,
     DM.CREATE_BY,
     DM.CREATE_DATE,
     DM.UPDATE_BY,
     DM.UPDATE_DATE,
     DM.VERSION) 
VALUES (     P.OPER_SEQNO,
     P.OPERCD,
     P.OPERREF,
     P.OPERFLAG,
     P.CREATE_BY,
     P.CREATE_DATE,
     P.UPDATE_BY,
     P.UPDATE_DATE,
     P.VERSION);



 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG
  VALUES ('OPERATIONREF_U_M', var_rows, SYSDATE);
 veddate :=sysdate;
 INSERT INTO IMPORT_LOG_DETAIL 
 VALUES ('OPERATIONREF_U_M', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);

 COMMIT;


EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
  NULL;
 WHEN OTHERS
 THEN
 -- Consider logging the error and then re-raise
  RAISE;
END P_OPERATIONREF_M;
/
