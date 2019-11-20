CREATE TABLE "PIBICSDM2"."TM2MAIN" 
   (	"TM2MAIN_SEQNO" NUMBER, 
	"CONV_SEQNO" NUMBER, 
	"CONVNATIONCD" NUMBER, 
	"CONVREGNO" VARCHAR2(50 CHAR), 
	"TM2_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"CARDTYPE" CHAR(1 CHAR), 
	"DEPT_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."TM2MAIN" ADD CONSTRAINT "TM2MAIN_PK" PRIMARY KEY ("TM2MAIN_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."TM2MAIN" ADD CONSTRAINT "TM2MAIN_R01" FOREIGN KEY ("TM2_SEQNO")
	  REFERENCES "PIBICSDM2"."TM2" ("TM2_SEQNO") DISABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TM2MAIN_PK" ON "PIBICSDM2"."TM2MAIN" ("TM2MAIN_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."TM2MAIN" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TM2MAIN" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TM2MAIN" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TM2MAIN" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TM2MAIN" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TM2MAIN" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TM2MAIN" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TM2MAIN" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TM2MAIN" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TM2MAIN" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TM2MAIN" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TM2MAIN" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TM2MAIN" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TM2MAIN" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TM2MAIN" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TM2MAIN" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TM2MAIN" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TM2MAIN" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TM2MAIN" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TM2MAIN" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TM2MAIN" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TM2MAIN" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TM2MAIN" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TM2MAIN" TO "BIOSAADM";
