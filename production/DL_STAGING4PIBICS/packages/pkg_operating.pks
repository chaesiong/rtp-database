CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS"."PKG_OPERATING" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
    -- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol
    /*
     Utilities for the operating of the system ,
     for lookup data and logging and  the cleanup of logging and control tables
     NOT concerned with the transactional data, see PKG_OPS_TRANSACTIONAL

    */

    err_run_id_invalid EXCEPTION;
    PRAGMA EXCEPTION_INIT(err_run_id_invalid
                         ,-20003);
    err_run_has_current_load EXCEPTION;
    PRAGMA EXCEPTION_INIT(err_run_has_current_load
                         ,-20005);

    /* cleanup of log tables */
    PROCEDURE purge_run(p_run_id IN log_run_steps.run_id%TYPE);

    /* cleanup of log tables */
    PROCEDURE purge_all_runs_for_tag(p_tag IN log_run_steps.tag%TYPE);

    PROCEDURE refresh_pibics_counter(pi_table_name IN VARCHAR2);
    /* refresh the control tables for the PIBICS side. Used for system rampup or error correction */
    PROCEDURE refresh_all_pibics_counter;

    /* refresh the control tables for the DL_STSGING4PIBICS side. Used for system rampup or error correction */
    PROCEDURE refresh_all_staging_counter;

    /* normal process */
    PROCEDURE merge_transcode_table(p_process_name IN VARCHAR2);
    PROCEDURE load_all_transcode_tables(p_tag IN log_run_steps.tag%TYPE);
END pkg_operating;
/
