CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS"."PKG_MAINTENANCE" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
	-- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol
    /*
     Low Level Maintenance  routines, not used during normal operations
    */

    err_table_does_not_exist EXCEPTION;
    PRAGMA EXCEPTION_INIT(err_table_does_not_exist
                         ,-942);

    /* drops the MV-Log for the given table
       creates a dummy view with the same structure as the MV-Log and no data
       modifies the synonym so that it points to the dummy view
       raises  err_mvlog_not_empty if mvlog is NOT empty, override with p_force = true
	*/
    PROCEDURE disable_mvlog_for_table(p_table_name VARCHAR2
                                     ,p_force      IN BOOLEAN DEFAULT FALSE);

	/* loops over all relevant tables in OPS_PIBICS_LOAD_PROCESSES  and calls DISABLE_MVLOG_FOR_TABLE on them */
    PROCEDURE disable_all_mvlogs(p_force IN BOOLEAN DEFAULT FALSE);

    /* creates the MV-Log for the given table
	   drops the dummy view
	   modifies the synonym so that it points to the MV-Log
	*/
    PROCEDURE enable_mvlog_for_table(p_table_name VARCHAR2);

	/* loops over all relevant tables in OPS_PIBICS_LOAD_PROCESSES  and calls ENABLE_MVLOG_FOR_TABLE on them */
    PROCEDURE enable_all_mvlogs;
END pkg_maintenance;
/
