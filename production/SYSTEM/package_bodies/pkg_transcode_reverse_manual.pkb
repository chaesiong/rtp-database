CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "SYSTEM"."PKG_TRANSCODE_REVERSE_MANUAL" AS

    c_scope_prefix CONSTANT logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';

    FUNCTION get_conveyance_seqno_with_seqno (p_seqno IN varchar2)
    RETURN trcd_conveyance.seqno%TYPE
    IS

      l_scope logger_logs.scope%type := c_scope_prefix || 'get_conveyance_seqno';
      l_params logger.tab_param;
      --
      l_result trcd_conveyance.seqno%TYPE;

    BEGIN

      logger.append_param(l_params, 'p_key_value', p_key_value);
      logger.log('get_conveyance_seqno: start', l_scope, null, l_params);

      BEGIN
        SELECT seqno INTO l_result FROM trcd_conveyance WHERE seqno = p_seqno;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := NULL;
      END;

      logger.append_param(l_params, 'l_result', l_result);
      logger.log('get_conveyance_seqno: done', l_scope, null, l_params);

      RETURN l_result;

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('get_conveyance_seqno: unhandled exeption', l_scope, null, l_params);
        RAISE;
    END;

    -- ---------------------------------------------------------------------------------
END pkg_transcode_reverse_manual;
/
