CREATE GLOBAL TEMPORARY TABLE "PIBICSDM2"."RUPD$_BATCHLOG" 
   (	"BATCHLOGNO" NUMBER, 
	"DMLTYPE$$" VARCHAR2(1 CHAR), 
	"SNAPID" NUMBER(*,0), 
	"CHANGE_VECTOR$$" RAW(255)
   ) ON COMMIT PRESERVE ROWS ;
  GRANT SELECT ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."RUPD$_BATCHLOG" TO "BIOSAADM";
