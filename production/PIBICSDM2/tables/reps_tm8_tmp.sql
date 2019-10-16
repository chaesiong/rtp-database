CREATE TABLE "PIBICSDM2"."REPS_TM8_TMP" 
   (	"TM8_SEQNO" NUMBER, 
	"TM8NO" NUMBER, 
	"YEAR" CHAR(4 CHAR), 
	"FEES_SEQNO" NUMBER, 
	"WRITTEN" NVARCHAR2(20), 
	"PERSONID" VARCHAR2(20 CHAR), 
	"FAMILYNM" VARCHAR2(100 CHAR), 
	"FIRSTNM" VARCHAR2(100 CHAR), 
	"MIDDLENM" VARCHAR2(100 CHAR), 
	"NATIONAL_SEQNO" NUMBER, 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"AGE" NUMBER, 
	"OCC_SEQNO" NUMBER, 
	"BIRTH_PLACE" VARCHAR2(100 CHAR), 
	"BIRTHCOUNT_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORT_DATE" DATE, 
	"PASSPORTEXP_DATE" DATE, 
	"PASSPORTISSUEBY" VARCHAR2(60 CHAR), 
	"CHILDNO" NUMBER(*,0), 
	"ADDR" VARCHAR2(60 CHAR), 
	"ROAD" VARCHAR2(60 CHAR), 
	"TMB_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"PV_SEQNO" NUMBER, 
	"VISANO" VARCHAR2(20 CHAR), 
	"TDT_SEQNO" NUMBER, 
	"VISAISSUE" VARCHAR2(60 CHAR), 
	"VISA_DATE" DATE, 
	"OPERMIT_SEQNO" NUMBER, 
	"ARRIVE_DATE" DATE, 
	"OPERMIT_DATE" DATE, 
	"DOCTYPE" CHAR(1 CHAR), 
	"PURPOSECOUNT_SEQNO" NUMBER, 
	"CONV_SEQNO" NUMBER, 
	"LEAVE_DATE" DATE, 
	"RETURN_DATE" DATE, 
	"PURPOSE" VARCHAR2(100 CHAR), 
	"APPVSTS" CHAR(1 CHAR), 
	"DOC_DATE" DATE, 
	"DEPT_SEQNO" NUMBER, 
	"PERMIT_STATUS" CHAR(1 CHAR), 
	"NEWPERMIT_DATE" DATE, 
	"REASON_SEQNO" NUMBER, 
	"REASONDESC" VARCHAR2(1000 CHAR), 
	"TM6_SEQNO" NUMBER, 
	"ENDPERMIT_DATE" DATE, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"OVISATYPE_SEQNO" NUMBER, 
	"TODAY_DATE" DATE, 
	"IMGINOUT" BLOB, 
	"TM6NO" VARCHAR2(7 CHAR), 
	"APPVSTSBYDATE" DATE, 
	"APPVSTSBYDEPT_SEQNO" NUMBER, 
	"FLAG_BOI" CHAR(1 CHAR), 
	"IPADDRESS" VARCHAR2(20 CHAR), 
	"UIPADDRESS" VARCHAR2(20 CHAR), 
	"T_IDICONCEPT" VARCHAR2(50 CHAR)
   ) ;
  ;