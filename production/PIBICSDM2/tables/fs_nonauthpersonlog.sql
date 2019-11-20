CREATE TABLE "PIBICSDM2"."FS_NONAUTHPERSONLOG" 
   (	"NONAUTHPERSONLOGSEQNO" NUMBER, 
	"FSNONAUTHLOGSEQNO" NUMBER, 
	"NONAUTHPERSONSEQNO" NUMBER, 
	"FSNONAUTHSEQNO" NUMBER, 
	"PROFILE_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"REMARK" VARCHAR2(200 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."FS_NONAUTHPERSONLOG" ADD CONSTRAINT "FS_NONAUTHPERSONLOG_PK" PRIMARY KEY ("NONAUTHPERSONLOGSEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."FS_NONAUTHPERSONLOG" ADD CONSTRAINT "FS_NONAUTHPERSONLOG_R01" FOREIGN KEY ("FSNONAUTHLOGSEQNO")
	  REFERENCES "PIBICSDM2"."FS_NONAUTHORIZEDLOG" ("FSNONAUTHLOGSEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FS_NONAUTHPERSONLOG_PK" ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" ("NONAUTHPERSONLOGSEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FS_NONAUTHPERSONLOG" TO "BIOSAADM";
