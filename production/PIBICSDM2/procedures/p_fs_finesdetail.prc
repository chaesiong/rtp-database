CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_FS_FINESDETAIL" 
IS
   v_dstart   VARCHAR2 (15);
   v_dend     VARCHAR2 (15);
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /*   Create date : 27-01-2019    */
   --No.4
   v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.FS_FINESDETAIL DM
        USING (SELECT *
                 FROM PIBICS.FS_FINESDETAIL@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.FINESDETAIL_SEQNO = P.FINESDETAIL_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.FINES_SEQNO = P.FINES_SEQNO,
                 DM.PRATE_SEQNO = P.PRATE_SEQNO,
                 DM.FINESLIPAMOUNT = P.FINESLIPAMOUNT,
                 DM.OVERSTAYDAY = P.OVERSTAYDAY,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.CREATE_IP = P.CREATE_IP,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.UPDATE_IP = P.UPDATE_IP,
                 DM.VERSION = P.VERSION
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.FINESDETAIL_SEQNO,
                  DM.FINES_SEQNO,
                  DM.PRATE_SEQNO,
                  DM.FINESLIPAMOUNT,
                  DM.OVERSTAYDAY,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.CREATE_IP,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.UPDATE_IP,
                  DM.VERSION)
          VALUES (P.FINESDETAIL_SEQNO,
                  P.FINES_SEQNO,
                  P.PRATE_SEQNO,
                  P.FINESLIPAMOUNT,
                  P.OVERSTAYDAY,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.CREATE_IP,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.UPDATE_IP,
                  P.VERSION);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('FS_FINESDETAIL_C', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('FS_FINESDETAIL_C',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;


   MERGE INTO PIBICSDM2.FS_FINESDETAIL DM
        USING (SELECT *
                 FROM PIBICS.FS_FINESDETAIL@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.FINESDETAIL_SEQNO = P.FINESDETAIL_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.FINES_SEQNO = P.FINES_SEQNO,
                 DM.PRATE_SEQNO = P.PRATE_SEQNO,
                 DM.FINESLIPAMOUNT = P.FINESLIPAMOUNT,
                 DM.OVERSTAYDAY = P.OVERSTAYDAY,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.CREATE_IP = P.CREATE_IP,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.UPDATE_IP = P.UPDATE_IP,
                 DM.VERSION = P.VERSION
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.FINESDETAIL_SEQNO,
                  DM.FINES_SEQNO,
                  DM.PRATE_SEQNO,
                  DM.FINESLIPAMOUNT,
                  DM.OVERSTAYDAY,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.CREATE_IP,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.UPDATE_IP,
                  DM.VERSION)
          VALUES (P.FINESDETAIL_SEQNO,
                  P.FINES_SEQNO,
                  P.PRATE_SEQNO,
                  P.FINESLIPAMOUNT,
                  P.OVERSTAYDAY,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.CREATE_IP,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.UPDATE_IP,
                  P.VERSION);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('FS_FINESDETAIL_U', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('FS_FINESDETAIL_U',
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
END P_FS_FINESDETAIL;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_FS_FINESDETAIL" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_FS_FINESDETAIL" TO "BIOSAADM";
