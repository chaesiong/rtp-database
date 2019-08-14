CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS_ERRORS" ("SEQNO", "CREATE_DATE", "MVMNTID", "BRDDOCID", "KV_ENTRY_FORMS", "MOVEMENT_DT", "DOCNO", "EXITFLG", "ISSUECTRY", "EXPIRYDATE", "TM6NO", "ROW_SHALL_BE_IGNORED", "LATEST_ORA_ERR_MESG$", "LATEST_ORA_ERR_TAG$", "F") AS 
  SELECT seqno
      ,create_date
      ,mvmntid
      ,brddocid
      ,kv_entry_forms
      ,movement_dt
      ,docno
      ,exitflg
      ,issuectry
      ,expirydate
      ,tm6no
      ,row_shall_be_ignored
      ,ora_err_mesg$        AS latest_ora_err_mesg$
      ,ora_err_tag$         AS latest_ora_err_tag$
      ,cnt_occurrences      f
FROM (SELECT c.seqno
            ,c.create_date
            ,c.mvmntid
            ,c.brddocid
            ,c.kv_entry_forms
            ,c.movement_dt
            ,c.docno
            ,c.exitflg
            ,c.issuectry
            ,c.expirydate
            ,c.tm6no
            ,c.row_shall_be_ignored
            ,e.ora_err_mesg$
            ,e.ora_err_tag$
            ,row_number() over(PARTITION BY c.seqno, c.pibics_table_cd ORDER BY e.entry_id DESC) AS rn
            ,COUNT(*) over(PARTITION BY c.seqno, c.pibics_table_cd) AS cnt_occurrences
      FROM dl_staging4pibics_intf.sync_movements c
      INNER JOIN dl_staging4pibics_intf.err$_sync_movements e
      ON c.seqno = e.seqno
      AND c.pibics_table_cd = e.pibics_table_cd
      AND c.pibics_table_cd = 'T'
      AND (c.mvmntid IS NULL OR c.brddocid IS NULL OR c.kv_entry_forms IS NULL))
WHERE rn = 1;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS_ERRORS" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS_ERRORS" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS_ERRORS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS_ERRORS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS_ERRORS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS_ERRORS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS_ERRORS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS_ERRORS" TO "APPSUP";
