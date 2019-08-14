prompt --application/pages/page_00510
begin
wwv_flow_api.create_page(
 p_id=>510
,p_user_interface_id=>wwv_flow_api.id(63122774904203102)
,p_name=>'Parameter Settings'
,p_page_mode=>'NORMAL'
,p_step_title=>'Parameter Settings'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Parameter Settings'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function escapeHtml(text) {',
'    ''use strict'';',
'    return text.replace(/[\"&<>]/g, function (a) {',
'        return { ''"'': ''&quot;'', ''&'': ''&amp;'', ''<'': ''&lt;'', ''>'': ''&gt;'' }[a];',
'    });',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(58964392495783603)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180912125400'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(64103377804252015)
,p_plug_name=>'Parameter Settings'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(63096075490202982)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.ID',
'      ,t.NAME',
'      ,t.DISPLAY_NAME',
'      ,apex_escape.html(t.DESCRIPTION) as description',
'      ,t.SORT_ORDER',
'      ,t.VALUE_TYPE',
'      ,t.INS_AT as INSERT_DATE',
'      ,t.INS_BY as INSERT_SOURCE',
'      ,cast(t.DML_AT as date) as UPDATE_DATE',
'      ,t.DML_BY as UPDATE_SOURCE',
'      ,coalesce(coalesce(t.VALUE_STR',
'                        ,t.DEFAULT_STR)',
'               ,to_char(coalesce(t.VALUE_NUM',
'                                ,t.DEFAULT_NUM))',
'               ,case (coalesce(t.VALUE_IS_ON',
'                          ,t.DEFAULT_IS_ON))',
'                  when 1 then',
'                   ''On''',
'                  else',
'                   ''Off''',
'                end) as "ACTIVE_VALUE"',
'  from PARAMETER_SETTINGS t',
' where t.IS_MODIFIABLE_IN_APEX = 1',
' order by t.SORT_ORDER',
'         ,t.DISPLAY_NAME',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(59022491778956593)
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(64103486349252015)
,p_name=>'Parameter Settings'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_base_pk1=>'ID'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit">'
,p_icon_view_columns_per_row=>1
,p_owner=>'ADMIN'
,p_internal_uid=>3482921346587666
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(64103939875252017)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>' '
,p_column_link=>'f?p=&APP_ID.:511:&SESSION.::&DEBUG.::P511_ID:#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_column_type=>'STRING'
,p_security_scheme=>wwv_flow_api.id(59023368500969587)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(64104332764252019)
,p_db_column_name=>'NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(64104730068252020)
,p_db_column_name=>'DISPLAY_NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Parameter'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span style="text-decoration:none;cursor:default;">#DISPLAY_NAME# <span class="fa fa-alert" onmouseover="toolTip_enable(event,this,''#DESCRIPTION#'')"></span></span> ',
'	',
''))
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(64105146020252021)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(64105885590252024)
,p_db_column_name=>'SORT_ORDER'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Sort Order'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(64106355929252025)
,p_db_column_name=>'VALUE_TYPE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Value Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(64110212105252038)
,p_db_column_name=>'INSERT_DATE'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Insert Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(64110600374252039)
,p_db_column_name=>'INSERT_SOURCE'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Insert Source'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(64110983335252041)
,p_db_column_name=>'UPDATE_DATE'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Update Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(64111446582252042)
,p_db_column_name=>'UPDATE_SOURCE'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Update Source'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(64111795638252043)
,p_db_column_name=>'ACTIVE_VALUE'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Active Value'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(64119428779256837)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'34989'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'ID:DISPLAY_NAME:DESCRIPTION:ACTIVE_VALUE:INSERT_DATE:INSERT_SOURCE:UPDATE_DATE:UPDATE_SOURCE:'
,p_flashback_enabled=>'N'
);
end;
/
