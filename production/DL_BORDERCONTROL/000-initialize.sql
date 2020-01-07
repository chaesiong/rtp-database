BEGIN
  ORDS.DROP_REST_FOR_SCHEMA;
  ORDS.ENABLE_SCHEMA;
/* OR use
ORDS.ENABLE_SCHEMA(
 p_schema => 'DL_SCHEMA',
 p_url_mapping_type => 'BASE_PATH',
 p_url_mapping_pattern => 'alias-dl-schema',
 p_auto_rest_auth => FALSE
)
*/
COMMIT;
END;
/