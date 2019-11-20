CREATE TABLE "PIBICSDM2"."INV_SPEDUCATION" 
   (	"SPE_SEQNO" NUMBER, 
	"SP_SEQNO" NUMBER, 
	"SPE_INSTITUTE" VARCHAR2(60 CHAR), 
	"SPE_DEGREE" VARCHAR2(60 CHAR), 
	"COUNT_SEQNO" NUMBER, 
	"SPE_STARTYEAR" CHAR(4 CHAR), 
	"SPE_FINISHYEAR" CHAR(4 CHAR), 
	"SPE_REMARK" VARCHAR2(500 CHAR), 
	"SPE_SECURITYLEVEL" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_SPEDUCATION" ADD CONSTRAINT "INV_SPEDUCATION_PK" PRIMARY KEY ("SPE_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SPEDUCATION" ADD CONSTRAINT "INV_SPEDUCATION_R02" FOREIGN KEY ("COUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SPEDUCATION" ADD CONSTRAINT "INV_SPEDUCATION_R01" FOREIGN KEY ("SP_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_SUSPECT" ("SP_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_SPEDUCATION_PK" ON "PIBICSDM2"."INV_SPEDUCATION" ("SPE_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_SPEDUCATION" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_SPEDUCATION" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPEDUCATION" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_SPEDUCATION" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPEDUCATION" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPEDUCATION" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPEDUCATION" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_SPEDUCATION" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_SPEDUCATION" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_SPEDUCATION" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPEDUCATION" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_SPEDUCATION" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_SPEDUCATION" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_SPEDUCATION" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_SPEDUCATION" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_SPEDUCATION" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_SPEDUCATION" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_SPEDUCATION" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_SPEDUCATION" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_SPEDUCATION" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_SPEDUCATION" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_SPEDUCATION" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_SPEDUCATION" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_SPEDUCATION" TO "BIOSAADM";
