CREATE TABLE "PIBICSDM2"."TMVISARUNPERSON" 
   (	"VSRPERSONSEQNO" NUMBER, 
	"VISARUNSEQNO" NUMBER, 
	"CARDTYPE" CHAR(1 CHAR), 
	"TM6NO" VARCHAR2(10 CHAR), 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"EFAMILYNM" VARCHAR2(100 CHAR), 
	"EFIRSTNM" VARCHAR2(100 CHAR), 
	"EMIDDLENM" VARCHAR2(100 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"NATIONCD" CHAR(3 CHAR), 
	"AMOUNT" NUMBER, 
	"INOUTDTE" DATE, 
	"DEPT_SEQNO" NUMBER, 
	"CONV_SEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"VISATYPE_SEQNO" NUMBER, 
	"VISAEXPDTE" DATE, 
	"CHKCAPTURE" CHAR(1 CHAR), 
	"FLAGVISARUN" CHAR(1 CHAR), 
	"VISARUNDAYS" NUMBER, 
	"INTYPE" CHAR(1 CHAR), 
	"TYPEDATA" VARCHAR2(40 CHAR), 
	"CREUSR" VARCHAR2(40 CHAR), 
	"CREDTE" DATE, 
	"CREDTERM" VARCHAR2(40 CHAR), 
	"REMARK" VARCHAR2(2000 CHAR), 
	"TMRUNNO" VARCHAR2(20 CHAR), 
	"PERSONID" VARCHAR2(40 CHAR), 
	"FLAGPROCESS" CHAR(1 CHAR), 
	"FLAGVISA" VARCHAR2(10 CHAR), 
	"FLAGDIFF" NUMBER, 
	"UPDDTE" DATE, 
	"VISAPROCESSDTE" DATE, 
	"PCSREASION" VARCHAR2(1000 CHAR), 
	"FLAGEXT" VARCHAR2(40 CHAR), 
	"EXTLISTSEQNO" NUMBER(10,0)
   ) ;
  ALTER TABLE "PIBICSDM2"."TMVISARUNPERSON" ADD CONSTRAINT "TMVISARUNPERSON_PK" PRIMARY KEY ("VSRPERSONSEQNO")
  USING INDEX  ENABLE;
  CREATE INDEX "PIBICSDM2"."TMVISARUNPERSON_INOUTDTE_IDX" ON "PIBICSDM2"."TMVISARUNPERSON" (TO_CHAR("INOUTDTE",'YYYYMMDD')) 
  ;
CREATE INDEX "PIBICSDM2"."TMVISARUNPERSON_INOUTDTE_IDX2" ON "PIBICSDM2"."TMVISARUNPERSON" ("INOUTDTE") 
  ;
CREATE INDEX "PIBICSDM2"."TMVISARUNPERSON_NATIONCD_IDX" ON "PIBICSDM2"."TMVISARUNPERSON" ("NATIONCD") 
  ;
CREATE INDEX "PIBICSDM2"."TMVISARUNPERSON_PASSPORTNO_IDX" ON "PIBICSDM2"."TMVISARUNPERSON" ("PASSPORTNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."TMVISARUNPERSON_PK" ON "PIBICSDM2"."TMVISARUNPERSON" ("VSRPERSONSEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."TMVISARUNPERSON" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMVISARUNPERSON" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMVISARUNPERSON" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMVISARUNPERSON" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMVISARUNPERSON" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMVISARUNPERSON" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMVISARUNPERSON" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMVISARUNPERSON" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMVISARUNPERSON" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TMVISARUNPERSON" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "PIBICSDM2"."TMVISARUNPERSON" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TMVISARUNPERSON" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TMVISARUNPERSON" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TMVISARUNPERSON" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TMVISARUNPERSON" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TMVISARUNPERSON" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TMVISARUNPERSON" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TMVISARUNPERSON" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TMVISARUNPERSON" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TMVISARUNPERSON" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TMVISARUNPERSON" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TMVISARUNPERSON" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TMVISARUNPERSON" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TMVISARUNPERSON" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TMVISARUNPERSON" TO "BIOSAADM";
