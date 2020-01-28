CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BLACKLIST"."V_BLACKLIST_CASES" ("ID", "AUTHORITY", "BEHAVIOR", "CASE_NUMBER", "SECRET_LEVEL", "REASON", "IS_ACTIVE", "INS_BY", "INS_AT", "DML_BY", "DML_AT", "DML_TYPE", "URGENT_CONTACT", "CONTACT_INFORMATION", "TARGET_CODE", "ACTION_CODE", "NOTICE", "REFERENCE_DOCUMENT", "WARRANT_ARRESTED_TYPE", "CRIMINAL_CASE_NUMBER", "ARRESTED_DESCRIPTION", "ARRESTED_STATUS", "DECIDED_CASE_NUMBER", "ARRESTED_WARRANT_EXPIRY_DATE", "RELATED_DOCUMENT", "ARRESTED_WARRANT_NUMBER", "ARRESTED_WARRANT_DATE", "ARRESTED_WARRANT_YEAR", "UNDECIDED_CASE_NUMBER", "TRAVEL_PERMIT", "TRAVEL_PERMIT_FROM", "TRAVEL_PERMIT_TO", "TRAVEL_PERMIT_DATE_INSERT", "TRAVEL_PERMIT_DATE_DELETE", "TRAVEL_PERMIT_NOTE", "OWNER_DATA", "OTHER_DESCRIPTION", "CONTACT_TELEPHONE_NUMBER", "CONTACT_OWNER_DATA", "ASSOCIATED_BEHAVIOR", "OTHER", "CASE_TYPE", "OSTAY_CREATION_DATE", "OSTAY_SELF_INDICTMENT", "OSTAY_STATUS", "OSTAY_NO_DAYS", "OSTAY_ARRIVAL_DATE", "OSTAY_DEPARTURE_DATE", "OSTAY_TM6", "OSTAY_BLOCK_PERIOD", "OSTAY_NOTICE", "LOST_PP_LOST_DATE", "LOST_PP_LAST_PLACE", "LOST_PP_NOTIFY_DATE", "LOST_PP_NOTIFY_PLACE", "LOST_PP_VISA_ON_ARRIV", "LOST_PP_VISA_EXP_DATE", "LOST_PP_NOTICE", "LOST_PP_NEW_PP_TYPE", "LOST_PP_NEW_PP_NUMBER", "LOST_PP_NEW_PP_ISSUE_DATE", "LOST_PP_NEW_PP_PLACE_OF_ISSUE", "LOST_PP_NEW_PP_EXPIRE_DATE", "BIOMETRIC_JSON") AS 
  SELECT  c.id,
        c.authority,
        c.behavior,
        c.case_number,
        c.secret_level,
        c.reason,
        c.is_active,
        c.ins_by,
        c.ins_at,
        c.dml_by,
        c.dml_at,
        c.dml_type,
        c.urgent_contact,
        c.contact_information,
        c.target_code,
        c.action_code,
        c.notice,
        c.reference_document,
        c.warrant_arrested_type,
        c.criminal_case_number,
        c.arrested_description,
        c.arrested_status,
        c.decided_case_number,
        c.arrested_warrant_expiry_date,
        c.related_document,
        c.arrested_warrant_number,
        c.arrested_warrant_date,
        c.arrested_warrant_year,
        c.undecided_case_number,
        c.travel_permit,
        c.travel_permit_from,
        c.travel_permit_to,
        c.travel_permit_date_insert,
        c.travel_permit_date_delete,
        c.travel_permit_note,
        c.owner_data,
        c.other_description,
        c.contact_telephone_number,
        c.contact_owner_data,
        c.associated_behavior,
        c.other,
        c.case_type,
        c.ostay_creation_date,
        c.ostay_self_indictment,
        c.ostay_status,
        c.ostay_no_days,
        c.ostay_arrival_date,
        c.ostay_departure_date,
        c.ostay_tm6,
        c.ostay_block_period,
        c.ostay_notice,
        c.lost_pp_lost_date,
        c.lost_pp_last_place,
        c.lost_pp_notify_date,
        c.lost_pp_notify_place,
        c.lost_pp_visa_on_arriv,
        c.lost_pp_visa_exp_date,
        c.lost_pp_notice,
        c.lost_pp_new_pp_type,
        c.lost_pp_new_pp_number,
        c.lost_pp_new_pp_issue_date,
        c.lost_pp_new_pp_place_of_issue,
        c.lost_pp_new_pp_expire_date,
        dl_blacklist.pkg_camunda_rest.get_biometric_data$json( i_blacklist_case_id => c.id ) AS biometric_json
FROM    dl_blacklist.blacklist_cases c;
  GRANT SELECT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BLACKLIST"."V_BLACKLIST_CASES" TO "PUNYAWII_D";
