CREATE TABLE "PIBICSDM2"."DW_DIM_DEPT1" 
   (	"DEPT1_SEQNO" NUMBER, 
	"DEPTCD" VARCHAR2(6 CHAR), 
	"DEPTLEVEL" CHAR(1 CHAR), 
	"DEPTENM" VARCHAR2(60 CHAR), 
	"DEPTTNM" VARCHAR2(100 CHAR), 
	"ADEPTTYPE" CHAR(1 CHAR), 
	"CONV_SEQNO" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"CONVCD" CHAR(4 CHAR), 
	"ABBRNM" VARCHAR2(100 CHAR), 
	"REL_CODE" NUMBER, 
	"ORG_CODE" VARCHAR2(8 CHAR), 
	"DETAINEE_FLAG" CHAR(1 CHAR), 
	"ORG_SEQNO" NUMBER, 
	"CHECKPOINT" CHAR(1 CHAR), 
	"DEPTABBFMT1" VARCHAR2(200 CHAR), 
	"DEPTABBFMT2" VARCHAR2(200 CHAR), 
	"CASINO_FLAG" CHAR(1 CHAR), 
	"SPOTSEQNO" NUMBER, 
	"OLDDEPTCD" CHAR(5 CHAR), 
	"DEPTLINE" CHAR(1 CHAR), 
	"FIELD_DEFAULT" VARCHAR2(500 CHAR), 
	"DEPTABBFMT3" VARCHAR2(200 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_DEPT1" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_DEPT1" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_DEPT1" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_DEPT1" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_DEPT1" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_DEPT1" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_DEPT1" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_DEPT1" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_DEPT1" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_DEPT1" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_DEPT1" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_DEPT1" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."DW_DIM_DEPT1" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."DW_DIM_DEPT1" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."DW_DIM_DEPT1" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."DW_DIM_DEPT1" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_DEPT1" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."DW_DIM_DEPT1" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."DW_DIM_DEPT1" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."DW_DIM_DEPT1" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."DW_DIM_DEPT1" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."DW_DIM_DEPT1" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."DW_DIM_DEPT1" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."DW_DIM_DEPT1" TO "BIOSAADM";
