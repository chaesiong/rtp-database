CREATE TABLE "PIBICSDM2"."FW_PERMITITEM" 
   (	"ITEM_SEQ" NUMBER, 
	"ITEM_NAME" VARCHAR2(50 CHAR), 
	"CREATEDATE" TIMESTAMP (6), 
	"ITEM_DESC" VARCHAR2(50 CHAR), 
	"CREATEUSERID" VARCHAR2(20 CHAR), 
	"UPD_USERID" VARCHAR2(20 CHAR), 
	"LASTUPDATE" TIMESTAMP (6)
   ) ;
  ALTER TABLE "PIBICSDM2"."FW_PERMITITEM" ADD CONSTRAINT "XPKFW_PERMITITEM" PRIMARY KEY ("ITEM_SEQ")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."XAK1FW_PERMITITEM" ON "PIBICSDM2"."FW_PERMITITEM" ("ITEM_NAME") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."XPKFW_PERMITITEM" ON "PIBICSDM2"."FW_PERMITITEM" ("ITEM_SEQ") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITITEM" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITITEM" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITITEM" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITITEM" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITITEM" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITITEM" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITITEM" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITITEM" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITITEM" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITITEM" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITITEM" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITITEM" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FW_PERMITITEM" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FW_PERMITITEM" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FW_PERMITITEM" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FW_PERMITITEM" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITITEM" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FW_PERMITITEM" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FW_PERMITITEM" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FW_PERMITITEM" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FW_PERMITITEM" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FW_PERMITITEM" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FW_PERMITITEM" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FW_PERMITITEM" TO "BIOSAADM";
