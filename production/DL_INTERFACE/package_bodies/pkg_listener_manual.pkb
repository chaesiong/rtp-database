CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_INTERFACE"."PKG_LISTENER_MANUAL" AS

c_scope_prefix        CONSTANT VARCHAR2(31) := lower($$plsql_unit) || '.';
c_pibics_server_address   CONSTANT parameters.parameter_value%TYPE := pkg_utils.get_parameter('PIBICS.BIOSERVICE.ADDRESS');
c_pibics_movement         CONSTANT parameters.key_value%TYPE := 'PIBICS.BIOSERVICE.INOUT';
c_pibics_crew             CONSTANT parameters.key_value%TYPE := 'PIBICS.BIOSERVICE.CREW';

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
        send_del_bordercontrol_movement(p_mvmntid);
    END IF;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('CALL ACTIONS TO SEND BORDERCONTROL/MOVEMENT: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END send_bordercontrol_movement;

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
    l_json_object := DL_BORDERCONTROL.PKG_JSON_EXPORT_MANUAL.get_movements_jira(p_mvmntid);
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
    l_log_rec.dml_type                := trim(p_dml_type);
    l_log_rec.sender                  := l_sender;
    l_log_rec.sender_object           := l_sender_object;
    l_log_rec.sender_object_id        := l_sender_object_id;

    -- get JSON Object and call service
    l_json_object := DL_BORDERCONTROL.PKG_JSON_EXPORT_MANUAL.get_movements_jira(p_mvmntid);
    l_json_object := pkg_object_handling_manual.get_pibics_crew_from_crew(dl_bordercontrol.pkg_json_convert.extract_movement_from_json(l_json_object), p_dml_type);
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
    l_json_object := DL_BORDERCONTROL.PKG_JSON_EXPORT_MANUAL.get_movements_jira(p_mvmntid);
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

    dbms_output.put_line('5');
    --logger.append_param(l_params, 'dbms_lob.substr(p_json_object_input, 4000, 1)', dbms_lob.substr(p_json_obj_input, 4000, 1));
    --logger.log('SEND HOOK INFORMATION: start', l_scope, null, l_params);

    APEX_JSON.PARSE(l_json, p_json_obj_input);
    l_json_sender  := APEX_JSON.GET_VARCHAR2(p_values => l_json, p_path => 'sender');
    l_json_object  := APEX_JSON.GET_VARCHAR2(p_values => l_json, p_path => 'object');
    l_json_dmltype := APEX_JSON.GET_VARCHAR2(p_values => l_json, p_path => 'dmlType');
    l_json_pk      := APEX_JSON.GET_VARCHAR2(p_values => l_json, p_path => 'pk');

    --logger.append_param(l_params, 'l_json_sender', l_json_sender);
    --logger.append_param(l_params, 'l_json_object', l_json_object);
    --logger.append_param(l_params, 'l_json_dmltype', l_json_dmltype);
    --logger.append_param(l_params, 'l_json_pk', l_json_pk);
    dbms_output.put_line(l_json_pk);
    -- define action that should be done to send the information
    IF l_json_sender = 'bordercontrol' AND l_json_object = 'movement'
    THEN
      DL_INTERFACE.pkg_listener.send_bordercontrol_movement(p_mvmntid   => l_json_pk
                                 ,p_dml_type  => l_json_dmltype);
    ELSIF l_json_sender = 'bordercontrol' AND l_json_object = 'crew'
    THEN
      DL_INTERFACE.pkg_listener.send_bordercontrol_crew(p_mvmntid   => l_json_pk
                             ,p_dml_type  => l_json_dmltype);
    ELSIF l_json_sender = 'bordercontrol' AND l_json_object = 'voa'
    THEN
      DL_INTERFACE.pkg_listener.send_bordercontrol_voa(p_key_value => l_json_pk
                            ,p_dml_type  => l_json_dmltype);
    END IF;

    --logger.log('SEND HOOK INFORMATION: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      --logger.log_error('SEND HOOK INFORMATION: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END send_hook_information;


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
    
    l_hook_queue_name VARCHAR2(100 CHAR) := NVL(dl_bordercontrol.pkg_common.Get_Parameter('PIBICS_AQ_QUEUE'), 'DL_BORDERCONTROL.AQ_BORDERCONTROL_HOOKS_QUEUE');

  BEGIN

    
    --dbms_output.put_line('1');
    --logger.log('DEQUEUE HOOK INFORMATION: start', l_scope, null, l_params);

    LOOP

      
    --dbms_output.put_line('3');
      l_dequeue_options.wait := 5;
      l_dequeue_options.consumer_name := p_consumer_name;
      dbms_aq.dequeue(l_hook_queue_name, l_dequeue_options, l_message_prop, l_payload, l_message_hdl);

    --dbms_output.put_line('4');
      send_hook_information(l_payload.obj_input);

      COMMIT;
    END LOOP;

    
    dbms_output.put_line('2');
    --logger.log('DEQUEUE HOOK INFORMATION: done', l_scope, null, l_params);

  EXCEPTION
  WHEN OTHERS
  THEN

    --logger.log('DEQUEUE HOOK INFORMATION: No more messages for processing', l_scope, null, l_params);
    COMMIT;
  END dequeue_hooks;


END PKG_LISTENER_MANUAL;
/
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_LISTENER_MANUAL" TO "APPSUP";
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_LISTENER_MANUAL" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_LISTENER_MANUAL" TO "BIOSUPPORT";
