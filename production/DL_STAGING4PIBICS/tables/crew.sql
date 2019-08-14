CREATE TABLE "DL_STAGING4PIBICS"."CREW" 
   (	"UPDATE_YYYYMM" NUMBER INVISIBLE GENERATED ALWAYS AS (CAST(TO_CHAR(TRUNC("UPDATE_DATE",'fmmm'),'YYYYMM') AS NUMBER)) VIRTUAL , 
	"CREW_SEQNO" NUMBER NOT NULL ENABLE, 
	"TM6NO" VARCHAR2(20 CHAR), 
	"INOUTDTE" DATE, 
	"CARDTYPE" VARCHAR2(1 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"SEX" VARCHAR2(1 CHAR), 
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
	"INTYPE" VARCHAR2(1 CHAR), 
	"CHKPOINTNO" VARCHAR2(3 CHAR), 
	"PERSONID" VARCHAR2(20 CHAR), 
	"REMARK" VARCHAR2(1000 CHAR), 
	"STATUS" VARCHAR2(1 CHAR), 
	"TM5_SEQNO" NUMBER, 
	"TM2INOUT_SEQNO" NUMBER, 
	"RANKCRW_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"INOUTDTE_IMM" DATE, 
	"DEPTCD_IMM" NUMBER, 
	"CREATE_IP" VARCHAR2(25 CHAR), 
	"UPDATE_IP" VARCHAR2(25 CHAR), 
	"SHIFT_SEQNO" NUMBER, 
	"PD_SEQNO" NUMBER, 
	"ZONE_SEQNO" NUMBER, 
	"IMGPASS" BLOB, 
	"IMGINOUT" BLOB
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS"."CREW" ADD CONSTRAINT "CREW_PK" PRIMARY KEY ("CREW_SEQNO")
  USING INDEX  ENABLE;
  CREATE INDEX "DL_STAGING4PIBICS"."CREATEDATE_IDX" ON "DL_STAGING4PIBICS"."CREW" ("UPDATE_YYYYMM") 
  ;
CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."CREW_PK" ON "DL_STAGING4PIBICS"."CREW" ("CREW_SEQNO") 
  ;
CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."SYS_IL0000312952C00046$$" ON "DL_STAGING4PIBICS"."CREW" (
  ;
CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."SYS_IL0000312952C00048$$" ON "DL_STAGING4PIBICS"."CREW" (
  ;
  GRANT DELETE ON "DL_STAGING4PIBICS"."CREW" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CREW" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."CREW" TO "DL_STAGING4PIBICS_INTF";
  GRANT DELETE ON "DL_STAGING4PIBICS"."CREW" TO "DL_COMMON";
  GRANT INSERT ON "DL_STAGING4PIBICS"."CREW" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CREW" TO "DL_COMMON";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."CREW" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CREW" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CREW" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."CREW" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."CREW" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CREW" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."CREW" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CREW" TO "APPSUP";