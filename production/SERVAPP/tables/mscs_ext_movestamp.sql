CREATE TABLE "SERVAPP"."MSCS_EXT_MOVESTAMP" 
   (	"EXTMOVESTAMP_SEQNO" NUMBER NOT NULL ENABLE, 
	"EXTPERSON_SEQNO" NUMBER, 
	"REQUESTTYPETM" CHAR(1 CHAR), 
	"NATIONCD" CHAR(3 CHAR), 
	"TMNO" CHAR(3 CHAR), 
	"RUNNINGNO" CHAR(3 CHAR), 
	"YEAR" CHAR(4 CHAR), 
	"APPLYTMDATE" DATE, 
	"SUFFIX_SEQNO" NUMBER, 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"BIRTH_PLACE" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"AGE" NUMBER, 
	"OCC_SEQNO" NUMBER, 
	"OPASSPORTNO" VARCHAR2(20 CHAR), 
	"OPASSPORT_PIC" VARCHAR2(50 CHAR), 
	"OPASSPORTISSUE_DATE" DATE, 
	"OPASSPORTISSUE_BY" VARCHAR2(60 CHAR), 
	"OPASSPORTEXP_DATE" DATE, 
	"NPASSPORTNO" VARCHAR2(20 CHAR), 
	"NPASSPORT_PIC" VARCHAR2(50 CHAR), 
	"NPASSPORTISSUE_DATE" DATE, 
	"NPASSPORTISSUE_BY" VARCHAR2(60 CHAR), 
	"NPASSPORTEXP_DATE" DATE, 
	"CONV_SEQNO" NUMBER, 
	"IN_DATE" DATE, 
	"PORTOFARRV" NUMBER, 
	"TM6NO" VARCHAR2(20 CHAR), 
	"VISATYPE_SEQNO" NUMBER, 
	"REASONDESC" VARCHAR2(1000 CHAR), 
	"PERMIT_DATE" DATE, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"TMFLAG" VARCHAR2(2 CHAR), 
	"TM_SEQNO" NUMBER, 
	"FLIGHTNO" VARCHAR2(30 CHAR), 
	"VISA_DATE" DATE, 
	"UDEPT_SEQNO" NUMBER, 
	"FLAGMOVE" CHAR(1 CHAR), 
	"IPADDRESS" VARCHAR2(20 CHAR), 
	"UIPADDRESS" VARCHAR2(20 CHAR), 
	"BOIVISATYPE_SEQNO" NUMBER, 
	"BOIVISASUBTYPE_SEQNO" NUMBER, 
	"BOIVISADATE" DATE, 
	"BOIPERMITDATE" DATE, 
	"BOIREMARK" VARCHAR2(2000 CHAR), 
	"MOVESTAMP_TYPE" CHAR(1 CHAR), 
	"NPASSPORT_IMG" BLOB, 
	"OPASSPORT_IMG" BLOB
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_EXT_MOVESTAMP" ADD CONSTRAINT "EXT_MOVESTAMP_PK" PRIMARY KEY ("EXTMOVESTAMP_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."EXT_MOVESTAMP_PK" ON "SERVAPP"."MSCS_EXT_MOVESTAMP" ("EXTMOVESTAMP_SEQNO") 
  ;
  ;
  ;