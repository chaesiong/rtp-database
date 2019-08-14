CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS_INTF"."PKG_BC_MOVEMENTS" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
    -- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol

    /*  processes for data transport between DL_STAGING4PIBICS_INTF.SYNC_MOVEMEMTS  and
                      DL_BORDERCONTROL.MOVEMENTS
                      DL_BORDERCONTROL.BORDERDOCUMENTS
                      DL_BORDERCONTROL.ENTRY_FORMS
    */

    gc_process_name CONSTANT pkg_utils.table_name := 'SYNC_MOVEMENTS';

    PROCEDURE save_pibics_transaction(i_mvmntid               IN dl_staging4pibics_intf.sync_movements.mvmntid%TYPE
                                     , --PK of DL_BORDERCONTROL  table
                                      i_seqno                 IN dl_staging4pibics_intf.sync_movements.seqno%TYPE
                                     , --PK of PIBICS table
                                      i_brddocid              IN dl_staging4pibics_intf.sync_movements.brddocid%TYPE
                                     , --ID of DL_BORDERCONTROL.BORDERDOCUMENTS
                                      i_currentness_in_pibics IN dl_staging4pibics_intf.sync_movements.currentness_in_pibics%TYPE
                                     , --The update or create date in the source
                                      i_currentness_in_bc     IN dl_staging4pibics_intf.sync_movements.currentness_in_bc%TYPE --The update or create date in the source
                                      );
    TYPE t_sync_tab IS TABLE OF sync_movements%ROWTYPE;

    PROCEDURE insert_target(p_tag IN log_run_steps.tag%TYPE);
    PROCEDURE insert_target_tmmain(p_lowest_tmrunno_to_copy  IN dl_staging4pibics.cnt_tmmain.lowest_tmrunno_to_copy%TYPE
                                  ,p_highest_tmrunno_to_copy IN dl_staging4pibics.cnt_tmmain.highest_tmrunno_to_copy%TYPE
                                  ,p_tag                     IN log_run_steps.tag%TYPE);
END pkg_bc_movements;
/
