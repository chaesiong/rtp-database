CREATE TABLE "PIBICSDM2"."FS_ACCOUNTPERSONLOG" 
   (	"FSAPLOGSEQNO" NUMBER, 
	"FSALOGSEQNO" NUMBER, 
	"FSACCPERSONSEQNO" NUMBER, 
	"FSACCOUNTSEQNO" NUMBER, 
	"PROFILE_SEQNO" NUMBER, 
	"ACPAMOUNT2PER" NUMBER(7,2), 
	"ACPAMOUNT1PER" NUMBER(7,2), 
	"ACPAMOUNT" NUMBER(7,2), 
	"FSDEPT_SEQNO" NUMBER, 
	"POSLEVEL_SEQNO" NUMBER, 
	"RANK_SEQNO" VARCHAR2(3 CHAR), 
	"FSFIRSTNM" VARCHAR2(60 CHAR), 
	"FSFAMILYNM" VARCHAR2(60 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."FS_ACCOUNTPERSONLOG" ADD CONSTRAINT "FS_ACCOUNTPERSONLOG_PK" PRIMARY KEY ("FSAPLOGSEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."FS_ACCOUNTPERSONLOG" ADD CONSTRAINT "FS_ACCOUNTPERSONLOG_R01" FOREIGN KEY ("FSALOGSEQNO")
	  REFERENCES "PIBICSDM2"."FS_ACCOUNTLOG" ("FSALOGSEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."FS_ACCOUNTPERSONLOG" ADD CONSTRAINT "FS_ACCOUNTPERSONLOG_R04" FOREIGN KEY ("POSLEVEL_SEQNO")
	  REFERENCES "PIBICSDM2"."POSLEVEL" ("POSLEVEL_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FS_ACCOUNTPERSONLOG_PK" ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" ("FSAPLOGSEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FS_ACCOUNTPERSONLOG" TO "BIOSAADM";
