CREATE TABLE "PIBICSDM2"."FS_DEPTCHANGE" 
   (	"FSDEPTCHANGESEQNO" NUMBER, 
	"ESTIMATEYEAR" CHAR(4 CHAR), 
	"ESTIMATEMONTH" CHAR(2 CHAR), 
	"FLAGPROCESS" CHAR(1 CHAR), 
	"CONFIRMUSER" VARCHAR2(20 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."FS_DEPTCHANGE" ADD CONSTRAINT "FS_DEPTCHANGE_PK" PRIMARY KEY ("FSDEPTCHANGESEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FS_DEPTCHANGE_PK" ON "PIBICSDM2"."FS_DEPTCHANGE" ("FSDEPTCHANGESEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FS_DEPTCHANGE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FS_DEPTCHANGE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_DEPTCHANGE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FS_DEPTCHANGE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_DEPTCHANGE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_DEPTCHANGE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_DEPTCHANGE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FS_DEPTCHANGE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FS_DEPTCHANGE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FS_DEPTCHANGE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FS_DEPTCHANGE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FS_DEPTCHANGE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FS_DEPTCHANGE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FS_DEPTCHANGE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FS_DEPTCHANGE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FS_DEPTCHANGE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FS_DEPTCHANGE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FS_DEPTCHANGE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FS_DEPTCHANGE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FS_DEPTCHANGE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FS_DEPTCHANGE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FS_DEPTCHANGE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FS_DEPTCHANGE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FS_DEPTCHANGE" TO "BIOSAADM";
