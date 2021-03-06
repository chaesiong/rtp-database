CREATE TABLE "PIBICSDM2"."FACT_INOUT" 
   (	"IO_SEQNO" NUMBER, 
	"INOUTDTE" DATE, 
	"CARDTYPE" CHAR(1 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"COUNT_SEQNO" NUMBER, 
	"DEPT1_SEQNO" NUMBER, 
	"DEPT2_SEQNO" NUMBER, 
	"DEPT3_SEQNO" NUMBER, 
	"CONV_SEQNO" NUMBER, 
	"CONVREGNO" VARCHAR2(40 CHAR), 
	"VISATYPE_SEQNO" NUMBER, 
	"CREUSR" VARCHAR2(20 CHAR), 
	"CREDTE" DATE, 
	"INOUT_STAT" NUMBER, 
	"DW_INSDTE" TIMESTAMP (6), 
	"DW_UPDDTE" TIMESTAMP (6), 
	"NATIONCD" VARCHAR2(10 CHAR), 
	"DEPTCD" VARCHAR2(10 CHAR), 
	"VISATYPECD" VARCHAR2(5 CHAR), 
	"CONVCD" VARCHAR2(5 CHAR), 
	"AGE" NUMBER, 
	"DEPT_SEQNO" NUMBER
   ) ;
  CREATE INDEX "PIBICSDM2"."FACT_INOUT_CARDTYPE_IDX" ON "PIBICSDM2"."FACT_INOUT" ("CARDTYPE") 
  ;
CREATE INDEX "PIBICSDM2"."FACT_INOUT_DEPT_SEQNO_IDX" ON "PIBICSDM2"."FACT_INOUT" ("DEPT_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."FACT_INOUT_INOUTDATE_YMD_IDX" ON "PIBICSDM2"."FACT_INOUT" (TO_CHAR("INOUTDTE",'yyyymmdd')) 
  ;
CREATE INDEX "PIBICSDM2"."FACT_INOUT_INOUTDTE_IDX" ON "PIBICSDM2"."FACT_INOUT" (TO_CHAR("INOUTDTE",'YYYYMM')) 
  ;
CREATE INDEX "PIBICSDM2"."FACT_INOUT_NATIONCD_IDX" ON "PIBICSDM2"."FACT_INOUT" ("NATIONCD") 
  ;
CREATE INDEX "PIBICSDM2"."FACT_INOUT_VISATYPE_SEQNO_IDX" ON "PIBICSDM2"."FACT_INOUT" ("VISATYPE_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FACT_INOUT" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FACT_INOUT" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FACT_INOUT" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FACT_INOUT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FACT_INOUT" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FACT_INOUT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FACT_INOUT" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FACT_INOUT" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FACT_INOUT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FACT_INOUT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FACT_INOUT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FACT_INOUT" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FACT_INOUT" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FACT_INOUT" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FACT_INOUT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FACT_INOUT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FACT_INOUT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FACT_INOUT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FACT_INOUT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FACT_INOUT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FACT_INOUT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FACT_INOUT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FACT_INOUT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FACT_INOUT" TO "BIOSAADM";
