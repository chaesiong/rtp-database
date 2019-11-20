CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_EDNQ_PERSON_M" (v_dstart varchar2,v_dend varchar2)
IS
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /*   Create date : 27-01-2018    */
   --No.18
   --v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
  -- v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.EDNQ_PERSON DM
        USING (SELECT *
                 FROM PIBICS.EDNQ_PERSON@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.EDNQPERSON_SEQNO = P.EDNQPERSON_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.EFAMILYNM = P.EFAMILYNM,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.TFAMILYNM = P.TFAMILYNM,
                 DM.TFIRSTNM = P.TFIRSTNM,
                 DM.TMIDDLENM = P.TMIDDLENM,
                 DM.SEX = P.SEX,
                 DM.BIRTH_DATE = P.BIRTH_DATE,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.PASSPORTNO = P.PASSPORTNO,
                 DM.PASSPORT_DATE = P.PASSPORT_DATE,
                 DM.PASSPORTEXP_DATE = P.PASSPORTEXP_DATE,
                 DM.PERMIT_SEQNO = P.PERMIT_SEQNO,
                 DM.EDMEXP_DATE = P.EDMEXP_DATE,
                 DM.EDMISSUE_BY = P.EDMISSUE_BY,
                 DM.EDMISSUE_DATE = P.EDMISSUE_DATE,
                 DM.TM13_SEQNO = P.TM13_SEQNO,
                 DM.TM13NO = P.TM13NO,
                 DM.TM13YEAR = P.TM13YEAR,
                 DM.TM13STS = P.TM13STS,
                 DM.TM22_SEQNO = P.TM22_SEQNO,
                 DM.TM22NO = P.TM22NO,
                 DM.TM22YEAR = P.TM22YEAR,
                 DM.TM22STS = P.TM22STS,
                 DM.RESCERTTYPE_SEQNO = P.RESCERTTYPE_SEQNO,
                 DM.RCNO_PVCD = P.RCNO_PVCD,
                 DM.RCNO_RUNNINGNO = P.RCNO_RUNNINGNO,
                 DM.RCNO_YEAR = P.RCNO_YEAR,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.CERTOFRESIDENCE_SEQNO = P.CERTOFRESIDENCE_SEQNO,
                 DM.NQISSUE_DATE = P.NQISSUE_DATE,
                 DM.NQISSUE_BY = P.NQISSUE_BY,
                 DM.TM22TYPE = P.TM22TYPE,
                 DM.STATUSEDNQ = P.STATUSEDNQ,
                 DM.STATUSEDNQDTE = P.STATUSEDNQDTE,
                 DM.OCC_DETAIL = P.OCC_DETAIL
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.EDNQPERSON_SEQNO,
                  DM.EFAMILYNM,
                  DM.EFIRSTNM,
                  DM.EMIDDLENM,
                  DM.TFAMILYNM,
                  DM.TFIRSTNM,
                  DM.TMIDDLENM,
                  DM.SEX,
                  DM.BIRTH_DATE,
                  DM.NATION_SEQNO,
                  DM.PASSPORTNO,
                  DM.PASSPORT_DATE,
                  DM.PASSPORTEXP_DATE,
                  DM.PERMIT_SEQNO,
                  DM.EDMEXP_DATE,
                  DM.EDMISSUE_BY,
                  DM.EDMISSUE_DATE,
                  DM.TM13_SEQNO,
                  DM.TM13NO,
                  DM.TM13YEAR,
                  DM.TM13STS,
                  DM.TM22_SEQNO,
                  DM.TM22NO,
                  DM.TM22YEAR,
                  DM.TM22STS,
                  DM.RESCERTTYPE_SEQNO,
                  DM.RCNO_PVCD,
                  DM.RCNO_RUNNINGNO,
                  DM.RCNO_YEAR,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.CERTOFRESIDENCE_SEQNO,
                  DM.NQISSUE_DATE,
                  DM.NQISSUE_BY,
                  DM.TM22TYPE,
                  DM.STATUSEDNQ,
                  DM.STATUSEDNQDTE,
                  DM.OCC_DETAIL)
          VALUES (P.EDNQPERSON_SEQNO,
                  P.EFAMILYNM,
                  P.EFIRSTNM,
                  P.EMIDDLENM,
                  P.TFAMILYNM,
                  P.TFIRSTNM,
                  P.TMIDDLENM,
                  P.SEX,
                  P.BIRTH_DATE,
                  P.NATION_SEQNO,
                  P.PASSPORTNO,
                  P.PASSPORT_DATE,
                  P.PASSPORTEXP_DATE,
                  P.PERMIT_SEQNO,
                  P.EDMEXP_DATE,
                  P.EDMISSUE_BY,
                  P.EDMISSUE_DATE,
                  P.TM13_SEQNO,
                  P.TM13NO,
                  P.TM13YEAR,
                  P.TM13STS,
                  P.TM22_SEQNO,
                  P.TM22NO,
                  P.TM22YEAR,
                  P.TM22STS,
                  P.RESCERTTYPE_SEQNO,
                  P.RCNO_PVCD,
                  P.RCNO_RUNNINGNO,
                  P.RCNO_YEAR,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.CERTOFRESIDENCE_SEQNO,
                  P.NQISSUE_DATE,
                  P.NQISSUE_BY,
                  P.TM22TYPE,
                  P.STATUSEDNQ,
                  P.STATUSEDNQDTE,
                  P.OCC_DETAIL);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('EDNQ_PERSON_C_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('EDNQ_PERSON_C_M',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;


   MERGE INTO PIBICSDM2.EDNQ_PERSON DM
        USING (SELECT *
                 FROM PIBICS.EDNQ_PERSON@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.EDNQPERSON_SEQNO = P.EDNQPERSON_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.EFAMILYNM = P.EFAMILYNM,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.TFAMILYNM = P.TFAMILYNM,
                 DM.TFIRSTNM = P.TFIRSTNM,
                 DM.TMIDDLENM = P.TMIDDLENM,
                 DM.SEX = P.SEX,
                 DM.BIRTH_DATE = P.BIRTH_DATE,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.PASSPORTNO = P.PASSPORTNO,
                 DM.PASSPORT_DATE = P.PASSPORT_DATE,
                 DM.PASSPORTEXP_DATE = P.PASSPORTEXP_DATE,
                 DM.PERMIT_SEQNO = P.PERMIT_SEQNO,
                 DM.EDMEXP_DATE = P.EDMEXP_DATE,
                 DM.EDMISSUE_BY = P.EDMISSUE_BY,
                 DM.EDMISSUE_DATE = P.EDMISSUE_DATE,
                 DM.TM13_SEQNO = P.TM13_SEQNO,
                 DM.TM13NO = P.TM13NO,
                 DM.TM13YEAR = P.TM13YEAR,
                 DM.TM13STS = P.TM13STS,
                 DM.TM22_SEQNO = P.TM22_SEQNO,
                 DM.TM22NO = P.TM22NO,
                 DM.TM22YEAR = P.TM22YEAR,
                 DM.TM22STS = P.TM22STS,
                 DM.RESCERTTYPE_SEQNO = P.RESCERTTYPE_SEQNO,
                 DM.RCNO_PVCD = P.RCNO_PVCD,
                 DM.RCNO_RUNNINGNO = P.RCNO_RUNNINGNO,
                 DM.RCNO_YEAR = P.RCNO_YEAR,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.CERTOFRESIDENCE_SEQNO = P.CERTOFRESIDENCE_SEQNO,
                 DM.NQISSUE_DATE = P.NQISSUE_DATE,
                 DM.NQISSUE_BY = P.NQISSUE_BY,
                 DM.TM22TYPE = P.TM22TYPE,
                 DM.STATUSEDNQ = P.STATUSEDNQ,
                 DM.STATUSEDNQDTE = P.STATUSEDNQDTE,
                 DM.OCC_DETAIL = P.OCC_DETAIL
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.EDNQPERSON_SEQNO,
                  DM.EFAMILYNM,
                  DM.EFIRSTNM,
                  DM.EMIDDLENM,
                  DM.TFAMILYNM,
                  DM.TFIRSTNM,
                  DM.TMIDDLENM,
                  DM.SEX,
                  DM.BIRTH_DATE,
                  DM.NATION_SEQNO,
                  DM.PASSPORTNO,
                  DM.PASSPORT_DATE,
                  DM.PASSPORTEXP_DATE,
                  DM.PERMIT_SEQNO,
                  DM.EDMEXP_DATE,
                  DM.EDMISSUE_BY,
                  DM.EDMISSUE_DATE,
                  DM.TM13_SEQNO,
                  DM.TM13NO,
                  DM.TM13YEAR,
                  DM.TM13STS,
                  DM.TM22_SEQNO,
                  DM.TM22NO,
                  DM.TM22YEAR,
                  DM.TM22STS,
                  DM.RESCERTTYPE_SEQNO,
                  DM.RCNO_PVCD,
                  DM.RCNO_RUNNINGNO,
                  DM.RCNO_YEAR,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.CERTOFRESIDENCE_SEQNO,
                  DM.NQISSUE_DATE,
                  DM.NQISSUE_BY,
                  DM.TM22TYPE,
                  DM.STATUSEDNQ,
                  DM.STATUSEDNQDTE,
                  DM.OCC_DETAIL)
          VALUES (P.EDNQPERSON_SEQNO,
                  P.EFAMILYNM,
                  P.EFIRSTNM,
                  P.EMIDDLENM,
                  P.TFAMILYNM,
                  P.TFIRSTNM,
                  P.TMIDDLENM,
                  P.SEX,
                  P.BIRTH_DATE,
                  P.NATION_SEQNO,
                  P.PASSPORTNO,
                  P.PASSPORT_DATE,
                  P.PASSPORTEXP_DATE,
                  P.PERMIT_SEQNO,
                  P.EDMEXP_DATE,
                  P.EDMISSUE_BY,
                  P.EDMISSUE_DATE,
                  P.TM13_SEQNO,
                  P.TM13NO,
                  P.TM13YEAR,
                  P.TM13STS,
                  P.TM22_SEQNO,
                  P.TM22NO,
                  P.TM22YEAR,
                  P.TM22STS,
                  P.RESCERTTYPE_SEQNO,
                  P.RCNO_PVCD,
                  P.RCNO_RUNNINGNO,
                  P.RCNO_YEAR,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.CERTOFRESIDENCE_SEQNO,
                  P.NQISSUE_DATE,
                  P.NQISSUE_BY,
                  P.TM22TYPE,
                  P.STATUSEDNQ,
                  P.STATUSEDNQDTE,
                  P.OCC_DETAIL);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('EDNQ_PERSON_U_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('EDNQ_PERSON_U_M',
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
END P_EDNQ_PERSON_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_EDNQ_PERSON_M" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_EDNQ_PERSON_M" TO "BIOSAADM";
