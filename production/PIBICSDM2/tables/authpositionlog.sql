CREATE TABLE "PIBICSDM2"."AUTHPOSITIONLOG" 
   (	"AUTHPOSID" NUMBER(10,0), 
	"WKGCD" VARCHAR2(20 CHAR), 
	"POSLEVELID" CHAR(2 CHAR), 
	"LOGUSERID" CHAR(6 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"AUTHPOSITIONLOGID" NUMBER(5,0)
   ) ;
  ALTER TABLE "PIBICSDM2"."AUTHPOSITIONLOG" ADD CONSTRAINT "AUTHPOSITIONLOG_PK" PRIMARY KEY ("AUTHPOSITIONLOGID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."AUTHPOSITIONLOG_PK" ON "PIBICSDM2"."AUTHPOSITIONLOG" ("AUTHPOSITIONLOGID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."AUTHPOSITIONLOG" TO "BIOSAADM";
