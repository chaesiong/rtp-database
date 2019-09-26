CREATE TABLE "PIBICSDM2"."ATCHANNEL_DUMMY" 
   (	"SEQNO" VARCHAR2(20 CHAR), 
	"PERSONID" VARCHAR2(20 CHAR), 
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
	"TFSNDXNM" VARCHAR2(60 CHAR), 
	"TLSNDXNM" VARCHAR2(60 CHAR), 
	"TMSNDXNM" VARCHAR2(60 CHAR), 
	"EFSNDXNM" VARCHAR2(60 CHAR), 
	"ELSNDXNM" VARCHAR2(60 CHAR), 
	"EMSNDXNM" VARCHAR2(60 CHAR), 
	"REMARK" VARCHAR2(1000 CHAR), 
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
	"FLAGSAVE" CHAR(1 CHAR), 
	"ERRDESC" VARCHAR2(500 CHAR), 
	"BYCASE" CHAR(1 CHAR)
   ) ;
  CREATE INDEX "PIBICSDM2"."DEPTCDIDX" ON "PIBICSDM2"."ATCHANNEL_DUMMY" ("DEPTCD") 
  ;
CREATE INDEX "PIBICSDM2"."FLAGSAVEIDX" ON "PIBICSDM2"."ATCHANNEL_DUMMY" ("FLAGSAVE") 
  ;
CREATE INDEX "PIBICSDM2"."INOUTDTE_TOCHAR" ON "PIBICSDM2"."ATCHANNEL_DUMMY" (TO_CHAR("INOUTDTE",'yyyymmdd')) 
  ;
CREATE INDEX "PIBICSDM2"."TDTNOIDX" ON "PIBICSDM2"."ATCHANNEL_DUMMY" ("TDTNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."ATCHANNEL_DUMMY_PK" ON "PIBICSDM2"."ATCHANNEL_DUMMY" ("SEQNO") 
  ;
  ;
