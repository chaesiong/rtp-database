prompt --application/pages/page_00600
begin
wwv_flow_api.create_page(
 p_id=>600
,p_user_interface_id=>wwv_flow_api.id(165585018976055186)
,p_name=>'Location & Transport'
,p_page_mode=>'NORMAL'
,p_step_title=>'Location & Transport'
,p_step_sub_title=>'Location & Transport'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(75628207662254518)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20181023111119'
);
end;
/
