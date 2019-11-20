CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_GUARTBANK_M" (v_dstart varchar,v_dend varchar)
IS
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
   
BEGIN

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.GUARTBANK DM
        USING (SELECT *
                 FROM PIBICS.GUARTBANK@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE <= TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.GUARTBANK_SEQNO = P.GUARTBANK_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.GUARTDEPT_SEQNO = P.GUARTDEPT_SEQNO,
                 DM.BANKNM = P.BANKNM,
                 DM.BANKDESC = P.BANKDESC,
                 DM.AMOUNT = P.AMOUNT,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.ACTFLAG = P.ACTFLAG
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.GUARTBANK_SEQNO,
                  DM.GUARTDEPT_SEQNO,
                  DM.BANKNM,
                  DM.BANKDESC,
                  DM.AMOUNT,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.ACTFLAG)
          VALUES (P.GUARTBANK_SEQNO,
                  P.GUARTDEPT_SEQNO,
                  P.BANKNM,
                  P.BANKDESC,
                  P.AMOUNT,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.ACTFLAG);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('GUARTBANK_C_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('GUARTBANK_C_M',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;


   MERGE INTO PIBICSDM2.GUARTBANK DM
        USING (SELECT *
                 FROM PIBICS.GUARTBANK@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE <= TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.GUARTBANK_SEQNO = P.GUARTBANK_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.GUARTDEPT_SEQNO = P.GUARTDEPT_SEQNO,
                 DM.BANKNM = P.BANKNM,
                 DM.BANKDESC = P.BANKDESC,
                 DM.AMOUNT = P.AMOUNT,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.ACTFLAG = P.ACTFLAG
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.GUARTBANK_SEQNO,
                  DM.GUARTDEPT_SEQNO,
                  DM.BANKNM,
                  DM.BANKDESC,
                  DM.AMOUNT,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.ACTFLAG)
          VALUES (P.GUARTBANK_SEQNO,
                  P.GUARTDEPT_SEQNO,
                  P.BANKNM,
                  P.BANKDESC,
                  P.AMOUNT,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.ACTFLAG);

   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG    VALUES ('GUARTBANK_U_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL 
        VALUES ('GUARTBANK_U_M',
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
END P_GUARTBANK_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_GUARTBANK_M" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_GUARTBANK_M" TO "BIOSAADM";
