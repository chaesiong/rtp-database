CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_RANK" ("RANK_SEQNO", "RANKFULLNM", "RANKNM", "UPD_ID", "UPD_DATE", "UPD_ORG", "NEXT_RANK", "SPECIAL_RANK", "RANKID") AS 
  SELECT 
    rank_seqno,
    rankfullnm,
    ranknm,
    upd_id,
    upd_date,
    upd_org,
    next_rank,
    special_rank,
    rankid
FROM pibicsdm2.RANK;
  GRANT SELECT ON "DL_STAGING"."V_RANK" TO "DL_USER_MANAGEMENT";
  GRANT SELECT ON "DL_STAGING"."V_RANK" TO "APEX_USER_MANAGEMENT";
