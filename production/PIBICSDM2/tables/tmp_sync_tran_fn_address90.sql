CREATE TABLE "PIBICSDM2"."TMP_SYNC_TRAN_FN_ADDRESS90" 
   (	"ANDD_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(40 CHAR), 
	"TM6NO" VARCHAR2(7 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"SEX" CHAR(1 CHAR), 
	"VISATYPE_SEQNO" NUMBER, 
	"INDTE" DATE, 
	"CONV_SEQNO" NUMBER, 
	"HTYPE_SEQNO" NUMBER, 
	"BUILDING" VARCHAR2(200 CHAR), 
	"ADDR" VARCHAR2(500 CHAR), 
	"ROAD" VARCHAR2(50 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"TEL" VARCHAR2(100 CHAR), 
	"DOCDATE" DATE, 
	"FNPERSON_SEQNO" NUMBER, 
	"FINE_SEQNO" NUMBER, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"VERSION" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"FULLNAME" VARCHAR2(200 CHAR), 
	"NATIONCD" VARCHAR2(3 CHAR), 
	"VISATYPE" VARCHAR2(20 CHAR), 
	"CONV" VARCHAR2(20 CHAR), 
	"TMBNM" VARCHAR2(50 CHAR), 
	"AMPNM" VARCHAR2(50 CHAR), 
	"PVNM" VARCHAR2(50 CHAR), 
	"SEXTXT" VARCHAR2(25 CHAR), 
	"USERNAME" VARCHAR2(100 CHAR), 
	"FLIGHTNO" VARCHAR2(10 CHAR), 
	"IPADDRESS" VARCHAR2(20 CHAR), 
	"UIPADDRESS" VARCHAR2(20 CHAR), 
	"REMARK_BL" VARCHAR2(1000 CHAR), 
	"FINE_REMARK" VARCHAR2(1000 CHAR), 
	"FIGHTNO" VARCHAR2(20 CHAR), 
	"PERMITDATE" DATE, 
	"FINE_DATE" DATE, 
	"FINE_NUMBER" VARCHAR2(50 CHAR), 
	"FLIGHTPREFIX" VARCHAR2(10 CHAR), 
	"FLIGHTNUMBER" VARCHAR2(10 CHAR), 
	"BARCODE" VARCHAR2(50 CHAR), 
	"T_ID" VARCHAR2(100 CHAR), 
	"NEXT_DATE" DATE, 
	"FINE2_SEQNO" NUMBER, 
	"FNEXLOGSEQNO" NUMBER, 
	"IMPFLAG" VARCHAR2(1 CHAR), 
	"FNZONE_SEQNO" NUMBER, 
	"UFNZONE_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."TMP_SYNC_TRAN_FN_ADDRESS90" ADD CONSTRAINT "TMP_SYNC_TRAN_FN_ADDRESS90_PK" PRIMARY KEY ("ANDD_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TMP_SYNC_TRAN_FN_ADDRESS90_PK" ON "PIBICSDM2"."TMP_SYNC_TRAN_FN_ADDRESS90" ("ANDD_SEQNO") 
  ;
