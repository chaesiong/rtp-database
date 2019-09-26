CREATE TABLE "PIBICSDM2"."TMINFORMDEAD" 
   (	"TMINFDEADSEQNO" NUMBER, 
	"TMRUNNO" VARCHAR2(20 CHAR), 
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
	"DEPTCD" VARCHAR2(5 CHAR), 
	"TRAVCD" CHAR(4 CHAR), 
	"CONVCD" CHAR(4 CHAR), 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"TDTCD" CHAR(4 CHAR), 
	"TDTNO" VARCHAR2(20 CHAR), 
	"VISATYPECD" CHAR(4 CHAR), 
	"VISAEXPDTE" DATE, 
	"PASSPORTDTE" DATE, 
	"PASSPORTEXPDTE" DATE, 
	"INTYPE" CHAR(1 CHAR), 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"CREUSR" VARCHAR2(20 CHAR), 
	"CREDTE" DATE, 
	"CREDTERM" VARCHAR2(30 CHAR), 
	"UPDUSR" VARCHAR2(20 CHAR), 
	"UPDDTE" DATE, 
	"UPDTERM" VARCHAR2(30 CHAR), 
	"PERSONID" VARCHAR2(20 CHAR), 
	"TFSNDXNM" VARCHAR2(60 CHAR), 
	"TLSNDXNM" VARCHAR2(60 CHAR), 
	"TMSNDXNM" VARCHAR2(60 CHAR), 
	"EFSNDXNM" VARCHAR2(60 CHAR), 
	"ELSNDXNM" VARCHAR2(60 CHAR), 
	"EMSNDXNM" VARCHAR2(60 CHAR), 
	"REMARK" VARCHAR2(1000 CHAR), 
	"RESCERTNO" VARCHAR2(20 CHAR), 
	"IMGINOUT" BLOB, 
	"PERMITCD" CHAR(4 CHAR), 
	"PERMITDTE" DATE, 
	"CONV_SEQNO" NUMBER, 
	"VISATYPE_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"PERMIT_SEQNO" NUMBER, 
	"FLIGHTNUMBER" VARCHAR2(20 CHAR), 
	"FLIGHTPREFIX" VARCHAR2(20 CHAR), 
	"TMDEPT_SEQNO" NUMBER, 
	"DATEOFDEATH" DATE, 
	"REASONOFDEATH" VARCHAR2(1000 CHAR), 
	"CERTIFICATEOFDEATH" VARCHAR2(20 CHAR), 
	"OFFICEOFREGIS" VARCHAR2(400 CHAR), 
	"INFORMOFDEATH" VARCHAR2(150 CHAR), 
	"INFORMOFID13" VARCHAR2(13 CHAR), 
	"INFORMOFRELATION" VARCHAR2(150 CHAR), 
	"INFORMPV_SEQNO" NUMBER, 
	"FORMBASE" VARCHAR2(20 CHAR), 
	"PV_SEQNO" NUMBER, 
	"TYPEENQ" VARCHAR2(20 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TMINFORMDEAD" ADD CONSTRAINT "TMINFORMDEAD_PK" PRIMARY KEY ("TMINFDEADSEQNO")
  USING INDEX  ENABLE;
  CREATE INDEX "PIBICSDM2"."TMINFORMDEAD_BIRTHDTE_IDX" ON "PIBICSDM2"."TMINFORMDEAD" ("BIRTHDTE") 
  ;
CREATE INDEX "PIBICSDM2"."TMINFORMDEAD_CARDTYPE_IDX" ON "PIBICSDM2"."TMINFORMDEAD" ("CARDTYPE") 
  ;
CREATE INDEX "PIBICSDM2"."TMINFORMDEAD_CREDTE_IDX" ON "PIBICSDM2"."TMINFORMDEAD" (TO_NUMBER(TO_CHAR("CREDTE",'YYYYMMDD'))) 
  ;
CREATE INDEX "PIBICSDM2"."TMINFORMDEAD_CREUSR_IDX" ON "PIBICSDM2"."TMINFORMDEAD" ("CREUSR") 
  ;
CREATE INDEX "PIBICSDM2"."TMINFORMDEAD_EFAMILYNM_IDX" ON "PIBICSDM2"."TMINFORMDEAD" ("EFAMILYNM") 
  ;
CREATE INDEX "PIBICSDM2"."TMINFORMDEAD_EFIRSTNM_IDX" ON "PIBICSDM2"."TMINFORMDEAD" ("EFIRSTNM") 
  ;
CREATE INDEX "PIBICSDM2"."TMINFORMDEAD_EMIDDLENM_IDX" ON "PIBICSDM2"."TMINFORMDEAD" ("EMIDDLENM") 
  ;
CREATE INDEX "PIBICSDM2"."TMINFORMDEAD_NATIONCD_IDX" ON "PIBICSDM2"."TMINFORMDEAD" ("NATIONCD") 
  ;
CREATE INDEX "PIBICSDM2"."TMINFORMDEAD_RESCERTNO_IDX" ON "PIBICSDM2"."TMINFORMDEAD" ("RESCERTNO") 
  ;
CREATE INDEX "PIBICSDM2"."TMINFORMDEAD_SEX_IDX" ON "PIBICSDM2"."TMINFORMDEAD" ("SEX") 
  ;
CREATE INDEX "PIBICSDM2"."TMINFORMDEAD_TDTNO_IDX" ON "PIBICSDM2"."TMINFORMDEAD" ("TDTNO") 
  ;
CREATE INDEX "PIBICSDM2"."TMINFORMDEAD_TFAMILYNM_IDX" ON "PIBICSDM2"."TMINFORMDEAD" ("TFAMILYNM") 
  ;
CREATE INDEX "PIBICSDM2"."TMINFORMDEAD_TFIRSTNM_IDX" ON "PIBICSDM2"."TMINFORMDEAD" ("TFIRSTNM") 
  ;
CREATE INDEX "PIBICSDM2"."TMINFORMDEAD_TM6NO_IDX" ON "PIBICSDM2"."TMINFORMDEAD" ("TM6NO") 
  ;
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."TMINFORMDEAD_PK" ON "PIBICSDM2"."TMINFORMDEAD" ("TMINFDEADSEQNO") 
  ;
