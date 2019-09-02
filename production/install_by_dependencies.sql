-- Found 1642 objects
-- Found 3299 dependencies
-- 1: Add 702 objects
-- 2: Add 312 objects
-- 3: Add 190 objects
-- 4: Add 217 objects
-- 5: Add 125 objects
-- 6: Add 55 objects
-- 7: Add 34 objects
-- 8: Add 7 objects
-- 9: Add 0 objects
-- Resolved dependencies for 1642 / 1642 objects
SET DEFINE OFF;
@install-user.sql
@install-db_links.sql
@install-public_db_links.sql
@preparations.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/v_department.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/v_department.sql
SELECT '@./DL_BIOSTORE_BLACKLIST/sequences/biometric_sample_seq.sql' AS ">" FROM DUAL;
@./DL_BIOSTORE_BLACKLIST/sequences/biometric_sample_seq.sql
SELECT '@./DL_BIOSTORE_BLACKLIST/tables/record.sql' AS ">" FROM DUAL;
@./DL_BIOSTORE_BLACKLIST/tables/record.sql
SELECT '@./DL_BIOSTORE_BLACKLIST/sequences/record_seq.sql' AS ">" FROM DUAL;
@./DL_BIOSTORE_BLACKLIST/sequences/record_seq.sql
SELECT '@./DL_BIOSTORE_BLACKLIST/sequences/template_seq.sql' AS ">" FROM DUAL;
@./DL_BIOSTORE_BLACKLIST/sequences/template_seq.sql
SELECT '@./DL_BIOSTORE_MOVEMENTS/sequences/biometric_sample_seq.sql' AS ">" FROM DUAL;
@./DL_BIOSTORE_MOVEMENTS/sequences/biometric_sample_seq.sql
SELECT '@./DL_BIOSTORE_MOVEMENTS/tables/record.sql' AS ">" FROM DUAL;
@./DL_BIOSTORE_MOVEMENTS/tables/record.sql
SELECT '@./DL_BIOSTORE_MOVEMENTS/sequences/record_seq.sql' AS ">" FROM DUAL;
@./DL_BIOSTORE_MOVEMENTS/sequences/record_seq.sql
SELECT '@./DL_BIOSTORE_MOVEMENTS/sequences/template_seq.sql' AS ">" FROM DUAL;
@./DL_BIOSTORE_MOVEMENTS/sequences/template_seq.sql
SELECT '@./DL_BLACKLIST/packages/pkg_camunda_rest.pks' AS ">" FROM DUAL;
@./DL_BLACKLIST/packages/pkg_camunda_rest.pks
SELECT '@./DL_BLACKLIST/packages/pkg_dl_history.pks' AS ">" FROM DUAL;
@./DL_BLACKLIST/packages/pkg_dl_history.pks
SELECT '@./DL_BLACKLIST/packages/pkg_dl_plugin_ajax.pks' AS ">" FROM DUAL;
@./DL_BLACKLIST/packages/pkg_dl_plugin_ajax.pks
SELECT '@./DL_BLACKLIST/packages/pkg_keep_blacklist_data.pks' AS ">" FROM DUAL;
@./DL_BLACKLIST/packages/pkg_keep_blacklist_data.pks
SELECT '@./DL_BLACKLIST/packages/pkg_utils.pks' AS ">" FROM DUAL;
@./DL_BLACKLIST/packages/pkg_utils.pks
SELECT '@./DL_BLACKLIST/synonyms/apex_wwv_flow_messages.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/synonyms/apex_wwv_flow_messages.sql
SELECT '@./DL_BLACKLIST/tables/blacklist_case_identities_bk.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/blacklist_case_identities_bk.sql
SELECT '@./DL_BLACKLIST/tables/blacklist_case_identities2.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/blacklist_case_identities2.sql
SELECT '@./DL_BLACKLIST/tables/blacklist_cases_bk.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/blacklist_cases_bk.sql
SELECT '@./DL_BLACKLIST/tables/blacklist_cases\\\$his.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/blacklist_cases\\\$his.sql
SELECT '@./DL_BLACKLIST/sequences/blacklist_cases\\\$seq00.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/sequences/blacklist_cases\\\$seq00.sql
SELECT '@./DL_BLACKLIST/tables/blacklist_cases2.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/blacklist_cases2.sql
SELECT '@./DL_BLACKLIST/tables/compression_algorithms.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/compression_algorithms.sql
SELECT '@./DL_BLACKLIST/types/ct_partial_date.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/types/ct_partial_date.sql
SELECT '@./DL_BLACKLIST/tables/device_types.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/device_types.sql
SELECT '@./DL_BLACKLIST/tables/face_missing_reasons.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/face_missing_reasons.sql
SELECT '@./DL_BLACKLIST/tables/face_missing_reasons\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/face_missing_reasons\\\$i18n.sql
SELECT '@./DL_BLACKLIST/tables/face_positions.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/face_positions.sql
SELECT '@./DL_BLACKLIST/tables/face_positions\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/face_positions\\\$i18n.sql
SELECT '@./DL_BLACKLIST/tables/face_quality_types.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/face_quality_types.sql
SELECT '@./DL_BLACKLIST/tables/face_quality_types\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/face_quality_types\\\$i18n.sql
SELECT '@./DL_BLACKLIST/tables/face_resolutions.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/face_resolutions.sql
SELECT '@./DL_BLACKLIST/tables/finger_impression_types.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/finger_impression_types.sql
SELECT '@./DL_BLACKLIST/tables/finger_impression_types\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/finger_impression_types\\\$i18n.sql
SELECT '@./DL_BLACKLIST/tables/finger_missing_reasons.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/finger_missing_reasons.sql
SELECT '@./DL_BLACKLIST/tables/finger_missing_reasons\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/finger_missing_reasons\\\$i18n.sql
SELECT '@./DL_BLACKLIST/tables/finger_positions.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/finger_positions.sql
SELECT '@./DL_BLACKLIST/tables/finger_positions\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/finger_positions\\\$i18n.sql
SELECT '@./DL_BLACKLIST/tables/icrs_case_sync.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/icrs_case_sync.sql
SELECT '@./DL_BLACKLIST/tables/icrs_case_sync\\\$his.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/icrs_case_sync\\\$his.sql
SELECT '@./DL_BLACKLIST/tables/identities_bk.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/identities_bk.sql
SELECT '@./DL_BLACKLIST/tables/identities\\\$his.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/identities\\\$his.sql
SELECT '@./DL_BLACKLIST/tables/identities\\\$tag\\\$his.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/identities\\\$tag\\\$his.sql
SELECT '@./DL_BLACKLIST/tables/identities2.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/identities2.sql
SELECT '@./DL_BLACKLIST/views/install_parameter.vw' AS ">" FROM DUAL;
@./DL_BLACKLIST/views/install_parameter.vw
SELECT '@./DL_BLACKLIST/tables/keep_blacklist_data.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/keep_blacklist_data.sql
SELECT '@./DL_BLACKLIST/tables/logs_icrs.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/logs_icrs.sql
SELECT '@./DL_BLACKLIST/tables/nist_tcn.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/nist_tcn.sql
SELECT '@./DL_BLACKLIST/sequences/nist_tcn_serial\\\$seq01.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/sequences/nist_tcn_serial\\\$seq01.sql
SELECT '@./DL_BLACKLIST/tables/ops_preferences.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/ops_preferences.sql
SELECT '@./DL_BLACKLIST/types/ot_blt_search_result.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/types/ot_blt_search_result.sql
SELECT '@./DL_BLACKLIST/types/ot_blt_search_result_ext.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/types/ot_blt_search_result_ext.sql
SELECT '@./DL_BLACKLIST/package_bodies/pkg_dl_history.pkb' AS ">" FROM DUAL;
@./DL_BLACKLIST/package_bodies/pkg_dl_history.pkb
SELECT '@./DL_BLACKLIST/tables/quality_algorithms.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/quality_algorithms.sql
SELECT '@./DL_BLACKLIST/tables/related_persons\\\$his.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/related_persons\\\$his.sql
SELECT '@./DL_BLACKLIST/procedures/searchjk.prc' AS ">" FROM DUAL;
@./DL_BLACKLIST/procedures/searchjk.prc
SELECT '@./DL_BLACKLIST/tables/travel_docs_bk.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/travel_docs_bk.sql
SELECT '@./DL_BLACKLIST/tables/travel_docs\\\$his.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/travel_docs\\\$his.sql
SELECT '@./DL_BLACKLIST/tables/travel_docs\\\$tag\\\$his.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/travel_docs\\\$tag\\\$his.sql
SELECT '@./DL_BLACKLIST/types/tt_blt_search_result.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/types/tt_blt_search_result.sql
SELECT '@./DL_BLACKLIST/types/tt_blt_search_result_ext.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/types/tt_blt_search_result_ext.sql
SELECT '@./DL_BLACKLIST/types/tt_varchar2.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/types/tt_varchar2.sql
SELECT '@./DL_BLACKLIST/tables/xxtmp_mps_log.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/xxtmp_mps_log.sql
SELECT '@./DL_BORDERCONTROL/packages/dl_ldap.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/dl_ldap.pks
SELECT '@./DL_BORDERCONTROL/packages/pkg_abis_util.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/pkg_abis_util.pks
SELECT '@./DL_BORDERCONTROL/packages/pkg_bmbs_apex_util.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/pkg_bmbs_apex_util.pks
SELECT '@./DL_BORDERCONTROL/packages/pkg_dl_authorization.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/pkg_dl_authorization.pks
SELECT '@./DL_BORDERCONTROL/packages/pkg_icpo_util.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/pkg_icpo_util.pks
SELECT '@./DL_BORDERCONTROL/packages/pkg_json_export.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/pkg_json_export.pks
SELECT '@./DL_BORDERCONTROL/packages/pkg_json_export_manual.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/pkg_json_export_manual.pks
SELECT '@./DL_BORDERCONTROL/packages/pkg_messages.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/pkg_messages.pks
SELECT '@./DL_BORDERCONTROL/packages/xlib_http.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/xlib_http.pks
SELECT '@./DL_BORDERCONTROL/packages/xlib_jasperreports.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/xlib_jasperreports.pks
SELECT '@./DL_BORDERCONTROL/packages/xlib_jasperreports_img.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/xlib_jasperreports_img.pks
SELECT '@./DL_BORDERCONTROL/packages/xlib_log.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/xlib_log.pks
SELECT '@./DL_BORDERCONTROL/tables/adm_class_district.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/adm_class_district.sql
SELECT '@./DL_BORDERCONTROL/tables/adm_class_district\\\$his.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/adm_class_district\\\$his.sql
SELECT '@./DL_BORDERCONTROL/tables/adm_class_district\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/adm_class_district\\\$i18n.sql
SELECT '@./DL_BORDERCONTROL/tables/adm_class_province.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/adm_class_province.sql
SELECT '@./DL_BORDERCONTROL/tables/adm_class_province\\\$his.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/adm_class_province\\\$his.sql
SELECT '@./DL_BORDERCONTROL/tables/adm_class_province\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/adm_class_province\\\$i18n.sql
SELECT '@./DL_BORDERCONTROL/tables/adm_class_region.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/adm_class_region.sql
SELECT '@./DL_BORDERCONTROL/tables/adm_class_region\\\$his.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/adm_class_region\\\$his.sql
SELECT '@./DL_BORDERCONTROL/tables/adm_class_region\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/adm_class_region\\\$i18n.sql
SELECT '@./DL_BORDERCONTROL/tables/adm_class_subdistrict.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/adm_class_subdistrict.sql
SELECT '@./DL_BORDERCONTROL/tables/adm_class_subdistrict\\\$his.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/adm_class_subdistrict\\\$his.sql
SELECT '@./DL_BORDERCONTROL/tables/adm_class_subdistrict\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/adm_class_subdistrict\\\$i18n.sql
SELECT '@./DL_BORDERCONTROL/tables/aq\\\$_aq_bordercontrol_hooks_tab_g.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/aq\\\$_aq_bordercontrol_hooks_tab_g.sql
SELECT '@./DL_BORDERCONTROL/tables/aq\\\$_aq_bordercontrol_hooks_tab_h.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/aq\\\$_aq_bordercontrol_hooks_tab_h.sql
SELECT '@./DL_BORDERCONTROL/tables/aq\\\$_aq_bordercontrol_hooks_tab_i.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/aq\\\$_aq_bordercontrol_hooks_tab_i.sql
SELECT '@./DL_BORDERCONTROL/tables/aq\\\$_aq_bordercontrol_hooks_tab_l.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/aq\\\$_aq_bordercontrol_hooks_tab_l.sql
SELECT '@./DL_BORDERCONTROL/sequences/aq\\\$_aq_bordercontrol_hooks_tab_n.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/sequences/aq\\\$_aq_bordercontrol_hooks_tab_n.sql
SELECT '@./DL_BORDERCONTROL/tables/aq\\\$_aq_bordercontrol_hooks_tab_s.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/aq\\\$_aq_bordercontrol_hooks_tab_s.sql
SELECT '@./DL_BORDERCONTROL/views/aq\\\$aq_bordercontrol_hooks_tab_s.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/aq\\\$aq_bordercontrol_hooks_tab_s.vw
SELECT '@./DL_BORDERCONTROL/tables/aq\\\$_aq_bordercontrol_hooks_tab_t.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/aq\\\$_aq_bordercontrol_hooks_tab_t.sql
SELECT '@./DL_BORDERCONTROL/procedures/assert.prc' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/procedures/assert.prc
SELECT '@./DL_BORDERCONTROL/tables/bio_abisstatus\\\$his.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/bio_abisstatus\\\$his.sql
SELECT '@./DL_BORDERCONTROL/tables/bio_identities.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/bio_identities.sql
SELECT '@./DL_BORDERCONTROL/tables/bio_identities\\\$his.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/bio_identities\\\$his.sql
SELECT '@./DL_BORDERCONTROL/tables/blacklist_log.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/blacklist_log.sql
SELECT '@./DL_BORDERCONTROL/tables/borderposts\\\$his.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/borderposts\\\$his.sql
SELECT '@./DL_BORDERCONTROL/views/col_blacklist_hits.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/col_blacklist_hits.vw
SELECT '@./DL_BORDERCONTROL/views/col_faf_payment_rate.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/col_faf_payment_rate.vw
SELECT '@./DL_BORDERCONTROL/tables/crew_members.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/crew_members.sql
SELECT '@./DL_BORDERCONTROL/tables/crew_members\\\$his.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/crew_members\\\$his.sql
SELECT '@./DL_BORDERCONTROL/types/ct_partial_date_type.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/ct_partial_date_type.sql
SELECT '@./DL_BORDERCONTROL/tables/display_objects.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/display_objects.sql
SELECT '@./DL_BORDERCONTROL/tables/entry_forms.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/entry_forms.sql
SELECT '@./DL_BORDERCONTROL/tables/faf_fees_and_fines_details\\\$his.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/faf_fees_and_fines_details\\\$his.sql
SELECT '@./DL_BORDERCONTROL/tables/faf_fees_and_fines\\\$his.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/faf_fees_and_fines\\\$his.sql
SELECT '@./DL_BORDERCONTROL/sequences/faf_fees_and_fines\\\$seq01.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/sequences/faf_fees_and_fines\\\$seq01.sql
SELECT '@./DL_BORDERCONTROL/sequences/faf_fees_and_fines\\\$seq02.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/sequences/faf_fees_and_fines\\\$seq02.sql
SELECT '@./DL_BORDERCONTROL/tables/faf_payment_rate\\\$his.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/faf_payment_rate\\\$his.sql
SELECT '@./DL_BORDERCONTROL/tables/faf_payment_rate\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/faf_payment_rate\\\$i18n\\\$his.sql
SELECT '@./DL_BORDERCONTROL/tables/faf_payment_rate\\\$tag\\\$his.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/faf_payment_rate\\\$tag\\\$his.sql
SELECT '@./DL_BORDERCONTROL/tables/faf_permit_type.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/faf_permit_type.sql
SELECT '@./DL_BORDERCONTROL/tables/faf_permit_type\\\$his.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/faf_permit_type\\\$his.sql
SELECT '@./DL_BORDERCONTROL/tables/faf_permit_type\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/faf_permit_type\\\$i18n\\\$his.sql
SELECT '@./DL_BORDERCONTROL/tables/faf_permit_type\\\$tag\\\$his.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/faf_permit_type\\\$tag\\\$his.sql
SELECT '@./DL_BORDERCONTROL/tables/flight_health_check.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/flight_health_check.sql
SELECT '@./DL_BORDERCONTROL/tables/flighttypes.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/flighttypes.sql
SELECT '@./DL_BORDERCONTROL/functions/fn_chk_bl.fnc' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/functions/fn_chk_bl.fnc
SELECT '@./DL_BORDERCONTROL/tables/identities_bk.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/identities_bk.sql
SELECT '@./DL_BORDERCONTROL/tables/identities\\\$his.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/identities\\\$his.sql
SELECT '@./DL_BORDERCONTROL/views/install_parameter.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/install_parameter.vw
SELECT '@./DL_BORDERCONTROL/tables/license_monitoring.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/license_monitoring.sql
SELECT '@./DL_BORDERCONTROL/tables/movements_bk.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/movements_bk.sql
SELECT '@./DL_BORDERCONTROL/sequences/mscs_insair\\\$seq01.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/sequences/mscs_insair\\\$seq01.sql
SELECT '@./DL_BORDERCONTROL/sequences/mscs_insbank\\\$seq01.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/sequences/mscs_insbank\\\$seq01.sql
SELECT '@./DL_BORDERCONTROL/sequences/mscs_inscash\\\$seq01.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/sequences/mscs_inscash\\\$seq01.sql
SELECT '@./DL_BORDERCONTROL/sequences/mscs_insdept\\\$seq01.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/sequences/mscs_insdept\\\$seq01.sql
SELECT '@./DL_BORDERCONTROL/tables/mscs_movements_permit.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/mscs_movements_permit.sql
SELECT '@./DL_BORDERCONTROL/synonyms/mscs_tm2.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/mscs_tm2.sql
SELECT '@./DL_BORDERCONTROL/sequences/mscs_tm5\\\$seq01.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/sequences/mscs_tm5\\\$seq01.sql
SELECT '@./DL_BORDERCONTROL/tables/offline_mode.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/offline_mode.sql
SELECT '@./DL_BORDERCONTROL/tables/offline_sync_error.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/offline_sync_error.sql
SELECT '@./DL_BORDERCONTROL/tables/ops_oauth_clients.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/ops_oauth_clients.sql
SELECT '@./DL_BORDERCONTROL/tables/parameters.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/parameters.sql
SELECT '@./DL_BORDERCONTROL/sequences/parameters_seq.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/sequences/parameters_seq.sql
SELECT '@./DL_BORDERCONTROL/synonyms/pkg_dl_plugin_ajax.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/pkg_dl_plugin_ajax.sql
SELECT '@./DL_BORDERCONTROL/procedures/prc_ut_add_fingerprints_json.prc' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/procedures/prc_ut_add_fingerprints_json.prc
SELECT '@./DL_BORDERCONTROL/tables/sys_iot_over_311847.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/sys_iot_over_311847.sql
SELECT '@./DL_BORDERCONTROL/types/sys_plsql_b912293f_dummy_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/sys_plsql_b912293f_dummy_1.sql
SELECT '@./DL_BORDERCONTROL/types/sys_plsql_b912293f_303_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/sys_plsql_b912293f_303_1.sql
SELECT '@./DL_BORDERCONTROL/types/sys_plsql_cca61a56_dummy_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/sys_plsql_cca61a56_dummy_1.sql
SELECT '@./DL_BORDERCONTROL/types/sys_plsql_cca61a56_151_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/sys_plsql_cca61a56_151_1.sql
SELECT '@./DL_BORDERCONTROL/types/sys_plsql_cca61a56_181_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/sys_plsql_cca61a56_181_1.sql
SELECT '@./DL_BORDERCONTROL/types/sys_plsql_cca61a56_189_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/sys_plsql_cca61a56_189_1.sql
SELECT '@./DL_BORDERCONTROL/types/sys_plsql_cca61a56_290_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/sys_plsql_cca61a56_290_1.sql
SELECT '@./DL_BORDERCONTROL/types/sys_plsql_cca61a56_298_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/sys_plsql_cca61a56_298_1.sql
SELECT '@./DL_BORDERCONTROL/types/sys_plsql_cca61a56_313_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/sys_plsql_cca61a56_313_1.sql
SELECT '@./DL_BORDERCONTROL/types/sys_plsql_cca61a56_77_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/sys_plsql_cca61a56_77_1.sql
SELECT '@./DL_BORDERCONTROL/types/sys_plsql_154136a0_dummy_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/sys_plsql_154136a0_dummy_1.sql
SELECT '@./DL_BORDERCONTROL/types/sys_plsql_154136a0_9_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/sys_plsql_154136a0_9_1.sql
SELECT '@./DL_BORDERCONTROL/types/sys_plsql_3e5ed0f3_dummy_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/sys_plsql_3e5ed0f3_dummy_1.sql
SELECT '@./DL_BORDERCONTROL/types/sys_plsql_3e5ed0f3_42_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/sys_plsql_3e5ed0f3_42_1.sql
SELECT '@./DL_BORDERCONTROL/types/sys_plsql_3e5ed0f3_55_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/sys_plsql_3e5ed0f3_55_1.sql
SELECT '@./DL_BORDERCONTROL/types/sys_plsql_3e5ed0f3_9_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/sys_plsql_3e5ed0f3_9_1.sql
SELECT '@./DL_BORDERCONTROL/tables/thaipassport.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/thaipassport.sql
SELECT '@./DL_BORDERCONTROL/types/t_hook_payload.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/t_hook_payload.sql
SELECT '@./DL_BORDERCONTROL/tables/tmp_blacklist_search.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/tmp_blacklist_search.sql
SELECT '@./DL_BORDERCONTROL/tables/tmp_collective_passport_data.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/tmp_collective_passport_data.sql
SELECT '@./DL_BORDERCONTROL/tables/user_manage_audit.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/user_manage_audit.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_agccontact.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_agccontact.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_chng_changevisa.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_chng_changevisa.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_chng_changevisalist.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_chng_changevisalist.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_chng_person.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_chng_person.sql
SELECT '@./DL_BORDERCONTROL/views/v_collective_passport_pictures.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/v_collective_passport_pictures.vw
SELECT '@./DL_BORDERCONTROL/synonyms/v_country.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_country.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_crew.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_crew.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_crs_certofresidence.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_crs_certofresidence.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_crs_person.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_crs_person.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_crs_rescerttype.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_crs_rescerttype.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_delprocessot.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_delprocessot.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_department.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_department.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_ednq_tm13.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_ednq_tm13.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_ext_extensionlist.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_ext_extensionlist.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_guartdept.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_guartdept.sql
SELECT '@./DL_BORDERCONTROL/sequences/visas\\\$seq01.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/sequences/visas\\\$seq01.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_operationref.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_operationref.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_pibics_conn_prod.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_pibics_conn_prod.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_policorganize.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_policorganize.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_processot.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_processot.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_province.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_province.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_reps_tm8.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_reps_tm8.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_rqs_person.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_rqs_person.sql
SELECT '@./DL_BORDERCONTROL/views/v_session_travel_abis_results.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/v_session_travel_abis_results.vw
SELECT '@./DL_BORDERCONTROL/synonyms/v_thaipassport.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_thaipassport.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_tminout.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_tminout.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_tminout_ma.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_tminout_ma.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_tminout_ma_1hr_prod.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_tminout_ma_1hr_prod.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_tminout_1hr_prod.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_tminout_1hr_prod.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_tmmain.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_tmmain.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_tmmain_in_1hr_prod.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_tmmain_in_1hr_prod.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_tmmain_out_1hr_prod.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_tmmain_out_1hr_prod.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_tm2.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_tm2.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_tm2_prod.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_tm2_prod.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_visabynation.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_visabynation.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_watchlistnm_prod.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_watchlistnm_prod.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_watchlist_prod.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_watchlist_prod.sql
SELECT '@./DL_BORDERCONTROL/synonyms/v_wlindicatecard_prod.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/v_wlindicatecard_prod.sql
SELECT '@./DL_BORDERCONTROL/tables/x_duplicate_passport.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/x_duplicate_passport.sql
SELECT '@./DL_BORDERCONTROL/tables/x_extendstay.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/x_extendstay.sql
SELECT '@./DL_BORDERCONTROL/tables/xlib_components.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/xlib_components.sql
SELECT '@./DL_BORDERCONTROL/tables/xlib_logs.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/xlib_logs.sql
SELECT '@./DL_BORDERCONTROL/sequences/xlib_seq.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/sequences/xlib_seq.sql
SELECT '@./DL_BORDERCONTROL/types/xlib_vc2_array_t.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/xlib_vc2_array_t.sql
SELECT '@./DL_BORDERCONTROL/procedures/xlog.prc' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/procedures/xlog.prc
SELECT '@./DL_BORDERCONTROL/tables/x_residentinfo.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/x_residentinfo.sql
SELECT '@./DL_BORDERCONTROL/tables/x_visarun_rules.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/x_visarun_rules.sql
SELECT '@./DL_BORDERCONTROL/tables/x_watchlist_passport.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/x_watchlist_passport.sql
SELECT '@./DL_BORDERCONTROL/tables/xxfmenn_blobs.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/xxfmenn_blobs.sql
SELECT '@./DL_BORDERCONTROL/tables/xxtmp_ext_extensionlist.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/xxtmp_ext_extensionlist.sql
SELECT '@./DL_BORDERCONTROL/tables/xxtmp_invalid_objects.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/xxtmp_invalid_objects.sql
SELECT '@./DL_BORDERCONTROL/tables/xxtmp_log_bl_hits.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/xxtmp_log_bl_hits.sql
SELECT '@./DL_BORDERCONTROL/tables/xxtmp_mps_blob.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/xxtmp_mps_blob.sql
SELECT '@./DL_BORDERCONTROL/tables/xxtmp_mps_session_logs.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/xxtmp_mps_session_logs.sql
SELECT '@./DL_BORDERCONTROL/tables/xxtmp_reps_tm8.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/xxtmp_reps_tm8.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/packages/pkg_apex_util.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/packages/pkg_apex_util.pks
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/dim_agents.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/dim_agents.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/dim_ages.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/dim_ages.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/dim_borderposts.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/dim_borderposts.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/dim_document_types.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/dim_document_types.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/dim_genders.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/dim_genders.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/dim_movement_types.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/dim_movement_types.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/dim_nationalities.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/dim_nationalities.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/dim_nationality_time_movement.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/dim_nationality_time_movement.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/dim_officers.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/dim_officers.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/dim_time_movement.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/dim_time_movement.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/dim_times.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/dim_times.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/dim_transport_modes.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/dim_transport_modes.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/dim_visa_types.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/dim_visa_types.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/event_types.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/event_types.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/fact_border_movements.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/fact_border_movements.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/facts_for_screenshots.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/facts_for_screenshots.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/import_runs.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/import_runs.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/intervals.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/intervals.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/views/pivot_analysis.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/views/pivot_analysis.vw
SELECT '@./DL_BORDERCONTROL_DATAMART/sequences/seq_import_run_events.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/sequences/seq_import_run_events.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/sequences/seq_run.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/sequences/seq_run.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/sql_reporting_log.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/sql_reporting_log.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/types/sys_plsql_2b453a71_dummy_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/types/sys_plsql_2b453a71_dummy_1.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/types/sys_plsql_2b453a71_9_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/types/sys_plsql_2b453a71_9_1.sql
SELECT '@./DL_COMMON/packages/pkg_apex_util.pks' AS ">" FROM DUAL;
@./DL_COMMON/packages/pkg_apex_util.pks
SELECT '@./DL_COMMON/packages/pkg_json_export.pks' AS ">" FROM DUAL;
@./DL_COMMON/packages/pkg_json_export.pks
SELECT '@./DL_COMMON/packages/pkg_session.pks' AS ">" FROM DUAL;
@./DL_COMMON/packages/pkg_session.pks
SELECT '@./DL_COMMON/packages/pljson_ut.pks
CREATE PUBLIC SYNONYM PLJSON_UT FOR DL_COMMON.PLJSON_UT;' AS ">" FROM DUAL;
@./DL_COMMON/packages/pljson_ut.pks
CREATE PUBLIC SYNONYM PLJSON_UT FOR DL_COMMON.PLJSON_UT;
SELECT '@./DL_COMMON/tables/action_codes\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/action_codes\\\$his.sql
SELECT '@./DL_COMMON/tables/action_codes\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/action_codes\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/action_codes\\\$tag\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/action_codes\\\$tag\\\$his.sql
SELECT '@./DL_COMMON/tables/airports\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/airports\\\$his.sql
SELECT '@./DL_COMMON/tables/airports\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/airports\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/sequences/airports\\\$seq00.sql' AS ">" FROM DUAL;
@./DL_COMMON/sequences/airports\\\$seq00.sql
SELECT '@./DL_COMMON/tables/apex_menu\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/apex_menu\\\$his.sql
SELECT '@./DL_COMMON/tables/apex_menu\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/apex_menu\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/arrested_statuses\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/arrested_statuses\\\$his.sql
SELECT '@./DL_COMMON/tables/arrested_statuses\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/arrested_statuses\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/arrested_statuses\\\$tag\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/arrested_statuses\\\$tag\\\$his.sql
SELECT '@./DL_COMMON/tables/arrested_types\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/arrested_types\\\$his.sql
SELECT '@./DL_COMMON/tables/arrested_types\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/arrested_types\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/arrested_types\\\$tag\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/arrested_types\\\$tag\\\$his.sql
SELECT '@./DL_COMMON/tables/bc_doc_class\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/bc_doc_class\\\$his.sql
SELECT '@./DL_COMMON/tables/bc_doc_class\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/bc_doc_class\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/bc_person_types\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/bc_person_types\\\$his.sql
SELECT '@./DL_COMMON/tables/bc_person_types\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/bc_person_types\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/b_list_reasons.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/b_list_reasons.sql
SELECT '@./DL_COMMON/tables/b_list_reasons\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/b_list_reasons\\\$his.sql
SELECT '@./DL_COMMON/tables/b_list_reasons\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/b_list_reasons\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/triggers/b_list_reasons\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/b_list_reasons\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/bools.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/bools.sql
SELECT '@./DL_COMMON/tables/bools\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/bools\\\$his.sql
SELECT '@./DL_COMMON/tables/bools\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/bools\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/triggers/bools\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/bools\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/border_types.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/border_types.sql
SELECT '@./DL_COMMON/tables/border_types\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/border_types\\\$his.sql
SELECT '@./DL_COMMON/tables/border_types\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/border_types\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/triggers/border_types\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/border_types\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/bs_relationships\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/bs_relationships\\\$his.sql
SELECT '@./DL_COMMON/tables/bs_relationships\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/bs_relationships\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/bs_relationships\\\$tag\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/bs_relationships\\\$tag\\\$his.sql
SELECT '@./DL_COMMON/tables/card_types\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/card_types\\\$his.sql
SELECT '@./DL_COMMON/tables/card_types\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/card_types\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/card_types\\\$tag\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/card_types\\\$tag\\\$his.sql
SELECT '@./DL_COMMON/tables/carriers\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/carriers\\\$his.sql
SELECT '@./DL_COMMON/tables/carriers\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/carriers\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/sequences/carriers\\\$seq00.sql' AS ">" FROM DUAL;
@./DL_COMMON/sequences/carriers\\\$seq00.sql
SELECT '@./DL_COMMON/tables/case_types.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/case_types.sql
SELECT '@./DL_COMMON/tables/case_types\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/case_types\\\$his.sql
SELECT '@./DL_COMMON/tables/case_types\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/case_types\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/case_types\\\$tag\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/case_types\\\$tag\\\$his.sql
SELECT '@./DL_COMMON/tables/continents.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/continents.sql
SELECT '@./DL_COMMON/tables/continents\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/continents\\\$his.sql
SELECT '@./DL_COMMON/tables/continents\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/continents\\\$i18n.sql
SELECT '@./DL_COMMON/tables/continents\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/continents\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/countries\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/countries\\\$his.sql
SELECT '@./DL_COMMON/tables/countries_icao_doc_codes.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/countries_icao_doc_codes.sql
SELECT '@./DL_COMMON/tables/countries\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/countries\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/device_types.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/device_types.sql
SELECT '@./DL_COMMON/tables/device_types\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/device_types\\\$his.sql
SELECT '@./DL_COMMON/tables/device_types\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/device_types\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/triggers/device_types\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/device_types\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/entry_exits.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/entry_exits.sql
SELECT '@./DL_COMMON/tables/entry_exits\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/entry_exits\\\$his.sql
SELECT '@./DL_COMMON/tables/entry_exits\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/entry_exits\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/triggers/entry_exits\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/entry_exits\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/finger_miss_reasons.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/finger_miss_reasons.sql
SELECT '@./DL_COMMON/tables/finger_miss_reasons\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/finger_miss_reasons\\\$his.sql
SELECT '@./DL_COMMON/tables/finger_miss_reasons\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/finger_miss_reasons\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/triggers/finger_miss_reasons\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/finger_miss_reasons\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/finger_status.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/finger_status.sql
SELECT '@./DL_COMMON/tables/finger_status\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/finger_status\\\$his.sql
SELECT '@./DL_COMMON/tables/finger_status\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/finger_status\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/triggers/finger_status\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/finger_status\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/human_fingers.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/human_fingers.sql
SELECT '@./DL_COMMON/tables/human_fingers\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/human_fingers\\\$his.sql
SELECT '@./DL_COMMON/tables/human_fingers\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/human_fingers\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/triggers/human_fingers\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/human_fingers\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/human_sexes.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/human_sexes.sql
SELECT '@./DL_COMMON/tables/human_sexes\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/human_sexes\\\$his.sql
SELECT '@./DL_COMMON/tables/human_sexes\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/human_sexes\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/triggers/human_sexes\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/human_sexes\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/icao_dc_list_itms\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/icao_dc_list_itms\\\$his.sql
SELECT '@./DL_COMMON/tables/icao_dc_lists.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/icao_dc_lists.sql
SELECT '@./DL_COMMON/tables/icao_dc_lists\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/icao_dc_lists\\\$his.sql
SELECT '@./DL_COMMON/tables/icao_dc_lists\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/icao_dc_lists\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/triggers/icao_dc_lists\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/icao_dc_lists\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/icao_doc_codes\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/icao_doc_codes\\\$his.sql
SELECT '@./DL_COMMON/tables/icao_doc_codes\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/icao_doc_codes\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/icao_doc_code\\\$visa_type\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/icao_doc_code\\\$visa_type\\\$his.sql
SELECT '@./DL_COMMON/tables/icao_doc_code\\\$visa_type\\\$tag\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/icao_doc_code\\\$visa_type\\\$tag\\\$his.sql
SELECT '@./DL_COMMON/tables/incident_types.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/incident_types.sql
SELECT '@./DL_COMMON/tables/incident_types\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/incident_types\\\$his.sql
SELECT '@./DL_COMMON/tables/incident_types\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/incident_types\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/triggers/incident_types\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/incident_types\\\$tiud0.trg
SELECT '@./DL_COMMON/procedures/inst_db_obj4logger.prc' AS ">" FROM DUAL;
@./DL_COMMON/procedures/inst_db_obj4logger.prc
SELECT '@./DL_COMMON/tables/languages\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/languages\\\$his.sql
SELECT '@./DL_COMMON/tables/languages\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/languages\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/locales\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/locales\\\$his.sql
SELECT '@./DL_COMMON/tables/messages\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/messages\\\$his.sql
SELECT '@./DL_COMMON/tables/messages\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/messages\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/movement_reasons.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/movement_reasons.sql
SELECT '@./DL_COMMON/tables/movement_reasons\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/movement_reasons\\\$his.sql
SELECT '@./DL_COMMON/tables/movement_reasons\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/movement_reasons\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/movement_reasons\\\$tag\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/movement_reasons\\\$tag\\\$his.sql
SELECT '@./DL_COMMON/triggers/movement_reasons\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/movement_reasons\\\$tiud0.trg
SELECT '@./DL_COMMON/types/ot_db_owner.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/ot_db_owner.sql
SELECT '@./DL_COMMON/types/ot_db_tblspc.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/ot_db_tblspc.sql
SELECT '@./DL_COMMON/types/ot_file.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/ot_file.sql
SELECT '@./DL_COMMON/types/ot_search_definition.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/ot_search_definition.sql
SELECT '@./DL_COMMON/types/ot_10vcc_10cl.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/ot_10vcc_10cl.sql
SELECT '@./DL_COMMON/tables/owners.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/owners.sql
SELECT '@./DL_COMMON/tables/owners\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/owners\\\$his.sql
SELECT '@./DL_COMMON/tables/owners\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/owners\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/owners\\\$tag.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/owners\\\$tag.sql
SELECT '@./DL_COMMON/tables/owners\\\$tag\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/owners\\\$tag\\\$his.sql
SELECT '@./DL_COMMON/triggers/owners\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/owners\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/permit_types\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/permit_types\\\$his.sql
SELECT '@./DL_COMMON/tables/permit_types\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/permit_types\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/package_bodies/pkg_session.pkb' AS ">" FROM DUAL;
@./DL_COMMON/package_bodies/pkg_session.pkb
SELECT '@./DL_COMMON/types/pljson_element.sql
CREATE PUBLIC SYNONYM PLJSON_ELEMENT FOR DL_COMMON.PLJSON_ELEMENT;' AS ">" FROM DUAL;
@./DL_COMMON/types/pljson_element.sql
CREATE PUBLIC SYNONYM PLJSON_ELEMENT FOR DL_COMMON.PLJSON_ELEMENT;
SELECT '@./DL_COMMON/types/pljson_narray.sql
CREATE PUBLIC SYNONYM PLJSON_NARRAY FOR DL_COMMON.PLJSON_NARRAY;' AS ">" FROM DUAL;
@./DL_COMMON/types/pljson_narray.sql
CREATE PUBLIC SYNONYM PLJSON_NARRAY FOR DL_COMMON.PLJSON_NARRAY;
SELECT '@./DL_COMMON/tables/pljson_testsuite.sql
CREATE PUBLIC SYNONYM PLJSON_TESTSUITE FOR DL_COMMON.PLJSON_TESTSUITE;' AS ">" FROM DUAL;
@./DL_COMMON/tables/pljson_testsuite.sql
CREATE PUBLIC SYNONYM PLJSON_TESTSUITE FOR DL_COMMON.PLJSON_TESTSUITE;
SELECT '@./DL_COMMON/package_bodies/pljson_ut.pkb
CREATE PUBLIC SYNONYM PLJSON_UT FOR DL_COMMON.PLJSON_UT;' AS ">" FROM DUAL;
@./DL_COMMON/package_bodies/pljson_ut.pkb
CREATE PUBLIC SYNONYM PLJSON_UT FOR DL_COMMON.PLJSON_UT;
SELECT '@./DL_COMMON/types/pljson_value.sql
CREATE PUBLIC SYNONYM PLJSON_VALUE FOR DL_COMMON.PLJSON_VALUE;
CREATE PUBLIC SYNONYM JSON_VALUE FOR DL_COMMON.PLJSON_VALUE;' AS ">" FROM DUAL;
@./DL_COMMON/types/pljson_value.sql
CREATE PUBLIC SYNONYM PLJSON_VALUE FOR DL_COMMON.PLJSON_VALUE;
CREATE PUBLIC SYNONYM JSON_VALUE FOR DL_COMMON.PLJSON_VALUE;
SELECT '@./DL_COMMON/types/pljson_value_array.sql
CREATE PUBLIC SYNONYM PLJSON_VALUE_ARRAY FOR DL_COMMON.PLJSON_VALUE_ARRAY;
CREATE PUBLIC SYNONYM JSON_VALUE_ARRAY FOR DL_COMMON.PLJSON_VALUE_ARRAY;' AS ">" FROM DUAL;
@./DL_COMMON/types/pljson_value_array.sql
CREATE PUBLIC SYNONYM PLJSON_VALUE_ARRAY FOR DL_COMMON.PLJSON_VALUE_ARRAY;
CREATE PUBLIC SYNONYM JSON_VALUE_ARRAY FOR DL_COMMON.PLJSON_VALUE_ARRAY;
SELECT '@./DL_COMMON/types/pljson_varray.sql
CREATE PUBLIC SYNONYM PLJSON_VARRAY FOR DL_COMMON.PLJSON_VARRAY;' AS ">" FROM DUAL;
@./DL_COMMON/types/pljson_varray.sql
CREATE PUBLIC SYNONYM PLJSON_VARRAY FOR DL_COMMON.PLJSON_VARRAY;
SELECT '@./DL_COMMON/types/pljson_vtab.sql
CREATE PUBLIC SYNONYM PLJSON_VTAB FOR DL_COMMON.PLJSON_VTAB;' AS ">" FROM DUAL;
@./DL_COMMON/types/pljson_vtab.sql
CREATE PUBLIC SYNONYM PLJSON_VTAB FOR DL_COMMON.PLJSON_VTAB;
SELECT '@./DL_COMMON/tables/port_movements.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/port_movements.sql
SELECT '@./DL_COMMON/tables/port_movements\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/port_movements\\\$his.sql
SELECT '@./DL_COMMON/tables/port_movements\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/port_movements\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/port_movements\\\$tag.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/port_movements\\\$tag.sql
SELECT '@./DL_COMMON/tables/port_movements\\\$tag\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/port_movements\\\$tag\\\$his.sql
SELECT '@./DL_COMMON/tables/ports\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/ports\\\$his.sql
SELECT '@./DL_COMMON/tables/ports\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/ports\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/sequences/ports\\\$seq00.sql' AS ">" FROM DUAL;
@./DL_COMMON/sequences/ports\\\$seq00.sql
SELECT '@./DL_COMMON/tables/professions.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/professions.sql
SELECT '@./DL_COMMON/tables/professions\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/professions\\\$his.sql
SELECT '@./DL_COMMON/tables/professions\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/professions\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/reason_codes.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/reason_codes.sql
SELECT '@./DL_COMMON/tables/reason_codes\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/reason_codes\\\$his.sql
SELECT '@./DL_COMMON/tables/reason_codes\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/reason_codes\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/reason_codes\\\$tag.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/reason_codes\\\$tag.sql
SELECT '@./DL_COMMON/tables/reason_codes\\\$tag\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/reason_codes\\\$tag\\\$his.sql
SELECT '@./DL_COMMON/tables/relations.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/relations.sql
SELECT '@./DL_COMMON/tables/relations\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/relations\\\$his.sql
SELECT '@./DL_COMMON/tables/relations\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/relations\\\$i18n.sql
SELECT '@./DL_COMMON/tables/relations\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/relations\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/triggers/relations\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/relations\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/salutations.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/salutations.sql
SELECT '@./DL_COMMON/tables/salutations\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/salutations\\\$his.sql
SELECT '@./DL_COMMON/tables/salutations\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/salutations\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/secret_levels.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/secret_levels.sql
SELECT '@./DL_COMMON/tables/secret_levels\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/secret_levels\\\$his.sql
SELECT '@./DL_COMMON/tables/secret_levels\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/secret_levels\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/secret_levels\\\$tag.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/secret_levels\\\$tag.sql
SELECT '@./DL_COMMON/tables/secret_levels\\\$tag\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/secret_levels\\\$tag\\\$his.sql
SELECT '@./DL_COMMON/tables/statuses.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/statuses.sql
SELECT '@./DL_COMMON/tables/statuses\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/statuses\\\$his.sql
SELECT '@./DL_COMMON/tables/statuses\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/statuses\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/statuses\\\$tag.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/statuses\\\$tag.sql
SELECT '@./DL_COMMON/tables/statuses\\\$tag\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/statuses\\\$tag\\\$his.sql
SELECT '@./DL_COMMON/triggers/statuses\\\$tag\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/statuses\\\$tag\\\$tiud0.trg
SELECT '@./DL_COMMON/triggers/statuses\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/statuses\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/sub_nationalities.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/sub_nationalities.sql
SELECT '@./DL_COMMON/tables/sub_nationalities\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/sub_nationalities\\\$his.sql
SELECT '@./DL_COMMON/tables/sub_nationalities\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/sub_nationalities\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/triggers/sub_nationalities\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/sub_nationalities\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/trans_grp_states.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/trans_grp_states.sql
SELECT '@./DL_COMMON/tables/trans_grp_states\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/trans_grp_states\\\$his.sql
SELECT '@./DL_COMMON/tables/trans_grp_states\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/trans_grp_states\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/triggers/trans_grp_states\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/trans_grp_states\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/trans_modes.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/trans_modes.sql
SELECT '@./DL_COMMON/tables/trans_modes\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/trans_modes\\\$his.sql
SELECT '@./DL_COMMON/tables/trans_modes\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/trans_modes\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/tables/trans_vehicles.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/trans_vehicles.sql
SELECT '@./DL_COMMON/tables/trans_vehicles\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/trans_vehicles\\\$his.sql
SELECT '@./DL_COMMON/tables/trans_vehicles\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/trans_vehicles\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/types/tt_bl.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_bl.sql
SELECT '@./DL_COMMON/types/tt_cl.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_cl.sql
SELECT '@./DL_COMMON/types/tt_db_owner.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_db_owner.sql
SELECT '@./DL_COMMON/types/tt_db_tblspc.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_db_tblspc.sql
SELECT '@./DL_COMMON/types/tt_file.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_file.sql
SELECT '@./DL_COMMON/types/tt_n.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_n.sql
SELECT '@./DL_COMMON/types/tt_n5.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_n5.sql
SELECT '@./DL_COMMON/types/tt_search_definition.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_search_definition.sql
SELECT '@./DL_COMMON/types/tt_vc.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_vc.sql
SELECT '@./DL_COMMON/types/tt_vcc.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_vcc.sql
SELECT '@./DL_COMMON/types/tt_vc128.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_vc128.sql
SELECT '@./DL_COMMON/types/tt_vc30.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_vc30.sql
SELECT '@./DL_COMMON/types/tt_10vcc_10cl.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_10vcc_10cl.sql
SELECT '@./DL_COMMON/tables/user_messages.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/user_messages.sql
SELECT '@./DL_COMMON/functions/value4lookups\\\$is_active.fnc' AS ">" FROM DUAL;
@./DL_COMMON/functions/value4lookups\\\$is_active.fnc
SELECT '@./DL_COMMON/views/v_apex_sessions.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/v_apex_sessions.vw
SELECT '@./DL_COMMON/tables/visa_types.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/visa_types.sql
SELECT '@./DL_COMMON/tables/visa_types\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/visa_types\\\$his.sql
SELECT '@./DL_COMMON/tables/visa_types\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/visa_types\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/types/vt_bl.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_bl.sql
SELECT '@./DL_COMMON/types/vt_cl.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_cl.sql
SELECT '@./DL_COMMON/types/vt_db_owner.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_db_owner.sql
SELECT '@./DL_COMMON/types/vt_db_tblspc.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_db_tblspc.sql
SELECT '@./DL_COMMON/types/vt_file.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_file.sql
SELECT '@./DL_COMMON/types/vt_n.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_n.sql
SELECT '@./DL_COMMON/types/vt_n5.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_n5.sql
SELECT '@./DL_COMMON/types/vt_search_definition.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_search_definition.sql
SELECT '@./DL_COMMON/types/vt_vc.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_vc.sql
SELECT '@./DL_COMMON/types/vt_vcc.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_vcc.sql
SELECT '@./DL_COMMON/types/vt_vc128.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_vc128.sql
SELECT '@./DL_COMMON/types/vt_vc30.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_vc30.sql
SELECT '@./DL_COMMON/types/vt_10vcc_10cl.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_10vcc_10cl.sql
SELECT '@./DL_COMMON/tables/yes_nos.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/yes_nos.sql
SELECT '@./DL_COMMON/tables/yes_nos\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/yes_nos\\\$his.sql
SELECT '@./DL_COMMON/tables/yes_nos\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/yes_nos\\\$i18n\\\$his.sql
SELECT '@./DL_COMMON/triggers/yes_nos\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/yes_nos\\\$tiud0.trg
SELECT '@./DL_DBA/packages/pkg_apex_util.pks' AS ">" FROM DUAL;
@./DL_DBA/packages/pkg_apex_util.pks
SELECT '@./DL_DBA/tables/module_curr_installs.sql' AS ">" FROM DUAL;
@./DL_DBA/tables/module_curr_installs.sql
SELECT '@./DL_DBA/triggers/module_curr_installs\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_DBA/triggers/module_curr_installs\\\$tiud0.trg
SELECT '@./DL_DBA/tables/module_curr_inst_args.sql' AS ">" FROM DUAL;
@./DL_DBA/tables/module_curr_inst_args.sql
SELECT '@./DL_DBA/triggers/module_curr_inst_args\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_DBA/triggers/module_curr_inst_args\\\$tiud0.trg
SELECT '@./DL_DBA/tables/module_installs.sql' AS ">" FROM DUAL;
@./DL_DBA/tables/module_installs.sql
SELECT '@./DL_DBA/triggers/module_installs\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_DBA/triggers/module_installs\\\$tiud0.trg
SELECT '@./DL_DBA/tables/templates.sql' AS ">" FROM DUAL;
@./DL_DBA/tables/templates.sql
SELECT '@./DL_DBA/tables/templates\\\$his.sql' AS ">" FROM DUAL;
@./DL_DBA/tables/templates\\\$his.sql
SELECT '@./DL_DBA/tables/templates\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_DBA/tables/templates\\\$i18n\\\$his.sql
SELECT '@./DL_DBA/tables/templates\\\$tag.sql' AS ">" FROM DUAL;
@./DL_DBA/tables/templates\\\$tag.sql
SELECT '@./DL_DBA/tables/templates\\\$tag\\\$his.sql' AS ">" FROM DUAL;
@./DL_DBA/tables/templates\\\$tag\\\$his.sql
SELECT '@./DL_INTERFACE/packages/pkg_can_not_add_data_at_pibics.pks' AS ">" FROM DUAL;
@./DL_INTERFACE/packages/pkg_can_not_add_data_at_pibics.pks
SELECT '@./DL_INTERFACE/packages/pkg_exchange_objects.pks' AS ">" FROM DUAL;
@./DL_INTERFACE/packages/pkg_exchange_objects.pks
SELECT '@./DL_INTERFACE/packages/pkg_listener_manual.pks' AS ">" FROM DUAL;
@./DL_INTERFACE/packages/pkg_listener_manual.pks
SELECT '@./DL_INTERFACE/packages/pkg_webservices_blacklist.pks' AS ">" FROM DUAL;
@./DL_INTERFACE/packages/pkg_webservices_blacklist.pks
SELECT '@./DL_INTERFACE/tables/log_blacklist_hits.sql' AS ">" FROM DUAL;
@./DL_INTERFACE/tables/log_blacklist_hits.sql
SELECT '@./DL_INTERFACE/tables/log_blacklist_hits03.sql' AS ">" FROM DUAL;
@./DL_INTERFACE/tables/log_blacklist_hits03.sql
SELECT '@./DL_INTERFACE/tables/log_blacklist_hits04.sql' AS ">" FROM DUAL;
@./DL_INTERFACE/tables/log_blacklist_hits04.sql
SELECT '@./DL_INTERFACE/tables/log_blacklist_hits05.sql' AS ">" FROM DUAL;
@./DL_INTERFACE/tables/log_blacklist_hits05.sql
SELECT '@./DL_INTERFACE/tables/log_sync_webservices.sql' AS ">" FROM DUAL;
@./DL_INTERFACE/tables/log_sync_webservices.sql
SELECT '@./DL_INTERFACE/tables/parameters.sql' AS ">" FROM DUAL;
@./DL_INTERFACE/tables/parameters.sql
SELECT '@./DL_INTERFACE/tables/parameters\\\$his.sql' AS ">" FROM DUAL;
@./DL_INTERFACE/tables/parameters\\\$his.sql
SELECT '@./DL_INTERFACE/tables/pibics_response.sql' AS ">" FROM DUAL;
@./DL_INTERFACE/tables/pibics_response.sql
SELECT '@./DL_INTERFACE/package_bodies/pkg_can_not_add_data_at_pibics.pkb' AS ">" FROM DUAL;
@./DL_INTERFACE/package_bodies/pkg_can_not_add_data_at_pibics.pkb
SELECT '@./DL_STAGING4PIBICS/packages/pkg_maintenance.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/packages/pkg_maintenance.pks
SELECT '@./DL_STAGING4PIBICS/packages/pkg_sync_residents.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/packages/pkg_sync_residents.pks
SELECT '@./DL_STAGING4PIBICS/tables/ampur.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/ampur.sql
SELECT '@./DL_STAGING4PIBICS/tables/cnt_pibics.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/cnt_pibics.sql
SELECT '@./DL_STAGING4PIBICS/tables/cnt_staging.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/cnt_staging.sql
SELECT '@./DL_STAGING4PIBICS/views/cnt_summary.vw' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/views/cnt_summary.vw
SELECT '@./DL_STAGING4PIBICS/tables/cnt_tmmain.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/cnt_tmmain.sql
SELECT '@./DL_STAGING4PIBICS/tables/continent.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/continent.sql
SELECT '@./DL_STAGING4PIBICS/tables/conveyance.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/conveyance.sql
SELECT '@./DL_STAGING4PIBICS/tables/country.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/country.sql
SELECT '@./DL_STAGING4PIBICS/tables/crew.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/crew.sql
SELECT '@./DL_STAGING4PIBICS/tables/department.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/department.sql
SELECT '@./DL_STAGING4PIBICS/tables/flightnumbers.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/flightnumbers.sql
SELECT '@./DL_STAGING4PIBICS/tables/fs_fees.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/fs_fees.sql
SELECT '@./DL_STAGING4PIBICS/tables/fs_feesdetail.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/fs_feesdetail.sql
SELECT '@./DL_STAGING4PIBICS/tables/fs_fines.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/fs_fines.sql
SELECT '@./DL_STAGING4PIBICS/tables/fs_finesdetail.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/fs_finesdetail.sql
SELECT '@./DL_STAGING4PIBICS/tables/fs_slipsystem.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/fs_slipsystem.sql
SELECT '@./DL_STAGING4PIBICS/sequences/iseq\\\$\\\$_312985.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/sequences/iseq\\\$\\\$_312985.sql
SELECT '@./DL_STAGING4PIBICS/tables/log_run_steps.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/log_run_steps.sql
SELECT '@./DL_STAGING4PIBICS/tables/lostpassport.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/lostpassport.sql
SELECT '@./DL_STAGING4PIBICS/tables/mlog\\\$_lostpassport.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/mlog\\\$_lostpassport.sql
SELECT '@./DL_STAGING4PIBICS/tables/mlog\\\$_thaipassport.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/mlog\\\$_thaipassport.sql
SELECT '@./DL_STAGING4PIBICS/tables/mlog\\\$_tminout.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/mlog\\\$_tminout.sql
SELECT '@./DL_STAGING4PIBICS/tables/mlog\\\$_watchlist.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/mlog\\\$_watchlist.sql
SELECT '@./DL_STAGING4PIBICS/procedures/modify_pibics_link.prc' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/procedures/modify_pibics_link.prc
SELECT '@./DL_STAGING4PIBICS/synonyms/mv_log_lostpassport.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/synonyms/mv_log_lostpassport.sql
SELECT '@./DL_STAGING4PIBICS/synonyms/mv_log_thaipassport.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/synonyms/mv_log_thaipassport.sql
SELECT '@./DL_STAGING4PIBICS/synonyms/mv_log_tminout.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/synonyms/mv_log_tminout.sql
SELECT '@./DL_STAGING4PIBICS/synonyms/mv_log_watchlist.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/synonyms/mv_log_watchlist.sql
SELECT '@./DL_STAGING4PIBICS/tables/occupation.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/occupation.sql
SELECT '@./DL_STAGING4PIBICS/tables/ops_pibics_load_processes.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/ops_pibics_load_processes.sql
SELECT '@./DL_STAGING4PIBICS/tables/ops_pibics_table.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/ops_pibics_table.sql
SELECT '@./DL_STAGING4PIBICS/tables/ops_preferences.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/ops_preferences.sql
SELECT '@./DL_STAGING4PIBICS/tables/paymentrate.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/paymentrate.sql
SELECT '@./DL_STAGING4PIBICS/tables/permittype.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/permittype.sql
SELECT '@./DL_STAGING4PIBICS/tables/province.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/province.sql
SELECT '@./DL_STAGING4PIBICS/tables/rankcrw.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/rankcrw.sql
SELECT '@./DL_STAGING4PIBICS/tables/region.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/region.sql
SELECT '@./DL_STAGING4PIBICS/tables/rupd\\\$_lostpassport.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/rupd\\\$_lostpassport.sql
SELECT '@./DL_STAGING4PIBICS/tables/rupd\\\$_thaipassport.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/rupd\\\$_thaipassport.sql
SELECT '@./DL_STAGING4PIBICS/tables/rupd\\\$_tminout.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/rupd\\\$_tminout.sql
SELECT '@./DL_STAGING4PIBICS/tables/rupd\\\$_watchlist.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/rupd\\\$_watchlist.sql
SELECT '@./DL_STAGING4PIBICS/tables/suffix.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/suffix.sql
SELECT '@./DL_STAGING4PIBICS/tables/tambon.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/tambon.sql
SELECT '@./DL_STAGING4PIBICS/tables/thaipassport.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/thaipassport.sql
SELECT '@./DL_STAGING4PIBICS/tables/tminout.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/tminout.sql
SELECT '@./DL_STAGING4PIBICS/tables/tmmain.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/tmmain.sql
SELECT '@./DL_STAGING4PIBICS/tables/traveldoctype.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/traveldoctype.sql
SELECT '@./DL_STAGING4PIBICS/tables/visabynation.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/visabynation.sql
SELECT '@./DL_STAGING4PIBICS/tables/visatype.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/visatype.sql
SELECT '@./DL_STAGING4PIBICS/tables/watchlist.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/watchlist.sql
SELECT '@./DL_STAGING4PIBICS/tables/watchlist2.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/watchlist2.sql
SELECT '@./DL_STAGING4PIBICS/tables/wlindicatecard.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/tables/wlindicatecard.sql
SELECT '@./DL_STAGING4PIBICS_INTF/packages/pkg_from_pibics.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/packages/pkg_from_pibics.pks
SELECT '@./DL_STAGING4PIBICS_INTF/packages/pkg_hacks.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/packages/pkg_hacks.pks
SELECT '@./DL_STAGING4PIBICS_INTF/packages/pkg_maintenance.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/packages/pkg_maintenance.pks
SELECT '@./DL_STAGING4PIBICS_INTF/packages/pkg_transcode.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/packages/pkg_transcode.pks
SELECT '@./DL_STAGING4PIBICS_INTF/tables/cnt_sync.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/cnt_sync.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/cnt_transcode.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/cnt_transcode.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/err\\\$_sync_blacklist_cases.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/err\\\$_sync_blacklist_cases.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/err\\\$_sync_movements.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/err\\\$_sync_movements.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/err\\\$_sync_thaipassport.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/err\\\$_sync_thaipassport.sql
SELECT '@./DL_STAGING4PIBICS_INTF/sequences/iseq\\\$\\\$_313375.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/sequences/iseq\\\$\\\$_313375.sql
SELECT '@./DL_STAGING4PIBICS_INTF/sequences/iseq\\\$\\\$_313381.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/sequences/iseq\\\$\\\$_313381.sql
SELECT '@./DL_STAGING4PIBICS_INTF/sequences/iseq\\\$\\\$_313383.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/sequences/iseq\\\$\\\$_313383.sql
SELECT '@./DL_STAGING4PIBICS_INTF/sequences/iseq\\\$\\\$_313385.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/sequences/iseq\\\$\\\$_313385.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/log_run_steps.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/log_run_steps.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/ops_backend_processes.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/ops_backend_processes.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/ops_preferences.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/ops_preferences.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/ops_staging_processes.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/ops_staging_processes.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/ops_sync_processes.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/ops_sync_processes.sql
SELECT '@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_from_pibics.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_from_pibics.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_maintenance.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_maintenance.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/procedures/prepare_scheduler_as_system.prc' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/procedures/prepare_scheduler_as_system.prc
SELECT '@./DL_STAGING4PIBICS_INTF/tables/sync_blacklist_cases.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/sync_blacklist_cases.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/sync_blacklist_cases_bk.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/sync_blacklist_cases_bk.sql
SELECT '@./DL_STAGING4PIBICS_INTF/views/sync_blacklist_cases_errors.vw' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/views/sync_blacklist_cases_errors.vw
SELECT '@./DL_STAGING4PIBICS_INTF/tables/sync_blacklist_cases2.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/sync_blacklist_cases2.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/sync_thaipassport.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/sync_thaipassport.sql
SELECT '@./DL_STAGING4PIBICS_INTF/views/tmmain_union.vw' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/views/tmmain_union.vw
SELECT '@./DL_STAGING4PIBICS_INTF/tables/trcd_ampur.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/trcd_ampur.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/trcd_borderpost.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/trcd_borderpost.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/trcd_continent.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/trcd_continent.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/trcd_conveyance.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/trcd_conveyance.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/trcd_country.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/trcd_country.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/trcd_flightnumbers.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/trcd_flightnumbers.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/trcd_icao_doc_codes.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/trcd_icao_doc_codes.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/trcd_occupation.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/trcd_occupation.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/trcd_paymentrate.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/trcd_paymentrate.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/trcd_permittype.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/trcd_permittype.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/trcd_province.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/trcd_province.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/trcd_rankcrw.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/trcd_rankcrw.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/trcd_region.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/trcd_region.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/trcd_suffix.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/trcd_suffix.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/trcd_tambon.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/trcd_tambon.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/trcd_traveldoctype.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/trcd_traveldoctype.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/trcd_visabynation.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/trcd_visabynation.sql
SELECT '@./DL_STAGING4PIBICS_INTF/tables/trcd_visatype.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/trcd_visatype.sql
SELECT '@./DL_USER_MANAGEMENT/packages/pkg_authorization.pks' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/packages/pkg_authorization.pks
SELECT '@./DL_USER_MANAGEMENT/packages/pkg_man_users.pks' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/packages/pkg_man_users.pks
SELECT '@./DL_USER_MANAGEMENT/packages/pkg_param_config.pks' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/packages/pkg_param_config.pks
SELECT '@./DL_USER_MANAGEMENT/packages/pkg_set_custom_ctx.pks' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/packages/pkg_set_custom_ctx.pks
SELECT '@./DL_USER_MANAGEMENT/tables/activities.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/activities.sql
SELECT '@./DL_USER_MANAGEMENT/tables/activities\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/activities\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/triggers/activities\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/activities\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/triggers/after_db_logon_set_custom_ctx.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/after_db_logon_set_custom_ctx.trg
SELECT '@./DL_USER_MANAGEMENT/tables/apex_menu_permissions.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/apex_menu_permissions.sql
SELECT '@./DL_USER_MANAGEMENT/tables/computer_org_unit_rel\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/computer_org_unit_rel\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/tables/computer_role_rel\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/computer_role_rel\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/tables/computers.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/computers.sql
SELECT '@./DL_USER_MANAGEMENT/tables/computers\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/computers\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/tables/computers\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/computers\\\$i18n\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/triggers/computers\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/computers\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/tables/grants.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/grants.sql
SELECT '@./DL_USER_MANAGEMENT/tables/grants\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/grants\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/tables/grants\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/grants\\\$i18n\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/triggers/grants\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/grants\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/functions/is_current.fnc' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/functions/is_current.fnc
SELECT '@./DL_USER_MANAGEMENT/tables/lookups.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/lookups.sql
SELECT '@./DL_USER_MANAGEMENT/tables/lookups\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/lookups\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/tables/lookups\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/lookups\\\$i18n\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/triggers/lookups\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/lookups\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/tables/object_grant_rel\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/object_grant_rel\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/tables/object_page_rel\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/object_page_rel\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/tables/objects.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/objects.sql
SELECT '@./DL_USER_MANAGEMENT/tables/objects\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/objects\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/tables/objects\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/objects\\\$i18n\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/triggers/objects\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/objects\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/tables/org_unit_org_unit_rel\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/org_unit_org_unit_rel\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/tables/org_units\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/org_units\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/tables/org_units\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/org_units\\\$i18n\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/types/ot_ldap_role.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/types/ot_ldap_role.sql
SELECT '@./DL_USER_MANAGEMENT/tables/parameter_settings.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/parameter_settings.sql
SELECT '@./DL_USER_MANAGEMENT/tables/parameter_settings\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/parameter_settings\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/tables/parameter_settings\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/parameter_settings\\\$i18n\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/triggers/parameter_settings\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/parameter_settings\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/package_bodies/pkg_param_config.pkb' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/package_bodies/pkg_param_config.pkb
SELECT '@./DL_USER_MANAGEMENT/package_bodies/pkg_set_custom_ctx.pkb' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/package_bodies/pkg_set_custom_ctx.pkb
SELECT '@./DL_USER_MANAGEMENT/tables/role_object_grant_rel\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/role_object_grant_rel\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/tables/role_role_rel\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/role_role_rel\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/tables/roles.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/roles.sql
SELECT '@./DL_USER_MANAGEMENT/tables/roles\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/roles\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/tables/roles\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/roles\\\$i18n\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/triggers/roles\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/roles\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_dummy_1.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_dummy_1.sql
SELECT '@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_114_1.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_114_1.sql
SELECT '@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_153_1.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_153_1.sql
SELECT '@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_161_1.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_161_1.sql
SELECT '@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_242_1.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_242_1.sql
SELECT '@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_250_1.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_250_1.sql
SELECT '@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_282_1.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_282_1.sql
SELECT '@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_290_1.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_290_1.sql
SELECT '@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_336_1.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_336_1.sql
SELECT '@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_344_1.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_344_1.sql
SELECT '@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_404_1.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/types/sys_plsql_516d1ac1_404_1.sql
SELECT '@./DL_USER_MANAGEMENT/tables/tmp_user.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/tmp_user.sql
SELECT '@./DL_USER_MANAGEMENT/types/tt_ldap_role.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/types/tt_ldap_role.sql
SELECT '@./DL_USER_MANAGEMENT/tables/user_org_unit_rel\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/user_org_unit_rel\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/tables/user_role_rel\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/user_role_rel\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/tables/users.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/users.sql
SELECT '@./DL_USER_MANAGEMENT/triggers/users.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/users.trg
SELECT '@./DL_USER_MANAGEMENT/tables/users\\\$his.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/users\\\$his.sql
SELECT '@./DL_USER_MANAGEMENT/tables/users\\\$sgd.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/users\\\$sgd.sql
SELECT '@./DL_USER_MANAGEMENT/triggers/users\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/users\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/functions/value4lookups\\\$is_active.fnc' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/functions/value4lookups\\\$is_active.fnc
SELECT '@./DL_USER_MANAGEMENT/synonyms/v_rank.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/synonyms/v_rank.sql
SELECT '@./DL_USER_MANAGEMENT/types/vt_ldap_role.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/types/vt_ldap_role.sql
SELECT '@./LOGGER/sequences/logger_apx_items_seq.sql' AS ">" FROM DUAL;
@./LOGGER/sequences/logger_apx_items_seq.sql
SELECT '@./LOGGER/tables/logger_logs.sql' AS ">" FROM DUAL;
@./LOGGER/tables/logger_logs.sql
SELECT '@./LOGGER/tables/logger_logs_apex_items.sql' AS ">" FROM DUAL;
@./LOGGER/tables/logger_logs_apex_items.sql
SELECT '@./LOGGER/sequences/logger_logs_seq.sql' AS ">" FROM DUAL;
@./LOGGER/sequences/logger_logs_seq.sql
SELECT '@./LOGGER/views/logger_logs_5_min.vw' AS ">" FROM DUAL;
@./LOGGER/views/logger_logs_5_min.vw
SELECT '@./LOGGER/views/logger_logs_60_min.vw' AS ">" FROM DUAL;
@./LOGGER/views/logger_logs_60_min.vw
SELECT '@./LOGGER/tables/logger_prefs.sql' AS ">" FROM DUAL;
@./LOGGER/tables/logger_prefs.sql
SELECT '@./LOGGER/tables/logger_prefs_by_client_id.sql' AS ">" FROM DUAL;
@./LOGGER/tables/logger_prefs_by_client_id.sql
SELECT '@./PIBICSDM2_RO/synonyms/chng_person.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/chng_person.sql
SELECT '@./PIBICSDM2_RO/synonyms/country.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/country.sql
SELECT '@./PIBICSDM2_RO/synonyms/crew.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/crew.sql
SELECT '@./PIBICSDM2_RO/synonyms/crs_certofresidence.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/crs_certofresidence.sql
SELECT '@./PIBICSDM2_RO/synonyms/crs_person.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/crs_person.sql
SELECT '@./PIBICSDM2_RO/synonyms/delprocessot.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/delprocessot.sql
SELECT '@./PIBICSDM2_RO/synonyms/department.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/department.sql
SELECT '@./PIBICSDM2_RO/synonyms/ednq_tm13.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/ednq_tm13.sql
SELECT '@./PIBICSDM2_RO/synonyms/ext_extensionlist.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/ext_extensionlist.sql
SELECT '@./PIBICSDM2_RO/synonyms/mscs_tm2.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/mscs_tm2.sql
SELECT '@./PIBICSDM2_RO/synonyms/processot.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/processot.sql
SELECT '@./PIBICSDM2_RO/synonyms/province.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/province.sql
SELECT '@./PIBICSDM2_RO/synonyms/reps_tm8.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/reps_tm8.sql
SELECT '@./PIBICSDM2_RO/synonyms/rqs_person.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/rqs_person.sql
SELECT '@./PIBICSDM2_RO/synonyms/thaipassport.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/thaipassport.sql
SELECT '@./PIBICSDM2_RO/synonyms/tminout.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/tminout.sql
SELECT '@./PIBICSDM2_RO/synonyms/tminout_ma.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/tminout_ma.sql
SELECT '@./PIBICSDM2_RO/synonyms/tmmain.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/tmmain.sql
SELECT '@./PIBICSDM2_RO/synonyms/tm2.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/tm2.sql
SELECT '@./PIBICSDM2_RO/synonyms/visabynation.sql' AS ">" FROM DUAL;
@./PIBICSDM2_RO/synonyms/visabynation.sql
SELECT '@./USER_MANAGEMENT/synonyms/activities_ht.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/activities_ht.sql
SELECT '@./USER_MANAGEMENT/synonyms/activities_lt.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/activities_lt.sql
SELECT '@./USER_MANAGEMENT/synonyms/grants_ht.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/grants_ht.sql
SELECT '@./USER_MANAGEMENT/synonyms/grants_lt.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/grants_lt.sql
SELECT '@./USER_MANAGEMENT/synonyms/logger_logs.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/logger_logs.sql
SELECT '@./USER_MANAGEMENT/synonyms/logger_logs_apex_items.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/logger_logs_apex_items.sql
SELECT '@./USER_MANAGEMENT/synonyms/logger_logs_5_min.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/logger_logs_5_min.sql
SELECT '@./USER_MANAGEMENT/synonyms/logger_logs_60_min.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/logger_logs_60_min.sql
SELECT '@./USER_MANAGEMENT/synonyms/logger_prefs.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/logger_prefs.sql
SELECT '@./USER_MANAGEMENT/synonyms/logger_prefs_by_client_id.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/logger_prefs_by_client_id.sql
SELECT '@./USER_MANAGEMENT/synonyms/lookups.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/lookups.sql
SELECT '@./USER_MANAGEMENT/synonyms/lookups\\\$his.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/lookups\\\$his.sql
SELECT '@./USER_MANAGEMENT/synonyms/lookups\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/lookups\\\$i18n\\\$his.sql
SELECT '@./USER_MANAGEMENT/synonyms/object_grant_rel_ht.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/object_grant_rel_ht.sql
SELECT '@./USER_MANAGEMENT/synonyms/object_page_rel_ht.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/object_page_rel_ht.sql
SELECT '@./USER_MANAGEMENT/synonyms/objects_ht.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/objects_ht.sql
SELECT '@./USER_MANAGEMENT/synonyms/objects_lt.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/objects_lt.sql
SELECT '@./USER_MANAGEMENT/synonyms/parameter_settings_ht.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/parameter_settings_ht.sql
SELECT '@./USER_MANAGEMENT/synonyms/parameter_settings_lt.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/parameter_settings_lt.sql
SELECT '@./USER_MANAGEMENT/synonyms/pkg_authorization.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/pkg_authorization.sql
SELECT '@./USER_MANAGEMENT/synonyms/pkg_man_users.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/pkg_man_users.sql
SELECT '@./USER_MANAGEMENT/synonyms/pkg_param_config.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/pkg_param_config.sql
SELECT '@./USER_MANAGEMENT/synonyms/pkg_set_custom_ctx.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/pkg_set_custom_ctx.sql
SELECT '@./USER_MANAGEMENT/synonyms/role_object_grant_rel_ht.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/role_object_grant_rel_ht.sql
SELECT '@./USER_MANAGEMENT/synonyms/roles.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/roles.sql
SELECT '@./USER_MANAGEMENT/synonyms/roles_ht.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/roles_ht.sql
SELECT '@./USER_MANAGEMENT/synonyms/roles_lt.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/roles_lt.sql
SELECT '@./USER_MANAGEMENT/synonyms/user_role_rel_ht.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/user_role_rel_ht.sql
SELECT '@./USER_MANAGEMENT/synonyms/users_lt.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/users_lt.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/activities.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/activities.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/activities\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/activities\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/computer_org_unit_rel\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/computer_org_unit_rel\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/computer_role_rel\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/computer_role_rel\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/computers.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/computers.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/computers\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/computers\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/computers\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/computers\\\$i18n\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/grants.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/grants.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/grants\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/grants\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/grants\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/grants\\\$i18n\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/lookups.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/lookups.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/lookups\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/lookups\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/lookups\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/lookups\\\$i18n\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/object_grant_rel\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/object_grant_rel\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/object_page_rel\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/object_page_rel\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/objects.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/objects.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/objects\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/objects\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/objects\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/objects\\\$i18n\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/org_unit_org_unit_rel\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/org_unit_org_unit_rel\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/org_units\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/org_units\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/org_units\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/org_units\\\$i18n\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/parameter_settings.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/parameter_settings.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/parameter_settings\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/parameter_settings\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/parameter_settings\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/parameter_settings\\\$i18n\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/pkg_authorization.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/pkg_authorization.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/pkg_man_users.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/pkg_man_users.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/pkg_set_custom_ctx.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/pkg_set_custom_ctx.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/role_object_grant_rel\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/role_object_grant_rel\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/role_role_rel\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/role_role_rel\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/roles.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/roles.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/roles\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/roles\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/roles\\\$i18n\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/roles\\\$i18n\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/user_org_unit_rel\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/user_org_unit_rel\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/user_role_rel\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/user_role_rel\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/users.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/users.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/users\\\$his.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/users\\\$his.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/users\\\$sgd.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/users\\\$sgd.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/v_rank.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/v_rank.sql
SELECT '@./DL_BIOSTORE_BLACKLIST/tables/biometric_sample.sql' AS ">" FROM DUAL;
@./DL_BIOSTORE_BLACKLIST/tables/biometric_sample.sql
SELECT '@./DL_BIOSTORE_BLACKLIST/tables/template.sql' AS ">" FROM DUAL;
@./DL_BIOSTORE_BLACKLIST/tables/template.sql
SELECT '@./DL_BIOSTORE_MOVEMENTS/tables/biometric_sample.sql' AS ">" FROM DUAL;
@./DL_BIOSTORE_MOVEMENTS/tables/biometric_sample.sql
SELECT '@./DL_BIOSTORE_MOVEMENTS/tables/template.sql' AS ">" FROM DUAL;
@./DL_BIOSTORE_MOVEMENTS/tables/template.sql
SELECT '@./DL_BLACKLIST/packages/pkg_dl_i18n.pks' AS ">" FROM DUAL;
@./DL_BLACKLIST/packages/pkg_dl_i18n.pks
SELECT '@./DL_BLACKLIST/packages/pkg_dl_utils.pks' AS ">" FROM DUAL;
@./DL_BLACKLIST/packages/pkg_dl_utils.pks
SELECT '@./DL_BLACKLIST/packages/pkg_operating.pks' AS ">" FROM DUAL;
@./DL_BLACKLIST/packages/pkg_operating.pks
SELECT '@./DL_BLACKLIST/packages/pkg_search.pks' AS ">" FROM DUAL;
@./DL_BLACKLIST/packages/pkg_search.pks
SELECT '@./DL_BLACKLIST/packages/pkg_search_new.pks' AS ">" FROM DUAL;
@./DL_BLACKLIST/packages/pkg_search_new.pks
SELECT '@./DL_BLACKLIST/triggers/compression_algorithms\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/compression_algorithms\\\$biur.trg
SELECT '@./DL_BLACKLIST/triggers/device_types\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/device_types\\\$biur.trg
SELECT '@./DL_BLACKLIST/triggers/face_missing_reasons\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/face_missing_reasons\\\$biur.trg
SELECT '@./DL_BLACKLIST/triggers/face_missing_reasons\\\$i18n\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/face_missing_reasons\\\$i18n\\\$biur.trg
SELECT '@./DL_BLACKLIST/triggers/face_positions\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/face_positions\\\$biur.trg
SELECT '@./DL_BLACKLIST/triggers/face_positions\\\$i18n\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/face_positions\\\$i18n\\\$biur.trg
SELECT '@./DL_BLACKLIST/triggers/face_quality_types\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/face_quality_types\\\$biur.trg
SELECT '@./DL_BLACKLIST/triggers/face_quality_types\\\$i18n\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/face_quality_types\\\$i18n\\\$biur.trg
SELECT '@./DL_BLACKLIST/triggers/face_resolutions\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/face_resolutions\\\$biur.trg
SELECT '@./DL_BLACKLIST/triggers/finger_impression_types\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/finger_impression_types\\\$biur.trg
SELECT '@./DL_BLACKLIST/triggers/finger_impression_types\\\$i18n\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/finger_impression_types\\\$i18n\\\$biur.trg
SELECT '@./DL_BLACKLIST/triggers/finger_missing_reasons\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/finger_missing_reasons\\\$biur.trg
SELECT '@./DL_BLACKLIST/triggers/finger_missing_reasons\\\$i18n\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/finger_missing_reasons\\\$i18n\\\$biur.trg
SELECT '@./DL_BLACKLIST/triggers/finger_positions\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/finger_positions\\\$biur.trg
SELECT '@./DL_BLACKLIST/triggers/finger_positions\\\$i18n\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/finger_positions\\\$i18n\\\$biur.trg
SELECT '@./DL_BLACKLIST/tables/images.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/images.sql
SELECT '@./DL_BLACKLIST/triggers/images\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/images\\\$biur.trg
SELECT '@./DL_BLACKLIST/synonyms/logger_logs.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/synonyms/logger_logs.sql
SELECT '@./DL_BLACKLIST/synonyms/logger_logs_apex_items.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/synonyms/logger_logs_apex_items.sql
SELECT '@./DL_BLACKLIST/synonyms/logger_logs_5_min.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/synonyms/logger_logs_5_min.sql
SELECT '@./DL_BLACKLIST/synonyms/logger_logs_60_min.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/synonyms/logger_logs_60_min.sql
SELECT '@./DL_BLACKLIST/synonyms/logger_prefs.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/synonyms/logger_prefs.sql
SELECT '@./DL_BLACKLIST/synonyms/logger_prefs_by_client_id.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/synonyms/logger_prefs_by_client_id.sql
SELECT '@./DL_BLACKLIST/views/ops_configuration.vw' AS ">" FROM DUAL;
@./DL_BLACKLIST/views/ops_configuration.vw
SELECT '@./DL_BLACKLIST/views/ops_preferred_logs.vw' AS ">" FROM DUAL;
@./DL_BLACKLIST/views/ops_preferred_logs.vw
SELECT '@./DL_BLACKLIST/views/ops_preferred_logs_60_min.vw' AS ">" FROM DUAL;
@./DL_BLACKLIST/views/ops_preferred_logs_60_min.vw
SELECT '@./DL_BLACKLIST/package_bodies/pkg_dl_utils.pkb' AS ">" FROM DUAL;
@./DL_BLACKLIST/package_bodies/pkg_dl_utils.pkb
SELECT '@./DL_BORDERCONTROL/packages/adm_class_tapi_pkg.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/adm_class_tapi_pkg.pks
SELECT '@./DL_BORDERCONTROL/packages/xlib_component.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/xlib_component.pks
SELECT '@./DL_BORDERCONTROL/package_bodies/adm_class_tapi_pkg.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/adm_class_tapi_pkg.pkb
SELECT '@./DL_BORDERCONTROL/views/aq\\\$aq_bordercontrol_hooks_tab_r.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/aq\\\$aq_bordercontrol_hooks_tab_r.vw
SELECT '@./DL_BORDERCONTROL/tables/aq_bordercontrol_hooks_tab.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/aq_bordercontrol_hooks_tab.sql
SELECT '@./DL_BORDERCONTROL/tables/bio_abisstatus.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/bio_abisstatus.sql
SELECT '@./DL_BORDERCONTROL/triggers/display_objects\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/display_objects\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/tables/faf_payment_rate.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/faf_payment_rate.sql
SELECT '@./DL_BORDERCONTROL/tables/faf_payment_rate\\\$tag.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/faf_payment_rate\\\$tag.sql
SELECT '@./DL_BORDERCONTROL/triggers/faf_payment_rate\\\$tag\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/faf_payment_rate\\\$tag\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/tables/faf_permit_type\\\$tag.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/faf_permit_type\\\$tag.sql
SELECT '@./DL_BORDERCONTROL/triggers/faf_permit_type\\\$tag\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/faf_permit_type\\\$tag\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/triggers/flight_health_check\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/flight_health_check\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/synonyms/logger_logs.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/logger_logs.sql
SELECT '@./DL_BORDERCONTROL/synonyms/logger_logs_apex_items.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/logger_logs_apex_items.sql
SELECT '@./DL_BORDERCONTROL/synonyms/logger_logs_5_min.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/logger_logs_5_min.sql
SELECT '@./DL_BORDERCONTROL/synonyms/logger_logs_60_min.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/logger_logs_60_min.sql
SELECT '@./DL_BORDERCONTROL/synonyms/logger_prefs.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/logger_prefs.sql
SELECT '@./DL_BORDERCONTROL/synonyms/logger_prefs_by_client_id.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/logger_prefs_by_client_id.sql
SELECT '@./DL_BORDERCONTROL/triggers/offline_mode\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/offline_mode\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/triggers/offline_sync_error\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/offline_sync_error\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/triggers/parameters\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/parameters\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/synonyms/pkg_dl_i18n.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/pkg_dl_i18n.sql
SELECT '@./DL_BORDERCONTROL/types/sys_plsql_cca61a56_117_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/sys_plsql_cca61a56_117_1.sql
SELECT '@./DL_BORDERCONTROL/types/sys_plsql_3e5ed0f3_34_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/types/sys_plsql_3e5ed0f3_34_1.sql
SELECT '@./DL_BORDERCONTROL/triggers/thaipassport\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/thaipassport\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/package_bodies/xlib_component.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/xlib_component.pkb
SELECT '@./DL_BORDERCONTROL/package_bodies/xlib_http.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/xlib_http.pkb
SELECT '@./DL_BORDERCONTROL/package_bodies/xlib_jasperreports.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/xlib_jasperreports.pkb
SELECT '@./DL_BORDERCONTROL/package_bodies/xlib_jasperreports_img.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/xlib_jasperreports_img.pkb
SELECT '@./DL_BORDERCONTROL/package_bodies/xlib_log.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/xlib_log.pkb
SELECT '@./DL_BORDERCONTROL/triggers/xlib_logs_bi_trg.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/xlib_logs_bi_trg.trg
SELECT '@./DL_BORDERCONTROL_DATAMART/packages/pkg_etl.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/packages/pkg_etl.pks
SELECT '@./DL_BORDERCONTROL_DATAMART/packages/pkg_reporting.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/packages/pkg_reporting.pks
SELECT '@./DL_BORDERCONTROL_DATAMART/views/cross_nationalities_times_v.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/views/cross_nationalities_times_v.vw
SELECT '@./DL_BORDERCONTROL_DATAMART/views/cross_times_v.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/views/cross_times_v.vw
SELECT '@./DL_BORDERCONTROL_DATAMART/materialized_views/dim_nationality_time_movement.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/materialized_views/dim_nationality_time_movement.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/materialized_views/dim_time_movement.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/materialized_views/dim_time_movement.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/tables/import_run_events.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/tables/import_run_events.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/synonyms/logger_logs.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/synonyms/logger_logs.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/synonyms/logger_logs_apex_items.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/synonyms/logger_logs_apex_items.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/synonyms/logger_logs_5_min.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/synonyms/logger_logs_5_min.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/synonyms/logger_logs_60_min.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/synonyms/logger_logs_60_min.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/synonyms/logger_prefs.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/synonyms/logger_prefs.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/synonyms/logger_prefs_by_client_id.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/synonyms/logger_prefs_by_client_id.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/types/sys_plsql_2b453a71_38_1.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/types/sys_plsql_2b453a71_38_1.sql
SELECT '@./DL_COMMON/packages/pkg_json_convert.pks' AS ">" FROM DUAL;
@./DL_COMMON/packages/pkg_json_convert.pks
SELECT '@./DL_COMMON/packages/pkg_util.pks' AS ">" FROM DUAL;
@./DL_COMMON/packages/pkg_util.pks
SELECT '@./DL_COMMON/tables/action_codes.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/action_codes.sql
SELECT '@./DL_COMMON/tables/action_codes\\\$tag.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/action_codes\\\$tag.sql
SELECT '@./DL_COMMON/triggers/action_codes\\\$tag\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/action_codes\\\$tag\\\$tiud0.trg
SELECT '@./DL_COMMON/triggers/action_codes\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/action_codes\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/apex_lists.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/apex_lists.sql
SELECT '@./DL_COMMON/triggers/apex_lists\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/apex_lists\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/apex_menu.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/apex_menu.sql
SELECT '@./DL_COMMON/triggers/apex_menu\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/apex_menu\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/arrested_statuses.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/arrested_statuses.sql
SELECT '@./DL_COMMON/tables/arrested_statuses\\\$tag.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/arrested_statuses\\\$tag.sql
SELECT '@./DL_COMMON/triggers/arrested_statuses\\\$tag\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/arrested_statuses\\\$tag\\\$tiud0.trg
SELECT '@./DL_COMMON/triggers/arrested_statuses\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/arrested_statuses\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/arrested_types.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/arrested_types.sql
SELECT '@./DL_COMMON/tables/arrested_types\\\$tag.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/arrested_types\\\$tag.sql
SELECT '@./DL_COMMON/triggers/arrested_types\\\$tag\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/arrested_types\\\$tag\\\$tiud0.trg
SELECT '@./DL_COMMON/triggers/arrested_types\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/arrested_types\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/bc_person_types.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/bc_person_types.sql
SELECT '@./DL_COMMON/triggers/bc_person_types\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/bc_person_types\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/bs_relationships.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/bs_relationships.sql
SELECT '@./DL_COMMON/tables/bs_relationships\\\$tag.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/bs_relationships\\\$tag.sql
SELECT '@./DL_COMMON/triggers/bs_relationships\\\$tag\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/bs_relationships\\\$tag\\\$tiud0.trg
SELECT '@./DL_COMMON/triggers/bs_relationships\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/bs_relationships\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/card_types.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/card_types.sql
SELECT '@./DL_COMMON/tables/card_types\\\$tag.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/card_types\\\$tag.sql
SELECT '@./DL_COMMON/triggers/card_types\\\$tag\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/card_types\\\$tag\\\$tiud0.trg
SELECT '@./DL_COMMON/triggers/card_types\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/card_types\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/case_types\\\$tag.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/case_types\\\$tag.sql
SELECT '@./DL_COMMON/triggers/case_types\\\$tag\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/case_types\\\$tag\\\$tiud0.trg
SELECT '@./DL_COMMON/triggers/case_types\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/case_types\\\$tiud0.trg
SELECT '@./DL_COMMON/views/continents#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/continents#i18n.vw
SELECT '@./DL_COMMON/tables/languages.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/languages.sql
SELECT '@./DL_COMMON/triggers/languages\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/languages\\\$tiud0.trg
SELECT '@./DL_COMMON/synonyms/logger_logs.sql' AS ">" FROM DUAL;
@./DL_COMMON/synonyms/logger_logs.sql
SELECT '@./DL_COMMON/synonyms/logger_logs_apex_items.sql' AS ">" FROM DUAL;
@./DL_COMMON/synonyms/logger_logs_apex_items.sql
SELECT '@./DL_COMMON/synonyms/logger_logs_5_min.sql' AS ">" FROM DUAL;
@./DL_COMMON/synonyms/logger_logs_5_min.sql
SELECT '@./DL_COMMON/synonyms/logger_logs_60_min.sql' AS ">" FROM DUAL;
@./DL_COMMON/synonyms/logger_logs_60_min.sql
SELECT '@./DL_COMMON/synonyms/logger_prefs.sql' AS ">" FROM DUAL;
@./DL_COMMON/synonyms/logger_prefs.sql
SELECT '@./DL_COMMON/synonyms/logger_prefs_by_client_id.sql' AS ">" FROM DUAL;
@./DL_COMMON/synonyms/logger_prefs_by_client_id.sql
SELECT '@./DL_COMMON/tables/messages.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/messages.sql
SELECT '@./DL_COMMON/triggers/messages\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/messages\\\$tiud0.trg
SELECT '@./DL_COMMON/views/module_versions.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/module_versions.vw
SELECT '@./DL_COMMON/triggers/module_versions\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/module_versions\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/movement_reasons\\\$tag.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/movement_reasons\\\$tag.sql
SELECT '@./DL_COMMON/triggers/movement_reasons\\\$tag\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/movement_reasons\\\$tag\\\$tiud0.trg
SELECT '@./DL_COMMON/types/ot_bin_file.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/ot_bin_file.sql
SELECT '@./DL_COMMON/types/ot_char_file.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/ot_char_file.sql
SELECT '@./DL_COMMON/types/ot_db_exce_code.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/ot_db_exce_code.sql
SELECT '@./DL_COMMON/types/ot_db_object.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/ot_db_object.sql
SELECT '@./DL_COMMON/types/ot_db_object_tblspc.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/ot_db_object_tblspc.sql
SELECT '@./DL_COMMON/types/ot_db_tab_col.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/ot_db_tab_col.sql
SELECT '@./DL_COMMON/types/ot_db_tab_col_tblspc.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/ot_db_tab_col_tblspc.sql
SELECT '@./DL_COMMON/views/owners#tag.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/owners#tag.vw
SELECT '@./DL_COMMON/triggers/owners\\\$tag\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/owners\\\$tag\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/permit_types.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/permit_types.sql
SELECT '@./DL_COMMON/triggers/permit_types\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/permit_types\\\$tiud0.trg
SELECT '@./DL_COMMON/package_bodies/pkg_json_convert.pkb' AS ">" FROM DUAL;
@./DL_COMMON/package_bodies/pkg_json_convert.pkb
SELECT '@./DL_COMMON/package_bodies/pkg_json_export.pkb' AS ">" FROM DUAL;
@./DL_COMMON/package_bodies/pkg_json_export.pkb
SELECT '@./DL_COMMON/package_bodies/pkg_util.pkb' AS ">" FROM DUAL;
@./DL_COMMON/package_bodies/pkg_util.pkb
SELECT '@./DL_COMMON/types/pljson_list.sql
CREATE PUBLIC SYNONYM PLJSON_LIST FOR DL_COMMON.PLJSON_LIST;
CREATE PUBLIC SYNONYM JSON_LIST FOR DL_COMMON.PLJSON_LIST;' AS ">" FROM DUAL;
@./DL_COMMON/types/pljson_list.sql
CREATE PUBLIC SYNONYM PLJSON_LIST FOR DL_COMMON.PLJSON_LIST;
CREATE PUBLIC SYNONYM JSON_LIST FOR DL_COMMON.PLJSON_LIST;
SELECT '@./DL_COMMON/views/port_movements#tag.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/port_movements#tag.vw
SELECT '@./DL_COMMON/triggers/port_movements\\\$tag\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/port_movements\\\$tag\\\$tiud0.trg
SELECT '@./DL_COMMON/triggers/port_movements\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/port_movements\\\$tiud0.trg
SELECT '@./DL_COMMON/views/reason_codes#tag.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/reason_codes#tag.vw
SELECT '@./DL_COMMON/triggers/reason_codes\\\$tag\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/reason_codes\\\$tag\\\$tiud0.trg
SELECT '@./DL_COMMON/triggers/reason_codes\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/reason_codes\\\$tiud0.trg
SELECT '@./DL_COMMON/views/relations#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/relations#i18n.vw
SELECT '@./DL_COMMON/views/secret_levels#tag.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/secret_levels#tag.vw
SELECT '@./DL_COMMON/triggers/secret_levels\\\$tag\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/secret_levels\\\$tag\\\$tiud0.trg
SELECT '@./DL_COMMON/triggers/secret_levels\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/secret_levels\\\$tiud0.trg
SELECT '@./DL_COMMON/views/statuses#tag.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/statuses#tag.vw
SELECT '@./DL_COMMON/triggers/trans_modes\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/trans_modes\\\$tiud0.trg
SELECT '@./DL_COMMON/triggers/trans_vehicles\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/trans_vehicles\\\$tiud0.trg
SELECT '@./DL_COMMON/types/tt_bin_file.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_bin_file.sql
SELECT '@./DL_COMMON/types/tt_char_file.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_char_file.sql
SELECT '@./DL_COMMON/types/tt_db_exce_code.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_db_exce_code.sql
SELECT '@./DL_COMMON/types/tt_db_object.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_db_object.sql
SELECT '@./DL_COMMON/types/tt_db_object_tblspc.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_db_object_tblspc.sql
SELECT '@./DL_COMMON/types/tt_db_tab_col.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_db_tab_col.sql
SELECT '@./DL_COMMON/types/tt_db_tab_col_tblspc.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/tt_db_tab_col_tblspc.sql
SELECT '@./DL_COMMON/triggers/visa_types\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/visa_types\\\$tiud0.trg
SELECT '@./DL_COMMON/types/vt_bin_file.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_bin_file.sql
SELECT '@./DL_COMMON/types/vt_char_file.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_char_file.sql
SELECT '@./DL_COMMON/types/vt_db_exce_code.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_db_exce_code.sql
SELECT '@./DL_COMMON/types/vt_db_object.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_db_object.sql
SELECT '@./DL_COMMON/types/vt_db_object_tblspc.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_db_object_tblspc.sql
SELECT '@./DL_COMMON/types/vt_db_tab_col.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_db_tab_col.sql
SELECT '@./DL_COMMON/types/vt_db_tab_col_tblspc.sql' AS ">" FROM DUAL;
@./DL_COMMON/types/vt_db_tab_col_tblspc.sql
SELECT '@./DL_DBA/packages/pkg_ddl_util.pks' AS ">" FROM DUAL;
@./DL_DBA/packages/pkg_ddl_util.pks
SELECT '@./DL_DBA/packages/pkg_module_install.pks' AS ">" FROM DUAL;
@./DL_DBA/packages/pkg_module_install.pks
SELECT '@./DL_DBA/packages/pkg_sql_script.pks' AS ">" FROM DUAL;
@./DL_DBA/packages/pkg_sql_script.pks
SELECT '@./DL_DBA/views/installed_modules.vw' AS ">" FROM DUAL;
@./DL_DBA/views/installed_modules.vw
SELECT '@./DL_DBA/synonyms/logger_logs.sql' AS ">" FROM DUAL;
@./DL_DBA/synonyms/logger_logs.sql
SELECT '@./DL_DBA/synonyms/logger_logs_apex_items.sql' AS ">" FROM DUAL;
@./DL_DBA/synonyms/logger_logs_apex_items.sql
SELECT '@./DL_DBA/synonyms/logger_logs_5_min.sql' AS ">" FROM DUAL;
@./DL_DBA/synonyms/logger_logs_5_min.sql
SELECT '@./DL_DBA/synonyms/logger_logs_60_min.sql' AS ">" FROM DUAL;
@./DL_DBA/synonyms/logger_logs_60_min.sql
SELECT '@./DL_DBA/synonyms/logger_prefs.sql' AS ">" FROM DUAL;
@./DL_DBA/synonyms/logger_prefs.sql
SELECT '@./DL_DBA/synonyms/logger_prefs_by_client_id.sql' AS ">" FROM DUAL;
@./DL_DBA/synonyms/logger_prefs_by_client_id.sql
SELECT '@./DL_DBA/package_bodies/pkg_module_install.pkb' AS ">" FROM DUAL;
@./DL_DBA/package_bodies/pkg_module_install.pkb
SELECT '@./DL_DBA/views/templates#tag.vw' AS ">" FROM DUAL;
@./DL_DBA/views/templates#tag.vw
SELECT '@./DL_DBA/triggers/templates\\\$tag\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_DBA/triggers/templates\\\$tag\\\$tiud0.trg
SELECT '@./DL_DBA/triggers/templates\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_DBA/triggers/templates\\\$tiud0.trg
SELECT '@./DL_INTERFACE/packages/pkg_listener.pks' AS ">" FROM DUAL;
@./DL_INTERFACE/packages/pkg_listener.pks
SELECT '@./DL_INTERFACE/packages/pkg_utils.pks' AS ">" FROM DUAL;
@./DL_INTERFACE/packages/pkg_utils.pks
SELECT '@./DL_INTERFACE/synonyms/logger_logs.sql' AS ">" FROM DUAL;
@./DL_INTERFACE/synonyms/logger_logs.sql
SELECT '@./DL_INTERFACE/synonyms/logger_logs_apex_items.sql' AS ">" FROM DUAL;
@./DL_INTERFACE/synonyms/logger_logs_apex_items.sql
SELECT '@./DL_INTERFACE/synonyms/logger_logs_5_min.sql' AS ">" FROM DUAL;
@./DL_INTERFACE/synonyms/logger_logs_5_min.sql
SELECT '@./DL_INTERFACE/synonyms/logger_logs_60_min.sql' AS ">" FROM DUAL;
@./DL_INTERFACE/synonyms/logger_logs_60_min.sql
SELECT '@./DL_INTERFACE/synonyms/logger_prefs.sql' AS ">" FROM DUAL;
@./DL_INTERFACE/synonyms/logger_prefs.sql
SELECT '@./DL_INTERFACE/synonyms/logger_prefs_by_client_id.sql' AS ">" FROM DUAL;
@./DL_INTERFACE/synonyms/logger_prefs_by_client_id.sql
SELECT '@./DL_STAGING4PIBICS/packages/pkg_operating.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/packages/pkg_operating.pks
SELECT '@./DL_STAGING4PIBICS/packages/pkg_tmmain.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/packages/pkg_tmmain.pks
SELECT '@./DL_STAGING4PIBICS/packages/pkg_utils.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/packages/pkg_utils.pks
SELECT '@./DL_STAGING4PIBICS/packages/pkg_watchlist.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/packages/pkg_watchlist.pks
SELECT '@./DL_STAGING4PIBICS/views/cnt_summary_yyyymm.vw' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/views/cnt_summary_yyyymm.vw
SELECT '@./DL_STAGING4PIBICS/synonyms/logger_logs.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/synonyms/logger_logs.sql
SELECT '@./DL_STAGING4PIBICS/synonyms/logger_logs_apex_items.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/synonyms/logger_logs_apex_items.sql
SELECT '@./DL_STAGING4PIBICS/synonyms/logger_logs_5_min.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/synonyms/logger_logs_5_min.sql
SELECT '@./DL_STAGING4PIBICS/synonyms/logger_logs_60_min.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/synonyms/logger_logs_60_min.sql
SELECT '@./DL_STAGING4PIBICS/synonyms/logger_prefs.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/synonyms/logger_prefs.sql
SELECT '@./DL_STAGING4PIBICS/synonyms/logger_prefs_by_client_id.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/synonyms/logger_prefs_by_client_id.sql
SELECT '@./DL_STAGING4PIBICS/views/log_my_logs.vw' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/views/log_my_logs.vw
SELECT '@./DL_STAGING4PIBICS/views/log_my_logs_60_min.vw' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/views/log_my_logs_60_min.vw
SELECT '@./DL_STAGING4PIBICS/views/ops_configuration.vw' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/views/ops_configuration.vw
SELECT '@./DL_STAGING4PIBICS/package_bodies/pkg_maintenance.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/package_bodies/pkg_maintenance.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/packages/pkg_preferences.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/packages/pkg_preferences.pks
SELECT '@./DL_STAGING4PIBICS_INTF/packages/pkg_utils.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/packages/pkg_utils.pks
SELECT '@./DL_STAGING4PIBICS_INTF/views/cnt_phase1_insert_yyyymm.vw' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/views/cnt_phase1_insert_yyyymm.vw
SELECT '@./DL_STAGING4PIBICS_INTF/views/cnt_summary_yyyymm.vw' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/views/cnt_summary_yyyymm.vw
SELECT '@./DL_STAGING4PIBICS_INTF/synonyms/logger_logs.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/synonyms/logger_logs.sql
SELECT '@./DL_STAGING4PIBICS_INTF/synonyms/logger_logs_apex_items.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/synonyms/logger_logs_apex_items.sql
SELECT '@./DL_STAGING4PIBICS_INTF/synonyms/logger_logs_5_min.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/synonyms/logger_logs_5_min.sql
SELECT '@./DL_STAGING4PIBICS_INTF/synonyms/logger_logs_60_min.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/synonyms/logger_logs_60_min.sql
SELECT '@./DL_STAGING4PIBICS_INTF/synonyms/logger_prefs.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/synonyms/logger_prefs.sql
SELECT '@./DL_STAGING4PIBICS_INTF/synonyms/logger_prefs_by_client_id.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/synonyms/logger_prefs_by_client_id.sql
SELECT '@./DL_STAGING4PIBICS_INTF/views/log_my_logs.vw' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/views/log_my_logs.vw
SELECT '@./DL_STAGING4PIBICS_INTF/views/log_my_logs_60_min.vw' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/views/log_my_logs_60_min.vw
SELECT '@./DL_STAGING4PIBICS_INTF/procedures/p_bk_sync_blacklist_cases.prc' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/procedures/p_bk_sync_blacklist_cases.prc
SELECT '@./DL_STAGING4PIBICS_INTF/views/user_scheduler_jobs_initial_load_pibics.vw' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/views/user_scheduler_jobs_initial_load_pibics.vw
SELECT '@./DL_USER_MANAGEMENT/packages/dl_ldap.pks' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/packages/dl_ldap.pks
SELECT '@./DL_USER_MANAGEMENT/views/computer_pool.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/computer_pool.vw
SELECT '@./DL_USER_MANAGEMENT/tables/computer_role_rel.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/computer_role_rel.sql
SELECT '@./DL_USER_MANAGEMENT/views/computer_role_rel_pool.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/computer_role_rel_pool.vw
SELECT '@./DL_USER_MANAGEMENT/triggers/computer_role_rel\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/computer_role_rel\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/procedures/drop_db_obj\\\$aicu.prc' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/procedures/drop_db_obj\\\$aicu.prc
SELECT '@./DL_USER_MANAGEMENT/procedures/drop_db_obj\\\$aidf.prc' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/procedures/drop_db_obj\\\$aidf.prc
SELECT '@./DL_USER_MANAGEMENT/procedures/inst_db_obj\\\$aicu.prc' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/procedures/inst_db_obj\\\$aicu.prc
SELECT '@./DL_USER_MANAGEMENT/procedures/inst_db_obj\\\$aidf.prc' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/procedures/inst_db_obj\\\$aidf.prc
SELECT '@./DL_USER_MANAGEMENT/tables/ldap_roles\\\$gt.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/ldap_roles\\\$gt.sql
SELECT '@./DL_USER_MANAGEMENT/synonyms/logger_logs.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/synonyms/logger_logs.sql
SELECT '@./DL_USER_MANAGEMENT/synonyms/logger_logs_apex_items.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/synonyms/logger_logs_apex_items.sql
SELECT '@./DL_USER_MANAGEMENT/synonyms/logger_logs_5_min.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/synonyms/logger_logs_5_min.sql
SELECT '@./DL_USER_MANAGEMENT/synonyms/logger_logs_60_min.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/synonyms/logger_logs_60_min.sql
SELECT '@./DL_USER_MANAGEMENT/synonyms/logger_prefs.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/synonyms/logger_prefs.sql
SELECT '@./DL_USER_MANAGEMENT/synonyms/logger_prefs_by_client_id.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/synonyms/logger_prefs_by_client_id.sql
SELECT '@./DL_USER_MANAGEMENT/tables/object_grant_rel.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/object_grant_rel.sql
SELECT '@./DL_USER_MANAGEMENT/triggers/object_grant_rel\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/object_grant_rel\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/tables/object_page_rel.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/object_page_rel.sql
SELECT '@./DL_USER_MANAGEMENT/triggers/object_page_rel.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/object_page_rel.trg
SELECT '@./DL_USER_MANAGEMENT/triggers/object_page_rel\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/object_page_rel\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/tables/role_object_grant_rel.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/role_object_grant_rel.sql
SELECT '@./DL_USER_MANAGEMENT/triggers/role_object_grant_rel.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/role_object_grant_rel.trg
SELECT '@./DL_USER_MANAGEMENT/triggers/role_object_grant_rel\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/role_object_grant_rel\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/views/role_pool.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/role_pool.vw
SELECT '@./DL_USER_MANAGEMENT/tables/role_role_rel.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/role_role_rel.sql
SELECT '@./DL_USER_MANAGEMENT/views/role_role_rel_pool.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/role_role_rel_pool.vw
SELECT '@./DL_USER_MANAGEMENT/triggers/role_role_rel\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/role_role_rel\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/views/role_role_roles_pool.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/role_role_roles_pool.vw
SELECT '@./DL_USER_MANAGEMENT/views/user_pool.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/user_pool.vw
SELECT '@./DL_USER_MANAGEMENT/tables/user_role_rel.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/user_role_rel.sql
SELECT '@./DL_USER_MANAGEMENT/views/user_role_rel_pool.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/user_role_rel_pool.vw
SELECT '@./DL_USER_MANAGEMENT/triggers/user_role_rel\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/user_role_rel\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/views/users#sgd.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/users#sgd.vw
SELECT '@./DL_USER_MANAGEMENT/triggers/users#sgd\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/users#sgd\\\$tiud0.trg
SELECT '@./LOGGER/packages/logger.pks' AS ">" FROM DUAL;
@./LOGGER/packages/logger.pks
SELECT '@./LOGGER/triggers/biu_logger_apex_items.trg' AS ">" FROM DUAL;
@./LOGGER/triggers/biu_logger_apex_items.trg
SELECT '@./LOGGER/triggers/biu_logger_prefs.trg' AS ">" FROM DUAL;
@./LOGGER/triggers/biu_logger_prefs.trg
SELECT '@./LOGGER/package_bodies/logger.pkb' AS ">" FROM DUAL;
@./LOGGER/package_bodies/logger.pkb
SELECT '@./LOGGER/procedures/logger_configure.prc' AS ">" FROM DUAL;
@./LOGGER/procedures/logger_configure.prc
SELECT '@./LOGGER/views/logger_logs_terse.vw' AS ">" FROM DUAL;
@./LOGGER/views/logger_logs_terse.vw
SELECT '@./USER_MANAGEMENT/synonyms/dl_ldap.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/dl_ldap.sql
SELECT '@./USER_MANAGEMENT/synonyms/logger.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/logger.sql
SELECT '@./USER_MANAGEMENT/synonyms/logger_logs_terse.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/logger_logs_terse.sql
SELECT '@./USER_MANAGEMENT/synonyms/object_grant_rel.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/object_grant_rel.sql
SELECT '@./USER_MANAGEMENT/synonyms/object_grant_rel_lt.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/object_grant_rel_lt.sql
SELECT '@./USER_MANAGEMENT/synonyms/object_page_rel_lt.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/object_page_rel_lt.sql
SELECT '@./USER_MANAGEMENT/synonyms/role_object_grant_rel.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/role_object_grant_rel.sql
SELECT '@./USER_MANAGEMENT/synonyms/role_object_grant_rel_lt.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/role_object_grant_rel_lt.sql
SELECT '@./USER_MANAGEMENT/synonyms/user_role_rel.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/user_role_rel.sql
SELECT '@./USER_MANAGEMENT/synonyms/user_role_rel_lt.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/user_role_rel_lt.sql
SELECT '@./USER_MANAGEMENT/synonyms/users.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/users.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/computer_pool.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/computer_pool.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/computer_role_rel.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/computer_role_rel.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/computer_role_rel_pool.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/computer_role_rel_pool.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/object_grant_rel.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/object_grant_rel.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/object_page_rel.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/object_page_rel.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/role_object_grant_rel.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/role_object_grant_rel.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/role_pool.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/role_pool.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/role_role_rel.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/role_role_rel.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/role_role_rel_pool.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/role_role_rel_pool.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/role_role_roles_pool.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/role_role_roles_pool.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/user_pool.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/user_pool.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/user_role_rel.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/user_role_rel.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/user_role_rel_pool.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/user_role_rel_pool.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/users#sgd.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/users#sgd.sql
SELECT '@./DL_BLACKLIST/tables/blacklist_cases.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/blacklist_cases.sql
SELECT '@./DL_BLACKLIST/triggers/blacklist_cases\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/blacklist_cases\\\$biur.trg
SELECT '@./DL_BLACKLIST/views/blacklist_cases_extended.vw' AS ">" FROM DUAL;
@./DL_BLACKLIST/views/blacklist_cases_extended.vw
SELECT '@./DL_BLACKLIST/triggers/blacklist_cases\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/blacklist_cases\\\$tiud0.trg
SELECT '@./DL_BLACKLIST/synonyms/logger.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/synonyms/logger.sql
SELECT '@./DL_BLACKLIST/synonyms/logger_logs_terse.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/synonyms/logger_logs_terse.sql
SELECT '@./DL_BLACKLIST/views/logs_icrs_v.vw' AS ">" FROM DUAL;
@./DL_BLACKLIST/views/logs_icrs_v.vw
SELECT '@./DL_BLACKLIST/package_bodies/pkg_utils.pkb' AS ">" FROM DUAL;
@./DL_BLACKLIST/package_bodies/pkg_utils.pkb
SELECT '@./DL_BLACKLIST/tables/related_persons.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/related_persons.sql
SELECT '@./DL_BLACKLIST/views/v_blacklist_cases.vw' AS ">" FROM DUAL;
@./DL_BLACKLIST/views/v_blacklist_cases.vw
SELECT '@./DL_BORDERCONTROL/views/aq\\\$aq_bordercontrol_hooks_tab.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/aq\\\$aq_bordercontrol_hooks_tab.vw
SELECT '@./DL_BORDERCONTROL/views/aq\\\$_aq_bordercontrol_hooks_tab_f.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/aq\\\$_aq_bordercontrol_hooks_tab_f.vw
SELECT '@./DL_BORDERCONTROL/synonyms/blacklist_cases.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/blacklist_cases.sql
SELECT '@./DL_BORDERCONTROL/views/faf_payment_rate#tag.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/faf_payment_rate#tag.vw
SELECT '@./DL_BORDERCONTROL/views/faf_permit_type#tag.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/faf_permit_type#tag.vw
SELECT '@./DL_BORDERCONTROL/synonyms/logger.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/logger.sql
SELECT '@./DL_BORDERCONTROL/synonyms/logger_logs_terse.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/logger_logs_terse.sql
SELECT '@./DL_BORDERCONTROL/package_bodies/pkg_dl_authorization.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/pkg_dl_authorization.pkb
SELECT '@./DL_BORDERCONTROL/package_bodies/pkg_icpo_util.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/pkg_icpo_util.pkb
SELECT '@./DL_BORDERCONTROL_DATAMART/synonyms/logger.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/synonyms/logger.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/synonyms/logger_logs_terse.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/synonyms/logger_logs_terse.sql
SELECT '@./DL_BORDERCONTROL_DATAMART/package_bodies/pkg_apex_util.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/package_bodies/pkg_apex_util.pkb
SELECT '@./DL_COMMON/packages/pljson_ml.pks
CREATE PUBLIC SYNONYM PLJSON_ML FOR DL_COMMON.PLJSON_ML;
CREATE PUBLIC SYNONYM JSON_ML FOR DL_COMMON.PLJSON_ML;' AS ">" FROM DUAL;
@./DL_COMMON/packages/pljson_ml.pks
CREATE PUBLIC SYNONYM PLJSON_ML FOR DL_COMMON.PLJSON_ML;
CREATE PUBLIC SYNONYM JSON_ML FOR DL_COMMON.PLJSON_ML;
SELECT '@./DL_COMMON/packages/pljson_util_pkg.pks
CREATE PUBLIC SYNONYM PLJSON_UTIL_PKG FOR DL_COMMON.PLJSON_UTIL_PKG;
CREATE PUBLIC SYNONYM JSON_UTIL_PKG FOR DL_COMMON.PLJSON_UTIL_PKG;' AS ">" FROM DUAL;
@./DL_COMMON/packages/pljson_util_pkg.pks
CREATE PUBLIC SYNONYM PLJSON_UTIL_PKG FOR DL_COMMON.PLJSON_UTIL_PKG;
CREATE PUBLIC SYNONYM JSON_UTIL_PKG FOR DL_COMMON.PLJSON_UTIL_PKG;
SELECT '@./DL_COMMON/views/action_codes#tag.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/action_codes#tag.vw
SELECT '@./DL_COMMON/views/arrested_statuses#tag.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/arrested_statuses#tag.vw
SELECT '@./DL_COMMON/views/arrested_types#tag.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/arrested_types#tag.vw
SELECT '@./DL_COMMON/views/bs_relationships#tag.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/bs_relationships#tag.vw
SELECT '@./DL_COMMON/views/card_types#tag.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/card_types#tag.vw
SELECT '@./DL_COMMON/views/case_types#tag.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/case_types#tag.vw
SELECT '@./DL_COMMON/tables/countries.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/countries.sql
SELECT '@./DL_COMMON/triggers/countries\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/countries\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/country\\\$visa_type.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/country\\\$visa_type.sql
SELECT '@./DL_COMMON/tables/icao_doc_codes.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/icao_doc_codes.sql
SELECT '@./DL_COMMON/triggers/icao_doc_codes\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/icao_doc_codes\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/icao_doc_code\\\$visa_type.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/icao_doc_code\\\$visa_type.sql
SELECT '@./DL_COMMON/tables/icao_doc_code\\\$visa_type\\\$tag.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/icao_doc_code\\\$visa_type\\\$tag.sql
SELECT '@./DL_COMMON/triggers/icao_doc_code\\\$visa_type\\\$tag\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/icao_doc_code\\\$visa_type\\\$tag\\\$tiud0.trg
SELECT '@./DL_COMMON/triggers/icao_doc_code\\\$visa_type\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/icao_doc_code\\\$visa_type\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/locales.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/locales.sql
SELECT '@./DL_COMMON/views/locales#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/locales#i18n.vw
SELECT '@./DL_COMMON/triggers/locales\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/locales\\\$tiud0.trg
SELECT '@./DL_COMMON/synonyms/logger.sql' AS ">" FROM DUAL;
@./DL_COMMON/synonyms/logger.sql
SELECT '@./DL_COMMON/synonyms/logger_logs_terse.sql' AS ">" FROM DUAL;
@./DL_COMMON/synonyms/logger_logs_terse.sql
SELECT '@./DL_COMMON/synonyms/logs_icrs_v.sql' AS ">" FROM DUAL;
@./DL_COMMON/synonyms/logs_icrs_v.sql
SELECT '@./DL_COMMON/tables/messages\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/messages\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/messages\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/messages\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/movement_reasons\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/movement_reasons\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/movement_reasons\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/movement_reasons\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/movement_reasons#tag.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/movement_reasons#tag.vw
SELECT '@./DL_COMMON/tables/owners\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/owners\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/owners\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/owners\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/permit_types\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/permit_types\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/permit_types\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/permit_types\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/package_bodies/pkg_apex_util.pkb' AS ">" FROM DUAL;
@./DL_COMMON/package_bodies/pkg_apex_util.pkb
SELECT '@./DL_COMMON/types/pljson.sql
CREATE PUBLIC SYNONYM PLJSON FOR DL_COMMON.PLJSON;
CREATE PUBLIC SYNONYM JSON FOR DL_COMMON.PLJSON;' AS ">" FROM DUAL;
@./DL_COMMON/types/pljson.sql
CREATE PUBLIC SYNONYM PLJSON FOR DL_COMMON.PLJSON;
CREATE PUBLIC SYNONYM JSON FOR DL_COMMON.PLJSON;
SELECT '@./DL_COMMON/package_bodies/pljson_ml.pkb
CREATE PUBLIC SYNONYM PLJSON_ML FOR DL_COMMON.PLJSON_ML;
CREATE PUBLIC SYNONYM JSON_ML FOR DL_COMMON.PLJSON_ML;' AS ">" FROM DUAL;
@./DL_COMMON/package_bodies/pljson_ml.pkb
CREATE PUBLIC SYNONYM PLJSON_ML FOR DL_COMMON.PLJSON_ML;
CREATE PUBLIC SYNONYM JSON_ML FOR DL_COMMON.PLJSON_ML;
SELECT '@./DL_COMMON/types/pljson_table_impl.sql
CREATE PUBLIC SYNONYM PLJSON_TABLE_IMPL FOR DL_COMMON.PLJSON_TABLE_IMPL;
CREATE PUBLIC SYNONYM PLJSON_TABLE FOR DL_COMMON.PLJSON_TABLE_IMPL;' AS ">" FROM DUAL;
@./DL_COMMON/types/pljson_table_impl.sql
CREATE PUBLIC SYNONYM PLJSON_TABLE_IMPL FOR DL_COMMON.PLJSON_TABLE_IMPL;
CREATE PUBLIC SYNONYM PLJSON_TABLE FOR DL_COMMON.PLJSON_TABLE_IMPL;
SELECT '@./DL_COMMON/package_bodies/pljson_util_pkg.pkb
CREATE PUBLIC SYNONYM PLJSON_UTIL_PKG FOR DL_COMMON.PLJSON_UTIL_PKG;
CREATE PUBLIC SYNONYM JSON_UTIL_PKG FOR DL_COMMON.PLJSON_UTIL_PKG;' AS ">" FROM DUAL;
@./DL_COMMON/package_bodies/pljson_util_pkg.pkb
CREATE PUBLIC SYNONYM PLJSON_UTIL_PKG FOR DL_COMMON.PLJSON_UTIL_PKG;
CREATE PUBLIC SYNONYM JSON_UTIL_PKG FOR DL_COMMON.PLJSON_UTIL_PKG;
SELECT '@./DL_COMMON/tables/port_movements\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/port_movements\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/port_movements\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/port_movements\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/ports.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/ports.sql
SELECT '@./DL_COMMON/tables/ports\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/ports\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/ports\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/ports\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/triggers/ports\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/ports\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/professions\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/professions\\\$i18n.sql
SELECT '@./DL_COMMON/tables/reason_codes\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/reason_codes\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/reason_codes\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/reason_codes\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/salutations\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/salutations\\\$i18n.sql
SELECT '@./DL_COMMON/tables/secret_levels\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/secret_levels\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/secret_levels\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/secret_levels\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/statuses\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/statuses\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/statuses\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/statuses\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/sub_nationalities\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/sub_nationalities\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/sub_nationalities\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/sub_nationalities\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/trans_grp_states\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/trans_grp_states\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/trans_grp_states\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/trans_grp_states\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/trans_modes\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/trans_modes\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/trans_modes\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/trans_modes\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/trans_vehicles\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/trans_vehicles\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/trans_vehicles\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/trans_vehicles\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/visa_types\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/visa_types\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/visa_types\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/visa_types\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/yes_nos\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/yes_nos\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/yes_nos\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/yes_nos\\\$i18n\\\$tiud0.trg
SELECT '@./DL_DBA/synonyms/logger.sql' AS ">" FROM DUAL;
@./DL_DBA/synonyms/logger.sql
SELECT '@./DL_DBA/synonyms/logger_logs_terse.sql' AS ">" FROM DUAL;
@./DL_DBA/synonyms/logger_logs_terse.sql
SELECT '@./DL_DBA/package_bodies/pkg_apex_util.pkb' AS ">" FROM DUAL;
@./DL_DBA/package_bodies/pkg_apex_util.pkb
SELECT '@./DL_DBA/package_bodies/pkg_ddl_util.pkb' AS ">" FROM DUAL;
@./DL_DBA/package_bodies/pkg_ddl_util.pkb
SELECT '@./DL_DBA/package_bodies/pkg_sql_script.pkb' AS ">" FROM DUAL;
@./DL_DBA/package_bodies/pkg_sql_script.pkb
SELECT '@./DL_DBA/tables/templates\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_DBA/tables/templates\\\$i18n.sql
SELECT '@./DL_DBA/triggers/templates\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_DBA/triggers/templates\\\$i18n\\\$tiud0.trg
SELECT '@./DL_INTERFACE/synonyms/logger.sql' AS ">" FROM DUAL;
@./DL_INTERFACE/synonyms/logger.sql
SELECT '@./DL_INTERFACE/synonyms/logger_logs_terse.sql' AS ">" FROM DUAL;
@./DL_INTERFACE/synonyms/logger_logs_terse.sql
SELECT '@./DL_INTERFACE/package_bodies/pkg_exchange_objects.pkb' AS ">" FROM DUAL;
@./DL_INTERFACE/package_bodies/pkg_exchange_objects.pkb
SELECT '@./DL_INTERFACE/package_bodies/pkg_utils.pkb' AS ">" FROM DUAL;
@./DL_INTERFACE/package_bodies/pkg_utils.pkb
SELECT '@./DL_INTERFACE/package_bodies/pkg_webservices_blacklist.pkb' AS ">" FROM DUAL;
@./DL_INTERFACE/package_bodies/pkg_webservices_blacklist.pkb
SELECT '@./DL_STAGING4PIBICS/packages/pkg_crew.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/packages/pkg_crew.pks
SELECT '@./DL_STAGING4PIBICS/packages/pkg_fs_fees.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/packages/pkg_fs_fees.pks
SELECT '@./DL_STAGING4PIBICS/packages/pkg_fs_feesdetail.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/packages/pkg_fs_feesdetail.pks
SELECT '@./DL_STAGING4PIBICS/packages/pkg_fs_fines.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/packages/pkg_fs_fines.pks
SELECT '@./DL_STAGING4PIBICS/packages/pkg_fs_finesdetail.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/packages/pkg_fs_finesdetail.pks
SELECT '@./DL_STAGING4PIBICS/packages/pkg_lostpassport.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/packages/pkg_lostpassport.pks
SELECT '@./DL_STAGING4PIBICS/packages/pkg_ops_transactional.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/packages/pkg_ops_transactional.pks
SELECT '@./DL_STAGING4PIBICS/packages/pkg_thaipassport.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/packages/pkg_thaipassport.pks
SELECT '@./DL_STAGING4PIBICS/packages/pkg_tminout.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/packages/pkg_tminout.pks
SELECT '@./DL_STAGING4PIBICS/packages/pkg_transcode.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/packages/pkg_transcode.pks
SELECT '@./DL_STAGING4PIBICS/synonyms/logger.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/synonyms/logger.sql
SELECT '@./DL_STAGING4PIBICS/synonyms/logger_logs_terse.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/synonyms/logger_logs_terse.sql
SELECT '@./DL_STAGING4PIBICS/package_bodies/pkg_crew.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/package_bodies/pkg_crew.pkb
SELECT '@./DL_STAGING4PIBICS/package_bodies/pkg_fs_fees.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/package_bodies/pkg_fs_fees.pkb
SELECT '@./DL_STAGING4PIBICS/package_bodies/pkg_fs_feesdetail.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/package_bodies/pkg_fs_feesdetail.pkb
SELECT '@./DL_STAGING4PIBICS/package_bodies/pkg_fs_fines.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/package_bodies/pkg_fs_fines.pkb
SELECT '@./DL_STAGING4PIBICS/package_bodies/pkg_fs_finesdetail.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/package_bodies/pkg_fs_finesdetail.pkb
SELECT '@./DL_STAGING4PIBICS/package_bodies/pkg_lostpassport.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/package_bodies/pkg_lostpassport.pkb
SELECT '@./DL_STAGING4PIBICS/package_bodies/pkg_operating.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/package_bodies/pkg_operating.pkb
SELECT '@./DL_STAGING4PIBICS/package_bodies/pkg_ops_transactional.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/package_bodies/pkg_ops_transactional.pkb
SELECT '@./DL_STAGING4PIBICS/package_bodies/pkg_thaipassport.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/package_bodies/pkg_thaipassport.pkb
SELECT '@./DL_STAGING4PIBICS/package_bodies/pkg_tminout.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/package_bodies/pkg_tminout.pkb
SELECT '@./DL_STAGING4PIBICS/package_bodies/pkg_tmmain.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/package_bodies/pkg_tmmain.pkb
SELECT '@./DL_STAGING4PIBICS/package_bodies/pkg_transcode.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/package_bodies/pkg_transcode.pkb
SELECT '@./DL_STAGING4PIBICS/package_bodies/pkg_utils.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/package_bodies/pkg_utils.pkb
SELECT '@./DL_STAGING4PIBICS/package_bodies/pkg_watchlist.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/package_bodies/pkg_watchlist.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/packages/pkg_bc_thaipassport.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/packages/pkg_bc_thaipassport.pks
SELECT '@./DL_STAGING4PIBICS_INTF/packages/pkg_bl_blacklist_cases.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/packages/pkg_bl_blacklist_cases.pks
SELECT '@./DL_STAGING4PIBICS_INTF/packages/pkg_operating.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/packages/pkg_operating.pks
SELECT '@./DL_STAGING4PIBICS_INTF/packages/pkg_ops_transactional.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/packages/pkg_ops_transactional.pks
SELECT '@./DL_STAGING4PIBICS_INTF/packages/pkg_st_lostpassport.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/packages/pkg_st_lostpassport.pks
SELECT '@./DL_STAGING4PIBICS_INTF/packages/pkg_st_thaipassport.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/packages/pkg_st_thaipassport.pks
SELECT '@./DL_STAGING4PIBICS_INTF/packages/pkg_st_tminout.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/packages/pkg_st_tminout.pks
SELECT '@./DL_STAGING4PIBICS_INTF/packages/pkg_st_tmmain.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/packages/pkg_st_tmmain.pks
SELECT '@./DL_STAGING4PIBICS_INTF/packages/pkg_st_watchlist.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/packages/pkg_st_watchlist.pks
SELECT '@./DL_STAGING4PIBICS_INTF/packages/pkg_sync_transcode.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/packages/pkg_sync_transcode.pks
SELECT '@./DL_STAGING4PIBICS_INTF/views/cnt_phase2_insert_yyyymm.vw' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/views/cnt_phase2_insert_yyyymm.vw
SELECT '@./DL_STAGING4PIBICS_INTF/procedures/keep_current.prc' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/procedures/keep_current.prc
SELECT '@./DL_STAGING4PIBICS_INTF/procedures/keep_current_by_wlcd.prc' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/procedures/keep_current_by_wlcd.prc
SELECT '@./DL_STAGING4PIBICS_INTF/procedures/keep_current2.prc' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/procedures/keep_current2.prc
SELECT '@./DL_STAGING4PIBICS_INTF/synonyms/logger.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/synonyms/logger.sql
SELECT '@./DL_STAGING4PIBICS_INTF/synonyms/logger_logs_terse.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/synonyms/logger_logs_terse.sql
SELECT '@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_bc_thaipassport.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_bc_thaipassport.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_operating.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_operating.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_ops_transactional.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_ops_transactional.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_preferences.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_preferences.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_st_lostpassport.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_st_lostpassport.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_st_thaipassport.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_st_thaipassport.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_st_watchlist.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_st_watchlist.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_utils.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_utils.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/procedures/transfer_meta_data.prc' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/procedures/transfer_meta_data.prc
SELECT '@./DL_USER_MANAGEMENT/materialized_views/apex_menu_permissions.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/materialized_views/apex_menu_permissions.sql
SELECT '@./DL_USER_MANAGEMENT/tables/computers\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/computers\\\$i18n.sql
SELECT '@./DL_USER_MANAGEMENT/triggers/computers\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/computers\\\$i18n\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/package_bodies/dl_ldap.pkb' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/package_bodies/dl_ldap.pkb
SELECT '@./DL_USER_MANAGEMENT/procedures/drop_db_obj.prc' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/procedures/drop_db_obj.prc
SELECT '@./DL_USER_MANAGEMENT/tables/grants\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/grants\\\$i18n.sql
SELECT '@./DL_USER_MANAGEMENT/triggers/grants\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/grants\\\$i18n\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/procedures/inst_db_obj.prc' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/procedures/inst_db_obj.prc
SELECT '@./DL_USER_MANAGEMENT/synonyms/logger.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/synonyms/logger.sql
SELECT '@./DL_USER_MANAGEMENT/synonyms/logger_logs_terse.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/synonyms/logger_logs_terse.sql
SELECT '@./DL_USER_MANAGEMENT/tables/lookups\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/lookups\\\$i18n.sql
SELECT '@./DL_USER_MANAGEMENT/triggers/lookups\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/lookups\\\$i18n\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/triggers/object_grant_rel.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/object_grant_rel.trg
SELECT '@./DL_USER_MANAGEMENT/tables/objects\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/objects\\\$i18n.sql
SELECT '@./DL_USER_MANAGEMENT/triggers/objects\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/objects\\\$i18n\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/tables/org_units.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/org_units.sql
SELECT '@./DL_USER_MANAGEMENT/tables/org_units\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/org_units\\\$i18n.sql
SELECT '@./DL_USER_MANAGEMENT/triggers/org_units\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/org_units\\\$i18n\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/triggers/org_units\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/org_units\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/tables/parameter_settings\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/parameter_settings\\\$i18n.sql
SELECT '@./DL_USER_MANAGEMENT/triggers/parameter_settings\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/parameter_settings\\\$i18n\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/tables/roles\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/roles\\\$i18n.sql
SELECT '@./DL_USER_MANAGEMENT/triggers/roles\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/roles\\\$i18n\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/tables/user_org_unit_rel.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/user_org_unit_rel.sql
SELECT '@./DL_USER_MANAGEMENT/views/user_org_unit_rel_pool.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/user_org_unit_rel_pool.vw
SELECT '@./DL_USER_MANAGEMENT/triggers/user_org_unit_rel\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/user_org_unit_rel\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/triggers/user_role_rel.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/user_role_rel.trg
SELECT '@./USER_MANAGEMENT/synonyms/lookups\\\$i18n.sql' AS ">" FROM DUAL;
@./USER_MANAGEMENT/synonyms/lookups\\\$i18n.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/computers\\\$i18n.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/computers\\\$i18n.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/grants\\\$i18n.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/grants\\\$i18n.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/lookups\\\$i18n.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/lookups\\\$i18n.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/objects\\\$i18n.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/objects\\\$i18n.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/org_units.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/org_units.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/org_units\\\$i18n.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/org_units\\\$i18n.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/parameter_settings\\\$i18n.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/parameter_settings\\\$i18n.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/roles\\\$i18n.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/roles\\\$i18n.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/user_org_unit_rel.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/user_org_unit_rel.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/user_org_unit_rel_pool.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/user_org_unit_rel_pool.sql
SELECT '@./DL_BLACKLIST/tables/biometrics.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/biometrics.sql
SELECT '@./DL_BLACKLIST/triggers/biometrics\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/biometrics\\\$biur.trg
SELECT '@./DL_BLACKLIST/tables/faces.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/faces.sql
SELECT '@./DL_BLACKLIST/triggers/faces\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/faces\\\$biur.trg
SELECT '@./DL_BLACKLIST/tables/fingerprints.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/fingerprints.sql
SELECT '@./DL_BLACKLIST/triggers/fingerprints\\\$biur.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/fingerprints\\\$biur.trg
SELECT '@./DL_BLACKLIST/tables/identities.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/identities.sql
SELECT '@./DL_BLACKLIST/tables/identities\\\$tag.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/identities\\\$tag.sql
SELECT '@./DL_BLACKLIST/triggers/identities\\\$tag\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/identities\\\$tag\\\$tiud0.trg
SELECT '@./DL_BLACKLIST/triggers/identities\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/identities\\\$tiud0.trg
SELECT '@./DL_BLACKLIST/synonyms/json.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/synonyms/json.sql
SELECT '@./DL_BLACKLIST/procedures/p_bk_keep_data_main.prc' AS ">" FROM DUAL;
@./DL_BLACKLIST/procedures/p_bk_keep_data_main.prc
SELECT '@./DL_BLACKLIST/package_bodies/pkg_dl_i18n.pkb' AS ">" FROM DUAL;
@./DL_BLACKLIST/package_bodies/pkg_dl_i18n.pkb
SELECT '@./DL_BLACKLIST/package_bodies/pkg_dl_plugin_ajax.pkb' AS ">" FROM DUAL;
@./DL_BLACKLIST/package_bodies/pkg_dl_plugin_ajax.pkb
SELECT '@./DL_BORDERCONTROL/synonyms/biometrics.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/biometrics.sql
SELECT '@./DL_BORDERCONTROL/tables/borderdocuments.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/borderdocuments.sql
SELECT '@./DL_BORDERCONTROL/tables/borderposts.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/borderposts.sql
SELECT '@./DL_BORDERCONTROL/tables/borderposts\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/borderposts\\\$i18n.sql
SELECT '@./DL_BORDERCONTROL/triggers/borderposts\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/borderposts\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/tables/country_management.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/country_management.sql
SELECT '@./DL_BORDERCONTROL/triggers/country_management\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/country_management\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/synonyms/faces.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/faces.sql
SELECT '@./DL_BORDERCONTROL/tables/faf_payment_rate\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/faf_payment_rate\\\$i18n.sql
SELECT '@./DL_BORDERCONTROL/tables/faf_permit_type\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/faf_permit_type\\\$i18n.sql
SELECT '@./DL_BORDERCONTROL/tables/identities.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/identities.sql
SELECT '@./DL_BORDERCONTROL/tables/incidents.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/incidents.sql
SELECT '@./DL_BORDERCONTROL/tables/person.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/person.sql
SELECT '@./DL_BORDERCONTROL/tables/residence.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/residence.sql
SELECT '@./DL_BORDERCONTROL/triggers/residence\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/residence\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/tables/terminals.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/terminals.sql
SELECT '@./DL_BORDERCONTROL/tables/terminals\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/terminals\\\$i18n.sql
SELECT '@./DL_BORDERCONTROL/triggers/terminals\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/terminals\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/views/v_isocountries.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/v_isocountries.vw
SELECT '@./DL_COMMON/packages/pkg_i18n.pks' AS ">" FROM DUAL;
@./DL_COMMON/packages/pkg_i18n.pks
SELECT '@./DL_COMMON/packages/pljson_ac.pks
CREATE PUBLIC SYNONYM PLJSON_AC FOR DL_COMMON.PLJSON_AC;
CREATE PUBLIC SYNONYM JSON_AC FOR DL_COMMON.PLJSON_AC;' AS ">" FROM DUAL;
@./DL_COMMON/packages/pljson_ac.pks
CREATE PUBLIC SYNONYM PLJSON_AC FOR DL_COMMON.PLJSON_AC;
CREATE PUBLIC SYNONYM JSON_AC FOR DL_COMMON.PLJSON_AC;
SELECT '@./DL_COMMON/packages/pljson_dyn.pks
CREATE PUBLIC SYNONYM PLJSON_DYN FOR DL_COMMON.PLJSON_DYN;
CREATE PUBLIC SYNONYM JSON_DYN FOR DL_COMMON.PLJSON_DYN;' AS ">" FROM DUAL;
@./DL_COMMON/packages/pljson_dyn.pks
CREATE PUBLIC SYNONYM PLJSON_DYN FOR DL_COMMON.PLJSON_DYN;
CREATE PUBLIC SYNONYM JSON_DYN FOR DL_COMMON.PLJSON_DYN;
SELECT '@./DL_COMMON/packages/pljson_ext.pks
CREATE PUBLIC SYNONYM PLJSON_EXT FOR DL_COMMON.PLJSON_EXT;
CREATE PUBLIC SYNONYM JSON_EXT FOR DL_COMMON.PLJSON_EXT;' AS ">" FROM DUAL;
@./DL_COMMON/packages/pljson_ext.pks
CREATE PUBLIC SYNONYM PLJSON_EXT FOR DL_COMMON.PLJSON_EXT;
CREATE PUBLIC SYNONYM JSON_EXT FOR DL_COMMON.PLJSON_EXT;
SELECT '@./DL_COMMON/packages/pljson_helper.pks
CREATE PUBLIC SYNONYM PLJSON_HELPER FOR DL_COMMON.PLJSON_HELPER;
CREATE PUBLIC SYNONYM JSON_HELPER FOR DL_COMMON.PLJSON_HELPER;' AS ">" FROM DUAL;
@./DL_COMMON/packages/pljson_helper.pks
CREATE PUBLIC SYNONYM PLJSON_HELPER FOR DL_COMMON.PLJSON_HELPER;
CREATE PUBLIC SYNONYM JSON_HELPER FOR DL_COMMON.PLJSON_HELPER;
SELECT '@./DL_COMMON/packages/pljson_parser.pks
CREATE PUBLIC SYNONYM PLJSON_PARSER FOR DL_COMMON.PLJSON_PARSER;
CREATE PUBLIC SYNONYM JSON_PARSER FOR DL_COMMON.PLJSON_PARSER;' AS ">" FROM DUAL;
@./DL_COMMON/packages/pljson_parser.pks
CREATE PUBLIC SYNONYM PLJSON_PARSER FOR DL_COMMON.PLJSON_PARSER;
CREATE PUBLIC SYNONYM JSON_PARSER FOR DL_COMMON.PLJSON_PARSER;
SELECT '@./DL_COMMON/packages/pljson_printer.pks
CREATE PUBLIC SYNONYM PLJSON_PRINTER FOR DL_COMMON.PLJSON_PRINTER;
CREATE PUBLIC SYNONYM JSON_PRINTER FOR DL_COMMON.PLJSON_PRINTER;' AS ">" FROM DUAL;
@./DL_COMMON/packages/pljson_printer.pks
CREATE PUBLIC SYNONYM PLJSON_PRINTER FOR DL_COMMON.PLJSON_PRINTER;
CREATE PUBLIC SYNONYM JSON_PRINTER FOR DL_COMMON.PLJSON_PRINTER;
SELECT '@./DL_COMMON/packages/pljson_xml.pks
CREATE PUBLIC SYNONYM PLJSON_XML FOR DL_COMMON.PLJSON_XML;
CREATE PUBLIC SYNONYM JSON_XML FOR DL_COMMON.PLJSON_XML;' AS ">" FROM DUAL;
@./DL_COMMON/packages/pljson_xml.pks
CREATE PUBLIC SYNONYM PLJSON_XML FOR DL_COMMON.PLJSON_XML;
CREATE PUBLIC SYNONYM JSON_XML FOR DL_COMMON.PLJSON_XML;
SELECT '@./DL_COMMON/tables/action_codes\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/action_codes\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/action_codes\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/action_codes\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/action_codes\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/action_codes\\\$lc.vw
SELECT '@./DL_COMMON/tables/airports.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/airports.sql
SELECT '@./DL_COMMON/tables/airports\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/airports\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/airports\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/airports\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/airports\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/airports\\\$lc.vw
SELECT '@./DL_COMMON/triggers/airports\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/airports\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/apex_menu\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/apex_menu\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/apex_menu\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/apex_menu\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/apex_menu\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/apex_menu\\\$lc.vw
SELECT '@./DL_COMMON/tables/arrested_statuses\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/arrested_statuses\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/arrested_statuses\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/arrested_statuses\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/arrested_statuses\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/arrested_statuses\\\$lc.vw
SELECT '@./DL_COMMON/tables/arrested_types\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/arrested_types\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/arrested_types\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/arrested_types\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/arrested_types\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/arrested_types\\\$lc.vw
SELECT '@./DL_COMMON/tables/bc_doc_class.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/bc_doc_class.sql
SELECT '@./DL_COMMON/tables/bc_doc_class\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/bc_doc_class\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/bc_doc_class\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/bc_doc_class\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/bc_doc_class\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/bc_doc_class\\\$lc.vw
SELECT '@./DL_COMMON/triggers/bc_doc_class\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/bc_doc_class\\\$tiud0.trg
SELECT '@./DL_COMMON/synonyms/bc_doc_types.sql' AS ">" FROM DUAL;
@./DL_COMMON/synonyms/bc_doc_types.sql
SELECT '@./DL_COMMON/tables/bc_person_types\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/bc_person_types\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/bc_person_types\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/bc_person_types\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/bc_person_types\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/bc_person_types\\\$lc.vw
SELECT '@./DL_COMMON/tables/b_list_reasons\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/b_list_reasons\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/b_list_reasons\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/b_list_reasons\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/b_list_reasons\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/b_list_reasons\\\$lc.vw
SELECT '@./DL_COMMON/tables/bools\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/bools\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/bools\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/bools\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/bools\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/bools\\\$lc.vw
SELECT '@./DL_COMMON/tables/border_types\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/border_types\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/border_types\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/border_types\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/border_types\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/border_types\\\$lc.vw
SELECT '@./DL_COMMON/tables/bs_relationships\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/bs_relationships\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/bs_relationships\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/bs_relationships\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/bs_relationships\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/bs_relationships\\\$lc.vw
SELECT '@./DL_COMMON/tables/card_types\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/card_types\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/card_types\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/card_types\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/card_types\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/card_types\\\$lc.vw
SELECT '@./DL_COMMON/tables/carriers.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/carriers.sql
SELECT '@./DL_COMMON/tables/carriers\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/carriers\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/carriers\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/carriers\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/carriers\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/carriers\\\$lc.vw
SELECT '@./DL_COMMON/triggers/carriers\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/carriers\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/case_types\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/case_types\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/case_types\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/case_types\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/case_types\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/case_types\\\$lc.vw
SELECT '@./DL_COMMON/views/continents\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/continents\\\$lc.vw
SELECT '@./DL_COMMON/tables/countries\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/countries\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/countries\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/countries\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/countries\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/countries\\\$lc.vw
SELECT '@./DL_COMMON/tables/device_types\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/device_types\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/device_types\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/device_types\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/device_types\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/device_types\\\$lc.vw
SELECT '@./DL_COMMON/tables/entry_exits\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/entry_exits\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/entry_exits\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/entry_exits\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/entry_exits\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/entry_exits\\\$lc.vw
SELECT '@./DL_COMMON/functions/f_blob_to_clob.fnc' AS ">" FROM DUAL;
@./DL_COMMON/functions/f_blob_to_clob.fnc
SELECT '@./DL_COMMON/functions/f_blob_to_clob_base64.fnc' AS ">" FROM DUAL;
@./DL_COMMON/functions/f_blob_to_clob_base64.fnc
SELECT '@./DL_COMMON/functions/f_concat_clob.fnc' AS ">" FROM DUAL;
@./DL_COMMON/functions/f_concat_clob.fnc
SELECT '@./DL_COMMON/functions/f_concat_clob2.fnc' AS ">" FROM DUAL;
@./DL_COMMON/functions/f_concat_clob2.fnc
SELECT '@./DL_COMMON/tables/finger_miss_reasons\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/finger_miss_reasons\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/finger_miss_reasons\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/finger_miss_reasons\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/finger_miss_reasons\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/finger_miss_reasons\\\$lc.vw
SELECT '@./DL_COMMON/tables/finger_status\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/finger_status\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/finger_status\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/finger_status\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/finger_status\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/finger_status\\\$lc.vw
SELECT '@./DL_COMMON/tables/human_fingers\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/human_fingers\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/human_fingers\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/human_fingers\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/human_fingers\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/human_fingers\\\$lc.vw
SELECT '@./DL_COMMON/tables/human_sexes\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/human_sexes\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/human_sexes\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/human_sexes\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/human_sexes\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/human_sexes\\\$lc.vw
SELECT '@./DL_COMMON/tables/icao_dc_list_itms.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/icao_dc_list_itms.sql
SELECT '@./DL_COMMON/triggers/icao_dc_list_itms\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/icao_dc_list_itms\\\$tiud0.trg
SELECT '@./DL_COMMON/tables/icao_dc_lists\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/icao_dc_lists\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/icao_dc_lists\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/icao_dc_lists\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/icao_dc_lists\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/icao_dc_lists\\\$lc.vw
SELECT '@./DL_COMMON/tables/icao_doc_codes\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/icao_doc_codes\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/icao_doc_codes\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/icao_doc_codes\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/icao_doc_codes\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/icao_doc_codes\\\$lc.vw
SELECT '@./DL_COMMON/tables/incident_types\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/incident_types\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/incident_types\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/incident_types\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/incident_types\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/incident_types\\\$lc.vw
SELECT '@./DL_COMMON/tables/languages\\\$i18n.sql' AS ">" FROM DUAL;
@./DL_COMMON/tables/languages\\\$i18n.sql
SELECT '@./DL_COMMON/triggers/languages\\\$i18n\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_COMMON/triggers/languages\\\$i18n\\\$tiud0.trg
SELECT '@./DL_COMMON/views/languages\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/languages\\\$lc.vw
SELECT '@./DL_COMMON/views/locales\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/locales\\\$lc.vw
SELECT '@./DL_COMMON/views/messages#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/messages#i18n.vw
SELECT '@./DL_COMMON/views/messages\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/messages\\\$lc.vw
SELECT '@./DL_COMMON/views/movement_reasons#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/movement_reasons#i18n.vw
SELECT '@./DL_COMMON/views/movement_reasons\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/movement_reasons\\\$lc.vw
SELECT '@./DL_COMMON/views/owners#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/owners#i18n.vw
SELECT '@./DL_COMMON/views/owners\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/owners\\\$lc.vw
SELECT '@./DL_COMMON/views/permit_types#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/permit_types#i18n.vw
SELECT '@./DL_COMMON/views/permit_types\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/permit_types\\\$lc.vw
SELECT '@./DL_COMMON/package_bodies/pkg_i18n.pkb' AS ">" FROM DUAL;
@./DL_COMMON/package_bodies/pkg_i18n.pkb
SELECT '@./DL_COMMON/package_bodies/pljson_ac.pkb
CREATE PUBLIC SYNONYM PLJSON_AC FOR DL_COMMON.PLJSON_AC;
CREATE PUBLIC SYNONYM JSON_AC FOR DL_COMMON.PLJSON_AC;' AS ">" FROM DUAL;
@./DL_COMMON/package_bodies/pljson_ac.pkb
CREATE PUBLIC SYNONYM PLJSON_AC FOR DL_COMMON.PLJSON_AC;
CREATE PUBLIC SYNONYM JSON_AC FOR DL_COMMON.PLJSON_AC;
SELECT '@./DL_COMMON/package_bodies/pljson_dyn.pkb
CREATE PUBLIC SYNONYM PLJSON_DYN FOR DL_COMMON.PLJSON_DYN;
CREATE PUBLIC SYNONYM JSON_DYN FOR DL_COMMON.PLJSON_DYN;' AS ">" FROM DUAL;
@./DL_COMMON/package_bodies/pljson_dyn.pkb
CREATE PUBLIC SYNONYM PLJSON_DYN FOR DL_COMMON.PLJSON_DYN;
CREATE PUBLIC SYNONYM JSON_DYN FOR DL_COMMON.PLJSON_DYN;
SELECT '@./DL_COMMON/package_bodies/pljson_ext.pkb
CREATE PUBLIC SYNONYM PLJSON_EXT FOR DL_COMMON.PLJSON_EXT;
CREATE PUBLIC SYNONYM JSON_EXT FOR DL_COMMON.PLJSON_EXT;' AS ">" FROM DUAL;
@./DL_COMMON/package_bodies/pljson_ext.pkb
CREATE PUBLIC SYNONYM PLJSON_EXT FOR DL_COMMON.PLJSON_EXT;
CREATE PUBLIC SYNONYM JSON_EXT FOR DL_COMMON.PLJSON_EXT;
SELECT '@./DL_COMMON/package_bodies/pljson_helper.pkb
CREATE PUBLIC SYNONYM PLJSON_HELPER FOR DL_COMMON.PLJSON_HELPER;
CREATE PUBLIC SYNONYM JSON_HELPER FOR DL_COMMON.PLJSON_HELPER;' AS ">" FROM DUAL;
@./DL_COMMON/package_bodies/pljson_helper.pkb
CREATE PUBLIC SYNONYM PLJSON_HELPER FOR DL_COMMON.PLJSON_HELPER;
CREATE PUBLIC SYNONYM JSON_HELPER FOR DL_COMMON.PLJSON_HELPER;
SELECT '@./DL_COMMON/package_bodies/pljson_parser.pkb
CREATE PUBLIC SYNONYM PLJSON_PARSER FOR DL_COMMON.PLJSON_PARSER;
CREATE PUBLIC SYNONYM JSON_PARSER FOR DL_COMMON.PLJSON_PARSER;' AS ">" FROM DUAL;
@./DL_COMMON/package_bodies/pljson_parser.pkb
CREATE PUBLIC SYNONYM PLJSON_PARSER FOR DL_COMMON.PLJSON_PARSER;
CREATE PUBLIC SYNONYM JSON_PARSER FOR DL_COMMON.PLJSON_PARSER;
SELECT '@./DL_COMMON/package_bodies/pljson_printer.pkb
CREATE PUBLIC SYNONYM PLJSON_PRINTER FOR DL_COMMON.PLJSON_PRINTER;
CREATE PUBLIC SYNONYM JSON_PRINTER FOR DL_COMMON.PLJSON_PRINTER;' AS ">" FROM DUAL;
@./DL_COMMON/package_bodies/pljson_printer.pkb
CREATE PUBLIC SYNONYM PLJSON_PRINTER FOR DL_COMMON.PLJSON_PRINTER;
CREATE PUBLIC SYNONYM JSON_PRINTER FOR DL_COMMON.PLJSON_PRINTER;
SELECT '@./DL_COMMON/synonyms/pljson_table.sql
CREATE PUBLIC SYNONYM JSON_TABLE FOR DL_COMMON.PLJSON_TABLE;' AS ">" FROM DUAL;
@./DL_COMMON/synonyms/pljson_table.sql
CREATE PUBLIC SYNONYM JSON_TABLE FOR DL_COMMON.PLJSON_TABLE;
SELECT '@./DL_COMMON/package_bodies/pljson_xml.pkb
CREATE PUBLIC SYNONYM PLJSON_XML FOR DL_COMMON.PLJSON_XML;
CREATE PUBLIC SYNONYM JSON_XML FOR DL_COMMON.PLJSON_XML;' AS ">" FROM DUAL;
@./DL_COMMON/package_bodies/pljson_xml.pkb
CREATE PUBLIC SYNONYM PLJSON_XML FOR DL_COMMON.PLJSON_XML;
CREATE PUBLIC SYNONYM JSON_XML FOR DL_COMMON.PLJSON_XML;
SELECT '@./DL_COMMON/views/port_movements#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/port_movements#i18n.vw
SELECT '@./DL_COMMON/views/port_movements\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/port_movements\\\$lc.vw
SELECT '@./DL_COMMON/views/ports#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/ports#i18n.vw
SELECT '@./DL_COMMON/views/ports\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/ports\\\$lc.vw
SELECT '@./DL_COMMON/views/professions#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/professions#i18n.vw
SELECT '@./DL_COMMON/views/professions\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/professions\\\$lc.vw
SELECT '@./DL_COMMON/views/reason_codes#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/reason_codes#i18n.vw
SELECT '@./DL_COMMON/views/reason_codes\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/reason_codes\\\$lc.vw
SELECT '@./DL_COMMON/views/relations\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/relations\\\$lc.vw
SELECT '@./DL_COMMON/views/salutations#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/salutations#i18n.vw
SELECT '@./DL_COMMON/views/salutations\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/salutations\\\$lc.vw
SELECT '@./DL_COMMON/views/secret_levels#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/secret_levels#i18n.vw
SELECT '@./DL_COMMON/views/secret_levels\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/secret_levels\\\$lc.vw
SELECT '@./DL_COMMON/views/statuses#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/statuses#i18n.vw
SELECT '@./DL_COMMON/views/statuses\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/statuses\\\$lc.vw
SELECT '@./DL_COMMON/views/sub_nationalities#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/sub_nationalities#i18n.vw
SELECT '@./DL_COMMON/views/sub_nationalities\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/sub_nationalities\\\$lc.vw
SELECT '@./DL_COMMON/views/trans_grp_states#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/trans_grp_states#i18n.vw
SELECT '@./DL_COMMON/views/trans_grp_states\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/trans_grp_states\\\$lc.vw
SELECT '@./DL_COMMON/views/trans_modes#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/trans_modes#i18n.vw
SELECT '@./DL_COMMON/views/trans_modes\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/trans_modes\\\$lc.vw
SELECT '@./DL_COMMON/views/trans_vehicles#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/trans_vehicles#i18n.vw
SELECT '@./DL_COMMON/views/trans_vehicles\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/trans_vehicles\\\$lc.vw
SELECT '@./DL_COMMON/views/visa_types#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/visa_types#i18n.vw
SELECT '@./DL_COMMON/views/visa_types\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/visa_types\\\$lc.vw
SELECT '@./DL_COMMON/views/yes_nos#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/yes_nos#i18n.vw
SELECT '@./DL_COMMON/views/yes_nos\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/yes_nos\\\$lc.vw
SELECT '@./DL_DBA/views/templates#i18n.vw' AS ">" FROM DUAL;
@./DL_DBA/views/templates#i18n.vw
SELECT '@./DL_DBA/views/templates\\\$lc.vw' AS ">" FROM DUAL;
@./DL_DBA/views/templates\\\$lc.vw
SELECT '@./DL_STAGING4PIBICS/package_bodies/pkg_sync_residents.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS/package_bodies/pkg_sync_residents.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/procedures/load_phase1.prc' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/procedures/load_phase1.prc
SELECT '@./DL_STAGING4PIBICS_INTF/procedures/load_phase2.prc' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/procedures/load_phase2.prc
SELECT '@./DL_STAGING4PIBICS_INTF/procedures/load_tmmain.prc' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/procedures/load_tmmain.prc
SELECT '@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_hacks.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_hacks.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_transcode.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_transcode.pkb
SELECT '@./DL_USER_MANAGEMENT/tables/computer_org_unit_rel.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/computer_org_unit_rel.sql
SELECT '@./DL_USER_MANAGEMENT/views/computer_org_unit_rel_pool.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/computer_org_unit_rel_pool.vw
SELECT '@./DL_USER_MANAGEMENT/triggers/computer_org_unit_rel\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/computer_org_unit_rel\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/views/computers#i18n.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/computers#i18n.vw
SELECT '@./DL_USER_MANAGEMENT/views/computers\\\$lc.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/computers\\\$lc.vw
SELECT '@./DL_USER_MANAGEMENT/views/grants#i18n.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/grants#i18n.vw
SELECT '@./DL_USER_MANAGEMENT/views/grants\\\$lc.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/grants\\\$lc.vw
SELECT '@./DL_USER_MANAGEMENT/views/lookups#i18n.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/lookups#i18n.vw
SELECT '@./DL_USER_MANAGEMENT/views/lookups\\\$lc.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/lookups\\\$lc.vw
SELECT '@./DL_USER_MANAGEMENT/views/objects#i18n.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/objects#i18n.vw
SELECT '@./DL_USER_MANAGEMENT/views/objects\\\$lc.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/objects\\\$lc.vw
SELECT '@./DL_USER_MANAGEMENT/views/org_unit_org_unit_org_units_pool.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/org_unit_org_unit_org_units_pool.vw
SELECT '@./DL_USER_MANAGEMENT/tables/org_unit_org_unit_rel.sql' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/tables/org_unit_org_unit_rel.sql
SELECT '@./DL_USER_MANAGEMENT/views/org_unit_org_unit_rel_pool.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/org_unit_org_unit_rel_pool.vw
SELECT '@./DL_USER_MANAGEMENT/triggers/org_unit_org_unit_rel\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/triggers/org_unit_org_unit_rel\\\$tiud0.trg
SELECT '@./DL_USER_MANAGEMENT/views/org_unit_pool.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/org_unit_pool.vw
SELECT '@./DL_USER_MANAGEMENT/views/org_units#i18n.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/org_units#i18n.vw
SELECT '@./DL_USER_MANAGEMENT/views/org_units\\\$lc.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/org_units\\\$lc.vw
SELECT '@./DL_USER_MANAGEMENT/views/parameter_settings#i18n.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/parameter_settings#i18n.vw
SELECT '@./DL_USER_MANAGEMENT/views/parameter_settings\\\$lc.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/parameter_settings\\\$lc.vw
SELECT '@./DL_USER_MANAGEMENT/package_bodies/pkg_authorization.pkb' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/package_bodies/pkg_authorization.pkb
SELECT '@./DL_USER_MANAGEMENT/package_bodies/pkg_man_users.pkb' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/package_bodies/pkg_man_users.pkb
SELECT '@./DL_USER_MANAGEMENT/views/roles#i18n.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/roles#i18n.vw
SELECT '@./DL_USER_MANAGEMENT/views/roles\\\$lc.vw' AS ">" FROM DUAL;
@./DL_USER_MANAGEMENT/views/roles\\\$lc.vw
SELECT '@./APEX_USER_MANAGEMENT/synonyms/computer_org_unit_rel.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/computer_org_unit_rel.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/computer_org_unit_rel_pool.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/computer_org_unit_rel_pool.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/computers#i18n.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/computers#i18n.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/computers\\\$lc.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/computers\\\$lc.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/grants#i18n.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/grants#i18n.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/grants\\\$lc.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/grants\\\$lc.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/lookups#i18n.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/lookups#i18n.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/lookups\\\$lc.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/lookups\\\$lc.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/objects#i18n.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/objects#i18n.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/objects\\\$lc.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/objects\\\$lc.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/org_unit_org_unit_org_units_pool.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/org_unit_org_unit_org_units_pool.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/org_unit_org_unit_rel.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/org_unit_org_unit_rel.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/org_unit_org_unit_rel_pool.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/org_unit_org_unit_rel_pool.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/org_unit_pool.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/org_unit_pool.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/org_units#i18n.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/org_units#i18n.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/org_units\\\$lc.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/org_units\\\$lc.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/parameter_settings#i18n.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/parameter_settings#i18n.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/parameter_settings\\\$lc.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/parameter_settings\\\$lc.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/roles#i18n.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/roles#i18n.sql
SELECT '@./APEX_USER_MANAGEMENT/synonyms/roles\\\$lc.sql' AS ">" FROM DUAL;
@./APEX_USER_MANAGEMENT/synonyms/roles\\\$lc.sql
SELECT '@./DL_BLACKLIST/tables/addresses.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/addresses.sql
SELECT '@./DL_BLACKLIST/views/biometrics_summary.vw' AS ">" FROM DUAL;
@./DL_BLACKLIST/views/biometrics_summary.vw
SELECT '@./DL_BLACKLIST/tables/blacklist_case_identities.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/blacklist_case_identities.sql
SELECT '@./DL_BLACKLIST/views/identities#tag.vw' AS ">" FROM DUAL;
@./DL_BLACKLIST/views/identities#tag.vw
SELECT '@./DL_BLACKLIST/tables/travel_docs.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/travel_docs.sql
SELECT '@./DL_BLACKLIST/tables/travel_docs\\\$tag.sql' AS ">" FROM DUAL;
@./DL_BLACKLIST/tables/travel_docs\\\$tag.sql
SELECT '@./DL_BLACKLIST/triggers/travel_docs\\\$tag\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/travel_docs\\\$tag\\\$tiud0.trg
SELECT '@./DL_BLACKLIST/triggers/travel_docs\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/travel_docs\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/packages/pkg_apex_util.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/pkg_apex_util.pks
SELECT '@./DL_BORDERCONTROL/packages/pkg_blacklist_util.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/pkg_blacklist_util.pks
SELECT '@./DL_BORDERCONTROL/packages/pkg_borderdocuments.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/pkg_borderdocuments.pks
SELECT '@./DL_BORDERCONTROL/packages/pkg_common.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/pkg_common.pks
SELECT '@./DL_BORDERCONTROL/packages/pkg_identities.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/pkg_identities.pks
SELECT '@./DL_BORDERCONTROL/packages/pkg_incidents.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/pkg_incidents.pks
SELECT '@./DL_BORDERCONTROL/views/adm_class_district\\\$lc.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/adm_class_district\\\$lc.vw
SELECT '@./DL_BORDERCONTROL/views/adm_class_province\\\$lc.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/adm_class_province\\\$lc.vw
SELECT '@./DL_BORDERCONTROL/views/adm_class_region\\\$lc.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/adm_class_region\\\$lc.vw
SELECT '@./DL_BORDERCONTROL/views/adm_class_subdistrict\\\$lc.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/adm_class_subdistrict\\\$lc.vw
SELECT '@./DL_BORDERCONTROL/synonyms/blacklist_case_identities.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/synonyms/blacklist_case_identities.sql
SELECT '@./DL_BORDERCONTROL/tables/borderdocimages.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/borderdocimages.sql
SELECT '@./DL_BORDERCONTROL/triggers/borderdocimages\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/borderdocimages\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/triggers/borderdocuments\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/borderdocuments\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/views/borderposts#i18n.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/borderposts#i18n.vw
SELECT '@./DL_BORDERCONTROL/views/borderposts\\\$lc.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/borderposts\\\$lc.vw
SELECT '@./DL_BORDERCONTROL/package_bodies/dl_ldap.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/dl_ldap.pkb
SELECT '@./DL_BORDERCONTROL/triggers/entry_forms\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/entry_forms\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/tables/faf_fees_and_fines.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/faf_fees_and_fines.sql
SELECT '@./DL_BORDERCONTROL/tables/faf_fees_and_fines_details.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/faf_fees_and_fines_details.sql
SELECT '@./DL_BORDERCONTROL/views/faf_payment_rate#i18n.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/faf_payment_rate#i18n.vw
SELECT '@./DL_BORDERCONTROL/views/faf_payment_rate\\\$lc.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/faf_payment_rate\\\$lc.vw
SELECT '@./DL_BORDERCONTROL/views/faf_permit_type#i18n.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/faf_permit_type#i18n.vw
SELECT '@./DL_BORDERCONTROL/views/faf_permit_type\\\$lc.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/faf_permit_type\\\$lc.vw
SELECT '@./DL_BORDERCONTROL/tables/fellow_passenger.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/fellow_passenger.sql
SELECT '@./DL_BORDERCONTROL/triggers/fellow_passenger\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/fellow_passenger\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/tables/flights.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/flights.sql
SELECT '@./DL_BORDERCONTROL/triggers/flights\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/flights\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/triggers/flighttypes\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/flighttypes\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/triggers/incidents\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/incidents\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/views/lov_adm_class_district.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/lov_adm_class_district.vw
SELECT '@./DL_BORDERCONTROL/views/lov_adm_class_province.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/lov_adm_class_province.vw
SELECT '@./DL_BORDERCONTROL/views/lov_adm_class_region.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/lov_adm_class_region.vw
SELECT '@./DL_BORDERCONTROL/views/lov_adm_class_subdistrict.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/lov_adm_class_subdistrict.vw
SELECT '@./DL_BORDERCONTROL/views/lov_countries.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/lov_countries.vw
SELECT '@./DL_BORDERCONTROL/views/lov_owners.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/lov_owners.vw
SELECT '@./DL_BORDERCONTROL/views/lov_payment_rate.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/lov_payment_rate.vw
SELECT '@./DL_BORDERCONTROL/views/lov_permit_type.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/lov_permit_type.vw
SELECT '@./DL_BORDERCONTROL/views/lov_professions.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/lov_professions.vw
SELECT '@./DL_BORDERCONTROL/views/lov_receipt_numbers.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/lov_receipt_numbers.vw
SELECT '@./DL_BORDERCONTROL/views/lov_relations.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/lov_relations.vw
SELECT '@./DL_BORDERCONTROL/views/lov_salutations.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/lov_salutations.vw
SELECT '@./DL_BORDERCONTROL/views/lov_statuses.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/lov_statuses.vw
SELECT '@./DL_BORDERCONTROL/views/lov_trans_vehicles.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/lov_trans_vehicles.vw
SELECT '@./DL_BORDERCONTROL/package_bodies/pkg_abis_util.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/pkg_abis_util.pkb
SELECT '@./DL_BORDERCONTROL/package_bodies/pkg_apex_util.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/pkg_apex_util.pkb
SELECT '@./DL_BORDERCONTROL/package_bodies/pkg_blacklist_util.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/pkg_blacklist_util.pkb
SELECT '@./DL_BORDERCONTROL/package_bodies/pkg_common.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/pkg_common.pkb
SELECT '@./DL_BORDERCONTROL/package_bodies/pkg_identities.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/pkg_identities.pkb
SELECT '@./DL_BORDERCONTROL/package_bodies/pkg_incidents.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/pkg_incidents.pkb
SELECT '@./DL_BORDERCONTROL/package_bodies/pkg_messages.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/pkg_messages.pkb
SELECT '@./DL_BORDERCONTROL/views/rep_faf_fees_and_fines.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/rep_faf_fees_and_fines.vw
SELECT '@./DL_BORDERCONTROL/views/rep_faf_payment_rate.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/rep_faf_payment_rate.vw
SELECT '@./DL_BORDERCONTROL/views/rep_fellow_passenger.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/rep_fellow_passenger.vw
SELECT '@./DL_BORDERCONTROL/views/rep_receipt_fine.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/rep_receipt_fine.vw
SELECT '@./DL_BORDERCONTROL/views/rep_voa_fellow_passenger_preview.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/rep_voa_fellow_passenger_preview.vw
SELECT '@./DL_BORDERCONTROL/views/terminals#i18n.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/terminals#i18n.vw
SELECT '@./DL_BORDERCONTROL/views/terminals\\\$lc.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/terminals\\\$lc.vw
SELECT '@./DL_BORDERCONTROL/views/v_borderocuments.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/v_borderocuments.vw
SELECT '@./DL_BORDERCONTROL/tables/visas.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/visas.sql
SELECT '@./DL_BORDERCONTROL/triggers/visas\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/visas\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/views/v_visas.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/v_visas.vw
SELECT '@./DL_BORDERCONTROL_DATAMART/package_bodies/pkg_reporting.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/package_bodies/pkg_reporting.pkb
SELECT '@./DL_COMMON/views/action_codes#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/action_codes#i18n.vw
SELECT '@./DL_COMMON/views/airports#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/airports#i18n.vw
SELECT '@./DL_COMMON/views/apex_menu#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/apex_menu#i18n.vw
SELECT '@./DL_COMMON/views/arrested_statuses#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/arrested_statuses#i18n.vw
SELECT '@./DL_COMMON/views/arrested_types#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/arrested_types#i18n.vw
SELECT '@./DL_COMMON/views/bc_doc_class#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/bc_doc_class#i18n.vw
SELECT '@./DL_COMMON/views/bc_person_types#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/bc_person_types#i18n.vw
SELECT '@./DL_COMMON/views/b_list_reasons#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/b_list_reasons#i18n.vw
SELECT '@./DL_COMMON/views/bools#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/bools#i18n.vw
SELECT '@./DL_COMMON/views/border_types#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/border_types#i18n.vw
SELECT '@./DL_COMMON/views/bs_relationships#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/bs_relationships#i18n.vw
SELECT '@./DL_COMMON/views/card_types#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/card_types#i18n.vw
SELECT '@./DL_COMMON/views/carriers#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/carriers#i18n.vw
SELECT '@./DL_COMMON/views/case_types#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/case_types#i18n.vw
SELECT '@./DL_COMMON/views/countries#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/countries#i18n.vw
SELECT '@./DL_COMMON/views/device_types#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/device_types#i18n.vw
SELECT '@./DL_COMMON/views/entry_exits#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/entry_exits#i18n.vw
SELECT '@./DL_COMMON/views/finger_miss_reasons#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/finger_miss_reasons#i18n.vw
SELECT '@./DL_COMMON/views/finger_status#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/finger_status#i18n.vw
SELECT '@./DL_COMMON/views/human_fingers#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/human_fingers#i18n.vw
SELECT '@./DL_COMMON/views/human_sexes#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/human_sexes#i18n.vw
SELECT '@./DL_COMMON/views/icao_dc_lists#itms\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/icao_dc_lists#itms\\\$lc.vw
SELECT '@./DL_COMMON/views/icao_dc_lists#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/icao_dc_lists#i18n.vw
SELECT '@./DL_COMMON/views/icao_doc_codes#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/icao_doc_codes#i18n.vw
SELECT '@./DL_COMMON/views/incident_types#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/incident_types#i18n.vw
SELECT '@./DL_COMMON/views/languages#i18n.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/languages#i18n.vw
SELECT '@./DL_COMMON/views/port_movements#icao_dc_itms\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/port_movements#icao_dc_itms\\\$lc.vw
SELECT '@./DL_COMMON/views/visa_types#icao_dc_itms\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/visa_types#icao_dc_itms\\\$lc.vw
SELECT '@./DL_COMMON/views/visa_types#icao_doc_codes\\\$lc.vw' AS ">" FROM DUAL;
@./DL_COMMON/views/visa_types#icao_doc_codes\\\$lc.vw
SELECT '@./DL_STAGING4PIBICS_INTF/views/bc_faf4pibics.vw' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/views/bc_faf4pibics.vw
SELECT '@./DL_STAGING4PIBICS_INTF/views/bc_faf4pibics_details.vw' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/views/bc_faf4pibics_details.vw
SELECT '@./DL_STAGING4PIBICS_INTF/views/bc_voa4pibics.vw' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/views/bc_voa4pibics.vw
SELECT '@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_bl_blacklist_cases.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_bl_blacklist_cases.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_sync_transcode.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_sync_transcode.pkb
SELECT '@./DL_BLACKLIST/packages/pkg_db_access.pks' AS ">" FROM DUAL;
@./DL_BLACKLIST/packages/pkg_db_access.pks
SELECT '@./DL_BLACKLIST/views/identities_cases_travel_docs_mod.vw' AS ">" FROM DUAL;
@./DL_BLACKLIST/views/identities_cases_travel_docs_mod.vw
SELECT '@./DL_BLACKLIST/views/lost_passports_for_existence_check.vw' AS ">" FROM DUAL;
@./DL_BLACKLIST/views/lost_passports_for_existence_check.vw
SELECT '@./DL_BLACKLIST/views/lov_adm_class_district.vw' AS ">" FROM DUAL;
@./DL_BLACKLIST/views/lov_adm_class_district.vw
SELECT '@./DL_BLACKLIST/views/lov_adm_class_province.vw' AS ">" FROM DUAL;
@./DL_BLACKLIST/views/lov_adm_class_province.vw
SELECT '@./DL_BLACKLIST/views/lov_adm_class_subdistrict.vw' AS ">" FROM DUAL;
@./DL_BLACKLIST/views/lov_adm_class_subdistrict.vw
SELECT '@./DL_BLACKLIST/package_bodies/pkg_db_access.pkb' AS ">" FROM DUAL;
@./DL_BLACKLIST/package_bodies/pkg_db_access.pkb
SELECT '@./DL_BLACKLIST/package_bodies/pkg_keep_blacklist_data.pkb' AS ">" FROM DUAL;
@./DL_BLACKLIST/package_bodies/pkg_keep_blacklist_data.pkb
SELECT '@./DL_BLACKLIST/package_bodies/pkg_operating.pkb' AS ">" FROM DUAL;
@./DL_BLACKLIST/package_bodies/pkg_operating.pkb
SELECT '@./DL_BLACKLIST/package_bodies/pkg_search.pkb' AS ">" FROM DUAL;
@./DL_BLACKLIST/package_bodies/pkg_search.pkb
SELECT '@./DL_BLACKLIST/package_bodies/pkg_search_new.pkb' AS ">" FROM DUAL;
@./DL_BLACKLIST/package_bodies/pkg_search_new.pkb
SELECT '@./DL_BLACKLIST/views/travel_docs#tag.vw' AS ">" FROM DUAL;
@./DL_BLACKLIST/views/travel_docs#tag.vw
SELECT '@./DL_BLACKLIST/triggers/trg_iou_v_blacklist_cases.trg' AS ">" FROM DUAL;
@./DL_BLACKLIST/triggers/trg_iou_v_blacklist_cases.trg
SELECT '@./DL_BORDERCONTROL/packages/pkg_apex_fee_and_fine.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/pkg_apex_fee_and_fine.pks
SELECT '@./DL_BORDERCONTROL/packages/pkg_collective_passport.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/pkg_collective_passport.pks
SELECT '@./DL_BORDERCONTROL/packages/voa_apex_pkg.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/voa_apex_pkg.pks
SELECT '@./DL_BORDERCONTROL/tables/extendstay.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/extendstay.sql
SELECT '@./DL_BORDERCONTROL/views/lov_terminals.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/lov_terminals.vw
SELECT '@./DL_BORDERCONTROL/tables/movements.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/movements.sql
SELECT '@./DL_BORDERCONTROL/tables/movements_blob.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/movements_blob.sql
SELECT '@./DL_BORDERCONTROL/triggers/movements_blob\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/movements_blob\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/triggers/movements\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/movements\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/tables/mscs_movements_manual_update.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/mscs_movements_manual_update.sql
SELECT '@./DL_BORDERCONTROL/tables/mscs_movements_overstay.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/mscs_movements_overstay.sql
SELECT '@./DL_BORDERCONTROL/triggers/mscs_movements_overstay\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/mscs_movements_overstay\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/tables/mscs_tm5.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/mscs_tm5.sql
SELECT '@./DL_BORDERCONTROL/triggers/mscs_tm5\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/mscs_tm5\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/package_bodies/pkg_apex_fee_and_fine.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/pkg_apex_fee_and_fine.pkb
SELECT '@./DL_BORDERCONTROL/package_bodies/pkg_borderdocuments.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/pkg_borderdocuments.pkb
SELECT '@./DL_BORDERCONTROL/package_bodies/pkg_collective_passport.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/pkg_collective_passport.pkb
SELECT '@./DL_BORDERCONTROL/package_bodies/pkg_json_export.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/pkg_json_export.pkb
SELECT '@./DL_BORDERCONTROL/package_bodies/pkg_json_export_manual.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/pkg_json_export_manual.pkb
SELECT '@./DL_BORDERCONTROL/views/rep_faf_visas.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/rep_faf_visas.vw
SELECT '@./DL_BORDERCONTROL/views/rep_travel_history.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/rep_travel_history.vw
SELECT '@./DL_BORDERCONTROL/views/rep_visas.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/rep_visas.vw
SELECT '@./DL_BORDERCONTROL/views/rep_voa.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/rep_voa.vw
SELECT '@./DL_BORDERCONTROL/views/rep_voa_preview.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/rep_voa_preview.vw
SELECT '@./DL_BORDERCONTROL/views/rep_voa_statistics.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/rep_voa_statistics.vw
SELECT '@./DL_BORDERCONTROL/tables/tm8_application.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/tm8_application.sql
SELECT '@./DL_BORDERCONTROL/triggers/tm8_application\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/tm8_application\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/views/tm8_reentries.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/tm8_reentries.vw
SELECT '@./DL_BORDERCONTROL/tables/travel_abis_insert_error.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/travel_abis_insert_error.sql
SELECT '@./DL_BORDERCONTROL/triggers/travel_abis_insert_error\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/travel_abis_insert_error\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/views/v_edit_movements.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/v_edit_movements.vw
SELECT '@./DL_BORDERCONTROL/tables/vehicle_details.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/vehicle_details.sql
SELECT '@./DL_BORDERCONTROL/views/visa_name.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/visa_name.vw
SELECT '@./DL_BORDERCONTROL/views/v_movements_with_borderdocs.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/v_movements_with_borderdocs.vw
SELECT '@./DL_BORDERCONTROL/views/v_mvmt_with_brddocs.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/v_mvmt_with_brddocs.vw
SELECT '@./DL_BORDERCONTROL/package_bodies/voa_apex_pkg.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/voa_apex_pkg.pkb
SELECT '@./DL_BORDERCONTROL/views/v_sync_docs_with_bio_movements.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/v_sync_docs_with_bio_movements.vw
SELECT '@./DL_BORDERCONTROL/views/v_travel_abis_insert_error.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/v_travel_abis_insert_error.vw
SELECT '@./DL_BORDERCONTROL/views/v_visa_by_country.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/v_visa_by_country.vw
SELECT '@./DL_BORDERCONTROL_DATAMART/package_bodies/pkg_etl.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL_DATAMART/package_bodies/pkg_etl.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/tables/sync_movements.sql' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/tables/sync_movements.sql
SELECT '@./DL_STAGING4PIBICS_INTF/views/sync_movements_errors.vw' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/views/sync_movements_errors.vw
SELECT '@./DL_BLACKLIST/packages/pkg_blacklist_case.pks' AS ">" FROM DUAL;
@./DL_BLACKLIST/packages/pkg_blacklist_case.pks
SELECT '@./DL_BLACKLIST/package_bodies/pkg_blacklist_case.pkb' AS ">" FROM DUAL;
@./DL_BLACKLIST/package_bodies/pkg_blacklist_case.pkb
SELECT '@./DL_BLACKLIST/package_bodies/pkg_camunda_rest.pkb' AS ">" FROM DUAL;
@./DL_BLACKLIST/package_bodies/pkg_camunda_rest.pkb
SELECT '@./DL_BLACKLIST/views/vw_foundblacklist.vw' AS ">" FROM DUAL;
@./DL_BLACKLIST/views/vw_foundblacklist.vw
SELECT '@./DL_BORDERCONTROL/packages/pkg_edite_movements.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/pkg_edite_movements.pks
SELECT '@./DL_BORDERCONTROL/packages/pkg_json_convert.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/pkg_json_convert.pks
SELECT '@./DL_BORDERCONTROL/packages/pkg_pibics_hook.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/pkg_pibics_hook.pks
SELECT '@./DL_BORDERCONTROL/packages/pkg_reentry.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/pkg_reentry.pks
SELECT '@./DL_BORDERCONTROL/tables/movement_attr.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/movement_attr.sql
SELECT '@./DL_BORDERCONTROL/triggers/movement_attr\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/movement_attr\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/triggers/movements_manual_update\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/movements_manual_update\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/tables/mscs_insair.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/mscs_insair.sql
SELECT '@./DL_BORDERCONTROL/triggers/mscs_insair\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/mscs_insair\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/tables/mscs_insbank.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/mscs_insbank.sql
SELECT '@./DL_BORDERCONTROL/triggers/mscs_insbank\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/mscs_insbank\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/tables/mscs_inscash.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/mscs_inscash.sql
SELECT '@./DL_BORDERCONTROL/triggers/mscs_inscash\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/mscs_inscash\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/tables/mscs_insdept.sql' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/tables/mscs_insdept.sql
SELECT '@./DL_BORDERCONTROL/triggers/mscs_insdept\\\$tiud0.trg' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/triggers/mscs_insdept\\\$tiud0.trg
SELECT '@./DL_BORDERCONTROL/package_bodies/pkg_edite_movements.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/pkg_edite_movements.pkb
SELECT '@./DL_BORDERCONTROL/package_bodies/pkg_json_convert.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/pkg_json_convert.pkb
SELECT '@./DL_BORDERCONTROL/package_bodies/pkg_pibics_hook.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/pkg_pibics_hook.pkb
SELECT '@./DL_BORDERCONTROL/views/v_movements.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/v_movements.vw
SELECT '@./DL_INTERFACE/packages/pkg_object_handling.pks' AS ">" FROM DUAL;
@./DL_INTERFACE/packages/pkg_object_handling.pks
SELECT '@./DL_INTERFACE/package_bodies/pkg_listener.pkb' AS ">" FROM DUAL;
@./DL_INTERFACE/package_bodies/pkg_listener.pkb
SELECT '@./DL_INTERFACE/package_bodies/pkg_listener_manual.pkb' AS ">" FROM DUAL;
@./DL_INTERFACE/package_bodies/pkg_listener_manual.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/packages/pkg_bc_movements.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/packages/pkg_bc_movements.pks
SELECT '@./DL_STAGING4PIBICS_INTF/packages/pkg_transcode_reverse.pks' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/packages/pkg_transcode_reverse.pks
SELECT '@./DL_STAGING4PIBICS_INTF/views/bc_fellowpass4pibics.vw' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/views/bc_fellowpass4pibics.vw
SELECT '@./DL_STAGING4PIBICS_INTF/views/bc_movements4pibics.vw' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/views/bc_movements4pibics.vw
SELECT '@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_bc_movements.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_bc_movements.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_st_tminout.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_st_tminout.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_st_tmmain.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_st_tmmain.pkb
SELECT '@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_transcode_reverse.pkb' AS ">" FROM DUAL;
@./DL_STAGING4PIBICS_INTF/package_bodies/pkg_transcode_reverse.pkb
SELECT '@./DL_BORDERCONTROL/packages/dl_movementhandling.pks' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/packages/dl_movementhandling.pks
SELECT '@./DL_BORDERCONTROL/package_bodies/dl_movementhandling.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/dl_movementhandling.pkb
SELECT '@./DL_BORDERCONTROL/package_bodies/pkg_bmbs_apex_util.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/pkg_bmbs_apex_util.pkb
SELECT '@./DL_BORDERCONTROL/package_bodies/pkg_reentry.pkb' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/package_bodies/pkg_reentry.pkb
SELECT '@./DL_BORDERCONTROL/views/rep_borderdocuments.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/rep_borderdocuments.vw
SELECT '@./DL_BORDERCONTROL/views/v_m_d.vw' AS ">" FROM DUAL;
@./DL_BORDERCONTROL/views/v_m_d.vw
SELECT '@./DL_INTERFACE/package_bodies/pkg_object_handling.pkb' AS ">" FROM DUAL;
@./DL_INTERFACE/package_bodies/pkg_object_handling.pkb
@install-jobs.sql
@install-dbms_jobs.sql
@install-schedules.sql
quit

