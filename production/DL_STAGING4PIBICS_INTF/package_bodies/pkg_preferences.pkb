CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS_INTF"."PKG_PREFERENCES" AS

    gc_logger_level      CONSTANT ops_preferences.pref_name%TYPE := 'LOGGER_LEVEL';
    gc_level_description CONSTANT ops_preferences.description%TYPE := 'Logging Level for LOGGER-Package, related to client_id, ' ||
                                                                      'see LOGGING_CLIENT_ID. If the Value is NULL, the system LOGGER-Level will be used';
    --
    gc_logger_client_id      CONSTANT ops_preferences.pref_name%TYPE := 'LOGGER_CLIENT_ID';
    gc_client_id_description CONSTANT ops_preferences.description%TYPE := 'Client-Id for LOGGER-Pakage. This will be set with  sys.dbms_session.set_identifier during runtime. ' ||
                                                                          ' If LOGGER_LEVEL is NULL, this value is ignored.';
    --
    gc_default_batchsize     CONSTANT ops_preferences.pref_name%TYPE := 'DEFAULT_BATCHSIZE';
    gc_batchsize_description CONSTANT ops_preferences.description%TYPE := 'Default Batchsize for synchronization processes';
    --
    gc_default_tag     CONSTANT ops_preferences.pref_name%TYPE := 'DEFAULT_TAG';
    gc_tag_description CONSTANT ops_preferences.description%TYPE := 'Default tag to mark severel process runs with one value';
    e_preference_not_given EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_preference_not_given
                         ,-22222);

    PROCEDURE set_content(p_name        IN ops_preferences.pref_name%TYPE
                         ,p_description IN ops_preferences.description%TYPE
                         ,p_value       IN ops_preferences.pref_value%TYPE) AS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        MERGE INTO ops_preferences tgt
        USING (SELECT p_name        AS pref_name
                     ,p_description AS description
                     ,p_value       AS pref_value
               FROM dual) src
        ON (src.pref_name = tgt.pref_name)
        WHEN NOT MATCHED THEN
            INSERT
                (pref_name
                ,description
                ,pref_value)
            VALUES
                (src.pref_name
                ,src.description
                ,src.pref_value);

        COMMIT;
    END set_content;

    PROCEDURE init_content_logging IS
        lc_client_id_value CONSTANT ops_preferences.pref_value%TYPE := 'set a useful value here';
    BEGIN
        set_content(gc_logger_client_id
                   ,gc_client_id_description
                   ,lc_client_id_value);
        set_content(gc_logger_level
                   ,gc_level_description
                   ,logger.g_debug_name);
    END init_content_logging;

    PROCEDURE init_default_batchsize IS
        lc_batchsize_value CONSTANT NUMBER := 1000;
    BEGIN
        set_content(gc_default_batchsize
                   ,gc_batchsize_description
                   ,lc_batchsize_value);
    END init_default_batchsize;

    PROCEDURE init_default_tag IS
        lc_tag_value CONSTANT ops_preferences.pref_value%TYPE := 'Entwicklertest';
    BEGIN
        set_content(gc_default_tag
                   ,gc_tag_description
                   ,lc_tag_value);
    END init_default_tag;

    FUNCTION get_pref_value(p_pref_name IN ops_preferences.pref_name%TYPE) RETURN ops_preferences.pref_value%TYPE IS
        l_result ops_preferences.pref_value%TYPE;
    BEGIN
        SELECT pref_value
        INTO l_result
        FROM ops_preferences
        WHERE pref_name = p_pref_name;

        RETURN l_result;
    EXCEPTION
        WHEN no_data_found THEN
            RAISE e_preference_not_given;
        WHEN OTHERS THEN
            RAISE;
    END get_pref_value;
    --
    -- Public
    --

    PROCEDURE set_logger_preferences(p_prefs IN logger_preferences) IS
        l_prefs logger_preferences := p_prefs;
        lc_err_invalid_log_level_txt CONSTANT VARCHAR2(1000 CHAR) := 'Invalid Log level ';
    BEGIN
        -- prevent errors
        IF p_prefs.loglevel NOT IN (logger.g_off_name
                                   ,logger.g_permanent_name
                                   ,logger.g_error_name
                                   ,logger.g_warning_name
                                   ,logger.g_information_name
                                   ,logger.g_debug_name
                                   ,NULL) THEN
            raise_application_error(err_invalid_log_level
                                   ,lc_err_invalid_log_level_txt || p_prefs.loglevel);
        END IF;

        IF l_prefs.loglevel IS NULL THEN
            l_prefs.client_id := NULL;
        END IF;
        set_content(gc_logger_client_id
                   ,gc_client_id_description
                   ,l_prefs.client_id);
        set_content(gc_logger_level
                   ,gc_level_description
                   ,l_prefs.loglevel);
    END set_logger_preferences;

    FUNCTION get_logger_preferences RETURN logger_preferences IS
        l_prefs logger_preferences;
    BEGIN
        SELECT *
        INTO l_prefs.loglevel
            ,l_prefs.client_id
        FROM (SELECT pref_name
                    ,pref_value
              FROM ops_preferences)
        pivot(MAX(pref_value)
        FOR pref_name IN('LOGGER_LEVEL'
                        ,'LOGGER_CLIENT_ID'));

        RETURN l_prefs;
    EXCEPTION
        WHEN no_data_found THEN
            init_content_logging;
            RETURN get_logger_preferences;
        WHEN OTHERS THEN
            RAISE;
    END get_logger_preferences;

    PROCEDURE use_logger_preferences(p_prefs   IN logger_preferences
                                    ,p_verbose IN BOOLEAN DEFAULT FALSE) IS
        l_prefs logger_preferences := p_prefs;
        lc_stack_level CONSTANT PLS_INTEGER := 3;
    BEGIN
        -- logger.set_level(p_level     => l_prefs.loglevel
        --                 ,p_client_id => l_prefs.client_id);

        sys.dbms_session.set_identifier(l_prefs.client_id);
        IF p_verbose THEN
            sys.dbms_output.put_line(sys.utl_call_stack.owner(lc_stack_level) || '.' ||
                                     sys.utl_call_stack.concatenate_subprogram(sys.utl_call_stack.subprogram(lc_stack_level)) || ' (' ||
                                     sys.utl_call_stack.unit_line(lc_stack_level) || ') set LOGGER.LEVEL to "' ||
                                     l_prefs.loglevel || '"\n  LOGGER.CLIENT_ID  and SESSION identifier to "' ||
                                     l_prefs.client_id || '"');
        END IF;
    END use_logger_preferences;

    PROCEDURE get_and_use_logger_preferences(p_verbose IN BOOLEAN DEFAULT FALSE) AS
        l_prefs logger_preferences;
    BEGIN
        l_prefs := get_logger_preferences;
        use_logger_preferences(l_prefs
                              ,p_verbose);
    END get_and_use_logger_preferences;

    FUNCTION get_batchsize_preferences(p_batchsize IN NUMBER) RETURN batchsize_preferences IS
        l_result batchsize_preferences;
    BEGIN
        IF p_batchsize IS NULL THEN
            l_result.batch_size := get_pref_value(gc_default_batchsize);
            l_result.is_default := TRUE;
        ELSE
            l_result.batch_size := p_batchsize;
            l_result.is_default := FALSE;
        END IF;

        RETURN l_result;
    EXCEPTION
        WHEN e_preference_not_given THEN
            init_default_batchsize;
            RETURN get_batchsize_preferences(p_batchsize);
        WHEN OTHERS THEN
            RAISE;
    END get_batchsize_preferences;

    FUNCTION get_tag_preferences(p_tag IN VARCHAR2) RETURN tag_preferences IS
        l_result tag_preferences;
    BEGIN
        IF p_tag IS NULL THEN
            l_result.tag        := get_pref_value(gc_default_tag);
            l_result.is_default := TRUE;
        ELSE
            l_result.tag        := p_tag;
            l_result.is_default := FALSE;
        END IF;

        RETURN l_result;
    EXCEPTION
        WHEN e_preference_not_given THEN
            init_default_tag;
            RETURN get_tag_preferences(p_tag);
        WHEN OTHERS THEN
            RAISE;
    END get_tag_preferences;

BEGIN
    init_content_logging;
END pkg_preferences;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_PREFERENCES" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_PREFERENCES" TO "PIBICSAPP";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_PREFERENCES" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_PREFERENCES" TO "BIOSUPPORT";
