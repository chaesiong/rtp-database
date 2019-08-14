CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS_INTF"."PKG_MAINTENANCE" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
    -- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol
    /*
    Scheduling system
    */
    gc_ongoing_jobclass            VARCHAR2(100) := 'ONGOING_SYNCHRONISATION_PIBICS';
    gc_initial_load_jobclass       VARCHAR2(100) := 'INITIAL_LOAD_PIBICS';
    gc_transactional_data_schedule VARCHAR2(100) := 'TRANSACTIONAL_DATA';
    gc_metadata_schedule           VARCHAR2(100) := 'METADATA';
    PROCEDURE disable_ongoing_synchronisation;
    PROCEDURE enable_ongoing_synchronisation;
    PROCEDURE create_or_recreate_ongoing_synchronisation;
    PROCEDURE nuke_the_scheduler;

END pkg_maintenance;
/
