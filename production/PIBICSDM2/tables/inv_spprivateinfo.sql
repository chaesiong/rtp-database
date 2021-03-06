CREATE TABLE "PIBICSDM2"."INV_SPPRIVATEINFO" 
   (	"SPP_SEQNO" NUMBER, 
	"SP_SEQNO" NUMBER, 
	"SPP_SECURITYLEVEL" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"ACTFLAG" CHAR(1 CHAR), 
	"PROFILE_SEQNO" NUMBER, 
	"SPP_REMARK" CLOB
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_SPPRIVATEINFO" ADD CONSTRAINT "INV_SPPRIVATEINFO_PK" PRIMARY KEY ("SPP_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SPPRIVATEINFO" ADD CONSTRAINT "INV_SPPRIVATEINFO_R01" FOREIGN KEY ("SP_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_SUSPECT" ("SP_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_SPPRIVATEINFO_PK" ON "PIBICSDM2"."INV_SPPRIVATEINFO" ("SPP_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301600C00011$$" ON "PIBICSDM2"."INV_SPPRIVATEINFO" (
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_SPPRIVATEINFO" TO "BIOSAADM";
