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
