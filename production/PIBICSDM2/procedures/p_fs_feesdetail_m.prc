CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_FS_FEESDETAIL_M" (v_dstart varchar2,v_dend varchar2)
IS
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /*   Create date : 27-01-2018    */
   --No.2
   --v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   --v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.FS_FEESDETAIL DM
        USING (SELECT *
                 FROM PIBICS.FS_FEESDETAIL@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.FEESDETAIL_SEQNO = P.FEESDETAIL_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.PRATE_SEQNO = P.PRATE_SEQNO,
                 DM.FEES_SEQNO = P.FEES_SEQNO,
                 DM.FEESLIPAMOUNT = P.FEESLIPAMOUNT,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.CREATE_IP = P.CREATE_IP,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.UPDATE_IP = P.UPDATE_IP,
                 DM.VERSION = P.VERSION
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.FEESDETAIL_SEQNO,
                  DM.PRATE_SEQNO,
                  DM.FEES_SEQNO,
                  DM.FEESLIPAMOUNT,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.CREATE_IP,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.UPDATE_IP,
                  DM.VERSION)
          VALUES (P.FEESDETAIL_SEQNO,
                  P.PRATE_SEQNO,
                  P.FEES_SEQNO,
                  P.FEESLIPAMOUNT,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.CREATE_IP,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.UPDATE_IP,
                  P.VERSION);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('FS_FEESDETAIL_C_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('FS_FEESDETAIL_C_M',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;



   MERGE INTO PIBICSDM2.FS_FEESDETAIL DM
        USING (SELECT *
                 FROM PIBICS.FS_FEESDETAIL@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.FEESDETAIL_SEQNO = P.FEESDETAIL_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.PRATE_SEQNO = P.PRATE_SEQNO,
                 DM.FEES_SEQNO = P.FEES_SEQNO,
                 DM.FEESLIPAMOUNT = P.FEESLIPAMOUNT,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.CREATE_IP = P.CREATE_IP,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.UPDATE_IP = P.UPDATE_IP,
                 DM.VERSION = P.VERSION
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.FEESDETAIL_SEQNO,
                  DM.PRATE_SEQNO,
                  DM.FEES_SEQNO,
                  DM.FEESLIPAMOUNT,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.CREATE_IP,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.UPDATE_IP,
                  DM.VERSION)
          VALUES (P.FEESDETAIL_SEQNO,
                  P.PRATE_SEQNO,
                  P.FEES_SEQNO,
                  P.FEESLIPAMOUNT,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.CREATE_IP,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.UPDATE_IP,
                  P.VERSION);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('FS_FEESDETAIL_U_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('FS_FEESDETAIL_U_M',
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
END P_FS_FEESDETAIL_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_FS_FEESDETAIL_M" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_FS_FEESDETAIL_M" TO "BIOSAADM";
