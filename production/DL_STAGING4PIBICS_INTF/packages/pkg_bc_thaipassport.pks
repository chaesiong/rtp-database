CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS_INTF"."PKG_BC_THAIPASSPORT" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
    -- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol

    /*  processes for data transport between DL_STAGING4PIBICS_INTF.SYNC_THAIPASSPORT  and
                      DL_BORDERCONTROL.THAIPASSPORT
    */

    gc_process_name CONSTANT pkg_utils.table_name := 'SYNC_THAIPASSPORT';

    TYPE t_sync_tab IS TABLE OF sync_thaipassport%ROWTYPE;

    PROCEDURE insert_target(p_tag IN log_run_steps.tag%TYPE);
END pkg_bc_thaipassport;
/
