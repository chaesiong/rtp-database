CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_GUARTDEPT" 
IS
   v_dstart   VARCHAR2 (15);
   v_dend     VARCHAR2 (15);
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /* Create date : 24-1-2109 */
   v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.GUARTDEPT DM
        USING (SELECT *
                 FROM PIBICS.GUARTDEPT@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.GUARTDEPT_SEQNO = P.GUARTDEPT_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.COMNM = P.COMNM,
                 DM.AMOUNT = P.AMOUNT,
                 DM.AMOUNTLEFT = P.AMOUNTLEFT,
                 DM.ADDR = P.ADDR,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.ACTFLAG = P.ACTFLAG,
                 DM.COMCD = P.COMCD,
                 DM.PV_SEQNO = P.PV_SEQNO,
                 DM.AMP_SEQNO = P.AMP_SEQNO,
                 DM.TMB_SEQNO = P.TMB_SEQNO
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.GUARTDEPT_SEQNO,
                  DM.DEPT_SEQNO,
                  DM.COMNM,
                  DM.AMOUNT,
                  DM.AMOUNTLEFT,
                  DM.ADDR,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.ACTFLAG,
                  DM.COMCD,
                  DM.PV_SEQNO,
                  DM.AMP_SEQNO,
                  DM.TMB_SEQNO)
          VALUES (P.GUARTDEPT_SEQNO,
                  P.DEPT_SEQNO,
                  P.COMNM,
                  P.AMOUNT,
                  P.AMOUNTLEFT,
                  P.ADDR,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.ACTFLAG,
                  P.COMCD,
                  P.PV_SEQNO,
                  P.AMP_SEQNO,
                  P.TMB_SEQNO);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('GUARTDEPT_C', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('GUARTDEPT_C',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;



   MERGE INTO PIBICSDM2.GUARTDEPT DM
        USING (SELECT *
                 FROM PIBICS.GUARTDEPT@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.GUARTDEPT_SEQNO = P.GUARTDEPT_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.COMNM = P.COMNM,
                 DM.AMOUNT = P.AMOUNT,
                 DM.AMOUNTLEFT = P.AMOUNTLEFT,
                 DM.ADDR = P.ADDR,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.ACTFLAG = P.ACTFLAG,
                 DM.COMCD = P.COMCD,
                 DM.PV_SEQNO = P.PV_SEQNO,
                 DM.AMP_SEQNO = P.AMP_SEQNO,
                 DM.TMB_SEQNO = P.TMB_SEQNO
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.GUARTDEPT_SEQNO,
                  DM.DEPT_SEQNO,
                  DM.COMNM,
                  DM.AMOUNT,
                  DM.AMOUNTLEFT,
                  DM.ADDR,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.ACTFLAG,
                  DM.COMCD,
                  DM.PV_SEQNO,
                  DM.AMP_SEQNO,
                  DM.TMB_SEQNO)
          VALUES (P.GUARTDEPT_SEQNO,
                  P.DEPT_SEQNO,
                  P.COMNM,
                  P.AMOUNT,
                  P.AMOUNTLEFT,
                  P.ADDR,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.ACTFLAG,
                  P.COMCD,
                  P.PV_SEQNO,
                  P.AMP_SEQNO,
                  P.TMB_SEQNO);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('GUARTDEPT_U', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('GUARTDEPT_U',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      NULL;
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END P_GUARTDEPT;
/
