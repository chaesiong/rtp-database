CREATE TABLE "PIBICSDM2"."TM3" 
   (	"TM3_SEQNO" NUMBER, 
	"TM6NO" VARCHAR2(20 CHAR), 
	"INOUTDTE" DATE, 
	"CARDTYPE" CHAR(1 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"NATIONCD" NUMBER, 
	"TDTNO" VARCHAR2(20 CHAR), 
	"PASSPORTDTE" DATE, 
	"PASSPORTISU" VARCHAR2(60 CHAR), 
	"PASSPORTEXPDTE" DATE, 
	"DEPT_SEQNO" NUMBER, 
	"TM2INOUT_SEQNO" NUMBER, 
	"TRNSSTS" CHAR(1 CHAR), 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"PERSONSTS" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 1
   ) ;
  ALTER TABLE "PIBICSDM2"."TM3" ADD PRIMARY KEY ("TM3_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."TM3" ADD FOREIGN KEY ("NATIONCD")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  CREATE INDEX "PIBICSDM2"."MASTER_TM3_IDX" ON "PIBICSDM2"."TM3" ("EFAMILYNM", "EFIRSTNM", "SEX", "BIRTHDTE", "EMIDDLENM") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_C00207174" ON "PIBICSDM2"."TM3" ("TM3_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."TM3" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TM3" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TM3" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TM3" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TM3" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TM3" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TM3" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TM3" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TM3" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TM3" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TM3" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TM3" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TM3" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TM3" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TM3" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TM3" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TM3" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TM3" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TM3" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TM3" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TM3" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TM3" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TM3" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TM3" TO "BIOSAADM";
