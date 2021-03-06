CREATE TABLE "PIBICSDM2"."FS_NONAUTHORIZED" 
   (	"FSNONAUTHSEQNO" NUMBER, 
	"ESTIMATEYEAR" CHAR(4 CHAR), 
	"ESTIMATEMONTH" CHAR(2 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"FLAGPROCESS" CHAR(1 CHAR), 
	"CONFIRMUSER" VARCHAR2(20 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."FS_NONAUTHORIZED" ADD CONSTRAINT "FS_NONAUTHORIZED_PK" PRIMARY KEY ("FSNONAUTHSEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."FS_NONAUTHORIZED" ADD CONSTRAINT "FS_NONAUTHORIZED_U01" UNIQUE ("DEPT_SEQNO", "ESTIMATEMONTH", "ESTIMATEYEAR")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FS_NONAUTHORIZED_PK" ON "PIBICSDM2"."FS_NONAUTHORIZED" ("FSNONAUTHSEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."FS_NONAUTHORIZED_U01" ON "PIBICSDM2"."FS_NONAUTHORIZED" ("DEPT_SEQNO", "ESTIMATEMONTH", "ESTIMATEYEAR") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FS_NONAUTHORIZED" TO "BIOSAADM";
