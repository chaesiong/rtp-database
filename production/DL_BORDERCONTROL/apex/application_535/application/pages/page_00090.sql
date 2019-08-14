prompt --application/pages/page_00090
begin
wwv_flow_api.create_page(
 p_id=>90
,p_user_interface_id=>wwv_flow_api.id(15287380294705316)
,p_name=>'Nist Export'
,p_page_mode=>'MODAL'
,p_step_title=>'Nist Export'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'RSTOPP'
,p_last_upd_yyyymmddhh24miss=>'20180913182928'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3133528446378722)
,p_plug_name=>'Nist Export Details'
,p_region_css_classes=>'nist-details'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(15253766136705247)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3133851747378725)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(3133528446378722)
,p_button_name=>'Cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3133722996378724)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(3133528446378722)
,p_button_name=>'Export'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(15276552612705295)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Export'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3133605232378723)
,p_name=>'P90_TYPEOFTRANSACTION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3133528446378722)
,p_prompt=>'Type of Transaction'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'STATIC:IRQ - Image Request;IRQ,',
'IMR - Image Response;IMR,',
'CPS - Criminal Print-to-Print Search;CPS,',
'NPS - Non-Criminal Print-to-Print Search;NPS,',
'MPS - Latent-to-Print Search;MPS,',
'PMS - Print-to-Latent Search;PMS,',
'MMS - Latent-to-Latent Search;MMS,',
'DBS - Database Search;DBS,',
'SRE - Search Results;SRE,',
'USA - Add Latent to Unidentified Latents Collection;USA,',
'USR - Remove Latent from Unidentified Latents Collection;USR,',
'ATP - Add To Print Collection;ATP,',
'SUP - Substitute Print(s) Into Existing Print-Collection;SUP,',
'DFP - Delete From Print-Collection;DFP,',
'DIP - Disregard Individual Print(s) Update;DIP,',
'CPR - Criminal Subject Photo Request;CPR,',
'PHR - Photo Response;PHR,',
'APC - Add To Print Collection;APC,',
'DPC - Delete From Photo Collection;DPC,',
'CPP - Criminal Photo-to-Photo Search;CPP,',
'NPP - Non-Criminal Photo-to-Photo Search;NPP,',
'UPR - Update Request;UPR,',
'ERR - Error Message;ERR'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(15276053237705291)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
end;
/
