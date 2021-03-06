CREATE TABLE "PIBICSDM2"."VISARUNLOG" 
   (	"VISARUNLOGSEQNO" NUMBER, 
	"VSRPERSONSEQNO" NUMBER, 
	"CARDTYPE" CHAR(1 CHAR), 
	"TM6NO" VARCHAR2(10 CHAR), 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"EFAMILYNM" VARCHAR2(100 CHAR), 
	"EFIRSTNM" VARCHAR2(100 CHAR), 
	"EMIDDLENM" VARCHAR2(100 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"NATIONCD" CHAR(3 CHAR), 
	"INOUTDTE" DATE, 
	"DEPT_SEQNO" NUMBER, 
	"CONV_SEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"VISATYPE_SEQNO" NUMBER, 
	"VISAEXPDTE" DATE, 
	"ACTION" CHAR(1 CHAR), 
	"CREUSR" VARCHAR2(40 CHAR), 
	"CREDTE" DATE, 
	"CREDTERM" VARCHAR2(40 CHAR), 
	"REMARK" VARCHAR2(2000 CHAR), 
	"DEPTCD" CHAR(5 CHAR), 
	"VISATYPECD" CHAR(4 CHAR), 
	"CONVCD" CHAR(4 CHAR), 
	"LASTINOUTDTE" DATE, 
	"CHKCAPTURE" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."VISARUNLOG" ADD CONSTRAINT "VISARUNLOG_PK" PRIMARY KEY ("VISARUNLOGSEQNO")
  USING INDEX  ENABLE;
  CREATE INDEX "PIBICSDM2"."VISARUNLOG_INOUTDTE_IDX" ON "PIBICSDM2"."VISARUNLOG" (TO_CHAR("INOUTDTE",'yyyymmdd')) 
  ;
CREATE INDEX "PIBICSDM2"."VISARUNLOG_INOUTDTE_IDX2" ON "PIBICSDM2"."VISARUNLOG" (TO_CHAR("INOUTDTE",'YYYYMMDDHH24MISS')) 
  ;
CREATE INDEX "PIBICSDM2"."VISARUNLOG_NATIONCD_IDX" ON "PIBICSDM2"."VISARUNLOG" ("NATIONCD") 
  ;
CREATE INDEX "PIBICSDM2"."VISARUNLOG_PASSPORT_IDX" ON "PIBICSDM2"."VISARUNLOG" ("PASSPORTNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."VISARUNLOG_PK" ON "PIBICSDM2"."VISARUNLOG" ("VISARUNLOGSEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."VISARUNLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."VISARUNLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."VISARUNLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."VISARUNLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VISARUNLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."VISARUNLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VISARUNLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."VISARUNLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."VISARUNLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VISARUNLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VISARUNLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VISARUNLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."VISARUNLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."VISARUNLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."VISARUNLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VISARUNLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VISARUNLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VISARUNLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VISARUNLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VISARUNLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VISARUNLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VISARUNLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VISARUNLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VISARUNLOG" TO "BIOSAADM";
