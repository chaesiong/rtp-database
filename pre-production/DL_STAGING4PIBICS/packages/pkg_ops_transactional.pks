CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS"."PKG_OPS_TRANSACTIONAL" AUTHID DEFINER AS
     -- part of Data transport from PIBICS to Bordercontrol,
	-- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol
   /*
       Coordination of the transport processes for the transactional data.

	   Not concerned with lookup tables, log data etc, see PKG_OPERATING

	   The timeframes work with the CREATE_DATE of the tables, if NULL then PKG_UTILS.GET_BEGIN_OF_TIME is used.

       All these procedures are controlled with the tables
       CREATE_DATE_COUNTER
       CREATE_DATE_COUNTER_PIBICS

       They are wrappers for the routines
       PKG_XXX.merge_yyyymmdd(p_step_params)
       PKG_XXX.insert_yyyymm(p_step_params)

       XXX is the name of the process resp. PIBICS table
    */

    /*
     these MERGE procedures are created for the daily business, they work fine with existing data
    */

	/* merge data for a given table and a given day */
    PROCEDURE merge_yyyymmdd(p_process_name         IN pkg_utils.process_name
                            ,p_create_date_yyyymmdd IN pkg_utils.yyyymmdd
                            ,p_tag                  IN log_run_steps.tag%TYPE);

    /* complete  daily merge process for given p_date
       if  p_date is NULL, we use SYSDATE
       if p_tag is null, a reasonable default is generated
    */
    PROCEDURE merge_date_complete(p_date                      IN DATE DEFAULT trunc(SYSDATE)
                                 ,p_tag                       IN log_run_steps.tag%TYPE DEFAULT NULL
                                 ,p_refresh_pibics_mvs_before IN BOOLEAN DEFAULT FALSE);

    /*
    these INSERT procedures are created for initial load on (at least partly) empty tables.
    If data in table for the given timeframe already exists, the procedure
    logs the condition as a WARNING and returns without processing any data .
    */

	/* Insert data for a given table and a given month */
    PROCEDURE insert_yyyymm(p_process_name       IN pkg_utils.process_name
                           ,p_create_date_yyyymm IN pkg_utils.yyyymm
                           ,p_tag                IN log_run_steps.tag%TYPE);

    /* loops over all completed months (NOT the current one !) backwards for the given process name
       which have any data to insert
    */
    PROCEDURE insert_all_yyyymm_processwise(p_process_name       IN pkg_utils.process_name
                                           ,p_tag                IN log_run_steps.tag%TYPE
                                           ,p_gather_stats_after IN BOOLEAN DEFAULT TRUE);

    /* loops over all processes which have any data to insert and call INSERT_ALL_YYYYMM_PROCESSWISE on them
    */
    PROCEDURE insert_loop_yyyymm_process(p_tag                       IN log_run_steps.tag%TYPE DEFAULT NULL
                                        ,p_refresh_pibics_mvs_before IN BOOLEAN DEFAULT FALSE
                                        ,p_gather_stats_after        IN BOOLEAN DEFAULT TRUE);

    /* loops over all processes which have any data to insert for the given YYYYMM
    */
    PROCEDURE insert_all_yyyymm_timewise(p_yyyymm IN pkg_utils.yyyymm
                                        ,p_tag    IN log_run_steps.tag%TYPE);

    /* loops over all YYYYMM which have any data to insert and call INSERT_ALL_YYYYMM_TIMEWISE on them
    */
    PROCEDURE insert_loop_yyyymm_time(p_tag                       IN log_run_steps.tag%TYPE DEFAULT NULL
                                     ,p_refresh_pibics_mvs_before IN BOOLEAN DEFAULT FALSE
                                     ,p_gather_schema_stats_after IN BOOLEAN DEFAULT TRUE);

END pkg_ops_transactional;
/
