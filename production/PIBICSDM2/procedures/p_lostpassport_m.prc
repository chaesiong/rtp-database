CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_LOSTPASSPORT_M" (v_dstart varchar2,v_dend varchar2)
IS
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /* Create date : 6-12-2108 */
   --v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   --v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.LOSTPASSPORT DM
        USING (SELECT *
                 FROM PIBICS.LOSTPASSPORT@PIBICS_PROD
                WHERE     TO_CHAR (CREDTE, 'yyyymmdd') >= v_dstart
                      AND TO_CHAR (CREDTE, 'yyyymmdd') <= v_dend
                      AND UPDDTE IS NULL) P
           ON (DM.LPPCD = P.LPPCD)
   WHEN MATCHED
   THEN
      UPDATE SET DM.NATIONCD = P.NATIONCD,
                 DM.PASSPORTNO = P.PASSPORTNO,
                 DM.CITIZENID = P.CITIZENID,
                 DM.TFIRSTNM = P.TFIRSTNM,
                 DM.TFAMILYNM = P.TFAMILYNM,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.BIRTHDATE = P.BIRTHDATE,
                 DM.SEX = P.SEX,
                 DM.ISUPASSPORTDTE = P.ISUPASSPORTDTE,
                 DM.ISUPASSPORTPLACE = P.ISUPASSPORTPLACE,
                 DM.PASSPORTEXPDTE = P.PASSPORTEXPDTE,
                 DM.PASSPORTTYPE = P.PASSPORTTYPE,
                 DM.LOSTPASSPORTDTE = P.LOSTPASSPORTDTE,
                 DM.LOSTPASSPORTPLACE = P.LOSTPASSPORTPLACE,
                 DM.TMIDDLENM = P.TMIDDLENM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.REMARK = P.REMARK,
                 DM.CREUSR = P.CREUSR,
                 DM.CREDTE = P.CREDTE,
                 DM.UPDUSR = P.UPDUSR,
                 DM.UPDDTE = P.UPDDTE,
                 DM.NEWPASSPORTNO = P.NEWPASSPORTNO,
                 DM.NEWPASSPORTTYPE = P.NEWPASSPORTTYPE,
                 DM.NEWISUPASSPORTDTE = P.NEWISUPASSPORTDTE,
                 DM.NEWISUPASSPORTPLACE = P.NEWISUPASSPORTPLACE,
                 DM.NEWPASSPORTEXPDTE = P.NEWPASSPORTEXPDTE,
                 DM.INFORMPASSPORTDTE = P.INFORMPASSPORTDTE,
                 DM.OWNERAGE = P.OWNERAGE,
                 DM.AGCPHONE = P.AGCPHONE,
                 DM.EMGCONT = P.EMGCONT,
                 DM.DOCREF = P.DOCREF,
                 DM.SECLEV = P.SECLEV,
                 DM.REASONCD = P.REASONCD,
                 DM.AGCCONT = P.AGCCONT,
                 DM.OPERREF = P.OPERREF,
                 DM.TDCD = P.TDCD,
                 DM.LPPERSON = P.LPPERSON,
                 DM.POLISSTATION = P.POLISSTATION,
                 DM.VISATYPE_SEQNO = P.VISATYPE_SEQNO,
                 DM.VISAEXPDTE = P.VISAEXPDTE,
                 DM.TDT_SEQNO = P.TDT_SEQNO,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.PID = P.PID,
                 DM.ORG_CODE = P.ORG_CODE
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.LPPCD,
                  DM.NATIONCD,
                  DM.PASSPORTNO,
                  DM.CITIZENID,
                  DM.TFIRSTNM,
                  DM.TFAMILYNM,
                  DM.EFIRSTNM,
                  DM.EFAMILYNM,
                  DM.BIRTHDATE,
                  DM.SEX,
                  DM.ISUPASSPORTDTE,
                  DM.ISUPASSPORTPLACE,
                  DM.PASSPORTEXPDTE,
                  DM.PASSPORTTYPE,
                  DM.LOSTPASSPORTDTE,
                  DM.LOSTPASSPORTPLACE,
                  DM.TMIDDLENM,
                  DM.EMIDDLENM,
                  DM.REMARK,
                  DM.CREUSR,
                  DM.CREDTE,
                  DM.UPDUSR,
                  DM.UPDDTE,
                  DM.NEWPASSPORTNO,
                  DM.NEWPASSPORTTYPE,
                  DM.NEWISUPASSPORTDTE,
                  DM.NEWISUPASSPORTPLACE,
                  DM.NEWPASSPORTEXPDTE,
                  DM.INFORMPASSPORTDTE,
                  DM.OWNERAGE,
                  DM.AGCPHONE,
                  DM.EMGCONT,
                  DM.DOCREF,
                  DM.SECLEV,
                  DM.REASONCD,
                  DM.AGCCONT,
                  DM.OPERREF,
                  DM.TDCD,
                  DM.LPPERSON,
                  DM.POLISSTATION,
                  DM.VISATYPE_SEQNO,
                  DM.VISAEXPDTE,
                  DM.TDT_SEQNO,
                  DM.DEPT_SEQNO,
                  DM.PID,
                  DM.ORG_CODE)
          VALUES (P.LPPCD,
                  P.NATIONCD,
                  P.PASSPORTNO,
                  P.CITIZENID,
                  P.TFIRSTNM,
                  P.TFAMILYNM,
                  P.EFIRSTNM,
                  P.EFAMILYNM,
                  P.BIRTHDATE,
                  P.SEX,
                  P.ISUPASSPORTDTE,
                  P.ISUPASSPORTPLACE,
                  P.PASSPORTEXPDTE,
                  P.PASSPORTTYPE,
                  P.LOSTPASSPORTDTE,
                  P.LOSTPASSPORTPLACE,
                  P.TMIDDLENM,
                  P.EMIDDLENM,
                  P.REMARK,
                  P.CREUSR,
                  P.CREDTE,
                  P.UPDUSR,
                  P.UPDDTE,
                  P.NEWPASSPORTNO,
                  P.NEWPASSPORTTYPE,
                  P.NEWISUPASSPORTDTE,
                  P.NEWISUPASSPORTPLACE,
                  P.NEWPASSPORTEXPDTE,
                  P.INFORMPASSPORTDTE,
                  P.OWNERAGE,
                  P.AGCPHONE,
                  P.EMGCONT,
                  P.DOCREF,
                  P.SECLEV,
                  P.REASONCD,
                  P.AGCCONT,
                  P.OPERREF,
                  P.TDCD,
                  P.LPPERSON,
                  P.POLISSTATION,
                  P.VISATYPE_SEQNO,
                  P.VISAEXPDTE,
                  P.TDT_SEQNO,
                  P.DEPT_SEQNO,
                  P.PID,
                  P.ORG_CODE);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('LOSTPASSPORT_C_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('LOSTPASSPORT_C_M',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;


   MERGE INTO PIBICSDM2.LOSTPASSPORT DM
        USING (SELECT *
                 FROM PIBICS.LOSTPASSPORT@PIBICS_PROD
                WHERE     UPDDTE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDDTE <= TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.LPPCD = P.LPPCD)
   WHEN MATCHED
   THEN
      UPDATE SET DM.NATIONCD = P.NATIONCD,
                 DM.PASSPORTNO = P.PASSPORTNO,
                 DM.CITIZENID = P.CITIZENID,
                 DM.TFIRSTNM = P.TFIRSTNM,
                 DM.TFAMILYNM = P.TFAMILYNM,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.BIRTHDATE = P.BIRTHDATE,
                 DM.SEX = P.SEX,
                 DM.ISUPASSPORTDTE = P.ISUPASSPORTDTE,
                 DM.ISUPASSPORTPLACE = P.ISUPASSPORTPLACE,
                 DM.PASSPORTEXPDTE = P.PASSPORTEXPDTE,
                 DM.PASSPORTTYPE = P.PASSPORTTYPE,
                 DM.LOSTPASSPORTDTE = P.LOSTPASSPORTDTE,
                 DM.LOSTPASSPORTPLACE = P.LOSTPASSPORTPLACE,
                 DM.TMIDDLENM = P.TMIDDLENM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.REMARK = P.REMARK,
                 DM.CREUSR = P.CREUSR,
                 DM.CREDTE = P.CREDTE,
                 DM.UPDUSR = P.UPDUSR,
                 DM.UPDDTE = P.UPDDTE,
                 DM.NEWPASSPORTNO = P.NEWPASSPORTNO,
                 DM.NEWPASSPORTTYPE = P.NEWPASSPORTTYPE,
                 DM.NEWISUPASSPORTDTE = P.NEWISUPASSPORTDTE,
                 DM.NEWISUPASSPORTPLACE = P.NEWISUPASSPORTPLACE,
                 DM.NEWPASSPORTEXPDTE = P.NEWPASSPORTEXPDTE,
                 DM.INFORMPASSPORTDTE = P.INFORMPASSPORTDTE,
                 DM.OWNERAGE = P.OWNERAGE,
                 DM.AGCPHONE = P.AGCPHONE,
                 DM.EMGCONT = P.EMGCONT,
                 DM.DOCREF = P.DOCREF,
                 DM.SECLEV = P.SECLEV,
                 DM.REASONCD = P.REASONCD,
                 DM.AGCCONT = P.AGCCONT,
                 DM.OPERREF = P.OPERREF,
                 DM.TDCD = P.TDCD,
                 DM.LPPERSON = P.LPPERSON,
                 DM.POLISSTATION = P.POLISSTATION,
                 DM.VISATYPE_SEQNO = P.VISATYPE_SEQNO,
                 DM.VISAEXPDTE = P.VISAEXPDTE,
                 DM.TDT_SEQNO = P.TDT_SEQNO,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.PID = P.PID,
                 DM.ORG_CODE = P.ORG_CODE
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.LPPCD,
                  DM.NATIONCD,
                  DM.PASSPORTNO,
                  DM.CITIZENID,
                  DM.TFIRSTNM,
                  DM.TFAMILYNM,
                  DM.EFIRSTNM,
                  DM.EFAMILYNM,
                  DM.BIRTHDATE,
                  DM.SEX,
                  DM.ISUPASSPORTDTE,
                  DM.ISUPASSPORTPLACE,
                  DM.PASSPORTEXPDTE,
                  DM.PASSPORTTYPE,
                  DM.LOSTPASSPORTDTE,
                  DM.LOSTPASSPORTPLACE,
                  DM.TMIDDLENM,
                  DM.EMIDDLENM,
                  DM.REMARK,
                  DM.CREUSR,
                  DM.CREDTE,
                  DM.UPDUSR,
                  DM.UPDDTE,
                  DM.NEWPASSPORTNO,
                  DM.NEWPASSPORTTYPE,
                  DM.NEWISUPASSPORTDTE,
                  DM.NEWISUPASSPORTPLACE,
                  DM.NEWPASSPORTEXPDTE,
                  DM.INFORMPASSPORTDTE,
                  DM.OWNERAGE,
                  DM.AGCPHONE,
                  DM.EMGCONT,
                  DM.DOCREF,
                  DM.SECLEV,
                  DM.REASONCD,
                  DM.AGCCONT,
                  DM.OPERREF,
                  DM.TDCD,
                  DM.LPPERSON,
                  DM.POLISSTATION,
                  DM.VISATYPE_SEQNO,
                  DM.VISAEXPDTE,
                  DM.TDT_SEQNO,
                  DM.DEPT_SEQNO,
                  DM.PID,
                  DM.ORG_CODE)
          VALUES (P.LPPCD,
                  P.NATIONCD,
                  P.PASSPORTNO,
                  P.CITIZENID,
                  P.TFIRSTNM,
                  P.TFAMILYNM,
                  P.EFIRSTNM,
                  P.EFAMILYNM,
                  P.BIRTHDATE,
                  P.SEX,
                  P.ISUPASSPORTDTE,
                  P.ISUPASSPORTPLACE,
                  P.PASSPORTEXPDTE,
                  P.PASSPORTTYPE,
                  P.LOSTPASSPORTDTE,
                  P.LOSTPASSPORTPLACE,
                  P.TMIDDLENM,
                  P.EMIDDLENM,
                  P.REMARK,
                  P.CREUSR,
                  P.CREDTE,
                  P.UPDUSR,
                  P.UPDDTE,
                  P.NEWPASSPORTNO,
                  P.NEWPASSPORTTYPE,
                  P.NEWISUPASSPORTDTE,
                  P.NEWISUPASSPORTPLACE,
                  P.NEWPASSPORTEXPDTE,
                  P.INFORMPASSPORTDTE,
                  P.OWNERAGE,
                  P.AGCPHONE,
                  P.EMGCONT,
                  P.DOCREF,
                  P.SECLEV,
                  P.REASONCD,
                  P.AGCCONT,
                  P.OPERREF,
                  P.TDCD,
                  P.LPPERSON,
                  P.POLISSTATION,
                  P.VISATYPE_SEQNO,
                  P.VISAEXPDTE,
                  P.TDT_SEQNO,
                  P.DEPT_SEQNO,
                  P.PID,
                  P.ORG_CODE);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('LOSTPASSPORT_U_M', var_rows, SYSDATE);


   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('LOSTPASSPORT_U_M',
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
END P_LOSTPASSPORT_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_LOSTPASSPORT_M" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_LOSTPASSPORT_M" TO "BIOSAADM";
