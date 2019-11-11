CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" ("ID", "AUTHORITY", "BEHAVIOR", "CASE_NUMBER", "SECRET_LEVEL", "REASON", "URGENT_CONTACT", "CONTACT_INFORMATION", "TARGET_CODE", "ACTION_CODE", "NOTICE", "REFERENCE_DOCUMENT", "WARRANT_ARRESTED_TYPE", "CRIMINAL_CASE_NUMBER", "ARRESTED_DESCRIPTION", "ARRESTED_STATUS", "DECIDED_CASE_NUMBER", "ARRESTED_WARRANT_EXPIRY_DATE", "RELATED_DOCUMENT", "ARRESTED_WARRANT_NUMBER", "ARRESTED_WARRANT_DATE", "TRAVEL_PERMIT", "TRAVEL_PERMIT_FROM", "TRAVEL_PERMIT_TO", "TRAVEL_PERMIT_DATE_INSERT", "TRAVEL_PERMIT_DATE_DELETE", "TRAVEL_PERMIT_NOTE", "OWNER_DATA", "OTHER_DESCRIPTION", "CONTACT_TELEPHONE_NUMBER", "CONTACT_OWNER_DATA", "ASSOCIATED_BEHAVIOR", "OTHER", "IS_ACTIVE", "INS_BY", "INS_AT", "DML_BY", "DML_AT", "DML_TYPE") AS 
  SELECT
    bc.id,
    bc.authority,
    bc.behavior,
    bc.case_number,
--,bc.SECRET_LEVEL
    s.display_value AS secret_level,
--,bc.REASON
    r.display_value AS reason,
    bc.urgent_contact,
    bc.contact_information,
    bc.target_code,
-- ,bc.ACTION_CODE
    ac.display_value AS action_code,
    bc.notice,
    bc.reference_document,
--,bc.WARRANT_ARRESTED_TYPE
    at.display_value AS warrant_arrested_type,
    bc.criminal_case_number,
    bc.arrested_description,
--,bc.ARRESTED_STATUS
    ast.display_value AS arrested_status,
    bc.decided_case_number,
    bc.arrested_warrant_expiry_date,
    bc.related_document,
    bc.arrested_warrant_number,
    bc.arrested_warrant_date,
    bc.travel_permit,
    bc.travel_permit_from,
    bc.travel_permit_to,
    bc.travel_permit_date_insert,
    bc.travel_permit_date_delete,
    bc.travel_permit_note,
    bc.owner_data,
    bc.other_description,
    bc.contact_telephone_number,
    bc.contact_owner_data,
    bc.associated_behavior,
    bc.other,
    bc.is_active,
    bc.ins_by,
    bc.ins_at,
    bc.dml_by,
    bc.dml_at,
    bc.dml_type
FROM
    blacklist_cases bc
    LEFT JOIN dl_common.secret_levels s ON s.key_value = bc.secret_level
    LEFT JOIN dl_common.arrested_types at ON at.key_value = bc.warrant_arrested_type
    LEFT JOIN dl_common.arrested_statuses ast ON ast.key_value = bc.arrested_status
    LEFT JOIN dl_common.reason_codes r ON r.key_value = bc.reason
    LEFT JOIN dl_common.action_codes ac ON ac.key_value = bc.action_code
;
   COMMENT ON TABLE "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED"  IS 'BLACKLIST_CASES withj display values for the lookup tables';
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BLACKLIST"."BLACKLIST_CASES_EXTENDED" TO "BIOSAADM";
