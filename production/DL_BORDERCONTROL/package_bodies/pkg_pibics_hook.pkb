CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_PIBICS_HOOK" IS

 /*******************************************************************************
  * This package provides a function to define different interactions with several
  * systems.
  * Example: New movement was created and there should be send a new dataset via
  * REST to PIBICS and also documented into another structure. This hook function
  * calls different functions so every system can be informed.
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
  c_hook_queue_name     CONSTANT VARCHAR2(100 CHAR) := NVL(dl_bordercontrol.pkg_common.Get_Parameter('PIBICS_AQ_QUEUE'), 'DL_BORDERCONTROL.AQ_BORDERCONTROL_HOOKS_QUEUE');

  /**
   * Sets different actions to a new, updated or deleted movement
   *
   * @param p_mvmntid Primary key of movement that was inserted, updated or deleted
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.date, D.elete)
   */
  PROCEDURE set_action_movement (p_mvmntid  IN dl_bordercontrol.movements.mvmntid%TYPE
                                ,p_dml_type IN CHAR DEFAULT 'I')
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'set_action_movement';
    l_params logger.tab_param;
    --
    l_payload            t_hook_payload;
    l_enqueue_options    dbms_aq.enqueue_options_t;
    l_message_properties dbms_aq.message_properties_t;
    l_msgid              raw(16);

  BEGIN

    logger.append_param(l_params, 'p_mvmntid', p_mvmntid);
    logger.append_param(l_params, 'p_dml_type', p_dml_type);
    logger.log('SET ACTION MOVEMENT: start', l_scope, null, l_params);

    -- enqueue message in Advanced Queue
    l_payload := t_hook_payload(null, null);
    l_payload.obj_version := '0.1';

    APEX_JSON.INITIALIZE_CLOB_OUTPUT;

    APEX_JSON.OPEN_OBJECT();
      APEX_JSON.WRITE('sender', 'bordercontrol');
      APEX_JSON.WRITE('object', 'movement');
      APEX_JSON.WRITE('dmlType', p_dml_type);
      APEX_JSON.WRITE('pk', p_mvmntid);
    APEX_JSON.CLOSE_OBJECT();

    l_payload.obj_input := APEX_JSON.GET_CLOB_OUTPUT;

    APEX_JSON.FREE_OUTPUT;

    dbms_aq.enqueue(queue_name          => c_hook_queue_name
                   ,enqueue_options     => l_enqueue_options
                   ,message_properties  => l_message_properties
                   ,payload             => l_payload
                   ,msgid               => l_msgid);
    commit;

    logger.log('SET ACTION MOVEMENT: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('SET ACTION MOVEMENT: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END set_action_movement;

  /**
   * Sets different actions to a new, updated or deleted crew movement
   *
   * @param p_mvmntid Primary key of movement that was inserted, updated or deleted
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.date, D.elete)
   */
  PROCEDURE set_action_crew (p_mvmntid  IN dl_bordercontrol.movements.mvmntid%TYPE
                            ,p_dml_type IN CHAR DEFAULT 'I')
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'set_action_crew';
    l_params logger.tab_param;
    --
    l_payload            t_hook_payload;
    l_enqueue_options    dbms_aq.enqueue_options_t;
    l_message_properties dbms_aq.message_properties_t;
    l_msgid              raw(16);

  BEGIN

    logger.append_param(l_params, 'p_mvmntid', p_mvmntid);
    logger.append_param(l_params, 'p_dml_type', p_dml_type);
    logger.log('SET ACTION CREW: start', l_scope, null, l_params);

    -- enqueue message in Advanced Queue
    l_payload := t_hook_payload(null, null);
    l_payload.obj_version := '0.1';

    APEX_JSON.INITIALIZE_CLOB_OUTPUT;

    APEX_JSON.OPEN_OBJECT();
      APEX_JSON.WRITE('sender', 'bordercontrol');
      APEX_JSON.WRITE('object', 'crew');
      APEX_JSON.WRITE('dmlType', p_dml_type);
      APEX_JSON.WRITE('pk', p_mvmntid);
    APEX_JSON.CLOSE_OBJECT();

    l_payload.obj_input := APEX_JSON.GET_CLOB_OUTPUT;

    APEX_JSON.FREE_OUTPUT;

    dbms_aq.enqueue(queue_name          => c_hook_queue_name
                   ,enqueue_options     => l_enqueue_options
                   ,message_properties  => l_message_properties
                   ,payload             => l_payload
                   ,msgid               => l_msgid);
    commit;

    logger.log('SET ACTION CREW: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('SET ACTION CREW: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END set_action_crew;

  /**
   * Sets actions to push information about new VISA on Arrival entries
   *
   * @param p_key_value Primary key of VISA on Arrival that was inserted, updated or deleted
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.pdate, D.elete)
   */
  PROCEDURE set_action_visa_on_arrival (p_key_value IN dl_bordercontrol.visas.key_value%TYPE
                                       ,p_dml_type  IN CHAR DEFAULT 'I')
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'set_visa_on_arrival';
    l_params logger.tab_param;
    --
    l_payload            t_hook_payload;
    l_enqueue_options    dbms_aq.enqueue_options_t;
    l_message_properties dbms_aq.message_properties_t;
    l_msgid              raw(16);

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.append_param(l_params, 'p_dml_type', p_dml_type);
    logger.log('SET ACTION VOA: start', l_scope, null, l_params);

    -- enqueue message in Advanced Queue
    l_payload := t_hook_payload(null, null);
    l_payload.obj_version := '0.1';

    APEX_JSON.INITIALIZE_CLOB_OUTPUT;

    APEX_JSON.OPEN_OBJECT();
      APEX_JSON.WRITE('sender', 'bordercontrol');
      APEX_JSON.WRITE('object', 'voa');
      APEX_JSON.WRITE('dmlType', p_dml_type);
      APEX_JSON.WRITE('pk', p_key_value);
    APEX_JSON.CLOSE_OBJECT();

    l_payload.obj_input := APEX_JSON.GET_CLOB_OUTPUT;

    APEX_JSON.FREE_OUTPUT;

    dbms_aq.enqueue(queue_name          => c_hook_queue_name
                   ,enqueue_options     => l_enqueue_options
                   ,message_properties  => l_message_properties
                   ,payload             => l_payload
                   ,msgid               => l_msgid);
    commit;

    logger.log('SET ACTION VOA: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('SET ACTION VOA: unhandled exeption', l_scope, null, l_params);
      RAISE;

  END set_action_visa_on_arrival;

  /**
   * Sets actions to push information about new Fee entries
   *
   * @param p_key_value Primary key of the Fee that was inserted, updated or deleted
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.pdate, D.elete)
   */
  PROCEDURE set_action_fees (p_key_value IN dl_bordercontrol.faf_fees_and_fines.key_value%TYPE
                            ,p_dml_type  IN CHAR DEFAULT 'I')
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'set_action_fees';
    l_params logger.tab_param;
    --

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.append_param(l_params, 'p_dml_type', p_dml_type);
    logger.log('SET ACTION FEE: start', l_scope, null, l_params);



    logger.log('SET ACTION FEE: done', l_scope, null, l_params);

  END set_action_fees;

  /**
   * Sets actions to push information about new Fine entries
   *
   * @param p_key_value Primary key of Fine that was inserted, updated or deleted
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.pdate, D.elete)
   */
  PROCEDURE set_action_fines (p_key_value IN dl_bordercontrol.faf_fees_and_fines.key_value%TYPE
                             ,p_dml_type  IN CHAR DEFAULT 'I')
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'set_action_fines';
    l_params logger.tab_param;
    --

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.append_param(l_params, 'p_dml_type', p_dml_type);
    logger.log('SET ACTION FINES: start', l_scope, null, l_params);



    logger.log('SET ACTION FINES: done', l_scope, null, l_params);

  END set_action_fines;


  /**
   * Sets actions to push information about new Extend Stay entries
   *
   * @param p_key_value Primary key of Extend Stay that was inserted, updated or deleted
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.pdate, D.elete)
   */
  /*PROCEDURE set_action_extend_stay (p_key_value  IN dl_bordercontrol.extstay_application.key_value%TYPE
                                   ,p_dml_type   IN CHAR DEFAULT 'I')
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'set_action_extend_stay';
    l_params logger.tab_param;
    --

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.append_param(l_params, 'p_dml_type', p_dml_type);
    logger.log('SET ACTION EXTENDSTAY: start', l_scope, null, l_params);



    logger.log('SET ACTION EXTENDSTAY: done', l_scope, null, l_params);

  END set_action_extend_stay;*/

  /**
   * Sets actions to push information about new ReEntry entries
   *
   * @param p_key_value Primary key of ReEntry that was inserted, updated or deleted
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.pdate, D.elete)
   */
  PROCEDURE set_action_reentry (p_key_value  IN dl_bordercontrol.tm8_application.key_value%TYPE
                               ,p_dml_type   IN CHAR DEFAULT 'I')
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'set_action_reentry';
    l_params logger.tab_param;
    --

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.append_param(l_params, 'p_dml_type', p_dml_type);
    logger.log('SET ACTION REENTRY: start', l_scope, null, l_params);



    logger.log('SET ACTION REENTRY: done', l_scope, null, l_params);

  END set_action_reentry;


END;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_PIBICS_HOOK" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_PIBICS_HOOK" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_PIBICS_HOOK" TO "BIOSUPPORT";
