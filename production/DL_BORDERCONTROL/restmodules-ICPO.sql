
-- Generated by ORDS REST Data Services 18.4.0.r3541002
-- Schema: DL_BORDERCONTROL Date: removed for diff
--

BEGIN
  ORDS.ENABLE_SCHEMA(
      p_enabled             => TRUE,
      p_schema              => 'DL_BORDERCONTROL',
      p_url_mapping_type    => 'BASE_PATH',
      p_url_mapping_pattern => 'dl_bordercontrol',
      p_auto_rest_auth      => FALSE);

  ORDS.DEFINE_MODULE(
      p_module_name    => 'ICPO',
      p_base_path      => '/ICPO/',
      p_items_per_page => 0,
      p_status         => 'PUBLISHED',
      p_comments       => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'ICPO',
      p_pattern        => 'search',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'ICPO',
      p_pattern        => 'search',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_items_per_page => 0,
      p_mimes_allowed  => 'application/json',
      p_comments       => NULL,
      p_source         =>
'DECLARE
    v_status_code INTEGER;
    v_status_msg  VARCHAR2(4000);
    v_JS_Status   JSON_OBJECT_T;
    v_Result      clob;
    v_Buffer      varchar2(16384);
    v_Offset      integer := 1;
    v_Amount      integer := 16384;
    v_SQLCODE     number;
    v_SQLERRM     varchar2(32767);
BEGIN
    v_JS_Status := JSON_OBJECT_T();
    OWA_UTIL.mime_header(''application/json'', true, ''UTF-8'');

    DL_BORDERCONTROL.PKG_ICPO_UTIL.search_icpo(p_request_clob => DL_COMMON.PKG_UTIL.BLOB2CLOB(:body)
                                               , p_response_status_code => v_status_code
                                               , p_response_status_msg => v_status_msg
                                               , p_response_clob => v_Result
                                               );

    BEGIN
        v_JS_Status.put(''code'', v_status_code);
        v_JS_Status.put(''message'', v_status_msg);
        v_JS_Status.put_Null(''stack'');

        htp.prn(''{"status":'');
        htp.prn(v_JS_Status.Stringify());
        htp.prn('',"candidates":'');

        LOOP
            DBMS_LOB.read(v_Result, v_Amount, v_Offset, v_Buffer);
            v_Offset := v_Offset + v_Amount;
            htp.prn(v_Buffer);
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            htp.prn(''}'');
            DL_COMMON.PKG_UTIL.FreeTempLOB(v_Result);
        WHEN others THEN
            DL_COMMON.PKG_UTIL.FormatErrMsg(v_SQLCODE, v_SQLERRM);
            DL_COMMON.PKG_UTIL.FreeTempLOB(v_Result);
            Raise_application_error(v_SQLCODE, v_SQLERRM);
    END;

EXCEPTION
    WHEN OTHERS THEN
        DL_COMMON.PKG_UTIL.FormatErrMsg(v_SQLCODE, v_SQLERRM);
        v_JS_Status.put(''code'', -1);
        v_JS_Status.put(''message'', ''ERROR'');
        v_JS_Status.put(''stack'', v_SQLERRM);
        htp.prn(''{"status":'');
        htp.prn(v_JS_Status.Stringify());
        htp.prn('',"candidates":{}'');
        htp.prn(''}'');
END;');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'ICPO',
      p_pattern        => 'search/SLTD',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'ICPO',
      p_pattern        => 'search/SLTD',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_items_per_page => 0,
      p_mimes_allowed  => 'application/json',
      p_comments       => NULL,
      p_source         =>
'DECLARE
    v_status_code INTEGER;
    v_status_msg  VARCHAR2(4000);
    v_JS_Status   JSON_OBJECT_T;
    v_Result      clob;
    v_Buffer      varchar2(16384);
    v_Offset      integer := 1;
    v_Amount      integer := 16384;
    v_SQLCODE     number;
    v_SQLERRM     varchar2(32767);
BEGIN
    v_JS_Status := JSON_OBJECT_T();
    OWA_UTIL.mime_header(''application/json'', true, ''UTF-8'');

    DL_BORDERCONTROL.PKG_ICPO_UTIL.search_icpo(p_request_clob => DL_COMMON.PKG_UTIL.BLOB2CLOB(:body)
                                               , p_request_type => ''SLTD''
                                               , p_response_status_code => v_status_code
                                               , p_response_status_msg => v_status_msg
                                               , p_response_clob => v_Result
                                               );

    BEGIN
        v_JS_Status.put(''code'', v_status_code);
        v_JS_Status.put(''message'', v_status_msg);
        v_JS_Status.put_Null(''stack'');

        htp.prn(''{"status":'');
        htp.prn(v_JS_Status.Stringify());
        htp.prn('',"candidates":'');

        LOOP
            DBMS_LOB.read(v_Result, v_Amount, v_Offset, v_Buffer);
            v_Offset := v_Offset + v_Amount;
            htp.prn(v_Buffer);
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            htp.prn(''}'');
            DL_COMMON.PKG_UTIL.FreeTempLOB(v_Result);
        WHEN others THEN
            DL_COMMON.PKG_UTIL.FormatErrMsg(v_SQLCODE, v_SQLERRM);
            DL_COMMON.PKG_UTIL.FreeTempLOB(v_Result);
            Raise_application_error(v_SQLCODE, v_SQLERRM);
    END;

EXCEPTION
    WHEN OTHERS THEN
        DL_COMMON.PKG_UTIL.FormatErrMsg(v_SQLCODE, v_SQLERRM);
        v_JS_Status.put(''code'', -1);
        v_JS_Status.put(''message'', ''ERROR'');
        v_JS_Status.put(''stack'', v_SQLERRM);
        htp.prn(''{"status":'');
        htp.prn(v_JS_Status.Stringify());
        htp.prn('',"candidates":{}'');
        htp.prn(''}'');
END;');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'ICPO',
      p_pattern        => 'search/TDAWN',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'ICPO',
      p_pattern        => 'search/TDAWN',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_items_per_page => 0,
      p_mimes_allowed  => 'application/json',
      p_comments       => NULL,
      p_source         =>
'DECLARE
    v_status_code INTEGER;
    v_status_msg  VARCHAR2(4000);
    v_JS_Status   JSON_OBJECT_T;
    v_Result      clob;
    v_Buffer      varchar2(16384);
    v_Offset      integer := 1;
    v_Amount      integer := 16384;
    v_SQLCODE     number;
    v_SQLERRM     varchar2(32767);
BEGIN
    v_JS_Status := JSON_OBJECT_T();
    OWA_UTIL.mime_header(''application/json'', true, ''UTF-8'');

    DL_BORDERCONTROL.PKG_ICPO_UTIL.search_icpo(p_request_clob => DL_COMMON.PKG_UTIL.BLOB2CLOB(:body)
                                               , p_request_type => ''TDAWN''
                                               , p_response_status_code => v_status_code
                                               , p_response_status_msg => v_status_msg
                                               , p_response_clob => v_Result
                                               );

    BEGIN
        v_JS_Status.put(''code'', v_status_code);
        v_JS_Status.put(''message'', v_status_msg);
        v_JS_Status.put_Null(''stack'');

        htp.prn(''{"status":'');
        htp.prn(v_JS_Status.Stringify());
        htp.prn('',"candidates":'');

        LOOP
            DBMS_LOB.read(v_Result, v_Amount, v_Offset, v_Buffer);
            v_Offset := v_Offset + v_Amount;
            htp.prn(v_Buffer);
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            htp.prn(''}'');
            DL_COMMON.PKG_UTIL.FreeTempLOB(v_Result);
        WHEN others THEN
            DL_COMMON.PKG_UTIL.FormatErrMsg(v_SQLCODE, v_SQLERRM);
            DL_COMMON.PKG_UTIL.FreeTempLOB(v_Result);
            Raise_application_error(v_SQLCODE, v_SQLERRM);
    END;

EXCEPTION
    WHEN OTHERS THEN
        DL_COMMON.PKG_UTIL.FormatErrMsg(v_SQLCODE, v_SQLERRM);
        v_JS_Status.put(''code'', -1);
        v_JS_Status.put(''message'', ''ERROR'');
        v_JS_Status.put(''stack'', v_SQLERRM);
        htp.prn(''{"status":'');
        htp.prn(v_JS_Status.Stringify());
        htp.prn('',"candidates":{}'');
        htp.prn(''}'');
END;');



COMMIT;

END;


/
timing for: TIMER_REST_EXPORT
Elapsed: 00:00:00.02
