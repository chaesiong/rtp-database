CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_INTERFACE"."PKG_WEBSERVICES_BLACKLIST" AS
/*******************************************************************************
 * ???
 *
 * Author    Date        Description
 * --------  ----------  -------------------------------------------------------*
 * CHageman  19.09.2018  Added
 *******************************************************************************/

  c_scope_prefix        CONSTANT VARCHAR2(31) := lower($$plsql_unit) || '.';

  PROCEDURE add_blacklist_log (p_blacklist_log_rec  IN log_blacklist_hits%ROWTYPE)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'add_blacklist_log';
    l_params logger.tab_param;
    --

  BEGIN

    logger.log('ADD BLACKLIST LOG: start', l_scope, null, l_params);

    INSERT INTO log_blacklist_hits VALUES p_blacklist_log_rec;

    logger.log('ADD BLACKLIST LOG: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('ADD BLACKLIST LOG: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END add_blacklist_log;

  /**
   * Searches blacklist system via Webservice Request to BlacklistService and sends the answer as response (CLOB)
   * Also logs the request and response information into DL_INTERFACE.LOG_BLACKLIST_HITS
   * @param p_request_clob Request CLOB
   * @return CLOB Response CLOB
   */
  FUNCTION search_blacklist_system (p_request_clob  IN CLOB
                                   ,p_user          IN VARCHAR2 DEFAULT NULL
                                   ,p_system        IN VARCHAR2 DEFAULT NULL
                                   ,p_object_id     IN VARCHAR2 DEFAULT NULL)
  RETURN CLOB
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'search_blacklist_system';
    l_params logger.tab_param;
    --
    l_result      CLOB;
    l_time_start  DATE;
    l_time_end    DATE;
    --
    l_log_blacklist_hit_rec log_blacklist_hits%ROWTYPE;
    --
    l_json_hits_array JSON_ARRAY_T;
    l_json_result     JSON_OBJECT_T;
    --
    l_candidate_count NUMBER default 0;

  BEGIN


    logger.append_param(l_params, 'p_system', p_system);
    logger.append_param(l_params, 'p_user', p_user);
    logger.append_param(l_params, 'p_object_id', p_object_id);
    logger.log('START', l_scope, null, l_params);

    logger.append_param(l_params, 'dbms_lob.substr(p_request_clob, 3000, 1)', dbms_lob.substr(p_request_clob, 3000, 1)); -- dont use 4k, could be multibyte
    logger.append_param(l_params, 'Adresse', pkg_utils.get_server_address() || '/tmp/bpm/blacklist/search');
    logger.log('SEARCH BLACKLIST SYSTEM: start', l_scope, null, l_params);

    l_time_start := SYSDATE;

    --dl_common.pljson_printer.htp_output_clob(v_clob);
    --http://tha20675-app01-dev.dev.dc.dermalog.hh/bpm/blacklist/search

    apex_web_service.g_request_headers(1).name := 'Content-Type';
    apex_web_service.g_request_headers(1).value := 'application/json; charset=utf-8';

    -- !! This service is intenionally hard coded because it's just temporary
    -- !! As soon as the blacklist service was enhanced by the logging functionality, this function won't be used anymore
    l_result := APEX_WEB_SERVICE.MAKE_REST_REQUEST (p_url         => pkg_utils.get_server_address() || '/tmp/bpm/blacklist/search'
                                                   ,p_http_method => 'POST'
                                                   ,p_body        => p_request_clob);

    logger.append_param(l_params, 'dbms_lob.substr(l_result, 3000, 1)', dbms_lob.substr(l_result, 3000, 1)); -- dont use 4k, could be multibyte

    if l_result is not null then
        l_json_result := JSON_OBJECT_T(l_result);

        if l_json_result is not null then
            l_json_hits_array := l_json_result.get_array('candidates');

            if l_json_hits_array is not null then
                l_candidate_count := l_json_hits_array.get_size;
            end if;
        end if;
    end if;

    l_time_end := SYSDATE;

    l_log_blacklist_hit_rec.sender_system         := p_system;
    l_log_blacklist_hit_rec.sender_user           := p_user;
    l_log_blacklist_hit_rec.sender_object_id      := p_object_id;
    l_log_blacklist_hit_rec.sender_request        := p_request_clob;
    l_log_blacklist_hit_rec.response              := l_result;
    l_log_blacklist_hit_rec.elapsed_time_seconds  := (l_time_end - l_time_start) * 24 * 60 * 60;
    l_log_blacklist_hit_rec.number_of_hits        := l_candidate_count;

    add_blacklist_log(l_log_blacklist_hit_rec);

    logger.log('SEARCH BLACKLIST SYSTEM: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('SEARCH BLACKLHIST SYSTEM: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END search_blacklist_system;

  /**
   * Searches blacklist system via Webservice Request to BlacklistService and sends the answer as response (CLOB)
   * Also logs the request and response information into DL_INTERFACE.LOG_BLACKLIST_HITS
   * @param p_request_clob Request CLOB
   * @return CLOB Response CLOB
   */
  FUNCTION search_BLDemographic_system (p_request_clob  IN CLOB
                                       ,p_user          IN VARCHAR2 DEFAULT NULL
                                       ,p_system        IN VARCHAR2 DEFAULT NULL
                                       ,p_object_id     IN VARCHAR2 DEFAULT NULL)
  RETURN CLOB
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'search_BLDemographic_system';
    l_params logger.tab_param;
    --
    l_result      CLOB;
    l_time_start  DATE;
    l_time_end    DATE;
    --
    l_log_blacklist_hit_rec log_blacklist_hits%ROWTYPE;
    --
    l_json_hits_array JSON_ARRAY_T;
    l_json_result     JSON_OBJECT_T;
    --
    l_candidate_count NUMBER default 0;

  BEGIN

    logger.append_param(l_params, 'dbms_lob.substr(p_request_clob, 3000, 1)', dbms_lob.substr(p_request_clob, 3000, 1)); -- dont use 4k, could be multibyte
    logger.append_param(l_params, 'p_system', p_system);
    logger.append_param(l_params, 'p_user', p_user);
    logger.append_param(l_params, 'p_object_id', p_object_id);
    logger.append_param(l_params, 'Adresse', pkg_utils.get_server_address() || '/ords/dl_bordercontrol/blacklist/demographic/search/BLDemographic');
    logger.log('SEARCH BLDEMOGRAPHIC SYSTEM: start', l_scope, null, l_params);

    l_time_start := SYSDATE;

    --dl_common.pljson_printer.htp_output_clob(v_clob);
    --http://tha20675-app01-dev.dev.dc.dermalog.hh/bpm/blacklist/search

    apex_web_service.g_request_headers(1).name := 'Content-Type';
    apex_web_service.g_request_headers(1).value := 'application/json; charset=utf-8';

    -- !! This service is intenionally hard coded because it's just temporary
    -- !! As soon as the blacklist service was enhanced by the logging functionality, this function won't be used anymore
    l_result := APEX_WEB_SERVICE.MAKE_REST_REQUEST (p_url         => pkg_utils.get_server_address() || '/ords/dl_bordercontrol/blacklist/demographic/search/BLDemographic'
                                                   ,p_http_method => 'POST'
                                                   ,p_body        => p_request_clob);

    logger.append_param(l_params, 'dbms_lob.substr(l_result, 3000, 1)', dbms_lob.substr(l_result, 3000, 1)); -- dont use 4k, could be multibyte

    if l_result is not null then
        l_json_result := JSON_OBJECT_T(l_result);

        if l_json_result is not null then
            l_json_hits_array := l_json_result.get_array('candidates');

            if l_json_hits_array is not null then
                l_candidate_count := l_json_hits_array.get_size;
            end if;
        end if;
    end if;

    l_time_end := SYSDATE;

    l_log_blacklist_hit_rec.sender_system         := p_system;
    l_log_blacklist_hit_rec.sender_user           := p_user;
    l_log_blacklist_hit_rec.sender_object_id      := p_object_id;
    l_log_blacklist_hit_rec.sender_request        := p_request_clob;
    l_log_blacklist_hit_rec.response              := l_result;
    l_log_blacklist_hit_rec.elapsed_time_seconds  := (l_time_end - l_time_start) * 24 * 60 * 60;
    l_log_blacklist_hit_rec.number_of_hits        := l_candidate_count;

    add_blacklist_log(l_log_blacklist_hit_rec);

    logger.log('SEARCH BLDEMOGRAPHIC SYSTEM: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('SEARCH BLDEMOGRAPHIC SYSTEM: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END search_BLDemographic_system;

  /**
   * Searches ICPO system via Webservice Request
   * Also logs the request and response information into DL_INTERFACE.LOG_BLACKLIST_HITS
   * @param p_request_clob Request CLOB
   * @return CLOB Response CLOB
   */
  FUNCTION search_ICPO (p_request_clob  IN CLOB
                       ,p_request_type  IN VARCHAR2 DEFAULT NULL
                       ,p_user          IN VARCHAR2 DEFAULT NULL
                       ,p_system        IN VARCHAR2 DEFAULT NULL
                       ,p_object_id     IN VARCHAR2 DEFAULT NULL)
  RETURN CLOB
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'search_ICPO';
    l_params logger.tab_param;
    --
    l_url         VARCHAR2(2000);
    l_result      CLOB;
    l_time_start  DATE;
    l_time_end    DATE;
    --
    l_log_blacklist_hit_rec log_blacklist_hits%ROWTYPE;
    --
    l_json_result     JSON_OBJECT_T;
    l_number_of_hits  NUMBER := 0;
    --

  BEGIN

    logger.append_param(l_params, 'dbms_lob.substr(p_request_clob, 3000, 1)', dbms_lob.substr(p_request_clob, 3000, 1)); -- dont use 4k, could be multibyte
    logger.append_param(l_params, 'p_request_type', p_request_type);
    logger.append_param(l_params, 'p_system', p_system);
    logger.append_param(l_params, 'p_user', p_user);
    logger.append_param(l_params, 'p_object_id', p_object_id);

    l_url := pkg_utils.get_server_address() || '/ords/dl_bordercontrol/ICPO/search' || CASE WHEN p_request_type IS NOT NULL THEN '/' || p_request_type END;

    logger.append_param(l_params, 'Adresse', l_url);
    logger.log('SEARCH ICPO: start', l_scope, null, l_params);

    l_time_start := SYSDATE;

    apex_web_service.g_request_headers(1).name := 'Content-Type';
    apex_web_service.g_request_headers(1).value := 'application/json; charset=utf-8';

    -- !! This service is intenionally hard coded because it's just temporary
    -- !! As soon as the blacklist service was enhanced by the logging functionality, this function won't be used anymore
    l_result := APEX_WEB_SERVICE.MAKE_REST_REQUEST (p_url         => l_url
                                                   ,p_http_method => 'POST'
                                                   ,p_body        => p_request_clob);

    logger.append_param(l_params, 'dbms_lob.substr(l_result, 3000, 1)', dbms_lob.substr(l_result, 3000, 1)); -- dont use 4k, could be multibyte

    l_json_result := JSON_OBJECT_T(l_result);
    l_number_of_hits := l_json_result.get_object('status').get_Number('code');
    
    IF SIGN(NVL(l_number_of_hits, 0)) = -1 THEN
        l_number_of_hits := 0;
    END IF;

    l_time_end := SYSDATE;

    l_log_blacklist_hit_rec.sender_system         := p_system;
    l_log_blacklist_hit_rec.sender_user           := p_user;
    l_log_blacklist_hit_rec.sender_object_id      := p_object_id;
    l_log_blacklist_hit_rec.sender_request        := p_request_clob;
    l_log_blacklist_hit_rec.response              := l_result;
    l_log_blacklist_hit_rec.elapsed_time_seconds  := (l_time_end - l_time_start) * 24 * 60 * 60;
    l_log_blacklist_hit_rec.number_of_hits        := l_number_of_hits;

    add_blacklist_log(l_log_blacklist_hit_rec);

    logger.log('SEARCH ICPO: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('SEARCH ICPO: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END search_ICPO;

END;
/
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_WEBSERVICES_BLACKLIST" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_WEBSERVICES_BLACKLIST" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_WEBSERVICES_BLACKLIST" TO "APPSUP";
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_WEBSERVICES_BLACKLIST" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_WEBSERVICES_BLACKLIST" TO "BIOSUPPORT";
