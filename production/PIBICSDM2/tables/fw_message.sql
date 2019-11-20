CREATE TABLE "PIBICSDM2"."FW_MESSAGE" 
   (	"MESSAGE_ID" NUMBER, 
	"MESSAGE_DESC" VARCHAR2(250 CHAR), 
	"MESSAGE_TARGET" CHAR(1 CHAR), 
	"MESSAGE_EXPDATE" TIMESTAMP (6), 
	"MESSAGE_EFFECTTIME" TIMESTAMP (6), 
	"UPD_USERID" VARCHAR2(20 CHAR), 
	"MESSAGE_TYPE" CHAR(1 CHAR), 
	"LASTUPDATE" TIMESTAMP (6)
   ) ;
  ALTER TABLE "PIBICSDM2"."FW_MESSAGE" ADD CONSTRAINT "XPKFW_MESSAGE" PRIMARY KEY ("MESSAGE_ID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."XPKFW_MESSAGE" ON "PIBICSDM2"."FW_MESSAGE" ("MESSAGE_ID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FW_MESSAGE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FW_MESSAGE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_MESSAGE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FW_MESSAGE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_MESSAGE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_MESSAGE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_MESSAGE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FW_MESSAGE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FW_MESSAGE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FW_MESSAGE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FW_MESSAGE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FW_MESSAGE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FW_MESSAGE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FW_MESSAGE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FW_MESSAGE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FW_MESSAGE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FW_MESSAGE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FW_MESSAGE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FW_MESSAGE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FW_MESSAGE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FW_MESSAGE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FW_MESSAGE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FW_MESSAGE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FW_MESSAGE" TO "BIOSAADM";
