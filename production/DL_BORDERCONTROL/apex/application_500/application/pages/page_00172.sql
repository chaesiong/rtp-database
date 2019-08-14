prompt --application/pages/page_00172
begin
wwv_flow_api.create_page(
 p_id=>172
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Movement Details'
,p_page_mode=>'NORMAL'
,p_step_title=>'Movement Details'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_file_urls=>'#APP_IMAGES#MovementDetails.js'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'showDetails();',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_cache_timeout_seconds=>21600
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20171110162132'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(960820093732040562)
,p_plug_name=>'Main'
,p_region_name=>'REG_MAIN'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(960821041560060005)
,p_plug_name=>'REG_HIDDEN'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display: none"'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960820546763047466)
,p_name=>'P172_MVMNTID'
,p_item_sequence=>1
,p_item_plug_id=>wwv_flow_api.id(960821041560060005)
,p_use_cache_before_default=>'NO'
,p_item_default=>'50A9BAF7869D2702E053291E780A3C7F'
,p_source=>'50A9BAF7869D2702E053291E780A3C7F'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960829574323083686)
,p_name=>'P172_VISA_PAGE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(960820093732040562)
,p_use_cache_before_default=>'NO'
,p_source=>'PASS_VISUAL_FACE'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_VISA_PAGE'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960830415434096019)
,p_name=>'P172_PASSPORT_WHITE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(960820093732040562)
,p_use_cache_before_default=>'NO'
,p_source=>'PASS_VISUALPAGE'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_PASS_VISUALPAGE'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960833594332176896)
,p_name=>'P172_MANUALEXPIRYDATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(960820093732040562)
,p_use_cache_before_default=>'NO'
,p_placeholder=>'DD/MM/YYYY'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_MANUALEXPIRYDATE'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(960850723465829467)
,p_name=>'P172_PASS_VISUAL_FACE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(960820093732040562)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Pass Visual Face'
,p_source=>'data:image/gif;base64;AAAA'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_tag_css_classes=>'dbcol_PASS_VISUAL_FACE'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(960861074308509102)
,p_process_sequence=>10
,p_process_point=>'AFTER_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_Fetch_CLOB'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	procedure htpprnclob(pclob in clob) is',
'	  v_excel varchar2(32000);',
'	  v_clob clob := pclob;',
'	begin',
'	  while length(v_clob) > 0 loop',
'		begin',
'		  if length(v_clob) > 16000 then',
'			 v_excel:= substr(v_clob,1,16000);',
'			 htp.prn(v_excel);',
'			 v_clob:= substr(v_clob,length(v_excel)+1);',
'		  else',
'			 v_excel := v_clob;',
'			 htp.prn(v_excel);',
'			 v_clob:='''';',
'			 v_excel := '''';',
'		  end if;',
'		end;',
'	  end loop;',
'	end;',
'	procedure printCLOB(name in varchar2, value in clob) as',
'	begin',
'		htp.prn(''details.'' || name || '' = '');',
'		if value is null then',
'			htp.prn(''null'');',
'		else',
'			htp.prn(''"'');',
'			htpprnclob(value);',
'			htp.prn(''"'');',
'		end if;',
'		htp.p('';'');',
'	end;',
'	procedure printNumber(name in varchar2, value in number) as',
'	begin',
'		htp.prn(''details.'' || name || '' = '');',
'		if value is null then',
'			htp.prn(''null'');',
'		else',
'			htp.prn(to_char(value));',
'		end if;',
'		htp.p('';'');',
'	end;',
'	procedure printDate(name in varchar2, value in date) as',
'	begin',
'		htp.prn(''details.'' || name || '' = '');',
'		if value is null then',
'			htp.prn(''null'');',
'		else',
'			htp.prn(''"'' || to_char(value, ''YYYY-MM-DD HH24:MI:SS'') || ''"'');',
'		end if;',
'		htp.p('';'');',
'	end;',
'begin',
'	',
'	htp.p(''<script>'');',
'	htp.p(''var details = {};'');',
'',
'	for row in (select * from v_m_d_base64 where mvmntid = :P172_MVMNTID) loop',
'		printCLOB(''MANUALEXPIRYDATE'', row.MANUALEXPIRYDATE);',
'		printCLOB(''MVMNTID'', row.MVMNTID);',
'		printCLOB(''BRDDOCID'', row.BRDDOCID);',
'		printCLOB(''MVMNTADDR'', row.MVMNTADDR);',
'		printCLOB(''ORIDEST'', row.ORIDEST);',
'		printCLOB(''CREATED_BY'', row.CREATED_BY);',
'		printCLOB(''WORKSTATION_NAME'', row.WORKSTATION_NAME);',
'		printCLOB(''SERVER_ID'', row.SERVER_ID);',
'		printCLOB(''OBSERVATION'', row.OBSERVATION);',
'		printCLOB(''TRNSPRTUNITID'', utl_raw.cast_to_varchar2(row.TRNSPRTUNITID));',
'		printCLOB(''SCANNED_FLIGHT'', row.SCANNED_FLIGHT);',
'		printCLOB(''MVMNT_ID'', row.MVMNT_ID);',
'		printCLOB(''WSQ_RT'', row.WSQ_RT);',
'		printCLOB(''WSQ_RI'', row.WSQ_RI);',
'		printCLOB(''WSQ_RM'', row.WSQ_RM);',
'		printCLOB(''WSQ_RR'', row.WSQ_RR);',
'		printCLOB(''WSQ_RL'', row.WSQ_RL);',
'		printCLOB(''WSQ_LT'', row.WSQ_LT);',
'		printCLOB(''WSQ_LI'', row.WSQ_LI);',
'		printCLOB(''WSQ_LM'', row.WSQ_LM);',
'		printCLOB(''WSQ_LR'', row.WSQ_LR);',
'		printCLOB(''WSQ_LL'', row.WSQ_LL);',
'		printCLOB(''VISA_PAGE'', row.VISA_PAGE);',
'		printCLOB(''LANDINGCARD_PAGE'', row.LANDINGCARD_PAGE);',
'		printCLOB(''LIVE_PHOTO'', row.LIVE_PHOTO);',
'		printCLOB(''VISUM_INFO'', row.VISUM_INFO);',
'		printCLOB(''LC_INFO'', row.LC_INFO);',
'		printCLOB(''GRANTED_BY_SUPERVISOR'', row.GRANTED_BY_SUPERVISOR);',
'		printCLOB(''SUPERVISOR_REASON'', row.SUPERVISOR_REASON);',
'		printCLOB(''PS_5'', row.PS_5);',
'		printCLOB(''PSBLOB_1'', row.PSBLOB_1);',
'		printCLOB(''PSBLOB_2'', row.PSBLOB_2);',
'		printCLOB(''PSBLOB_3'', row.PSBLOB_3);',
'		printCLOB(''PSBLOB_4'', row.PSBLOB_4);',
'		printCLOB(''PSBLOB_5'', row.PSBLOB_5);',
'		printCLOB(''PSBLOB_6'', row.PSBLOB_6);',
'		printCLOB(''PSBLOB_7'', row.PSBLOB_7);',
'		printCLOB(''PSBLOB_8'', row.PSBLOB_8);',
'		printCLOB(''PSBLOB_9'', row.PSBLOB_9);',
'		printCLOB(''PSBLOB_10'', row.PSBLOB_10);',
'		printCLOB(''DOCNO'', row.DOCNO);',
'		printCLOB(''PASS_VISUAL_FACE'', row.PASS_VISUAL_FACE);',
'		printCLOB(''PASS_ICAO_FACE'', row.PASS_ICAO_FACE);',
'		printCLOB(''PASS_VISUALPAGE'', row.PASS_VISUALPAGE);',
'		printCLOB(''GIVENNAME'', row.GIVENNAME);',
'		printCLOB(''SURNAME'', row.SURNAME);',
'		printCLOB(''SEX'', row.SEX);',
'		printCLOB(''GENDER'', row.GENDER);',
'		printCLOB(''EXPIRYDATE'', row.EXPIRYDATE);',
'		printCLOB(''DOB'', row.DOB);',
'		printCLOB(''DOCTYPE'', row.DOCTYPE);',
'		printCLOB(''ISSUECTRY'', row.ISSUECTRY);',
'		printCLOB(''DATEOFISSUE'', row.DATEOFISSUE);',
'		printCLOB(''NATIONALITY'', row.NATIONALITY);',
'		printCLOB(''PLACEOFBIRTH'', row.PLACEOFBIRTH);',
'		printCLOB(''VISUM_NUMBER'', row.VISUM_NUMBER);',
'		printCLOB(''VISUM_LOCATION'', row.VISUM_LOCATION);',
'		printCLOB(''VISUM_DURATION'', row.VISUM_DURATION);',
'		printCLOB(''VISUM_START'', row.VISUM_START);',
'		printCLOB(''VISUM_END'', row.VISUM_END);',
'		printCLOB(''LC_LENGTH'', row.LC_LENGTH);',
'		printCLOB(''LC_ADDRESS'', row.LC_ADDRESS);',
'		/*printCLOB('''', row.);',
'		printCLOB('''', row.);',
'		printCLOB('''', row.);',
'		printCLOB('''', row.);',
'		printCLOB('''', row.);*/',
'		printNUMBER(''LANDBARCD'', row.LANDBARCD);',
'		printNUMBER(''EXITFLG'', row.EXITFLG);',
'		printNUMBER(''FINGERMATCH'', row.FINGERMATCH);',
'		printNUMBER(''FACEMATCH'', row.FACEMATCH);',
'		printNUMBER(''REFUSEDFLG'', row.REFUSEDFLG);',
'		printNUMBER(''PSSNGRSTATUS'', row.PSSNGRSTATUS);',
'		printNUMBER(''RNKDSGNTDID'', row.RNKDSGNTDID);',
'		printNUMBER(''VISA'', row.VISA);',
'		printNUMBER(''PS_6'', row.PS_6);',
'		printNUMBER(''PS_7'', row.PS_7);',
'		printNUMBER(''PS_8'', row.PS_8);',
'		printNUMBER(''PS_9'', row.PS_9);',
'		printNUMBER(''PS_10'', row.PS_10);',
'		/*printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);',
'		printNUMBER('''', row.);*/',
'		printCLOB(''REASON_OFFLOAD'', row.REASON_OFFLOAD);',
'		printCLOB(''REASON_DEPORTEE'', row.REASON_DEPORTEE);',
'		printDATE(''VISAEXPDT'', row.VISAEXPDT);',
'		printDATE(''CREATED'', row.CREATED);',
'		/*printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);',
'		printDATE('''', row.);*/',
'	end loop;',
'	htp.p(''window.details = details;'');',
'	',
'	htp.p(''</script>'');',
'end;'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(960834405110225625)
,p_process_sequence=>5
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_SetMvmntId'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P172_MVMNTID := ''50A9BAF7869D2702E053291E780A3C7F'';',
''))
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(960820704230053164)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'PROC_FetchMovement'
,p_attribute_02=>'V_M_D_BASE64'
,p_attribute_03=>'P172_MVMNTID'
,p_attribute_04=>'MVMNTID'
,p_process_error_message=>'Bad'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'Good &P172_MVMNTID.'
);
end;
/
