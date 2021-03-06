CREATE TABLE "PIBICSDM2"."FW_PERMITSET" 
   (	"PERMISSION_ID" NUMBER(*,0), 
	"PERMISSION_DESC" VARCHAR2(50 CHAR), 
	"PERMISSION_NAME" VARCHAR2(30 CHAR), 
	"UPD_USERID" VARCHAR2(20 CHAR), 
	"LASTUPDATE" TIMESTAMP (6)
   ) ;
  ALTER TABLE "PIBICSDM2"."FW_PERMITSET" ADD CONSTRAINT "XPKFW_PERMITSET" PRIMARY KEY ("PERMISSION_ID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."XPKFW_PERMITSET" ON "PIBICSDM2"."FW_PERMITSET" ("PERMISSION_ID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITSET" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITSET" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITSET" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITSET" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITSET" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITSET" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITSET" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITSET" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITSET" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITSET" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITSET" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITSET" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FW_PERMITSET" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FW_PERMITSET" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FW_PERMITSET" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FW_PERMITSET" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FW_PERMITSET" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FW_PERMITSET" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FW_PERMITSET" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FW_PERMITSET" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FW_PERMITSET" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FW_PERMITSET" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FW_PERMITSET" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FW_PERMITSET" TO "BIOSAADM";
