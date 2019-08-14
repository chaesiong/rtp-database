CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS_INTF"."PKG_ST_TMMAIN" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
    -- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol

    /*  processes for data transport between DL_STAGING4PIBICS.TMMAIN  and
                      DL_BORDERCONTROL.SYNC_MOVEMENTS
    */
    gc_process_name CONSTANT pkg_utils.table_name := 'TMMAIN';

    /* For da� to day operations, uses the MV-Log from DL_STASGING4PIBICS  */
    PROCEDURE copy_to_target(p_lowest_tmrunno_to_copy  IN dl_staging4pibics.cnt_tmmain.lowest_tmrunno_to_copy%TYPE
                            ,p_highest_tmrunno_to_copy IN dl_staging4pibics.cnt_tmmain.highest_tmrunno_to_copy%TYPE
                            ,p_tag                     IN log_run_steps.tag%TYPE);

/* assumes no data for this timeframe exists but continues anyway */

END pkg_st_tmmain;
/
