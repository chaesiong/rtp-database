CREATE TABLE "PIBICSDM2"."TMINOUT_MA" 
   (	"SEQNO" VARCHAR2(100 CHAR), 
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
	"TDTCD" VARCHAR2(4 CHAR), 
	"TDTNO" VARCHAR2(20 CHAR), 
	"VISATYPECD" CHAR(4 CHAR), 
	"VISAEXPDTE" DATE, 
	"PASSPORTDTE" DATE, 
	"PASSPORTISU" VARCHAR2(60 CHAR), 
	"PASSPORTEXPDTE" DATE, 
	"TARGETNO" VARCHAR2(7 CHAR), 
	"INTYPE" CHAR(1 CHAR), 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"CREUSR" VARCHAR2(20 CHAR), 
	"CREDTE" DATE, 
	"CREDTERM" VARCHAR2(30 CHAR), 
	"UPDUSR" VARCHAR2(20 CHAR), 
	"UPDDTE" DATE, 
	"UPDTERM" VARCHAR2(30 CHAR), 
	"ISPROCESS" CHAR(1 CHAR), 
	"PERSONID" VARCHAR2(20 CHAR), 
	"TFSNDXNM" VARCHAR2(60 CHAR), 
	"TLSNDXNM" VARCHAR2(60 CHAR), 
	"TMSNDXNM" VARCHAR2(60 CHAR), 
	"EFSNDXNM" VARCHAR2(60 CHAR), 
	"ELSNDXNM" VARCHAR2(60 CHAR), 
	"EMSNDXNM" VARCHAR2(60 CHAR), 
	"REMARK" VARCHAR2(1500 CHAR), 
	"RESCERTNO" VARCHAR2(20 CHAR), 
	"IMGINOUT" BLOB, 
	"PM_RE_ENTRY" VARCHAR2(20 CHAR), 
	"PM_REEXPDTE" DATE, 
	"PM_EXTENSION" VARCHAR2(20 CHAR), 
	"PM_EXEXPDTE" DATE, 
	"PM_NON_QUOTA" VARCHAR2(20 CHAR), 
	"PM_NONEXPDTE" DATE, 
	"STATUS" CHAR(1 CHAR), 
	"TM5_SEQNO" NUMBER, 
	"TM2INOUT_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 0, 
	"RPJSEQNO" NUMBER, 
	"PERMITCD" CHAR(4 CHAR), 
	"NEWPERMIT" DATE, 
	"CONV_SEQNO" NUMBER, 
	"VISATYPE_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"PERMIT_SEQNO" NUMBER, 
	"CITIZENID" VARCHAR2(13 CHAR), 
	"PASS_SEQNO" NUMBER, 
	"FLIGHTPREFIX" VARCHAR2(20 CHAR), 
	"FLIGHTNUMBER" VARCHAR2(20 CHAR), 
	"TYPEDATA" VARCHAR2(20 CHAR), 
	"DEPTCDORG" CHAR(5 CHAR), 
	"FLAGJOINPASS" CHAR(1 CHAR), 
	"FLAGFINES" CHAR(1 CHAR), 
	"RESCERTTYPE" VARCHAR2(4 CHAR), 
	"RESPVCD" VARCHAR2(3 CHAR), 
	"RESNOYEAR" VARCHAR2(20 CHAR), 
	"PV_SEQNO" NUMBER, 
	"PD_SEQNO" NUMBER, 
	"ZONE_SEQNO" NUMBER, 
	"SHIFT_SEQNO" NUMBER, 
	"FLAGMATCH" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TMINOUT_MA" ADD CONSTRAINT "SEQNO_PK" PRIMARY KEY ("SEQNO")
  USING INDEX  ENABLE;
  CREATE INDEX "PIBICSDM2"."IDX_TMINOUT_500" ON "PIBICSDM2"."TMINOUT_MA" (TO_NUMBER("TDTCD")) 
  ;
CREATE INDEX "PIBICSDM2"."IDX_TMINOUT_501" ON "PIBICSDM2"."TMINOUT_MA" ("SEX") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_BIRTHDTE_IDX" ON "PIBICSDM2"."TMINOUT_MA" ("BIRTHDTE") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_CARDTYPE_IDX" ON "PIBICSDM2"."TMINOUT_MA" ("CARDTYPE") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_CITIZENID_IDX" ON "PIBICSDM2"."TMINOUT_MA" ("CITIZENID") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_CONVREGNO_IDX" ON "PIBICSDM2"."TMINOUT_MA" ("CONVREGNO") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_COUNTSEQNO_IDX" ON "PIBICSDM2"."TMINOUT_MA" ("COUNT_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_CREDTE" ON "PIBICSDM2"."TMINOUT_MA" ("CREDTE") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_CREDTERM_IDX" ON "PIBICSDM2"."TMINOUT_MA" ("CREDTERM") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_CREDTE_IDX3" ON "PIBICSDM2"."TMINOUT_MA" (TO_CHAR("CREDTE",'yyyymmdd')) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_CREDTE_IDX4" ON "PIBICSDM2"."TMINOUT_MA" (TO_CHAR("CREDTE",'yyyymm')) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_CREUSR_IDX" ON "PIBICSDM2"."TMINOUT_MA" ("CREUSR") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_DEPT_SEQNO_IDX" ON "PIBICSDM2"."TMINOUT_MA" ("DEPT_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_EFAMILYNM_IDX" ON "PIBICSDM2"."TMINOUT_MA" ("EFAMILYNM") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_EFIRSTNM_IDX" ON "PIBICSDM2"."TMINOUT_MA" ("EFIRSTNM") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_EMIDDLENM_IDX" ON "PIBICSDM2"."TMINOUT_MA" ("EMIDDLENM") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_INOUTDTE_IDX01" ON "PIBICSDM2"."TMINOUT_MA" ("INOUTDTE") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_INOUTDTE_IDX3" ON "PIBICSDM2"."TMINOUT_MA" (TO_CHAR("INOUTDTE",'dd/mm/yyyy')) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_INOUTDTE_IDX4" ON "PIBICSDM2"."TMINOUT_MA" (TO_CHAR("INOUTDTE",'mmyyyy')) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_MA_COMPOSITE_IDX1" ON "PIBICSDM2"."TMINOUT_MA" ("NATIONCD", "BIRTHDTE", "SEX") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_MA_COMPOSITE_IDX2" ON "PIBICSDM2"."TMINOUT_MA" ("NATIONCD", "BIRTHDTE", "SEX", "TDTNO", "EFAMILYNM", "EFIRSTNM", "EMIDDLENM") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_MA_IDX1" ON "PIBICSDM2"."TMINOUT_MA" (TRIM("EFIRSTNM"), TRIM("EFAMILYNM")) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_MA_IDX10" ON "PIBICSDM2"."TMINOUT_MA" (REPLACE("EFAMILYNM"||"EFIRSTNM"||"EMIDDLENM",' ','')) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_MA_IDX11" ON "PIBICSDM2"."TMINOUT_MA" (REPLACE("EFAMILYNM"||"EMIDDLENM"||"EFIRSTNM",' ','')) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_MA_IDX12" ON "PIBICSDM2"."TMINOUT_MA" (REPLACE("EMIDDLENM"||"EFIRSTNM"||"EFAMILYNM",' ','')) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_MA_IDX13" ON "PIBICSDM2"."TMINOUT_MA" (REPLACE("EMIDDLENM"||"EFAMILYNM"||"EFIRSTNM",' ','')) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_MA_IDX14" ON "PIBICSDM2"."TMINOUT_MA" (REPLACE("TFIRSTNM"||"TFAMILYNM"||"TMIDDLENM",' ','')) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_MA_IDX15" ON "PIBICSDM2"."TMINOUT_MA" (REPLACE("TFIRSTNM"||"TMIDDLENM"||"TFAMILYNM",' ','')) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_MA_IDX16" ON "PIBICSDM2"."TMINOUT_MA" (REPLACE("TFAMILYNM"||"TFIRSTNM"||"TMIDDLENM",' ','')) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_MA_IDX17" ON "PIBICSDM2"."TMINOUT_MA" (REPLACE("TFAMILYNM"||"TMIDDLENM"||"TFIRSTNM",' ','')) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_MA_IDX18" ON "PIBICSDM2"."TMINOUT_MA" (REPLACE("TMIDDLENM"||"TFIRSTNM"||"TFAMILYNM",' ','')) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_MA_IDX19" ON "PIBICSDM2"."TMINOUT_MA" (REPLACE("TMIDDLENM"||"TFAMILYNM"||"TFIRSTNM",' ','')) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_MA_IDX2" ON "PIBICSDM2"."TMINOUT_MA" (TRIM("TFIRSTNM"), TRIM("TFAMILYNM")) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_MA_IDX3" ON "PIBICSDM2"."TMINOUT_MA" ("TFIRSTNM", "TFAMILYNM") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_MA_IDX4" ON "PIBICSDM2"."TMINOUT_MA" ("FLIGHTPREFIX"||"FLIGHTNUMBER", "INOUTDTE") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_MA_IDX5" ON "PIBICSDM2"."TMINOUT_MA" (SUBSTR("BIRTHDTE",-4,4)) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_MA_IDX8" ON "PIBICSDM2"."TMINOUT_MA" (REPLACE("EFIRSTNM"||"EFAMILYNM"||"EMIDDLENM",' ','')) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_MA_IDX9" ON "PIBICSDM2"."TMINOUT_MA" (REPLACE("EFIRSTNM"||"EMIDDLENM"||"EFAMILYNM",' ','')) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_NATIONCD_IDX" ON "PIBICSDM2"."TMINOUT_MA" ("NATIONCD") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_PERSONID_IDX" ON "PIBICSDM2"."TMINOUT_MA" ("PERSONID") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_RPTINOUTDTE_IDX" ON "PIBICSDM2"."TMINOUT_MA" (TO_CHAR("INOUTDTE",'yyyymmdd')) 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_TDTNO_IDX" ON "PIBICSDM2"."TMINOUT_MA" ("TDTNO") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_TFAMILYNM_IDX" ON "PIBICSDM2"."TMINOUT_MA" ("TFAMILYNM") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_TFIRSTNM_IDX" ON "PIBICSDM2"."TMINOUT_MA" ("TFIRSTNM") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_TM6NO_IDX" ON "PIBICSDM2"."TMINOUT_MA" ("TM6NO") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_TYPEDATA_IDX" ON "PIBICSDM2"."TMINOUT_MA" ("TYPEDATA") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_VISATYPE_SEQNO" ON "PIBICSDM2"."TMINOUT_MA" ("VISATYPE_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."TMINOUT_ZONE_SEQNO_IDX" ON "PIBICSDM2"."TMINOUT_MA" ("ZONE_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."TMOUT_INOUTDTE_IDX1" ON "PIBICSDM2"."TMINOUT_MA" (TO_CHAR("INOUTDTE",'YYYYMM')) 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SEQNO_PK" ON "PIBICSDM2"."TMINOUT_MA" ("SEQNO") 
  ;
  ;