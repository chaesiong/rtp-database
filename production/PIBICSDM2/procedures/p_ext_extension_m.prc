CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_EXT_EXTENSION_M" (v_dstart varchar2,v_dend varchar2)
IS
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /*   Create date : 27-01-2018    */
   --No.6
   --v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   --v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.EXT_EXTENSION DM
        USING (SELECT *
                 FROM PIBICS.EXT_EXTENSION@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.EXT_SEQNO = P.EXT_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.DOCNO = P.DOCNO,
                 DM.EXT_DATE = P.EXT_DATE,
                 DM.APPROVE_STS = P.APPROVE_STS,
                 DM.ACTFLAG = P.ACTFLAG,
                 DM.PERMIT_DATE = P.PERMIT_DATE,
                 DM.WAIT_DATE = P.WAIT_DATE,
                 DM.NO_DATE = P.NO_DATE,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.IPADDRESS = P.IPADDRESS,
                 DM.UIPADDRESS = P.UIPADDRESS
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.EXT_SEQNO,
                  DM.DOCNO,
                  DM.EXT_DATE,
                  DM.APPROVE_STS,
                  DM.ACTFLAG,
                  DM.PERMIT_DATE,
                  DM.WAIT_DATE,
                  DM.NO_DATE,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.IPADDRESS,
                  DM.UIPADDRESS)
          VALUES (P.EXT_SEQNO,
                  P.DOCNO,
                  P.EXT_DATE,
                  P.APPROVE_STS,
                  P.ACTFLAG,
                  P.PERMIT_DATE,
                  P.WAIT_DATE,
                  P.NO_DATE,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.IPADDRESS,
                  P.UIPADDRESS);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('EXT_EXTENSION_C_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('EXT_EXTENSION_C_M',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;



   MERGE INTO PIBICSDM2.EXT_EXTENSION DM
        USING (SELECT *
                 FROM PIBICS.EXT_EXTENSION@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.EXT_SEQNO = P.EXT_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.DOCNO = P.DOCNO,
                 DM.EXT_DATE = P.EXT_DATE,
                 DM.APPROVE_STS = P.APPROVE_STS,
                 DM.ACTFLAG = P.ACTFLAG,
                 DM.PERMIT_DATE = P.PERMIT_DATE,
                 DM.WAIT_DATE = P.WAIT_DATE,
                 DM.NO_DATE = P.NO_DATE,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.IPADDRESS = P.IPADDRESS,
                 DM.UIPADDRESS = P.UIPADDRESS
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.EXT_SEQNO,
                  DM.DOCNO,
                  DM.EXT_DATE,
                  DM.APPROVE_STS,
                  DM.ACTFLAG,
                  DM.PERMIT_DATE,
                  DM.WAIT_DATE,
                  DM.NO_DATE,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.IPADDRESS,
                  DM.UIPADDRESS)
          VALUES (P.EXT_SEQNO,
                  P.DOCNO,
                  P.EXT_DATE,
                  P.APPROVE_STS,
                  P.ACTFLAG,
                  P.PERMIT_DATE,
                  P.WAIT_DATE,
                  P.NO_DATE,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.IPADDRESS,
                  P.UIPADDRESS);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('EXT_EXTENSION_U_M', var_rows, SYSDATE);


   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('EXT_EXTENSION_U_M',
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
END P_EXT_EXTENSION_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_EXT_EXTENSION_M" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_EXT_EXTENSION_M" TO "BIOSAADM";
