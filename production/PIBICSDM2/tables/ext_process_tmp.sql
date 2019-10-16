CREATE TABLE "PIBICSDM2"."EXT_PROCESS_TMP" 
   (	"PROC_SEQNO" NUMBER, 
	"DOCNO" VARCHAR2(50 CHAR), 
	"DOCNO_YEAR" VARCHAR2(5 CHAR), 
	"GOVSECTION" VARCHAR2(100 CHAR), 
	"GOVAT_1" VARCHAR2(100 CHAR), 
	"GOVAT_2" VARCHAR2(100 CHAR), 
	"PROC_TO" VARCHAR2(100 CHAR), 
	"DOC_TEL" VARCHAR2(100 CHAR), 
	"DOC_DATE" DATE, 
	"IN_DATE" DATE, 
	"VISASTATUS" CHAR(1 CHAR), 
	"VISATYPE_SEQNO" NUMBER, 
	"VISA_EXPDATE" DATE, 
	"REMARK1" VARCHAR2(500 CHAR), 
	"EXT_DATE" DATE, 
	"EXT_DAY" NUMBER, 
	"APPROVESTS" CHAR(1 CHAR), 
	"PERMIT_DATE" DATE, 
	"DISAPP_REASON" VARCHAR2(200 CHAR), 
	"REMARK4" VARCHAR2(500 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"REMARK2_1" VARCHAR2(500 CHAR), 
	"REMARK2_2" VARCHAR2(500 CHAR), 
	"UDEPT_SEQNO" NUMBER, 
	"REASON_SEQNO" NUMBER, 
	"U_RANK_SEQNO" NUMBER, 
	"U_NAME" VARCHAR2(150 CHAR), 
	"U_POSTLEVEL" VARCHAR2(150 CHAR), 
	"P_RANK_SEQNO" NUMBER, 
	"P_NAME" VARCHAR2(150 CHAR), 
	"P_POSTLEVEL" VARCHAR2(150 CHAR), 
	"PROVE_DATE" DATE, 
	"PROVE_BY" VARCHAR2(120 CHAR), 
	"COMPANYNM" VARCHAR2(150 CHAR), 
	"O_DOCNO" VARCHAR2(50 CHAR), 
	"O_DOCNO_YEAR" VARCHAR2(5 CHAR), 
	"VISA_DATE" DATE, 
	"COMPANY_SEQNO" NUMBER, 
	"PROVE_ID" VARCHAR2(20 CHAR), 
	"WPERMIT_DATE" DATE, 
	"WEPERMIT_DATE" DATE, 
	"PRESENT_BY" VARCHAR2(120 CHAR), 
	"PRESENT_ID" VARCHAR2(20 CHAR), 
	"IPADDRESS" VARCHAR2(20 CHAR), 
	"UIPADDRESS" VARCHAR2(20 CHAR), 
	"VISATYPESUB_SEQNO" NUMBER
   ) ;