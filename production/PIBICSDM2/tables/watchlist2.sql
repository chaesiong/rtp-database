CREATE TABLE "PIBICSDM2"."WATCHLIST2" 
   (	"WLCD" VARCHAR2(7 CHAR), 
	"OWNERAGE" CHAR(4 CHAR), 
	"AGCCONT" CHAR(2 CHAR), 
	"AGCPHONE" VARCHAR2(40 CHAR), 
	"EMGCONT" VARCHAR2(100 CHAR), 
	"DOCREF" VARCHAR2(60 CHAR), 
	"SECLEV" VARCHAR2(2 CHAR), 
	"BIRTHPLACE" VARCHAR2(500 CHAR), 
	"ADDR" VARCHAR2(60 CHAR), 
	"HOUSE" VARCHAR2(60 CHAR), 
	"SOI" VARCHAR2(60 CHAR), 
	"ROAD" VARCHAR2(60 CHAR), 
	"MOO" VARCHAR2(60 CHAR), 
	"DISTRICT" VARCHAR2(60 CHAR), 
	"CITY" VARCHAR2(60 CHAR), 
	"STATE" VARCHAR2(60 CHAR), 
	"CURZIPCODE" VARCHAR2(60 CHAR), 
	"HEIGHT" CHAR(4 CHAR), 
	"WEIGHT" CHAR(3 CHAR), 
	"HAIRCOLOR" VARCHAR2(30 CHAR), 
	"HAIR" VARCHAR2(30 CHAR), 
	"FACE" VARCHAR2(30 CHAR), 
	"BUILD" VARCHAR2(80 CHAR), 
	"EYECOLOR" VARCHAR2(30 CHAR), 
	"COMPLEXION" VARCHAR2(30 CHAR), 
	"FEATURE" VARCHAR2(60 CHAR), 
	"PECULIARITY" VARCHAR2(60 CHAR), 
	"OCCCD" CHAR(4 CHAR), 
	"TARGETNO" VARCHAR2(10 CHAR), 
	"OPERREF" VARCHAR2(60 CHAR), 
	"OWNERORG" VARCHAR2(60 CHAR), 
	"WARRNO" VARCHAR2(200 CHAR), 
	"WARRDTE" DATE, 
	"WARREXPDTE" DATE, 
	"DOCREFER" VARCHAR2(60 CHAR), 
	"BLAWSNO" VARCHAR2(60 CHAR), 
	"RLAWSNO" VARCHAR2(60 CHAR), 
	"PENALNO" VARCHAR2(60 CHAR), 
	"ALLEGECD" CHAR(4 CHAR), 
	"REASONCD" CHAR(4 CHAR), 
	"TDCD" CHAR(4 CHAR), 
	"CREUSR" VARCHAR2(20 CHAR), 
	"CREDTE" DATE, 
	"CREORG" CHAR(5 CHAR), 
	"UPDUSR" VARCHAR2(20 CHAR), 
	"UPDDTE" DATE, 
	"UPDORG" CHAR(5 CHAR), 
	"DOCDTE" DATE, 
	"DOCNO" CHAR(20 CHAR), 
	"STS" VARCHAR2(10 CHAR), 
	"CAUSE" VARCHAR2(255 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"NATIONCD" CHAR(3 CHAR), 
	"OTHERAGCCONT" VARCHAR2(200 CHAR), 
	"RMK1" VARCHAR2(40 CHAR), 
	"RMK2" VARCHAR2(60 CHAR), 
	"RMK3" VARCHAR2(150 CHAR), 
	"RMK4" VARCHAR2(40 CHAR), 
	"RMKDTE" DATE, 
	"RMKDTE1" DATE, 
	"PRECINCTCD" CHAR(4 CHAR), 
	"ARREST" CHAR(1 CHAR), 
	"PERMITDTE1" DATE, 
	"PERMITDTE2" DATE, 
	"PERMIT" CHAR(1 CHAR), 
	"RMKAGCCONT" VARCHAR2(200 CHAR), 
	"RMKARREST" VARCHAR2(255 CHAR), 
	"RMKPERMIT" VARCHAR2(2500 CHAR), 
	"RMK11" VARCHAR2(40 CHAR), 
	"RMK12" VARCHAR2(60 CHAR), 
	"RMK13" VARCHAR2(150 CHAR), 
	"RMKDTE11" DATE, 
	"RMKDTE12" DATE, 
	"RMKMORE" VARCHAR2(1000 CHAR), 
	"REASON_OTH" VARCHAR2(500 CHAR), 
	"REASON_TYPE_SEQNO" NUMBER, 
	"NATION_SEQNO" NUMBER, 
	"REASON_SEQNO" NUMBER, 
	"OPER_SEQNO" NUMBER, 
	"TD_SEQNO" NUMBER, 
	"CARD_ID" VARCHAR2(20 CHAR), 
	"FLAGCHECKPOINT" CHAR(1 CHAR), 
	"CASES_NO" VARCHAR2(50 CHAR), 
	"LOGIN_ID" VARCHAR2(20 CHAR), 
	"KEY_DATE" DATE, 
	"HIDDENREMARK" VARCHAR2(1000 CHAR), 
	"PV_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"HIDEDTE" TIMESTAMP (6), 
	"DEPT_SEQNO" NUMBER, 
	"REMARK" VARCHAR2(2500 CHAR)
   ) ;
