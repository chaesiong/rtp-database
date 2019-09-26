CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_CRS_RESCERTTYPE" ("RESCERTTYPE_SEQNO", "RESCERTTYPECD", "RESCERTTYPENM", "ACTFLAG", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION") AS 
  SELECT 
    rescerttype_seqno,
    rescerttypecd,
    rescerttypenm,
    actflag,
    create_by,
    create_date,
    update_by,
    update_date,
    version
FROM pibicsdm2.crs_rescerttype;
  GRANT SELECT ON "DL_STAGING"."V_CRS_RESCERTTYPE" TO "DL_BORDERCONTROL";
