CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_VISABYNATION" ("VISAN_SEQNO", "COUNTCD", "VISATYPECD", "DEFAULTVISA", "ACTFLAG", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "COUNT_SEQNO", "VISA_SEQNO", "VISATYPECDORG", "FIXDEPTLINE") AS 
  SELECT 
"VISAN_SEQNO","COUNTCD","VISATYPECD","DEFAULTVISA","ACTFLAG","CREATE_BY","CREATE_DATE","UPDATE_BY","UPDATE_DATE","VERSION","COUNT_SEQNO","VISA_SEQNO","VISATYPECDORG","FIXDEPTLINE"
FROM pibicsdm2.VISABYNATION;
  GRANT SELECT ON "DL_STAGING"."V_VISABYNATION" TO "DL_BORDERCONTROL";