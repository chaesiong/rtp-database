CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS_INTF"."PKG_FROM_PIBICS" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
    -- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol

    /* low level transformation routines for value lists (not lookup data, that is handles in PKG_TRANSCODE  */

    e_no_borderpost_data EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_no_borderpost_data
                         ,-29001);
    --
    FUNCTION cardtype(p_cardtype IN VARCHAR2) RETURN INTEGER;

    FUNCTION birthdte(p_birthdte IN VARCHAR2) RETURN VARCHAR2;
    FUNCTION birthdte_date(p_birthdte IN VARCHAR2) RETURN DATE;

    FUNCTION sex(p_sex IN VARCHAR2) RETURN VARCHAR2;

END pkg_from_pibics;
/
