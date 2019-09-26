CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_CRS_CERTOFRESIDENCE" ("CERTOFRESIDENCE_SEQNO", "PAIDBOOK_DATE", "CONTROLBOOK_NO", "FEES_SEQNO", "RCNO_PVCD", "RCNO_RUNNINGNO", "RCNO_YEAR", "RESCERTTYPE_SEQNO", "RCISSUE_BY", "RCISSUE_DATE", "RCISSUEPV_SEQNO", "RCISSUEAMP_SEQNO", "QUOTATYPE", "QUOTANO", "QUOTA_DATE", "ISSUETIME", "EFAMILYNM", "EFIRSTNM", "EMIDDLENM", "TFAMILYNM", "TFIRSTNM", "TMIDDLENM", "OTHERNM", "NATIONCD", "BIRTH_DATE", "BIRTH_PLACE", "BIRTH_COUNTRY", "SEX", "AGE", "OCC_SEQNO", "NATION_SEQNO", "HEIGHT", "MARK", "ADDR", "ROAD", "TMB_SEQNO", "AMP_SEQNO", "PV_SEQNO", "ZIPCODE", "REMARK", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "CRS_STS", "RACE", "REVOKE_DEPT_SEQNO", "REMARK_TYPE", "OCC_DETAIL", "T_IDICONCEPT", "DEPT_SEQNO", "SUFFIX_SEQNO", "IMGSTS", "FGPCRS", "FGPREMARK", "FGPSTS", "FGPMATCHPERCENT", "TM18_SEQNO", "TM20_SEQNO", "TEL") AS 
  SELECT 
CERTOFRESIDENCE_SEQNO, PAIDBOOK_DATE, CONTROLBOOK_NO, FEES_SEQNO, RCNO_PVCD, RCNO_RUNNINGNO, RCNO_YEAR, RESCERTTYPE_SEQNO, RCISSUE_BY, RCISSUE_DATE, RCISSUEPV_SEQNO, RCISSUEAMP_SEQNO, QUOTATYPE, QUOTANO, QUOTA_DATE, ISSUETIME, EFAMILYNM, EFIRSTNM, EMIDDLENM, TFAMILYNM, TFIRSTNM, TMIDDLENM, OTHERNM, NATIONCD, BIRTH_DATE, BIRTH_PLACE, BIRTH_COUNTRY, SEX, AGE, OCC_SEQNO, NATION_SEQNO, HEIGHT, MARK, ADDR, ROAD, TMB_SEQNO, AMP_SEQNO, PV_SEQNO, ZIPCODE, REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, VERSION, CRS_STS, RACE, REVOKE_DEPT_SEQNO, REMARK_TYPE, OCC_DETAIL, T_IDICONCEPT, DEPT_SEQNO, SUFFIX_SEQNO, IMGSTS, FGPCRS, FGPREMARK, FGPSTS, FGPMATCHPERCENT, TM18_SEQNO, TM20_SEQNO, TEL
FROM pibicsdm2.CRS_CERTOFRESIDENCE;
  GRANT SELECT ON "DL_STAGING"."V_CRS_CERTOFRESIDENCE" TO "DL_BORDERCONTROL";
