CREATE TABLE "PIBICSDM2"."OT_SETTINGDUE" 
   (	"OSDSEQNO" NUMBER, 
	"COMMISSIONFUND" NUMBER, 
	"WARRANTFUND" NUMBER, 
	"EMPLOYEEFUND" NUMBER
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."OT_SETTINGDUE_PK" ON "PIBICSDM2"."OT_SETTINGDUE" ("OSDSEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."OT_SETTINGDUE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."OT_SETTINGDUE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_SETTINGDUE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."OT_SETTINGDUE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_SETTINGDUE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_SETTINGDUE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_SETTINGDUE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."OT_SETTINGDUE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."OT_SETTINGDUE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."OT_SETTINGDUE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."OT_SETTINGDUE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."OT_SETTINGDUE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."OT_SETTINGDUE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."OT_SETTINGDUE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."OT_SETTINGDUE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."OT_SETTINGDUE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."OT_SETTINGDUE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."OT_SETTINGDUE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."OT_SETTINGDUE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."OT_SETTINGDUE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."OT_SETTINGDUE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."OT_SETTINGDUE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."OT_SETTINGDUE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."OT_SETTINGDUE" TO "BIOSAADM";
