prompt --application/pages/page_08006
begin
wwv_flow_api.create_page(
 p_id=>8006
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'License Information'
,p_page_mode=>'NORMAL'
,p_step_title=>'License Information'
,p_step_sub_title=>'License Information'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_IMAGES#Dermalog.Plugins.js',
'#APP_IMAGES#BioScreenDisplayControl.js',
'#WORKSPACE_IMAGES#GenericFunctions.js',
'#APP_IMAGES#BioScreenMaintenance.js'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-labelContainer {',
'    text-align: left;',
'}'))
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190621232407'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(165686898418910907)
,p_plug_name=>'License Information'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>52
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<h2>License Information</h>'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(248479453529594281)
,p_plug_name=>'Dynamic Object List'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>42
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.p(''<script>v_display_objects = []'');',
'for c_row in (select object_id, object_name, decode(delete_flag, 0, ''false'', ''true'') delete_flag, decode(is_default, 0, ''false'', ''true'') is_default, decode(is_video, 0, ''false'', ''true'') is_video from display_objects) loop',
'    htp.p(''v_display_objects.push({object_id:'' || c_row.object_id || '',object_name:"'' || c_row.object_name || ''",delete_flag:'' || c_row.delete_flag || '',is_default:'' || c_row.is_default || '',is_video:'' || c_row.is_video || ''});'');',
'end loop;',
'htp.p(''</script>'');',
'',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29694414707753864501)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(165686396220910902)
,p_plug_name=>'Text Information'
,p_parent_plug_id=>wwv_flow_api.id(29694414707753864501)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>5
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(248479984228594286)
,p_plug_name=>'License Information'
,p_parent_plug_id=>wwv_flow_api.id(29694414707753864501)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(165686256515910901)
,p_name=>'P8006_LICENSE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(248479984228594286)
,p_prompt=>'License'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_tag_attributes=>'style="max-width:90%"'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.Get_APP_Static_File_Content(''License.png'') from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(165686491570910903)
,p_name=>'P8006_SYSTEM_TIME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(165686396220910902)
,p_prompt=>'System Time:'
,p_format_mask=>'fmDay, fmDD fmMonth, YYYY'
,p_source=>'Select to_char(sysdate, ''Day'')||'', ''|| to_char(sysdate, ''Month DD, YYYY'') from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'t-Form-fieldContainer--large:margin-right-none'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(165686611280910904)
,p_name=>'P8006_LICENSE_ABIS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(165686396220910902)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Remaining ABIS licenses:'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    trim(to_char(MIN(LREM), ''999G999G999G999G999G999G990'')) LICENSE_COUNT_INFO FROM',
'(',
'    SELECT',
'    least(coalesce(LM.REMAINING_FACE, 0), coalesce(LM.REMAINING_FINGER, 0)) LREM',
'    FROM DL_BORDERCONTROL.LICENSE_MONITORING LM',
'    WHERE LM.ABIS_SYSTEM = ''BLACKLIST''',
'    AND CHECK_TIME = (SELECT MAX(CHECK_TIME) FROM DL_BORDERCONTROL.LICENSE_MONITORING WHERE ABIS_SYSTEM = ''BLACKLIST'')',
'    UNION ALL',
'    SELECT',
'    least(coalesce(LM.REMAINING_FACE, 0), coalesce(LM.REMAINING_FINGER, 0)) LREM',
'    FROM DL_BORDERCONTROL.LICENSE_MONITORING LM',
'    WHERE LM.ABIS_SYSTEM = ''MOVEMENTS''',
'    AND CHECK_TIME = (SELECT MAX(CHECK_TIME) FROM DL_BORDERCONTROL.LICENSE_MONITORING WHERE ABIS_SYSTEM = ''MOVEMENTS'')',
')'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(165686632170910905)
,p_name=>'P8006_LICENSE_PROJECT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(165686396220910902)
,p_prompt=>'License Project:'
,p_source=>'RTP Bio Project'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(165686809228910906)
,p_name=>'P8006_CUSTOMER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(165686396220910902)
,p_prompt=>'Customer:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
