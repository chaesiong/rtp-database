CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_PASSPORTSTATUS" ("PPS_SEQNO", "PPS_CODE", "PPS_DESC", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "ACTFLAG") AS 
  SELECT 
    pps_seqno
	, pps_code
	, pps_desc
	, create_by
	, create_date
	, update_by
	, update_date
	, version, actflag
FROM pibicsdm2.passportstatus;
  GRANT SELECT ON "DL_STAGING"."V_PASSPORTSTATUS" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_STAGING"."V_PASSPORTSTATUS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING"."V_PASSPORTSTATUS" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_STAGING"."V_PASSPORTSTATUS" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING"."V_PASSPORTSTATUS" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING"."V_PASSPORTSTATUS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING"."V_PASSPORTSTATUS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING"."V_PASSPORTSTATUS" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING"."V_PASSPORTSTATUS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING"."V_PASSPORTSTATUS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING"."V_PASSPORTSTATUS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING"."V_PASSPORTSTATUS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING"."V_PASSPORTSTATUS" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_STAGING"."V_PASSPORTSTATUS" TO "BIOSAADM";