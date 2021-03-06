CREATE TABLE "PIBICSDM2"."SYSUSER" 
   (	"USERID" CHAR(6 CHAR), 
	"WKGCD" VARCHAR2(20 CHAR), 
	"FIRSTNM" VARCHAR2(60 CHAR), 
	"FAMILYNM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
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
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"CHGPWDDTE" DATE, 
	"STATUS" VARCHAR2(10 CHAR), 
	"ORGCD" CHAR(4 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."SYSUSER" ADD CONSTRAINT "USERID_PK" PRIMARY KEY ("USERID")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."SYSUSER" ADD CONSTRAINT "WKGCD_FK" FOREIGN KEY ("WKGCD")
	  REFERENCES "PIBICSDM2"."WORKGROUP" ("WKGCD") DISABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."USERID_PK" ON "PIBICSDM2"."SYSUSER" ("USERID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."SYSUSER" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."SYSUSER" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."SYSUSER" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."SYSUSER" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."SYSUSER" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."SYSUSER" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."SYSUSER" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."SYSUSER" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."SYSUSER" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."SYSUSER" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."SYSUSER" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."SYSUSER" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."SYSUSER" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."SYSUSER" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."SYSUSER" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."SYSUSER" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."SYSUSER" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."SYSUSER" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."SYSUSER" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."SYSUSER" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."SYSUSER" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."SYSUSER" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."SYSUSER" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."SYSUSER" TO "BIOSAADM";
