CREATE TABLE "PIBICSDM2"."HR_SPOUSE" 
   (	"SPO_SEQNO" NUMBER, 
	"PID" VARCHAR2(13 CHAR), 
	"SPO_NAME" VARCHAR2(50 CHAR), 
	"SPO_OLD_SNAME" VARCHAR2(25 CHAR), 
	"SPO_STATUS" VARCHAR2(1 CHAR), 
	"SPO_CARDID" VARCHAR2(13 CHAR), 
	"SPO_HEALTH_BENEFIT" VARCHAR2(1 CHAR), 
	"SPO_CARRER" VARCHAR2(100 CHAR), 
	"SPO_REGISTER_DATE" VARCHAR2(8 CHAR), 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"SPO_ITEMNO" NUMBER, 
	"SPO_ORDERNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."HR_SPOUSE" ADD CONSTRAINT "HR_SPOUSE_PK" PRIMARY KEY ("SPO_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."HR_SPOUSE_PK" ON "PIBICSDM2"."HR_SPOUSE" ("SPO_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."HR_SPOUSE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."HR_SPOUSE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."HR_SPOUSE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."HR_SPOUSE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."HR_SPOUSE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."HR_SPOUSE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."HR_SPOUSE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."HR_SPOUSE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."HR_SPOUSE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."HR_SPOUSE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."HR_SPOUSE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."HR_SPOUSE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."HR_SPOUSE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."HR_SPOUSE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."HR_SPOUSE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."HR_SPOUSE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."HR_SPOUSE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."HR_SPOUSE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."HR_SPOUSE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."HR_SPOUSE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."HR_SPOUSE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."HR_SPOUSE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."HR_SPOUSE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."HR_SPOUSE" TO "BIOSAADM";
