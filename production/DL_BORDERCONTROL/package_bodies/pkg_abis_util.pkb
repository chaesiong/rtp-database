CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_ABIS_UTIL" as

    function getparameter(p_name in varchar2) return varchar2 as
    begin
      return pkg_common.get_parameter(p_name);
    end;

    function base64encode__(p_clob in blob) return clob as
    begin
      if p_clob is null then
        return null;
      end if;
      return dl_common.pkg_util.encode_base64(p_clob);
    end;


  -- START: base64encode **************************************************************************************************************************************************************
    function base64encode(p_blob in blob) return clob is

      -- Variables
        l_clob clob := '';
        l_step pls_integer := 12000; -- make sure you set a multiple of 3 not higher than 24573
        l_temp varchar2(32000);
        l_size number;
        l_pos number;
        l_remaining number;
        l_read number;
        l_outsize number;

      -- Logger
        l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.base64encode';
        l_params logger.tab_param;

    begin

        if p_blob is null then
            return null;
        end if;

        l_size := dbms_lob.getlength(p_blob);
        l_pos := 0;
        while l_pos < l_size loop
            l_read := l_size - l_pos;
            if l_read > l_step then
                l_read := l_step;
            end if;

            l_clob := l_clob || replace(replace(utl_raw.cast_to_varchar2(utl_encode.base64_encode(dbms_lob.substr(p_blob, l_read, l_pos + 1))), chr(13)), chr(10));
            l_outsize := dbms_lob.getlength(l_clob);
            l_pos := l_pos + l_read;
        end loop;
        return l_clob;


    -- Exception handler ******************************************************************************************************
      exception when others then
          logger.log_error(l_scope || ': ERROR', l_scope, null, l_params);
          raise;

    end;
  -- END: base64encode ****************************************************************************************************************************************************************




  -- START: HtpReqPrn **************************************************************************************************************************************************************
    procedure HtpReqPrn(p_req in out nocopy utl_http.req, pclob in clob) is


        v_bufsize number := 2000;
        v_excel varchar2(2000);
        v_amount number;
        v_clob clob := pclob;
        v_idx number := 1;
        v_len number := dbms_lob.getlength(v_clob);
        v_log varchar2(4000);

     -- Logger
        l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.HtpReqPrn';
        l_params logger.tab_param;
    begin


      loop

          v_excel := null;

          if v_idx + v_bufsize > v_len then
              v_amount := v_len - v_idx + 1;
              dbms_lob.read(v_clob, v_amount, v_idx, v_excel);
              utl_http.write_text(p_req, v_excel);
              exit;
          else
              v_amount := v_bufsize;
              dbms_lob.read(v_clob, v_amount, v_idx, v_excel);
              utl_http.write_text(p_req, v_excel);
          end if;
          v_idx := v_idx + v_amount;

      end loop;
      --commit;

    -- Exception handler ******************************************************************************************************
      exception when others then
          logger.log_error(l_scope || ': ERROR', l_scope, null, l_params);
          raise;

    end;
  -- END: HtpReqPrn **************************************************************************************************************************************************************



  -- START: htpsend **************************************************************************************************************************************************************
    function htpsend(p_req in out nocopy utl_http.req, p_senddata in clob) return clob as


        -- Variables
          v_req utl_http.req := p_req;
          v_res utl_http.resp;
          v_result clob := null;

        -- Logger
          l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.htpsend';
          l_params logger.tab_param;

    begin
        if p_senddata is not null then
          HtpReqPrn(p_req, p_senddata);
        end if;

        v_res := utl_http.get_response(v_req);

        declare
          v_buffer clob;
        begin
          loop
            utl_http.read_line(v_res, v_buffer);
            v_result := v_result || v_buffer;
          end loop;
          utl_http.end_response(v_res);
        exception when utl_http.end_of_body then
          utl_http.end_response(v_res);
        end;

        return v_result;

    -- Exception handler ******************************************************************************************************
      exception when others then
          logger.log_error(l_scope || ': ERROR', l_scope, null, l_params);
          raise;

    end;
  -- END: htpsend **************************************************************************************************************************************************************


  -- START: call_rest **************************************************************************************************************************************************************
    function call_rest(  p_url in varchar2
                        , p_method in varchar2
                        , p_senddata in out nocopy clob
                      ) return clob as

        -- Variables
          v_req utl_http.req;

        -- Logger
          l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.call_rest';
          l_params logger.tab_param;

    begin

      utl_http.set_proxy(proxy=>null);
      v_req := utl_http.begin_request(p_url, p_method);
      utl_http.set_header(v_req, 'user-agent', 'apex/cbms');
      if p_senddata is not null then
        utl_http.set_header(v_req, 'content-type', 'application/json');
        utl_http.set_header(v_req, 'content-length', length(p_senddata));
      end if;
      return htpsend(v_req, p_senddata);


    -- Exception handler ******************************************************************************************************
      exception when others then
          logger.log_error(l_scope || ': ERROR', l_scope, null, l_params);
          raise;

    end;
  -- END: call_rest **************************************************************************************************************************************************************



  -- START: get_abis_url **************************************************************************************************************************************************************
    function get_abis_url return varchar2 as

        -- Variables
          v_protocol varchar2(255);
          v_host varchar2(255);
          v_port number;

        -- Logger
          l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.get_abis_url';
          l_params logger.tab_param;

    begin

      v_protocol := owa_util.get_cgi_env('REQUEST_PROTOCOL');
      v_host := owa_util.get_cgi_env('SERVER_NAME');
      v_port := to_number(owa_util.get_cgi_env('SERVER_PORT'));

      if v_protocol is null then
        v_protocol := 'http';
      end if;

      return v_protocol || '://' || v_host || ':' || to_char(v_port) || '/bpm/travelAbis/';


      -- Exception handler ******************************************************************************************************
        exception when others then
            logger.log_error(l_scope || ': ERROR', l_scope, null, l_params);
            raise;
    end;
  -- END: get_abis_url **************************************************************************************************************************************************************




  -- START: add_face_json **************************************************************************************************************************************************************
    procedure add_face_json(
                  p_face in clob
                , p_clob in out nocopy clob
              ) as

        -- Logger
          l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.add_face_json';
          l_params logger.tab_param;

    begin

        p_clob := p_clob || '"faces":[{"image":{"data":"';
        p_clob := p_clob || p_face;
        p_clob := p_clob || '"}}]';


      -- Exception handler ******************************************************************************************************
        exception when others then
            logger.log_error(l_scope || ': ERROR', l_scope, null, l_params);
            raise;
    end;
  -- END: add_face_json **************************************************************************************************************************************************************



  -- START: add_finger_json **************************************************************************************************************************************************************
    procedure add_finger_json (
                                  p_image in clob
                                , p_position in number
                                , p_clob in out nocopy clob
                              ) as

        -- Logger
          l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.add_finger_json';
          l_params logger.tab_param;

    begin


        --p_clob := p_clob || '{"Image":{"ImageData":"';
        p_clob := p_clob || '{"image":{"data":"';
        p_clob := p_clob || p_image;
        --p_clob := p_clob || '"},"ImpressionType":0,"Position":';
        p_clob := p_clob || '"},"nistImpressionType":0,"nistPosition":';
        p_clob := p_clob || to_char(p_position);
        p_clob := p_clob || '}';



      -- Exception handler ******************************************************************************************************
        exception when others then
            logger.log_error('ERROR', l_scope, null, l_params);
            raise;

    end;
  -- END: add_finger_json **************************************************************************************************************************************************************





  -- START: add_fingerprints_json **************************************************************************************************************************************************************
    procedure add_fingerprints_json(  p_fp01 in clob
                                      , p_fp02 in clob
                                      , p_fp03 in clob
                                      , p_fp04 in clob
                                      , p_fp05 in clob
                                      , p_fp06 in clob
                                      , p_fp07 in clob
                                      , p_fp08 in clob
                                      , p_fp09 in clob
                                      , p_fp10 in clob
                                      , p_clob in out nocopy clob
                                  ) as


        v_comma varchar2(255) := '';

        -- Logger
          l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.add_fingerprints_json';
          l_params logger.tab_param;

    begin

        logger.log(upper(l_scope) || ': START', l_scope, null, l_params);

        -- logger.log('CLOB: ' || dbms_lob.getlength(p_clob), l_scope, null, l_params);
        -- m. langer clob concatenation function in dl_common and in the following lines implemented
          p_clob := dl_common.f_concat_clob(p_clob, '"binarySizes":{');
          p_clob := dl_common.f_concat_clob(p_clob, '"fp01":' || nvl(dbms_lob.getlength(p_fp01), 0) || ',');
          p_clob := dl_common.f_concat_clob(p_clob, '"fp02":' || nvl(dbms_lob.getlength(p_fp02), 0) || ',');
          p_clob := dl_common.f_concat_clob(p_clob, '"fp03":' || nvl(dbms_lob.getlength(p_fp03), 0) || ',');
          p_clob := dl_common.f_concat_clob(p_clob, '"fp04":' || nvl(dbms_lob.getlength(p_fp04), 0) || ',');
          p_clob := dl_common.f_concat_clob(p_clob, '"fp05":' || nvl(dbms_lob.getlength(p_fp05), 0) || ',');
          p_clob := dl_common.f_concat_clob(p_clob, '"fp06":' || nvl(dbms_lob.getlength(p_fp06), 0) || ',');
          p_clob := dl_common.f_concat_clob(p_clob, '"fp07":' || nvl(dbms_lob.getlength(p_fp07), 0) || ',');
          p_clob := dl_common.f_concat_clob(p_clob, '"fp08":' || nvl(dbms_lob.getlength(p_fp08), 0) || ',');
          p_clob := dl_common.f_concat_clob(p_clob, '"fp09":' || nvl(dbms_lob.getlength(p_fp09), 0) || ',');
          p_clob := dl_common.f_concat_clob(p_clob, '"fp10":' || nvl(dbms_lob.getlength(p_fp10), 0));
          p_clob := dl_common.f_concat_clob(p_clob, '},');
          p_clob := dl_common.f_concat_clob(p_clob, '"fingerprints":[');



          if length(p_fp01) > 0 then
            p_clob := p_clob || v_comma;
            add_finger_json(p_fp01, 1, p_clob);
            v_comma := ',';
          end if;

          if length(p_fp02) > 0 then
            p_clob := p_clob || v_comma;
            add_finger_json(p_fp02, 2, p_clob);
            v_comma := ',';
          end if;

          if length(p_fp03) > 0 then
            p_clob := p_clob || v_comma;
            add_finger_json(p_fp03, 3, p_clob);
            v_comma := ',';
          end if;

          if length(p_fp04) > 0 then
            p_clob := p_clob || v_comma;
            add_finger_json(p_fp04, 4, p_clob);
            v_comma := ',';
          end if;

          if length(p_fp05) > 0 then
            p_clob := p_clob || v_comma;
            add_finger_json(p_fp05, 5, p_clob);
            v_comma := ',';
          end if;

          if length(p_fp06) > 0 then
            p_clob := p_clob || v_comma;
            add_finger_json(p_fp06, 6, p_clob);
            v_comma := ',';
          end if;

          if length(p_fp07) > 0 then
            p_clob := p_clob || v_comma;
            add_finger_json(p_fp07, 7, p_clob);
            v_comma := ',';
          end if;

          if length(p_fp08) > 0 then
            p_clob := p_clob || v_comma;
            add_finger_json(p_fp08, 8, p_clob);
            v_comma := ',';
          end if;

          if length(p_fp09) > 0 then
            p_clob := p_clob || v_comma;
            add_finger_json(p_fp09, 9, p_clob);
            v_comma := ',';
          end if;

          if length(p_fp10) > 0 then
            p_clob := p_clob || v_comma;
            add_finger_json(p_fp10, 10, p_clob);
            v_comma := ',';
          end if;

          p_clob := p_clob || ']';


        logger.log(upper(l_scope) || ': END', l_scope, null, l_params);

      -- Exception handler ******************************************************************************************************
        exception when others then
            logger.log_error(l_scope || ': ERROR', l_scope, null, l_params);
            raise;

    end;
  -- END: add_fingerprints_json **************************************************************************************************************************************************************




  -- START: build_biometric_json **************************************************************************************************************************************************************
    function build_biometric_json(
                                    p_face in blob
                                  , p_fp01 in blob
                                  , p_fp02 in blob
                                  , p_fp03 in blob
                                  , p_fp04 in blob
                                  , p_fp05 in blob
                                  , p_fp06 in blob
                                  , p_fp07 in blob
                                  , p_fp08 in blob
                                  , p_fp09 in blob
                                  , p_fp10 in blob
                              ) return clob as

      -- Variables
        v_result clob := 'null';
        v_has_face boolean := p_face is not null;
        v_has_finger boolean := false;
        v_comma varchar2(10) := '';

      -- Logger
        l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.build_biometric_json';
        l_params logger.tab_param;

    begin


        v_has_finger := v_has_finger or p_fp01 is not null;
        v_has_finger := v_has_finger or p_fp02 is not null;
        v_has_finger := v_has_finger or p_fp03 is not null;
        v_has_finger := v_has_finger or p_fp04 is not null;
        v_has_finger := v_has_finger or p_fp05 is not null;
        v_has_finger := v_has_finger or p_fp06 is not null;
        v_has_finger := v_has_finger or p_fp07 is not null;
        v_has_finger := v_has_finger or p_fp08 is not null;
        v_has_finger := v_has_finger or p_fp09 is not null;
        v_has_finger := v_has_finger or p_fp10 is not null;


        if v_has_face or v_has_finger then
          v_result := '{';

          if v_has_face then
            add_face_json(base64encode(p_face), v_result);
            v_comma := ',';
          end if;

          if v_has_finger then
            v_result := v_result || v_comma;
            add_fingerprints_json(base64encode(p_fp01), base64encode(p_fp02), base64encode(p_fp03), base64encode(p_fp04), base64encode(p_fp05), base64encode(p_fp06), base64encode(p_fp07), base64encode(p_fp08), base64encode(p_fp09), base64encode(p_fp10), v_result);
          end if;

          v_result := v_result || '}';
        end if;


        return v_result;


      -- Exception handler ******************************************************************************************************
        exception when others then
            logger.log_error('ERROR', l_scope, null, l_params);
            raise;
    end;
  -- END: build_biometric_json ****************************************************************************************************************************************************************





    function abis_insert_images(p_face in blob
                              , p_fp01 in blob
                              , p_fp02 in blob
                              , p_fp03 in blob
                              , p_fp04 in blob
                              , p_fp05 in blob
                              , p_fp06 in blob
                              , p_fp07 in blob
                              , p_fp08 in blob
                              , p_fp09 in blob
                              , p_fp10 in blob
                              , p_error in out nocopy clob
                              ) return number as

      -- Variables
        v_res clob;
        v_data clob;

      -- Logger
        l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.abis_insert_images';
        l_params logger.tab_param;

    begin
        v_data := '{"biometric":' || build_biometric_json(p_face, p_fp01, p_fp02, p_fp03, p_fp04, p_fp05, p_fp06, p_fp07, p_fp08, p_fp09, p_fp10) || '}';

        v_res := call_rest(get_abis_url() || 'insert', 'POST', v_data);

        begin
          return to_number(v_res);
        exception when others then
          p_error := p_error || v_res;
          return null;
        end;



      -- Exception handler ******************************************************************************************************
        exception when others then
            logger.log_error('ERROR', l_scope, null, l_params);


    end abis_insert_images;


  -- START: abis_insert_images ****************************************************************************************************************************************************************
    function abis_insert_images(p_face in blob
                              , p_fp01 in blob
                              , p_fp02 in blob
                              , p_fp03 in blob
                              , p_fp04 in blob
                              , p_fp05 in blob
                              , p_fp06 in blob
                              , p_fp07 in blob
                              , p_fp08 in blob
                              , p_fp09 in blob
                              , p_fp10 in blob
                              ) return number as

      -- Variables
        v_res clob;
        v_data clob := '';

      -- Logger
        l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.abis_insert_images';
        l_params logger.tab_param;
    --
    begin
      return abis_insert_images(p_face, p_fp01, p_fp02, p_fp03, p_fp04, p_fp05, p_fp06, p_fp07, p_fp08, p_fp09, p_fp10, v_data);
    end abis_insert_images;
  -- END: abis_insert_images ******************************************************************************************************************************************************************



  -- START: abis_update_images ****************************************************************************************************************************************************************
    procedure abis_update_images(
                                    p_abisid in number
                                  , p_face in blob
                                  , p_fp01 in blob
                                  , p_fp02 in blob
                                  , p_fp03 in blob
                                  , p_fp04 in blob
                                  , p_fp05 in blob
                                  , p_fp06 in blob
                                  , p_fp07 in blob
                                  , p_fp08 in blob
                                  , p_fp09 in blob
                                  , p_fp10 in blob
                               ) as

      v_res clob;
      v_data clob;

      -- Logger
        l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.abis_update_images';
        l_params logger.tab_param;

    begin


      v_data := '{"abisId":' || to_char(p_abisid) || ',"biometric":' || build_biometric_json(p_face, p_fp01, p_fp02, p_fp03, p_fp04, p_fp05, p_fp06, p_fp07, p_fp08, p_fp09, p_fp10) || '}';
      v_res := call_rest(get_abis_url() || 'update', 'POST', v_data);


      -- Exception handler ******************************************************************************************************
        exception when others then
            logger.log_error('ERROR', l_scope, null, l_params);

    end abis_update_images;
  -- END: abis_update_images ****************************************************************************************************************************************************************





  -- START: abis_delete *********************************************************************************************************************************************************************
    procedure abis_delete( p_abisid in number ) as

          v_res clob;
          v_data clob := null;

        -- Logger
          l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.abis_delete';
          l_params logger.tab_param;
    begin

          v_res := call_rest(get_abis_url() || '/delete/' || to_char(p_abisid), 'DELETE', v_data);


        -- Exception handler ******************************************************************************************************
          exception when others then
              logger.log_error('ERROR', l_scope, null, l_params);

    end abis_delete;
  -- END: abis_delete ***********************************************************************************************************************************************************************





  -- START: abis_parse_result ***************************************************************************************************************************************************************
    function abis_parse_result(p_result in clob) return tbl_search_row pipelined as

        -- Variables
          v_parse_row search_row := null;
          v_systems WWV_FLOW_T_VARCHAR2;
          v_candidate_cnt PLS_INTEGER;
          l_obj JSON_OBJECT_T;
          l_candidates JSON_ARRAY_T;
          l_candidate JSON_OBJECT_T;

        -- Logger
          l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.abis_parse_result';
          l_params logger.tab_param;

    begin


      if p_result is not null then

          l_obj := JSON_OBJECT_T(p_result);

          if l_obj.has('candidates') then
              l_candidates := l_obj.get_array('candidates');
              for i in 0 .. l_candidates.get_size - 1 loop
                  l_candidate := treat(l_candidates.get(i) as JSON_OBJECT_T);
                  v_parse_row.abisid := l_candidate.get_number('abisId');
                  v_parse_row.score := l_candidate.get_number('score');
                  pipe row(v_parse_row);
              end loop;
		  end if;
        end if;

      -- Exception handler ******************************************************************************************************
        exception when others then
            logger.log_error('ERROR', l_scope, null, l_params);

    end;
  -- END: abis_parse_result *****************************************************************************************************************************************************************




  -- START: abis_search *********************************************************************************************************************************************************************
    function abis_search(  p_face in blob
                          , p_fp01 in blob
                          , p_fp02 in blob
                          , p_fp03 in blob
                          , p_fp04 in blob
                          , p_fp05 in blob
                          , p_fp06 in blob
                          , p_fp07 in blob
                          , p_fp08 in blob
                          , p_fp09 in blob
                          , p_fp10 in blob
                        ) return tbl_search_result pipelined as

        -- Variables
          v_row search_result;
          v_res clob;
          v_res_faceonly clob;
          v_data clob;
          v_url varchar2(255);
          v_min_face_percent number := to_number(getparameter('ABIS_BL_FACE_TH'));
          v_min_fusion_percent number := to_number(getparameter('ABIS_BL_FUSION_TH'));

        -- Logger
          l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.abis_search';
          l_params logger.tab_param;
  begin

        v_url := get_abis_url() || 'search';
        v_data := '{"biometric":' || build_biometric_json(p_face, p_fp01, p_fp02, p_fp03, p_fp04, p_fp05, p_fp06, p_fp07, p_fp08, p_fp09, p_fp10) || '}';
        v_res := call_rest(v_url, 'POST', v_data);
        for c_row in (
                        select  scoretype
                                , abisid
                                , score
                                , percentage
                        from    ( select *
                                  from    ( select  scoretype
                                                    , abisid
                                                    , score
                                                    , percentage
                                                    , row_number() over (partition by abisid order by score desc, scoretype desc) rn
                                            from    (
                                                      select  fusion.score
                                                              , fusion.abisid
                                                              , fusion.score / 100 percentage
                                                              , 'fusion' scoretype
                                                      from    table(abis_parse_result(v_res)) fusion
                                                    )
                                          )
                                  where rn = 1
                                ) scores
                    ) loop

            v_row.abisid := c_row.abisid;
            v_row.score := c_row.score;
            v_row.score_type := c_row.scoretype;
            v_row.score_percentage := least(1, c_row.percentage) * 100;
            pipe row(v_row);
        end loop;


      -- Exception handler ******************************************************************************************************
        exception when others then
            logger.log_error('ERROR', l_scope, null, l_params);

  end abis_search;
  -- END: abis_search ***********************************************************************************************************************************************************************

end;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_ABIS_UTIL" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_ABIS_UTIL" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_ABIS_UTIL" TO "BIOSUPPORT";
