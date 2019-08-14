prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Global Page - Desktop'
,p_page_mode=>'NORMAL'
,p_step_title=>'Global Page - Desktop'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'Y'
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_protection_level=>'D'
,p_cache_mode=>'NOCACHE'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190719022240'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(143925131698387919)
,p_plug_name=>'REG_NAV_LOGO'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    crlf varchar2(100) := chr(13) || chr(10);',
'    v_session varchar2(100) := v(''APP_SESSION'');',
'begin',
'    htp.p(crlf || ''<script>'' || crlf);',
'    htp.p(''    (function() {'' || crlf);',
'    htp.p(''        let parentElem = document.querySelector(".t-Header-logo-link").parentElement;'' || crlf);',
'    htp.p(''        let content = parentElem.innerHTML;'' || crlf);',
'    htp.p(''        let logo = ''''<span class="customLogoIcon"><i class="fa fa-home"></i></span>'''';'' || crlf);',
'    htp.p(''        let dashboardLink = ''''<a href="f?p=1100:1:'' || v_session || ''" class="t-Header-logo-link"><span>'''' + logo + ''''</span></a>'''';'' || crlf);',
'    htp.p(''        content = dashboardLink + content;'' || crlf);',
'    htp.p(''        parentElem.innerHTML = content;'' || crlf);',
'    htp.p(''    }());'' || crlf);',
'    htp.p(''</script>'' || crlf);',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(159276522485564125)
,p_plug_name=>'REG_DATABASE_PARAMETERS'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_delim varchar2(1) := substr(''\\'', 1, 1);',
'    v_prefix varchar2(100) := ''BMBS'' || v_delim || :APP_PAGE_ID || v_delim;',
'begin',
'    htp.p(''<script>'');',
'    htp.p(''v_translation = {'');',
'    for c_row in (select rownum rn, message_key, nvl(message_value, message_value$dlc) translation from dl_common.messages$lc where message_key like v_prefix || ''%'') loop',
'        if c_row.rn > 1 then',
'            htp.prn('','');',
'        end if;',
'        htp.p(''"'' || substr(replace(c_row.message_key, v_delim, ''/''), length(v_prefix) + 1) || ''": "'' || replace(replace(replace(replace(c_row.translation, v_delim, ''\\''), ''"'', ''\"''), chr(13), ''\r''), chr(10), ''\n'') || ''"'');',
'    end loop;',
'    htp.p(''};'');',
'    ',
'    for c_row in (select',
'      ''DATABASE_PARAMETER_'' || name || '' = '' || decode(minvalue, null, ''"'', '''') || value || decode(minvalue, null, ''"'', '''') || '';'' src',
'    from (',
'      select name, replace(replace(replace(replace(value, ''\'', ''\\''), ''"'', ''\"''), chr(13), ''\r''), chr(10), ''\n'') value, minvalue from parameters',
'    )) loop',
'        htp.p(c_row.src);',
'    end loop;',
'    /*htp.p(''document.body.addEventListener("load", function() { $(".VERSIONINFO").text("Version _" + DATABASE_PARAMETER_APP_VERSION_BMBS)});'');*/',
'    htp.p(''</script>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(165603777970467932)
,p_plug_name=>'Session Timeout Information'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display:none"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<script>',
'    if (window.location.href.indexOf(''\u0026p_dialog_cs'') > 0) {',
'        // current page is opened as dialog window',
'        ',
'    } else {',
'        let currentPage = &APP_PAGE_ID.; //document.location.search.split(":")[1];',
'        if (currentPage != 17) {',
'            let badge = document.querySelector(''[href^="f?p=500:5900:"] .t-Button-badge'');',
'            if (!!badge) badge.style.display = ''none'';',
'        }',
'        //console.log("Theme path: ", "#THEME_DB_IMAGES#");',
'        let remainingSeconds = &AI_SESSION_TIMEOUT_SECONDS.;',
'        let timeoutDate = new Date((new Date()).getTime() + remainingSeconds * 1000);',
'',
'        document.getElementsByTagName("head")[0].innerHTML += ''<link rel="stylesheet" href="#APP_IMAGES#timeout-display.css" type="text/css">'';',
'',
'        let target = null;',
'',
'        let formatTime = function(seconds) {',
'            let s = seconds % 60;',
'            seconds = Math.floor(seconds / 60);',
'            let m = seconds % 60;',
'            seconds = Math.floor(seconds / 60);',
'            let h = seconds;',
'',
'            return h + ":" + ("0" + m).substr(-2) + ":" + ("0" + s).substr(-2);',
'        };',
'',
'        console.log("Session will time out in " + remainingSeconds + " second(s) at " + timeoutDate);',
'        let timer = setInterval(() => {',
'            let secondsRemaining = Math.floor(((+timeoutDate) - (+new Date())) / 1000);',
'            if (secondsRemaining < 0) {',
'                clearInterval(timer);',
'                //alert("Your session has expired!");',
'                window.location = "&LOGOUT_URL.";',
'                //window.location = "./f?p=&APP_ID.:0:0";',
'                //window.location = "./f?p=99999:LOGIN_DESKTOP:0::NO:RP,111:P111_REFERING_APP:&APP_ID.";',
'            } else {',
'                if (!!(window.jQuery)) {',
'                    if (!target) {',
'                        target = parent.$(".timeout-display");',
'                        if (target.length < 1) {',
'                            target = $("<div>");',
'                            target.addClass("timeout-display");',
'                            $("body").append(target);',
'                        }',
'                    }',
'                    //$(".VERSIONINFO").text(formatTime(secondsRemaining));',
'                    target.text(formatTime(secondsRemaining));',
'                }',
'            }',
'        }, 1050);',
'    }',
'',
'    var BmBSLogout = function() {',
'        function logout() {',
'            window.location = "&LOGOUT_URL.";',
'        }',
'        let msg = "Are you sure you want to logout ?";',
'        let yestext = "Yes, logout";',
'        let notext = "No, cancel";',
'        let titletext = "Confirmation: Logout";',
'        let msg_th = "คุณต้องการออกจากระบบ ใช่หรือไม่?";',
'        let yestext_th = "ใช่, logout";',
'        let notext_th = "ไม่ใช่, cancel";',
'        let titletext_th = "Confirmation: Logout";',
'        if (document.documentElement.lang && document.documentElement.lang.substr(0, 2).toLowerCase() == "th") {',
'            msg = msg_th;',
'            yestext = yestext_th;',
'            notext = notext_th;',
'            titletext = titletext_th;',
'        }',
'        let confirmYesNoOptions = ',
'        {',
'            "yes" : function() {logout();},',
'            "yestext" : yestext,',
'            "notext" : notext,',
'            "titletext" : titletext,',
'            "textclass" : "cl-diag-big-font"',
'        };',
'        if (typeof confirmYesNo !== "undefined" && confirmYesNo !== null) {',
'            confirmYesNo(msg, confirmYesNoOptions);',
'        } else {',
'            apex.message.confirm(msg, function(ok) {if(ok) { logout(); }});',
'        }',
'    };',
'</script>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(186861687572161699)
,p_plug_name=>'Set_Session_Timeout'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*APEX_UTIL.SET_SESSION_MAX_IDLE_SECONDS(p_seconds => 18000);',
'APEX_UTIL.SET_SESSION_LIFETIME_SECONDS(p_seconds => 18001);*/',
'',
'select trunc(cast((least(session_idle_timeout_on, session_life_timeout_on) - sysdate) * 86400 as number)) remaining_seconds',
'  into :AI_SESSION_TIMEOUT_SECONDS',
'  from apex_workspace_sessions s',
' where apex_session_id = :APP_SESSION;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(927524589000021406)
,p_plug_name=>'SearchParameters'
,p_region_name=>'region_global_right_side'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--hiddenOverflow:t-Form--large:t-Form--stretchInputs:t-Form--labelsAbove'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'CURRENT_PAGE_IN_CONDITION'
,p_plug_display_when_condition=>'5500,5501,5502,5503,5504,5505,5506,5507,5508,5509,5510'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(942125218329235865)
,p_plug_name=>'REG_PERMISSIONS'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display: none;"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(927896569955396680)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(927524589000021406)
,p_button_name=>'APPLYFILTERS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'Search'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(942122815148978889)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(927524589000021406)
,p_button_name=>'FLOW_RESET_BUTTON'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_image_alt=>'Clear Filters'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-recycle'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128280585185666519)
,p_name=>'P0_MODULE_NAME_LOOKUP'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(942125218329235865)
,p_use_cache_before_default=>'NO'
,p_source=>'BMBS'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(235418855453735552)
,p_name=>'P0_BROWSER_LANGUAGE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(942125218329235865)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(927525221663029436)
,p_name=>'P0_DATEFILTERFROM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(927524589000021406)
,p_prompt=>'From:'
,p_placeholder=>'DD/MM/YYYY'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>10
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-20:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(927525536593032535)
,p_name=>'P0_DATEFILTERTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(927524589000021406)
,p_prompt=>'To:'
,p_placeholder=>'DD/MM/YYYY'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>10
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-20:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(927525838541035955)
,p_name=>'P0_PASSPORTNUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(927524589000021406)
,p_prompt=>'Passport:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(927526136002038021)
,p_name=>'P0_FLIGHTNUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(927524589000021406)
,p_prompt=>'Flight Number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(927533522380045683)
,p_name=>'P0_SERVER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(927524589000021406)
,p_item_default=>'&AI_BORDERPOST_NAME.'
,p_prompt=>'Border Post:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SERVERS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select distinct upper(name) d, key_value',
' from dl_bordercontrol.borderposts b',
' join dl_bordercontrol.MOVEMENTS m',
' on b.key_value = m.INS_BORDERPOST;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'(ALL POSTS)'
,p_cHeight=>1
,p_read_only_when=>'P0_P_1019_SEE_STAT_ALLPOSTS'
,p_read_only_when2=>'1'
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(942148373140292477)
,p_name=>'P0_P_1018_SEE_STAT_CURPOST'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(942125218329235865)
,p_use_cache_before_default=>'NO'
,p_source=>'AI_P_1018_see_stat_curpost'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(942156710825351040)
,p_name=>'P0_P_1020_SEE_REP_CURPOST'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(942125218329235865)
,p_use_cache_before_default=>'NO'
,p_source=>'AI_P_1020_see_rep_curpost'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(942157007635365228)
,p_name=>'P0_P_1021_SEE_REP_ALLPOSTS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(942125218329235865)
,p_use_cache_before_default=>'NO'
,p_source=>'AI_P_1021_see_rep_allposts'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(953259946803209406)
,p_name=>'P0_HELP_TEXT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(942125218329235865)
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(954991650378052021)
,p_name=>'P0_P_1019_SEE_STAT_ALLPOSTS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(942125218329235865)
,p_use_cache_before_default=>'NO'
,p_source=>'AI_P_1019_see_stat_allposts'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_cMaxlength=>4000
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(943702043223630083)
,p_name=>'DA_ShowVersionNumber'
,p_event_sequence=>1
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(943702378853630088)
,p_event_id=>wwv_flow_api.id(943702043223630083)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(".VERSIONINFO").append(''<span>#APP_VERSION#</span>'').parent().parent().css("float", "left").css("z-index", "100");',
'$(".nav_bar_hardware_status").parent().parent().css("float", "left");',
'let doHide = false;',
'if (!(typeof disableHardwareStatusIcons == "undefined")) {',
'    if (!!disableHardwareStatusIcons) {',
'        doHide = true;',
'    }',
'}',
'doHide |= ("&APP_PAGE_ID." != "17");',
'',
'if (doHide) {',
'    $(".nav_bar_hardware_status").parent().parent().hide();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(951577557329465199)
,p_name=>'DA_ProvideHelp'
,p_event_sequence=>997
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(953260169324220994)
,p_event_id=>wwv_flow_api.id(951577557329465199)
,p_event_result=>'TRUE'
,p_action_sequence=>9
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P0_HELP_TEXT := PKG_COMMON.Get_Parameter(''HELP_TEXT'');',
''))
,p_attribute_03=>'P0_HELP_TEXT'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(951577921394465202)
,p_event_id=>wwv_flow_api.id(951577557329465199)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.showHelp = function() {',
'  /*var text = "";',
'  text += "Please contact your supervisor or administrator for help first.\r\n";',
'  text += "\r\n";',
'  text += "In case of emergency contact\r\n";',
'  text += "Pol. Lt. Col. Nou Saroeun\r\n";',
'  text += "+855 92 277 722";*/',
'  var text = $v(''P0_HELP_TEXT'').replace(/\\n/g, ''\n'');',
'  alert(text);',
'};'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(951568025895304086)
,p_name=>'DA_MakeCssButtons'
,p_event_sequence=>998
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(951568449825304097)
,p_event_id=>wwv_flow_api.id(951568025895304086)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(".makecssbutton").parent().addClass("CSSBUTTON");',
'$(".t-NavigationBar-item").each(function(idx, elem) {',
' var needchange = $(elem).find(".makecssbutton").length == 0;',
' if (needchange) {',
'  var h = $(elem).html();',
'  h = h.replace("<a ", "<span ").replace("</a", "</span");',
'  $(elem).html(h);',
' }',
'});',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(577300650985702434)
,p_name=>'DA_ShiftRegionIntoRightSide'
,p_event_sequence=>999
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(577301003881702451)
,p_event_id=>wwv_flow_api.id(577300650985702434)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#region_global_right_side").appendTo($("#div_right_side"));'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(932870084821834855)
,p_name=>'DA_Arrival_Color_Theme'
,p_event_sequence=>1019
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(932870481834834858)
,p_event_id=>wwv_flow_api.id(932870084821834855)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (''&AI_DEFAULT_DIRECTION.'' == ''1'' && ''&APP_PAGE_ID.'' == ''17'' ) {',
'  $(".t-Header-logo").css("background-color", "#65090a !important");',
'  $(".t-Header-navBar").css("background-color", "#65090a !important");',
'  $(".t-Body-main").css("background", "linear-gradient(to bottom, #65090a, #24182d 100%)");',
'  $(".t-Header-branding").css("max-height", "40px");',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(942243680743938528)
,p_name=>'DA_TriggerResize'
,p_event_sequence=>1029
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(942244127015938530)
,p_event_id=>wwv_flow_api.id(942243680743938528)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var cnt = 10;',
'function resize() {',
'  $(window).trigger(''resize'');',
'  if (cnt-- > 0) {',
'    //console.log("RESIZE: Remaining = " + cnt);',
'    window.setTimeout(resize, 100);',
'  }',
'}',
'resize();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(235419420338748483)
,p_name=>'DA_SetMessages'
,p_event_sequence=>1039
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P0_BROWSER_LANGUAGE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(235419737471748488)
,p_event_id=>wwv_flow_api.id(235419420338748483)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_MESSAGES.Load_Messages_Workflow_JS;',
' select NVL(message_value, message_value$dlc)',
'  into :P1017_WORKFLOW_JS_3',
'  from DL_COMMON.Messages$LC',
'  where MESSAGE_KEY = ''BMBS\17\Workflow_js\3'';'))
,p_attribute_02=>'P1017_WORKFLOW_JS_3'
,p_attribute_03=>'P1017_WORKFLOW_JS_3'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
