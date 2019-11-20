CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_FLIGHTNUMBERS_M" (v_dstart varchar2,v_dend varchar2)
IS
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /* Create date : 10-12-2108 */
   --v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   --v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.FLIGHTNUMBERS DM
        USING (SELECT *
                 FROM PIBICS.FLIGHTNUMBERS@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.FLIGHTSEQNO = P.FLIGHTSEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.FLIGHTPREFIX = P.FLIGHTPREFIX,
                 DM.FLIGHTNUMBER = P.FLIGHTNUMBER,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.ALLFLAG = P.ALLFLAG,
                 DM.CARDTYPE = P.CARDTYPE,
                 DM.FLIGHTSTARTDTE = P.FLIGHTSTARTDTE,
                 DM.FLIGHTENDDTE = P.FLIGHTENDDTE,
                 DM.ACTFLAG = P.ACTFLAG,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.FLIGHT_TYPE = P.FLIGHT_TYPE,
                 DM.HEALTHFLAG = P.HEALTHFLAG
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.FLIGHTSEQNO,
                  DM.FLIGHTPREFIX,
                  DM.FLIGHTNUMBER,
                  DM.DEPT_SEQNO,
                  DM.ALLFLAG,
                  DM.CARDTYPE,
                  DM.FLIGHTSTARTDTE,
                  DM.FLIGHTENDDTE,
                  DM.ACTFLAG,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.FLIGHT_TYPE,
                  DM.HEALTHFLAG)
          VALUES (P.FLIGHTSEQNO,
                  P.FLIGHTPREFIX,
                  P.FLIGHTNUMBER,
                  P.DEPT_SEQNO,
                  P.ALLFLAG,
                  P.CARDTYPE,
                  P.FLIGHTSTARTDTE,
                  P.FLIGHTENDDTE,
                  P.ACTFLAG,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.FLIGHT_TYPE,
                  P.HEALTHFLAG);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('FLIGHTNUMBERS_C_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('FLIGHTNUMBERS_C_M',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;



   MERGE INTO PIBICSDM2.FLIGHTNUMBERS DM
        USING (SELECT *
                 FROM PIBICS.FLIGHTNUMBERS@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.FLIGHTSEQNO = P.FLIGHTSEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.FLIGHTPREFIX = P.FLIGHTPREFIX,
                 DM.FLIGHTNUMBER = P.FLIGHTNUMBER,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.ALLFLAG = P.ALLFLAG,
                 DM.CARDTYPE = P.CARDTYPE,
                 DM.FLIGHTSTARTDTE = P.FLIGHTSTARTDTE,
                 DM.FLIGHTENDDTE = P.FLIGHTENDDTE,
                 DM.ACTFLAG = P.ACTFLAG,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.FLIGHT_TYPE = P.FLIGHT_TYPE,
                 DM.HEALTHFLAG = P.HEALTHFLAG
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.FLIGHTSEQNO,
                  DM.FLIGHTPREFIX,
                  DM.FLIGHTNUMBER,
                  DM.DEPT_SEQNO,
                  DM.ALLFLAG,
                  DM.CARDTYPE,
                  DM.FLIGHTSTARTDTE,
                  DM.FLIGHTENDDTE,
                  DM.ACTFLAG,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.FLIGHT_TYPE,
                  DM.HEALTHFLAG)
          VALUES (P.FLIGHTSEQNO,
                  P.FLIGHTPREFIX,
                  P.FLIGHTNUMBER,
                  P.DEPT_SEQNO,
                  P.ALLFLAG,
                  P.CARDTYPE,
                  P.FLIGHTSTARTDTE,
                  P.FLIGHTENDDTE,
                  P.ACTFLAG,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.FLIGHT_TYPE,
                  P.HEALTHFLAG);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('FLIGHTNUMBERS_U_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('FLIGHTNUMBERS_U_M',
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
END P_FLIGHTNUMBERS_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_FLIGHTNUMBERS_M" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_FLIGHTNUMBERS_M" TO "BIOSAADM";
