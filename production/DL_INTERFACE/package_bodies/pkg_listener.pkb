CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_INTERFACE"."PKG_LISTENER" IS

 /*******************************************************************************
  * This package provides that changes in Bordercontrol are propageted to another
  * system like PIBICS
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * CHageman  22.05.2018  Added
  *******************************************************************************/

  /****************************************
   * ========== TYPE DEFINITIONS ==========
   ****************************************/

  c_scope_prefix        CONSTANT VARCHAR2(31) := lower($$plsql_unit) || '.';
  --
  c_pibics_server_address   CONSTANT parameters.parameter_value%TYPE := pkg_utils.get_parameter('PIBICS.BIOSERVICE.ADDRESS');
  c_pibics_movement         CONSTANT parameters.key_value%TYPE := 'PIBICS.BIOSERVICE.INOUT';
  c_pibics_voa              CONSTANT parameters.key_value%TYPE := 'PIBICS.BIOSERVICE.VOA';
  c_pibics_crew             CONSTANT parameters.key_value%TYPE := 'PIBICS.BIOSERVICE.CREW';
  c_pibics_prohibit_in      CONSTANT parameters.key_value%TYPE := 'PIBICS.BIOSERVICE.PROHIBIT.IN';
  c_pibics_prohibit_out     CONSTANT parameters.key_value%TYPE := 'PIBICS.BIOSERVICE.PROHIBIT.OUT';
  c_pibics_fees             CONSTANT parameters.key_value%TYPE := 'PIBICS.BIOSERVICE.FEES';
  c_pibics_fines            CONSTANT parameters.key_value%TYPE := 'PIBICS.BIOSERVICE.FINES';
  c_pibics_extendstay       CONSTANT parameters.key_value%TYPE := 'PIBICS.BIOSERVICE.EXTENSION';
  c_pibics_reentry          CONSTANT parameters.key_value%TYPE := 'PIBICS.BIOSERVICE.REENTRY';
  c_pibics_deportee         CONSTANT parameters.key_value%TYPE := 'PIBICS.BIOSERVICE.DEPORTEE';

  /**
   * Adds a new entry into the table log_sync_webservices
   * @param p_log_rec Record of Logging entry
   * @return log_sync_webservices.key_value Primary key of new logging entry
   */
  FUNCTION add_log_sync_webservice (p_log_rec  IN log_sync_webservices%ROWTYPE)
  RETURN log_sync_webservices.key_value%TYPE
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'add_log_sync_webservice';
    l_params logger.tab_param;
    --
    l_result log_sync_webservices.key_value%TYPE;

  BEGIN

    logger.append_param(l_params, 'p_log_rec.dml_at'                  , p_log_rec.dml_at);
    logger.append_param(l_params, 'p_log_rec.dml_by'                  , p_log_rec.dml_by);
    logger.append_param(l_params, 'p_log_rec.dml_type'                , p_log_rec.dml_type);
    logger.append_param(l_params, 'p_log_rec.ins_at'                  , p_log_rec.ins_at);
    logger.append_param(l_params, 'p_log_rec.ins_by'                  , p_log_rec.ins_by);
    logger.append_param(l_params, 'p_log_rec.sender'                  , p_log_rec.sender);
    logger.append_param(l_params, 'p_log_rec.sender_object'           , p_log_rec.sender_object);
    logger.append_param(l_params, 'p_log_rec.sender_object_id'        , p_log_rec.sender_object_id);
    logger.append_param(l_params, 'p_log_rec.sender_message'          , dbms_lob.substr(p_log_rec.sender_message, 4000, 1));
    logger.append_param(l_params, 'p_log_rec.sender_response_code'    , p_log_rec.sender_response_code);
    logger.append_param(l_params, 'p_log_rec.sender_response_message' , dbms_lob.substr(p_log_rec.sender_response_message, 4000, 1));
    logger.append_param(l_params, 'p_log_rec.receiver_response_id'    , p_log_rec.receiver_response_id);
    logger.append_param(l_params, 'p_log_rec.receiver_response'       , dbms_lob.substr(p_log_rec.receiver_response, 4000, 1));
    logger.append_param(l_params, 'p_log_rec.process_time'            , p_log_rec.process_time);

    logger.log('ADD LOG SYNC WEBSERVICE: start', l_scope, null, l_params);

    INSERT INTO log_sync_webservices
    VALUES p_log_rec
    RETURNING key_value INTO l_result;

    logger.append_param(l_params, 'l_result', l_result);
    logger.log('ADD LOG SYNC WEBSERVICE: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('ADD LOG SYNC WEBSERVICE PIBICS: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END add_log_sync_webservice;

  /**
   * Sets different actions to a new, updated or deleted movement and calls the action to send
   * the request to the needed webservice
   *
   * @param p_mvmntid Primary key of movement that was inserted, updated or deleted
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.date, D.elete)
   */
  PROCEDURE send_bordercontrol_movement (p_mvmntid   IN VARCHAR2
                                        ,p_dml_type  IN CHAR DEFAULT 'I')
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'send_bordercontrol_movement';
    l_params logger.tab_param;
    --
    l_sender              VARCHAR2(25 CHAR) := 'BORDERCONTROL';
    l_sender_object       VARCHAR2(25 CHAR) := 'MOVEMENTS';
    l_sender_object_id    VARCHAR2(32 CHAR) := p_mvmntid;
    --
    l_log_rec             log_sync_webservices%ROWTYPE;
    l_json_object         CLOB;
    -- records
    l_movement_rec        DL_BORDERCONTROL.MOVEMENTS%ROWTYPE;
    --
    l_service_address     VARCHAR2(255 CHAR) := c_pibics_server_address;
    --
    l_process_time_start  DATE;

  BEGIN
  
    IF trim(p_dml_type) <> 'D' THEN

    l_process_time_start := SYSDATE;

    logger.append_param(l_params, 'p_mvmntid', p_mvmntid);
    logger.append_param(l_params, 'p_dml_type', p_dml_type);
    logger.log('CALL ACTIONS TO SEND BORDERCONTROL/MOVEMENT: start', l_scope, null, l_params);

    -- add a new entry to the logging table
    l_log_rec.dml_type                := trim(p_dml_type);
    l_log_rec.sender                  := l_sender;
    l_log_rec.sender_object           := l_sender_object;
    l_log_rec.sender_object_id        := l_sender_object_id;
    
    -----------------------------
    -- movement record start --
    -----------------------------
    SELECT *
    INTO l_movement_rec
    FROM dl_bordercontrol.movements
    WHERE mvmntid = p_mvmntid;
    ---
    
    IF l_movement_rec.source_system <> '5' THEN

    -- get JSON Object and call service
    --l_json_object := dl_bordercontrol.pkg_json_export.get_movements(p_mvmntid);
    --l_json_object := pkg_object_handling.get_pibics_inout_from_movement(dl_bordercontrol.pkg_json_convert.extract_movement_from_json(l_json_object), trim(p_dml_type));
    l_json_object := dl_bordercontrol.pkg_pibics_unhook.get_pibics_inout_from_movement(p_mvmntid, TRIM(p_dml_type));
    l_log_rec.sender_message := l_json_object;
    
    --dbms_output.Put_line(l_json_object);

    -- set service address
    l_service_address := l_service_address || pkg_utils.get_parameter(c_pibics_movement || CASE p_dml_type
                                                                                             WHEN 'I' THEN '.INSERT'
                                                                                             WHEN 'U' THEN '.UPDATE'
                                                                                             WHEN 'D' THEN '.DELETE'
                                                                                           END);

    logger.append_param(l_params, 'l_service_address', l_service_address);

    -- call REST service
    pkg_exchange_objects.send_json_request (p_sender_message   => l_json_object
                                           ,p_service_address  => l_service_address
                                           ,x_response_code    => l_log_rec.sender_response_code
                                           ,x_response_message => l_log_rec.sender_response_message);

    l_log_rec.process_time := ROUND((SYSDATE - l_process_time_start) * 24 * 60 * 60);

    l_log_rec.key_value := pkg_listener.add_log_sync_webservice(l_log_rec);
    COMMIT;

    logger.log('CALL ACTIONS TO SEND BORDERCONTROL/MOVEMENT: done', l_scope, null, l_params);
    
     ELSE
        logger.log_error('CALL ACTIONS TO SEND BORDERCONTROL/MOVEMENT: PRE-REGISTER NOT SEND TO PIBICS', l_scope, null, l_params);
    END IF;
    
    ELSE
        send_del_bordercontrol_movement(p_mvmntid);
    END IF;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('CALL ACTIONS TO SEND BORDERCONTROL/MOVEMENT: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END send_bordercontrol_movement;

  /**
   * Sets different actions to a new, updated or deleted crew movements and calls the action to send
   * the request to the needed webservice
   *
   * @param p_mvmntid   Primary key of movement that was inserted, updated or deleted for a crew member
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.date, D.elete)
   */
   
   PROCEDURE send_bordercontrol_movement_jira (p_mvmntid   IN VARCHAR2
                                        ,p_dml_type  IN CHAR DEFAULT 'I')
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'send_bordercontrol_movement';
    l_params logger.tab_param;
    --
    l_sender              VARCHAR2(25 CHAR) := 'BORDERCONTROL';
    l_sender_object       VARCHAR2(25 CHAR) := 'MOVEMENTS';
    l_sender_object_id    VARCHAR2(32 CHAR) := p_mvmntid;
    --
    l_log_rec             log_sync_webservices%ROWTYPE;
    l_json_object         CLOB;
    --
    l_service_address     VARCHAR2(255 CHAR) := c_pibics_server_address;
    --
    l_process_time_start  DATE;

  BEGIN

    l_process_time_start := SYSDATE;

    logger.append_param(l_params, 'p_mvmntid', p_mvmntid);
    logger.append_param(l_params, 'p_dml_type', p_dml_type);
    logger.log('CALL ACTIONS TO SEND BORDERCONTROL/MOVEMENT: start', l_scope, null, l_params);

    -- add a new entry to the logging table
    l_log_rec.dml_type                := p_dml_type;
    l_log_rec.sender                  := l_sender;
    l_log_rec.sender_object           := l_sender_object;
    l_log_rec.sender_object_id        := l_sender_object_id;

    -- get JSON Object and call service
    l_json_object := dl_bordercontrol.pkg_json_export.get_movements_jira(p_mvmntid);
    l_json_object := pkg_object_handling.get_pibics_inout_from_movement(dl_bordercontrol.pkg_json_convert.extract_movement_from_json(l_json_object), p_dml_type);
    l_log_rec.sender_message := l_json_object;
    
    --dbms_output.Put_line(l_json_object);

    -- set service address
    l_service_address := l_service_address || pkg_utils.get_parameter(c_pibics_movement || CASE p_dml_type
                                                                                             WHEN 'I' THEN '.INSERT'
                                                                                             WHEN 'U' THEN '.UPDATE'
                                                                                             WHEN 'D' THEN '.DELETE'
                                                                                           END);

    logger.append_param(l_params, 'l_service_address', l_service_address);

    -- call REST service
    pkg_exchange_objects.send_json_request (p_sender_message   => l_json_object
                                           ,p_service_address  => l_service_address
                                           ,x_response_code    => l_log_rec.sender_response_code
                                           ,x_response_message => l_log_rec.sender_response_message);

    l_log_rec.process_time := ROUND((SYSDATE - l_process_time_start) * 24 * 60 * 60);

    l_log_rec.key_value := pkg_listener.add_log_sync_webservice(l_log_rec);
    COMMIT;

    logger.log('CALL ACTIONS TO SEND BORDERCONTROL/MOVEMENT: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('CALL ACTIONS TO SEND BORDERCONTROL/MOVEMENT: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END send_bordercontrol_movement_jira;
   
   PROCEDURE send_del_bordercontrol_movement (p_mvmntid   IN VARCHAR2)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'send_del_bordercontrol_movement';
    l_params logger.tab_param;
    --
    l_sender              VARCHAR2(25 CHAR) := 'BORDERCONTROL';
    l_sender_object       VARCHAR2(25 CHAR) := 'MOVEMENTS';
    l_sender_object_id    VARCHAR2(32 CHAR) := p_mvmntid;
    --
    l_log_rec             log_sync_webservices%ROWTYPE;
    l_json_object         CLOB;
    --
    l_service_address     VARCHAR2(255 CHAR) := c_pibics_server_address;
    --
    l_process_time_start  DATE;

  BEGIN

    l_process_time_start := SYSDATE;

    logger.append_param(l_params, 'p_mvmntid', p_mvmntid);
    logger.append_param(l_params, 'p_dml_type', 'D');
    logger.log('CALL ACTIONS TO SEND DEL BORDERCONTROL/MOVEMENT: start', l_scope, null, l_params);

    -- add a new entry to the logging table
    l_log_rec.dml_type                := 'D';
    l_log_rec.sender                  := l_sender;
    l_log_rec.sender_object           := l_sender_object;
    l_log_rec.sender_object_id        := l_sender_object_id;

    -- get JSON Object and call service
    l_json_object := dl_bordercontrol.pkg_json_export.get_movements(p_mvmntid);
    l_json_object := pkg_object_handling.del_pibics_inout_from_movement(dl_bordercontrol.pkg_json_convert.extract_movement_from_json(l_json_object));
    l_log_rec.sender_message := l_json_object;
    
    --dbms_output.Put_line(l_json_object);

    -- set service address
    l_service_address := l_service_address || pkg_utils.get_parameter(c_pibics_movement || '.DELETE');

    logger.append_param(l_params, 'l_service_address', l_service_address);

    -- call REST service
    pkg_exchange_objects.send_json_request (p_sender_message   => l_json_object
                                           ,p_service_address  => l_service_address
                                           ,x_response_code    => l_log_rec.sender_response_code
                                           ,x_response_message => l_log_rec.sender_response_message);

    l_log_rec.process_time := ROUND((SYSDATE - l_process_time_start) * 24 * 60 * 60);

    l_log_rec.key_value := pkg_listener.add_log_sync_webservice(l_log_rec);
    COMMIT;

    logger.log('CALL ACTIONS TO SEND DEL BORDERCONTROL/MOVEMENT: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('CALL ACTIONS TO SEND DEL BORDERCONTROL/MOVEMENT: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END send_del_bordercontrol_movement;
   
   PROCEDURE AA_send_bordercontrol_movement (p_dml_type  IN CHAR DEFAULT 'I')
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'send_bordercontrol_movement';
    l_params logger.tab_param;
    --
    l_sender              VARCHAR2(25 CHAR) := 'BORDERCONTROL';
    l_sender_object       VARCHAR2(25 CHAR) := 'MOVEMENTS';
    l_sender_object_id    VARCHAR2(32 CHAR) := '7B15CD8FF98920B0E053010510AC25DE';
    --
    l_log_rec             log_sync_webservices%ROWTYPE;
    l_json_object         CLOB;
    --
    l_service_address     VARCHAR2(255 CHAR) := c_pibics_server_address;
    -- 
    l_process_time_start  DATE;   

  BEGIN

    l_process_time_start := SYSDATE;

    logger.append_param(l_params, 'p_mvmntid', '7C1A546B632E2F28E053010510ACDDB8');
    logger.append_param(l_params, 'p_dml_type', p_dml_type);
    logger.log('CALL ACTIONS TO SEND BORDERCONTROL/MOVEMENT: start', l_scope, null, l_params);

    -- add a new entry to the logging table
    --l_log_rec.dml_type                := p_dml_type;
    l_log_rec.sender                  := l_sender;
    l_log_rec.sender_object           := l_sender_object;
    l_log_rec.sender_object_id        := l_sender_object_id;

    -- get JSON Object and call service
    l_json_object := pkg_object_handling.AA_get_pibics_inout_from_movement('7C1A546B632E2F28E053010510ACDDB8', p_dml_type);
    l_log_rec.sender_message := l_json_object;

    -- set service address
    l_service_address := l_service_address || pkg_utils.get_parameter(c_pibics_movement || CASE p_dml_type 
                                                                                             WHEN 'I' THEN '.INSERT'
                                                                                             WHEN 'U' THEN '.UPDATE'
                                                                                             WHEN 'D' THEN '.DELETE'
                                                                                           END);

    logger.append_param(l_params, 'l_service_address', l_service_address);

    -- call REST service
        pkg_exchange_objects.send_json_request (p_sender_message   => l_json_object
                                           ,p_service_address  => l_service_address
                                           ,x_response_code    => l_log_rec.sender_response_code
                                           ,x_response_message => l_log_rec.sender_response_message);

    l_log_rec.process_time := ROUND((SYSDATE - l_process_time_start) * 24 * 60 * 60);

    l_log_rec.key_value := pkg_listener.add_log_sync_webservice(l_log_rec);
    COMMIT;

    logger.log('CALL ACTIONS TO SEND BORDERCONTROL/MOVEMENT: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('CALL ACTIONS TO SEND BORDERCONTROL/MOVEMENT: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END AA_send_bordercontrol_movement;
   
  PROCEDURE send_bordercontrol_crew (p_mvmntid   IN VARCHAR2
                                    ,p_dml_type  IN CHAR DEFAULT 'I')
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'send_bordercontrol_crew';
    l_params logger.tab_param;
    --
    l_sender              VARCHAR2(25 CHAR) := 'BORDERCONTROL';
    l_sender_object       VARCHAR2(25 CHAR) := 'CREW';
    l_sender_object_id    VARCHAR2(32 CHAR) := p_mvmntid;
    --
    l_log_rec             log_sync_webservices%ROWTYPE;
    l_json_object         CLOB;
    --
    l_service_address     VARCHAR2(255 CHAR) := c_pibics_server_address;
    --
    l_process_time_start  DATE;

  BEGIN

    l_process_time_start := SYSDATE;

    logger.append_param(l_params, 'p_mvmntid', p_mvmntid);
    logger.append_param(l_params, 'p_dml_type', p_dml_type);
    logger.log('CALL ACTIONS TO SEND BORDERCONTROL/CREW: start', l_scope, null, l_params);

    -- add a new entry to the logging table
    l_log_rec.dml_type                := p_dml_type;
    l_log_rec.sender                  := l_sender;
    l_log_rec.sender_object           := l_sender_object;
    l_log_rec.sender_object_id        := l_sender_object_id;

    -- get JSON Object and call service
    l_json_object := dl_bordercontrol.pkg_json_export.get_movements(p_mvmntid);
    l_json_object := pkg_object_handling.get_pibics_crew_from_crew(dl_bordercontrol.pkg_json_convert.extract_movement_from_json(l_json_object), p_dml_type);
    --l_json_object := dl_bordercontrol.pkg_pibics_unhook.get_pibics_crew_inout_from_movement(p_mvmntid, TRIM(p_dml_type));
    l_log_rec.sender_message := l_json_object;

    -- set service address
    l_service_address := l_service_address || pkg_utils.get_parameter(c_pibics_crew || CASE p_dml_type
                                                                                          WHEN 'I' THEN '.INSERT'
                                                                                          WHEN 'U' THEN '.UPDATE'
                                                                                          WHEN 'D' THEN '.DELETE'
                                                                                        END);

    logger.append_param(l_params, 'l_service_address', l_service_address);

    -- call REST service
    pkg_exchange_objects.send_json_request (p_sender_message   => l_json_object
                                           ,p_service_address  => l_service_address
                                           ,x_response_code    => l_log_rec.sender_response_code
                                           ,x_response_message => l_log_rec.sender_response_message);

    l_log_rec.process_time := ROUND((SYSDATE - l_process_time_start) * 24 * 60 * 60);

    l_log_rec.key_value := pkg_listener.add_log_sync_webservice(l_log_rec);
    COMMIT;

    logger.log('CALL ACTIONS TO SEND BORDERCONTROL/CREW: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('CALL ACTIONS TO SEND BORDERCONTROL/CREW: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END send_bordercontrol_crew;

PROCEDURE send_bordercontrol_crew_manual (p_mvmntid   IN VARCHAR2
                                    ,p_dml_type  IN CHAR DEFAULT 'I')
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'send_bordercontrol_crew';
    l_params logger.tab_param;
    --
    l_sender              VARCHAR2(25 CHAR) := 'BORDERCONTROL';
    l_sender_object       VARCHAR2(25 CHAR) := 'CREW';
    l_sender_object_id    VARCHAR2(32 CHAR) := p_mvmntid;
    --
    l_log_rec             log_sync_webservices%ROWTYPE;
    l_json_object         CLOB;
    --
    l_service_address     VARCHAR2(255 CHAR) := c_pibics_server_address;
    --
    l_process_time_start  DATE;

  BEGIN

    l_process_time_start := SYSDATE;

    logger.append_param(l_params, 'p_mvmntid', p_mvmntid);
    logger.append_param(l_params, 'p_dml_type', p_dml_type);
    logger.log('CALL ACTIONS TO SEND BORDERCONTROL/CREW: start', l_scope, null, l_params);

    -- add a new entry to the logging table
    l_log_rec.dml_type                := p_dml_type;
    l_log_rec.sender                  := l_sender;
    l_log_rec.sender_object           := l_sender_object;
    l_log_rec.sender_object_id        := l_sender_object_id;

    -- get JSON Object and call service
    l_json_object := dl_bordercontrol.pkg_json_export.get_movements(p_mvmntid);
    l_json_object := pkg_object_handling.get_pibics_crew_from_crew_manual(dl_bordercontrol.pkg_json_convert.extract_movement_from_json(l_json_object), p_dml_type);
    l_log_rec.sender_message := l_json_object;

    -- set service address
    l_service_address := l_service_address || pkg_utils.get_parameter(c_pibics_crew || CASE p_dml_type
                                                                                          WHEN 'I' THEN '.INSERT'
                                                                                          WHEN 'U' THEN '.UPDATE'
                                                                                          WHEN 'D' THEN '.DELETE'
                                                                                        END);

    logger.append_param(l_params, 'l_service_address', l_service_address);

    -- call REST service
    pkg_exchange_objects.send_json_request (p_sender_message   => l_json_object
                                           ,p_service_address  => l_service_address
                                           ,x_response_code    => l_log_rec.sender_response_code
                                           ,x_response_message => l_log_rec.sender_response_message);

    l_log_rec.process_time := ROUND((SYSDATE - l_process_time_start) * 24 * 60 * 60);

    l_log_rec.key_value := pkg_listener.add_log_sync_webservice(l_log_rec);
    COMMIT;

    logger.log('CALL ACTIONS TO SEND BORDERCONTROL/CREW: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('CALL ACTIONS TO SEND BORDERCONTROL/CREW: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END send_bordercontrol_crew_manual;
  /**
   * Sets different actions to a new, updated or deleted crew movements and calls the action to send
   * the request to the needed webservice
   *
   * @param p_key_value   Primary key of movement that was inserted, updated or deleted for a crew member
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.date, D.elete)
   */
  PROCEDURE send_bordercontrol_voa (p_key_value   IN VARCHAR2
                                   ,p_dml_type  IN CHAR DEFAULT 'I')
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'send_bordercontrol_voa';
    l_params logger.tab_param;
    --
    l_sender              VARCHAR2(25 CHAR) := 'BORDERCONTROL';
    l_sender_object       VARCHAR2(25 CHAR) := 'VOA';
    l_sender_object_id    VARCHAR2(32 CHAR) := p_key_value;
    --
    l_log_rec             log_sync_webservices%ROWTYPE;
    l_json_object         CLOB;
    l_json_json           JSON;
    --
    l_service_address     VARCHAR2(255 CHAR) := c_pibics_server_address;
    --
    l_process_time_start  DATE;

  BEGIN

    l_process_time_start := SYSDATE;

    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.append_param(l_params, 'p_dml_type', p_dml_type);
    logger.log('CALL ACTIONS TO SEND BORDERCONTROL/VOA: start', l_scope, null, l_params);

    -- add a new entry to the logging table
    l_log_rec.dml_type                := p_dml_type;
    l_log_rec.sender                  := l_sender;
    l_log_rec.sender_object           := l_sender_object;
    l_log_rec.sender_object_id        := l_sender_object_id;

    -- get JSON Object and call service
    dbms_lob.createtemporary( l_json_object, true );

    l_json_json   := dl_bordercontrol.pkg_json_export.get_visas(p_key_value);
    l_json_json.to_clob(l_json_object);

    l_json_object := pkg_object_handling.get_pibics_voa_from_voa(dl_bordercontrol.pkg_json_convert.extract_visa_data_from_json(l_json_object), p_dml_type);
    l_log_rec.sender_message := l_json_object;

    -- set service address
    l_service_address := l_service_address || pkg_utils.get_parameter(c_pibics_voa || CASE p_dml_type
                                                                                          WHEN 'I' THEN '.INSERT'
                                                                                          WHEN 'U' THEN '.UPDATE'
                                                                                          WHEN 'D' THEN '.DELETE'
                                                                                        END);

    logger.append_param(l_params, 'l_service_address', l_service_address);

    -- call REST service
    pkg_exchange_objects.send_json_request (p_sender_message   => l_json_object
                                           ,p_service_address  => l_service_address
                                           ,x_response_code    => l_log_rec.sender_response_code
                                           ,x_response_message => l_log_rec.sender_response_message);

    l_log_rec.process_time := ROUND((SYSDATE - l_process_time_start) * 24 * 60 * 60);

    l_log_rec.key_value := pkg_listener.add_log_sync_webservice(l_log_rec);
    COMMIT;

    logger.log('CALL ACTIONS TO SEND BORDERCONTROL/VOA: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('CALL ACTIONS TO SEND BORDERCONTROL/VOA: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END send_bordercontrol_voa;

  /**
   * Defines the actions that should be done with the several sender and sender objects
   *
   * @param p_json_obj_input Input JSON from message payload
   */
  PROCEDURE send_hook_information (p_json_obj_input IN CLOB)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'send_hook_information';
    l_params logger.tab_param;
    --
    l_json            APEX_JSON.T_VALUES;
    l_json_sender     VARCHAR2(255 CHAR);
    l_json_object     VARCHAR2(500 CHAR);
    l_json_dmltype    VARCHAR2(500 CHAR);
    l_json_pk         VARCHAR2(500 CHAR);

  BEGIN

    logger.append_param(l_params, 'dbms_lob.substr(p_json_object_input, 4000, 1)', dbms_lob.substr(p_json_obj_input, 4000, 1));
    logger.log('SEND HOOK INFORMATION: start', l_scope, null, l_params);

    APEX_JSON.PARSE(l_json, p_json_obj_input);
    l_json_sender  := APEX_JSON.GET_VARCHAR2(p_values => l_json, p_path => 'sender');
    l_json_object  := APEX_JSON.GET_VARCHAR2(p_values => l_json, p_path => 'object');
    l_json_dmltype := APEX_JSON.GET_VARCHAR2(p_values => l_json, p_path => 'dmlType');
    l_json_pk      := APEX_JSON.GET_VARCHAR2(p_values => l_json, p_path => 'pk');

    logger.append_param(l_params, 'l_json_sender', l_json_sender);
    logger.append_param(l_params, 'l_json_object', l_json_object);
    logger.append_param(l_params, 'l_json_dmltype', l_json_dmltype);
    logger.append_param(l_params, 'l_json_pk', l_json_pk);

    -- define action that should be done to send the information
    IF l_json_sender = 'bordercontrol' AND l_json_object = 'movement'
    THEN
      send_bordercontrol_movement(p_mvmntid   => l_json_pk
                                 ,p_dml_type  => l_json_dmltype);
    ELSIF l_json_sender = 'bordercontrol' AND l_json_object = 'crew'
    THEN
      send_bordercontrol_crew(p_mvmntid   => l_json_pk
                             ,p_dml_type  => l_json_dmltype);
    ELSIF l_json_sender = 'bordercontrol' AND l_json_object = 'voa'
    THEN
      send_bordercontrol_voa(p_key_value => l_json_pk
                            ,p_dml_type  => l_json_dmltype);
    END IF;

    logger.log('SEND HOOK INFORMATION: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('SEND HOOK INFORMATION: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END send_hook_information;


  /**
   * Handles the request for Queue DL_BORDERCONTROL.AQ_BORDERCONTROL_HOOKS_QUEUE
   *
   * @context
   * @reginfo
   * @descr
   * @payload
   * @payloadl
   */
  PROCEDURE handle_hook (context  RAW
                        ,reginfo  SYS.AQ$_REG_INFO
                        ,descr    SYS.AQ$_DESCRIPTOR
                        ,payload  VARCHAR2
                        ,payloadl NUMBER)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'handle_hook';
    l_params logger.tab_param;
    --
    l_dequeue_options DBMS_AQ.DEQUEUE_OPTIONS_T;
    l_enqueue_options DBMS_AQ.ENQUEUE_OPTIONS_T;
    l_message_prop    DBMS_AQ.MESSAGE_PROPERTIES_T;
    l_message_hdl     RAW(16);
    l_payload         dl_bordercontrol.t_hook_payload;
    --
    l_json            APEX_JSON.T_VALUES;
    l_json_sender     VARCHAR2(255 CHAR);
    l_json_object     VARCHAR2(500 CHAR);
    l_json_dmltype    VARCHAR2(500 CHAR);
    l_json_pk         VARCHAR2(500 CHAR);

  BEGIN

    logger.append_param(l_params, 'UTL_RAW.CAST_TO_VARCHAR2(descr.msg_id)', UTL_RAW.CAST_TO_VARCHAR2(descr.msg_id));
    logger.log('HANDLE HOOK: start', l_scope, null, l_params);

    l_dequeue_options.msgid         := descr.msg_id;
    l_dequeue_options.consumer_name := descr.consumer_name;
    dbms_aq.dequeue(descr.queue_name, l_dequeue_options, l_message_prop, l_payload, l_message_hdl);

    send_hook_information(l_payload.obj_input);

    logger.log('HANDLE HOOK: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN

      IF SQLCODE = -25263
      THEN
        logger.log('HANDLE HOOK: done', l_scope, null, l_params);
      ELSE
        logger.log_error('HANDLE HOOK: unhandled exeption', l_scope, null, l_params);
        RAISE;
      END IF;
  END handle_hook;

  /**
   * Dequeues and processes all entries from Queue for the given consumer name (e.g. SEND_MOVEMENT)
   *
   * @param p_consumer_name Name of the consumer that should be dequeued
   */
  PROCEDURE dequeue_hooks (p_consumer_name VARCHAR2)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'dequeue_hooks';
    l_params logger.tab_param;
    --
    l_dequeue_options DBMS_AQ.DEQUEUE_OPTIONS_T;
    l_enqueue_options DBMS_AQ.ENQUEUE_OPTIONS_T;
    l_message_prop    DBMS_AQ.MESSAGE_PROPERTIES_T;
    l_message_hdl     RAW(16);
    l_payload         dl_bordercontrol.t_hook_payload;
    --
    l_json            APEX_JSON.T_VALUES;
    l_json_object     VARCHAR2(500 CHAR);
    l_json_dmltype    VARCHAR2(500 CHAR);
    l_json_pk         VARCHAR2(500 CHAR);
    --
    l_hook_queue_name VARCHAR2(100 CHAR) := NVL(dl_bordercontrol.pkg_common.Get_Parameter('PIBICS_AQ_QUEUE'), 'DL_BORDERCONTROL.AQ_BORDERCONTROL_HOOKS_QUEUE');

  BEGIN

    logger.log('DEQUEUE HOOK INFORMATION: start', l_scope, null, l_params);

    LOOP

      l_dequeue_options.wait := 5;
      l_dequeue_options.consumer_name := p_consumer_name;
      dbms_aq.dequeue(l_hook_queue_name, l_dequeue_options, l_message_prop, l_payload, l_message_hdl);

      send_hook_information(l_payload.obj_input);

      COMMIT;
    END LOOP;

    logger.log('DEQUEUE HOOK INFORMATION: done', l_scope, null, l_params);

  EXCEPTION
  WHEN OTHERS
  THEN

    logger.log('DEQUEUE HOOK INFORMATION: No more messages for processing', l_scope, null, l_params);
    COMMIT;
  END dequeue_hooks;
  
  /**
   * Dequeues and processes all entries from Queue for the given consumer name (e.g. SEND_MOVEMENT)
   * Secondary
   * @param p_consumer_name Name of the consumer that should be dequeued
   */
  PROCEDURE dequeue_hooks_sec (p_consumer_name VARCHAR2)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'dequeue_hooks_sec';
    l_params logger.tab_param;
    --
    l_dequeue_options DBMS_AQ.DEQUEUE_OPTIONS_T;
    l_enqueue_options DBMS_AQ.ENQUEUE_OPTIONS_T;
    l_message_prop    DBMS_AQ.MESSAGE_PROPERTIES_T;
    l_message_hdl     RAW(16);
    l_payload         dl_bordercontrol.t_hook_payload;
    --
    l_json            APEX_JSON.T_VALUES;
    l_json_object     VARCHAR2(500 CHAR);
    l_json_dmltype    VARCHAR2(500 CHAR);
    l_json_pk         VARCHAR2(500 CHAR);
    --
    l_hook_queue_name VARCHAR2(100 CHAR) := NVL(dl_bordercontrol.pkg_common.Get_Parameter('PIBICS_AQ_QUEUE_SEC'), 'DL_BORDERCONTROL.AQ_BORDERCONTROL_HOOKS_QUEUE2');

  BEGIN

    logger.log('DEQUEUE HOOK INFORMATION: start', l_scope, null, l_params);

    LOOP

      l_dequeue_options.wait := 5;
      l_dequeue_options.consumer_name := p_consumer_name;
      dbms_aq.dequeue(l_hook_queue_name, l_dequeue_options, l_message_prop, l_payload, l_message_hdl);

      send_hook_information(l_payload.obj_input);

      COMMIT;
    END LOOP;

    logger.log('DEQUEUE HOOK INFORMATION: done', l_scope, null, l_params);

  EXCEPTION
  WHEN OTHERS
  THEN

    logger.log('DEQUEUE HOOK INFORMATION: No more messages for processing', l_scope, null, l_params);
    COMMIT;
  END dequeue_hooks_sec;

PROCEDURE AA_receive_country 
  IS

    l_log_rec             log_sync_webservices%ROWTYPE;
    l_json_object         CLOB;
    
    l_sender              VARCHAR2(25 CHAR) := 'BORDERCONTROL';
    l_sender_object       VARCHAR2(25 CHAR) := 'ISDR.COUNTRY';
    l_sender_object_id    VARCHAR2(32 CHAR) := '7B15CD8FF98920B0E053010510AC25DZ';
    --
    l_service_address     VARCHAR2(255 CHAR) := 'http://172.18.5.1:8080/bioservice/rest/isdr/master/changeCountryPibics';

  BEGIN
  l_log_rec.sender                  := l_sender;
    l_log_rec.sender_object           := l_sender_object;
    l_log_rec.sender_object_id        := l_sender_object_id;
    -- call REST service
        pkg_exchange_objects.send_json_request (p_sender_message   => '{
                                                      "dateTime": "2018-10-10T10:50:18+07:00",
                                              "reqFromDate": "201701010000",
                                              "reqToDate": "201801010000"
                                            }'
                                           ,p_service_address  => l_service_address
                                           ,x_response_code    => l_log_rec.sender_response_code
                                           ,x_response_message => l_log_rec.sender_response_message);
                                           
    dbms_output.Put_line(l_log_rec.sender_response_message);
    
    l_log_rec.key_value := pkg_listener.add_log_sync_webservice(l_log_rec);

  EXCEPTION
    WHEN OTHERS
    THEN
      RAISE;
  END AA_receive_country;

END;
/
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_LISTENER" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_LISTENER" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_LISTENER" TO "APPSUP";
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_LISTENER" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_LISTENER" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_LISTENER" TO "BIOSAADM";
