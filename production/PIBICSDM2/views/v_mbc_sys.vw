CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."V_MBC_SYS" ("SYSTEM_CODE", "SYSTEM_NAME", "SYSTEM_VERSION", "SYSTEM_LICENSE", "SYSTEM_INSTALL", "MAXSYSTEM_SESSION", "LASTMODIFY", "UPD_USERID", "LASTUPDATE", "SYSTEM_PROFILE", "FLAGWLLOG") AS 
  SELECT 
    "SYSTEM_CODE","SYSTEM_NAME","SYSTEM_VERSION","SYSTEM_LICENSE","SYSTEM_INSTALL","MAXSYSTEM_SESSION","LASTMODIFY","UPD_USERID","LASTUPDATE","SYSTEM_PROFILE","FLAGWLLOG"
FROM 
    FW_SYSTEM;
  GRANT SELECT ON "PIBICSDM2"."V_MBC_SYS" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."V_MBC_SYS" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."V_MBC_SYS" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."V_MBC_SYS" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."V_MBC_SYS" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."V_MBC_SYS" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."V_MBC_SYS" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."V_MBC_SYS" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."V_MBC_SYS" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."V_MBC_SYS" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."V_MBC_SYS" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."V_MBC_SYS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."V_MBC_SYS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."V_MBC_SYS" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."V_MBC_SYS" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."V_MBC_SYS" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."V_MBC_SYS" TO "BIOSAADM";
