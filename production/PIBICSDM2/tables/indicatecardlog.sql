CREATE TABLE "PIBICSDM2"."INDICATECARDLOG" 
   (	"IDCCD" CHAR(4 CHAR), 
	"IDCTNM" VARCHAR2(60 CHAR), 
	"IDCENM" VARCHAR2(60 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"UPDUSR" VARCHAR2(30 CHAR), 
	"UPDDTE" DATE, 
	"LOGUSERID" CHAR(6 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"INDICATECARDLOGID" NUMBER(5,0)
   ) ;
  ALTER TABLE "PIBICSDM2"."INDICATECARDLOG" ADD CONSTRAINT "INDICATECARDLOG_PK" PRIMARY KEY ("INDICATECARDLOGID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INDICATECARDLOG_PK" ON "PIBICSDM2"."INDICATECARDLOG" ("INDICATECARDLOGID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."INDICATECARDLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARDLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARDLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARDLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARDLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARDLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARDLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARDLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARDLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARDLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARDLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARDLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INDICATECARDLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INDICATECARDLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INDICATECARDLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INDICATECARDLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARDLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INDICATECARDLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INDICATECARDLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INDICATECARDLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INDICATECARDLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INDICATECARDLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INDICATECARDLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INDICATECARDLOG" TO "BIOSAADM";
