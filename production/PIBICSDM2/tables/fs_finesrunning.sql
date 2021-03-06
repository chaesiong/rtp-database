CREATE TABLE "PIBICSDM2"."FS_FINESRUNNING" 
   (	"FINESRUN_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"ZONE_SEQNO" NUMBER, 
	"FINES_YEAR" VARCHAR2(4 CHAR), 
	"FINES_RUNNINGNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_IP" VARCHAR2(20 CHAR), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_IP" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."FS_FINESRUNNING" ADD CONSTRAINT "FS_FINESRUNNING_PK" PRIMARY KEY ("FINESRUN_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FS_FINESRUNNING_PK" ON "PIBICSDM2"."FS_FINESRUNNING" ("FINESRUN_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FS_FINESRUNNING" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESRUNNING" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESRUNNING" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESRUNNING" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESRUNNING" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESRUNNING" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESRUNNING" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESRUNNING" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESRUNNING" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESRUNNING" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESRUNNING" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESRUNNING" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FS_FINESRUNNING" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FS_FINESRUNNING" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FS_FINESRUNNING" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FS_FINESRUNNING" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FS_FINESRUNNING" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FS_FINESRUNNING" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FS_FINESRUNNING" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FS_FINESRUNNING" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FS_FINESRUNNING" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FS_FINESRUNNING" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FS_FINESRUNNING" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FS_FINESRUNNING" TO "BIOSAADM";
