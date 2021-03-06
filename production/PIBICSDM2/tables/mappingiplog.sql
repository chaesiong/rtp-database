CREATE TABLE "PIBICSDM2"."MAPPINGIPLOG" 
   (	"IPADDRESS" VARCHAR2(15 CHAR), 
	"CHECKPOINTNO" VARCHAR2(50 CHAR), 
	"APPCD" VARCHAR2(20 CHAR), 
	"MAPPINGID" NUMBER, 
	"LOGUSERID" CHAR(6 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"MAPPINGLOGID" NUMBER(5,0), 
	"MODULECD" CHAR(2 CHAR), 
	"DEPTCD" CHAR(5 CHAR), 
	"ORGCD" CHAR(4 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."MAPPINGIPLOG" ADD CONSTRAINT "MAPPINGLOG_PK" PRIMARY KEY ("MAPPINGLOGID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."MAPPINGLOG_PK" ON "PIBICSDM2"."MAPPINGIPLOG" ("MAPPINGLOGID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."MAPPINGIPLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."MAPPINGIPLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."MAPPINGIPLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."MAPPINGIPLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."MAPPINGIPLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."MAPPINGIPLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."MAPPINGIPLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."MAPPINGIPLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."MAPPINGIPLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."MAPPINGIPLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."MAPPINGIPLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."MAPPINGIPLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."MAPPINGIPLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."MAPPINGIPLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."MAPPINGIPLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."MAPPINGIPLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."MAPPINGIPLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."MAPPINGIPLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."MAPPINGIPLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."MAPPINGIPLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."MAPPINGIPLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."MAPPINGIPLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."MAPPINGIPLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."MAPPINGIPLOG" TO "BIOSAADM";
