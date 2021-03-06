CREATE TABLE "PIBICSDM2"."REPORTPRO" 
   (	"RPT_SEQNO" NUMBER, 
	"DPT_SEQNO" NUMBER, 
	"PRODTE" DATE, 
	"PROUSRID" VARCHAR2(60 CHAR), 
	"REASON" VARCHAR2(100 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"DUEDTE" DATE, 
	"CASE1" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."REPORTPRO" ADD CONSTRAINT "REPORTPRO_PK" PRIMARY KEY ("RPT_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."REPORTPRO" ADD FOREIGN KEY ("DPT_SEQNO")
	  REFERENCES "PIBICSDM2"."DEPORTEE" ("DPT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."REPORTPRO_PK" ON "PIBICSDM2"."REPORTPRO" ("RPT_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."REPORTPRO" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."REPORTPRO" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."REPORTPRO" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."REPORTPRO" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."REPORTPRO" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."REPORTPRO" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."REPORTPRO" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."REPORTPRO" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."REPORTPRO" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."REPORTPRO" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."REPORTPRO" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."REPORTPRO" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."REPORTPRO" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."REPORTPRO" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."REPORTPRO" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."REPORTPRO" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."REPORTPRO" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."REPORTPRO" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."REPORTPRO" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."REPORTPRO" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."REPORTPRO" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."REPORTPRO" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."REPORTPRO" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."REPORTPRO" TO "BIOSAADM";
