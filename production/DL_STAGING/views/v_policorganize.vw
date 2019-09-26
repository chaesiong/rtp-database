CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_POLICORGANIZE" ("ORG_SEQNO", "ORGCD", "ORGNM", "ACTFLAG", "EXTFLAG", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION") AS 
  SELECT 
    org_seqno
    ,orgcd
    ,orgnm
    ,actflag
    ,extflag
    ,create_by
    ,create_date
    ,update_by
    ,update_date
    ,version
FROM pibicsdm2.policorganize;
  GRANT SELECT ON "DL_STAGING"."V_POLICORGANIZE" TO "DL_BORDERCONTROL";
