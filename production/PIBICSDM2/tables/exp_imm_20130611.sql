CREATE TABLE "PIBICSDM2"."EXP_IMM_20130611" 
   (	"PP10PPNO" VARCHAR2(9 CHAR), 
	"PP10SUBP" VARCHAR2(2 CHAR), 
	"PPNFTKEY" VARCHAR2(10 CHAR), 
	"PP10STAT" VARCHAR2(1 CHAR), 
	"PPTHFNM" VARCHAR2(40 CHAR), 
	"PPTHLNM" VARCHAR2(40 CHAR), 
	"PPENFNM" VARCHAR2(40 CHAR), 
	"PPENLNM" VARCHAR2(40 CHAR), 
	"PP10SEX" VARCHAR2(1 CHAR), 
	"PPNFBHDT" VARCHAR2(8 CHAR), 
	"PPNFISDT" VARCHAR2(8 CHAR), 
	"PPNFEXDT" VARCHAR2(8 CHAR), 
	"PP10ROLL" VARCHAR2(4 CHAR), 
	"PPNFFRAM" VARCHAR2(4 CHAR), 
	"PPNFITEM" VARCHAR2(2 CHAR), 
	"PPNFID" VARCHAR2(13 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."EXP_IMM_20130611" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXP_IMM_20130611" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXP_IMM_20130611" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXP_IMM_20130611" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXP_IMM_20130611" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXP_IMM_20130611" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXP_IMM_20130611" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXP_IMM_20130611" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXP_IMM_20130611" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXP_IMM_20130611" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXP_IMM_20130611" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXP_IMM_20130611" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXP_IMM_20130611" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXP_IMM_20130611" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXP_IMM_20130611" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXP_IMM_20130611" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXP_IMM_20130611" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXP_IMM_20130611" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXP_IMM_20130611" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXP_IMM_20130611" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXP_IMM_20130611" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXP_IMM_20130611" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXP_IMM_20130611" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXP_IMM_20130611" TO "BIOSAADM";
