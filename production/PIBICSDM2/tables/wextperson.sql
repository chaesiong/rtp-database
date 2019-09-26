CREATE TABLE "PIBICSDM2"."WEXTPERSON" 
   (	"EXTLIST_SEQNO" NUMBER, 
	"EXT_SEQNO" NUMBER, 
	"EXTPERSON_SEQNO" NUMBER, 
	"DOC_NO" VARCHAR2(50 CHAR), 
	"REASON_SEQNO" NUMBER, 
	"EXT_DAY" NUMBER, 
	"PASSPORTNO" VARCHAR2(50 CHAR), 
	"EXT_DATE" DATE, 
	"TM6NO" VARCHAR2(50 CHAR), 
	"EFIRSTNM" VARCHAR2(150 CHAR), 
	"EMIDDLENM" VARCHAR2(150 CHAR), 
	"EFAMILYNM" VARCHAR2(150 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"BIRTH_PLACE" VARCHAR2(50 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"IN_DATE" DATE, 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"BUILDING" VARCHAR2(100 CHAR), 
	"ADDR" VARCHAR2(200 CHAR), 
	"ROAD" VARCHAR2(100 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"POSTCODE" VARCHAR2(5 CHAR), 
	"TEL" VARCHAR2(100 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"UDEPT_SEQNO" NUMBER, 
	"CPASSPORTNO" VARCHAR2(50 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"SUFFIX_SEQNO" NUMBER, 
	"EXTIMG" BLOB, 
	"PASSPORT_PIC" VARCHAR2(70 CHAR), 
	"WANTEDSEQNO" NUMBER, 
	"PERMIT_DATE" DATE
   ) ;
  ;
