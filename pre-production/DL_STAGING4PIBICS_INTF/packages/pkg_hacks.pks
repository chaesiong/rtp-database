CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS_INTF"."PKG_HACKS" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
	-- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol

	/* some hacks to get the syetem up and running */

    TYPE terminal_borderpost_r IS RECORD(
         borderpost VARCHAR2(32)
        ,terminal   VARCHAR2(32));

    FUNCTION get_dummy_terminal_in RETURN terminal_borderpost_r;
    FUNCTION get_dummy_terminal_out RETURN terminal_borderpost_r;
END pkg_hacks;
/
