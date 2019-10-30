
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
      p_module_name    => 'Interfaces',
      p_base_path      => '/interface/',
      p_items_per_page => 25,
      p_status         => 'PUBLISHED',
      p_comments       => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'Interfaces',
      p_pattern        => '/blacklist/search',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'Interfaces',
      p_pattern        => '/blacklist/search',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_items_per_page => 0,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         =>
'DECLARE

    l_result           CLOB;
    l_system_user      VARCHAR2(250 CHAR);
    l_system_source    VARCHAR2(250 CHAR);
    l_object_id        VARCHAR2(100 CHAR);
    --
    l_input_json       JSON_OBJECT_T;

BEGIN

    l_input_json := JSON_OBJECT_T(:body);
    l_system_user := l_input_json.get_string(''systemUser'');
    l_system_source := l_input_json.get_string(''systemSource'');
    l_object_id := l_input_json.get_string(''objectId'');

    l_input_json.remove(''systemUser'');
    l_input_json.remove(''systemSource'');
    l_input_json.remove(''objectId'');

    l_result := dl_interface.pkg_webservices_blacklist.search_blacklist_system (p_user          => l_system_user
                                                                               ,p_system        => l_system_source
                                                                               ,p_object_id     => l_object_id
                                                                               ,p_request_clob  => l_input_json.to_clob());

    dl_common.pljson_printer.htp_output_clob(l_result);

    NULL;

END;');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'Interfaces',
      p_pattern        => 'authenticate/user',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'Interfaces',
      p_pattern        => 'authenticate/user',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_items_per_page => 0,
      p_mimes_allowed  => 'application/json',
      p_comments       => NULL,
      p_source         =>
'declare
    l_values         apex_json.t_values;
    l_source_blob    blob := :body;
    l_source_clob    clob;
    --
    l_dstoff     integer := 1;
    l_srcoff     integer := 1;
    l_lngctx     integer := 0;
    l_warning    integer;
    --
    l_error_message varchar2(4000);
    l_status        integer := 204;
    --
    l_username      varchar2(50);
    l_password      varchar2(4000);
    l_first_name    varchar2(100);
    l_last_name     varchar2(100);
    l_authenticate  boolean;
    l_user_id       varchar2(32);
    l_cursor        sys_refcursor;
