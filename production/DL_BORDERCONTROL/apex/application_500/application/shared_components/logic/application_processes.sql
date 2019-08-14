prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(123533230286836732)
,p_process_sequence=>1
,p_process_point=>'AFTER_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Show notification if pwd expires'
,p_process_sql_clob=>'dl_user_management.pkg_man_users.check_pwd_expired();'
,p_process_when=>'apex_util.get_preference(''PWD_EXP_NOTIFICATION'') != v(''APP_SESSION'') or apex_util.get_preference(''PWD_EXP_NOTIFICATION'') is null'
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(84279639045253008)
,p_process_sequence=>1
,p_process_point=>'AFTER_LOGIN'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Session Timeout'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_UTIL.SET_SESSION_MAX_IDLE_SECONDS(p_seconds => 1800);',
'APEX_UTIL.SET_SESSION_LIFETIME_SECONDS(p_seconds => 1801);'))
,p_process_when_type=>'NEVER'
,p_process_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'M. Langer, 31.10.2018',
'Function disabled, set in post login process'))
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(940047481311325586)
,p_process_sequence=>8
,p_process_point=>'AFTER_LOGIN'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Init_Permissions'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_count number;',
'begin',
'	:AI_P_1001_see_pg_passcheck := 0;',
'	:AI_P_1002_aut_logout_long := 0;',
'	:AI_P_1003_aut_logout_medium := 0;',
'	:AI_P_1004_aut_logout_short := 0;',
'	:AI_P_1005_mst_passcheck_4eyes := 0;',
'	:AI_P_1006_see_sav_lessmatch := 0;',
'	:AI_P_1007_see_sav_lessavail := 0;',
'	:AI_P_1008_see_sav_nofacematch := 0;',
'	:AI_P_1009_see_sav_whenred := 0;',
'	:AI_P_1010_see_sav_blacklisted := 0;',
'	:AI_P_1011_see_pg_dashboard := 0;',
'	:AI_P_1012_see_pg_travelhistory := 0;',
'	:AI_P_1013_see_set_deport := 0;',
'	:AI_P_1014_see_set_offload := 0;',
'	:AI_P_1015_see_pg_blacklist := 0;',
'	:AI_P_1016_edt_blacklist := 0;',
'	:AI_P_1017_see_pg_incidents := 0;',
'	:AI_P_1018_see_stat_curpost := 0;',
'	:AI_P_1019_see_stat_allposts := 0;',
'	:AI_P_1020_see_rep_curpost := 0;',
'	:AI_P_1021_see_rep_allposts := 0;',
'	:AI_P_1022_see_pg_agegroups := 0;',
'	:AI_P_1023_see_pg_flightroster := 0;',
'	:AI_P_1024_see_pg_officerperf := 0;',
'	:AI_P_1025_see_pg_peakhours := 0;',
'	:AI_P_1026_see_pg_monthlyview := 0;',
'	:AI_P_1027_see_pg_natvisareport := 0;',
'	:AI_P_1028_see_pg_dailymvmnts := 0;',
'	:AI_P_1030_edt_airlines := 0;',
'	:AI_P_1031_edt_flights := 0;',
'	:AI_P_1032_edt_countries := 0;',
'	:AI_P_1033_edt_ctryregs := 0;',
'	:AI_P_1034_edt_terminals := 0;',
'	:AI_P_1035_edt_doctype := 0;',
'	:AI_P_1036_edt_sysparam := 0;',
'	:AI_P_1038_see_pg_usrmgmt := 0;',
'	:AI_P_1039_see_user_create := 0;',
'	:AI_P_1040_see_user_delete := 0;',
'	:AI_P_1041_aut_lock_inactiveusr := 0;',
'	:AI_P_1042_see_setgrp_adm := 0;',
'	:AI_P_1043_see_setgrp_sup := 0;',
'	:AI_P_1044_see_setgrp_sec := 0;',
'	:AI_P_1045_see_setgrp_user := 0;',
'	:AI_P_1046_see_chk_4travelhist := 0;',
'	:AI_P_1050_see_adm_borderpost := 0;',
'	:AI_P_1051_see_pg_trvlhistchild := 0;',
'	:AI_P_1052_see_pg_trvlhistpdf := 0;',
'	:AI_P_1053_see_pg_personreppdf := 0;',
'	:AI_P_1054_EDT_PG_TRANSPORTS := 0;',
'/*',
'	for rec in (SELECT * FROM TABLE(DL_LDAP.LDAP_GET_USER_PERMISSIONS(''admin'', ''dermalog!'', :APP_USER))) loop',
'		IF rec.permissionid = 1001 THEN :AI_P_1001_see_pg_passcheck := 1; END IF;',
'		IF rec.permissionid = 1002 THEN :AI_P_1002_aut_logout_long := 1; END IF;',
'		IF rec.permissionid = 1003 THEN :AI_P_1003_aut_logout_medium := 1; END IF;',
'		IF rec.permissionid = 1004 THEN :AI_P_1004_aut_logout_short := 1; END IF;',
'		IF rec.permissionid = 1005 THEN :AI_P_1005_mst_passcheck_4eyes := 1; END IF;',
'		IF rec.permissionid = 1006 THEN :AI_P_1006_see_sav_lessmatch := 1; END IF;',
'		IF rec.permissionid = 1007 THEN :AI_P_1007_see_sav_lessavail := 1; END IF;',
'		IF rec.permissionid = 1008 THEN :AI_P_1008_see_sav_nofacematch := 1; END IF;',
'		IF rec.permissionid = 1009 THEN :AI_P_1009_see_sav_whenred := 1; END IF;',
'		IF rec.permissionid = 1010 THEN :AI_P_1010_see_sav_blacklisted := 1; END IF;',
'		IF rec.permissionid = 1011 THEN :AI_P_1011_see_pg_dashboard := 1; END IF;',
'		IF rec.permissionid = 1012 THEN :AI_P_1012_see_pg_travelhistory := 1; END IF;',
'		IF rec.permissionid = 1013 THEN :AI_P_1013_see_set_deport := 1; END IF;',
'		IF rec.permissionid = 1014 THEN :AI_P_1014_see_set_offload := 1; END IF;',
'		IF rec.permissionid = 1015 THEN :AI_P_1015_see_pg_blacklist := 1; END IF;',
'		IF rec.permissionid = 1016 THEN :AI_P_1016_edt_blacklist := 1; END IF;',
'		IF rec.permissionid = 1017 THEN :AI_P_1017_see_pg_incidents := 1; END IF;',
'		IF rec.permissionid = 1018 THEN :AI_P_1018_see_stat_curpost := 1; END IF;',
'		IF rec.permissionid = 1019 THEN :AI_P_1019_see_stat_allposts := 1; END IF;',
'		IF rec.permissionid = 1020 THEN :AI_P_1020_see_rep_curpost := 1; END IF;',
'		IF rec.permissionid = 1021 THEN :AI_P_1021_see_rep_allposts := 1; END IF;',
'		IF rec.permissionid = 1022 THEN :AI_P_1022_see_pg_agegroups := 1; END IF;',
'		IF rec.permissionid = 1023 THEN :AI_P_1023_see_pg_flightroster := 1; END IF;',
'		IF rec.permissionid = 1024 THEN :AI_P_1024_see_pg_officerperf := 1; END IF;',
'		IF rec.permissionid = 1025 THEN :AI_P_1025_see_pg_peakhours := 1; END IF;',
'		IF rec.permissionid = 1026 THEN :AI_P_1026_see_pg_monthlyview := 1; END IF;',
'		IF rec.permissionid = 1027 THEN :AI_P_1027_see_pg_natvisareport := 1; END IF;',
'		IF rec.permissionid = 1028 THEN :AI_P_1028_see_pg_dailymvmnts := 1; END IF;',
'		IF rec.permissionid = 1030 THEN :AI_P_1030_edt_airlines := 1; END IF;',
'		IF rec.permissionid = 1031 THEN :AI_P_1031_edt_flights := 1; END IF;',
'		IF rec.permissionid = 1032 THEN :AI_P_1032_edt_countries := 1; END IF;',
'		IF rec.permissionid = 1033 THEN :AI_P_1033_edt_ctryregs := 1; END IF;',
'		IF rec.permissionid = 1034 THEN :AI_P_1034_edt_terminals := 1; END IF;',
'		IF rec.permissionid = 1035 THEN :AI_P_1035_edt_doctype := 1; END IF;',
'		IF rec.permissionid = 1036 THEN :AI_P_1036_edt_sysparam := 1; END IF;',
'		IF rec.permissionid = 1038 THEN :AI_P_1038_see_pg_usrmgmt := 1; END IF;',
'		IF rec.permissionid = 1039 THEN :AI_P_1039_see_user_create := 1; END IF;',
'		IF rec.permissionid = 1040 THEN :AI_P_1040_see_user_delete := 1; END IF;',
'		IF rec.permissionid = 1041 THEN :AI_P_1041_aut_lock_inactiveusr := 1; END IF;',
'		IF rec.permissionid = 1042 THEN :AI_P_1042_see_setgrp_adm := 1; END IF;',
'		IF rec.permissionid = 1043 THEN :AI_P_1043_see_setgrp_sup := 1; END IF;',
'		IF rec.permissionid = 1044 THEN :AI_P_1044_see_setgrp_sec := 1; END IF;',
'		IF rec.permissionid = 1045 THEN :AI_P_1045_see_setgrp_user := 1; END IF;',
'		IF rec.permissionid = 1046 THEN :AI_P_1046_see_chk_4travelhist := 1; END IF;',
'		IF rec.permissionid = 1050 THEN :AI_P_1050_see_adm_borderpost := 1; END IF;',
'		IF rec.permissionid = 1051 THEN :AI_P_1051_see_pg_trvlhistchild := 1; END IF;',
'		IF rec.permissionid = 1052 THEN :AI_P_1052_see_pg_trvlhistpdf := 1; END IF;',
'		IF rec.permissionid = 1053 THEN :AI_P_1053_see_pg_personreppdf := 1; END IF;',
'		IF rec.permissionid = 1054 THEN :AI_P_1054_EDT_PG_TRANSPORTS := 1; END IF;',
'	end loop;',
'*/',
'    select count(*) ',
'    into l_count',
'    from USER_MANAGEMENT.OBJECT_GRANT_REL ogr',
'    join USER_MANAGEMENT.ROLE_OBJECT_GRANT_REL rogr on rogr.OBJECT_GRANT_REL_ID = ogr.ID',
'    join USER_MANAGEMENT.USER_ROLE_REL urr on urr.ROLE_ID = rogr.ROLE_ID',
'    join USER_MANAGEMENT.USERS u on u.ID = urr.USER_ID',
'    where urr.role_id = ''BMBS_SUP''',
'    and u.USERNAME = upper(:APP_USER);',
'    ',
'    if l_count > 0 then',
'      :AI_P_1010_see_sav_blacklisted := 1;',
'      :AI_P_1009_see_sav_whenred := 1;',
'      :AI_P_1008_see_sav_nofacematch := 1;',
'      :AI_P_1007_see_sav_lessavail := 1;',
'      :AI_P_1006_see_sav_lessmatch := 1;',
'    end if;',
'end;'))
,p_process_when_type=>'USER_IS_NOT_PUBLIC_USER'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(235154754193762107)
,p_process_sequence=>1
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load_Messages_P17'
,p_process_sql_clob=>'PKG_MESSAGES.Load_Messages_Workflow_JS;'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(235418459730694869)
,p_process_sequence=>1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set G_BROWSER_LANGUAGE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'SELECT SUBSTR(owa_util.get_cgi_env(''HTTP_ACCEPT_LANGUAGE''),1,2)',
'INTO :P0_BROWSER_LANGUAGE',
'FROM DUAL;'))
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(551458919169678948)
,p_process_sequence=>2
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AP_SET_TERMINAL_IP'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN    ',
'    :AI_TERMINAL_IP := null;',
'    ',
'    if length(:AI_CLIENT_IP) > 0 then',
'        :AI_TERMINAL_IP := :AI_CLIENT_IP;',
'    else',
'        select owa_util.get_cgi_env(''REMOTE_ADDR'') ',
'        into :AI_TERMINAL_IP',
'        from dual;',
'    end if;',
'    ',
'    :AI_TERMINAL_IP := trim(:AI_TERMINAL_IP);',
'    ',
'    :AI_CGI_ENV_REMOTE_ADDR := :AI_TERMINAL_IP;',
'    ',
'    /*select owa_util.get_cgi_env(''REMOTE_ADDR'') ',
'    into :AI_CGI_ENV_REMOTE_ADDR',
'    from dual;*/',
'    ',
'    select owa_util.get_cgi_env(''HTTP_USER_AGENT'') ',
'    into :AI_CGI_ENV_HTTP_USER_AGENT',
'    from dual;',
'    ',
'    select owa_util.get_cgi_env(''REMOTE_HOST'') ',
'    into :AI_CGI_ENV_REMOTE_HOST',
'    from dual;',
'    ',
'    --SELECT substr(utl_inaddr.get_host_name(:AI_TERMINAL_IP), 1, 15) into :AI_TERMINAL_NAME FROM dual;',
'    if :AI_TERMINAL_NAME is null then',
'        BEGIN',
'            SELECT substr(regexp_replace(utl_inaddr.get_host_name(:AI_TERMINAL_IP), ''\.[^0-9].*$''), 1, 15) into :AI_TERMINAL_NAME FROM dual;',
'        EXCEPTION WHEN OTHERS THEN',
'            IF sqlcode = -29257 THEN',
'                -- Could not resolve host name for IP',
'                :AI_TERMINAL_NAME := :AI_TERMINAL_IP;',
'            END IF;',
'        END;',
'    end if;',
'',
'EXCEPTION  -- exception handlers begin   ',
'WHEN OTHERS THEN  -- handles all other errors',
'  :AI_TERMINAL_IP := NULL;',
'END;  -- exception handlers and block end here',
'',
'declare',
'    c_key varchar2(255) := ''login.get_terminal'';',
'begin',
'    logger.log(''Getting terminal ID for IP "'' || :AI_TERMINAL_IP ||''"'', c_key);',
'    select',
'        t.id',
'    into',
'        :AI_TERMINAL_ID',
'    from',
'        dl_bordercontrol.terminals t',
'    where',
'        trim(t.IPADDRESS) = trim(:AI_TERMINAL_IP);',
'    logger.log(''Got terminal ID '' || :AI_TERMINAL_ID, c_key);',
'    --owa_util.get_cgi_env(''REMOTE_ADDR'')',
'exception when others then',
'    logger.log_error(''Could not get terminal ID for IP "'' || :AI_TERMINAL_IP ||''"'', c_key);',
'end;'))
,p_process_when_type=>'NEVER'
,p_process_comment=>'sets application items AI_TERMINAL_IP and AI_DEFAULT_EXITFLG'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(454264658581521936)
,p_process_sequence=>3
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AI_SET_DEFAULT_DIRECTION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    ',
'   ',
'    select DEFAULTEXITFLG, TRNSPRTMODEID, 64803',
'    into :AI_DEFAULT_DIRECTION, :AI_TRANSPORT_MODE, :AI_DEFAULT_LOCATION',
'    FROM TERMINALS',
'    WHERE IPADDRESS = :AI_TERMINAL_IP or IPADDRESS = :AI_TERMINAL_NAME;',
'',
'EXCEPTION  -- exception handlers begin   ',
'WHEN OTHERS THEN  -- handles all other errors',
'  :AI_DEFAULT_DIRECTION := 2;',
'  :AI_TRANSPORT_MODE := 0;',
'END;  -- exception handlers and block end here'))
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(454298263532617039)
,p_process_sequence=>4
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AI_SET_DEFAULT_DIRECTION_VISUAL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    BEGIN',
'    :AI_ENTRY_MODE_DESCRIPTION := null;',
'',
'    ',
'    select decode(:AI_DEFAULT_DIRECTION, 1, ''Departure'', 0,''Arrival'', 2, ''Both'', ''No Direction defined'') into :AI_ENTRY_MODE_DESCRIPTION from dual;',
'',
'    ',
'    EXCEPTION  -- exception handlers begin   ',
'WHEN OTHERS THEN  -- handles all other errors',
'  :AI_ENTRY_MODE_DESCRIPTION := null;',
'END;  -- exception handlers and block end here'))
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(921110407795325416)
,p_process_sequence=>7
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set_Thresholds'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    /*select to_number(value) into :AI_FP_QUALITY_01 from parameters where name = ''FP_QUALITY_01'';',
'    select to_number(value) into :AI_FP_QUALITY_02 from parameters where name = ''FP_QUALITY_02'';',
'    select to_number(value) into :AI_FP_QUALITY_03 from parameters where name = ''FP_QUALITY_03'';',
'    select to_number(value) into :AI_FP_QUALITY_04 from parameters where name = ''FP_QUALITY_04'';',
'    select to_number(value) into :AI_FP_QUALITY_05 from parameters where name = ''FP_QUALITY_05'';',
'    select to_number(value) into :AI_FP_QUALITY_06 from parameters where name = ''FP_QUALITY_06'';',
'    select to_number(value) into :AI_FP_QUALITY_07 from parameters where name = ''FP_QUALITY_07'';',
'    select to_number(value) into :AI_FP_QUALITY_08 from parameters where name = ''FP_QUALITY_08'';',
'    select to_number(value) into :AI_FP_QUALITY_09 from parameters where name = ''FP_QUALITY_09'';',
'    select to_number(value) into :AI_FP_QUALITY_10 from parameters where name = ''FP_QUALITY_10'';*/',
'	:AI_FP_QUALITY_01 := to_number(PKG_COMMON.Get_Parameter(''FP_QUALITY_01''));',
'	:AI_FP_QUALITY_02 := to_number(PKG_COMMON.Get_Parameter(''FP_QUALITY_02''));',
'	:AI_FP_QUALITY_03 := to_number(PKG_COMMON.Get_Parameter(''FP_QUALITY_03''));',
'	:AI_FP_QUALITY_04 := to_number(PKG_COMMON.Get_Parameter(''FP_QUALITY_04''));',
'	:AI_FP_QUALITY_05 := to_number(PKG_COMMON.Get_Parameter(''FP_QUALITY_05''));',
'	:AI_FP_QUALITY_06 := to_number(PKG_COMMON.Get_Parameter(''FP_QUALITY_06''));',
'	:AI_FP_QUALITY_07 := to_number(PKG_COMMON.Get_Parameter(''FP_QUALITY_07''));',
'	:AI_FP_QUALITY_08 := to_number(PKG_COMMON.Get_Parameter(''FP_QUALITY_08''));',
'	:AI_FP_QUALITY_09 := to_number(PKG_COMMON.Get_Parameter(''FP_QUALITY_09''));',
'	:AI_FP_QUALITY_10 := to_number(PKG_COMMON.Get_Parameter(''FP_QUALITY_10''));',
'	:AI_MUST_CONFIRM_RESET := PKG_COMMON.Get_Parameter(''MUST_CONFIRM_RESET'');',
'	:AI_DEFAULT_SCAN_TC := PKG_COMMON.Get_Parameter(''DEFAULT_SCAN_TC'');',
'	:AI_DEFAULT_SCAN_VISA := PKG_COMMON.Get_Parameter(''DEFAULT_SCAN_VISA'');',
'end;'))
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(13082470629275226810)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECK_PIBICS_CONN'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE  ',
'    l_count NUMBER;',
'    l_pibics_prod_enabled NUMBER := 0;',
'BEGIN       ',
'    l_pibics_prod_enabled := TO_NUMBER(NVL(dl_bordercontrol.pkg_common.Get_Parameter(''PIBICS_PROD_ENABLED''), 0));',
'    ',
'    IF l_pibics_prod_enabled = 1 THEN',
'        EXECUTE IMMEDIATE ''SELECT COUNT(1) FROM dl_bordercontrol.v_pibics_conn_prod'' INTO l_count;',
'    END IF;',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''is_pibics_prod_enabled'', l_pibics_prod_enabled);',
'    apex_json.write(''is_conn_active'', CASE WHEN l_pibics_prod_enabled = 1 THEN 1 ELSE 0 END);',
'    apex_json.close_object();',
'EXCEPTION',
'    -- for all TNS errors',
'    WHEN OTHERS THEN',
'        apex_json.open_object();',
'        apex_json.write(''is_pibics_prod_enabled'', l_pibics_prod_enabled);',
'        apex_json.write(''is_conn_active'', 0);',
'        apex_json.close_object();',
'END;'))
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(35215091822438158927)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_PARTIAL_DATE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_partial_date_data  VARCHAR2(20) := TRIM(apex_application.g_x01);',
'    l_date_format        VARCHAR2(10) := TRIM(apex_application.g_x02);',
'    l_must_be_past       NUMBER := TO_NUMBER(NVL(apex_application.g_x03, 0));',
'    l_must_be_future     NUMBER := TO_NUMBER(NVL(apex_application.g_x04, 0));',
'    l_yearlimit          NUMBER := TO_NUMBER(NVL(apex_application.g_x05, 0));',
'    l_reversedate        NUMBER := TO_NUMBER(NVL(apex_application.g_x06, 0));',
'    l_partial_date       DL_BORDERCONTROL.CT_PARTIAL_DATE_TYPE;',
'    l_is_partial         PLS_INTEGER := 0;',
'    l_formatted_date     VARCHAR2(20);',
'BEGIN',
'    -- init',
'    l_partial_date := DL_BORDERCONTROL.CT_PARTIAL_DATE_TYPE(0, 0, 0);',
'    ',
'    IF l_date_format IS NULL THEN',
'        l_date_format := ''DD/MM/YYYY'';',
'    END IF;',
'    ',
'    IF l_partial_date_data IS NOT NULL THEN',
'        l_partial_date := pkg_common.Get_Partial_Date(l_partial_date_data, l_must_be_past, l_must_be_future, l_yearlimit, l_reversedate);',
'        IF l_partial_date.isValidDate() = 0 THEN',
'            l_is_partial := 1;',
'        END IF;',
'        l_formatted_date := l_partial_date.getFormatData(l_date_format);',
'    END IF;',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''status'', 1);',
'    apex_json.write(''is_partial'', l_is_partial);',
'    apex_json.write(''formatted_date'', l_formatted_date);',
'    apex_json.write(''msg'', ''SUCCESS'');',
'    apex_json.close_object();',
'    ',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        apex_json.open_object();',
'        apex_json.write(''status'', 0);',
'        apex_json.write(''is_partial'', l_is_partial);',
'        apex_json.write(''formatted_date'', NVL(l_formatted_date, l_partial_date_data));',
'        apex_json.write(''msg'', SQLCODE || ''-'' || SQLERRM);',
'        apex_json.close_object();',
'END;'))
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(188293052139898203)
,p_process_sequence=>1
,p_process_point=>'ON_NEW_INSTANCE'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set AI_LANDING_PAGE'
,p_process_sql_clob=>':AI_LANDING_PAGE := ''101'';'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(553211443632804014)
,p_process_sequence=>1
,p_process_point=>'ON_NEW_INSTANCE'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Init_SessionBag'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'Lcntr number;',
'',
'-- Logger',
'l_scope logger_logs.scope%TYPE := ''APEX BmBS (500) - App Process: '' || ''Init_SessionBag'';',
'l_params logger.tab_param;',
'',
'begin',
'',
'-- Logging',
'logger.log(''START'', l_scope, null, l_params);',
'',
'PKG_APEX_UTIL.COLL_Init(''PASS_AXIAL_IMAGE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_VISUAL_FACE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_ICAO_FACE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_VISUALPAGE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_UVPAGE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_IRPAGE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG3_0'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG3_1'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T1'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T2'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T3'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T4'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T5'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T6'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T7'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T8'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T9'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T10'');',
'',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LT'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RT'');',
'',
'PKG_APEX_UTIL.COLL_Init(''VISA_IMAGE'');',
'PKG_APEX_UTIL.COLL_Init(''LANDINGCARD_IMAGE'');',
'',
'-- Logging',
'logger.log(''END'', l_scope, null, l_params);',
'',
'end;'))
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(903983824314566595)
,p_process_sequence=>6
,p_process_point=>'ON_NEW_INSTANCE'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AI_SETBIOMETRICREQUIRED'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    ',
'   ',
'    select DECODE(BIO_CAPTURING, null, 1, 0, 1, 0)',
'    into :AI_NO_BIOMETRIC_CAPTURING',
'    FROM TERMINALS',
'    WHERE IPADDRESS = :AI_TERMINAL_IP or IPADDRESS = :AI_TERMINAL_NAME;',
'',
'EXCEPTION  -- exception handlers begin   ',
'WHEN OTHERS THEN  -- handles all other errors',
'  :AI_NO_BIOMETRIC_CAPTURING := 0;',
'END;  -- exception handlers and block end here'))
);
end;
/
