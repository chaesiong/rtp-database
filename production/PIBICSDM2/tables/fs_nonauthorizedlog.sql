CREATE TABLE "PIBICSDM2"."FS_NONAUTHORIZEDLOG" 
   (	"FSNONAUTHLOGSEQNO" NUMBER, 
	"FSNONAUTHSEQNO" NUMBER, 
	"ESTIMATEYEAR" CHAR(4 CHAR), 
	"ESTIMATEMONTH" CHAR(2 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"FLAGPROCESS" CHAR(1 CHAR), 
	"CONFIRMUSER" VARCHAR2(20 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."FS_NONAUTHORIZEDLOG" ADD CONSTRAINT "FS_NONAUTHORIZEDLOG_PK" PRIMARY KEY ("FSNONAUTHLOGSEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FS_NONAUTHORIZEDLOG_PK" ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" ("FSNONAUTHLOGSEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FS_NONAUTHORIZEDLOG" TO "BIOSAADM";
