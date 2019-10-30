CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING4PIBICS_INTF"."SYNC_BLACKLIST_CASES_ERRORS" ("WLCD", "SEQNO", "OWNERAGE", "PIBICS_TABELE", "EXPIRYDATE", "NATIONCD", "PASSPORTNO", "CREATE_DATE", "CASE_ID", "IDENTITY_ID", "TRAVEL_DOCS_ID", "ROW_SHALL_BE_IGNORED", "LATEST_ORA_ERR_MESG$", "LATEST_ORA_ERR_TAG$", "CNT_OCCURRENCES") AS 
  SELECT wlcd
      ,seqno
      ,ownerage
      ,CASE pibics_table_cd
           WHEN 'L' THEN
            'LOSTPASSPORT'
           WHEN 'W' THEN
            'WATCHLIST'
           ELSE
            '?'
       END AS pibics_tabele
      ,expirydate
      ,nationcd
      ,passportno
      ,create_date
      ,case_id
      ,identity_id
      ,travel_docs_id
      ,row_shall_be_ignored
      ,ora_err_mesg$ AS latest_ora_err_mesg$
      ,ora_err_tag$ AS latest_ora_err_tag$
      ,cnt_occurrences
FROM (SELECT c.wlcd
            ,c.seqno
            ,c.ownerage
            ,c.expirydate
            ,c.nationcd
            ,c.passportno
            ,c.pibics_table_cd
            ,c.create_date
            ,c.case_id
            ,c.identity_id
            ,c.travel_docs_id
            ,c.row_shall_be_ignored
            ,e.ora_err_mesg$
            ,e.ora_err_tag$
            ,row_number() over(PARTITION BY c.wlcd, c.seqno, c.ownerage, c.pibics_table_cd ORDER BY e.entry_id DESC) AS rn
            ,COUNT(*) over(PARTITION BY c.wlcd, c.seqno, c.ownerage, c.pibics_table_cd) AS cnt_occurrences
      FROM dl_staging4pibics_intf.sync_blacklist_cases c
      INNER   JOIN dl_staging4pibics_intf.err$_sync_blacklist_cases e
      ON c.wlcd = e.wlcd
      AND (c.seqno = e.seqno OR (c.seqno IS NULL AND e.seqno IS NULL))
      AND (c.ownerage = e.ownerage OR (c.ownerage IS NULL AND e.ownerage IS NULL))
      AND (c.pibics_table_cd = e.pibics_table_cd OR (c.pibics_table_cd IS NULL AND e.pibics_table_cd IS NULL))
      WHERE (c.pibics_table_cd = 'L' AND (c.case_id IS NULL OR c.identity_id IS NULL OR c.travel_docs_id IS NULL))
      OR (c.pibics_table_cd = 'W' AND (c.case_id IS NULL OR c.identity_id IS NULL)))
WHERE rn = 1;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_BLACKLIST_CASES_ERRORS" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."SYNC_BLACKLIST_CASES_ERRORS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."SYNC_BLACKLIST_CASES_ERRORS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_BLACKLIST_CASES_ERRORS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."SYNC_BLACKLIST_CASES_ERRORS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_BLACKLIST_CASES_ERRORS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_BLACKLIST_CASES_ERRORS" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_BLACKLIST_CASES_ERRORS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_BLACKLIST_CASES_ERRORS" TO "BIOSUPPORT";
