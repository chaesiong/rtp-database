CREATE TABLE "PIBICSDM2"."SYSUSERLOG" 
   (	"USERID" CHAR(6 CHAR), 
	"WKGCD" VARCHAR2(20 CHAR), 
	"FIRSTNM" VARCHAR2(60 CHAR), 
	"FAMILYNM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"CITIZENID" CHAR(13 CHAR), 
	"RANKID" CHAR(2 CHAR), 
	"POSLEVELID" CHAR(2 CHAR), 
	"DEPTCD" CHAR(5 CHAR), 
	"PWD" VARCHAR2(20 CHAR), 
	"USERTYPE" CHAR(1 CHAR), 
	"CHGPWD" CHAR(1 CHAR), 
	"LOCKS" CHAR(1 CHAR), 
	"UPDUSR" CHAR(6 CHAR), 
	"UPDDTE" DATE, 
	"LOGUSERID" CHAR(6 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"SYSUSERLOGID" NUMBER(5,0), 
	"CHGPWDDTE" DATE, 
	"STATUS" VARCHAR2(10 CHAR), 
	"ORGCD" CHAR(4 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."SYSUSERLOG" ADD CONSTRAINT "SYSUSERLOG_PK" PRIMARY KEY ("SYSUSERLOGID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYSUSERLOG_PK" ON "PIBICSDM2"."SYSUSERLOG" ("SYSUSERLOGID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."SYSUSERLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."SYSUSERLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."SYSUSERLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."SYSUSERLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."SYSUSERLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."SYSUSERLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."SYSUSERLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."SYSUSERLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."SYSUSERLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."SYSUSERLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."SYSUSERLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."SYSUSERLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."SYSUSERLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."SYSUSERLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."SYSUSERLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."SYSUSERLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."SYSUSERLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."SYSUSERLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."SYSUSERLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."SYSUSERLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."SYSUSERLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."SYSUSERLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."SYSUSERLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."SYSUSERLOG" TO "BIOSAADM";
