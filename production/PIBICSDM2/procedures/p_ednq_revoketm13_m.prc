CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_EDNQ_REVOKETM13_M" (v_dstart varchar2,v_dend varchar2)
IS
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /*   Create date : 27-01-2018    */
   --No.17
  -- v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
  -- v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.EDNQ_REVOKETM13 DM
        USING (SELECT *
                 FROM PIBICS.EDNQ_REVOKETM13@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.EDMREVOKE_SEQNO = P.EDMREVOKE_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.EDMREVOKE_NO = P.EDMREVOKE_NO,
                 DM.EDMREVOKE_DATE = P.EDMREVOKE_DATE,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.TFAMILYNM = P.TFAMILYNM,
                 DM.TFIRSTNM = P.TFIRSTNM,
                 DM.TMIDDLENM = P.TMIDDLENM,
                 DM.BIRTH_DATE = P.BIRTH_DATE,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.OCC_SEQNO = P.OCC_SEQNO,
                 DM.SEX = P.SEX,
                 DM.RESCERTTYPE_SEQNO = P.RESCERTTYPE_SEQNO,
                 DM.RCISSUE_BY = P.RCISSUE_BY,
                 DM.RCISSUE_DATE = P.RCISSUE_DATE,
                 DM.RCNO_PVCD = P.RCNO_PVCD,
                 DM.RCNO_RUNNINGNO = P.RCNO_RUNNINGNO,
                 DM.RCNO_YEAR = P.RCNO_YEAR,
                 DM.TM13_SEQNO = P.TM13_SEQNO,
                 DM.TM13NO = P.TM13NO,
                 DM.TM13YEAR = P.TM13YEAR,
                 DM.EDMISSUE_DATE = P.EDMISSUE_DATE,
                 DM.EDMEXP_DATE = P.EDMEXP_DATE,
                 DM.REVOKE_DATE = P.REVOKE_DATE,
                 DM.REVOKE_REASON = P.REVOKE_REASON,
                 DM.REVOKESTS = P.REVOKESTS,
                 DM.REVOKEDESC = P.REVOKEDESC,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.EDMREVOKETYPE = P.EDMREVOKETYPE,
                 DM.EDMISSUE_BYDEPT = P.EDMISSUE_BYDEPT,
                 DM.OCC_DETAIL = P.OCC_DETAIL
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.EDMREVOKE_SEQNO,
                  DM.EDMREVOKE_NO,
                  DM.EDMREVOKE_DATE,
                  DM.EFAMILYNM,
                  DM.EFIRSTNM,
                  DM.EMIDDLENM,
                  DM.TFAMILYNM,
                  DM.TFIRSTNM,
                  DM.TMIDDLENM,
                  DM.BIRTH_DATE,
                  DM.NATION_SEQNO,
                  DM.OCC_SEQNO,
                  DM.SEX,
                  DM.RESCERTTYPE_SEQNO,
                  DM.RCISSUE_BY,
                  DM.RCISSUE_DATE,
                  DM.RCNO_PVCD,
                  DM.RCNO_RUNNINGNO,
                  DM.RCNO_YEAR,
                  DM.TM13_SEQNO,
                  DM.TM13NO,
                  DM.TM13YEAR,
                  DM.EDMISSUE_DATE,
                  DM.EDMEXP_DATE,
                  DM.REVOKE_DATE,
                  DM.REVOKE_REASON,
                  DM.REVOKESTS,
                  DM.REVOKEDESC,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.EDMREVOKETYPE,
                  DM.EDMISSUE_BYDEPT,
                  DM.OCC_DETAIL)
          VALUES (P.EDMREVOKE_SEQNO,
                  P.EDMREVOKE_NO,
                  P.EDMREVOKE_DATE,
                  P.EFAMILYNM,
                  P.EFIRSTNM,
                  P.EMIDDLENM,
                  P.TFAMILYNM,
                  P.TFIRSTNM,
                  P.TMIDDLENM,
                  P.BIRTH_DATE,
                  P.NATION_SEQNO,
                  P.OCC_SEQNO,
                  P.SEX,
                  P.RESCERTTYPE_SEQNO,
                  P.RCISSUE_BY,
                  P.RCISSUE_DATE,
                  P.RCNO_PVCD,
                  P.RCNO_RUNNINGNO,
                  P.RCNO_YEAR,
                  P.TM13_SEQNO,
                  P.TM13NO,
                  P.TM13YEAR,
                  P.EDMISSUE_DATE,
                  P.EDMEXP_DATE,
                  P.REVOKE_DATE,
                  P.REVOKE_REASON,
                  P.REVOKESTS,
                  P.REVOKEDESC,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.EDMREVOKETYPE,
                  P.EDMISSUE_BYDEPT,
                  P.OCC_DETAIL);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('EDNQ_REVOKETM13_C_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('EDNQ_REVOKETM13_C_M',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;


   MERGE INTO PIBICSDM2.EDNQ_REVOKETM13 DM
        USING (SELECT *
                 FROM PIBICS.EDNQ_REVOKETM13@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.EDMREVOKE_SEQNO = P.EDMREVOKE_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.EDMREVOKE_NO = P.EDMREVOKE_NO,
                 DM.EDMREVOKE_DATE = P.EDMREVOKE_DATE,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.TFAMILYNM = P.TFAMILYNM,
                 DM.TFIRSTNM = P.TFIRSTNM,
                 DM.TMIDDLENM = P.TMIDDLENM,
                 DM.BIRTH_DATE = P.BIRTH_DATE,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.OCC_SEQNO = P.OCC_SEQNO,
                 DM.SEX = P.SEX,
                 DM.RESCERTTYPE_SEQNO = P.RESCERTTYPE_SEQNO,
                 DM.RCISSUE_BY = P.RCISSUE_BY,
                 DM.RCISSUE_DATE = P.RCISSUE_DATE,
                 DM.RCNO_PVCD = P.RCNO_PVCD,
                 DM.RCNO_RUNNINGNO = P.RCNO_RUNNINGNO,
                 DM.RCNO_YEAR = P.RCNO_YEAR,
                 DM.TM13_SEQNO = P.TM13_SEQNO,
                 DM.TM13NO = P.TM13NO,
                 DM.TM13YEAR = P.TM13YEAR,
                 DM.EDMISSUE_DATE = P.EDMISSUE_DATE,
                 DM.EDMEXP_DATE = P.EDMEXP_DATE,
                 DM.REVOKE_DATE = P.REVOKE_DATE,
                 DM.REVOKE_REASON = P.REVOKE_REASON,
                 DM.REVOKESTS = P.REVOKESTS,
                 DM.REVOKEDESC = P.REVOKEDESC,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.EDMREVOKETYPE = P.EDMREVOKETYPE,
                 DM.EDMISSUE_BYDEPT = P.EDMISSUE_BYDEPT,
                 DM.OCC_DETAIL = P.OCC_DETAIL
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.EDMREVOKE_SEQNO,
                  DM.EDMREVOKE_NO,
                  DM.EDMREVOKE_DATE,
                  DM.EFAMILYNM,
                  DM.EFIRSTNM,
                  DM.EMIDDLENM,
                  DM.TFAMILYNM,
                  DM.TFIRSTNM,
                  DM.TMIDDLENM,
                  DM.BIRTH_DATE,
                  DM.NATION_SEQNO,
                  DM.OCC_SEQNO,
                  DM.SEX,
                  DM.RESCERTTYPE_SEQNO,
                  DM.RCISSUE_BY,
                  DM.RCISSUE_DATE,
                  DM.RCNO_PVCD,
                  DM.RCNO_RUNNINGNO,
                  DM.RCNO_YEAR,
                  DM.TM13_SEQNO,
                  DM.TM13NO,
                  DM.TM13YEAR,
                  DM.EDMISSUE_DATE,
                  DM.EDMEXP_DATE,
                  DM.REVOKE_DATE,
                  DM.REVOKE_REASON,
                  DM.REVOKESTS,
                  DM.REVOKEDESC,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.EDMREVOKETYPE,
                  DM.EDMISSUE_BYDEPT,
                  DM.OCC_DETAIL)
          VALUES (P.EDMREVOKE_SEQNO,
                  P.EDMREVOKE_NO,
                  P.EDMREVOKE_DATE,
                  P.EFAMILYNM,
                  P.EFIRSTNM,
                  P.EMIDDLENM,
                  P.TFAMILYNM,
                  P.TFIRSTNM,
                  P.TMIDDLENM,
                  P.BIRTH_DATE,
                  P.NATION_SEQNO,
                  P.OCC_SEQNO,
                  P.SEX,
                  P.RESCERTTYPE_SEQNO,
                  P.RCISSUE_BY,
                  P.RCISSUE_DATE,
                  P.RCNO_PVCD,
                  P.RCNO_RUNNINGNO,
                  P.RCNO_YEAR,
                  P.TM13_SEQNO,
                  P.TM13NO,
                  P.TM13YEAR,
                  P.EDMISSUE_DATE,
                  P.EDMEXP_DATE,
                  P.REVOKE_DATE,
                  P.REVOKE_REASON,
                  P.REVOKESTS,
                  P.REVOKEDESC,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.EDMREVOKETYPE,
                  P.EDMISSUE_BYDEPT,
                  P.OCC_DETAIL);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('EDNQ_REVOKETM13_U_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('EDNQ_REVOKETM13_U_M',
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
END P_EDNQ_REVOKETM13_M;
/
