CREATE TABLE "SERVAPP"."MSCS_CREW" 
   (	"CREW_SEQNO" NUMBER NOT NULL ENABLE, 
	"TM6NO" VARCHAR2(20 CHAR), 
	"INOUTDTE" DATE, 
	"CARDTYPE" CHAR(1 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"NATIONCD" NUMBER, 
	"DEPTCD" NUMBER, 
	"CONVCD" NUMBER, 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"TDTCD" NUMBER, 
	"TDTNO" VARCHAR2(20 CHAR), 
	"VISATYPECD" NUMBER, 
	"VISAEXPDTE" DATE, 
	"PASSPORTDTE" DATE, 
	"PASSPORTISU" VARCHAR2(60 CHAR), 
	"PASSPORTEXPDTE" DATE, 
	"TARGETNO" VARCHAR2(7 CHAR), 
	"INTYPE" CHAR(1 CHAR), 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"PERSONID" VARCHAR2(20 CHAR), 
	"REMARK" VARCHAR2(1000 CHAR), 
	"STATUS" CHAR(1 CHAR), 
	"TM5_SEQNO" NUMBER, 
	"TM2INOUT_SEQNO" NUMBER, 
	"RANKCRW_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"INOUTDTE_IMM" DATE, 
	"DEPTCD_IMM" NUMBER, 
	"CREATE_IP" VARCHAR2(25 CHAR), 
	"UPDATE_IP" VARCHAR2(25 CHAR), 
	"SHIFT_SEQNO" NUMBER, 
	"PD_SEQNO" NUMBER, 
	"ZONE_SEQNO" NUMBER, 
	"IMGINOUT" BLOB, 
	"IMGPASS" BLOB
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_CREW" ADD CONSTRAINT "CREW_PK" PRIMARY KEY ("CREW_SEQNO")
  USING INDEX  ENABLE;
  CREATE INDEX "SERVAPP"."MSCS_CREATEBY_IDX" ON "SERVAPP"."MSCS_CREW" ("CREATE_BY") 
  ;
CREATE INDEX "SERVAPP"."MSCS_DEPTCD_IDX" ON "SERVAPP"."MSCS_CREW" ("DEPTCD") 
  ;
CREATE INDEX "SERVAPP"."MSCS_INOUTDTE_IDX" ON "SERVAPP"."MSCS_CREW" (TO_CHAR("INOUTDTE",'yyyymmdd')) 
  ;
CREATE INDEX "SERVAPP"."MSCS_INOUTDTE_YYYYMMDD_TH_IDX" ON "SERVAPP"."MSCS_CREW" (TO_CHAR("INOUTDTE",'yyyymmdd','nls_calendar=''Thai Buddha''')) 
  ;
CREATE INDEX "SERVAPP"."MSCS_NATIONCD_IDX" ON "SERVAPP"."MSCS_CREW" ("NATIONCD") 
  ;
CREATE INDEX "SERVAPP"."MSCS_TDTNO_IDX" ON "SERVAPP"."MSCS_CREW" ("TDTNO") 
  ;
CREATE INDEX "SERVAPP"."MSCS_TM2_SEQNO" ON "SERVAPP"."MSCS_CREW" ("TM2INOUT_SEQNO") 
  ;
CREATE INDEX "SERVAPP"."MSCS_TM6NO_IDX" ON "SERVAPP"."MSCS_CREW" ("TM6NO") 
  ;
CREATE UNIQUE INDEX "SERVAPP"."CREW_PK" ON "SERVAPP"."MSCS_CREW" ("CREW_SEQNO") 
  ;
  ;
  ;
