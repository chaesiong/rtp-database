CREATE TABLE "PIBICSDM2"."THAIPASSPORT_BK" 
   (	"CITIZENID" CHAR(13 CHAR), 
	"PERSONID" CHAR(20 CHAR), 
	"PASSPORTNO" VARCHAR2(12 CHAR), 
	"PASSNO" CHAR(4 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"NATIONCD" CHAR(3 CHAR), 
	"HEIGHT" NUMBER, 
	"WEIGHT" NUMBER, 
	"ADDR" VARCHAR2(60 CHAR), 
	"DISTRICT" VARCHAR2(60 CHAR), 
	"CITYCD" CHAR(3 CHAR), 
	"STATECD" CHAR(2 CHAR), 
	"ZIPCODE" CHAR(5 CHAR), 
	"TELNO" VARCHAR2(60 CHAR), 
	"PASSPORTDTE" DATE, 
	"PASSPORTEXPDTE" DATE, 
	"MICROROLLNO" VARCHAR2(4 CHAR), 
	"MICROPICNO" VARCHAR2(10 CHAR), 
	"MICROPICNOL" VARCHAR2(4 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"BIRTHPLACE" VARCHAR2(50 CHAR), 
	"DOMICILE" VARCHAR2(50 CHAR), 
	"PPS_SEQNO" NUMBER, 
	"PASS_SEQNO" NUMBER, 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"TYPEDPASSPORT" CHAR(1 CHAR), 
	"PASSPORTSTS" CHAR(1 CHAR), 
	"TMPPASS_SEQNO" NUMBER
   ) ;
