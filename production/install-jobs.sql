---------------------
-- jobs --
-- LOGGER/jobs
@LOGGER/jobs/logger_purge_job.sql
@LOGGER/jobs/logger_unset_prefs_by_client.sql
-- DL_BORDERCONTROL/jobs
@DL_BORDERCONTROL/jobs/purge_tmp_blacklist_search.sql
@DL_BORDERCONTROL/jobs/purge_tmp_collective_passport.sql
-- DL_BORDERCONTROL_DATAMART/jobs
@DL_BORDERCONTROL_DATAMART/jobs/update_datamart.sql
-- DL_STAGING4PIBICS_INTF/jobs
@DL_STAGING4PIBICS_INTF/jobs/metadata_sync_ampur.sql
@DL_STAGING4PIBICS_INTF/jobs/metadata_sync_continent.sql
@DL_STAGING4PIBICS_INTF/jobs/metadata_sync_conveyance.sql
@DL_STAGING4PIBICS_INTF/jobs/metadata_sync_country.sql
@DL_STAGING4PIBICS_INTF/jobs/metadata_sync_department.sql
@DL_STAGING4PIBICS_INTF/jobs/metadata_sync_flightnumbers.sql
@DL_STAGING4PIBICS_INTF/jobs/metadata_sync_fs_slipsystem.sql
@DL_STAGING4PIBICS_INTF/jobs/metadata_sync_occupation.sql
@DL_STAGING4PIBICS_INTF/jobs/metadata_sync_paymentrate.sql
@DL_STAGING4PIBICS_INTF/jobs/metadata_sync_permittype.sql
@DL_STAGING4PIBICS_INTF/jobs/metadata_sync_province.sql
@DL_STAGING4PIBICS_INTF/jobs/metadata_sync_rankcrw.sql
@DL_STAGING4PIBICS_INTF/jobs/metadata_sync_region.sql
@DL_STAGING4PIBICS_INTF/jobs/metadata_sync_suffix.sql
@DL_STAGING4PIBICS_INTF/jobs/metadata_sync_tambon.sql
@DL_STAGING4PIBICS_INTF/jobs/metadata_sync_traveldoctype.sql
@DL_STAGING4PIBICS_INTF/jobs/metadata_sync_visabynation.sql
@DL_STAGING4PIBICS_INTF/jobs/metadata_sync_visatype.sql
@DL_STAGING4PIBICS_INTF/jobs/sj_sync_lostpassport.sql
@DL_STAGING4PIBICS_INTF/jobs/sj_sync_watchlist2_5min.sql
@DL_STAGING4PIBICS_INTF/jobs/sj_sync_watchlist_30min.sql
@DL_STAGING4PIBICS_INTF/jobs/sj_sync_watchlist.sql
@DL_STAGING4PIBICS_INTF/jobs/transaction_data_sync_lostpassport.sql
@DL_STAGING4PIBICS_INTF/jobs/transaction_data_sync_thaipassport.sql
@DL_STAGING4PIBICS_INTF/jobs/transaction_data_sync_tminout.sql
@DL_STAGING4PIBICS_INTF/jobs/transaction_data_sync_watchlist.sql
-- DL_INTERFACE/jobs
@DL_INTERFACE/jobs/check_queue_11.sql
@DL_INTERFACE/jobs/check_queue_12.sql
@DL_INTERFACE/jobs/check_queue_13.sql
@DL_INTERFACE/jobs/check_queue_14.sql
@DL_INTERFACE/jobs/check_queue_16.sql
@DL_INTERFACE/jobs/check_queue_17.sql
@DL_INTERFACE/jobs/check_queue_19.sql
@DL_INTERFACE/jobs/check_queue_20.sql
@DL_INTERFACE/jobs/check_queue_22.sql
@DL_INTERFACE/jobs/check_queue_23.sql
@DL_INTERFACE/jobs/check_queue_24.sql
@DL_INTERFACE/jobs/check_queue_25.sql
@DL_INTERFACE/jobs/check_queue_26.sql
@DL_INTERFACE/jobs/check_queue_29.sql
@DL_INTERFACE/jobs/check_queue_3.sql
@DL_INTERFACE/jobs/check_queue_4.sql
@DL_INTERFACE/jobs/check_queue_5.sql
@DL_INTERFACE/jobs/check_queue_7.sql
@DL_INTERFACE/jobs/check_queue_9.sql
@DL_INTERFACE/jobs/check_queue_n1.sql
@DL_INTERFACE/jobs/check_queue_n2.sql
@DL_INTERFACE/jobs/check_queue_n3.sql
@DL_INTERFACE/jobs/check_queue_n4.sql
@DL_INTERFACE/jobs/check_queue_n5.sql
@DL_INTERFACE/jobs/check_queue_n6.sql
@DL_INTERFACE/jobs/check_queue_n7.sql
@DL_INTERFACE/jobs/check_queue_n8.sql
@DL_INTERFACE/jobs/check_queue.sql
@DL_INTERFACE/jobs/sj_send_to_pibics_case_gender.sql
@DL_INTERFACE/jobs/sj_sp_send_to_pibics_again.sql
-- SYSTEM/jobs
@SYSTEM/jobs/job_send_to_pibics_again_ex.sql
@SYSTEM/jobs/j_send_to_pibics_unsuccess_1.sql
@SYSTEM/jobs/j_send_to_pibics_unsuccess_2.sql
@SYSTEM/jobs/j_send_to_pibics_unsuccess_3.sql
@SYSTEM/jobs/j_send_to_pibics_unsuccess_4.sql
