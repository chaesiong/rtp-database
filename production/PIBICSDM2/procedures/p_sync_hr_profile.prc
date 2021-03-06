CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_SYNC_HR_PROFILE" 
IS

var_rows NUMBER;

BEGIN
  MERGE INTO PIBICSDM2.HR_PROFILE DM
  USING (SELECT H.* FROM PIBICS.HR_PROFILE@PIBICS_PROD H
    WHERE H.PROFILE_SEQNO IN (
        SELECT F.PERSON_ID FROM PIBICSDM2.FW_USER F WHERE
        UPPER(F.USER_ID) NOT IN (SELECT USER_ID FROM PIBICSDM2.FW_USER WHERE USER_ID LIKE '%.%')
        AND F.USER_ID LIKE '%.%' 
    ) AND H.PROFILE_SEQNO IS NOT NULL
  ) P
  ON (DM.PROFILE_SEQNO = P.PROFILE_SEQNO)
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.PROFILE_SEQNO,
     DM.PID,
     DM.RANK_SEQNO,
     DM.LEVEL_SEQNO,
     DM.REL_SEQNO,
     DM.TITLE_SEQNO,
     DM.CARD_ID,
     DM.NAME,
     DM.SNAME,
     DM.SEX,
     DM.C_TYPE,
     DM.MAR_STATUS,
     DM.STATUS_SEQNO,
     DM.BIRTH_DATE,
     DM.POS_SEQNO,
     DM.KP7,
     DM.RETIRE_DATE,
     DM.SIXTY_DATE,
     DM.QUIT_DATE,
     DM.BANK_SEQNO,
     DM.ACC_NO,
     DM.ADDRESS1,
     DM.ADDRESS2,
     DM.PROV_CODE,
     DM.POST_CODE,
     DM.TEL,
     DM.MOBILE,
     DM.EMAIL,
     DM.HEALTH_BENEFIT,
     DM.CREMATION,
     DM.CREATE_BY,
     DM.CREATE_DATE,
     DM.UPDATE_BY,
     DM.UPDATE_DATE,
     DM.VERSION,
     DM.DEPT_SEQNO,
     DM.POS_DATE,
     DM.POS_NO,
     DM.STATUS_TM,
     DM.DEPTPOLIS_SEQNO,
     DM.PD_SEQNO,
     DM.SHIFT_SEQNO) 
  VALUES (     P.PROFILE_SEQNO,
     P.PID,
     P.RANK_SEQNO,
     P.LEVEL_SEQNO,
     P.REL_SEQNO,
     P.TITLE_SEQNO,
     P.CARD_ID,
     P.NAME,
     P.SNAME,
     P.SEX,
     P.C_TYPE,
     P.MAR_STATUS,
     P.STATUS_SEQNO,
     P.BIRTH_DATE,
     P.POS_SEQNO,
     P.KP7,
     P.RETIRE_DATE,
     P.SIXTY_DATE,
     P.QUIT_DATE,
     P.BANK_SEQNO,
     P.ACC_NO,
     P.ADDRESS1,
     P.ADDRESS2,
     P.PROV_CODE,
     P.POST_CODE,
     P.TEL,
     P.MOBILE,
     P.EMAIL,
     P.HEALTH_BENEFIT,
     P.CREMATION,
     P.CREATE_BY,
     P.CREATE_DATE,
     P.UPDATE_BY,
     P.UPDATE_DATE,
     P.VERSION,
     P.DEPT_SEQNO,
     P.POS_DATE,
     P.POS_NO,
     P.STATUS_TM,
     P.DEPTPOLIS_SEQNO,
     P.PD_SEQNO,
     P.SHIFT_SEQNO);
     
 var_rows := SQL%ROWCOUNT;
 
 INSERT INTO IMPORT_LOG
  VALUES ('SYNC_HR_PROFILE', var_rows, SYSDATE);
     
 COMMIT;
 
END P_SYNC_HR_PROFILE;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_SYNC_HR_PROFILE" TO "BIOSAADM";
