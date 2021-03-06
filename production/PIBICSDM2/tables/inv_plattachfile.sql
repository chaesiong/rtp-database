CREATE TABLE "PIBICSDM2"."INV_PLATTACHFILE" 
   (	"PLA_SEQNO" NUMBER, 
	"PL_SEQNO" NUMBER, 
	"PLA_FILENAME" VARCHAR2(30 CHAR), 
	"PLA_FILEPATH" VARCHAR2(60 CHAR), 
	"PLA_SECURITYLEVEL" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6)
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_PLATTACHFILE" ADD CONSTRAINT "INV_PLATTACHFILE_PK" PRIMARY KEY ("PLA_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_PLATTACHFILE" ADD CONSTRAINT "INV_PLATTACHFILE_R01" FOREIGN KEY ("PL_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_PLACE" ("PL_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_PLATTACHFILE_PK" ON "PIBICSDM2"."INV_PLATTACHFILE" ("PLA_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_PLATTACHFILE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_PLATTACHFILE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLATTACHFILE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_PLATTACHFILE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLATTACHFILE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLATTACHFILE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLATTACHFILE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_PLATTACHFILE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_PLATTACHFILE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_PLATTACHFILE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLATTACHFILE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_PLATTACHFILE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_PLATTACHFILE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_PLATTACHFILE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_PLATTACHFILE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_PLATTACHFILE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_PLATTACHFILE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_PLATTACHFILE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_PLATTACHFILE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_PLATTACHFILE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_PLATTACHFILE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_PLATTACHFILE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_PLATTACHFILE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_PLATTACHFILE" TO "BIOSAADM";
