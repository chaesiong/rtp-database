CREATE TABLE "PIBICSDM2"."VOA_VOA15LIST" 
   (	"VOAL_SEQNO" NUMBER, 
	"PERSON_SEQNO" NUMBER, 
	"VOA_SEQNO" NUMBER, 
	"CP_SEQNO" NUMBER, 
	"TM6NO" VARCHAR2(20 CHAR), 
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
	"CHILD_RELATIONSHIP" VARCHAR2(100 CHAR), 
	"SUFFIX_SEQNO" NUMBER, 
	"IMGINOUT" BLOB, 
	"IMGPASS" BLOB, 
	"RPJSEQNO" NUMBER, 
	"TMINOUT_SEQNO" NUMBER, 
	"STATUSVOA" CHAR(1 CHAR), 
	"STATUSVOADTE" DATE, 
	"STATUSONLINE" CHAR(1 CHAR), 
	"CRE_PROGRAMID" VARCHAR2(25 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."VOA_VOA15LIST" ADD CONSTRAINT "VOA_VOA15LIST_PK" PRIMARY KEY ("VOAL_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."VOA_VOA15LIST" ADD FOREIGN KEY ("CP_SEQNO")
	  REFERENCES "PIBICSDM2"."VOA_CHECKPOINT" ("CP_SEQNO") ENABLE NOVALIDATE;
  ALTER TABLE "PIBICSDM2"."VOA_VOA15LIST" ADD CONSTRAINT "SYS_C0031343" FOREIGN KEY ("PERSON_SEQNO")
	  REFERENCES "PIBICSDM2"."VOA_PERSON" ("PERSON_SEQNO") ENABLE NOVALIDATE;
  ALTER TABLE "PIBICSDM2"."VOA_VOA15LIST" ADD CONSTRAINT "VOA_VOA15LIST_R01" FOREIGN KEY ("VOA_SEQNO")
	  REFERENCES "PIBICSDM2"."VOA_VOA15" ("VOA_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."VOA_VOA15LIST" ADD FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."VOA_VOA15LIST" ADD FOREIGN KEY ("COUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."VOA_VOA15LIST" ADD FOREIGN KEY ("OCC_SEQNO")
	  REFERENCES "PIBICSDM2"."OCCUPATION" ("OCC_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."VOA_VOA15LIST" ADD FOREIGN KEY ("FEES_SEQNO")
	  REFERENCES "PIBICSDM2"."FS_FEES" ("FEES_SEQNO") ENABLE;
  CREATE INDEX "PIBICSDM2"."VOA15LIST_BIRTH_IDX" ON "PIBICSDM2"."VOA_VOA15LIST" ("BIRTH_DATE") 
  ;
CREATE INDEX "PIBICSDM2"."VOA15LIST_EFAMILYNM_IDX" ON "PIBICSDM2"."VOA_VOA15LIST" ("EFAMILYNM") 
  ;
CREATE INDEX "PIBICSDM2"."VOA15LIST_EFIRSTNM_IDX" ON "PIBICSDM2"."VOA_VOA15LIST" ("EFIRSTNM") 
  ;
CREATE INDEX "PIBICSDM2"."VOA15LIST_EMIDDLENM_IDX" ON "PIBICSDM2"."VOA_VOA15LIST" ("EMIDDLENM") 
  ;
CREATE INDEX "PIBICSDM2"."VOA15LIST_NATION_IDX" ON "PIBICSDM2"."VOA_VOA15LIST" ("NATION_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."VOA15LIST_PASS_IDX" ON "PIBICSDM2"."VOA_VOA15LIST" ("PASSPORTNO") 
  ;
CREATE INDEX "PIBICSDM2"."VOA15LIST_SEX_IDX" ON "PIBICSDM2"."VOA_VOA15LIST" ("SEX") 
  ;
CREATE INDEX "PIBICSDM2"."VOA15LIST_TM6_IDX" ON "PIBICSDM2"."VOA_VOA15LIST" ("TM6NO") 
  ;
CREATE INDEX "PIBICSDM2"."VOA15LIST_TMINOUT_IDX" ON "PIBICSDM2"."VOA_VOA15LIST" ("TMINOUT_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."VOA_VOA15LIST_CREATEDTE1" ON "PIBICSDM2"."VOA_VOA15LIST" (TO_CHAR("CREATE_DATE",'yyyymmdd')) 
  ;
CREATE INDEX "PIBICSDM2"."VOA_VOA15LIST_CREATEDTE2" ON "PIBICSDM2"."VOA_VOA15LIST" (TO_CHAR("CREATE_DATE",'yyyymm')) 
  ;
CREATE INDEX "PIBICSDM2"."VOA_VOA15LIST_VISANO_IDX" ON "PIBICSDM2"."VOA_VOA15LIST" ("VISANO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000302285C00029$$" ON "PIBICSDM2"."VOA_VOA15LIST" (
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000302285C00030$$" ON "PIBICSDM2"."VOA_VOA15LIST" (
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."VOA_VOA15LIST_PK" ON "PIBICSDM2"."VOA_VOA15LIST" ("VOAL_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."VOA_VOA15LIST" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."VOA_VOA15LIST" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."VOA_VOA15LIST" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VOA_VOA15LIST" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VOA_VOA15LIST" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VOA_VOA15LIST" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VOA_VOA15LIST" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VOA_VOA15LIST" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VOA_VOA15LIST" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VOA_VOA15LIST" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VOA_VOA15LIST" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VOA_VOA15LIST" TO "BIOSAADM";
