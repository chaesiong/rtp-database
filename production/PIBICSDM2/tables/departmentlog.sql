CREATE TABLE "PIBICSDM2"."DEPARTMENTLOG" 
   (	"DEPTCD" CHAR(5 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"ADDR" VARCHAR2(250 CHAR), 
	"ADEPTTYPE" CHAR(1 CHAR), 
	"CITYCD" CHAR(3 CHAR), 
	"DEPTENM" VARCHAR2(60 CHAR), 
	"DEPTTNM" VARCHAR2(60 CHAR), 
	"DISTRICT" VARCHAR2(60 CHAR), 
	"FAX" VARCHAR2(60 CHAR), 
	"SDEDPTTYPE" CHAR(1 CHAR), 
	"STATECD" CHAR(2 CHAR), 
	"SUPDEPTD" CHAR(5 CHAR), 
	"TELNO" VARCHAR2(60 CHAR), 
	"UPDDEPT" DATE, 
	"UPDDTE" DATE, 
	"UPDUSR" CHAR(6 CHAR), 
	"ZIPCODE" CHAR(5 CHAR), 
	"LOGUSERID" CHAR(6 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"DEPARTMENTLOGID" NUMBER(5,0), 
	"CONVCD" CHAR(4 CHAR), 
	"CASINO_FLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."DEPARTMENTLOG" ADD CONSTRAINT "DEPARTMENTLOG_PK" PRIMARY KEY ("DEPARTMENTLOGID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."DEPARTMENTLOG_PK" ON "PIBICSDM2"."DEPARTMENTLOG" ("DEPARTMENTLOGID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."DEPARTMENTLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."DEPARTMENTLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."DEPARTMENTLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."DEPARTMENTLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."DEPARTMENTLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."DEPARTMENTLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."DEPARTMENTLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."DEPARTMENTLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."DEPARTMENTLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."DEPARTMENTLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."DEPARTMENTLOG" TO "BIOSAADM";
