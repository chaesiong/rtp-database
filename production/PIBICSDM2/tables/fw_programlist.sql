CREATE TABLE "PIBICSDM2"."FW_PROGRAMLIST" 
   (	"PROGRAM_ID" VARCHAR2(25 CHAR), 
	"PERMISSION_ID" NUMBER(*,0), 
	"SYSTEM_CODE" VARCHAR2(10 CHAR), 
	"LINK" VARCHAR2(300 CHAR), 
	"PROGRAM_NAME" VARCHAR2(200 CHAR), 
	"PERIOD_ID" VARCHAR2(10 CHAR), 
	"PROGRAM_TYPE" CHAR(1 CHAR), 
	"MAX_ACCESS" NUMBER, 
	"DESCRIPTION" VARCHAR2(100 CHAR), 
	"UPD_USERID" VARCHAR2(20 CHAR), 
	"LASTUPDATE" TIMESTAMP (6)
   ) ;
  ALTER TABLE "PIBICSDM2"."FW_PROGRAMLIST" ADD CONSTRAINT "XPKFW_PROGRAMLIST" PRIMARY KEY ("PROGRAM_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."FW_PROGRAMLIST" ADD CONSTRAINT "R_41" FOREIGN KEY ("SYSTEM_CODE")
	  REFERENCES "PIBICSDM2"."FW_SYSTEM" ("SYSTEM_CODE") ENABLE;
  ALTER TABLE "PIBICSDM2"."FW_PROGRAMLIST" ADD CONSTRAINT "R_61" FOREIGN KEY ("PERMISSION_ID")
	  REFERENCES "PIBICSDM2"."FW_PERMITSET" ("PERMISSION_ID") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."XPKFW_PROGRAMLIST" ON "PIBICSDM2"."FW_PROGRAMLIST" ("PROGRAM_ID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAMLIST" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAMLIST" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAMLIST" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAMLIST" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAMLIST" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAMLIST" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAMLIST" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAMLIST" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAMLIST" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAMLIST" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAMLIST" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAMLIST" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FW_PROGRAMLIST" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FW_PROGRAMLIST" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FW_PROGRAMLIST" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FW_PROGRAMLIST" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAMLIST" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FW_PROGRAMLIST" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FW_PROGRAMLIST" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FW_PROGRAMLIST" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FW_PROGRAMLIST" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FW_PROGRAMLIST" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FW_PROGRAMLIST" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FW_PROGRAMLIST" TO "BIOSAADM";
