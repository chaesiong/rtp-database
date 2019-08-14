prompt --application/pages/page_00020
begin
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(71772255799297339)
,p_name=>'History'
,p_page_mode=>'NORMAL'
,p_step_title=>'History'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.is-pending',
'{',
'    background-color:#FBCE4A;',
'}',
'',
'.t-Timeline-avatar img{',
'    width: 100%;',
'    height: auto;',
'    ',
'    bottom: 10px;',
'    position: relative;',
'    ',
'    -webkit-background-clip: padding-box;',
'    -moz-background-clip: padding;',
'    background-clip: padding-box;',
'}',
'',
'.landscape .t-Timeline-avatar img{ width: auto;',
'    height: 100%;}',
'.potrait .t-Timeline-avatar img{ width: 100%;',
'    height: auto;}',
'',
'.t-Timeline-avatar:hover {',
'    width: 200px;',
'    height: 200px;',
'    position: absolute;',
'    /* left: 100px; */',
'    z-index: 990;',
'}'))
,p_step_template=>wwv_flow_api.id(71725998477297085)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'DNOTZON'
,p_last_upd_yyyymmddhh24miss=>'20180822104849'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(99804919964740482)
,p_name=>'Previously created TM8 Applications'
,p_template=>wwv_flow_api.id(71735574935297143)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  dbms_lob.getlength(PERSON.IMAGE) user_avatar,',
'  ''u-color-''||ora_hash(PERSON.FIRST_NAME || '' '' || PERSON.MIDDLE_NAME || '' '' || PERSON.LAST_NAME,44)||''-txt'' user_color,',
'  PERSON.FIRST_NAME || '' '' || PERSON.MIDDLE_NAME || '' '' || PERSON.LAST_NAME as user_name,',
'  to_char(TM8_APPLICATION.INS_AT, ''DD.MM.YYYY HH24:MI'') as event_date,',
'  DECODE(TM8_APPLICATION.TM8_TYPE,''S'',''Single'',''M'',''Multiple'') || '' Re-Entry '' ||  lov_statuses.DISPLAY_VALUE as event_type,',
'  ''#'' ||TM8_APPLICATION.APPLICATION_NUMBER|| '' Passport No.: <b>'' || TM8_APPLICATION.PASSPORTNO || ''</b>'' as event_title,',
'  TM8_APPLICATION.NUMBER_OF_ENTRIES_USED || '' entries of '' || TM8_APPLICATION.NUMBER_OF_ENTRIES || '' used'' event_desc,',
'  case TM8_APPLICATION.APPROVAL_STATUS ',
'    when ''END_OF_PERMIT'' then ''fa fa-clock-o''',
'    when ''APPROVED'' then ''fa fa-check-circle-o''',
'    when ''NOT_APPROVED'' then ''fa fa-exclamation-circle''',
'    when ''CANCELED'' then ''fa fa-exclamation-triangle''',
'  end event_icon,',
'  case TM8_APPLICATION.APPROVAL_STATUS  ',
'    when ''APPROVED'' then ''is-new''',
'    when ''CANCELED'' then ''is-pending''',
'    when ''NOT_APPROVED'' then ''is-removed''',
'    when ''END_OF_PERMIT'' then ''is-updated''',
'  end event_status,',
'  PERSON.KEY_VALUE as KEY_VALUE,',
'  TM8_APPLICATION.APPLICATION_NUMBER,',
'  ''nameinitials=''|| substr(PERSON.FIRST_NAME,0,1) || substr(PERSON.LAST_NAME,0,1) ||'''' as event_attributes',
'FROM ',
'    TM8_APPLICATION, PERSON, lov_statuses',
'WHERE ',
'    TM8_APPLICATION.PERSON_FK = PERSON.KEY_VALUE AND ',
'    TM8_APPLICATION.APPROVAL_STATUS = lov_statuses.RETURN_VALUE AND',
'    lov_statuses.owner$tag = ''APEX_REENTRY'' AND',
'    lov_statuses.tag$tag = ''REENTRY_TM8STATUS''',
'ORDER BY TM8_APPLICATION.INS_AT DESC'))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(71751842703297189)
,p_query_num_rows=>999
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_query_row_count_max=>1000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(99805029601740483)
,p_query_column_id=>1
,p_column_alias=>'USER_AVATAR'
,p_column_display_sequence=>1
,p_column_heading=>'User avatar'
,p_use_as_row_header=>'N'
,p_column_format=>'IMAGE:PERSON:IMAGE:KEY_VALUE::::::::'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(99805205247740484)
,p_query_column_id=>2
,p_column_alias=>'USER_COLOR'
,p_column_display_sequence=>2
,p_column_heading=>'User color'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(99806003510740492)
,p_query_column_id=>3
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>8
,p_column_heading=>'User name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(99806017354740493)
,p_query_column_id=>4
,p_column_alias=>'EVENT_DATE'
,p_column_display_sequence=>9
,p_column_heading=>'Event date'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(99805453188740487)
,p_query_column_id=>5
,p_column_alias=>'EVENT_TYPE'
,p_column_display_sequence=>3
,p_column_heading=>'Event type'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(99805567921740488)
,p_query_column_id=>6
,p_column_alias=>'EVENT_TITLE'
,p_column_display_sequence=>4
,p_column_heading=>'Event title'
,p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP:P1_APPLICATION_NO:#APPLICATION_NUMBER#'
,p_column_linktext=>'#EVENT_TITLE#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(99805641258740489)
,p_query_column_id=>7
,p_column_alias=>'EVENT_DESC'
,p_column_display_sequence=>5
,p_column_heading=>'Event desc'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(99805757142740490)
,p_query_column_id=>8
,p_column_alias=>'EVENT_ICON'
,p_column_display_sequence=>6
,p_column_heading=>'Event icon'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(99805822726740491)
,p_query_column_id=>9
,p_column_alias=>'EVENT_STATUS'
,p_column_display_sequence=>7
,p_column_heading=>'Event status'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(99806143739740494)
,p_query_column_id=>10
,p_column_alias=>'KEY_VALUE'
,p_column_display_sequence=>10
,p_column_heading=>'Key value'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(99806484181740497)
,p_query_column_id=>11
,p_column_alias=>'APPLICATION_NUMBER'
,p_column_display_sequence=>11
,p_column_heading=>'Application number'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(99807049009740503)
,p_query_column_id=>12
,p_column_alias=>'EVENT_ATTRIBUTES'
,p_column_display_sequence=>12
,p_column_heading=>'Event attributes'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(99806312537740495)
,p_name=>'Adjust Image Size to fit Circle'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(99806412997740496)
,p_event_id=>wwv_flow_api.id(99806312537740495)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''.t-Timeline-avatar img'').each(function(){',
'    var imageWidth = $(this).find(''img'').width();',
'    var imageheight = $(this).find(''img''). height();',
'    if(imageWidth > imageheight){',
'        $(this).addClass(''landscape'');',
'    }else{',
'        $(this).addClass(''potrait'');',
'   }',
'})'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(99807124159740504)
,p_name=>'Set Initials for Activities without Image'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(99807220181740505)
,p_event_id=>wwv_flow_api.id(99807124159740504)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''.t-Timeline-avatar:not(:has(*))'').each(function() {  $(this).html( $(this).parent().parent().parent().attr(''nameinitials'') )  });'
,p_stop_execution_on_error=>'Y'
);
end;
/
