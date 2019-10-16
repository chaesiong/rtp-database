CREATE TABLE "PIBICSDM2"."TMP_BACKUP_MAS_EXT_REASON" 
   (	"REASON_SEQNO" NUMBER, 
	"REASONEXTABB" CHAR(1 CHAR), 
	"REASONEXTENM" VARCHAR2(4000 CHAR), 
	"REASONEXTTNM" VARCHAR2(300 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"PERMIT_DAY" NUMBER, 
	"DEPTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"REASONCD" VARCHAR2(4 CHAR), 
	"WAIT_DAY" NUMBER, 
	"LAWSET" NUMBER
   ) ;