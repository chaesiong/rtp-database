CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_BLACKLIST_UTIL" IS
/*******************************************************************************
 * This package provides several functionalities to call blacklist information
 * and handle with those
 *
 * Author    Date        Description
 * --------  ----------  -------------------------------------------------------*
 * CHageman  11.05.2018  Added
 *******************************************************************************/

  /****************************************
   * ========== TYPE DEFINITIONS ==========
   ****************************************/

  c_scope_prefix        CONSTANT VARCHAR2(31) := lower($$plsql_unit) || '.';
  --
  c_param_blacklist_simple    CONSTANT VARCHAR(255 CHAR) := pkg_common.get_parameter('BLACKLIST_SIMPLE');
  c_param_blacklist_advanced  CONSTANT VARCHAR(255 CHAR) := pkg_common.get_parameter('BLACKLIST_ADVANCED');

  /************************************************
   * ========== FUNCTIONS AND PROCEDURES ==========
   ************************************************/

  /**
   * This function creates (or replaces) the existing Blacklist Hits collection and inserts
   * the plain JSON CLOB, but also the entries into the entries collection
   * @param p_blacklist_search_rec Includes all information and data to search for entries
   */
  PROCEDURE set_coll_by_advanced_search (p_blacklist_search_rec   blacklist_search_typ)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'set_coll_by_advanced_search';
    l_params logger.tab_param;
    --
    l_gender              dl_common.human_sexes.key_value%TYPE;
    l_collection_created  BOOLEAN := FALSE;
    --
    l_response_body  VARCHAR2(32000 CHAR);
    l_post_body      VARCHAR2(4000 CHAR);
    --
    CURSOR l_entries_cur (p_json_string IN VARCHAR2) IS
    SELECT ROWNUM
          ,jt.*
      FROM JSON_TABLE(p_json_string, '$.demographics.candidates[*]'
              COLUMNS (rec_id             VARCHAR2(512 CHAR) PATH '$.blacklistId'
                      ,firstname          VARCHAR2(512 CHAR) PATH '$.demographics.details.firstname'
                      ,middlename         VARCHAR2(512 CHAR) PATH '$.demographics.details.middlename'
                      ,lastname           VARCHAR2(512 CHAR) PATH '$.demographics.details.lastname'
                      ,firstnameThai      VARCHAR2(512 CHAR) PATH '$.demographics.details.lastnameThai'
                      ,middlenameThai     VARCHAR2(512 CHAR) PATH '$.demographics.details.middlenameThai'
                      ,lastnameThai       VARCHAR2(512 CHAR) PATH '$.demographics.details.firstnameThai'
                      ,gender             VARCHAR2(512 CHAR) PATH '$.demographics.details.gender'
                      ,nationality        VARCHAR2(512 CHAR) PATH '$.demographics.details.nationality'
                      ,behaviour          VARCHAR2(512 CHAR) PATH '$.demographics.details.behaviour'
                      ,levelofconf        VARCHAR2(512 CHAR) PATH '$.demographics.details.levelOfConfidentially'
                      ,nextstep           VARCHAR2(512 CHAR) PATH '$.demographics.details.nextStep'
                      ,phone              VARCHAR2(512 CHAR) PATH '$.demographics.details.phone'
                      ,authority          VARCHAR2(512 CHAR) PATH '$.demographics.details.authority'
                      ,casenumber         VARCHAR2(512 CHAR) PATH '$.demographics.details.caseNumber'
                      ,contactrequired    VARCHAR2(512 CHAR) PATH '$.demographics.details.contactRequired'
                      ,reason             VARCHAR2(512 CHAR) PATH '$.demographics.details.reason'
                      ,dateofbirth        VARCHAR2(512 CHAR) PATH '$.demographics.dateOfBirth'
                      ,entrydate          VARCHAR2(512 CHAR) PATH '$.demographics.details.entryDate'
                      ,passport_no        VARCHAR2(512 CHAR) PATH '$.demographics.details.passportNo'
                      ,arrivaldate        VARCHAR2(512 CHAR) PATH '$.demographics.details.arrivalDate'
                      ,tm6number          VARCHAR2(512 CHAR) PATH '$.demographics.details.tm6Number')) jt;

  BEGIN

    logger.append_param(l_params, 'p_blacklist_search_rec.date_of_birth', p_blacklist_search_rec.date_of_birth);
    logger.append_param(l_params, 'p_blacklist_search_rec.expiry_date', p_blacklist_search_rec.expiry_date);
    logger.append_param(l_params, 'p_blacklist_search_rec.first_name', p_blacklist_search_rec.first_name);
    logger.append_param(l_params, 'p_blacklist_search_rec.middle_name', p_blacklist_search_rec.middle_name);
    logger.append_param(l_params, 'p_blacklist_search_rec.last_name', p_blacklist_search_rec.last_name);
    logger.append_param(l_params, 'p_blacklist_search_rec.nationality', p_blacklist_search_rec.nationality);
    logger.append_param(l_params, 'p_blacklist_search_rec.passport_no', p_blacklist_search_rec.passport_no);
    logger.append_param(l_params, 'p_blacklist_search_rec.sex', p_blacklist_search_rec.sex);

    logger.log('SET COLLECTION (ADVANCED SEARCH): start', l_scope, null, l_params);

    -- 1. Create collections
    -- !! Collections can only be created in / with Oracle APEX !!
    BEGIN

      apex_collection.create_or_truncate_collection(
          p_collection_name => pkg_blacklist_util.c_collection_name
      );

      apex_collection.create_or_truncate_collection(
          p_collection_name => pkg_blacklist_util.c_entires_collection_name
      );

      l_collection_created := TRUE;

    EXCEPTION
      WHEN OTHERS
      THEN
        NULL; -- TODO: error handling
    END;

    -- 2. prepare the REST Request
    -- 2.1 set JSON headers
    apex_web_service.g_request_headers(1).name := 'Content-Type';
    apex_web_service.g_request_headers(1).value := 'application/json';

    -- 2.2 get key_value of gender
    l_gender := 'MALE'; -- TODO

    -- 2.2 set POST Body
    l_post_body := '{"demographic":{
         "dateOfBirth": "'    || TO_CHAR(p_blacklist_search_rec.date_of_birth,'YYYY-MM-DD"T"HH24:MI:SS"Z"') || '"
        ,"expiryDate": "'     || TO_CHAR(p_blacklist_search_rec.expiry_date,'YYYY-MM-DD"T"HH24:MI:SS"Z"') || '"
        ,"firstname":"'       || p_blacklist_search_rec.first_name || '"
        ,"middlename":"'      || p_blacklist_search_rec.middle_name || '"
        ,"surname":"'         || p_blacklist_search_rec.last_name || '"
        ,"nationality":"'     || p_blacklist_search_rec.nationality || '"
        ,"passportNumber":"'  || p_blacklist_search_rec.passport_no || '"
        ,"sex":"'             || l_gender || '"}
      }';

    logger.append_param(l_params, 'l_post_body', l_post_body);

    -- 3. Do REST request
    l_response_body := apex_web_service.make_rest_request (p_url          => c_param_blacklist_advanced
                                                          ,p_http_method  => 'POST'
                                                          ,p_body         => l_post_body);

    -- 4. Save data into Collections
    IF l_collection_created
    THEN

      l_response_body := REPLACE(l_response_body, CHR(10));

      -- 4.1 Save CLOB
      apex_collection.add_member(
          p_collection_name => pkg_blacklist_util.c_collection_name
        , p_clob001 => l_response_body
      );

      -- 4.2 Save Entries into Entry-Collection
      FOR l_entry_rec IN l_entries_cur (l_response_body)
      LOOP

        apex_collection.add_member(
            p_collection_name => pkg_blacklist_util.c_entires_collection_name
          , p_c001 => l_entry_rec.rec_id
          , p_c002 => l_entry_rec.firstname
          , p_c003 => l_entry_rec.middlename
          , p_c004 => l_entry_rec.lastname
          , p_c005 => l_entry_rec.firstnameThai
          , p_c006 => l_entry_rec.middlenameThai
          , p_c007 => l_entry_rec.lastnameThai
          , p_c008 => l_entry_rec.gender
          , p_c009 => l_entry_rec.nationality
          , p_c010 => l_entry_rec.behaviour
          , p_c011 => l_entry_rec.levelofconf
          , p_c012 => l_entry_rec.nextstep
          , p_c013 => l_entry_rec.phone
          , p_c014 => l_entry_rec.authority
          , p_c015 => l_entry_rec.casenumber
          , p_c016 => l_entry_rec.contactrequired
          , p_c017 => l_entry_rec.reason
          , p_c018 => l_entry_rec.dateofbirth
          , p_c019 => l_entry_rec.entrydate
          , p_c020 => l_entry_rec.passport_no
          , p_c021 => l_entry_rec.arrivaldate
          , p_c022 => l_entry_rec.tm6number
        );
      END LOOP;
    END IF;

    logger.log('SET COLLECTION (ADVANCED SEARCH): done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('SET COLLECTION (ADVANCED SEARCH): unhandled exeption', l_scope, null, l_params);
      RAISE;
  END set_coll_by_advanced_search;

  /**
   * Searches the information from BLACKLIST_HITS collection and converts them into JSON
   * @param p_rec_id Record id of blacklist entry
   */
  PROCEDURE get_details_from_collection (p_rec_id   IN VARCHAR2)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'get_details_from_collection';
    l_params logger.tab_param;
    --
     l_details VARCHAR2(4000);

  BEGIN

    logger.append_param(l_params, 'p_rec_id', p_rec_id);
    logger.log('GET DETAILS FROM COLLECTION: start', l_scope, null, l_params);

    SELECT
        jt."Details" INTO l_details
    from APEX_collections,
         JSON_TABLE(APEX_collections.clob001, '$.demographics.candidates[*]'
             COLUMNS (
             "Record ID"    VARCHAR2(512 CHAR) PATH '$.blacklistId',
             "Details"    VARCHAR2(4000 CHAR) FORMAT JSON WITH WRAPPER PATH '$.demographics.details')) jt
    WHERE collection_name = c_collection_name AND "Record ID" = p_rec_id;

    logger.append_param(l_params, 'l_details', l_details);
    logger.log('GET DETAILS FROM COLLECTION: done', l_scope, null, l_params);

    apex_json.open_object();
    apex_json.write('details', l_details);
    apex_json.close_object();

    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_error('GET DETAILS FROM COLLECTION: unhandled exeption', l_scope, null, l_params);
        RAISE;
  END get_details_from_collection;

  /**
   * Gets the different parameters and returns them as a JSON (varchar2) string
   * @return VARCHAR2 JSON string with parameters
   */
  FUNCTION get_params_blacklist_service
  RETURN VARCHAR2
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'get_params_blacklist_service';
    l_params logger.tab_param;
    --
    l_result  VARCHAR2(4000 CHAR);

  BEGIN

    logger.log('GET PARAMETERS BLACKLIST SERVICE: start', l_scope, null, l_params);

    l_result := '{"serviceUrlSimpleSearch":"' || c_param_blacklist_simple || '", "serviceUrlAdvancedSearch":"' ||  c_param_blacklist_advanced || '"}';

    logger.append_param(l_params, 'l_result', l_result);
    logger.log('GET PARAMETERS BLACKLIST SERVICE: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('GET PARAMETERS BLACKLIST SERVICE: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END get_params_blacklist_service;

END;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_BLACKLIST_UTIL" TO "DERMALOG_PROXY";
