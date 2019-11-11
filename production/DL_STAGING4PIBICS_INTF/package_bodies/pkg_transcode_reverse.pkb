CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS_INTF"."PKG_TRANSCODE_REVERSE" AS

    c_scope_prefix CONSTANT logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';

    FUNCTION get_ampur_seqno (p_key_value  IN trcd_ampur.key_value%TYPE)
    RETURN trcd_ampur.seqno%TYPE
    IS

      l_scope logger_logs.scope%type := c_scope_prefix || 'get_ampur_seqno';
      l_params logger.tab_param;
      --
      l_result trcd_ampur.seqno%TYPE;

    BEGIN

      logger.append_param(l_params, 'p_key_value', p_key_value);
      logger.log('get_ampur_seqno: start', l_scope, null, l_params);

      BEGIN
        SELECT seqno INTO l_result FROM trcd_ampur WHERE key_value = p_key_value;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := NULL;
      END;

      logger.append_param(l_params, 'l_result', l_result);
      logger.log('get_ampur_seqno: done', l_scope, null, l_params);

      RETURN l_result;

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('get_ampur_seqno: unhandled exeption', l_scope, null, l_params);
        RAISE;
    END;

    -- ---------------------------------------------------------------------------------

    FUNCTION get_borderpost_seqno (p_key_value IN trcd_borderpost.key_value%TYPE)
    RETURN trcd_borderpost.seqno%TYPE
    IS

      l_scope logger_logs.scope%type := c_scope_prefix || 'get_borderpost_seqno';
      l_params logger.tab_param;
      --
      l_result trcd_borderpost.seqno%TYPE;

    BEGIN

      logger.append_param(l_params, 'p_key_value', p_key_value);
      logger.log('get_borderpost_seqno: start', l_scope, null, l_params);

      BEGIN
        SELECT seqno INTO l_result FROM trcd_borderpost WHERE key_value = p_key_value;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := NULL;
      END;

      logger.append_param(l_params, 'l_result', l_result);
      logger.log('get_borderpost_seqno: done', l_scope, null, l_params);

      RETURN l_result;

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('get_borderpost_seqno: unhandled exeption', l_scope, null, l_params);
        RAISE;
    END;

    -- ---------------------------------------------------------------------------------

    FUNCTION get_continent_seqno (p_key_value IN trcd_continent.key_value%TYPE)
    RETURN trcd_continent.seqno%TYPE
    IS

      l_scope logger_logs.scope%type := c_scope_prefix || 'get_continent_seqno';
      l_params logger.tab_param;
      --
      l_result trcd_continent.seqno%TYPE;

    BEGIN

      logger.append_param(l_params, 'p_key_value', p_key_value);
      logger.log('get_continent_seqno: start', l_scope, null, l_params);

      BEGIN
        SELECT seqno INTO l_result FROM trcd_continent WHERE key_value = p_key_value;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := NULL;
      END;

      logger.append_param(l_params, 'l_result', l_result);
      logger.log('get_continent_seqno: done', l_scope, null, l_params);

      RETURN l_result;

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('get_continent_seqno: unhandled exeption', l_scope, null, l_params);
        RAISE;
    END;

    -- ---------------------------------------------------------------------------------

    FUNCTION get_conveyance_seqno (p_key_value IN trcd_conveyance.key_value%TYPE)
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
        SELECT seqno INTO l_result FROM trcd_conveyance WHERE key_value = p_key_value;
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

    FUNCTION get_country_seqno (p_key_value IN trcd_country.key_value%TYPE)
    RETURN trcd_country.seqno%TYPE
    IS

      l_scope logger_logs.scope%type := c_scope_prefix || 'get_continent_seqno';
      l_params logger.tab_param;
      --
      l_result trcd_country.seqno%TYPE;

    BEGIN

      logger.append_param(l_params, 'p_key_value', p_key_value);
      logger.log('get_continent_seqno: start', l_scope, null, l_params);

      BEGIN
        SELECT seqno INTO l_result FROM trcd_country WHERE key_value = p_key_value;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := NULL;
      END;

      logger.append_param(l_params, 'l_result', l_result);
      logger.log('get_continent_seqno: done', l_scope, null, l_params);

      RETURN l_result;

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('get_continent_seqno: unhandled exeption', l_scope, null, l_params);
        RAISE;
    END;

    -- ---------------------------------------------------------------------------------

    FUNCTION get_flightnumbers_seqno (p_key_value IN trcd_flightnumbers.key_value%TYPE)
    RETURN trcd_flightnumbers.seqno%TYPE
    IS

      l_scope logger_logs.scope%type := c_scope_prefix || 'get_flightnumbers_seqno';
      l_params logger.tab_param;
      --
      l_result trcd_flightnumbers.seqno%TYPE;

    BEGIN

      logger.append_param(l_params, 'p_key_value', p_key_value);
      logger.log('get_flightnumbers_seqno: start', l_scope, null, l_params);

      BEGIN
        SELECT seqno INTO l_result FROM trcd_flightnumbers WHERE key_value = p_key_value;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := NULL;
      END;

      logger.append_param(l_params, 'l_result', l_result);
      logger.log('get_flightnumbers_seqno: done', l_scope, null, l_params);

      RETURN l_result;

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('get_flightnumbers_seqno: unhandled exeption', l_scope, null, l_params);
        RAISE;
    END;

    -- ---------------------------------------------------------------------------------

    FUNCTION get_icao_doc_codes_seqno (p_key_value IN trcd_icao_doc_codes.key_value%TYPE)
    RETURN trcd_icao_doc_codes.seqno%TYPE
    IS

      l_scope logger_logs.scope%type := c_scope_prefix || 'get_icao_doc_codes_seqno';
      l_params logger.tab_param;
      --
      l_result trcd_icao_doc_codes.seqno%TYPE;

    BEGIN

      logger.append_param(l_params, 'p_key_value', p_key_value);
      logger.log('get_icao_doc_codes_seqno: start', l_scope, null, l_params);

      BEGIN
        SELECT seqno INTO l_result FROM trcd_icao_doc_codes WHERE key_value = p_key_value;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := NULL;
      END;

      logger.append_param(l_params, 'l_result', l_result);
      logger.log('get_icao_doc_codes_seqno: done', l_scope, null, l_params);

      RETURN l_result;

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('get_icao_doc_codes_seqno: unhandled exeption', l_scope, null, l_params);
        RAISE;
    END;

    -- ---------------------------------------------------------------------------------

    FUNCTION get_occupation_seqno (p_key_value IN trcd_occupation.key_value%TYPE)
    RETURN trcd_occupation.seqno%TYPE
    IS

      l_scope logger_logs.scope%type := c_scope_prefix || 'get_occupation_seqno';
      l_params logger.tab_param;
      --
      l_result trcd_occupation.seqno%TYPE;

    BEGIN

      logger.append_param(l_params, 'p_key_value', p_key_value);
      logger.log('get_occupation_seqno: start', l_scope, null, l_params);

      BEGIN
        SELECT seqno INTO l_result FROM trcd_occupation WHERE key_value = p_key_value;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := NULL;
      END;

      logger.append_param(l_params, 'l_result', l_result);
      logger.log('get_occupation_seqno: done', l_scope, null, l_params);

      RETURN l_result;

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('get_occupation_seqno: unhandled exeption', l_scope, null, l_params);
        RAISE;
    END;

    -- ---------------------------------------------------------------------------------

    FUNCTION get_paymentrate_seqno (p_key_value IN trcd_paymentrate.key_value%TYPE)
    RETURN trcd_paymentrate.seqno%TYPE
    IS

      l_scope logger_logs.scope%type := c_scope_prefix || 'get_paymentrate_seqno';
      l_params logger.tab_param;
      --
      l_result trcd_paymentrate.seqno%TYPE;

    BEGIN

      logger.append_param(l_params, 'p_key_value', p_key_value);
      logger.log('get_paymentrate_seqno: start', l_scope, null, l_params);

      BEGIN
        SELECT seqno INTO l_result FROM trcd_paymentrate WHERE key_value = p_key_value;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := NULL;
      END;

      logger.append_param(l_params, 'l_result', l_result);
      logger.log('get_paymentrate_seqno: done', l_scope, null, l_params);

      RETURN l_result;

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('get_paymentrate_seqno: unhandled exeption', l_scope, null, l_params);
        RAISE;
    END;

    -- ---------------------------------------------------------------------------------

    FUNCTION get_permittype_seqno (p_key_value IN trcd_permittype.key_value%TYPE)
    RETURN trcd_permittype.seqno%TYPE
    IS

      l_scope logger_logs.scope%type := c_scope_prefix || 'get_permittype_seqno';
      l_params logger.tab_param;
      --
      l_result trcd_permittype.seqno%TYPE;

    BEGIN

      logger.append_param(l_params, 'p_key_value', p_key_value);
      logger.log('get_permittype_seqno: start', l_scope, null, l_params);

      BEGIN
        SELECT seqno INTO l_result FROM trcd_permittype WHERE key_value = p_key_value;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := NULL;
      END;

      logger.append_param(l_params, 'l_result', l_result);
      logger.log('get_permittype_seqno: done', l_scope, null, l_params);

      RETURN l_result;

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('get_permittype_seqno: unhandled exeption', l_scope, null, l_params);
        RAISE;
    END;

    -- ---------------------------------------------------------------------------------

    FUNCTION get_province_seqno (p_key_value IN trcd_province.key_value%TYPE)
    RETURN trcd_province.seqno%TYPE
    IS

      l_scope logger_logs.scope%type := c_scope_prefix || 'get_province_seqno';
      l_params logger.tab_param;
      --
      l_result trcd_province.seqno%TYPE;

    BEGIN

      logger.append_param(l_params, 'p_key_value', p_key_value);
      logger.log('get_province_seqno: start', l_scope, null, l_params);

      BEGIN
        SELECT seqno INTO l_result FROM trcd_province WHERE key_value = p_key_value;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := NULL;
      END;

      logger.append_param(l_params, 'l_result', l_result);
      logger.log('get_province_seqno: done', l_scope, null, l_params);

      RETURN l_result;

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('get_province_seqno: unhandled exeption', l_scope, null, l_params);
        RAISE;
    END;

    -- ---------------------------------------------------------------------------------

    FUNCTION get_rankcrw_seqno (p_key_value IN trcd_rankcrw.key_value%TYPE)
    RETURN trcd_rankcrw.rankcrw_seqno%TYPE
    IS

      l_scope logger_logs.scope%type := c_scope_prefix || 'get_rankcrw_seqno';
      l_params logger.tab_param;
      --
      l_result trcd_rankcrw.rankcrw_seqno%TYPE;

    BEGIN

      logger.append_param(l_params, 'p_key_value', p_key_value);
      logger.log('get_rankcrw_seqno: start', l_scope, null, l_params);

      BEGIN
        SELECT rankcrw_seqno INTO l_result FROM trcd_rankcrw WHERE key_value = p_key_value;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := NULL;
      END;

      logger.append_param(l_params, 'l_result', l_result);
      logger.log('get_rankcrw_seqno: done', l_scope, null, l_params);

      RETURN l_result;

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('get_rankcrw_seqno: unhandled exeption', l_scope, null, l_params);
        RAISE;
    END;

    -- ---------------------------------------------------------------------------------

    FUNCTION get_region_seqno (p_key_value IN trcd_region.key_value%TYPE)
    RETURN trcd_region.seqno%TYPE
    IS

      l_scope logger_logs.scope%type := c_scope_prefix || 'get_region_seqno';
      l_params logger.tab_param;
      --
      l_result trcd_region.seqno%TYPE;

    BEGIN

      logger.append_param(l_params, 'p_key_value', p_key_value);
      logger.log('get_region_seqno: start', l_scope, null, l_params);

      BEGIN
        SELECT seqno INTO l_result FROM trcd_region WHERE key_value = p_key_value;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := NULL;
      END;

      logger.append_param(l_params, 'l_result', l_result);
      logger.log('get_region_seqno: done', l_scope, null, l_params);

      RETURN l_result;

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('get_region_seqno: unhandled exeption', l_scope, null, l_params);
        RAISE;
    END;

    -- ---------------------------------------------------------------------------------

    FUNCTION get_suffix_seqno (p_key_value IN trcd_suffix.key_value%TYPE)
    RETURN trcd_suffix.seqno%TYPE
    IS

      l_scope logger_logs.scope%type := c_scope_prefix || 'get_suffix_seqno';
      l_params logger.tab_param;
      --
      l_result trcd_suffix.seqno%TYPE;

    BEGIN

      logger.append_param(l_params, 'p_key_value', p_key_value);
      logger.log('get_suffix_seqno: start', l_scope, null, l_params);

      BEGIN
        SELECT seqno INTO l_result FROM trcd_suffix WHERE key_value = p_key_value;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := NULL;
      END;

      logger.append_param(l_params, 'l_result', l_result);
      logger.log('get_suffix_seqno: done', l_scope, null, l_params);

      RETURN l_result;

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('get_suffix_seqno: unhandled exeption', l_scope, null, l_params);
        RAISE;
    END;

    -- ---------------------------------------------------------------------------------

    FUNCTION get_tambon_seqno (p_key_value IN trcd_tambon.key_value%TYPE)
    RETURN trcd_tambon.seqno%TYPE
    IS

      l_scope logger_logs.scope%type := c_scope_prefix || 'get_tambon_seqno';
      l_params logger.tab_param;
      --
      l_result trcd_tambon.seqno%TYPE;

    BEGIN

      logger.append_param(l_params, 'p_key_value', p_key_value);
      logger.log('get_tambon_seqno: start', l_scope, null, l_params);

      BEGIN
        SELECT seqno INTO l_result FROM trcd_tambon WHERE key_value = p_key_value;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := NULL;
      END;

      logger.append_param(l_params, 'l_result', l_result);
      logger.log('get_tambon_seqno: done', l_scope, null, l_params);

      RETURN l_result;

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('get_tambon_seqno: unhandled exeption', l_scope, null, l_params);
        RAISE;
    END;

    -- ---------------------------------------------------------------------------------

    FUNCTION get_traveldoctype_seqno (p_key_value IN trcd_traveldoctype.key_value%TYPE)
    RETURN trcd_traveldoctype.seqno%TYPE
    IS

      l_scope logger_logs.scope%type := c_scope_prefix || 'get_traveldoctype_seqno';
      l_params logger.tab_param;
      --
      l_result trcd_traveldoctype.seqno%TYPE;

    BEGIN

      logger.append_param(l_params, 'p_key_value', p_key_value);
      logger.log('get_traveldoctype_seqno: start', l_scope, null, l_params);

      BEGIN
        SELECT seqno INTO l_result FROM trcd_traveldoctype WHERE key_value = p_key_value;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := NULL;
      END;

      logger.append_param(l_params, 'l_result', l_result);
      logger.log('get_traveldoctype_seqno: done', l_scope, null, l_params);

      RETURN l_result;

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('get_traveldoctype_seqno: unhandled exeption', l_scope, null, l_params);
        RAISE;
    END;

    -- ---------------------------------------------------------------------------------

    FUNCTION get_visatype_seqno (p_key_value IN trcd_visatype.key_value%TYPE)
    RETURN trcd_visatype.seqno%TYPE
    IS

      l_scope logger_logs.scope%type := c_scope_prefix || 'get_visatype_seqno';
      l_params logger.tab_param;
      --
      l_result trcd_visatype.seqno%TYPE;

    BEGIN

      logger.append_param(l_params, 'p_key_value', p_key_value);
      logger.log('get_visatype_seqno: start', l_scope, null, l_params);

      BEGIN
        SELECT seqno INTO l_result FROM trcd_visatype WHERE key_value = p_key_value;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := NULL;
      END;

      logger.append_param(l_params, 'l_result', l_result);
      logger.log('get_visatype_seqno: done', l_scope, null, l_params);

      RETURN l_result;

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('get_visatype_seqno: unhandled exeption', l_scope, null, l_params);
        RAISE;
    END;
    
    FUNCTION get_relation_seqno (p_key_value IN varchar2)
    RETURN int
    IS

      l_scope logger_logs.scope%type := c_scope_prefix || 'get_relation_seqno';
      l_params logger.tab_param;
      --
      l_result int;

    BEGIN

      logger.append_param(l_params, 'p_key_value', p_key_value);
      logger.log('get_relation_seqno: start', l_scope, null, l_params);

      BEGIN
        select RPJSEQNO INTO l_result from pibicsdm2.RELATIONPASSJOIN a
        inner join DL_COMMON.RELATIONS b on a.RPJCD = b.DISPLAY_CODE
        where b.key_value = p_key_value;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := NULL;
      END;

      logger.append_param(l_params, 'l_result', l_result);
      logger.log('get_relation_seqno: done', l_scope, null, l_params);

      RETURN l_result;

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('get_relation_seqno: unhandled exeption', l_scope, null, l_params);
        RAISE;
    END;

    -- ---------------------------------------------------------------------------------

    -- ---------------------------------------------------------------------------------

    FUNCTION get_movement_seqno (p_key_value IN sync_movements.mvmntid%TYPE)
    RETURN sync_movements.seqno%TYPE
    IS

      l_scope logger_logs.scope%type := c_scope_prefix || 'get_movement_seqnp';
      l_params logger.tab_param;
      --
      l_result sync_movements.seqno%TYPE;

    BEGIN

      logger.append_param(l_params, 'p_key_value', p_key_value);
      logger.log('get_movement_seqnp: start', l_scope, null, l_params);

      BEGIN
        SELECT seqno INTO l_result FROM sync_movements WHERE mvmntid = p_key_value;
      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_result := NULL;
      END;

      logger.append_param(l_params, 'l_result', l_result);
      logger.log('get_movement_seqnp: done', l_scope, null, l_params);

      RETURN l_result;

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('get_movement_seqnp: unhandled exeption', l_scope, null, l_params);
        RAISE;
    END;

    -- ---------------------------------------------------------------------------------


END pkg_transcode_reverse;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_TRANSCODE_REVERSE" TO "DL_INTERFACE";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_TRANSCODE_REVERSE" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_TRANSCODE_REVERSE" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_TRANSCODE_REVERSE" TO "PIBICSAPP";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_TRANSCODE_REVERSE" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_TRANSCODE_REVERSE" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_TRANSCODE_REVERSE" TO "BIOSAADM";
