CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS_INTF"."PKG_PREFERENCES" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
    -- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol

    /*
        deal with local preferences, includes all access to the table 'PREFERENCES'

        SIDE EFFECT : writes table  PREFERENCES
        Fills the table with useful default values
    */

    /* Logging preferences
    */
    err_invalid_log_level CONSTANT PLS_INTEGER := -20001;
    TYPE logger_preferences IS RECORD(
         loglevel  ops_preferences.pref_value%TYPE
        ,client_id ops_preferences.pref_value%TYPE);
    --
    TYPE batchsize_preferences IS RECORD(
         batch_size NUMBER
        ,is_default BOOLEAN);
    --
    TYPE tag_preferences IS RECORD(
         tag        ops_preferences.pref_value%TYPE
        ,is_default BOOLEAN);
    --
    PROCEDURE set_logger_preferences(p_prefs IN logger_preferences);
    -- put the preferences in table for later use
    -- PRAGMA AUTONOMOUS_TRANSACTION
    -- RAISES : Application error in case of invalid level ( as defined by logger package)

    PROCEDURE use_logger_preferences(p_prefs   IN logger_preferences
                                    ,p_verbose IN BOOLEAN DEFAULT FALSE);
    -- use the preferences as given, don't deal with the preferences table
    -- if p_verbose is true then write to server output
    -- SIDE EFFECT : Session identifier will be set here

    PROCEDURE get_and_use_logger_preferences(p_verbose IN BOOLEAN DEFAULT FALSE);
    -- take the preferences from table and use them
    -- if p_verbose is true then write to server output
    -- SIDE EFFECT : Session identifier will be set here

    FUNCTION get_batchsize_preferences(p_batchsize IN NUMBER) RETURN batchsize_preferences;
    -- SIDE EFFECT : initializes the table if no setting is found

    FUNCTION get_tag_preferences(p_tag IN VARCHAR2) RETURN tag_preferences;
    -- SIDE EFFECT : initializes the table if no setting is found

END pkg_preferences;
/
