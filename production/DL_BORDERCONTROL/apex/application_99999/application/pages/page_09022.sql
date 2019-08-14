prompt --application/pages/page_09022
begin
wwv_flow_api.create_page(
 p_id=>9022
,p_user_interface_id=>wwv_flow_api.id(92393441321433977)
,p_name=>'Client Header Information'
,p_page_mode=>'NORMAL'
,p_step_title=>'Client Header Information'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'MSTEPHAN'
,p_last_upd_yyyymmddhh24miss=>'20180924071229'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65933049983829895)
,p_plug_name=>'Client Headers'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(92356736826433749)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.p(''<pre>'');',
'owa_util.print_cgi_env;',
'htp.p(''</pre>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65933071628829896)
,p_plug_name=>'Application Item Values'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(92356736826433749)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.p(''<table><tr><th>Item Name</th><th>Item Value</th></tr>'');',
'for c_row in (',
'    select distinct item_name from apex_application_items order by 1',
') loop',
'    null;',
'    htp.p(''<tr><td>'');',
'    htp.p(c_row.item_name);',
'    htp.p(''</td><td>'');',
'    htp.p(apex_escape.html(v(c_row.item_name)));',
'end loop;',
'htp.p(''</td></tr></table>'');',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
end;
/
