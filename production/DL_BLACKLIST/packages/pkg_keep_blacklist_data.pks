CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BLACKLIST"."PKG_KEEP_BLACKLIST_DATA" AUTHID DEFINER AS 

    PROCEDURE P_BK_SYNC_BLACKLIST_CASES (p_wlcd in varchar2);
    PROCEDURE P_BK_BLACKLIST_CASES (p_wlcd in varchar2);
    PROCEDURE P_BK_BLACKLIST_CASE_IDENT (p_wlcd in varchar2);
    PROCEDURE P_BK_IDENTITIES (p_wlcd in varchar2);
    PROCEDURE P_BK_TRAVEL_DOCS(p_wlcd in varchar2);
    PROCEDURE P_BK_STEP_DELETE (p_wlcd in varchar2);
    PROCEDURE DELETE_KEEP_BLACKLIST_DATA; 

END PKG_KEEP_BLACKLIST_DATA;
/
