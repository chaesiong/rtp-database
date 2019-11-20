CREATE TABLE "PIBICSDM2"."BPDEPTBYNATION" 
   (	"BPDNSEQNO" NUMBER, 
	"BPDSEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"BPDOCSEQNO" NUMBER, 
	"TYPEPERMIT" CHAR(1 CHAR), 
	"PERMITDAYS" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."BPDEPTBYNATION" ADD CONSTRAINT "BPDEPTBYNATION_PK" PRIMARY KEY ("BPDNSEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."BPDEPTBYNATION" ADD CONSTRAINT "BPDEPTBYNATION_R01" FOREIGN KEY ("BPDSEQNO")
	  REFERENCES "PIBICSDM2"."BPDEPTDEFAULT" ("BPDSEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."BPDEPTBYNATION" ADD CONSTRAINT "BPDEPTBYNATION_R02" FOREIGN KEY ("COUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."BPDEPTBYNATION" ADD CONSTRAINT "BPDEPTBYNATION_R03" FOREIGN KEY ("BPDOCSEQNO")
	  REFERENCES "PIBICSDM2"."BPDOCTYPE" ("BPDOCSEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."BPDEPTBYNATION_PK" ON "PIBICSDM2"."BPDEPTBYNATION" ("BPDNSEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."BPDEPTBYNATION" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTBYNATION" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTBYNATION" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTBYNATION" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTBYNATION" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTBYNATION" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTBYNATION" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTBYNATION" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTBYNATION" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTBYNATION" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTBYNATION" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTBYNATION" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."BPDEPTBYNATION" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."BPDEPTBYNATION" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."BPDEPTBYNATION" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."BPDEPTBYNATION" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTBYNATION" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."BPDEPTBYNATION" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."BPDEPTBYNATION" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."BPDEPTBYNATION" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."BPDEPTBYNATION" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."BPDEPTBYNATION" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."BPDEPTBYNATION" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."BPDEPTBYNATION" TO "BIOSAADM";
