CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS_INTF"."PKG_OPERATING" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
    -- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol
    /*
     High Level Operating  routines for lookup and loo data, see PKG_OPS_TRANSACTIONAL for transactional data
    */
    PROCEDURE purge_run(p_run_id IN NUMBER);

    PROCEDURE purge_all_runs_for_tag(p_tag IN log_run_steps.tag%TYPE);

    PROCEDURE merge_transcode_table(p_process_name IN VARCHAR2);
    -- intial load
    PROCEDURE sync_transcode(p_tag IN log_run_steps.tag%TYPE);
    -- p_base_table_name is sync_xx or bc_xxx
    PROCEDURE truncate_error_table(p_base_table_name IN pkg_utils.table_name);
    PROCEDURE delete_warnings_error_table(p_base_table_name IN pkg_utils.table_name);

    PROCEDURE reset_sync_counters;
    PROCEDURE refresh_sync_counters;

    PROCEDURE reset_transcode_counters;
    PROCEDURE refresh_transcode_counters;

    PROCEDURE cleanup_err$_sync_blacklist_cases;

END pkg_operating;
/
