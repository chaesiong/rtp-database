CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_FACT_ATCHANNEL" (p_stdate varchar2,p_eddate varchar2)
AS
   v_stdate VARCHAR2 (15);
   v_eddate VARCHAR2 (15);
   var_rows   NUMBER;
   log_stdate    DATE;
   log_eddate    DATE;
BEGIN
   /* Create date : 6-12-2108 */

   log_stdate := SYSDATE;
   
   v_stdate := p_stdate;
   v_eddate := p_eddate;

   IF v_stdate IS NULL THEN
   v_stdate := TO_CHAR (SYSDATE - 1, 'yyyymmdd');
   END IF;
   IF v_eddate IS NULL THEN
   v_eddate := TO_CHAR (SYSDATE , 'yyyymmdd');
   END IF;

 MERGE INTO PIBICSDM2.FACT_ATCHANNEL DM
  USING (SELECT * 
     FROM PIBICS.FACT_ATCHANNEL@PIBICS_PROD
     WHERE INOUTDATE >= TO_DATE(v_stdate,'yyyymmdd')
      AND INOUTDATE < TO_DATE(v_eddate,'yyyymmdd')) P
  ON (DM.AT_SEQNO = P.AT_SEQNO)
 WHEN MATCHED 
 THEN 
  UPDATE SET      DM.INOUTDATE = P.INOUTDATE,
     DM.IN_EAST = P.IN_EAST,
     DM.IN_WEST = P.IN_WEST,
     DM.OUT_EAST = P.OUT_EAST,
     DM.OUT_WEST = P.OUT_WEST,
     DM.DEPT_SEQNO = P.DEPT_SEQNO
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.AT_SEQNO,
     DM.INOUTDATE,
     DM.IN_EAST,
     DM.IN_WEST,
     DM.OUT_EAST,
     DM.OUT_WEST,
     DM.DEPT_SEQNO) 
  VALUES (     P.AT_SEQNO,
     P.INOUTDATE,
     P.IN_EAST,
     P.IN_WEST,
     P.OUT_EAST,
     P.OUT_WEST,
     P.DEPT_SEQNO);

 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG
  VALUES ('FACT_ATCHANNEL_C', var_rows, SYSDATE);
 log_eddate :=sysdate;
 INSERT INTO IMPORT_LOG_DETAIL 
 VALUES ('FACT_ATCHANNEL_C', var_rows,SYSDATE,v_stdate,v_eddate,log_stdate,log_eddate);

 COMMIT;


EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
  NULL;
 WHEN OTHERS
 THEN
 -- Consider logging the error and then re-raise
  RAISE;
END P_FACT_ATCHANNEL;
/
