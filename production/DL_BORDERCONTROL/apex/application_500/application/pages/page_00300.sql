prompt --application/pages/page_00300
begin
wwv_flow_api.create_page(
 p_id=>300
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Edit Menu'
,p_page_mode=>'NORMAL'
,p_step_title=>'Edit Menu'
,p_step_sub_title=>'Edit Menu'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function moveDown(key_value)',
'{',
'	apex.server.process(',
'	''MOVE_NODE_DOWN'',                            ',
'	{',
'		x01: key_value',
'	}, ',
'	{',
'		success: function (pData) ',
'		{           ',
'			console.log(pData);',
'                        var region = apex.region( "MENU_ITEMS_REPORT" );',
'                        region.refresh();',
'		},',
'		dataType: "text"                   ',
'	}',
'	);',
'}',
'',
'function moveUp(key_value)',
'{',
'	apex.server.process(',
'	''MOVE_NODE_UP'',                            ',
'	{',
'		x01: key_value',
'	}, ',
'	{',
'		success: function (pData) ',
'		{           ',
'			console.log(pData);',
'                        apex.region( "MENU_ITEMS_REPORT" ).refresh();',
'		},',
'		dataType: "text"                   ',
'	}',
'	);',
'}'))
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180925133045'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(137379309178572333)
,p_plug_name=>'Menu Preview'
,p_region_name=>'MENU_ITEMS_PREVIEW'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case when connect_by_isleaf = 1 then 0 when level = 1 then 1 else -1 end as status,',
'        level,',
'        DISPLAY_VALUE as title,',
'        ''fa '' || IMAGE as icon,',
'        KEY_VALUE as value,',
'        DISPLAY_VALUE as tooltip,',
'        null as link ',
'   FROM DL_COMMON.APEX_MENU',
'  start with PARENT_KEY_VALUE is null',
'connect by prior KEY_VALUE = PARENT_KEY_VALUE',
'  order siblings by DISPLAY_ORDER'))
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'S'
,p_attribute_04=>'N'
,p_attribute_07=>'APEX_TREE'
,p_attribute_08=>'a-Icon'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(177039105049586429)
,p_name=>'Menu Items'
,p_region_name=>'MENU_ITEMS_REPORT'
,p_template=>wwv_flow_api.id(563820889302049617)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'menu_items.IMAGE,',
'menu_items.DISPLAY_VALUE,',
'menu_items.APP_ALIAS,',
'menu_items.PAGE_ID,',
'case ',
'when (select count(*) FROM DL_COMMON.APEX_MENU WHERE PARENT_KEY_VALUE = menu_items.KEY_VALUE) > 0 then ''fa fa-arrow-circle-down'' ',
'when menu_items.PARENT_KEY_VALUE IS NOT NULL then ''fa fa-arrow-circle-right t-Button--gapLeft'' ',
'end ARROW_MODIFIER,',
'case ',
'when (select count(*) FROM DL_COMMON.APEX_MENU WHERE PARENT_KEY_VALUE = menu_items.KEY_VALUE) > 0 then ''u-color-''||ORA_HASH(KEY_VALUE,45) ||''-text'' ',
'ELSE ''u-color-''||ORA_HASH(PARENT_KEY_VALUE ,45) ||''-text'' ',
'end colorcode,',
'''<button type="button" title="Move Down" aria-label="My Button" class="t-Button t-Button--noLabel t-Button--icon t-Button--tiny" onclick="moveDown(''||KEY_VALUE||'')">',
'	<span aria-hidden="true" class="t-Icon fa fa-arrow-circle-down"></span>',
'</button>',
'<button type="button" title="Move Up" aria-label="My Button" class="t-Button t-Button--noLabel t-Button--icon t-Button--tiny" onclick="moveUp(''||KEY_VALUE||'')">',
'	<span aria-hidden="true" class="t-Icon fa fa-arrow-circle-up"></span>',
'</button>',
'<a href="''||APEX_UTIL.PREPARE_URL(p_url => ''f?p='' || v(''APP_ID'')|| '':301:''||v(''APP_SESSION'')||''::NO::P301_KEY_VALUE:''||KEY_VALUE,p_checksum_type => ''SESSION'')||''"><button type="button" title="Edit" aria-label="My Button" class="t-Button t-Button--noL'
||'abel t-Button--icon t-Button--tiny">',
'	<span aria-hidden="true" class="t-Icon fa fa-pencil-square-o"></span>',
'</button></a>'' as actions',
'FROM DL_COMMON.APEX_MENU menu_items ORDER BY DISPLAY_ORDER;',
''))
,p_source_type=>'NATIVE_SQL_REPORT'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(563829676711049621)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(177042552418586461)
,p_query_column_id=>1
,p_column_alias=>'IMAGE'
,p_column_display_sequence=>1
,p_column_heading=>'Image'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<center><span class="fa #IMAGE#" aria-hidden="true"></span></center>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(177040978103586458)
,p_query_column_id=>2
,p_column_alias=>'DISPLAY_VALUE'
,p_column_display_sequence=>2
,p_column_heading=>'Label'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<span class="#COLORCODE# #ARROW_MODIFIER#"></span> #DISPLAY_VALUE#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(177045386302586473)
,p_query_column_id=>3
,p_column_alias=>'APP_ALIAS'
,p_column_display_sequence=>3
,p_column_heading=>'Application'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(177045750038586474)
,p_query_column_id=>4
,p_column_alias=>'PAGE_ID'
,p_column_display_sequence=>4
,p_column_heading=>'Page No.'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(137379613338572336)
,p_query_column_id=>5
,p_column_alias=>'ARROW_MODIFIER'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(137379488126572335)
,p_query_column_id=>6
,p_column_alias=>'COLORCODE'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(137380073118572341)
,p_query_column_id=>7
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>7
,p_column_heading=>'Actions'
,p_use_as_row_header=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_report_column_width=>115
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(177460239196050903)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(177039105049586429)
,p_button_name=>'ADD_NEW_ITEM'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'New Item'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:301:&SESSION.::&DEBUG.:RP:P301_KEY_VALUE:'
,p_icon_css_classes=>'fa-plus-square'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(177460016304050900)
,p_name=>'Refresh List'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(177460115391050901)
,p_event_id=>wwv_flow_api.id(177460016304050900)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(177039105049586429)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(137379900391572339)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'MOVE_NODE_DOWN'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'        l_counter NUMBER := 10;',
'',
'        PROCEDURE INIT_APEX_MENU IS	',
'        BEGIN',
'	    FOR i_rec IN ( SELECT * FROM(SELECT * FROM DL_COMMON.APEX_MENU ORDER BY DISPLAY_ORDER) ) LOOP',
'		    UPDATE DL_COMMON.APEX_MENU SET DISPLAY_ORDER = l_counter WHERE KEY_VALUE = i_rec.KEY_VALUE;',
'		    l_counter := l_counter + 10;',
'	    END LOOP;',
'            commit;',
'        END INIT_APEX_MENU;',
'BEGIN',
'        INIT_APEX_MENU();',
'',
'        UPDATE ',
'	        DL_COMMON.APEX_MENU ',
'		SET ',
'			DISPLAY_ORDER = DISPLAY_ORDER+11 ',
'		WHERE ',
'			KEY_VALUE = apex_application.g_x01/*',
'			AND DISPLAY_ORDER <= (',
'			SELECT ',
'				NVL(MAX(DISPLAY_ORDER),9999999)',
'			FROM ',
'				DL_COMMON.APEX_MENU ',
'			WHERE ',
'                                KEY_VALUE != apex_application.g_x01 AND',
'				PARENT_KEY_VALUE = ',
'				(',
'				SELECT ',
'					NVL(PARENT_KEY_VALUE,-9999) ',
'				FROM ',
'					DL_COMMON.APEX_MENU ',
'				WHERE ',
'					KEY_VALUE = apex_application.g_x01) )*/ -- commented out as a HOTFIX',
'                        ;',
'        commit;',
'',
'        ',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(137380160078572342)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'MOVE_NODE_UP'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	l_counter NUMBER := 10;',
'BEGIN',
'',
'	FOR i_rec IN ( SELECT * FROM(SELECT * FROM DL_COMMON.APEX_MENU ORDER BY DISPLAY_ORDER) ) LOOP',
'		UPDATE DL_COMMON.APEX_MENU SET DISPLAY_ORDER = l_counter WHERE KEY_VALUE = i_rec.KEY_VALUE;',
'		l_counter := l_counter + 10;',
'	END LOOP;',
'        commit;',
'',
'        UPDATE ',
'	        DL_COMMON.APEX_MENU ',
'		SET ',
'			DISPLAY_ORDER = DISPLAY_ORDER-11 ',
'		WHERE ',
'			KEY_VALUE = apex_application.g_x01 ',
'			AND DISPLAY_ORDER >= (',
'			SELECT ',
'				NVL(MIN(DISPLAY_ORDER),-9999999)',
'			FROM ',
'				DL_COMMON.APEX_MENU ',
'			WHERE ',
'                                KEY_VALUE != apex_application.g_x01 AND',
'				PARENT_KEY_VALUE = ',
'				(',
'				SELECT ',
'					NVL(PARENT_KEY_VALUE,-9999) ',
'				FROM ',
'					DL_COMMON.APEX_MENU ',
'				WHERE ',
'					KEY_VALUE = apex_application.g_x01) );',
'        commit;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
