CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS"."PKG_TMMAIN" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
    -- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol
    /* Load data from PIBICS.tmmain to DL_STAGING4PIBICS.tmmain */

    /* merge the data for a day */
    PROCEDURE prepare_control_table(p_batchsize IN NUMBER DEFAULT 100000);

    PROCEDURE copy_to_staging(p_lowest_tmrunno_to_copy  IN cnt_tmmain.lowest_tmrunno_to_copy%TYPE
                             ,p_highest_tmrunno_to_copy IN cnt_tmmain.highest_tmrunno_to_copy%TYPE);

END pkg_tmmain;
/
