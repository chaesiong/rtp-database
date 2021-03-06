CREATE TABLE "PIBICSDM2"."INV_MTATTACHFILE" 
   (	"MTA_SEQNO" NUMBER, 
	"MT_SEQNO" NUMBER, 
	"MTA_FILENAME" VARCHAR2(60 CHAR), 
	"MTA_FILEPATH" VARCHAR2(60 CHAR), 
	"MTA_SECURITYLEVEL" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6)
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_MTATTACHFILE" ADD CONSTRAINT "INV_MTATTACHFILE_PK" PRIMARY KEY ("MTA_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_MTATTACHFILE" ADD CONSTRAINT "INV_MTATTACHFILE_R01" FOREIGN KEY ("MT_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_MASTERFILE" ("MT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_MTATTACHFILE_PK" ON "PIBICSDM2"."INV_MTATTACHFILE" ("MTA_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_MTATTACHFILE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_MTATTACHFILE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_MTATTACHFILE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_MTATTACHFILE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_MTATTACHFILE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_MTATTACHFILE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_MTATTACHFILE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_MTATTACHFILE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_MTATTACHFILE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_MTATTACHFILE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_MTATTACHFILE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_MTATTACHFILE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_MTATTACHFILE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_MTATTACHFILE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_MTATTACHFILE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_MTATTACHFILE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_MTATTACHFILE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_MTATTACHFILE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_MTATTACHFILE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_MTATTACHFILE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_MTATTACHFILE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_MTATTACHFILE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_MTATTACHFILE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_MTATTACHFILE" TO "BIOSAADM";
