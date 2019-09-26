CREATE TABLE "SERVAPP"."MSCS_TM2" 
   (	"TM2_SEQNO" NUMBER NOT NULL ENABLE, 
	"CONV_SEQNO" NUMBER, 
	"IODTE" TIMESTAMP (6), 
	"CARDTYPE" CHAR(1 CHAR), 
	"CONVNM" VARCHAR2(250 CHAR), 
	"CONVNATIONCD" NUMBER, 
	"CONVREGNO" VARCHAR2(50 CHAR), 
	"CONVOWNER" VARCHAR2(250 CHAR), 
	"TM2DEPT" NUMBER, 
	"IOCOUNTCD" NUMBER, 
	"IOPORTNM" VARCHAR2(250 CHAR), 
	"TM5_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 1, 
	"TM2NO" VARCHAR2(20 CHAR), 
	"TM2DTE" DATE, 
	"TM2USR" VARCHAR2(250 CHAR), 
	"FLIGHTNO" VARCHAR2(25 CHAR), 
	"CONVCODE" VARCHAR2(20 CHAR), 
	"IONOTE" VARCHAR2(250 CHAR), 
	"IODEPT" NUMBER, 
	"IODEPTTH" NUMBER, 
	"AMOUNT_CRW" NUMBER, 
	"AMOUNT_PSG" NUMBER, 
	"AMOUNT_IO" NUMBER, 
	"AMOUNT_T" NUMBER, 
	"AMOUNT_S" NUMBER, 
	"CONVTYPE_SEQNO" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"TM2MAIN_SEQNO" NUMBER, 
	"NOTE" VARCHAR2(500 CHAR), 
	"CREATE_IP" VARCHAR2(25 CHAR), 
	"UPDATE_IP" VARCHAR2(25 CHAR), 
	"SHIFT_SEQNO" NUMBER, 
	"PD_SEQNO" NUMBER, 
	"ZONE_SEQNO" NUMBER, 
	"HEALTHFLAG" CHAR(1 CHAR), 
	"PIBICSPK" NUMBER
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_TM2" ADD CONSTRAINT "TM2_PK" PRIMARY KEY ("TM2_SEQNO")
  USING INDEX  ENABLE;
  CREATE INDEX "SERVAPP"."MSCS_TM2_IODTE_IDX" ON "SERVAPP"."MSCS_TM2" (TO_CHAR("IODTE",'yyyymmdd')) 
  ;
CREATE INDEX "SERVAPP"."MSCS_TM2_U_FLIGHTNO_IDX" ON "SERVAPP"."MSCS_TM2" ("FLIGHTNO") 
  ;
CREATE UNIQUE INDEX "SERVAPP"."TM2_PK" ON "SERVAPP"."MSCS_TM2" ("TM2_SEQNO") 
  ;
