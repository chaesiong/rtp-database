prompt --application/pages/page_01400
begin
wwv_flow_api.create_page(
 p_id=>1400
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Duplicate Passport'
,p_page_mode=>'MODAL'
,p_step_title=>'Duplicate Passport'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_IMAGES#ir-image-popup.js'
,p_css_file_urls=>'#APP_IMAGES#ir-image-layout.css'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_dialog_width=>'1200'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180730111308'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(170546946976907593)
,p_plug_name=>'Passports'
,p_region_name=>'IR_DUPLICATE_PASSPORT'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>42
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with dups as (',
'  select dup.refid duplicateid, bd.refid brddocid from',
'    (select duplicateid refid, documentno docno, issuingcountry issuectry, expirydate from x_duplicate_passport) dup,',
'    (select brddocid refid, docno, issuectry, to_char(expirydate, ''YYMMDD'') expirydate from borderdocuments) bd',
'  where',
'    bd.refid = pkg_borderdocuments.get_document(:P1400_DOCNO, :P1400_ISSUECTRY, to_date(:P1400_EXPIRYDATE, ''RRMMDD''))',
'    and dup.docno = bd.docno',
'    and dup.issuectry = bd.issuectry',
'    and dup.expirydate = bd.expirydate',
')',
'select',
'  docno',
'  , issuectry',
'  , expirydate',
'  , firstname',
'  , middlename',
'  , lastname',
'  , dob',
'  , img_url_passport',
'  , img_url_scanphoto',
'  , img_url_chipphoto',
'  , img_url_livephoto',
'from (',
'  select',
'    docno',
'    , issuectry',
'    , expirydate',
'    , regexp_replace(trim(givenname), ''[ ]+.*'', '''') firstname',
'    , trim(regexp_replace(trim(givenname), ''^[^ ]+'', '''')) middlename',
'    , surname lastname',
'    , pkg_common.parse_date(dob, 1, 0, 0, 1) dob',
'    , ''/ords/dl_bordercontrol/x_uat/get_image/1/'' || dups.brddocid || ''/2'' img_url_passport',
'    , ''/ords/dl_bordercontrol/x_uat/get_image/1/'' || dups.brddocid || ''/0'' img_url_scanphoto',
'    , ''/ords/dl_bordercontrol/x_uat/get_image/1/'' || dups.brddocid || ''/1'' img_url_chipphoto',
'    , ''/ords/dl_bordercontrol/x_uat/get_image/1/'' || dups.brddocid || ''/3'' img_url_livephoto',
'  from',
'    borderdocuments bd',
'    , dups',
'  where',
'    bd.brddocid = dups.brddocid and rownum < 2',
'  union all',
'  select',
'    documentno',
'    , issuingcountry',
'    , to_date(expirydate, ''RRMMDD'')',
'    , firstname',
'    , middlename',
'    , lastname',
'    , pkg_common.parse_date(dateofbirth, 1, 0, 0, 1)',
'    , ''/ords/dl_bordercontrol/x_uat/get_image/2/'' || dups.duplicateid || ''/2'' --img_passport',
'    , ''/ords/dl_bordercontrol/x_uat/get_image/2/'' || dups.duplicateid || ''/0'' --img_scanphoto',
'    , ''/ords/dl_bordercontrol/x_uat/get_image/2/'' || dups.duplicateid || ''/1'' --img_chipphoto',
'    , ''/ords/dl_bordercontrol/x_uat/get_image/2/'' || dups.duplicateid || ''/3'' --img_chipphoto',
'  from',
'    x_duplicate_passport x',
'    , dups',
'  where',
'    x.duplicateid = dups.duplicateid',
')',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
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
 p_id=>wwv_flow_api.id(170547050218907594)
,p_max_row_count=>'500'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="" />'
,p_icon_view_columns_per_row=>1
,p_owner=>'MSTEPHAN'
,p_internal_uid=>94022430098320902
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170549040542907614)
,p_db_column_name=>'IMG_URL_PASSPORT'
,p_display_order=>10
,p_column_identifier=>'K'
,p_column_label=>'Passport'
,p_column_html_expression=>'<img class="ir-thumbnail-image" src="#IMG_URL_PASSPORT#">'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170549204948907615)
,p_db_column_name=>'IMG_URL_SCANPHOTO'
,p_display_order=>20
,p_column_identifier=>'L'
,p_column_label=>'Scanned Photo'
,p_column_html_expression=>'<img class="ir-thumbnail-image" src="#IMG_URL_SCANPHOTO#">'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170549223145907616)
,p_db_column_name=>'IMG_URL_CHIPPHOTO'
,p_display_order=>30
,p_column_identifier=>'M'
,p_column_label=>'Chip Photo'
,p_column_html_expression=>'<img class="ir-thumbnail-image" src="#IMG_URL_CHIPPHOTO#">'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170549333563907617)
,p_db_column_name=>'IMG_URL_LIVEPHOTO'
,p_display_order=>40
,p_column_identifier=>'N'
,p_column_label=>'Live Photo'
,p_column_html_expression=>'<img class="ir-thumbnail-image" src="#IMG_URL_LIVEPHOTO#">'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170547130355907595)
,p_db_column_name=>'DOCNO'
,p_display_order=>50
,p_column_identifier=>'A'
,p_column_label=>'Docno'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170547239120907596)
,p_db_column_name=>'ISSUECTRY'
,p_display_order=>60
,p_column_identifier=>'B'
,p_column_label=>'Issuectry'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170547320150907597)
,p_db_column_name=>'EXPIRYDATE'
,p_display_order=>70
,p_column_identifier=>'C'
,p_column_label=>'Expirydate'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170547464673907598)
,p_db_column_name=>'FIRSTNAME'
,p_display_order=>80
,p_column_identifier=>'D'
,p_column_label=>'Firstname'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170547555551907599)
,p_db_column_name=>'MIDDLENAME'
,p_display_order=>90
,p_column_identifier=>'E'
,p_column_label=>'Middlename'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170547620584907600)
,p_db_column_name=>'LASTNAME'
,p_display_order=>100
,p_column_identifier=>'F'
,p_column_label=>'Lastname'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(170547743453907601)
,p_db_column_name=>'DOB'
,p_display_order=>110
,p_column_identifier=>'G'
,p_column_label=>'Dob'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(170561279607930456)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'940367'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'DOCNO:ISSUECTRY:EXPIRYDATE:FIRSTNAME:MIDDLENAME:LASTNAME:DOB:IMG_URL_PASSPORT:IMG_URL_SCANPHOTO:IMG_URL_CHIPPHOTO:IMG_URL_LIVEPHOTO'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(170548163473907605)
,p_plug_name=>'Passport Values'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_region_attributes=>'style="display:none"'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>32
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(170548700645907610)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(170548163473907605)
,p_button_name=>'P1400_REFRESH_LIST'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Refresh List'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170548409921907607)
,p_name=>'P1400_DOCNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(170548163473907605)
,p_prompt=>'Docno'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170548438582907608)
,p_name=>'P1400_ISSUECTRY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(170548163473907605)
,p_prompt=>'Issuing Country'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170548607314907609)
,p_name=>'P1400_EXPIRYDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(170548163473907605)
,p_prompt=>'Expiry Date'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(170548722510907611)
,p_name=>'Refresh List'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(170548700645907610)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170548985794907613)
,p_event_id=>wwv_flow_api.id(170548722510907611)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P1400_DOCNO,P1400_ISSUECTRY,P1400_EXPIRYDATE'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170548852185907612)
,p_event_id=>wwv_flow_api.id(170548722510907611)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(170546946976907593)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(170549479521907618)
,p_name=>'Page Load: Get Live Photo'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170549539286907619)
,p_event_id=>wwv_flow_api.id(170549479521907618)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (!!parent.getLivePhoto) {',
'    $("#IR_DUPLICATE_PASSPORT .a-IRR-table tr:nth-child(2) td:nth-child(4) img").attr("src", parent.getLivePhoto());',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
end;
/
