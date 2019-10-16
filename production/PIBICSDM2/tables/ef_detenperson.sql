CREATE TABLE "PIBICSDM2"."EF_DETENPERSON" 
   (	"IDCNO" VARCHAR2(20 CHAR), 
	"DEPT_SEQNODTE" NUMBER, 
	"DTETYPE_SEQNO" VARCHAR2(5 CHAR), 
	"EFAMILYNM" VARCHAR2(100 CHAR), 
	"EFIRSTNM" VARCHAR2(100 CHAR), 
	"EMIDDLENM" VARCHAR2(100 CHAR), 
	"TFIRSTNM" VARCHAR2(100 CHAR), 
	"TFAMILYNM" VARCHAR2(100 CHAR), 
	"TMIDDLENM" VARCHAR2(100 CHAR), 
	"GENDER" CHAR(1 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"ALLEGATION" NUMBER, 
	"SENDDEPT_SEQNO" NUMBER, 
	"EF_DETENPERSONHIST_SEQNO" NUMBER, 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_DATE" TIMESTAMP (6)
   ) ;