begin
    begin
        -- initialize, convert and parse
        dbms_lob.createtemporary(l_source_clob, true);

        dbms_lob.converttoclob(dest_lob    => l_source_clob
                              ,src_blob     => l_source_blob
                              ,amount       => dbms_lob.lobmaxsize
                              ,dest_offset  => l_dstoff
                              ,src_offset   => l_srcoff
                              ,blob_csid    => nls_charset_id(''AL32UTF8'')
                              ,lang_context => l_lngctx
                              ,warning      => l_warning);

        apex_json.parse(p_values => l_values
                       ,p_source => l_source_clob);

        l_username := apex_json.get_varchar2(p_values => l_values, p_path => ''Username'');
        l_password := apex_json.get_varchar2(p_values => l_values, p_path => ''Password'');

        -- Check all mandatory fields; if not filled exit with code 400 and msg
        if l_username    is null or
           l_password    is null
        then
            l_error_message := ''Cannot authenticate. Not all fields provided. Missing: '';

            case when l_username is null then l_error_message := l_error_message || ''Username, '';   else null; end case;
            case when l_password is null then l_error_message := l_error_message || ''Password, '';   else null; end case;

            l_error_message := substr(l_error_message, 1, length(l_error_message) - 2) || ''. Please provide and then try again.'';

            :status := 400;
            :msg    := l_error_message;
            :result := null;
            :firstname  := null;
            :lastname   := null;
            return;

        end if;

    -- exception handling; fail json parse or check madatory
    exception when others
    then
        :status := 400;
        :msg    := ''Body could not be parsed. Check your json'';
        :result := null;
        :firstname  := null;
        :lastname   := null;
        return;
    end;

    begin
        -- Check if username and password match
        l_authenticate := dl_user_management.pkg_man_users.apex_authenticate(l_username, l_password);

        if l_authenticate then

            -- load user id
            select id
            into l_user_id
            from dl_user_management.users
            where username = upper(l_username);

            -- load objects, grants, role and inherit role
            begin
                open l_cursor for
                    select obj.ID as OBJECT_ID
                          ,LISTAGG(g.NAME
                                  ,'', '') WITHIN group(order by g.SORT_ORDER) as GRANTS
                          ,r0.ROLE_ID_OR_DN
                          ,decode(r0.INHERIT_LEVEL
                                 ,0
                                 ,r0.ROLE_ID_OR_DN
                                 ,r0.ROOT_ROLE_ID_OR_DN) as INHERITED_BY_ROLE
                      from (
                            --
                            select CONNECT_BY_ROOT t0.ROLE_ID_OR_DN as ROOT_ROLE_ID_OR_DN
                                   ,t0.ROLE_ID_OR_DN
                                   ,level - 1 as INHERIT_LEVEL
                              from dl_user_management.ROLE_ROLE_ROLES_POOL t0
                              left join dl_user_management.ROLE_ROLE_REL t1
                                on t0.ROLE_ID_OR_DN = coalesce(t1.ROLE_ID
                                                              ,t1.ROLE_DN)
                            -- "Start with" and "connect by" UPWARDS not DOWNWARDS!
                             start with t0.ROLE_ID_OR_DN in (select coalesce(s0.ROLE_ID
                                                                            ,s0.ROLE_DN) as ROLE_ID_OR_DN
                                                               from dl_user_management.USER_ROLE_REL_POOL s0
                                                              where s0.USER_ID_OR_DN = l_user_id
                                                             )
                            connect by nocycle prior t0.ROLE_ID_OR_DN = coalesce(t1.MEMBER_ROLE_ID
                                                                        ,t1.MEMBER_ROLE_DN)
                            --
                            ) r0
                     inner join(
                    --
                    dl_user_management.ROLE_OBJECT_GRANT_REL r
                     inner join dl_user_management.OBJECT_GRANT_REL o
                        on r.OBJECT_GRANT_REL_ID = o.ID
                     inner join dl_user_management.OBJECTS obj
                        on o.OBJECT_ID = obj.ID
                     inner join dl_user_management.GRANTS g
                        on o.GRANT_ID = g.ID
                    --
                     ) on r0.ROLE_ID_OR_DN = coalesce(r.ROLE_ID, r.ROLE_DN)
                     where 1 = 1
                       and (r0.INHERIT_LEVEL > 0 or (obj.ID is not null and g.NAME is not null))
                       and obj.ID is not null
                     group by r0.ROOT_ROLE_ID_OR_DN
                             ,obj.ID
                             ,obj.SORT_ORDER
                             ,r0.ROLE_ID_OR_DN
                             ,r0.INHERIT_LEVEL
                     order by obj.SORT_ORDER
                             ,r0.INHERIT_LEVEL desc;

            select first_name, last_name
            into l_first_name, l_last_name
            from dl_user_management.users
            where username = upper(l_username);

            :status     := 200;
            :msg        := null;
            :result     := l_cursor;
            :firstname  := l_first_name;
            :lastname   := l_last_name;
            -- exception handler when no data found or others
            exception
            when no_data_found then
                :msg    := ''The user got no objects or grants.'';
                :result := null;
            when others then
                :status := 500;
                :msg    := sqlerrm;
                :result := null;
                :firstname  := null;
                :lastname   := null;

                return;
            end;

        else
            :status := 401;
            :msg    := ''Invalid username and password combination.'';
            :result := null;
            :firstname  := null;
            :lastname   := null;
        end if;

    exception when others
    then
        :status := 500;
        :msg    := sqlerrm;
        :result := null;
        :firstname  := null;
        :lastname   := null;
        return;
    end;
end;');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'Interfaces',
      p_pattern            => 'authenticate/user',
      p_method             => 'POST',
      p_name               => 'X-APEX-STATUS-CODE',
      p_bind_variable_name => 'status',
      p_source_type        => 'HEADER',
      p_param_type         => 'INT',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'Interfaces',
      p_pattern            => 'authenticate/user',
      p_method             => 'POST',
      p_name               => 'firstName',
      p_bind_variable_name => 'firstname',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'Interfaces',
      p_pattern            => 'authenticate/user',
      p_method             => 'POST',
      p_name               => 'lastName',
      p_bind_variable_name => 'lastname',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'Interfaces',
      p_pattern            => 'authenticate/user',
      p_method             => 'POST',
      p_name               => 'msg',
      p_bind_variable_name => 'msg',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'Interfaces',
      p_pattern            => 'authenticate/user',
      p_method             => 'POST',
      p_name               => 'permissions',
      p_bind_variable_name => 'result',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'RESULTSET',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'Interfaces',
      p_pattern        => 'syncOut/error',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'Interfaces',
      p_pattern        => 'syncOut/error',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_items_per_page => 0,
      p_mimes_allowed  => 'application/json',
      p_comments       => NULL,
      p_source         =>
