CREATE TABLE "PIBICSDM2"."REGION" 
   (	"REG_SEQNO" NUMBER, 
	"REGCD" CHAR(2 CHAR), 
	"REGTNM" VARCHAR2(60 CHAR), 
	"REGENM" VARCHAR2(60 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."REGION" ADD CONSTRAINT "REGION_PK" PRIMARY KEY ("REG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."REGION_PK" ON "PIBICSDM2"."REGION" ("REG_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."REGION_U01" ON "PIBICSDM2"."REGION" ("REGCD") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."REGION_U02" ON "PIBICSDM2"."REGION" ("REGTNM") 
  ;
  GRANT SELECT ON "PIBICSDM2"."REGION" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."REGION" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."REGION" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."REGION" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."REGION" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."REGION" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."REGION" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."REGION" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."REGION" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."REGION" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."REGION" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."REGION" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."REGION" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."REGION" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."REGION" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."REGION" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."REGION" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."REGION" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."REGION" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."REGION" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."REGION" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."REGION" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."REGION" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."REGION" TO "BIOSAADM";
