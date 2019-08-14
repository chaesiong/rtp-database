CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS"."PKG_THAIPASSPORT" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
	-- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol
    /* Load data from PIBICS.THAIPASSPORT to DL_STAGING */

	/* merge the data for a day */
    PROCEDURE merge_yyyymmdd(p_step_params IN pkg_utils.step_params);

	/* insert the data for a month, assume no data for this month exists */
    PROCEDURE insert_yyyymm(p_step_params IN pkg_utils.step_params);
END pkg_thaipassport;
/
