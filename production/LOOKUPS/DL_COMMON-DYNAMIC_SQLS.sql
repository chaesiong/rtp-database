REM INSERTING into DL_COMMON.DYNAMIC_SQLS
SET DEFINE OFF;
Insert into DL_COMMON.DYNAMIC_SQLS (KEY_VALUE,NAME,APP_ALIAS,PAGE_ID,SQL_TEXT,SQL_TYPE,COMMENTS,OWNER,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,BIND_VAR_NAMES,BIND_VAR_VALUES,BIND_VAR_SEPARATOR) values ('993482DA438B7F33E053360616AC1E5D','GET_TRAVEL_HISTORY_SQL_NULL','BMBS','17','SELECT
	NULL AS LINK
	, NULL AS USERTYPE
	, NULL AS DIRECTION
	, NULL AS DOCNUMBER
	, NULL AS TRAVELDATE
	, NULL AS SOURCE_SYSTEM
	, NULL AS VISA_TYPE
	, NULL AS MVMNTID
	, NULL AS BORDERPOST
	, NULL AS VEHICLETYPE
	, NULL AS DATA_SOURCE
	, NULL AS DATA_SOURCE_SEC
	, NULL AS DATA_SOURCE_SEC_PK_VAL
FROM DUAL
WHERE 1 = 2
','SQL','P17_TRAVEL_HISTORY','DL_BORDERCONTROL',sysdate,'INITIAL',systimestamp,'INITIAL','I',null,null,':');
Insert into DL_COMMON.DYNAMIC_SQLS (KEY_VALUE,NAME,APP_ALIAS,PAGE_ID,SQL_TEXT,SQL_TYPE,COMMENTS,OWNER,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,BIND_VAR_NAMES,BIND_VAR_VALUES,BIND_VAR_SEPARATOR) values ('993482DA438D7F33E053360616AC1E5D','GET_TRAVEL_HISTORY_SQL_MAIN','BMBS','17',TO_CLOB('WITH trimming AS (
	SELECT 30 len, ''&#x2026;'' dots FROM dual
)
SELECT /*+ NO_PARALLEL */ * 
FROM
(
	-- BIO start --
	SELECT /*+ NO_PARALLEL */
		''<span class="fa fa-search table-link-icon fa-1-5x''
		|| CASE WHEN LENGTH((SELECT note FROM dl_bordercontrol.entry_forms WHERE key_value = m.entry_form)) > 0 THEN '' row_yellow '' END 
		|| ''" aria-hidden="true"></span>'' AS LINK
		, DECODE(m.person_type, 2, ''<span class="fa fa-crew black fa-1-5x" aria-hidden="true" title="Crew"></span>'', ''<span class="fa ')
|| TO_CLOB('fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>'') AS USERTYPE
		, (
			SELECT ''<span class="cl-bold '' || DECODE(m.exitflg, 1, '' my_red '', 0, '' my_blue '') || ''" aria-hidden="true" title="'' || display_value$dlc || ''">'' 
			|| NVL(display_value, display_value$dlc) 
			|| ''</span>''
			FROM dl_common.port_movements$lc WHERE num_value = m.exitflg
		) AS DIRECTION
		, (SELECT docno FROM dl_bordercontrol.borderdocuments WHERE brddocid = m.brddocid) AS DOCNUMBER
		, m.date_of_entry AS TRAVEL')
|| TO_CLOB('DATE
		, DECODE(NVL(m.source_system, -999), 1, ''BIO'', 2, ''PIB'', 3, ''ATC'', 4, ''OFF'', -999, ''N/A'', '''' || m.source_system) AS SOURCE_SYSTEM
		, (
			SELECT SUBSTR(display_value, 1, tr.len) || CASE WHEN LENGTH(display_value) > tr.len THEN tr.dots else '''' END
			FROM dl_bordercontrol.visa_name
			WHERE key_value = m.visa_type
		) VISA_TYPE
		, m.mvmntid
		, (
			SELECT
			CASE
			WHEN NVL(LENGTH(name), 0) <= tr.len THEN name
			ELSE SUBSTR(name,1,tr.len)||tr.dots
			END AS BORDERPOST
			FROM dl_borde')
|| TO_CLOB('rcontrol.borderposts
			WHERE key_value = m.ins_borderpost
		) AS BORDERPOST
		, CASE
			WHEN NVL(LENGTH(m.scanned_flight), 0) <= tr.len THEN m.scanned_flight
			ELSE SUBSTR(m.scanned_flight, 1, tr.len) || tr.dots
		END AS VEHICLETYPE
		, ''BIO'' AS DATA_SOURCE
		, ''BIO'' AS DATA_SOURCE_SEC
		, MVMNTID AS DATA_SOURCE_SEC_PK_VAL
	FROM dl_bordercontrol.movements m, trimming tr
	WHERE m.brddocid IN
	(
		SELECT bd.brddocid
		FROM dl_bordercontrol.borderdocuments bd, dl_bordercontrol.identities i
		WHER')
|| TO_CLOB('E bd.brddocid = i.brddocid
		AND
		(
			(
				:P17_BRDDOC_IDENTITY IS NULL
				AND bd.docno      = :P17_DISPLAY_DOCNUMBER
				AND bd.issuectry  = :P17_NATIONALITY
			)
			OR
			(
				:P17_BRDDOC_IDENTITY IS NOT NULL
				AND i.identity   = :P17_BRDDOC_IDENTITY
			)
		)
	)
	AND m.is_finished = ''Y''
	AND m.source_system != 5
	-- BIO end --
	UNION ALL
	-- PIBICS tminout_ma start --
	SELECT /*+ NO_PARALLEL INDEX(v tminout_ma TMINOUT_MA_COMPOSITE_IDX2) */
		''<span class="fa fa-search table-link-icon fa')
|| TO_CLOB('-1-5x'' 
		|| CASE WHEN v.typedata IN (''PHB'', ''BIO-PHB'') THEN '' row_red '' END
		|| ''" aria-hidden="true"></span>'' AS LINK
		, ''<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>'' AS USERTYPE
		, (
			SELECT ''<span class="cl-bold '' || DECODE(v.cardtype, 2, '' my_red '', 1, '' my_blue '') || ''" aria-hidden="true" title="'' || display_value$dlc || ''">'' 
			|| NVL(display_value, display_value$dlc) 
			|| ''</span>''
			FROM dl_common.port_movements$lc WHERE num_value = DECODE(v.car')
|| TO_CLOB('dtype, 2, 1, 1, 0, v.cardtype)
		) AS DIRECTION
		, v.tdtno AS DOCNUMBER
		, v.inoutdte AS TRAVELDATE
		, CASE WHEN v.typedata IN (''ATC'', ''PHB'', ''RETH'', ''BIO-PHB'', ''BIO-RETH'') THEN v.typedata ELSE ''PIBICS'' END AS SOURCE_SYSTEM
		, (
			SELECT SUBSTR(display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '''' END
			FROM dl_bordercontrol.visa_name
			WHERE key_value = v.visatypecd
		) AS VISA_TYPE
		, NULL AS MVMNTID
		, (
			SELECT
				CASE WHEN DL_COMMON.PKG_I18N.')
|| TO_CLOB('Get_Sess_Data_Locale() = ''th_TH''
				THEN
				CASE
				WHEN NVL(LENGTH(NVL(depttnm, deptenm)), 0) <= tr.len
				THEN NVL(depttnm, deptenm)
				ELSE SUBSTR(NVL(depttnm, deptenm), 1, tr.len) || tr.dots
				END
				ELSE
				CASE
				WHEN NVL(LENGTH(NVL(deptenm, depttnm)), 0) <= tr.len
				THEN NVL(deptenm, depttnm)
				ELSE substr(NVL(deptenm, depttnm), 1, tr.len) || tr.dots
				END
				END BORDERPOST
			FROM dl_bordercontrol.v_department
			WHERE dept_seqno = v.dept_seqno
		) AS BORDERPOST
		, NVL')
|| TO_CLOB('(TRIM(v.flightprefix || v.flightnumber), v.convregno) AS VEHICLETYPE
		, ''PIBICS'' AS DATA_SOURCE
		, ''TMINOUT_MA'' AS DATA_SOURCE_SEC
		, v.seqno AS DATA_SOURCE_SEC_PK_VAL
	FROM dl_bordercontrol.v_tminout_ma v, trimming tr
	WHERE v.nationcd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(:P17_STATELESS, :P17_NATIONALITY)) --
	AND v.sex = DECODE(:P17_DISPLAY_GENDER, 1, ''M'', 2, ''F'', sex)
	AND (v.birthdte = :P17_DISPLAY_DOB_TEXT OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEX')
|| TO_CLOB('T, -4, 4) OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -7, 7) OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -8, 8) OR v.birthdte = ''//'' || SUBSTR(:P17_DISPLAY_DOB_TEXT, -4, 4))
	AND
	(
		v.tdtno = :P17_DISPLAY_DOCNUMBER
		OR
		(
			UPPER(TRIM(REGEXP_REPLACE(v.efamilynm, ''\s{2,}'', '' ''))) = :P17_DISPLAY_LASTNAME
			AND UPPER(TRIM(REGEXP_REPLACE(v.efirstnm, ''\s{2,}'', '' ''))) || NVL2(TRIM(v.emiddlenm), '' '' || UPPER(TRIM(REGEXP_REPLACE(v.emiddlenm, ''\s{2,}'', '' ''))), NULL) = :P17_DISPLAY_FIRSTNAME || ')
|| TO_CLOB('NVL2(:P17_DISPLAY_MIDDLENAME, '' '' || :P17_DISPLAY_MIDDLENAME, NULL)
		)
	)
	AND 
	(
		v.typedata IN (''BIO-PHB'', ''BIO-RETH'')
		OR
		NVL(v.typedata, ''~'') NOT LIKE ''BIO%''
	)
	-- PIBICS tminout_ma end --
	UNION ALL
	-- PIBICS tminout start --
	SELECT /*+ NO_PARALLEL INDEX(v tminout TMINOUT_COMPOSITE_IDX2) */
		''<span class="fa fa-search table-link-icon fa-1-5x'' 
		|| CASE WHEN v.typedata IN (''PHB'', ''BIO-PHB'') THEN '' row_red '' END
		|| ''" aria-hidden="true"></span>'' AS LINK
		, ''<span class="fa fa-us')
|| TO_CLOB('er fa-1-5x" aria-hidden="true" title="Traveler"></span>'' AS USERTYPE
		, (
			SELECT ''<span class="cl-bold '' || DECODE(v.cardtype, 2, '' my_red '', 1, '' my_blue '') || ''" aria-hidden="true" title="'' || display_value$dlc || ''">'' 
			|| NVL(display_value, display_value$dlc) 
			|| ''</span>''
			FROM dl_common.port_movements$lc WHERE num_value = DECODE(v.cardtype, 2, 1, 1, 0, v.cardtype)
		) AS DIRECTION
		, v.tdtno AS DOCNUMBER
		, v.inoutdte AS TRAVELDATE
		, CASE WHEN v.typedata IN (''ATC'', ''PHB'', ''R')
|| TO_CLOB('ETH'', ''BIO-PHB'', ''BIO-RETH'') THEN v.typedata ELSE ''PIBICS'' END AS SOURCE_SYSTEM
		, (
			SELECT SUBSTR(display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '''' END
			FROM dl_bordercontrol.visa_name
			WHERE key_value = v.visatypecd
		) AS VISA_TYPE
		, NULL AS MVMNTID
		, (
			SELECT
				CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH''
				THEN
				CASE
				WHEN NVL(LENGTH(NVL(depttnm, deptenm)), 0) <= tr.len
				THEN NVL(depttnm, deptenm)
				ELSE')
|| TO_CLOB(' SUBSTR(NVL(depttnm, deptenm), 1, tr.len) || tr.dots
				END
				ELSE
				CASE
				WHEN NVL(LENGTH(NVL(deptenm, depttnm)), 0) <= tr.len
				THEN NVL(deptenm, depttnm)
				ELSE SUBSTR(NVL(deptenm, depttnm), 1, tr.len) || tr.dots
				END
				END BORDERPOST
		FROM dl_bordercontrol.v_department
		WHERE dept_seqno = v.dept_seqno
		) AS BORDERPOST
		, NVL(TRIM(v.flightprefix || v.flightnumber), v.convregno) AS VEHICLETYPE
		, ''PIBICS'' AS DATA_SOURCE
		, ''TMINOUT'' AS DATA_SOURCE_SEC
		, v.seqno AS DATA')
|| TO_CLOB('_SOURCE_SEC_PK_VAL
	FROM dl_bordercontrol.v_tminout v, trimming tr
	WHERE v.nationcd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(:P17_STATELESS, :P17_NATIONALITY)) --
	AND v.sex = DECODE(:P17_DISPLAY_GENDER, 1, ''M'', 2, ''F'', sex)
	AND (v.birthdte = :P17_DISPLAY_DOB_TEXT OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -4, 4) OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -7, 7) OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -8, 8) OR v.birthdte = ''//'' || SUBSTR(:P17_DIS')
|| TO_CLOB('PLAY_DOB_TEXT, -4, 4))
	AND
	(
		v.tdtno = :P17_DISPLAY_DOCNUMBER
		OR
		(
			UPPER(TRIM(REGEXP_REPLACE(v.efamilynm, ''\s{2,}'', '' ''))) = :P17_DISPLAY_LASTNAME
			AND UPPER(TRIM(REGEXP_REPLACE(v.efirstnm, ''\s{2,}'', '' ''))) || NVL2(TRIM(v.emiddlenm), '' '' || UPPER(TRIM(REGEXP_REPLACE(v.emiddlenm, ''\s{2,}'', '' ''))), NULL) = :P17_DISPLAY_FIRSTNAME || NVL2(:P17_DISPLAY_MIDDLENAME, '' '' || :P17_DISPLAY_MIDDLENAME, NULL)
		)
	)
	AND 
	(
		v.typedata IN (''BIO-PHB'', ''BIO-RETH'')
		OR
		NVL(v.typedata, ''~'') NOT')
|| TO_CLOB(' LIKE ''BIO%''
	)
	-- PIBICS tminout end --
	UNION ALL
	-- PIBICS tmmain IN start --
	SELECT /*+ NO_PARALLEL INDEX(v tmmain TMMAIN_COMPOSITE_IDX1) */
		''<span class="fa fa-search table-link-icon fa-1-5x'' 
		|| CASE WHEN v.typedata IN (''PHB'', ''BIO-PHB'') THEN '' row_red '' END
		|| ''" aria-hidden="true"></span>'' AS LINK
		, ''<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>'' AS USERTYPE
		, (
			SELECT ''<span class="cl-bold my_blue" aria-hidden="true" title="'' || display_val')
|| TO_CLOB('ue$dlc || ''">'' 
			|| NVL(display_value, display_value$dlc) 
			|| ''</span>''
			FROM dl_common.port_movements$lc WHERE num_value = 0
		) AS DIRECTION
		, v.intdtno AS DOCNUMBER
		, v.indte AS TRAVELDATE
		, CASE WHEN v.typedata IN (''ATC'', ''PHB'', ''RETH'', ''BIO-PHB'', ''BIO-RETH'') THEN v.typedata ELSE ''PIBICS'' END AS SOURCE_SYSTEM
		, (
			SELECT SUBSTR(display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '''' END
			FROM dl_bordercontrol.visa_name
			WHERE key_value ')
|| TO_CLOB('= v.invisatypecd
		) AS VISA_TYPE
		, NULL AS MVMNTID
		, (
			SELECT
				CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH''
				THEN
				CASE
				WHEN NVL(LENGTH(NVL(depttnm, deptenm)), 0) <= tr.len
				THEN NVL(depttnm, deptenm)
				ELSE SUBSTR(NVL(depttnm, deptenm), 1, tr.len) || tr.dots
				END
				ELSE
				CASE
				WHEN NVL(LENGTH(NVL(deptenm, depttnm)), 0) <= tr.len
				THEN NVL(deptenm, depttnm)
				ELSE SUBSTR(NVL(deptenm, depttnm), 1, tr.len) || tr.dots
				END
				END BORDER')
|| TO_CLOB('POST
			FROM dl_bordercontrol.v_department
			WHERE dept_seqno = v.indept_seqno
		) AS BORDERPOST
		, NVL(TRIM(v.inflightprefix || v.inflightnumber), v.inconvregno) AS VEHICLETYPE
		, ''PIBICS'' AS DATA_SOURCE
		, ''TMMAIN_IN'' AS DATA_SOURCE_SEC
		, v.tmrunno AS DATA_SOURCE_SEC_PK_VAL
	FROM dl_bordercontrol.v_tmmain v, trimming tr
	WHERE v.indte IS NOT NULL
	AND v.nationcd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(:P17_STATELESS, :P17_NATIONALITY)) --
	AND v.sex = ')
|| TO_CLOB('DECODE(:P17_DISPLAY_GENDER, 1, ''M'', 2, ''F'', sex)
	AND (v.birthdte = :P17_DISPLAY_DOB_TEXT OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -4, 4) OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -7, 7) OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -8, 8) OR v.birthdte = ''//'' || SUBSTR(:P17_DISPLAY_DOB_TEXT, -4, 4))
	AND
	(
		v.intdtno = :P17_DISPLAY_DOCNUMBER
		OR
		(
			UPPER(TRIM(REGEXP_REPLACE(v.efamilynm, ''\s{2,}'', '' ''))) = :P17_DISPLAY_LASTNAME
			AND UPPER(TRIM(REGEXP_REPLACE(v.efirstnm, ''\s{2,}')
|| TO_CLOB(''', '' ''))) || NVL2(TRIM(v.emiddlenm), '' '' || UPPER(TRIM(REGEXP_REPLACE(v.emiddlenm, ''\s{2,}'', '' ''))), NULL) = :P17_DISPLAY_FIRSTNAME || NVL2(:P17_DISPLAY_MIDDLENAME, '' '' || :P17_DISPLAY_MIDDLENAME, NULL)
		)
	)
	AND 
	(
		v.typedata IN (''BIO-PHB'', ''BIO-RETH'')
		OR
		NVL(v.typedata, ''~'') NOT LIKE ''BIO%''
	)
	-- PIBICS tmmain IN end --
	UNION ALL
	-- PIBICS tmmain OUT start --
	SELECT /*+ NO_PARALLEL INDEX(v tmmain TMMAIN_COMPOSITE_IDX1) */
		''<span class="fa fa-search table-link-icon fa-1-5x'' 
		||')
|| TO_CLOB(' CASE WHEN v.typedata IN (''PHB'', ''BIO-PHB'') THEN '' row_red '' END
		|| ''" aria-hidden="true"></span>'' AS LINK
		, ''<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>'' AS USERTYPE
		, (
			SELECT ''<span class="cl-bold my_red" aria-hidden="true" title="'' || display_value$dlc || ''">'' 
			|| NVL(display_value, display_value$dlc) 
			|| ''</span>''
			FROM dl_common.port_movements$lc WHERE num_value = 1
		) AS DIRECTION
		, v.outtdtno AS DOCNUMBER
		, v.outdte AS TRAVELDATE
		,')
|| TO_CLOB(' CASE WHEN v.typedata IN (''ATC'', ''PHB'', ''RETH'', ''BIO-PHB'', ''BIO-RETH'') THEN v.typedata ELSE ''PIBICS'' END AS SOURCE_SYSTEM
		, (
			SELECT SUBSTR(display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '''' END
			FROM dl_bordercontrol.visa_name
			WHERE key_value = v.outvisatypecd
		) AS VISA_TYPE
		, NULL AS MVMNTID
		, (
			SELECT
				CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH''
				THEN
				CASE
				WHEN NVL(LENGTH(NVL(depttnm, deptenm)), 0) <= t')
|| TO_CLOB('r.len
				THEN NVL(depttnm, deptenm)
				ELSE SUBSTR(NVL(depttnm, deptenm), 1, tr.len)||tr.dots
				END
				ELSE
				CASE
				WHEN NVL(LENGTH(NVL(deptenm, depttnm)), 0) <= tr.len
				THEN NVL(deptenm, depttnm)
				ELSE SUBSTR(NVL(deptenm, depttnm), 1, tr.len)||tr.dots
				END
				END BORDERPOST
			FROM dl_bordercontrol.v_department
			WHERE dept_seqno = v.outdept_seqno) AS BORDERPOST
		, NVL(TRIM(v.outflightprefix || v.outflightnumber), v.outconvregno) AS VEHICLETYPE
		, ''PIBICS'' AS DATA_SOURCE
')
|| TO_CLOB('		, ''TMMAIN_OUT'' AS DATA_SOURCE_SEC
		, v.tmrunno AS DATA_SOURCE_SEC_PK_VAL
	FROM dl_bordercontrol.v_tmmain v, trimming tr
	WHERE v.outdte IS NOT NULL
	AND v.nationcd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(:P17_STATELESS, :P17_NATIONALITY)) --
	AND v.sex = DECODE(:P17_DISPLAY_GENDER, 1, ''M'', 2, ''F'', sex)
	AND (v.birthdte = :P17_DISPLAY_DOB_TEXT OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -4, 4) OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -7, 7) OR v.birth')
|| TO_CLOB('dte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -8, 8) OR v.birthdte = ''//'' || SUBSTR(:P17_DISPLAY_DOB_TEXT, -4, 4))
	AND
	(
		v.outtdtno = :P17_DISPLAY_DOCNUMBER
		OR
		(
			UPPER(TRIM(REGEXP_REPLACE(v.efamilynm, ''\s{2,}'', '' ''))) = :P17_DISPLAY_LASTNAME
			AND UPPER(TRIM(REGEXP_REPLACE(v.efirstnm, ''\s{2,}'', '' ''))) || NVL2(TRIM(v.emiddlenm), '' '' || UPPER(TRIM(REGEXP_REPLACE(v.emiddlenm, ''\s{2,}'', '' ''))), NULL) = :P17_DISPLAY_FIRSTNAME || NVL2(:P17_DISPLAY_MIDDLENAME, '' '' || :P17_DISPLAY_MIDDLENAME, NULL)
		')
|| TO_CLOB(')
	)
	AND 
	(
		v.typedata IN (''BIO-PHB'', ''BIO-RETH'')
		OR
		NVL(v.typedata, ''~'') NOT LIKE ''BIO%''
	)
	-- PIBICS tmmain OUT end --
	UNION ALL
	-- PIBICS PRD tminout_ma start --
	SELECT /*+ NO_PARALLEL */
		''<span class="fa fa-search table-link-icon fa-1-5x'' 
		|| CASE WHEN v.typedata IN (''PHB'', ''BIO-PHB'') THEN '' row_red '' END
		|| ''" aria-hidden="true"></span>'' AS LINK
		, ''<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>'' AS USERTYPE
		, (
			SELECT ''<span class="cl-b')
|| TO_CLOB('old '' || DECODE(v.cardtype, 2, '' my_red '', 1, '' my_blue '') || ''" aria-hidden="true" title="'' || display_value$dlc || ''">'' 
			|| NVL(display_value, display_value$dlc) 
			|| ''</span>''
			FROM dl_common.port_movements$lc WHERE num_value = DECODE(v.cardtype, 2, 1, 1, 0, v.cardtype)
		) AS DIRECTION
		, v.tdtno AS DOCNUMBER
		, v.inoutdte AS TRAVELDATE
		, CASE WHEN v.typedata IN (''ATC'', ''PHB'', ''RETH'', ''BIO-PHB'', ''BIO-RETH'') THEN v.typedata ELSE ''PIBICS'' END AS SOURCE_SYSTEM
		, (
			SELECT SUBSTR(')
|| TO_CLOB('display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '''' END
			FROM dl_bordercontrol.visa_name
			WHERE key_value = v.visatypecd
		) AS VISA_TYPE
		, NULL AS MVMNTID
		, (
			SELECT
				CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH''
				THEN
				CASE
				WHEN NVL(LENGTH(NVL(depttnm, deptenm)), 0) <= tr.len
				THEN NVL(depttnm, deptenm)
				ELSE SUBSTR(NVL(depttnm, deptenm), 1, tr.len) || tr.dots
				END
				ELSE
				CASE
				WHEN NVL(LENGTH(NVL(')
|| TO_CLOB('deptenm, depttnm)), 0) <= tr.len
				THEN NVL(deptenm, depttnm)
				ELSE substr(NVL(deptenm, depttnm), 1, tr.len) || tr.dots
				END
				END BORDERPOST
			FROM dl_bordercontrol.v_department
			WHERE dept_seqno = v.dept_seqno
		) AS BORDERPOST
		, NVL(TRIM(v.flightprefix || v.flightnumber), v.convregno) AS VEHICLETYPE
		, ''PIBICS'' AS DATA_SOURCE
		, ''TMINOUT_MA_PRD'' AS DATA_SOURCE_SEC
		, v.seqno AS DATA_SOURCE_SEC_PK_VAL
	FROM dl_bordercontrol.v_tminout_ma_1hr_prod v, trimming tr
	WHERE v.nation')
|| TO_CLOB('cd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(:P17_STATELESS, :P17_NATIONALITY)) --
	AND v.sex = DECODE(:P17_DISPLAY_GENDER, 1, ''M'', 2, ''F'', sex)
	AND (v.birthdte = :P17_DISPLAY_DOB_TEXT OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -4, 4) OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -7, 7) OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -8, 8) OR v.birthdte = ''//'' || SUBSTR(:P17_DISPLAY_DOB_TEXT, -4, 4))
	AND
	(
		v.tdtno = :P17_DISPLAY_DOCNUMBER
		OR
		(
			UPPE')
|| TO_CLOB('R(TRIM(REGEXP_REPLACE(v.efamilynm, ''\s{2,}'', '' ''))) = :P17_DISPLAY_LASTNAME
			AND UPPER(TRIM(REGEXP_REPLACE(v.efirstnm, ''\s{2,}'', '' ''))) || NVL2(TRIM(v.emiddlenm), '' '' || UPPER(TRIM(REGEXP_REPLACE(v.emiddlenm, ''\s{2,}'', '' ''))), NULL) = :P17_DISPLAY_FIRSTNAME || NVL2(:P17_DISPLAY_MIDDLENAME, '' '' || :P17_DISPLAY_MIDDLENAME, NULL)
		)
	)
	AND 
	(
		v.typedata IN (''BIO-PHB'', ''BIO-RETH'')
		OR
		NVL(v.typedata, ''~'') NOT LIKE ''BIO%''
	)
	-- PIBICS PRD tminout_ma end --
	UNION ALL
	-- PIBICS PRD tminout')
|| TO_CLOB(' start --
	SELECT /*+ NO_PARALLEL */
		''<span class="fa fa-search table-link-icon fa-1-5x'' 
		|| CASE WHEN v.typedata IN (''PHB'', ''BIO-PHB'') THEN '' row_red '' END
		|| ''" aria-hidden="true"></span>'' AS LINK
		, ''<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>'' AS USERTYPE
		, (
			SELECT ''<span class="cl-bold '' || DECODE(v.cardtype, 2, '' my_red '', 1, '' my_blue '') || ''" aria-hidden="true" title="'' || display_value$dlc || ''">'' 
			|| NVL(display_value, display_value$dlc)')
|| TO_CLOB(' 
			|| ''</span>''
			FROM dl_common.port_movements$lc WHERE num_value = DECODE(v.cardtype, 2, 1, 1, 0, v.cardtype)
		) AS DIRECTION
		, v.tdtno AS DOCNUMBER
		, v.inoutdte AS TRAVELDATE
		, CASE WHEN v.typedata IN (''ATC'', ''PHB'', ''RETH'', ''BIO-PHB'', ''BIO-RETH'') THEN v.typedata ELSE ''PIBICS'' END AS SOURCE_SYSTEM
		, (
			SELECT SUBSTR(display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '''' END
			FROM dl_bordercontrol.visa_name
			WHERE key_value = v.visatypecd
		')
|| TO_CLOB(') AS VISA_TYPE
		, NULL AS MVMNTID
		, (
			SELECT
				CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH''
				THEN
				CASE
				WHEN NVL(LENGTH(NVL(depttnm, deptenm)), 0) <= tr.len
				THEN NVL(depttnm, deptenm)
				ELSE SUBSTR(NVL(depttnm, deptenm), 1, tr.len) || tr.dots
				END
				ELSE
				CASE
				WHEN NVL(LENGTH(NVL(deptenm, depttnm)), 0) <= tr.len
				THEN NVL(deptenm, depttnm)
				ELSE SUBSTR(NVL(deptenm, depttnm), 1, tr.len) || tr.dots
				END
				END BORDERPOST
		FROM dl_bord')
|| TO_CLOB('ercontrol.v_department
		WHERE dept_seqno = v.dept_seqno
		) AS BORDERPOST
		, NVL(TRIM(v.flightprefix || v.flightnumber), v.convregno) AS VEHICLETYPE
		, ''PIBICS'' AS DATA_SOURCE
		, ''TMINOUT_PRD'' AS DATA_SOURCE_SEC
		, v.seqno AS DATA_SOURCE_SEC_PK_VAL
	FROM dl_bordercontrol.v_tminout_1hr_prod v, trimming tr
	WHERE v.nationcd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(:P17_STATELESS, :P17_NATIONALITY)) --
	AND v.sex = DECODE(:P17_DISPLAY_GENDER, 1, ''M'', 2, ''F'', ')
|| TO_CLOB('sex)
	AND (v.birthdte = :P17_DISPLAY_DOB_TEXT OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -4, 4) OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -7, 7) OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -8, 8) OR v.birthdte = ''//'' || SUBSTR(:P17_DISPLAY_DOB_TEXT, -4, 4))
	AND
	(
		v.tdtno = :P17_DISPLAY_DOCNUMBER
		OR
		(
			UPPER(TRIM(REGEXP_REPLACE(v.efamilynm, ''\s{2,}'', '' ''))) = :P17_DISPLAY_LASTNAME
			AND UPPER(TRIM(REGEXP_REPLACE(v.efirstnm, ''\s{2,}'', '' ''))) || NVL2(TRIM(v.emiddlenm), '' '' || UP')
|| TO_CLOB('PER(TRIM(REGEXP_REPLACE(v.emiddlenm, ''\s{2,}'', '' ''))), NULL) = :P17_DISPLAY_FIRSTNAME || NVL2(:P17_DISPLAY_MIDDLENAME, '' '' || :P17_DISPLAY_MIDDLENAME, NULL)
		)
	)
	AND 
	(
		v.typedata IN (''BIO-PHB'', ''BIO-RETH'')
		OR
		NVL(v.typedata, ''~'') NOT LIKE ''BIO%''
	)
	-- PIBICS PRD tminout end --
	UNION ALL
	-- PIBICS PRD tmmain IN start --
	SELECT /*+ NO_PARALLEL */
		''<span class="fa fa-search table-link-icon fa-1-5x'' 
		|| CASE WHEN v.typedata IN (''PHB'', ''BIO-PHB'') THEN '' row_red '' END
		|| ''" aria-h')
|| TO_CLOB('idden="true"></span>'' AS LINK
		, ''<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>'' AS USERTYPE
		, (
			SELECT ''<span class="cl-bold my_blue" aria-hidden="true" title="'' || display_value$dlc || ''">'' 
			|| NVL(display_value, display_value$dlc) 
			|| ''</span>''
			FROM dl_common.port_movements$lc WHERE num_value = 0
		) AS DIRECTION
		, v.intdtno AS DOCNUMBER
		, v.indte AS TRAVELDATE
		, CASE WHEN v.typedata IN (''ATC'', ''PHB'', ''RETH'', ''BIO-PHB'', ''BIO-RETH'') THEN v.ty')
|| TO_CLOB('pedata ELSE ''PIBICS'' END AS SOURCE_SYSTEM
		, (
			SELECT SUBSTR(display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '''' END
			FROM dl_bordercontrol.visa_name
			WHERE key_value = v.invisatypecd
		) AS VISA_TYPE
		, NULL AS MVMNTID
		, (
			SELECT
				CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH''
				THEN
				CASE
				WHEN NVL(LENGTH(NVL(depttnm, deptenm)), 0) <= tr.len
				THEN NVL(depttnm, deptenm)
				ELSE SUBSTR(NVL(depttnm, deptenm), 1, tr')
|| TO_CLOB('.len) || tr.dots
				END
				ELSE
				CASE
				WHEN NVL(LENGTH(NVL(deptenm, depttnm)), 0) <= tr.len
				THEN NVL(deptenm, depttnm)
				ELSE SUBSTR(NVL(deptenm, depttnm), 1, tr.len) || tr.dots
				END
				END BORDERPOST
			FROM dl_bordercontrol.v_department
			WHERE dept_seqno = v.indept_seqno
		) AS BORDERPOST
		, NVL(TRIM(v.inflightprefix || v.inflightnumber), v.inconvregno) AS VEHICLETYPE
		, ''PIBICS'' AS DATA_SOURCE
		, ''TMMAIN_IN_PRD'' AS DATA_SOURCE_SEC
		, v.tmrunno AS DATA_SOURCE_SEC_PK_VAL')
|| TO_CLOB('
	FROM dl_bordercontrol.v_tmmain_in_1hr_prod v, trimming tr
	WHERE v.indte IS NOT NULL
	AND v.nationcd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(:P17_STATELESS, :P17_NATIONALITY)) --
	AND v.sex = DECODE(:P17_DISPLAY_GENDER, 1, ''M'', 2, ''F'', sex)
	AND (v.birthdte = :P17_DISPLAY_DOB_TEXT OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -4, 4) OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -7, 7) OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -8, 8) OR v.birthdte = ''//'' ')
|| TO_CLOB('|| SUBSTR(:P17_DISPLAY_DOB_TEXT, -4, 4))
	AND
	(
		v.intdtno = :P17_DISPLAY_DOCNUMBER
		OR
		(
			UPPER(TRIM(REGEXP_REPLACE(v.efamilynm, ''\s{2,}'', '' ''))) = :P17_DISPLAY_LASTNAME
			AND UPPER(TRIM(REGEXP_REPLACE(v.efirstnm, ''\s{2,}'', '' ''))) || NVL2(TRIM(v.emiddlenm), '' '' || UPPER(TRIM(REGEXP_REPLACE(v.emiddlenm, ''\s{2,}'', '' ''))), NULL) = :P17_DISPLAY_FIRSTNAME || NVL2(:P17_DISPLAY_MIDDLENAME, '' '' || :P17_DISPLAY_MIDDLENAME, NULL)
		)
	)
	AND 
	(
		v.typedata IN (''BIO-PHB'', ''BIO-RETH'')
		OR
		NVL(')
|| TO_CLOB('v.typedata, ''~'') NOT LIKE ''BIO%''
	)
	-- PIBICS PRD tmmain IN end --
	UNION ALL
	-- PIBICS PRD tmmain OUT start --
	SELECT /*+ NO_PARALLEL */
		''<span class="fa fa-search table-link-icon fa-1-5x'' 
		|| CASE WHEN v.typedata IN (''PHB'', ''BIO-PHB'') THEN '' row_red '' END
		|| ''" aria-hidden="true"></span>'' AS LINK
		, ''<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>'' AS USERTYPE
		, (
			SELECT ''<span class="cl-bold my_red" aria-hidden="true" title="'' || display_value$dlc |')
|| TO_CLOB('| ''">'' 
			|| NVL(display_value, display_value$dlc) 
			|| ''</span>''
			FROM dl_common.port_movements$lc WHERE num_value = 1
		) AS DIRECTION
		, v.outtdtno AS DOCNUMBER
		, v.outdte AS TRAVELDATE
		, CASE WHEN v.typedata IN (''ATC'', ''PHB'', ''RETH'', ''BIO-PHB'', ''BIO-RETH'') THEN v.typedata ELSE ''PIBICS'' END AS SOURCE_SYSTEM
		, (
			SELECT SUBSTR(display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '''' END
			FROM dl_bordercontrol.visa_name
			WHERE key_value = v.ou')
|| TO_CLOB('tvisatypecd
		) AS VISA_TYPE
		, NULL AS MVMNTID
		, (
			SELECT
				CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH''
				THEN
				CASE
				WHEN NVL(LENGTH(NVL(depttnm, deptenm)), 0) <= tr.len
				THEN NVL(depttnm, deptenm)
				ELSE SUBSTR(NVL(depttnm, deptenm), 1, tr.len)||tr.dots
				END
				ELSE
				CASE
				WHEN NVL(LENGTH(NVL(deptenm, depttnm)), 0) <= tr.len
				THEN NVL(deptenm, depttnm)
				ELSE SUBSTR(NVL(deptenm, depttnm), 1, tr.len)||tr.dots
				END
				END BORDERPOST
			F')
|| TO_CLOB('ROM dl_bordercontrol.v_department
			WHERE dept_seqno = v.outdept_seqno) AS BORDERPOST
		, NVL(TRIM(v.outflightprefix || v.outflightnumber), v.outconvregno) AS VEHICLETYPE
		, ''PIBICS'' AS DATA_SOURCE
		, ''TMMAIN_OUT_PRD'' AS DATA_SOURCE_SEC
		, v.tmrunno AS DATA_SOURCE_SEC_PK_VAL
	FROM dl_bordercontrol.v_tmmain_out_1hr_prod v, trimming tr
	WHERE v.outdte IS NOT NULL
	AND v.nationcd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(:P17_STATELESS, :P17_NATIONALITY)) --
	A')
|| TO_CLOB('ND v.sex = DECODE(:P17_DISPLAY_GENDER, 1, ''M'', 2, ''F'', sex)
	AND (v.birthdte = :P17_DISPLAY_DOB_TEXT OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -4, 4) OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -7, 7) OR v.birthdte = SUBSTR(:P17_DISPLAY_DOB_TEXT, -8, 8) OR v.birthdte = ''//'' || SUBSTR(:P17_DISPLAY_DOB_TEXT, -4, 4))
	AND
	(
		v.outtdtno = :P17_DISPLAY_DOCNUMBER
		OR
		(
			UPPER(TRIM(REGEXP_REPLACE(v.efamilynm, ''\s{2,}'', '' ''))) = :P17_DISPLAY_LASTNAME
			AND UPPER(TRIM(REGEXP_REPLACE(v.efirs')
|| TO_CLOB('tnm, ''\s{2,}'', '' ''))) || NVL2(TRIM(v.emiddlenm), '' '' || UPPER(TRIM(REGEXP_REPLACE(v.emiddlenm, ''\s{2,}'', '' ''))), NULL) = :P17_DISPLAY_FIRSTNAME || NVL2(:P17_DISPLAY_MIDDLENAME, '' '' || :P17_DISPLAY_MIDDLENAME, NULL)
		)
	)
	AND 
	(
		v.typedata IN (''BIO-PHB'', ''BIO-RETH'')
		OR
		NVL(v.typedata, ''~'') NOT LIKE ''BIO%''
	)
	-- PIBICS PRD tmmain OUT end --
)
WHERE 1 = 1
ORDER BY traveldate DESC
'),'SQL','P17_TRAVEL_HISTORY','DL_BORDERCONTROL',sysdate,'INITIAL',systimestamp,'INITIAL','I',null,null,':');
