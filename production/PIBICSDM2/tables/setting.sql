CREATE TABLE "PIBICSDM2"."SETTING" 
   (	"VALIDPWD" NUMBER(5,0), 
	"LOCKTIMES" NUMBER(5,0), 
	"MINPWD" NUMBER(1,0), 
	"SETTINGID" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"RFCTM" NUMBER(1,0), 
	"CHECKDUP" CHAR(1 CHAR), 
	"CHKINTERPOL" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."SETTING" ADD CONSTRAINT "SETTINGPK" PRIMARY KEY ("SETTINGID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SETTINGPK" ON "PIBICSDM2"."SETTING" ("SETTINGID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."SETTING" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."SETTING" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."SETTING" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."SETTING" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."SETTING" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."SETTING" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."SETTING" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."SETTING" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."SETTING" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."SETTING" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."SETTING" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."SETTING" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."SETTING" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."SETTING" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."SETTING" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."SETTING" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."SETTING" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."SETTING" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."SETTING" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."SETTING" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."SETTING" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."SETTING" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."SETTING" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."SETTING" TO "BIOSAADM";
