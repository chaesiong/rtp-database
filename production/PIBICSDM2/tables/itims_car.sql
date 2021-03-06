CREATE TABLE "PIBICSDM2"."ITIMS_CAR" 
   (	"ORG_CODE" VARCHAR2(5 CHAR), 
	"ORG_NAME" VARCHAR2(200 CHAR), 
	"RECEIVE_DATE" VARCHAR2(8 CHAR), 
	"CAR_PLATE1" VARCHAR2(3 CHAR), 
	"CAR_PLATE2" VARCHAR2(4 CHAR), 
	"CAR_TYPE" VARCHAR2(2 CHAR), 
	"CAR_TYPE_NAME" VARCHAR2(90 CHAR), 
	"CAR_PROVINCE" VARCHAR2(3 CHAR), 
	"CAR_PROVINCE_NAME" VARCHAR2(20 CHAR), 
	"CAR_FLAG" CHAR(1 CHAR), 
	"RETURN_DATE" VARCHAR2(8 CHAR), 
	"UPD_DATE" DATE
   ) ;
  GRANT SELECT ON "PIBICSDM2"."ITIMS_CAR" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."ITIMS_CAR" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."ITIMS_CAR" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."ITIMS_CAR" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."ITIMS_CAR" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."ITIMS_CAR" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."ITIMS_CAR" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."ITIMS_CAR" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."ITIMS_CAR" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."ITIMS_CAR" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."ITIMS_CAR" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."ITIMS_CAR" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."ITIMS_CAR" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."ITIMS_CAR" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."ITIMS_CAR" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."ITIMS_CAR" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."ITIMS_CAR" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."ITIMS_CAR" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."ITIMS_CAR" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."ITIMS_CAR" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."ITIMS_CAR" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."ITIMS_CAR" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."ITIMS_CAR" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."ITIMS_CAR" TO "BIOSAADM";
