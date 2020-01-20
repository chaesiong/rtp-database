-- Generated by Oracle SQL Developer REST Data Services 18.4.0.376.1900
-- Exported REST Definitions from ORDS Schema Version 18.4.0.r3541002
-- Schema: DL_BORDERCONTROL   Date: Mon Jan 20 15:48:43 CET 2020
--
BEGIN
  ORDS.ENABLE_SCHEMA(
      p_enabled             => TRUE,
      p_schema              => 'DL_BORDERCONTROL',
      p_url_mapping_type    => 'BASE_PATH',
      p_url_mapping_pattern => 'dl_bordercontrol',
      p_auto_rest_auth      => FALSE);    

  ORDS.DEFINE_MODULE(
      p_module_name    => 'prodClone',
      p_base_path      => '/prodClone/',
      p_items_per_page =>  25,
      p_status         => 'PUBLISHED',
      p_comments       => NULL);      
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'prodClone',
      p_pattern        => 'resourceUnavailable',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'prodClone',
      p_pattern        => 'resourceUnavailable',
      p_method         => 'GET',
      p_source_type    => 'plsql/block',
      p_items_per_page =>  25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'begin
HTP.P (''<!DOCTYPE html>'');
HTP.P (''<html lang="de">'');
HTP.P (''  <head>'');
HTP.P (''    <meta charset="utf-8" />'');
HTP.P (''    <meta name="viewport" content="width=device-width, initial-scale=1.0" />'');
HTP.P (''    <title>External resource unavailable</title>'');
HTP.P (''  </head>'');
HTP.P (''  <body>'');
HTP.P (''    <h2>External resource unavailable in production clone:</h2>'');
HTP.P (''    <h3>'' || :resource || ''</h3>'');
HTP.P (''  </body>'');
HTP.P (''</html>'');
end;'
      );
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'prodClone',
      p_pattern            => 'resourceUnavailable',
      p_method             => 'GET',
      p_name               => 'resource',
      p_bind_variable_name => 'resource',
      p_source_type        => 'URI',
      p_param_type         => 'STRING',
      p_access_method      => 'IN',
      p_comments           => NULL);      


  COMMIT; 
END;