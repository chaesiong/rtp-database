CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_AGCCONTACT" ("AGCCONT_SEQNO", "AGCCONTCD", "AGCCONTNM", "AGCCONTFLAG", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "SORT") AS 
  SELECT 
    agccont_seqno
    ,agccontcd
    ,agccontnm
    ,agccontflag
    ,create_by
    ,create_date
    ,update_by
    ,update_date
    ,version
    ,sort
FROM pibicsdm2.agccontact;
  GRANT SELECT ON "DL_STAGING"."V_AGCCONTACT" TO "DL_BORDERCONTROL";
