CREATE TABLE "PIBICSDM2"."MFA_GETERR" 
   (	"GETERR_SEQNO" NUMBER, 
	"CALL_SEQNO" NUMBER, 
	"PASSTYPE" CHAR(1 CHAR), 
	"ROUNDNO" VARCHAR2(5 CHAR), 
	"RECORDCOUNT" NUMBER, 
	"TOTAL_STS_A" NUMBER, 
	"TOTAL_STS_C" NUMBER, 
	"TOTAL_STS_L" NUMBER, 
	"TOTAL_STS_R" NUMBER, 
	"TOTAL_STS_D" NUMBER, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"EXC_STATUS" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."MFA_GETERR" ADD CONSTRAINT "MFA_GETERR_PK" PRIMARY KEY ("GETERR_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."MFA_GETERR" ADD CONSTRAINT "MFA_GETERR_R01" FOREIGN KEY ("CALL_SEQNO")
	  REFERENCES "PIBICSDM2"."MFA_CALL" ("CALL_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."MFA_GETERR_PK" ON "PIBICSDM2"."MFA_GETERR" ("GETERR_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."MFA_GETERR" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."MFA_GETERR" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."MFA_GETERR" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."MFA_GETERR" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."MFA_GETERR" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."MFA_GETERR" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."MFA_GETERR" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."MFA_GETERR" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."MFA_GETERR" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."MFA_GETERR" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."MFA_GETERR" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."MFA_GETERR" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."MFA_GETERR" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."MFA_GETERR" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."MFA_GETERR" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."MFA_GETERR" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."MFA_GETERR" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."MFA_GETERR" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."MFA_GETERR" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."MFA_GETERR" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."MFA_GETERR" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."MFA_GETERR" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."MFA_GETERR" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."MFA_GETERR" TO "BIOSAADM";
