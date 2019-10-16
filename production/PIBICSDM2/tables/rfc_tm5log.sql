CREATE TABLE "PIBICSDM2"."RFC_TM5LOG" 
   (	"LOGTM2_SEQNO" NUMBER, 
	"TM5_SEQNO" NUMBER, 
	"TM2_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"EFIRSTNM" VARCHAR2(100 CHAR), 
	"EMIDDLENM" VARCHAR2(100 CHAR), 
	"EFAMILYNM" VARCHAR2(100 CHAR), 
	"GENDER" CHAR(1 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"INSTYPE" CHAR(1 CHAR), 
	"APPLY" CHAR(1 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"GUARANTOR" VARCHAR2(200 CHAR), 
	"REMARK" VARCHAR2(250 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR)
   ) ;