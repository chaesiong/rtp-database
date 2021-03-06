CREATE TABLE "PIBICSDM2"."JOB_LOG" 
   (	"JOB_NAME" VARCHAR2(30 CHAR), 
	"VSTART" VARCHAR2(20 CHAR), 
	"VEND" VARCHAR2(20 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."JOB_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."JOB_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."JOB_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."JOB_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."JOB_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."JOB_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."JOB_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."JOB_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."JOB_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."JOB_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."JOB_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."JOB_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."JOB_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."JOB_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."JOB_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."JOB_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."JOB_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."JOB_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."JOB_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."JOB_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."JOB_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."JOB_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."JOB_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."JOB_LOG" TO "BIOSAADM";
