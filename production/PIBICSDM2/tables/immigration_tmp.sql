CREATE TABLE "PIBICSDM2"."IMMIGRATION_TMP" 
   (	"PERSONID" VARCHAR2(20 CHAR), 
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
	"NATIONCD" CHAR(3 CHAR), 
	"TDTCD" VARCHAR2(4 CHAR), 
	"TDTNO" VARCHAR2(20 CHAR), 
	"VISATYPECDORG" CHAR(4 CHAR), 
	"VISAEXPDTE" DATE, 
	"PASSPORTDTE" DATE, 
	"PASSPORTISU" VARCHAR2(60 CHAR), 
	"PASSPORTEXPDTE" DATE, 
	"UPDUSR" VARCHAR2(20 CHAR), 
	"UPDDTE" DATE, 
	"UPDTERM" VARCHAR2(30 CHAR), 
	"REMARK" VARCHAR2(1000 CHAR), 
	"RESCERTNO" VARCHAR2(20 CHAR), 
	"IMGINOUT" BLOB, 
	"DEPTCD" CHAR(5 CHAR), 
	"IMGPASS" BLOB, 
	"FLAGPASS" NUMBER DEFAULT 0, 
	"STATUS" CHAR(1 CHAR) DEFAULT 0, 
	"TM5_SEQNO" NUMBER, 
	"TM2INOUT_SEQNO" NUMBER, 
	"PM_RE_ENTRY" VARCHAR2(20 CHAR), 
	"PM_REEXPDTE" DATE, 
	"PM_EXTENSION" VARCHAR2(20 CHAR), 
	"PM_EXEXPDTE" DATE, 
	"PM_NON_QUOTA" VARCHAR2(20 CHAR), 
	"PM_NONEXPDTE" DATE, 
	"NEWPERMIT" DATE, 
	"PERMITCD" CHAR(4 CHAR), 
	"CONVCD" CHAR(4 CHAR), 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"SEQNO" VARCHAR2(20 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 0, 
	"RPJSEQNO" NUMBER, 
	"CONV_SEQNO" NUMBER, 
	"VISATYPE_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"PERMIT_SEQNO" NUMBER, 
	"CITIZENID" VARCHAR2(13 CHAR), 
	"PASS_SEQNO" NUMBER, 
	"FLIGHTPREFIX" VARCHAR2(20 CHAR), 
	"FLIGHTNUMBER" VARCHAR2(20 CHAR), 
	"DEPTCDORG" CHAR(5 CHAR), 
	"VISATYPECD" CHAR(4 CHAR), 
	"RESCERTTYPE" VARCHAR2(4 CHAR), 
	"RESPVCD" VARCHAR2(3 CHAR), 
	"RESNOYEAR" VARCHAR2(20 CHAR), 
	"PV_SEQNO" NUMBER, 
	"PD_SEQNO" NUMBER, 
	"ZONE_SEQNO" NUMBER, 
	"SHIFT_SEQNO" NUMBER, 
	"FLAG" VARCHAR2(30 CHAR), 
	"ROWCOUNT" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."IMMIGRATION_TMP" ADD CONSTRAINT "TIMMIGRATION_PK2" PRIMARY KEY ("PERSONID")
  USING INDEX (CREATE UNIQUE INDEX "PIBICSDM2"."TIMMIGRATION_TMP_PK2" ON "PIBICSDM2"."IMMIGRATION_TMP" ("PERSONID") 
  )  ENABLE;
  CREATE INDEX "PIBICSDM2"."TIDX_SEQNO2" ON "PIBICSDM2"."IMMIGRATION_TMP" ("SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."TIMM_CARDTYPE_IDX2" ON "PIBICSDM2"."IMMIGRATION_TMP" ("CARDTYPE") 
  ;
CREATE INDEX "PIBICSDM2"."TIMM_CONCAT_NAME_IDX2" ON "PIBICSDM2"."IMMIGRATION_TMP" ("EFAMILYNM", "EFIRSTNM", "BIRTHDTE") 
  ;
CREATE INDEX "PIBICSDM2"."TIMM_DEPTCD_IDX2" ON "PIBICSDM2"."IMMIGRATION_TMP" ("DEPTCD") 
  ;
CREATE INDEX "PIBICSDM2"."TIMM_EFAMILYNM_IDX2" ON "PIBICSDM2"."IMMIGRATION_TMP" ("EFAMILYNM") 
  ;
CREATE INDEX "PIBICSDM2"."TIMM_EFIRSTNM_IDX2" ON "PIBICSDM2"."IMMIGRATION_TMP" ("EFIRSTNM") 
  ;
CREATE INDEX "PIBICSDM2"."TIMM_INOUTDTE_IDX2" ON "PIBICSDM2"."IMMIGRATION_TMP" (TO_NUMBER(TO_CHAR("INOUTDTE",'YYYYMMDDHH24MISS'))) 
  ;
CREATE INDEX "PIBICSDM2"."TIMM_RESCERTNO_IDX2" ON "PIBICSDM2"."IMMIGRATION_TMP" ("RESCERTNO") 
  ;
CREATE INDEX "PIBICSDM2"."TIMM_TDTNO_IDX2" ON "PIBICSDM2"."IMMIGRATION_TMP" ("TDTNO") 
  ;
CREATE INDEX "PIBICSDM2"."TIMM_TM6NO_IDX2" ON "PIBICSDM2"."IMMIGRATION_TMP" ("TM6NO") 
  ;
CREATE INDEX "PIBICSDM2"."TIMM_UPDDTE_IDX2" ON "PIBICSDM2"."IMMIGRATION_TMP" (TO_CHAR("UPDDTE",'YYYYMMDD')) 
  ;
CREATE INDEX "PIBICSDM2"."TIMM_UPDUSR_IDX2" ON "PIBICSDM2"."IMMIGRATION_TMP" ("UPDUSR") 
  ;
CREATE INDEX "PIBICSDM2"."TIMM_VISATYPECD_IDX2" ON "PIBICSDM2"."IMMIGRATION_TMP" ("VISATYPECDORG") 
  ;
CREATE INDEX "PIBICSDM2"."TIMM_VISATYPE_SEQNO2" ON "PIBICSDM2"."IMMIGRATION_TMP" ("VISATYPE_SEQNO") 
  ;
  ;
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."TIMMIGRATION_TMP_PK2" ON "PIBICSDM2"."IMMIGRATION_TMP" ("PERSONID") 
  ;