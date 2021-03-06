CREATE TABLE "PIBICSDM2"."FS_FINESDUELOG" 
   (	"FSFDEULOGSEQNO" NUMBER, 
	"FSFDEUSEQNO" NUMBER, 
	"ESTIMATEYEAR" CHAR(4 CHAR), 
	"ESTIMATEMONTH" CHAR(2 CHAR), 
	"FLAGPROCESS" CHAR(1 CHAR), 
	"CONFIRMUSER" VARCHAR2(20 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"FLAGCOMMANDER" CHAR(1 CHAR), 
	"REWARDFINE" NUMBER(10,2)
   ) ;
  ALTER TABLE "PIBICSDM2"."FS_FINESDUELOG" ADD CONSTRAINT "FS_FINESDUELOG_PK" PRIMARY KEY ("FSFDEULOGSEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FS_FINESDUELOG_PK" ON "PIBICSDM2"."FS_FINESDUELOG" ("FSFDEULOGSEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FS_FINESDUELOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESDUELOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESDUELOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESDUELOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESDUELOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESDUELOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESDUELOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESDUELOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESDUELOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESDUELOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESDUELOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESDUELOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FS_FINESDUELOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FS_FINESDUELOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FS_FINESDUELOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FS_FINESDUELOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESDUELOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FS_FINESDUELOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FS_FINESDUELOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FS_FINESDUELOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FS_FINESDUELOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FS_FINESDUELOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FS_FINESDUELOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FS_FINESDUELOG" TO "BIOSAADM";
