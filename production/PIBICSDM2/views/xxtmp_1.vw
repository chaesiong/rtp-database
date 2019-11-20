CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."XXTMP_1" ("WLCD", "OWNERAGE", "AGCCONT", "AGCPHONE", "EMGCONT", "DOCREF", "SECLEV", "BIRTHPLACE", "ADDR", "HOUSE", "SOI", "ROAD", "MOO", "DISTRICT", "CITY", "STATE", "CURZIPCODE", "HEIGHT", "WEIGHT", "HAIRCOLOR", "HAIR", "FACE", "BUILD", "EYECOLOR", "COMPLEXION", "FEATURE", "PECULIARITY", "OCCCD", "TARGETNO", "OPERREF", "OWNERORG", "WARRNO", "WARRDTE", "WARREXPDTE", "DOCREFER", "BLAWSNO", "RLAWSNO", "PENALNO", "ALLEGECD", "REASONCD", "TDCD", "CREUSR", "CREDTE", "CREORG", "UPDUSR", "UPDDTE", "UPDORG", "DOCDTE", "DOCNO", "STS", "CAUSE", "BIRTHDTE", "SEX", "NATIONCD", "LOGUSERID", "LOGFLAG", "LOGDTE", "OTHERAGCCONT", "RMK1", "RMK2", "RMK3", "RMK4", "RMKDTE", "RMKDTE1", "WATCHLISTLOGID", "PRECINCTCD", "ARREST", "PERMITDTE1", "PERMITDTE2", "PERMIT", "RMKAGCCONT", "RMKARREST", "RMKPERMIT", "DELREMARK", "RMK11", "RMK12", "RMK13", "RMKDTE11", "RMKDTE12", "RMKMORE", "REASON_OTH", "REASON_TYPE_SEQNO", "CARD_ID", "FLAGCHECKPOINT", "CASES_NO", "LOGIN_ID", "KEY_DATE", "HIDDENREMARK", "PV_SEQNO", "TMB_SEQNO", "AMP_SEQNO", "HIDEDTE", "NATION_SEQNO", "REASON_SEQNO", "OPER_SEQNO", "TD_SEQNO", "DEPT_SEQNO", "REMARK") AS 
  SELECT "WLCD","OWNERAGE","AGCCONT","AGCPHONE","EMGCONT","DOCREF","SECLEV","BIRTHPLACE","ADDR","HOUSE","SOI","ROAD","MOO","DISTRICT","CITY","STATE","CURZIPCODE","HEIGHT","WEIGHT","HAIRCOLOR","HAIR","FACE","BUILD","EYECOLOR","COMPLEXION","FEATURE","PECULIARITY","OCCCD","TARGETNO","OPERREF","OWNERORG","WARRNO","WARRDTE","WARREXPDTE","DOCREFER","BLAWSNO","RLAWSNO","PENALNO","ALLEGECD","REASONCD","TDCD","CREUSR","CREDTE","CREORG","UPDUSR","UPDDTE","UPDORG","DOCDTE","DOCNO","STS","CAUSE","BIRTHDTE","SEX","NATIONCD","LOGUSERID","LOGFLAG","LOGDTE","OTHERAGCCONT","RMK1","RMK2","RMK3","RMK4","RMKDTE","RMKDTE1","WATCHLISTLOGID","PRECINCTCD","ARREST","PERMITDTE1","PERMITDTE2","PERMIT","RMKAGCCONT","RMKARREST","RMKPERMIT","DELREMARK","RMK11","RMK12","RMK13","RMKDTE11","RMKDTE12","RMKMORE","REASON_OTH","REASON_TYPE_SEQNO","CARD_ID","FLAGCHECKPOINT","CASES_NO","LOGIN_ID","KEY_DATE","HIDDENREMARK","PV_SEQNO","TMB_SEQNO","AMP_SEQNO","HIDEDTE","NATION_SEQNO","REASON_SEQNO","OPER_SEQNO","TD_SEQNO","DEPT_SEQNO","REMARK"
     FROM PIBICS.WATCHLISTLOG@PIBICS_PROD
    WHERE LOGDTE >= TO_DATE(TO_CHAR (TRUNC (SYSDATE) - 1, 'YYYYMMDD'),'YYYYMMDD')
      AND LOGDTE <= TO_DATE(TO_CHAR (TRUNC (SYSDATE), 'YYYYMMDD'),'YYYYMMDD');
  GRANT SELECT ON "PIBICSDM2"."XXTMP_1" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."XXTMP_1" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."XXTMP_1" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."XXTMP_1" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."XXTMP_1" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."XXTMP_1" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."XXTMP_1" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."XXTMP_1" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."XXTMP_1" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."XXTMP_1" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."XXTMP_1" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."XXTMP_1" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."XXTMP_1" TO "BIOSAADM";
