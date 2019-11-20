CREATE TABLE "PIBICSDM2"."REASON" 
   (	"REASON_SEQNO" NUMBER, 
	"REASONCD" CHAR(2 CHAR), 
	"REASONNM" VARCHAR2(100 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."REASON" ADD CONSTRAINT "REASON_PK" PRIMARY KEY ("REASON_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."REASON_PK" ON "PIBICSDM2"."REASON" ("REASON_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."REASON" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."REASON" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."REASON" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."REASON" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."REASON" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."REASON" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."REASON" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."REASON" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."REASON" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."REASON" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."REASON" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."REASON" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."REASON" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."REASON" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."REASON" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."REASON" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."REASON" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."REASON" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."REASON" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."REASON" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."REASON" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."REASON" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."REASON" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."REASON" TO "BIOSAADM";
