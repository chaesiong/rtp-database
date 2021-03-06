CREATE TABLE "PIBICSDM2"."HR_CHILD" 
   (	"CH_SEQNO" NUMBER, 
	"PID" VARCHAR2(13 CHAR), 
	"CH_ORDERNO" NUMBER, 
	"CH_NAME" VARCHAR2(50 CHAR), 
	"CH_BIRTHDATE" VARCHAR2(8 CHAR), 
	"CH_SEX" VARCHAR2(1 CHAR), 
	"CH_CARDID" VARCHAR2(13 CHAR), 
	"CH_STUDY_FLAG" VARCHAR2(1 CHAR), 
	"CH_HEALTH_BENEFIT" VARCHAR2(1 CHAR), 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_DATE" TIMESTAMP (6)
   ) ;
  ALTER TABLE "PIBICSDM2"."HR_CHILD" ADD CONSTRAINT "HR_CHILD_PK" PRIMARY KEY ("CH_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."HR_CHILD_PK" ON "PIBICSDM2"."HR_CHILD" ("CH_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."HR_CHILD" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."HR_CHILD" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."HR_CHILD" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."HR_CHILD" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."HR_CHILD" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."HR_CHILD" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."HR_CHILD" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."HR_CHILD" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."HR_CHILD" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."HR_CHILD" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."HR_CHILD" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."HR_CHILD" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."HR_CHILD" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."HR_CHILD" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."HR_CHILD" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."HR_CHILD" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."HR_CHILD" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."HR_CHILD" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."HR_CHILD" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."HR_CHILD" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."HR_CHILD" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."HR_CHILD" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."HR_CHILD" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."HR_CHILD" TO "BIOSAADM";
