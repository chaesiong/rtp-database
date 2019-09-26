CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_OPERATIONREF" ("OPER_SEQNO", "OPERCD", "OPERREF", "OPERFLAG", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION") AS 
  SELECT 
    oper_seqno
    ,opercd
    ,operref
    ,operflag
    ,create_by
    ,create_date
    ,update_by
    ,update_date
    ,version
FROM pibicsdm2.operationref;
  GRANT SELECT ON "DL_STAGING"."V_OPERATIONREF" TO "DL_BORDERCONTROL";
