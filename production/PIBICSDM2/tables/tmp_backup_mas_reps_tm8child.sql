CREATE TABLE "PIBICSDM2"."TMP_BACKUP_MAS_REPS_TM8CHILD" 
   (	"TM8CHILD_SEQNO" NUMBER, 
	"TM8_SEQNO" NUMBER, 
	"CFAMILYNM" VARCHAR2(100 CHAR), 
	"CFIRSTNM" VARCHAR2(100 CHAR), 
	"CMIDDLENM" VARCHAR2(100 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"AGE" NUMBER, 
	"CBIRTH_DATE" VARCHAR2(10 CHAR), 
	"CBIRTHPLC" VARCHAR2(100 CHAR), 
	"CPERMIT_DATE" DATE, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"FEES_SEQNO" NUMBER, 
	"TM6NO" VARCHAR2(7 CHAR), 
	"REASONCHILD" VARCHAR2(1000 CHAR), 
	"APPVSTSCHILD" CHAR(1 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORT_DATE" DATE, 
	"PASSPORTEXP_DATE" DATE, 
	"PERMIT_SEQNO" NUMBER, 
	"TM8NO" NUMBER, 
	"YEAR" CHAR(4 CHAR), 
	"DOCTYPE" CHAR(1 CHAR), 
	"IPADDRESS" VARCHAR2(20 CHAR), 
	"UIPADDRESS" VARCHAR2(20 CHAR), 
	"REPSPERSON_SEQNO" NUMBER, 
	"IMG_PERSON" BLOB
   ) ;
  ;
