CREATE TABLE "PIBICSDM2"."FACT_REENTRY" 
   (	"RE_SEQNO" NUMBER, 
	"NATION_SEQNO" NUMBER, 
	"SEX" CHAR(1 CHAR), 
	"AGE" NUMBER, 
	"DOC_DATE" DATE, 
	"DEPT1_SEQNO" NUMBER, 
	"PERMIT_STATUS" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"VISATYPE_SEQNO" NUMBER, 
	"DW_INSDTE" TIMESTAMP (6), 
	"DW_UPDDTE" TIMESTAMP (6), 
	"DEPT2_SEQNO" NUMBER, 
	"DEPT3_SEQNO" NUMBER, 
	"RE_STAT" NUMBER, 
	"DEPT_SEQNO" NUMBER
   ) ;