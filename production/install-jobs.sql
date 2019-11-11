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
@DL_INTERFACE/jobs/check_queue_i1_01.sql
@DL_INTERFACE/jobs/check_queue_i1_02.sql
@DL_INTERFACE/jobs/check_queue_i1_03.sql
@DL_INTERFACE/jobs/check_queue_i1_04.sql
@DL_INTERFACE/jobs/check_queue_i1_05.sql
@DL_INTERFACE/jobs/check_queue_i1_06.sql
@DL_INTERFACE/jobs/check_queue_i1_07.sql
@DL_INTERFACE/jobs/check_queue_i1_08.sql
@DL_INTERFACE/jobs/check_queue_i1_09.sql
@DL_INTERFACE/jobs/check_queue_i1_10.sql
@DL_INTERFACE/jobs/check_queue_i1_11.sql
@DL_INTERFACE/jobs/check_queue_i1_12.sql
@DL_INTERFACE/jobs/check_queue_i1_13.sql
@DL_INTERFACE/jobs/check_queue_i1_14.sql
@DL_INTERFACE/jobs/check_queue_i1_15.sql
@DL_INTERFACE/jobs/check_queue_i2_01.sql
@DL_INTERFACE/jobs/check_queue_i2_02.sql
@DL_INTERFACE/jobs/check_queue_i2_03.sql
@DL_INTERFACE/jobs/check_queue_i2_04.sql
@DL_INTERFACE/jobs/check_queue_i2_05.sql
@DL_INTERFACE/jobs/check_queue_i2_06.sql
@DL_INTERFACE/jobs/check_queue_i2_07.sql
@DL_INTERFACE/jobs/check_queue_i2_08.sql
@DL_INTERFACE/jobs/check_queue_i2_09.sql
@DL_INTERFACE/jobs/check_queue_i2_10.sql
@DL_INTERFACE/jobs/check_queue_i2_11.sql
@DL_INTERFACE/jobs/check_queue_i2_12.sql
@DL_INTERFACE/jobs/check_queue_i2_13.sql
@DL_INTERFACE/jobs/check_queue_i2_14.sql
@DL_INTERFACE/jobs/check_queue_i2_15.sql
@DL_INTERFACE/jobs/check_queue_i3_01.sql
@DL_INTERFACE/jobs/check_queue_i3_02.sql
@DL_INTERFACE/jobs/check_queue_i3_03.sql
@DL_INTERFACE/jobs/check_queue_i3_04.sql
@DL_INTERFACE/jobs/check_queue_i3_05.sql
@DL_INTERFACE/jobs/check_queue_i3_06.sql
@DL_INTERFACE/jobs/check_queue_i3_07.sql
@DL_INTERFACE/jobs/check_queue_i3_08.sql
@DL_INTERFACE/jobs/check_queue_i3_09.sql
@DL_INTERFACE/jobs/check_queue_i3_10.sql
@DL_INTERFACE/jobs/sj_send_to_pibics_case_gender.sql
@DL_INTERFACE/jobs/sj_sp_send_to_pibics_again.sql
-- DL_MAINTENANCE/jobs
@DL_MAINTENANCE/jobs/hm_main_scheduler.sql
-- SYSTEM/jobs
@SYSTEM/jobs/job_send_to_pibics_again_ex.sql
@SYSTEM/jobs/j_send_to_pibics_unsuccess_1.sql
@SYSTEM/jobs/j_send_to_pibics_unsuccess_2.sql
@SYSTEM/jobs/j_send_to_pibics_unsuccess_3.sql
@SYSTEM/jobs/j_send_to_pibics_unsuccess_4.sql
