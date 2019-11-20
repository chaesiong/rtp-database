CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_REPS_PERSON_M" (v_dstart varchar2,v_dend varchar2)
IS
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /*   Create date : 27-01-2018    */
   --No.8
   --v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   --v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.REPS_PERSON DM
        USING (SELECT *
                 FROM PIBICS.REPS_PERSON@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.REPSPERSON_SEQNO = P.REPSPERSON_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.FAMILYNM = P.FAMILYNM,
                 DM.FIRSTNM = P.FIRSTNM,
                 DM.MIDDLENM = P.MIDDLENM,
                 DM.SEX = P.SEX,
                 DM.BIRTH_DATE = P.BIRTH_DATE,
                 DM.NATIONAL_SEQNO = P.NATIONAL_SEQNO,
                 DM.OPASSPORTNO = P.OPASSPORTNO,
                 DM.OPASSPORT_DATE = P.OPASSPORT_DATE,
                 DM.OPASSPORTEXP_DATE = P.OPASSPORTEXP_DATE,
                 DM.CPASSPORTNO = P.CPASSPORTNO,
                 DM.CPASSPORT_DATE = P.CPASSPORT_DATE,
                 DM.CPASSPORTEXP_DATE = P.CPASSPORTEXP_DATE,
                 DM.PERMIT_SEQNO = P.PERMIT_SEQNO,
                 DM.PERMIT_DATE = P.PERMIT_DATE,
                 DM.TM8_SEQNO = P.TM8_SEQNO,
                 DM.TM8NO = P.TM8NO,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.VERSION = P.VERSION,
                 DM.TM8CHILD_SEQNO = P.TM8CHILD_SEQNO,
                 DM.APPVSTS = P.APPVSTS,
                 DM.DOCTYPE = P.DOCTYPE,
                 DM.YEAR = P.YEAR,
                 DM.PERSONFLAG = P.PERSONFLAG,
                 DM.VISA_SEQNO = P.VISA_SEQNO,
                 DM.VISAEND_DATE = P.VISAEND_DATE,
                 DM.STATUSENTRY = P.STATUSENTRY,
                 DM.STATUSENTRYDTE = P.STATUSENTRYDTE,
                 DM.DOC_DATE = P.DOC_DATE,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.ZONE_SEQNO = P.ZONE_SEQNO
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.REPSPERSON_SEQNO,
                  DM.FAMILYNM,
                  DM.FIRSTNM,
                  DM.MIDDLENM,
                  DM.SEX,
                  DM.BIRTH_DATE,
                  DM.NATIONAL_SEQNO,
                  DM.OPASSPORTNO,
                  DM.OPASSPORT_DATE,
                  DM.OPASSPORTEXP_DATE,
                  DM.CPASSPORTNO,
                  DM.CPASSPORT_DATE,
                  DM.CPASSPORTEXP_DATE,
                  DM.PERMIT_SEQNO,
                  DM.PERMIT_DATE,
                  DM.TM8_SEQNO,
                  DM.TM8NO,
                  DM.CREATE_DATE,
                  DM.CREATE_BY,
                  DM.UPDATE_DATE,
                  DM.UPDATE_BY,
                  DM.VERSION,
                  DM.TM8CHILD_SEQNO,
                  DM.APPVSTS,
                  DM.DOCTYPE,
                  DM.YEAR,
                  DM.PERSONFLAG,
                  DM.VISA_SEQNO,
                  DM.VISAEND_DATE,
                  DM.STATUSENTRY,
                  DM.STATUSENTRYDTE,
                  DM.DOC_DATE,
                  DM.DEPT_SEQNO,
                  DM.ZONE_SEQNO)
          VALUES (P.REPSPERSON_SEQNO,
                  P.FAMILYNM,
                  P.FIRSTNM,
                  P.MIDDLENM,
                  P.SEX,
                  P.BIRTH_DATE,
                  P.NATIONAL_SEQNO,
                  P.OPASSPORTNO,
                  P.OPASSPORT_DATE,
                  P.OPASSPORTEXP_DATE,
                  P.CPASSPORTNO,
                  P.CPASSPORT_DATE,
                  P.CPASSPORTEXP_DATE,
                  P.PERMIT_SEQNO,
                  P.PERMIT_DATE,
                  P.TM8_SEQNO,
                  P.TM8NO,
                  P.CREATE_DATE,
                  P.CREATE_BY,
                  P.UPDATE_DATE,
                  P.UPDATE_BY,
                  P.VERSION,
                  P.TM8CHILD_SEQNO,
                  P.APPVSTS,
                  P.DOCTYPE,
                  P.YEAR,
                  P.PERSONFLAG,
                  P.VISA_SEQNO,
                  P.VISAEND_DATE,
                  P.STATUSENTRY,
                  P.STATUSENTRYDTE,
                  P.DOC_DATE,
                  P.DEPT_SEQNO,
                  P.ZONE_SEQNO);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('REPS_PERSON_C_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('REPS_PERSON_C_M',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;



   MERGE INTO PIBICSDM2.REPS_PERSON DM
        USING (SELECT *
                 FROM PIBICS.REPS_PERSON@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.REPSPERSON_SEQNO = P.REPSPERSON_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.FAMILYNM = P.FAMILYNM,
                 DM.FIRSTNM = P.FIRSTNM,
                 DM.MIDDLENM = P.MIDDLENM,
                 DM.SEX = P.SEX,
                 DM.BIRTH_DATE = P.BIRTH_DATE,
                 DM.NATIONAL_SEQNO = P.NATIONAL_SEQNO,
                 DM.OPASSPORTNO = P.OPASSPORTNO,
                 DM.OPASSPORT_DATE = P.OPASSPORT_DATE,
                 DM.OPASSPORTEXP_DATE = P.OPASSPORTEXP_DATE,
                 DM.CPASSPORTNO = P.CPASSPORTNO,
                 DM.CPASSPORT_DATE = P.CPASSPORT_DATE,
                 DM.CPASSPORTEXP_DATE = P.CPASSPORTEXP_DATE,
                 DM.PERMIT_SEQNO = P.PERMIT_SEQNO,
                 DM.PERMIT_DATE = P.PERMIT_DATE,
                 DM.TM8_SEQNO = P.TM8_SEQNO,
                 DM.TM8NO = P.TM8NO,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.VERSION = P.VERSION,
                 DM.TM8CHILD_SEQNO = P.TM8CHILD_SEQNO,
                 DM.APPVSTS = P.APPVSTS,
                 DM.DOCTYPE = P.DOCTYPE,
                 DM.YEAR = P.YEAR,
                 DM.PERSONFLAG = P.PERSONFLAG,
                 DM.VISA_SEQNO = P.VISA_SEQNO,
                 DM.VISAEND_DATE = P.VISAEND_DATE,
                 DM.STATUSENTRY = P.STATUSENTRY,
                 DM.STATUSENTRYDTE = P.STATUSENTRYDTE,
                 DM.DOC_DATE = P.DOC_DATE,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.ZONE_SEQNO = P.ZONE_SEQNO
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.REPSPERSON_SEQNO,
                  DM.FAMILYNM,
                  DM.FIRSTNM,
                  DM.MIDDLENM,
                  DM.SEX,
                  DM.BIRTH_DATE,
                  DM.NATIONAL_SEQNO,
                  DM.OPASSPORTNO,
                  DM.OPASSPORT_DATE,
                  DM.OPASSPORTEXP_DATE,
                  DM.CPASSPORTNO,
                  DM.CPASSPORT_DATE,
                  DM.CPASSPORTEXP_DATE,
                  DM.PERMIT_SEQNO,
                  DM.PERMIT_DATE,
                  DM.TM8_SEQNO,
                  DM.TM8NO,
                  DM.CREATE_DATE,
                  DM.CREATE_BY,
                  DM.UPDATE_DATE,
                  DM.UPDATE_BY,
                  DM.VERSION,
                  DM.TM8CHILD_SEQNO,
                  DM.APPVSTS,
                  DM.DOCTYPE,
                  DM.YEAR,
                  DM.PERSONFLAG,
                  DM.VISA_SEQNO,
                  DM.VISAEND_DATE,
                  DM.STATUSENTRY,
                  DM.STATUSENTRYDTE,
                  DM.DOC_DATE,
                  DM.DEPT_SEQNO,
                  DM.ZONE_SEQNO)
          VALUES (P.REPSPERSON_SEQNO,
                  P.FAMILYNM,
                  P.FIRSTNM,
                  P.MIDDLENM,
                  P.SEX,
                  P.BIRTH_DATE,
                  P.NATIONAL_SEQNO,
                  P.OPASSPORTNO,
                  P.OPASSPORT_DATE,
                  P.OPASSPORTEXP_DATE,
                  P.CPASSPORTNO,
                  P.CPASSPORT_DATE,
                  P.CPASSPORTEXP_DATE,
                  P.PERMIT_SEQNO,
                  P.PERMIT_DATE,
                  P.TM8_SEQNO,
                  P.TM8NO,
                  P.CREATE_DATE,
                  P.CREATE_BY,
                  P.UPDATE_DATE,
                  P.UPDATE_BY,
                  P.VERSION,
                  P.TM8CHILD_SEQNO,
                  P.APPVSTS,
                  P.DOCTYPE,
                  P.YEAR,
                  P.PERSONFLAG,
                  P.VISA_SEQNO,
                  P.VISAEND_DATE,
                  P.STATUSENTRY,
                  P.STATUSENTRYDTE,
                  P.DOC_DATE,
                  P.DEPT_SEQNO,
                  P.ZONE_SEQNO);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('REPS_PERSON_U_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('REPS_PERSON_U_M',
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
END P_REPS_PERSON_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_REPS_PERSON_M" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_REPS_PERSON_M" TO "BIOSAADM";
