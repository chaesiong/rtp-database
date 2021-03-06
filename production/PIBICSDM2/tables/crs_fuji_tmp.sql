CREATE TABLE "PIBICSDM2"."CRS_FUJI_TMP" 
   (	"ID_SEQNO" VARCHAR2(100 CHAR), 
	"YEARDATE" VARCHAR2(10 CHAR), 
	"FNAME" VARCHAR2(100 CHAR), 
	"LNAME" VARCHAR2(100 CHAR), 
	"RCNO_PVCD" VARCHAR2(2 CHAR), 
	"RCNO_YEAR" VARCHAR2(4 CHAR), 
	"RCNO_RUNNINGNO" VARCHAR2(20 CHAR), 
	"NID" VARCHAR2(100 CHAR), 
	"PASSPORTNO" VARCHAR2(100 CHAR), 
	"DATEACTION" VARCHAR2(100 CHAR), 
	"DOCNO" VARCHAR2(100 CHAR), 
	"FLAGIMP" CHAR(1 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."CRS_FUJI_TMP" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CRS_FUJI_TMP" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_FUJI_TMP" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CRS_FUJI_TMP" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_FUJI_TMP" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_FUJI_TMP" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_FUJI_TMP" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CRS_FUJI_TMP" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CRS_FUJI_TMP" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."CRS_FUJI_TMP" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."CRS_FUJI_TMP" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."CRS_FUJI_TMP" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."CRS_FUJI_TMP" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."CRS_FUJI_TMP" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."CRS_FUJI_TMP" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."CRS_FUJI_TMP" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."CRS_FUJI_TMP" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."CRS_FUJI_TMP" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."CRS_FUJI_TMP" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."CRS_FUJI_TMP" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."CRS_FUJI_TMP" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."CRS_FUJI_TMP" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."CRS_FUJI_TMP" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."CRS_FUJI_TMP" TO "BIOSAADM";
