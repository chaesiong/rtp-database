CREATE GLOBAL TEMPORARY TABLE "SERVAPP"."MSCS_VOA_PERSON_TMP" 
   (	"VOA_SEQNO" NUMBER, 
	"PERSON_SEQNO" NUMBER, 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORT_ISSUEDATE" DATE, 
	"PASSPORT_EXPDATE" DATE, 
	"PASSPORT_PLACE" VARCHAR2(60 CHAR), 
	"TM6NO" VARCHAR2(20 CHAR), 
	"VISATYPE_SEQNO" NUMBER, 
	"PERMIT_DATE" DATE, 
	"FROMCOUNTRY" NUMBER, 
	"CONV_SEQNO" NUMBER, 
	"CONVNO" VARCHAR2(20 CHAR), 
	"IN_DATE" DATE, 
	"PERADD" VARCHAR2(1500 CHAR), 
	"THAIREF" VARCHAR2(100 CHAR), 
	"BUILDING" VARCHAR2(100 CHAR), 
	"ADDR" VARCHAR2(1500 CHAR), 
	"ROAD" VARCHAR2(100 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"POSTCODE" VARCHAR2(20 CHAR), 
	"TEL" VARCHAR2(20 CHAR), 
	"APPROVE" CHAR(1), 
	"REASON" VARCHAR2(2000 CHAR), 
	"VISANO" VARCHAR2(50 CHAR), 
	"STS" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"OCC_SEQNO" NUMBER, 
	"STATUSVOA" CHAR(1 CHAR), 
	"STATUSVOADTE" DATE, 
	"CHILD_RELATIONSHIP" VARCHAR2(100 CHAR), 
	"RPJSEQNO" NUMBER, 
	"SUFFIX_SEQNO" NUMBER, 
	"IMGINOUT" CLOB, 
	"IMGPASS" CLOB, 
	"FEESNO" VARCHAR2(50 CHAR), 
	"FEESLIPBOOKNO" VARCHAR2(20 CHAR), 
	"FEESLIPNO" VARCHAR2(20 CHAR), 
	"FEESLIPAMOUNT" NUMBER(10,2), 
	"PRATE_SEQNO" NUMBER, 
	"ROWNUM_TEMP" NUMBER
   ) ON COMMIT DELETE ROWS ;
