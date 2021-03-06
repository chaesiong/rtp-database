CREATE TABLE "PIBICSDM2"."CREW" 
   (	"CREW_SEQNO" NUMBER, 
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
	"IMGINOUT" BLOB, 
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
	"IMGPASS" BLOB
   ) ;
  ALTER TABLE "PIBICSDM2"."CREW" ADD CONSTRAINT "CREW_PK" PRIMARY KEY ("CREW_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."CREW" ADD CONSTRAINT "CREW_R05" FOREIGN KEY ("VISATYPECD")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."CREW" ADD CONSTRAINT "CREW_R03" FOREIGN KEY ("CONVCD")
	  REFERENCES "PIBICSDM2"."CONVEYANCE" ("CONV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."CREW" ADD CONSTRAINT "CREW_R01" FOREIGN KEY ("NATIONCD")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."CREW" ADD CONSTRAINT "CREW_R07" FOREIGN KEY ("TM2INOUT_SEQNO")
	  REFERENCES "PIBICSDM2"."TM2" ("TM2_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."CREW" ADD CONSTRAINT "CREW_R06" FOREIGN KEY ("TM5_SEQNO")
	  REFERENCES "PIBICSDM2"."TM5" ("TM5_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."CREW" ADD CONSTRAINT "CREW_R08" FOREIGN KEY ("RANKCRW_SEQNO")
	  REFERENCES "PIBICSDM2"."RANKCRW" ("RANKCRW_SEQNO") ENABLE;
  CREATE INDEX "PIBICSDM2"."CREATEBY_IDX" ON "PIBICSDM2"."CREW" ("CREATE_BY") 
  ;
CREATE INDEX "PIBICSDM2"."CREATEDATE_IDX" ON "PIBICSDM2"."CREW" (TO_CHAR("CREATE_DATE",'yyyymmdd')) 
  ;
CREATE INDEX "PIBICSDM2"."DEPTCD_IDX" ON "PIBICSDM2"."CREW" ("DEPTCD") 
  ;
CREATE INDEX "PIBICSDM2"."INOUTDTE_IDX" ON "PIBICSDM2"."CREW" (TO_CHAR("INOUTDTE",'yyyymmdd')) 
  ;
CREATE INDEX "PIBICSDM2"."INOUTDTE_IDX1" ON "PIBICSDM2"."CREW" ("INOUTDTE") 
  ;
CREATE INDEX "PIBICSDM2"."INOUTDTE_YYYYMMDD_TH_IDX" ON "PIBICSDM2"."CREW" (TO_CHAR("INOUTDTE",'yyyymmdd','nls_calendar=''Thai Buddha''')) 
  ;
CREATE INDEX "PIBICSDM2"."NATIONCD_IDX" ON "PIBICSDM2"."CREW" ("NATIONCD") 
  ;
CREATE INDEX "PIBICSDM2"."TDTNO_IDX" ON "PIBICSDM2"."CREW" ("TDTNO") 
  ;
CREATE INDEX "PIBICSDM2"."TM2_SEQNO" ON "PIBICSDM2"."CREW" ("TM2INOUT_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."TM6NO_IDX" ON "PIBICSDM2"."CREW" ("TM6NO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."CREW_PK" ON "PIBICSDM2"."CREW" ("CREW_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000300933C00029$$" ON "PIBICSDM2"."CREW" (
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000300933C00047$$" ON "PIBICSDM2"."CREW" (
  ;
  GRANT SELECT ON "PIBICSDM2"."CREW" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CREW" TO "DL_STAGING" WITH GRANT OPTION;
  GRANT SELECT ON "PIBICSDM2"."CREW" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CREW" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CREW" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CREW" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CREW" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CREW" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CREW" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CREW" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."CREW" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."CREW" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."CREW" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."CREW" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."CREW" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."CREW" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."CREW" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."CREW" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."CREW" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."CREW" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."CREW" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."CREW" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."CREW" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."CREW" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."CREW" TO "BIOSAADM";
