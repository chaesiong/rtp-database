
-- Generated by ORDS REST Data Services 18.4.0.r3541002
-- Schema: DL_BORDERCONTROL Date: removed for diff
--

BEGIN
  ORDS.ENABLE_SCHEMA(
      p_enabled             => TRUE,
      p_schema              => 'DL_BORDERCONTROL',
      p_url_mapping_type    => 'BASE_PATH',
      p_url_mapping_pattern => 'dl_bordercontrol',
      p_auto_rest_auth      => FALSE);

  ORDS.DEFINE_MODULE(
      p_module_name    => 'Abis',
      p_base_path      => '/abis/',
      p_items_per_page => 25,
      p_status         => 'PUBLISHED',
      p_comments       => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'Abis',
      p_pattern        => 'sync/borderdocument/{BORDERDOC_ID}',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'Abis',
      p_pattern        => 'sync/borderdocument/{BORDERDOC_ID}',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_items_per_page => 0,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         =>
'declare
    l_abis_id   number;
    l_message   varchar2(100);
begin
    -- insert into travel abis
    l_abis_id := dl_bordercontrol.pkg_bmbs_apex_util.bmbs_insert_travel_abis_document(:BORDERDOC_ID);

    -- error message
    if l_abis_id is null
    then l_message := ''An error occured, the sync was not successful.'';
    end if;

    -- return values
    :message    := l_message;
    :abisid     := l_abis_id;
end;');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'Abis',
      p_pattern            => 'sync/borderdocument/{BORDERDOC_ID}',
      p_method             => 'POST',
      p_name               => 'abisid',
      p_bind_variable_name => 'abisid',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'INT',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'Abis',
      p_pattern            => 'sync/borderdocument/{BORDERDOC_ID}',
      p_method             => 'POST',
      p_name               => 'message',
      p_bind_variable_name => 'message',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'Abis',
      p_pattern        => 'sync/movement/{MOVEMENT_ID}',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'Abis',
      p_pattern        => 'sync/movement/{MOVEMENT_ID}',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_items_per_page => 0,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         =>
'declare
    l_abis_id   number;
    l_message   varchar2(100);
begin
    -- insert into travel abis
    l_abis_id := dl_bordercontrol.pkg_bmbs_apex_util.bmbs_insert_travel_abis_movement(:MOVEMENT_ID);

    -- error message
    if l_abis_id is null
    then l_message := ''An error occured, the sync was not successful.'';
    end if;

    -- return values
    :message    := l_message;
    :abisid     := l_abis_id;
end;');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'Abis',
      p_pattern            => 'sync/movement/{MOVEMENT_ID}',
      p_method             => 'POST',
      p_name               => 'abisid',
      p_bind_variable_name => 'abisid',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'INT',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'Abis',
      p_pattern            => 'sync/movement/{MOVEMENT_ID}',
      p_method             => 'POST',
      p_name               => 'message',
      p_bind_variable_name => 'message',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'Abis',
      p_pattern        => 'syncError/borderdocuments',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'Abis',
      p_pattern        => 'syncError/borderdocuments',
      p_method         => 'GET',
      p_source_type    => 'json/query',
      p_items_per_page => 0,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         =>
'select brddocid
from dl_bordercontrol.v_sync_docs_with_bio_movements');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'Abis',
      p_pattern        => 'syncError/movements',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'Abis',
      p_pattern        => 'syncError/movements',
      p_method         => 'GET',
      p_source_type    => 'json/query',
      p_items_per_page => 0,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         =>
'select movement_id
from dl_bordercontrol.v_travel_abis_insert_error');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'Abis',
      p_pattern        => 'syncStatus',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'Abis',
      p_pattern        => 'syncStatus',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_items_per_page => 25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         =>
'begin
    -- Set message
    :message := ''Number of Movements with errors while syncing with ABIS and number of Borderdocuments without ABIS ID'';

    -- movement counter
    select count(*)
    into :movements
    from dl_bordercontrol.v_travel_abis_insert_error;

    -- borderdocument counter
    select count(*)
    into :borderdocuments
    from dl_bordercontrol.v_sync_docs_with_bio_movements;

end;');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'Abis',
      p_pattern            => 'syncStatus',
      p_method             => 'GET',
      p_name               => 'borderdocuments',
      p_bind_variable_name => 'borderdocuments',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'INT',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'Abis',
      p_pattern            => 'syncStatus',
      p_method             => 'GET',
      p_name               => 'message',
      p_bind_variable_name => 'message',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'Abis',
      p_pattern            => 'syncStatus',
      p_method             => 'GET',
      p_name               => 'movements',
      p_bind_variable_name => 'movements',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'INT',
      p_access_method      => 'OUT',
      p_comments           => NULL);



COMMIT;

END;


/
timing for: TIMER_REST_EXPORT
Elapsed: 00:00:00.25
