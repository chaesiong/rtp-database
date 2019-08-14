prompt --application/shared_components/logic/application_computations
begin
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(504456826937910931)
,p_computation_sequence=>10
,p_computation_item=>'AI_BORDERPOST_DEPT_SEQNO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :AI_BORDERPOST_DEPT_SEQNO is null then',
'	BEGIN',
'		SELECT DL_STAGING4PIBICS_INTF.pkg_transcode_reverse.get_borderpost_seqno(:AI_BORDERPOST_ID)',
'		INTO :AI_BORDERPOST_DEPT_SEQNO',
'		FROM DUAL;',
'	EXCEPTION ',
'		WHEN OTHERS THEN',
'			:AI_BORDERPOST_DEPT_SEQNO := NULL;',
'	END;',
'	IF :AI_BORDERPOST_DEPT_SEQNO IS NULL THEN',
'		:AI_BORDERPOST_DEPT_SEQNO := 355;',
'	END IF;',
'end if;',
'return :AI_BORDERPOST_DEPT_SEQNO;'))
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(504457180517914666)
,p_computation_sequence=>10
,p_computation_item=>'AI_CURRENT_PUSER_ENC'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :AI_CURRENT_PUSER_ENC is null then',
'	BEGIN',
'		SELECT ',
'		LISTAGG(TO_CHAR( TO_NUMBER( RAWTOHEX(letter), ''XXXX'' ) + TO_NUMBER( ''2'', ''XX'' ), ''FMXXXX'' ), '''' ) WITHIN GROUP (ORDER BY THE_LEVEL) AS ENCR_USER_NAME',
'		INTO :AI_CURRENT_PUSER_ENC',
'		FROM',
'		(',
'			SELECT LEVEL THE_LEVEL, SUBSTR(''P'' || :APP_USER, LEVEL, 1) LETTER',
'			FROM DUAL',
'			CONNECT BY LEVEL <= LENGTH(''P'' || :APP_USER)',
'		);',
'	EXCEPTION ',
'		WHEN OTHERS THEN',
'			:AI_CURRENT_PUSER_ENC := NULL;',
'	END;',
'end if;',
'return :AI_CURRENT_PUSER_ENC;'))
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(504457364368917033)
,p_computation_sequence=>10
,p_computation_item=>'AI_CURRENT_USER_ENC'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :AI_CURRENT_USER_ENC is null then',
'	BEGIN',
'		SELECT ',
'		LISTAGG(TO_CHAR( TO_NUMBER( RAWTOHEX(letter), ''XXXX'' ) + TO_NUMBER( ''2'', ''XX'' ), ''FMXXXX'' ), '''' ) WITHIN GROUP (ORDER BY THE_LEVEL) AS ENCR_USER_NAME',
'		INTO :AI_CURRENT_USER_ENC',
'		FROM',
'		(',
'			SELECT LEVEL THE_LEVEL, SUBSTR(:APP_USER, LEVEL, 1) LETTER',
'			FROM DUAL',
'			CONNECT BY LEVEL <= LENGTH(:APP_USER)',
'		);',
'	EXCEPTION ',
'		WHEN OTHERS THEN',
'			:AI_CURRENT_USER_ENC := NULL;',
'	END;',
'end if;',
'return :AI_CURRENT_USER_ENC;'))
);
end;
/
