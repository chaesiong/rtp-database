CREATE TABLE "PIBICSDM2"."SETTINGLOG" 
   (	"SETTINGID" NUMBER, 
	"MINPWD" NUMBER, 
	"LOCKTIMES" NUMBER, 
	"VALIDPWD" NUMBER, 
	"LOGUSERID" CHAR(20 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"SETTINGLOGID" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."SETTINGLOG" ADD CONSTRAINT "SETTINGLOG_PK" PRIMARY KEY ("SETTINGLOGID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SETTINGLOG_PK" ON "PIBICSDM2"."SETTINGLOG" ("SETTINGLOGID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."SETTINGLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."SETTINGLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."SETTINGLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."SETTINGLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."SETTINGLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."SETTINGLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."SETTINGLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."SETTINGLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."SETTINGLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."SETTINGLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."SETTINGLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."SETTINGLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."SETTINGLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."SETTINGLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."SETTINGLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."SETTINGLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."SETTINGLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."SETTINGLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."SETTINGLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."SETTINGLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."SETTINGLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."SETTINGLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."SETTINGLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."SETTINGLOG" TO "BIOSAADM";
