CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS_INTF"."PKG_BL_BLACKLIST_CASES" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
    -- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol

    /*  processes for data transport between DL_STAGING4PIBICS_INTF.SYNC_WATCHLIST  and
                      DL_BLACKLIST.BLACKLIST_CASES
                      DL_BLACKLIST.IDENTITIES
                      DL_BLACKLIST.ADDRESSES
    */

    gc_process_name CONSTANT pkg_utils.table_name := 'SYNC_BLACKLIST_CASES';

    --  TYPE t_sync_tab IS TABLE OF sync_blacklist_cases%ROWTYPE;
    PROCEDURE insert_target_watchlist(p_tag IN log_run_steps.tag%TYPE);
    PROCEDURE insert_target_watchlist_wlcd(p_wlcd in varchar2);
    PROCEDURE insert_target_lostpassport(p_tag IN log_run_steps.tag%TYPE);
    PROCEDURE insert_target_watchlist2(p_date in varchar2);
    PROCEDURE insert_target_WLINDICATECARD(p_date IN VARCHAR2);

END pkg_bl_blacklist_cases;
/
