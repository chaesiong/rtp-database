CREATE TABLE "PIBICSDM2"."CORRUPT_LOBS1" 
   (	"CORRUPT_ROWID" ROWID, 
	"ERR_NUM" NUMBER
   ) ;
  GRANT SELECT ON "PIBICSDM2"."CORRUPT_LOBS1" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CORRUPT_LOBS1" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CORRUPT_LOBS1" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CORRUPT_LOBS1" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CORRUPT_LOBS1" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CORRUPT_LOBS1" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CORRUPT_LOBS1" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CORRUPT_LOBS1" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CORRUPT_LOBS1" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."CORRUPT_LOBS1" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."CORRUPT_LOBS1" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."CORRUPT_LOBS1" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."CORRUPT_LOBS1" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."CORRUPT_LOBS1" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."CORRUPT_LOBS1" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."CORRUPT_LOBS1" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."CORRUPT_LOBS1" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."CORRUPT_LOBS1" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."CORRUPT_LOBS1" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."CORRUPT_LOBS1" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."CORRUPT_LOBS1" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."CORRUPT_LOBS1" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."CORRUPT_LOBS1" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."CORRUPT_LOBS1" TO "BIOSAADM";
