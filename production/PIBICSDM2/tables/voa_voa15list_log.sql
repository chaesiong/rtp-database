CREATE TABLE "PIBICSDM2"."VOA_VOA15LIST_LOG" 
   (	"VOAL_SEQNO" NUMBER, 
	"PERSON_SEQNO" NUMBER, 
	"VOA_SEQNO" NUMBER, 
	"CP_SEQNO" NUMBER, 
	"TM6NO" VARCHAR2(7 CHAR), 
	"VISANO" VARCHAR2(50 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"STS" CHAR(1 CHAR), 
	"IPADDRESS" VARCHAR2(20 CHAR), 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORT_ISSUEDATE" DATE, 
	"PASSPORT_EXPDATE" DATE, 
	"PASSPORT_PLACE" VARCHAR2(60 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"FEES_SEQNO" NUMBER, 
	"OCC_SEQNO" NUMBER, 
	"LOG_DATE" DATE, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(50 CHAR), 
	"VOAL_LOG_SEQNO" NUMBER, 
	"CHILD_RELATIONSHIP" VARCHAR2(100 CHAR), 
	"VOA15_LOG_SEQNO" NUMBER, 
	"SUFFIX_SEQNO" NUMBER, 
	"IMGINOUT" BLOB, 
	"IMGPASS" BLOB, 
	"RPJSEQNO" NUMBER, 
	"TMINOUT_SEQNO" NUMBER, 
	"STATUSONLINE" CHAR(1 CHAR), 
	"CRE_PROGRAMID" VARCHAR2(25 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."VOA_VOA15LIST_LOG" ADD CONSTRAINT "VOA_VOA15LIST_LOG_PK" PRIMARY KEY ("VOAL_LOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."VOA_VOA15LIST_LOG" ADD CONSTRAINT "SYS_C0033285" FOREIGN KEY ("VOA15_LOG_SEQNO")
	  REFERENCES "PIBICSDM2"."VOA_VOA15_LOG" ("VOA15_LOG_SEQNO") ENABLE NOVALIDATE;
  ALTER TABLE "PIBICSDM2"."VOA_VOA15LIST_LOG" ADD FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."VOA_VOA15LIST_LOG" ADD FOREIGN KEY ("COUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."VOA_VOA15LIST_LOG" ADD FOREIGN KEY ("OCC_SEQNO")
	  REFERENCES "PIBICSDM2"."OCCUPATION" ("OCC_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."VOA_VOA15LIST_LOG" ADD FOREIGN KEY ("FEES_SEQNO")
	  REFERENCES "PIBICSDM2"."FS_FEES" ("FEES_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."VOA_VOA15LIST_LOG" ADD FOREIGN KEY ("CP_SEQNO")
	  REFERENCES "PIBICSDM2"."VOA_CHECKPOINT" ("CP_SEQNO") DISABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000302290C00034$$" ON "PIBICSDM2"."VOA_VOA15LIST_LOG" (
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000302290C00035$$" ON "PIBICSDM2"."VOA_VOA15LIST_LOG" (
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."VOA_VOA15LIST_LOG_PK" ON "PIBICSDM2"."VOA_VOA15LIST_LOG" ("VOAL_LOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VOA_VOA15LIST_LOG" TO "BIOSAADM";
