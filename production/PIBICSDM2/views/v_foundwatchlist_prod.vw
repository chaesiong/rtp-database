CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."V_FOUNDWATCHLIST_PROD" ("SEQNO", "USERID", "MATCHDATE", "ACTION", "EFIRSTNM", "EFAMILYNM", "EMIDDLENM", "TFIRSTNM", "TFAMILYNM", "TMIDDLENM", "NATIONCD", "SEX", "BIRTHDTE", "PASSPORTNO", "TM6NO", "DEPTCD", "MSEQNO", "WLCD", "USERSTAFF", "PROGRAM_ID", "INTERPOL") AS 
  SELECT SEQNO,
  USERID,
  MATCHDATE,
  ACTION,
  EFIRSTNM,
  EFAMILYNM,
  EMIDDLENM,
  TFIRSTNM,
  TFAMILYNM,
  TMIDDLENM,
  NATIONCD,
  SEX,
  BIRTHDTE,
  PASSPORTNO,
  TM6NO,
  DEPTCD,
  MSEQNO,
  WLCD,
  USERSTAFF,
  PROGRAM_ID,
  INTERPOL
FROM FOUNDWATCHLIST@pibics_prod;
  GRANT SELECT ON "PIBICSDM2"."V_FOUNDWATCHLIST_PROD" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."V_FOUNDWATCHLIST_PROD" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."V_FOUNDWATCHLIST_PROD" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."V_FOUNDWATCHLIST_PROD" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."V_FOUNDWATCHLIST_PROD" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."V_FOUNDWATCHLIST_PROD" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."V_FOUNDWATCHLIST_PROD" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."V_FOUNDWATCHLIST_PROD" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."V_FOUNDWATCHLIST_PROD" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."V_FOUNDWATCHLIST_PROD" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."V_FOUNDWATCHLIST_PROD" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."V_FOUNDWATCHLIST_PROD" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."V_FOUNDWATCHLIST_PROD" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."V_FOUNDWATCHLIST_PROD" TO "BIOSAADM";
