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
  GRANT SELECT ON "DL_STAGING"."V_OPERATIONREF" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING"."V_OPERATIONREF" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_STAGING"."V_OPERATIONREF" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING"."V_OPERATIONREF" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING"."V_OPERATIONREF" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING"."V_OPERATIONREF" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING"."V_OPERATIONREF" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING"."V_OPERATIONREF" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING"."V_OPERATIONREF" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING"."V_OPERATIONREF" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING"."V_OPERATIONREF" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING"."V_OPERATIONREF" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_STAGING"."V_OPERATIONREF" TO "BIOSAADM";
