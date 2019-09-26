CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_RQS_PERSON_M" (v_dstart varchar2,v_dend varchar2)
IS
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /*   Create date : 27-01-2018    */
   --No.19
   --v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   --v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.RQS_PERSON DM
        USING (SELECT *
                 FROM PIBICS.RQS_PERSON@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.RQSPERSON_SEQNO = P.RQSPERSON_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.TM9AND14_SEQNO = P.TM9AND14_SEQNO,
                 DM.OPASSPORTNO = P.OPASSPORTNO,
                 DM.CPASSPORTNO = P.CPASSPORTNO,
                 DM.APPLY_DATE = P.APPLY_DATE,
                 DM.DOCNO = P.DOCNO,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.SEX = P.SEX,
                 DM.BIRTH_DATE = P.BIRTH_DATE,
                 DM.BIRTH_PLACE = P.BIRTH_PLACE,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.OPASSPORT_PLACE = P.OPASSPORT_PLACE,
                 DM.OPASSPORT_DATE = P.OPASSPORT_DATE,
                 DM.OPASSPORT_EXPDATE = P.OPASSPORT_EXPDATE,
                 DM.CPASSPORT_PLACE = P.CPASSPORT_PLACE,
                 DM.CPASSPORT_EXPDATE = P.CPASSPORT_EXPDATE,
                 DM.CPASSPORT_DATE = P.CPASSPORT_DATE,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.VISATYPE_SEQNO = P.VISATYPE_SEQNO,
                 DM.VISA_EXPDATE = P.VISA_EXPDATE,
                 DM.APPRVSTS = P.APPRVSTS,
                 DM.PERMIT_DATE = P.PERMIT_DATE,
                 DM.PERSON_STS = P.PERSON_STS,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.TM_FLAG = P.TM_FLAG,
                 DM.TFIRSTNM = P.TFIRSTNM,
                 DM.TFAMILYNM = P.TFAMILYNM,
                 DM.TMIDDLENM = P.TMIDDLENM,
                 DM.STATUSRQS = P.STATUSRQS,
                 DM.STATUSRQSDTE = P.STATUSRQSDTE
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.RQSPERSON_SEQNO,
                  DM.TM9AND14_SEQNO,
                  DM.OPASSPORTNO,
                  DM.CPASSPORTNO,
                  DM.APPLY_DATE,
                  DM.DOCNO,
                  DM.EFIRSTNM,
                  DM.EMIDDLENM,
                  DM.EFAMILYNM,
                  DM.SEX,
                  DM.BIRTH_DATE,
                  DM.BIRTH_PLACE,
                  DM.NATION_SEQNO,
                  DM.OPASSPORT_PLACE,
                  DM.OPASSPORT_DATE,
                  DM.OPASSPORT_EXPDATE,
                  DM.CPASSPORT_PLACE,
                  DM.CPASSPORT_EXPDATE,
                  DM.CPASSPORT_DATE,
                  DM.DEPT_SEQNO,
                  DM.VISATYPE_SEQNO,
                  DM.VISA_EXPDATE,
                  DM.APPRVSTS,
                  DM.PERMIT_DATE,
                  DM.PERSON_STS,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.TM_FLAG,
                  DM.TFIRSTNM,
                  DM.TFAMILYNM,
                  DM.TMIDDLENM,
                  DM.STATUSRQS,
                  DM.STATUSRQSDTE)
          VALUES (P.RQSPERSON_SEQNO,
                  P.TM9AND14_SEQNO,
                  P.OPASSPORTNO,
                  P.CPASSPORTNO,
                  P.APPLY_DATE,
                  P.DOCNO,
                  P.EFIRSTNM,
                  P.EMIDDLENM,
                  P.EFAMILYNM,
                  P.SEX,
                  P.BIRTH_DATE,
                  P.BIRTH_PLACE,
                  P.NATION_SEQNO,
                  P.OPASSPORT_PLACE,
                  P.OPASSPORT_DATE,
                  P.OPASSPORT_EXPDATE,
                  P.CPASSPORT_PLACE,
                  P.CPASSPORT_EXPDATE,
                  P.CPASSPORT_DATE,
                  P.DEPT_SEQNO,
                  P.VISATYPE_SEQNO,
                  P.VISA_EXPDATE,
                  P.APPRVSTS,
                  P.PERMIT_DATE,
                  P.PERSON_STS,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.TM_FLAG,
                  P.TFIRSTNM,
                  P.TFAMILYNM,
                  P.TMIDDLENM,
                  P.STATUSRQS,
                  P.STATUSRQSDTE);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('RQS_PERSON_C_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('RQS_PERSON_C_M',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;



   MERGE INTO PIBICSDM2.RQS_PERSON DM
        USING (SELECT *
                 FROM PIBICS.RQS_PERSON@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.RQSPERSON_SEQNO = P.RQSPERSON_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.TM9AND14_SEQNO = P.TM9AND14_SEQNO,
                 DM.OPASSPORTNO = P.OPASSPORTNO,
                 DM.CPASSPORTNO = P.CPASSPORTNO,
                 DM.APPLY_DATE = P.APPLY_DATE,
                 DM.DOCNO = P.DOCNO,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.SEX = P.SEX,
                 DM.BIRTH_DATE = P.BIRTH_DATE,
                 DM.BIRTH_PLACE = P.BIRTH_PLACE,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.OPASSPORT_PLACE = P.OPASSPORT_PLACE,
                 DM.OPASSPORT_DATE = P.OPASSPORT_DATE,
                 DM.OPASSPORT_EXPDATE = P.OPASSPORT_EXPDATE,
                 DM.CPASSPORT_PLACE = P.CPASSPORT_PLACE,
                 DM.CPASSPORT_EXPDATE = P.CPASSPORT_EXPDATE,
                 DM.CPASSPORT_DATE = P.CPASSPORT_DATE,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.VISATYPE_SEQNO = P.VISATYPE_SEQNO,
                 DM.VISA_EXPDATE = P.VISA_EXPDATE,
                 DM.APPRVSTS = P.APPRVSTS,
                 DM.PERMIT_DATE = P.PERMIT_DATE,
                 DM.PERSON_STS = P.PERSON_STS,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.TM_FLAG = P.TM_FLAG,
                 DM.TFIRSTNM = P.TFIRSTNM,
                 DM.TFAMILYNM = P.TFAMILYNM,
                 DM.TMIDDLENM = P.TMIDDLENM,
                 DM.STATUSRQS = P.STATUSRQS,
                 DM.STATUSRQSDTE = P.STATUSRQSDTE
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.RQSPERSON_SEQNO,
                  DM.TM9AND14_SEQNO,
                  DM.OPASSPORTNO,
                  DM.CPASSPORTNO,
                  DM.APPLY_DATE,
                  DM.DOCNO,
                  DM.EFIRSTNM,
                  DM.EMIDDLENM,
                  DM.EFAMILYNM,
                  DM.SEX,
                  DM.BIRTH_DATE,
                  DM.BIRTH_PLACE,
                  DM.NATION_SEQNO,
                  DM.OPASSPORT_PLACE,
                  DM.OPASSPORT_DATE,
                  DM.OPASSPORT_EXPDATE,
                  DM.CPASSPORT_PLACE,
                  DM.CPASSPORT_EXPDATE,
                  DM.CPASSPORT_DATE,
                  DM.DEPT_SEQNO,
                  DM.VISATYPE_SEQNO,
                  DM.VISA_EXPDATE,
                  DM.APPRVSTS,
                  DM.PERMIT_DATE,
                  DM.PERSON_STS,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.TM_FLAG,
                  DM.TFIRSTNM,
                  DM.TFAMILYNM,
                  DM.TMIDDLENM,
                  DM.STATUSRQS,
                  DM.STATUSRQSDTE)
          VALUES (P.RQSPERSON_SEQNO,
                  P.TM9AND14_SEQNO,
                  P.OPASSPORTNO,
                  P.CPASSPORTNO,
                  P.APPLY_DATE,
                  P.DOCNO,
                  P.EFIRSTNM,
                  P.EMIDDLENM,
                  P.EFAMILYNM,
                  P.SEX,
                  P.BIRTH_DATE,
                  P.BIRTH_PLACE,
                  P.NATION_SEQNO,
                  P.OPASSPORT_PLACE,
                  P.OPASSPORT_DATE,
                  P.OPASSPORT_EXPDATE,
                  P.CPASSPORT_PLACE,
                  P.CPASSPORT_EXPDATE,
                  P.CPASSPORT_DATE,
                  P.DEPT_SEQNO,
                  P.VISATYPE_SEQNO,
                  P.VISA_EXPDATE,
                  P.APPRVSTS,
                  P.PERMIT_DATE,
                  P.PERSON_STS,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.TM_FLAG,
                  P.TFIRSTNM,
                  P.TFAMILYNM,
                  P.TMIDDLENM,
                  P.STATUSRQS,
                  P.STATUSRQSDTE);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('RQS_PERSON_U_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('RQS_PERSON_U_M',
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
END P_RQS_PERSON_M;
/
