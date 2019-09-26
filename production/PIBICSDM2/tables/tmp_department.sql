CREATE TABLE "PIBICSDM2"."TMP_DEPARTMENT" 
   (	"DEPT_SEQNO" NUMBER, 
	"DEPTCD" VARCHAR2(5 CHAR), 
	"DEPTLEVEL" CHAR(1 CHAR), 
	"DEPTENM" VARCHAR2(100 CHAR), 
	"DEPTTNM" VARCHAR2(100 CHAR), 
	"ADDR" VARCHAR2(250 CHAR), 
	"ADDNO" VARCHAR2(60 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"ZIPCODE" CHAR(5 CHAR), 
	"TELNO" VARCHAR2(60 CHAR), 
	"FAX" VARCHAR2(60 CHAR), 
	"EMAIL" VARCHAR2(60 CHAR), 
	"URLDEPT" VARCHAR2(100 CHAR), 
	"ADEPTTYPE" CHAR(1 CHAR), 
	"CONV_SEQNO" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"CONVCD" CHAR(4 CHAR), 
	"ABBRNM" VARCHAR2(50 CHAR), 
	"REL_CODE" NUMBER, 
	"ORG_CODE" VARCHAR2(8 CHAR)
   ) ;
