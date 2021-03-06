CREATE TABLE "PIBICSDM2"."APPLICATIONLOG" 
   (	"APPCD" VARCHAR2(20 CHAR), 
	"APPNM" VARCHAR2(100 CHAR), 
	"APPABR" VARCHAR2(30 CHAR), 
	"APPDESC" VARCHAR2(200 CHAR), 
	"UPDUSR" CHAR(6 CHAR), 
	"UPDDTE" DATE, 
	"LOGUSERID" CHAR(6 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"APPLICATIONLOGID" NUMBER(5,0)
   ) ;
  ALTER TABLE "PIBICSDM2"."APPLICATIONLOG" ADD CONSTRAINT "APPLICATIONLOG_PK" PRIMARY KEY ("APPLICATIONLOGID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."APPLICATIONLOG_PK" ON "PIBICSDM2"."APPLICATIONLOG" ("APPLICATIONLOGID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."APPLICATIONLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."APPLICATIONLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."APPLICATIONLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."APPLICATIONLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."APPLICATIONLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."APPLICATIONLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."APPLICATIONLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."APPLICATIONLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."APPLICATIONLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."APPLICATIONLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."APPLICATIONLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."APPLICATIONLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."APPLICATIONLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."APPLICATIONLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."APPLICATIONLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."APPLICATIONLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."APPLICATIONLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."APPLICATIONLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."APPLICATIONLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."APPLICATIONLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."APPLICATIONLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."APPLICATIONLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."APPLICATIONLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."APPLICATIONLOG" TO "BIOSAADM";
