prompt --application/pages/page_00030
begin
wwv_flow_api.create_page(
 p_id=>30
,p_user_interface_id=>wwv_flow_api.id(106430524328307700)
,p_name=>'Address Report'
,p_page_mode=>'NORMAL'
,p_step_title=>'Address Report'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(106384267006307446)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20181106084408'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44645984817054204)
,p_plug_name=>'Select Extend-Stay Application'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(106393843464307504)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(221446099909524077)
,p_plug_name=>'Personal data of the applicant'
,p_parent_plug_id=>wwv_flow_api.id(44645984817054204)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(106393843464307504)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_firstname PERSON.FIRST_NAME%type;',
'    l_lastname  PERSON.LAST_NAME%type;',
'    l_birthday  PERSON.DATE_OF_BIRTH%type;',
'    ',
'    l_passport   EXTENDSTAY.PASSPORTNO%type;',
'    l_exp_date   EXTENDSTAY.PASSPORT_EXPIRY_DATE%type;',
'    l_issued_by  EXTENDSTAY.PASSPORT_ISSUED_BY%type;',
'    l_person_fk  EXTENDSTAY.PERSON_FK%type;',
'BEGIN',
'',
'    SELECT ',
'        PASSPORTNO,',
'        PASSPORT_EXPIRY_DATE,',
'        PASSPORT_ISSUED_BY,',
'        PERSON_FK',
'    INTO',
'        l_passport,',
'        l_exp_date,',
'        l_issued_by,',
'        l_person_fk',
'    FROM',
'        EXTENDSTAY',
'    WHERE',
'        APPLICATION_NUMBER = :P30_APPLICATION_NO;',
'',
'',
'    SELECT ',
'        FIRST_NAME, ',
'        LAST_NAME, ',
'        DATE_OF_BIRTH ',
'    INTO ',
'        l_firstname, ',
'        l_lastname, ',
'        l_birthday ',
'    FROM ',
'        PERSON ',
'    WHERE ',
'        KEY_VALUE = l_person_fk;',
'        ',
'        ',
'    htp.p(''Person: <b>'' || l_firstname || '' '' || l_lastname || ''</b> born on <b>'' || to_char(l_birthday) || ''</b><br/>'');',
'    htp.p(''Passport: <b>'' || l_passport || ''</b> expires on <b>'' || to_char(l_exp_date) || ''</b> issued by <b>'' || to_char(l_issued_by) || ''</b>'');',
'',
'END;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P30_APPLICATION_NO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(221444090391524057)
,p_plug_name=>'Current Date'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(106393843464307504)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'htp.p(''<span style="font-size: 37pt;">'' || to_char(sysdate) || ''</span>'');'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P30_APPLICATION_NO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(221444196832524058)
,p_plug_name=>'Latest Report Date'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(106393843464307504)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_intime boolean := false;',
'    l_success_class VARCHAR2(3400) := ''red'';',
'BEGIN',
'',
'    if :P30_LAST_ADDR_REPORT >= sysdate then',
'        l_intime := true;',
'        l_success_class := ''green'';',
'    end if;',
'',
'',
'    htp.p(''<span style="font-size: 37pt; color: ''|| l_success_class ||''">'' || :P30_LAST_ADDR_REPORT || ''</span>'');',
'',
'    if l_intime then',
'        htp.p(''<span class="fa fa-check-circle" aria-hidden="true" style="font-size: 24pt; color: ''|| l_success_class ||''"></span>'');',
'    else    ',
'        htp.p(''<span class="fa fa-warning" aria-hidden="true" style="font-size: 24pt; color: ''|| l_success_class ||''"> (''|| ceil(sysdate-to_date(:P30_LAST_ADDR_REPORT))||'' days overstay)</span>'');',
'    end if;',
'    ',
'END;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P30_APPLICATION_NO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(221444367545524060)
,p_plug_name=>'The Report of the Address was made in time!'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--success'
,p_plug_template=>wwv_flow_api.id(106385111740307452)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'The Report of the address was made in time and no fine has to be paid.'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P30_LAST_ADDR_REPORT >= sysdate'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(221444496449524061)
,p_plug_name=>'Please enter the new address'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(106393843464307504)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P30_APPLICATION_NO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(221445030216524067)
,p_plug_name=>'The Report of the Address was not made in time!'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--danger'
,p_plug_template=>wwv_flow_api.id(106385111740307452)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'The Report of the address was not made in time and a fine has to be paid.'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P30_LAST_ADDR_REPORT < sysdate'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(44646190630054206)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(44645984817054204)
,p_button_name=>'Search'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(106419823729307603)
,p_button_image_alt=>'Search'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-search'
,p_grid_column_attributes=>'style="margin-top: 8px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(221445762810524074)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(221444496449524061)
,p_button_name=>'USE_OLD_ADDRESS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(106419823729307603)
,p_button_image_alt=>'Load previous address'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-database-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(221445638245524073)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(221444496449524061)
,p_button_name=>'Save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(106419823729307603)
,p_button_image_alt=>'Save'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44646125286054205)
,p_name=>'P30_APPLICATION_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(44645984817054204)
,p_prompt=>'Application No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(221444314303524059)
,p_name=>'P30_LAST_ADDR_REPORT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(44645984817054204)
,p_use_cache_before_default=>'NO'
,p_source=>'SELECT NEXT_ADDR_REPORT FROM EXTENDSTAY WHERE APPLICATION_NUMBER = to_number(:P30_APPLICATION_NO);'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(221444604620524062)
,p_name=>'P30_ADDRESS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(221444496449524061)
,p_prompt=>'Address:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(221444664703524063)
,p_name=>'P30_STREET'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(221444496449524061)
,p_prompt=>'Street:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(221444788652524064)
,p_name=>'P30_PROVINCE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(221444496449524061)
,p_prompt=>'Province:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_PROVINCE'
,p_lov=>'SELECT display_value, return_value FROM lov_adm_class_province'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(221444839428524065)
,p_name=>'P30_AMPUR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(221444496449524061)
,p_prompt=>'Ampur:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'SELECT display_value, return_value FROM lov_adm_class_district WHERE adm_class_province = :P1_PROVINCE'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P30_PROVINCE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(221444984759524066)
,p_name=>'P30_TAMBON'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(221444496449524061)
,p_prompt=>'Tambon:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'SELECT display_value, return_value FROM lov_adm_class_subdistrict WHERE adm_class_district = :P1_AMPUR'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P30_AMPUR'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(106419210572307592)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(221445857105524075)
,p_name=>'Load previous address'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(221445762810524074)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(221446010624524076)
,p_event_id=>wwv_flow_api.id(221445857105524075)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'        PERMANENT_ADDRESS, ',
'        TA_STREET,',
'        TA_ADM_CLASS_PROVINCE, ',
'        TA_ADM_CLASS_DISTRICT, ',
'        TA_ADM_CLASS_SUBDISTRICT ',
'INTO ',
'    :P30_ADDRESS,',
'    :P30_STREET,',
'    :P30_PROVINCE,',
'    :P30_AMPUR,',
'    :P30_TAMBON ',
'FROM ',
'    PERSON',
'WHERE ',
'    KEY_VALUE = (SELECT PERSON_FK FROM EXTENDSTAY WHERE APPLICATION_NUMBER = :P30_APPLICATION_NO);'))
,p_attribute_03=>'P30_ADDRESS,P30_STREET,P30_PROVINCE,P30_AMPUR,P30_TAMBON'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
