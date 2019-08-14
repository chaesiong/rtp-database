prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(553695337390312833)
,p_computation_sequence=>10
,p_computation_item=>'AI_MOVEMENTS_TODAY'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'SELECT /*COUNT(*) FROM MOVEMENTS*/ -1 from dual'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(124146409969178333)
,p_computation_sequence=>10
,p_computation_item=>'AI_RELEASE_VERSION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select pkg_common.get_parameter(''RELEASE_VERSION'') from dual'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(175492423900814415)
,p_computation_sequence=>10
,p_computation_item=>'AI_SESSION_TIMEOUT_SECONDS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select trunc(cast((least(session_idle_timeout_on, session_life_timeout_on) - sysdate) * 86400 as number)) remaining_seconds from apex_workspace_sessions s where apex_session_id = :APP_SESSION'
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(187359172288208021)
,p_computation_sequence=>10
,p_computation_item=>'AI_APP_VERSION_BMBS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select pkg_common.get_parameter(''APP_VERSION_BMBS'') from dual'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(554210941345979639)
,p_computation_sequence=>10
,p_computation_item=>'AI_WEBSOCKET_PROTOCOL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'wss'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(5173768563276048468)
,p_computation_sequence=>10
,p_computation_item=>'AI_CURRENT_USER_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :AI_CURRENT_USER_NAME is null then',
'	BEGIN',
'		SELECT UPPER(NVL(TRIM(first_name || '' '' || last_name), username))',
'		INTO :AI_CURRENT_USER_NAME',
'		FROM apex_user_management.users',
'		WHERE username = :APP_USER',
'		AND ROWNUM = 1;',
'	EXCEPTION ',
'		WHEN OTHERS THEN',
'			:AI_CURRENT_USER_NAME := :APP_USER;',
'	END;',
'end if;',
'return :AI_CURRENT_USER_NAME;'))
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(175979593991478927)
,p_computation_sequence=>33
,p_computation_item=>'AI_TERMINAL_IP'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select trim(nvl(:AI_CLIENT_IP, owa_util.get_cgi_env(''REMOTE_ADDR''))) from dual'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(175979753302479146)
,p_computation_sequence=>34
,p_computation_item=>'AI_TERMINAL_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :AI_TERMINAL_NAME is null then',
'	BEGIN',
'		SELECT substr(regexp_replace(utl_inaddr.get_host_name(:AI_TERMINAL_IP), ''\.[^0-9].*$''), 1, 15) into :AI_TERMINAL_NAME FROM dual;',
'	EXCEPTION WHEN OTHERS THEN',
'		IF sqlcode = -29257 THEN',
'			-- Could not resolve host name for IP',
'			:AI_TERMINAL_NAME := :AI_TERMINAL_IP;',
'		END IF;',
'	END;',
'end if;',
'return :AI_TERMINAL_NAME;'))
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(185658316397421019)
,p_computation_sequence=>35
,p_computation_item=>'AI_TERMINAL_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	max(t.id)',
'from',
'	dl_bordercontrol.terminals t',
'where',
'	trim(t.IPADDRESS) = trim(:AI_TERMINAL_IP)'))
,p_compute_when_type=>'ALWAYS'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(110045665862805256)
,p_computation_sequence=>36
,p_computation_item=>'AI_TERMINAL_NAME_AND_IP'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :AI_TERMINAL_NAME_AND_IP is null then',
'	BEGIN',
'		IF :AI_TERMINAL_NAME = :AI_TERMINAL_IP THEN',
'			:AI_TERMINAL_NAME_AND_IP := :AI_TERMINAL_NAME;',
'		ELSE',
'			:AI_TERMINAL_NAME_AND_IP := :AI_TERMINAL_NAME || '':'' || :AI_TERMINAL_IP;',
'		END IF;',
'	EXCEPTION WHEN OTHERS THEN',
'		:AI_TERMINAL_NAME_AND_IP := :AI_TERMINAL_NAME || '':'' || :AI_TERMINAL_IP;',
'	END;',
'end if;',
'return :AI_TERMINAL_NAME_AND_IP;'))
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(185650562832307862)
,p_computation_sequence=>40
,p_computation_item=>'AI_BORDERPOST_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select bp.key_value ',
'from dl_bordercontrol.terminals t',
'join dl_bordercontrol.borderposts bp',
'on bp.key_value = t.border_post',
'where t.IPADDRESS = :AI_TERMINAL_IP'))
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(197269574829441781)
,p_computation_sequence=>40
,p_computation_item=>'AI_BORDER_TYPE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case',
'        when TRNSPRTMODEID = 0',
'        then ''AIR_BORDER''',
'        when TRNSPRTMODEID = 1',
'        then ''SEA_BORDER''',
'        when TRNSPRTMODEID = 2',
'        then ''LAND_BORDER''',
'        end',
' from dl_bordercontrol.terminals',
' where IPADDRESS = :AI_TERMINAL_IP',
'--trim(nvl(:AI_CLIENT_IP, owa_util.get_cgi_env(''REMOTE_ADDR'')));'))
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(842416443146761083)
,p_computation_sequence=>40
,p_computation_item=>'AI_BORDERPOST_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select bp.name ',
'from dl_bordercontrol.terminals t',
'join dl_bordercontrol.borderposts bp',
'on bp.key_value = t.border_post',
'where t.IPADDRESS = :AI_TERMINAL_IP'))
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(1291259455648294244)
,p_computation_sequence=>40
,p_computation_item=>'AI_BORDERPOST_PROVINCE_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :AI_BORDERPOST_PROVINCE_ID IS NULL THEN',
'	BEGIN',
'		SELECT NVL(bp.provinceid, (SELECT key_value FROM dl_bordercontrol.adm_class_province WHERE display_code = ''00'' AND ROWNUM = 1))',
'		INTO :AI_BORDERPOST_PROVINCE_ID',
'		FROM dl_bordercontrol.terminals t',
'		JOIN dl_bordercontrol.borderposts bp',
'		ON bp.key_value = t.border_post',
'		WHERE t.ipaddress = :AI_TERMINAL_IP;',
'	EXCEPTION',
'		WHEN OTHERS THEN',
'			NULL;',
'	END;',
'END IF;',
'RETURN :AI_BORDERPOST_PROVINCE_ID;'))
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(176091944693662858)
,p_computation_sequence=>50
,p_computation_item=>'AI_DEFAULT_DIRECTION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select DEFAULTEXITFLG from terminals where id = :AI_TERMINAL_ID'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(176092154373665705)
,p_computation_sequence=>51
,p_computation_item=>'AI_TRANSPORT_MODE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select TRNSPRTMODEID from terminals where id = :AI_TERMINAL_ID'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(176124410307690036)
,p_computation_sequence=>52
,p_computation_item=>'AI_ENTRY_MODE_DESCRIPTION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select decode(:AI_DEFAULT_DIRECTION, 1, ''Departure'', 0,''Arrival'', 2, ''Both'', ''No Direction defined'') from dual'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(78870818056902717)
,p_computation_sequence=>60
,p_computation_item=>'AI_CAMERA_DIRECTION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select default_camera_direction from terminals where id = :AI_TERMINAL_ID'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(456093771585076969)
,p_computation_sequence=>10
,p_computation_item=>'AI_PARAMETER_ANIMATIONIN'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'fadeIn'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(456093992057078917)
,p_computation_sequence=>10
,p_computation_item=>'AI_PARAMETER_ANIMATIONOUT'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'fadeOut'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(456123269793278893)
,p_computation_sequence=>10
,p_computation_item=>'AI_PARAMETER_LOG'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'0'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(456346172994190272)
,p_computation_sequence=>10
,p_computation_item=>'AI_LAST_USED_TRNSPRT_UNIT'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'null'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(464192655644997510)
,p_computation_sequence=>10
,p_computation_item=>'AI_PASSPORTREADER'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'Regular'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(842378124369593391)
,p_computation_sequence=>10
,p_computation_item=>'AI_REST_PREFIX'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select PKG_COMMON.Get_Parameter(''REST_PREFIX'') FROM DUAL'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(842544244000009872)
,p_computation_sequence=>10
,p_computation_item=>'AI_FP_THRESHOLD_1'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select PKG_COMMON.Get_Parameter(''FP_THRESHOLD_1'') FROM DUAL'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(842544422421011696)
,p_computation_sequence=>10
,p_computation_item=>'AI_FP_THRESHOLD_2'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select PKG_COMMON.Get_Parameter(''FP_THRESHOLD_2'') FROM DUAL'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(842544605032012976)
,p_computation_sequence=>10
,p_computation_item=>'AI_FP_THRESHOLD_VER'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select PKG_COMMON.Get_Parameter(''FP_THRESHOLD_VER'') FROM DUAL'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(842544826076014960)
,p_computation_sequence=>10
,p_computation_item=>'AI_FACE_THRESHOLD_VER'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select PKG_COMMON.Get_Parameter(''FACE_THRESHOLD_VER'') FROM DUAL'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(842544983876018892)
,p_computation_sequence=>10
,p_computation_item=>'AI_FACE_THRESHOLD_1'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select PKG_COMMON.Get_Parameter(''FACE_THRESHOLD_1'') from dual'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(842545207870019964)
,p_computation_sequence=>10
,p_computation_item=>'AI_FACE_THRESHOLD_2'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select PKG_COMMON.Get_Parameter(''FACE_THRESHOLD_2'') from dual'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(852567834235992034)
,p_computation_sequence=>10
,p_computation_item=>'AI_FP_LIVENESS_1'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select PKG_COMMON.Get_Parameter(''FP_LIVENESS_1'') FROM DUAL'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(852567988540993515)
,p_computation_sequence=>10
,p_computation_item=>'AI_FP_LIVENESS_2'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select PKG_COMMON.Get_Parameter(''FP_LIVENESS_2'') FROM DUAL'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(909651192295525372)
,p_computation_sequence=>10
,p_computation_item=>'AI_MIN_FINGER_MATCHES'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select PKG_COMMON.Get_Parameter(''MIN_FINGER_MATCHES'') from dual'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(919222742942026499)
,p_computation_sequence=>10
,p_computation_item=>'AI_COMPRESSION_LEVEL'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select PKG_COMMON.Get_Parameter(''JPG_QUALITY'') from dual'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(934275161797302391)
,p_computation_sequence=>10
,p_computation_item=>'AI_IS_HQ'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select PKG_COMMON.Get_Parameter(''IS_HQ'') FROM DUAL'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(954632396973718077)
,p_computation_sequence=>10
,p_computation_item=>'AI_ABIS_PREFIX'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select PKG_COMMON.Get_Parameter(''ABIS_PREFIX'') FROM DUAL'
);
end;
/
