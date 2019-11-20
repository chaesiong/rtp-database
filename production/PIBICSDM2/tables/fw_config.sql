CREATE TABLE "PIBICSDM2"."FW_CONFIG" 
   (	"NAME" VARCHAR2(255 CHAR), 
	"VALUE" VARCHAR2(255 CHAR)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."FW_CONFIG_PK" ON "PIBICSDM2"."FW_CONFIG" ("NAME") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FW_CONFIG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FW_CONFIG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_CONFIG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FW_CONFIG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_CONFIG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_CONFIG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_CONFIG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FW_CONFIG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FW_CONFIG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FW_CONFIG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FW_CONFIG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FW_CONFIG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FW_CONFIG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FW_CONFIG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FW_CONFIG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FW_CONFIG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FW_CONFIG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FW_CONFIG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FW_CONFIG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FW_CONFIG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FW_CONFIG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FW_CONFIG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FW_CONFIG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FW_CONFIG" TO "BIOSAADM";
