CREATE TABLE "PIBICSDM2"."TRAIN_BUDGET" 
   (	"BG_SEQNO" NUMBER, 
	"COURSE_SEQNO" NUMBER, 
	"BG_DETAIL" VARCHAR2(100 CHAR), 
	"BG_AMOUNT" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TRAIN_BUDGET" ADD CONSTRAINT "TRAIN_BUDGET_PK" PRIMARY KEY ("BG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."TRAIN_BUDGET" ADD CONSTRAINT "TRAIN_BUDGET_R01" FOREIGN KEY ("COURSE_SEQNO")
	  REFERENCES "PIBICSDM2"."TRAIN_COURSE" ("COURSE_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TRAIN_BUDGET_PK" ON "PIBICSDM2"."TRAIN_BUDGET" ("BG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."TRAIN_BUDGET" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_BUDGET" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_BUDGET" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_BUDGET" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_BUDGET" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_BUDGET" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_BUDGET" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_BUDGET" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_BUDGET" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_BUDGET" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_BUDGET" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_BUDGET" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TRAIN_BUDGET" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TRAIN_BUDGET" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TRAIN_BUDGET" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TRAIN_BUDGET" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_BUDGET" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TRAIN_BUDGET" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TRAIN_BUDGET" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TRAIN_BUDGET" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TRAIN_BUDGET" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TRAIN_BUDGET" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TRAIN_BUDGET" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TRAIN_BUDGET" TO "BIOSAADM";
