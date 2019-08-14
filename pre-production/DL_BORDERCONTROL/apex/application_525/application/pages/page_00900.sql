prompt --application/pages/page_00900
begin
wwv_flow_api.create_page(
 p_id=>900
,p_user_interface_id=>wwv_flow_api.id(106430524328307700)
,p_name=>'Test'
,p_page_mode=>'NORMAL'
,p_step_title=>'Test'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180912111045'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(79297273126063258)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'MY_AJAX'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    apex_json.open_object;  ',
'    apex_json.write(''success'', true);  ',
'    apex_json.write(''result'', ''test'');  ',
'    apex_json.close_object;  '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
