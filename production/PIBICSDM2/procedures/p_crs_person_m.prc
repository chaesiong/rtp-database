CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_CRS_PERSON_M" (v_dstart varchar2,v_dend varchar2)
IS
    var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /*   Create date : 27-01-2018    */
   --No.14
   --v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   --v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.CRS_PERSON DM
        USING (SELECT *
                 FROM PIBICS.CRS_PERSON@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.CRSPERSON_SEQNO = P.CRSPERSON_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.EFAMILYNM = P.EFAMILYNM,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.TFAMILYNM = P.TFAMILYNM,
                 DM.TFIRSTNM = P.TFIRSTNM,
                 DM.TMIDDLENM = P.TMIDDLENM,
                 DM.RCNO_PVCD = P.RCNO_PVCD,
                 DM.RCNO_RUNNINGNO = P.RCNO_RUNNINGNO,
                 DM.RCNO_YEAR = P.RCNO_YEAR,
                 DM.RESCERTTYPE_SEQNO = P.RESCERTTYPE_SEQNO,
                 DM.SEX = P.SEX,
                 DM.BIRTH_DATE = P.BIRTH_DATE,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.PERMIT_SEQNO = P.PERMIT_SEQNO,
                 DM.PERMIT_DATE = P.PERMIT_DATE,
                 DM.OPASSPORTNO = P.OPASSPORTNO,
                 DM.OPASSPORT_DATE = P.OPASSPORT_DATE,
                 DM.OPASSPORTEXP_DATE = P.OPASSPORTEXP_DATE,
                 DM.CPASSPORTNO = P.CPASSPORTNO,
                 DM.CPASSPORT_DATE = P.CPASSPORT_DATE,
                 DM.CPASSPORTEXP_DATE = P.CPASSPORTEXP_DATE,
                 DM.CERTOFRESIDENCE_SEQNO = P.CERTOFRESIDENCE_SEQNO,
                 DM.TMTYPE = P.TMTYPE,
                 DM.TMNO = P.TMNO,
                 DM.CRS_STS = P.CRS_STS,
                 DM.APPVSTS_DATE = P.APPVSTS_DATE,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.RCISSUE_BY = P.RCISSUE_BY,
                 DM.RCISSUE_DATE = P.RCISSUE_DATE,
                 DM.OCC_DETAIL = P.OCC_DETAIL
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.CRSPERSON_SEQNO,
                  DM.EFAMILYNM,
                  DM.EFIRSTNM,
                  DM.EMIDDLENM,
                  DM.TFAMILYNM,
                  DM.TFIRSTNM,
                  DM.TMIDDLENM,
                  DM.RCNO_PVCD,
                  DM.RCNO_RUNNINGNO,
                  DM.RCNO_YEAR,
                  DM.RESCERTTYPE_SEQNO,
                  DM.SEX,
                  DM.BIRTH_DATE,
                  DM.NATION_SEQNO,
                  DM.PERMIT_SEQNO,
                  DM.PERMIT_DATE,
                  DM.OPASSPORTNO,
                  DM.OPASSPORT_DATE,
                  DM.OPASSPORTEXP_DATE,
                  DM.CPASSPORTNO,
                  DM.CPASSPORT_DATE,
                  DM.CPASSPORTEXP_DATE,
                  DM.CERTOFRESIDENCE_SEQNO,
                  DM.TMTYPE,
                  DM.TMNO,
                  DM.CRS_STS,
                  DM.APPVSTS_DATE,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.RCISSUE_BY,
                  DM.RCISSUE_DATE,
                  DM.OCC_DETAIL)
          VALUES (P.CRSPERSON_SEQNO,
                  P.EFAMILYNM,
                  P.EFIRSTNM,
                  P.EMIDDLENM,
                  P.TFAMILYNM,
                  P.TFIRSTNM,
                  P.TMIDDLENM,
                  P.RCNO_PVCD,
                  P.RCNO_RUNNINGNO,
                  P.RCNO_YEAR,
                  P.RESCERTTYPE_SEQNO,
                  P.SEX,
                  P.BIRTH_DATE,
                  P.NATION_SEQNO,
                  P.PERMIT_SEQNO,
                  P.PERMIT_DATE,
                  P.OPASSPORTNO,
                  P.OPASSPORT_DATE,
                  P.OPASSPORTEXP_DATE,
                  P.CPASSPORTNO,
                  P.CPASSPORT_DATE,
                  P.CPASSPORTEXP_DATE,
                  P.CERTOFRESIDENCE_SEQNO,
                  P.TMTYPE,
                  P.TMNO,
                  P.CRS_STS,
                  P.APPVSTS_DATE,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.RCISSUE_BY,
                  P.RCISSUE_DATE,
                  P.OCC_DETAIL);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('CRS_PERSON_C_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('CRS_PERSON_C_M',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;



   MERGE INTO PIBICSDM2.CRS_PERSON DM
        USING (SELECT *
                 FROM PIBICS.CRS_PERSON@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.CRSPERSON_SEQNO = P.CRSPERSON_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.EFAMILYNM = P.EFAMILYNM,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.TFAMILYNM = P.TFAMILYNM,
                 DM.TFIRSTNM = P.TFIRSTNM,
                 DM.TMIDDLENM = P.TMIDDLENM,
                 DM.RCNO_PVCD = P.RCNO_PVCD,
                 DM.RCNO_RUNNINGNO = P.RCNO_RUNNINGNO,
                 DM.RCNO_YEAR = P.RCNO_YEAR,
                 DM.RESCERTTYPE_SEQNO = P.RESCERTTYPE_SEQNO,
                 DM.SEX = P.SEX,
                 DM.BIRTH_DATE = P.BIRTH_DATE,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.PERMIT_SEQNO = P.PERMIT_SEQNO,
                 DM.PERMIT_DATE = P.PERMIT_DATE,
                 DM.OPASSPORTNO = P.OPASSPORTNO,
                 DM.OPASSPORT_DATE = P.OPASSPORT_DATE,
                 DM.OPASSPORTEXP_DATE = P.OPASSPORTEXP_DATE,
                 DM.CPASSPORTNO = P.CPASSPORTNO,
                 DM.CPASSPORT_DATE = P.CPASSPORT_DATE,
                 DM.CPASSPORTEXP_DATE = P.CPASSPORTEXP_DATE,
                 DM.CERTOFRESIDENCE_SEQNO = P.CERTOFRESIDENCE_SEQNO,
                 DM.TMTYPE = P.TMTYPE,
                 DM.TMNO = P.TMNO,
                 DM.CRS_STS = P.CRS_STS,
                 DM.APPVSTS_DATE = P.APPVSTS_DATE,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.RCISSUE_BY = P.RCISSUE_BY,
                 DM.RCISSUE_DATE = P.RCISSUE_DATE,
                 DM.OCC_DETAIL = P.OCC_DETAIL
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.CRSPERSON_SEQNO,
                  DM.EFAMILYNM,
                  DM.EFIRSTNM,
                  DM.EMIDDLENM,
                  DM.TFAMILYNM,
                  DM.TFIRSTNM,
                  DM.TMIDDLENM,
                  DM.RCNO_PVCD,
                  DM.RCNO_RUNNINGNO,
                  DM.RCNO_YEAR,
                  DM.RESCERTTYPE_SEQNO,
                  DM.SEX,
                  DM.BIRTH_DATE,
                  DM.NATION_SEQNO,
                  DM.PERMIT_SEQNO,
                  DM.PERMIT_DATE,
                  DM.OPASSPORTNO,
                  DM.OPASSPORT_DATE,
                  DM.OPASSPORTEXP_DATE,
                  DM.CPASSPORTNO,
                  DM.CPASSPORT_DATE,
                  DM.CPASSPORTEXP_DATE,
                  DM.CERTOFRESIDENCE_SEQNO,
                  DM.TMTYPE,
                  DM.TMNO,
                  DM.CRS_STS,
                  DM.APPVSTS_DATE,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.RCISSUE_BY,
                  DM.RCISSUE_DATE,
                  DM.OCC_DETAIL)
          VALUES (P.CRSPERSON_SEQNO,
                  P.EFAMILYNM,
                  P.EFIRSTNM,
                  P.EMIDDLENM,
                  P.TFAMILYNM,
                  P.TFIRSTNM,
                  P.TMIDDLENM,
                  P.RCNO_PVCD,
                  P.RCNO_RUNNINGNO,
                  P.RCNO_YEAR,
                  P.RESCERTTYPE_SEQNO,
                  P.SEX,
                  P.BIRTH_DATE,
                  P.NATION_SEQNO,
                  P.PERMIT_SEQNO,
                  P.PERMIT_DATE,
                  P.OPASSPORTNO,
                  P.OPASSPORT_DATE,
                  P.OPASSPORTEXP_DATE,
                  P.CPASSPORTNO,
                  P.CPASSPORT_DATE,
                  P.CPASSPORTEXP_DATE,
                  P.CERTOFRESIDENCE_SEQNO,
                  P.TMTYPE,
                  P.TMNO,
                  P.CRS_STS,
                  P.APPVSTS_DATE,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.RCISSUE_BY,
                  P.RCISSUE_DATE,
                  P.OCC_DETAIL);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('CRS_PERSON_U_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('CRS_PERSON_U_M',
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
END P_CRS_PERSON_M;
/
