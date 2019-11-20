CREATE TABLE "PIBICSDM2"."IMMIGRATIONHIST" 
   (	"IMMHISTSEQNO" VARCHAR2(20 CHAR), 
	"PERSONID" VARCHAR2(20 CHAR), 
	"TM6NO" VARCHAR2(20 CHAR), 
	"INOUTDTE" DATE, 
	"CARDTYPE" CHAR(1 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"NATIONCD" CHAR(3 CHAR), 
	"TDTNO" VARCHAR2(20 CHAR), 
	"PASSPORTDTE" DATE, 
	"PASSPORTEXPDTE" DATE, 
	"VISATYPECD" CHAR(4 CHAR), 
	"VISAEXPDTE" DATE, 
	"DEPTCD" CHAR(5 CHAR), 
	"IMGPASS" BLOB, 
	"UPDUSR" VARCHAR2(20 CHAR), 
	"UPDDTE" DATE, 
	"COUNT_SEQNO" NUMBER, 
	"VISATYPE_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."IMMIGRATIONHIST" ADD CONSTRAINT "IMMIGRATIONHIST_PK" PRIMARY KEY ("IMMHISTSEQNO")
  USING INDEX (CREATE INDEX "PIBICSDM2"."PK_IMMIGRATIONHIST" ON "PIBICSDM2"."IMMIGRATIONHIST" ("IMMHISTSEQNO", "PERSONID") 
  )  ENABLE;
  CREATE INDEX "PIBICSDM2"."IDX_IMMHIST_BIRTHDTE" ON "PIBICSDM2"."IMMIGRATIONHIST" ("BIRTHDTE") 
  ;
CREATE INDEX "PIBICSDM2"."IDX_IMMHIST_EFAMILYNM" ON "PIBICSDM2"."IMMIGRATIONHIST" ("EFAMILYNM") 
  ;
CREATE INDEX "PIBICSDM2"."IDX_IMMHIST_EFIRSTNM" ON "PIBICSDM2"."IMMIGRATIONHIST" ("EFIRSTNM") 
  ;
CREATE INDEX "PIBICSDM2"."IDX_IMMHIST_EMIDDLENM" ON "PIBICSDM2"."IMMIGRATIONHIST" ("EMIDDLENM") 
  ;
CREATE INDEX "PIBICSDM2"."IDX_IMMHIST_NATIONCD" ON "PIBICSDM2"."IMMIGRATIONHIST" ("NATIONCD") 
  ;
CREATE INDEX "PIBICSDM2"."IMMHIST_PERSONID_TDTNO_IDX" ON "PIBICSDM2"."IMMIGRATIONHIST" ("PERSONID", "TDTNO") 
  ;
CREATE INDEX "PIBICSDM2"."PK_IMMIGRATIONHIST" ON "PIBICSDM2"."IMMIGRATIONHIST" ("IMMHISTSEQNO", "PERSONID") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301465C00021$$" ON "PIBICSDM2"."IMMIGRATIONHIST" (
  ;
  GRANT SELECT ON "PIBICSDM2"."IMMIGRATIONHIST" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."IMMIGRATIONHIST" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."IMMIGRATIONHIST" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."IMMIGRATIONHIST" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."IMMIGRATIONHIST" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."IMMIGRATIONHIST" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."IMMIGRATIONHIST" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."IMMIGRATIONHIST" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."IMMIGRATIONHIST" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."IMMIGRATIONHIST" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."IMMIGRATIONHIST" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."IMMIGRATIONHIST" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."IMMIGRATIONHIST" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."IMMIGRATIONHIST" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."IMMIGRATIONHIST" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."IMMIGRATIONHIST" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."IMMIGRATIONHIST" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."IMMIGRATIONHIST" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."IMMIGRATIONHIST" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."IMMIGRATIONHIST" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."IMMIGRATIONHIST" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."IMMIGRATIONHIST" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."IMMIGRATIONHIST" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."IMMIGRATIONHIST" TO "BIOSAADM";
