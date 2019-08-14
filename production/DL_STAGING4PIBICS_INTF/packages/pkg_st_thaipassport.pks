CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS_INTF"."PKG_ST_THAIPASSPORT" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
    -- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol

    /*  processes for data transport between DL_STAGING4PIBICS.THAIPASSPORT  and
                      DL_BORDERCONTROL.SYNC_THAIPASSPORT
    */

    gc_process_name CONSTANT pkg_utils.table_name := 'THAIPASSPORT';

    /* For da� to day operations, uses the MV-Log from DL_STASGING4PIBICS  */
    PROCEDURE keep_current(p_tag IN log_run_steps.tag%TYPE);

    /* assumes no data for this timeframe exists but continues anyway */
    PROCEDURE initial_load_for_yyyymm(p_yyyymm                 IN pkg_utils.yyyymm
                                     ,p_tag                    IN log_run_steps.tag%TYPE
                                     ,p_include_copy_to_target IN BOOLEAN);
END pkg_st_thaipassport;
/
