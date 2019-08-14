CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS"."PKG_WATCHLIST" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
	-- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol
    /* Load data from PIBICS.WATCHLIST to DL_STAGING4PIBICS.WATCHLIST */

	/* merge the data for a day */
    PROCEDURE merge_yyyymmdd(p_step_params IN pkg_utils.step_params);
    
    PROCEDURE merge_wlcd(p_wlcd IN varchar2);
	/* insert the data for a month, assume no data for this month exists */
    PROCEDURE insert_yyyymm(p_step_params IN pkg_utils.step_params);
    
    PROCEDURE merge_yyyymmdd2(p_date IN VARCHAR2);
    
    PROCEDURE merge_WLINDICATECARD_yyyymmdd(p_date IN VARCHAR2);
    
    
END pkg_watchlist;
/
