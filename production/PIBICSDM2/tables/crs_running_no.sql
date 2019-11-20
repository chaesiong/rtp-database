CREATE TABLE "PIBICSDM2"."CRS_RUNNING_NO" 
   (	"CRS_RUNNINGNO_SEQNO" NUMBER, 
	"RUNNING_MONTH" VARCHAR2(2 CHAR), 
	"DEPTCD" VARCHAR2(3 CHAR), 
	"RUNNING_YEAR" VARCHAR2(2 CHAR), 
	"CRS_RUNNINGNO" NUMBER, 
	"CRS_TMTYPE" VARCHAR2(2 CHAR), 
	"CREATE_BY" VARCHAR2(60 CHAR), 
	"CREATE_DATE" DATE, 
	"UPDATE_BY" VARCHAR2(60 CHAR), 
	"UPDATE_DATE" DATE, 
	"VERSION" NUMBER
   ) ;
  GRANT SELECT ON "PIBICSDM2"."CRS_RUNNING_NO" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CRS_RUNNING_NO" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_RUNNING_NO" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CRS_RUNNING_NO" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_RUNNING_NO" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_RUNNING_NO" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_RUNNING_NO" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CRS_RUNNING_NO" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CRS_RUNNING_NO" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."CRS_RUNNING_NO" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."CRS_RUNNING_NO" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."CRS_RUNNING_NO" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."CRS_RUNNING_NO" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."CRS_RUNNING_NO" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."CRS_RUNNING_NO" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."CRS_RUNNING_NO" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."CRS_RUNNING_NO" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."CRS_RUNNING_NO" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."CRS_RUNNING_NO" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."CRS_RUNNING_NO" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."CRS_RUNNING_NO" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."CRS_RUNNING_NO" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."CRS_RUNNING_NO" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."CRS_RUNNING_NO" TO "BIOSAADM";
