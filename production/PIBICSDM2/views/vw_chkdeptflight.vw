CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_CHKDEPTFLIGHT" ("DEPT_SEQNO") AS 
  select DEPT_SEQNO from DEPARTMENT WHERE ROWNUM=1;
  GRANT SELECT ON "PIBICSDM2"."VW_CHKDEPTFLIGHT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_CHKDEPTFLIGHT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_CHKDEPTFLIGHT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VW_CHKDEPTFLIGHT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VW_CHKDEPTFLIGHT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VW_CHKDEPTFLIGHT" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VW_CHKDEPTFLIGHT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VW_CHKDEPTFLIGHT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VW_CHKDEPTFLIGHT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VW_CHKDEPTFLIGHT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VW_CHKDEPTFLIGHT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VW_CHKDEPTFLIGHT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VW_CHKDEPTFLIGHT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VW_CHKDEPTFLIGHT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VW_CHKDEPTFLIGHT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VW_CHKDEPTFLIGHT" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VW_CHKDEPTFLIGHT" TO "BIOSAADM";
