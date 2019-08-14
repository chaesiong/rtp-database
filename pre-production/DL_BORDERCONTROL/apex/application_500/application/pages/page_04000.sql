prompt --application/pages/page_04000
begin
wwv_flow_api.create_page(
 p_id=>4000
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Movements'
,p_page_mode=>'NORMAL'
,p_step_title=>'Movements'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Movements'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-label {',
'font-weight:bold;',
'}'))
,p_step_template=>wwv_flow_api.id(563810118173049612)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20181216111535'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(45318686573898953)
,p_plug_name=>'Hidden Region'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95457608570695427)
,p_plug_name=>'Filter'
,p_region_name=>'id-region-filter'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--noIcon:t-Alert--info:t-Alert--removeHeading:t-Form--slimPadding:margin-top-sm:margin-bottom-sm'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95457808747695429)
,p_plug_name=>'Info'
,p_region_name=>'id-region-info'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody'
,p_region_attributes=>'style="display:none;"'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'Please provide at least one filter to display the report.'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(241865778987653127)
,p_plug_name=>'View/Edit Movements'
,p_region_name=>'id-region-report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    mvmntid,',
'    DECODE (exitflg, 1, ''<span class="fa fa-arrow-left my_red" aria-hidden="true" title="Departure"></span>'', 0, ''<span class="fa fa-arrow-right my_blue" aria-hidden="true" title="Arrival"></span>'') as EXITFLG,',
'    source_system,',
'    DECODE(person_type, 2, ''<span class="fa fa-crew black fa-1-5x" aria-hidden="true" title="Crew"></span>'', ''<span class="fa fa-user" aria-hidden="true" title="Traveler"></span>'') as PERSON_TYPE,',
'    trnsprtunitid,',
'    scanned_flight,',
'    visa_type,',
'    ins_by,',
'    movement_dt,',
'    ins_at,',
'    doctype,',
'    docno,',
'    issuectry,',
'    nat,',
'    calc_dob,',
'    expirydate,',
'    givenname,',
'    surname,',
'    middlename,',
'    sex,',
'    form_no,',
'    province,',
'    district,',
'    subdistrict,',
'    address,',
'    note,',
'    TO_CHAR(date_of_entry, ''DD/MM/YYYY HH24:MI:SS'') DATE_OF_ENTRY,',
'    ins_borderpost,',
'    ins_terminal,',
'    CASE',
'        WHEN date_of_entry BETWEEN SYSDATE-1 AND SYSDATE',
'            THEN ',
'            --''<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">''',
'            ''<button type="button" title="Edit Movement" class="t-Button t-Button--noLabel t-Button--icon" onclick="'' || APEX_UTIL.PREPARE_URL(p_url => ''f?p='' || V(''APP_ID'')|| '':4010:'' || v(''APP_SESSION'') || ''::NO::P4010_MVMNTID,P4010_EDITABLE:'' || m'
||'vmntid || '','' || CASE WHEN date_of_entry BETWEEN SYSDATE-1 AND SYSDATE THEN ''Y'' ELSE ''N'' END, p_checksum_type => ''SESSION'') || '';" >',
'			<span aria-hidden="true" class="t-Icon fa fa-user-edit"></span>',
'			</button>''',
'        ELSE ',
'            --''<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-view.png" class="apex-edit-view" alt="">''',
'            ''<button type="button" title="View Movement" class="t-Button t-Button--noLabel t-Button--icon" onclick="'' || APEX_UTIL.PREPARE_URL(p_url => ''f?p='' || V(''APP_ID'')|| '':4010:'' || v(''APP_SESSION'') || ''::NO::P4010_MVMNTID,P4010_EDITABLE:'' || m'
||'vmntid || '','' || CASE WHEN date_of_entry BETWEEN SYSDATE-1 AND SYSDATE THEN ''Y'' ELSE ''N'' END, p_checksum_type => ''SESSION'') || '';" >',
'			<span aria-hidden="true" class="t-Icon fa fa-search"></span>',
'			</button>''',
'    END icon,',
'    CASE',
'        WHEN date_of_entry BETWEEN SYSDATE-1 AND SYSDATE',
'            THEN ''Y''',
'        ELSE ''N''',
'    END editable',
'FROM dl_bordercontrol.v_edit_movements',
'WHERE 1=1',
'AND ',
'    CASE',
'        WHEN :P4000_IS_USER_SUPERVISOR = 1',
'            THEN 1',
'        WHEN ',
'        (',
'            SELECT COUNT(*)',
'            FROM dl_user_management.user_role_rel urr',
'            LEFT JOIN dl_user_management.users u',
'                ON u.id = urr.user_id',
'            RIGHT JOIN dl_user_management.role_object_grant_rel rogr',
'                ON rogr.role_id = urr.role_id',
'            RIGHT JOIN dl_user_management.object_grant_rel ogr',
'                ON ogr.id = rogr.object_grant_rel_id ',
'            WHERE u.username = ''OFFICER'' AND ogr.object_id = ''MD_EM_OFF''',
'        ) = 1 AND TRIM(ins_by) = :APP_USER',
'            THEN 1',
'    END = 1 ',
'--Filter',
'AND CAST(date_of_entry AS DATE) BETWEEN NVL(TO_DATE(:P4000_FROM, ''DD/MM/YYYY HH24:MI:SS''), CAST(date_of_entry AS DATE)) AND NVL(TO_DATE(:P4000_TO, ''DD/MM/YYYY HH24:MI:SS''), CAST(date_of_entry AS DATE))',
'AND ins_borderpost = NVL(:P4000_BORDERPOST, ins_borderpost)',
'AND ins_terminal = NVL(:P4000_TERMINAL, ins_terminal)',
'AND TRIM(ins_by) = NVL(UPPER(:P4000_OFFICER), TRIM(ins_by))'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P4000_BORDERPOST,P4000_TERMINAL,P4000_OFFICER,P4000_FROM,P4000_TO'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P4000_BORDERPOST IS NOT NULL',
'OR :P4000_TERMINAL IS NOT NULL',
'OR :P4000_OFFICER IS NOT NULL',
'OR (:P4000_FROM IS NOT NULL AND :P4000_TO IS NOT NULL)'))
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(244647564634167749)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No Data Found'
,p_max_rows_per_page=>'500'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'CHRISTINA'
,p_internal_uid=>205149466041306843
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(244647670475167750)
,p_db_column_name=>'MVMNTID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Mvmntid'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(244647761359167751)
,p_db_column_name=>'EXITFLG'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Direction'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(244647893197167752)
,p_db_column_name=>'SOURCE_SYSTEM'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Source System'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(244647978183167753)
,p_db_column_name=>'PERSON_TYPE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Person Type'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(244648032080167754)
,p_db_column_name=>'TRNSPRTUNITID'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Transport Unit'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(244648168255167755)
,p_db_column_name=>'SCANNED_FLIGHT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Scanned flight'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(244648213948167756)
,p_db_column_name=>'VISA_TYPE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Visa type'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(261858493820090450)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250254127423501507)
,p_db_column_name=>'INS_BY'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Officer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250254270900501508)
,p_db_column_name=>'MOVEMENT_DT'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Movement Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250254345923501509)
,p_db_column_name=>'INS_AT'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Ins at'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250254435994501510)
,p_db_column_name=>'DOCTYPE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250254501903501511)
,p_db_column_name=>'DOCNO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Document No.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250254683778501512)
,p_db_column_name=>'ISSUECTRY'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Issuectry'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250254711022501513)
,p_db_column_name=>'NAT'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Nat.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250254832397501514)
,p_db_column_name=>'CALC_DOB'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Date of Birth'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250254947439501515)
,p_db_column_name=>'EXPIRYDATE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Expiry Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250255045542501516)
,p_db_column_name=>'GIVENNAME'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Givenname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250255140167501517)
,p_db_column_name=>'SURNAME'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Surname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250255203501501518)
,p_db_column_name=>'MIDDLENAME'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Middlename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250255339193501519)
,p_db_column_name=>'SEX'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Sex'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(185798964008064825)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250255487410501520)
,p_db_column_name=>'FORM_NO'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'TM6 No.'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250255551067501521)
,p_db_column_name=>'PROVINCE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Province'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250255625025501522)
,p_db_column_name=>'DISTRICT'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'District'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250255756311501523)
,p_db_column_name=>'SUBDISTRICT'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Subdistrict'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250255876175501524)
,p_db_column_name=>'ADDRESS'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Address'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250255994516501525)
,p_db_column_name=>'NOTE'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Note'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250256074553501526)
,p_db_column_name=>'DATE_OF_ENTRY'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Date of entry'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250256173084501527)
,p_db_column_name=>'INS_BORDERPOST'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Borderpost'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(182747869576861229)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250256225241501528)
,p_db_column_name=>'INS_TERMINAL'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Terminal'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_api.id(144221173136607154)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250256383106501529)
,p_db_column_name=>'ICON'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'View/Edit'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(250256419749501530)
,p_db_column_name=>'EDITABLE'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Editable'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(250284180156502673)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2107861'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'ICON:EXITFLG:PERSON_TYPE:TRNSPRTUNITID:INS_BORDERPOST:INS_TERMINAL:INS_BY:DOCTYPE:DOCNO:MOVEMENT_DT:DATE_OF_ENTRY:NAT:EXPIRYDATE:GIVENNAME:SURNAME:CALC_DOB:SEX:FORM_NO:SOURCE_SYSTEM:'
,p_sort_column_1=>'MOVEMENT_DT'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(45317852706898945)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(95457608570695427)
,p_button_name=>'SUBMIT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95457736571695428)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(95457608570695427)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'Reset'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:4000:&SESSION.::&DEBUG.:RP,4000::'
,p_icon_css_classes=>'fa-undo'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(95457995905695430)
,p_branch_name=>'Self - 4000'
,p_branch_action=>'f?p=&APP_ID.:4000:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45317325693898940)
,p_name=>'P4000_BORDERPOST'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(95457608570695427)
,p_item_default=>'v(''AI_BORDERPOST_ID'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Borderpost:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'BORDERPOST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(NAME,NAME$DLC) d,',
'   key_value r',
'FROM',
'    DL_BORDERCONTROL.BORDERPOSTS$LC',
'    where IS_ACTIVE = ''Y''',
'    order by NAME',
'    ;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45317402395898941)
,p_name=>'P4000_TERMINAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(95457608570695427)
,p_item_default=>'v(''AI_TERMINAL_ID'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Terminal:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(name, name$dlc) d, id r',
'FROM dl_bordercontrol.terminals$lc',
'WHERE active = 1 ',
'AND border_post = NVL(:P4000_BORDERPOST, border_post)',
'ORDER BY name;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P4000_BORDERPOST'
,p_ajax_optimize_refresh=>'N'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45317545092898942)
,p_name=>'P4000_OFFICER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(95457608570695427)
,p_prompt=>'Officer:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>8
,p_grid_label_column_span=>1
,p_display_when=>'P4000_IS_USER_SUPERVISOR'
,p_display_when2=>'1'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45317680907898943)
,p_name=>'P4000_FROM'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(95457608570695427)
,p_item_default=>'TO_CHAR(TRUNC(SYSDATE - 1, ''MI''), ''DD/MM/YYYY HH24:MI:SS'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Duration From:'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_colspan=>3
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45317732630898944)
,p_name=>'P4000_TO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(95457608570695427)
,p_item_default=>'TO_CHAR(TRUNC(SYSDATE, ''MI''), ''DD/MM/YYYY HH24:MI:SS'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Duration To:'
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45318761197898954)
,p_name=>'P4000_IS_USER_SUPERVISOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(45318686573898953)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(:APP_USER,''MD_EM_SUP'')',
'from dual;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45318839255898955)
,p_name=>'P4000_IS_USER_OFFICER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(45318686573898953)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select DL_USER_MANAGEMENT.PKG_AUTHORIZATION.HAS_USER_PERMISSION_(:APP_USER,''MD_EM_OFF'') as a',
'from dual;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95458015028695431)
,p_name=>'Submit Report'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(45317852706898945)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95458155913695432)
,p_event_id=>wwv_flow_api.id(95458015028695431)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($("#P4000_BORDERPOST").val() == "" && $("#P4000_TERMINAL").val() == "" && $("#P4000_OFFICER").val() == "" && ($("#P4000_FROM").val() == "" || $("#P4000_TO").val() == "")) {',
'    $("#id-region-info").show();',
'    $("#id-region-report").hide();',
'    return false;',
'}',
'else {',
'    $("#id-region-info").hide();',
'    $("#id-region-report").show();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95458244600695433)
,p_event_id=>wwv_flow_api.id(95458015028695431)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(241865778987653127)
,p_stop_execution_on_error=>'Y'
);
end;
/
