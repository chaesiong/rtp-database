CREATE TABLE "PIBICSDM2"."FW_TESTING" 
   (	"TST_SEQ" NUMBER, 
	"SYSTEM_CODE" VARCHAR2(10 CHAR), 
	"USER_ID" VARCHAR2(20 CHAR), 
	"REMARK" VARCHAR2(50 CHAR), 
	"INITIALDATE" TIMESTAMP (6), 
	"EXPIREDATE" TIMESTAMP (6), 
	"SEX" CHAR(1 CHAR), 
	"UPD_USERID" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"LASTUPDATE" TIMESTAMP (6)
   ) ;
  ALTER TABLE "PIBICSDM2"."FW_TESTING" ADD CONSTRAINT "XPKFW_TESTING" PRIMARY KEY ("TST_SEQ")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."FW_TESTING" ADD CONSTRAINT "R_49" FOREIGN KEY ("SYSTEM_CODE")
	  REFERENCES "PIBICSDM2"."FW_SYSTEM" ("SYSTEM_CODE") ENABLE;
  ALTER TABLE "PIBICSDM2"."FW_TESTING" ADD CONSTRAINT "R_48" FOREIGN KEY ("USER_ID")
	  REFERENCES "PIBICSDM2"."FW_USER" ("USER_ID") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."XPKFW_TESTING" ON "PIBICSDM2"."FW_TESTING" ("TST_SEQ") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FW_TESTING" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FW_TESTING" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_TESTING" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FW_TESTING" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_TESTING" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_TESTING" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_TESTING" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FW_TESTING" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FW_TESTING" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FW_TESTING" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FW_TESTING" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FW_TESTING" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FW_TESTING" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FW_TESTING" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FW_TESTING" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FW_TESTING" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FW_TESTING" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FW_TESTING" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FW_TESTING" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FW_TESTING" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FW_TESTING" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FW_TESTING" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FW_TESTING" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FW_TESTING" TO "BIOSAADM";