'declare
    --
    l_values         apex_json.t_values;
    l_source_blob    blob := :body;
    l_source_clob    clob;
    --
    l_response          clob;
    l_response_message  varchar2(4000);
    --
    l_dstoff    integer := 1;
    l_srcoff    integer := 1;
    l_lngctx    integer := 0;
    l_warning   integer;
    --
    l_sync_out_error    dl_interface.sync_out_error%ROWTYPE;
    --
begin

    -- convert json
    dbms_lob.createtemporary(l_source_clob, true);

    dbms_lob.converttoclob(dest_lob     => l_source_clob
                          ,src_blob     => l_source_blob
                          ,amount       => dbms_lob.lobmaxsize
                          ,dest_offset  => l_dstoff
                          ,src_offset   => l_srcoff
                          ,blob_csid    => nls_charset_id(''al32utf8'')
                          ,lang_context => l_lngctx
                          ,warning      => l_warning);

    apex_json.parse (p_values => l_values
                    ,p_source => l_source_clob);

    -- read json and fill records
    l_sync_out_error.object_id      := apex_json.get_varchar2(p_values => l_values, p_path => ''objectID'');
    l_sync_out_error.payload        := apex_json.get_clob(p_values => l_values, p_path => ''payload'');
    l_sync_out_error.error          := apex_json.get_clob(p_values => l_values, p_path => ''error'');
    l_sync_out_error.uri            := apex_json.get_varchar2(p_values => l_values, p_path => ''uri'');

    insert into dl_interface.sync_out_error( object_id
                                            ,payload
                                            ,error
                                            ,uri
                                            ,dml_by)
    values(l_sync_out_error.object_id
          ,l_sync_out_error.payload
          ,l_sync_out_error.error
          ,l_sync_out_error.uri
          ,''ORDS - Initial insert.'');
end;');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'Interfaces',
      p_pattern        => 'syncOut/response',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'Interfaces',
      p_pattern        => 'syncOut/response',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_items_per_page => 0,
      p_mimes_allowed  => 'application/json',
      p_comments       => NULL,
      p_source         =>
'declare
    --
    l_values         apex_json.t_values;
    l_source_blob    blob := :body;
    l_source_clob    clob;
    --
    l_response          clob;
    l_response_message  varchar2(4000);
    --
    l_dstoff    integer := 1;
    l_srcoff    integer := 1;
    l_lngctx    integer := 0;
    l_warning   integer;
    --
    l_sync_out_allocation    dl_interface.sync_out_allocation%ROWTYPE;
    l_already_existing       number;
    --
begin

    -- convert json
    dbms_lob.createtemporary(l_source_clob, true);

    dbms_lob.converttoclob(dest_lob     => l_source_clob
                          ,src_blob     => l_source_blob
                          ,amount       => dbms_lob.lobmaxsize
                          ,dest_offset  => l_dstoff
                          ,src_offset   => l_srcoff
                          ,blob_csid    => nls_charset_id(''al32utf8'')
                          ,lang_context => l_lngctx
                          ,warning      => l_warning);

    apex_json.parse (p_values => l_values
                    ,p_source => l_source_clob);

    -- read json and fill records
    l_sync_out_allocation.object_id      := apex_json.get_varchar2(p_values => l_values, p_path => ''objectID'');
    l_sync_out_allocation.object_type    := apex_json.get_clob(p_values => l_values, p_path => ''objectType'');
    l_sync_out_allocation.external_id    := apex_json.get_clob(p_values => l_values, p_path => ''externalID'');
    l_sync_out_allocation.message        := apex_json.get_varchar2(p_values => l_values, p_path => ''message'');

    -- decide when to insert and when to update
    select count(*)
    into l_already_existing
    from dl_interface.sync_out_allocation soa
    where soa.object_id = l_sync_out_allocation.object_id;

    if l_already_existing >= 1 then
        update dl_interface.sync_out_allocation
        set object_type = nvl(l_sync_out_allocation.object_type, (select object_type from dl_interface.sync_out_allocation where object_id = l_sync_out_allocation.object_id))
           ,external_id = l_sync_out_allocation.external_id
           ,message     = nvl(l_sync_out_allocation.message,(select message from dl_interface.sync_out_allocation where object_id = l_sync_out_allocation.object_id))
        where object_id = l_sync_out_allocation.object_id;
    else
        insert into dl_interface.sync_out_allocation
        (object_id
        ,object_type
        ,external_id
        ,message)
        values
        (l_sync_out_allocation.object_id
        ,l_sync_out_allocation.object_type
        ,l_sync_out_allocation.external_id
        ,l_sync_out_allocation.message);
    end if;
end;');



COMMIT;

END;


/
timing for: TIMER_REST_EXPORT
Elapsed: 00:00:00.04
