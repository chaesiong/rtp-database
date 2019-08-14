CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS_INTF"."PKG_OPS_TRANSACTIONAL" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
    -- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol
    /*
     High Level Operating  routines for transactional data , see PKG_OPERATING for other data
    */

    /* day to day processing */
    PROCEDURE keep_current(p_process_name IN pkg_utils.table_name
                          ,p_tag          IN log_run_steps.tag%TYPE);

    PROCEDURE keep_current_all(p_tag IN log_run_steps.tag%TYPE);

    /*
    these INSERT procedures are created for initial load on (at least partly) empty tables.
    If data in table for the given timeframe already exists, the procedure
    writes in the  ERR$_SYNC_xxx table instead
    */
    PROCEDURE insert_yyyymm(p_process_name           IN pkg_utils.table_name
                           ,p_yyyymm                 IN pkg_utils.yyyymm
                           ,p_tag                    IN log_run_steps.tag%TYPE
                           ,p_include_copy_to_target IN BOOLEAN);

    /* these procedures start the load process for a certain process and timeframe asynchron,
    they submit as DBMS_SCHEDULER - Job
    */

    /* data transport  from PIBICS to STAGING , Job-Name id  'DL_STAGING4PIBICS_INTF.LOAD_PHASE1_JOB' */
    PROCEDURE submit_job_insert_yyyymm_phase1(p_process_name IN pkg_utils.table_name
                                             ,p_yyyymm       IN pkg_utils.yyyymm);

    /* data transport  from STAGING to DL_BORDERCONTROL  , Job-Name id  'DL_STAGING4PIBICS_INTF.LOAD_PHASE2_JOB' */
    PROCEDURE submit_job_insert_yyyymm_phase2(p_process_name           IN pkg_utils.table_name
                                             ,p_yyyymm                 IN pkg_utils.yyyymm
                                             ,p_include_copy_to_target IN BOOLEAN);

    /* data transport  from PIBICS to DL_BORDERCONTROL  , Job-Name id  'DL_STAGING4PIBICS_INTF.LOAD_START_TO_END_JOB' */
    PROCEDURE submit_job_insert_yyyymm_start_to_end(p_process_name           IN pkg_utils.table_name
                                                   ,p_yyyymm                 IN pkg_utils.yyyymm
                                                   ,p_include_copy_to_target IN BOOLEAN);

    PROCEDURE submit_job_copy_tmmain(p_lowest_tmrunno_to_copy  IN dl_staging4pibics.cnt_tmmain.lowest_tmrunno_to_copy%TYPE
                                    ,p_highest_tmrunno_to_copy IN dl_staging4pibics.cnt_tmmain.highest_tmrunno_to_copy%TYPE);
END pkg_ops_transactional;
/
