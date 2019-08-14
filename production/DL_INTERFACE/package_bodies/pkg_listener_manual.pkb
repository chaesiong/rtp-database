CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_INTERFACE"."PKG_LISTENER_MANUAL" AS

c_scope_prefix        CONSTANT VARCHAR2(31) := lower($$plsql_unit) || '.';
c_pibics_server_address   CONSTANT parameters.parameter_value%TYPE := pkg_utils.get_parameter('PIBICS.BIOSERVICE.ADDRESS');
c_pibics_movement         CONSTANT parameters.key_value%TYPE := 'PIBICS.BIOSERVICE.INOUT';
c_pibics_crew             CONSTANT parameters.key_value%TYPE := 'PIBICS.BIOSERVICE.CREW';

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
    l_log_rec.dml_type                := p_dml_type;
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

END PKG_LISTENER_MANUAL;
/
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_LISTENER_MANUAL" TO "APPSUP";
