CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_VISABYNATION" ("VISAN_SEQNO", "COUNTCD", "VISATYPECD", "DEFAULTVISA", "ACTFLAG", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "COUNT_SEQNO", "VISA_SEQNO", "VISATYPECDORG", "FIXDEPTLINE") AS 
  SELECT 
"VISAN_SEQNO","COUNTCD","VISATYPECD","DEFAULTVISA","ACTFLAG","CREATE_BY","CREATE_DATE","UPDATE_BY","UPDATE_DATE","VERSION","COUNT_SEQNO","VISA_SEQNO","VISATYPECDORG","FIXDEPTLINE"
FROM pibicsdm2.VISABYNATION;
  GRANT SELECT ON "DL_STAGING"."V_VISABYNATION" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_STAGING"."V_VISABYNATION" TO "BIO_BD";
  GRANT SELECT ON "DL_STAGING"."V_VISABYNATION" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING"."V_VISABYNATION" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING"."V_VISABYNATION" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_STAGING"."V_VISABYNATION" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING"."V_VISABYNATION" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING"."V_VISABYNATION" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING"."V_VISABYNATION" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING"."V_VISABYNATION" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING"."V_VISABYNATION" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING"."V_VISABYNATION" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING"."V_VISABYNATION" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING"."V_VISABYNATION" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING"."V_VISABYNATION" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_STAGING"."V_VISABYNATION" TO "BIOSAADM";
