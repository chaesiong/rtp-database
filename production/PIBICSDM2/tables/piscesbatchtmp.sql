CREATE TABLE "PIBICSDM2"."PISCESBATCHTMP" 
   (	"BATCHLOGNO" NUMBER, 
	"PISFILE" VARCHAR2(20 CHAR), 
	"TYPE" CHAR(1 CHAR), 
	"FILE_TYPE" VARCHAR2(8 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."PISCESBATCHTMP" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."PISCESBATCHTMP" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."PISCESBATCHTMP" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."PISCESBATCHTMP" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."PISCESBATCHTMP" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."PISCESBATCHTMP" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."PISCESBATCHTMP" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."PISCESBATCHTMP" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."PISCESBATCHTMP" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."PISCESBATCHTMP" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."PISCESBATCHTMP" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."PISCESBATCHTMP" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."PISCESBATCHTMP" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."PISCESBATCHTMP" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."PISCESBATCHTMP" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."PISCESBATCHTMP" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."PISCESBATCHTMP" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."PISCESBATCHTMP" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."PISCESBATCHTMP" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."PISCESBATCHTMP" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."PISCESBATCHTMP" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."PISCESBATCHTMP" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."PISCESBATCHTMP" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."PISCESBATCHTMP" TO "BIOSAADM";
