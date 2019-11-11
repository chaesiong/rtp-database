CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BLACKLIST"."PKG_CAMUNDA_REST" IS
    /**
    * ========================================================================
      History
      ========================================================================
      Date        Author              Description
      ----------  -----------------   ---------------------------------
      26.09.2018  e1jkropp            THA20675-1816
      26.10.2018  e1RStopp            THA20675-1892
    * ========================================================================<br/>
    */
    -- Scope for Logger
    g_scope_prefix CONSTANT VARCHAR2(62) := lower($$plsql_unit_owner) || '.' ||
                                            lower($$PLSQL_UNIT) || '.';

    /*
    *   Gets Camunda-Server-Url
    */
    FUNCTION get_camunda_server_url RETURN VARCHAR2 IS

        l_url    VARCHAR2(4000 CHAR);
        l_server VARCHAR2(4000 CHAR);
    BEGIN
        l_server := coalesce(owa_util.get_cgi_env('HTTP_HOST'),
                             utl_inaddr.get_host_address);

        IF instr(l_server,
                 ':') > 0
        THEN
            l_server := substr(l_server,
                               1,
                               instr(l_server,
                                     ':') - 1);
        END IF;

        l_url := owa_util.get_cgi_env('REQUEST_PROTOCOL') || '://' ||
                 l_server || '/bpm';

        RETURN l_url;

    END get_camunda_server_url;

    /*
    *   Parsing JSON-Response of Send-JSON-Request Call
    */
    PROCEDURE parse_response_error
    (
        i_json_response IN CLOB,
        o_timestamp     OUT VARCHAR2,
        o_status        OUT NUMBER,
        o_error         OUT VARCHAR2,
        o_exception     OUT VARCHAR2,
        o_message       OUT VARCHAR2,
        o_path          OUT VARCHAR2
    ) IS
    BEGIN
        apex_json.parse(i_json_response);

        o_timestamp := apex_json.get_varchar2('timestamp');
        o_status    := apex_json.get_number('status');
        o_error     := apex_json.get_varchar2('error');
        o_exception := apex_json.get_varchar2('exception');
        o_message   := apex_json.get_varchar2('message');
        o_path      := apex_json.get_varchar2('path');

    EXCEPTION
        WHEN OTHERS THEN
            raise_application_error(-20001,
                                    'Could not parse response json');
    END;

    /*
    *   Sends JSON-Request via UTL_HTTP
    *   Should be replaced by an common Procudure
    */
    PROCEDURE send_json_request
    (
        i_request     IN CLOB,
        i_method      IN VARCHAR2,
        i_url         IN VARCHAR2,
        o_http_status OUT NUMBER,
        o_response    OUT CLOB,
        o_timestamp   OUT VARCHAR2,
        o_status      OUT NUMBER,
        o_error       OUT VARCHAR2,
        o_exception   OUT VARCHAR2,
        o_message     OUT VARCHAR2,
        o_path        OUT VARCHAR2
    ) IS
        l_http_request  utl_http.req;
        l_http_response utl_http.resp;

        l_response CLOB;

        l_buffer      VARCHAR2(32767);
        l_offset      PLS_INTEGER := 1;
        l_chunk_sz    PLS_INTEGER := 8000;
        l_end_of_body BOOLEAN := FALSE;

        l_params logger.tab_param;
        l_scope  logger_logs.scope%TYPE := g_scope_prefix ||
                                           'send_json_request';

    BEGIN
        -------------------------------------------------------------------------------------------
        -- Init
        -------------------------------------------------------------------------------------------
        logger.append_param(l_params,
                            'i_method',
                            i_method);

        logger.append_param(l_params,
                            'i_url',
                            i_method);

        logger.log(p_text   => 'START',
                   p_scope  => l_scope,
                   p_extra  => i_request,
                   p_params => l_params);

        -------------------------------------------------------------------------------------------
        -- Send Request
        -------------------------------------------------------------------------------------------
        dbms_lob.createtemporary(l_response,
                                 TRUE,
                                 dbms_lob.call);

        -- Check Parm
        IF i_method NOT IN ('POST',
                            'GET',
                            'PUT',
                            'DELETE')
        THEN
            raise_application_error(-20001,
                                    'Wrong parameter [' ||
                                    nvl(i_method,
                                        'NULL') || '] for i_method.');
        END IF;

        IF i_url IS NULL
        THEN
            raise_application_error(-20002,
                                    'URL must not be empty');
        END IF;

        -- Make a HTTP request
        l_http_request := utl_http.begin_request(url    => i_url,
                                                 method => i_method);

        utl_http.set_header(r     => l_http_request,
                            NAME  => 'Content-Type',
                            VALUE => 'application/json');

        IF length(i_request) > 0
        THEN
            utl_http.set_header(r     => l_http_request,
                                NAME  => 'Content-Length',
                                VALUE => length(i_request));
        END IF;

        WHILE l_offset <= dbms_lob.getlength(i_request)
        LOOP
            utl_http.write_text(r    => l_http_request,
                                data => dbms_lob.substr(i_request,
                                                        l_chunk_sz,
                                                        l_offset));

            l_offset := l_offset + l_chunk_sz;
        END LOOP;

        -- Get Response
        l_http_response := utl_http.get_response(r => l_http_request);

        WHILE NOT (l_end_of_body)
        LOOP
            BEGIN
                utl_http.read_text(r    => l_http_response,
                                   data => l_buffer,
                                   len  => 32767);

                IF l_buffer IS NOT NULL AND length(l_buffer) > 0
                THEN
                    dbms_lob.writeappend(l_response,
                                         length(l_buffer),
                                         l_buffer);
                END IF;

            EXCEPTION
                WHEN utl_http.end_of_body THEN
                    l_end_of_body := TRUE;
            END;
        END LOOP;

        utl_http.end_request(l_http_request);
        utl_http.end_response(l_http_response);

        o_http_status := l_http_response.status_code;
        o_response    := l_response;

        parse_response_error(i_json_response => l_response,
                             o_timestamp     => o_timestamp,
                             o_status        => o_status,
                             o_error         => o_error,
                             o_exception     => o_exception,
                             o_message       => o_message,
                             o_path          => o_path);
    EXCEPTION
        WHEN OTHERS THEN
            logger.log_error(p_text   => 'Unhandled Exception',
                             p_scope  => l_scope,
                             p_extra  => l_response,
                             p_params => l_params);
            RAISE;
    END;

    /*
    *   Gets Biometric Data: Fingerprints and Faces JSON
    *   for use in View V_BLACKLIST_CASES
    */
    FUNCTION get_biometric_data$json(i_blacklist_case_id VARCHAR2)
        RETURN VARCHAR2 IS
        l_tab_fingerprints dl_blacklist.pkg_db_access.fingerprint_guid_1_tt;
        l_tab_faces        dl_blacklist.pkg_db_access.face_guid_1_tt;
        l_abis_id          dl_blacklist.biometrics.abis_id%TYPE;
        l_biometric_id     dl_blacklist.biometrics.id%TYPE;
        l_jarr_finger      json_array_t;
        l_jarr_faces       json_array_t;
        l_jobj_biometric   json_object_t;
    BEGIN
        SELECT abis_id,
               id
        INTO   l_abis_id,
               l_biometric_id
        FROM   dl_blacklist.biometrics b
        WHERE  b.blacklist_case_id = i_blacklist_case_id;

        BEGIN
            -- Fingerprints
            SELECT f.image_id, -- guid
                   it.ordinal, -- nistImpressionType
                   fp.ordinal -- nistPosition
            BULK   COLLECT
            INTO   l_tab_fingerprints
            FROM   dl_blacklist.fingerprints            f,
                   dl_blacklist.finger_positions        fp,
                   dl_blacklist.finger_impression_types it
            WHERE  f.biometric_id = l_biometric_id
            AND    fp.id = f.finger_position_id
            AND    it.id = f.impression_type_id;
        EXCEPTION
            WHEN no_data_found THEN
                NULL;
        END;

        l_jarr_finger := dl_blacklist.pkg_blacklist_case.fingerprints_to_json(pi_fingerprints => l_tab_fingerprints);

        BEGIN
            -- Put faces in array
            SELECT f.image_id, -- guid
                   fp.ordinal -- nistPosition
            BULK   COLLECT
            INTO   l_tab_faces
            FROM   dl_blacklist.faces          f,
                   dl_blacklist.face_positions fp
            WHERE  f.biometric_id = l_biometric_id
            AND    fp.id = f.face_position_id;
        EXCEPTION
            WHEN no_data_found THEN
                NULL;
        END;

        -- build faces json
        l_jarr_faces := dl_blacklist.pkg_blacklist_case.faces_to_json(pi_faces => l_tab_faces);

        -- build biometric
        l_jobj_biometric := NEW json_object_t;
        l_jobj_biometric.put(key => 'abisId',
                             val => l_abis_id);
        l_jobj_biometric.put(key => 'fingerprints',
                             val => l_jarr_finger);
        l_jobj_biometric.put(key => 'faces',
                             val => l_jarr_faces);

        RETURN l_jobj_biometric.to_string;
    END;

    /*
    *   Delete ABIS via Camunda
    */
    PROCEDURE camunda_delete_blacklist
    (
        i_blacklist_case_id VARCHAR2,
        i_biometric_abis_id NUMBER
    ) IS

        l_clob_request_camunda CLOB;
        l_response             CLOB;
        l_timestamp            VARCHAR2(200);
        l_status               NUMBER;
        l_error                VARCHAR2(32767);
        l_exception            VARCHAR2(32767);
        l_message              VARCHAR2(32767);
        l_path                 VARCHAR2(32767);
        l_http_status          NUMBER;
        l_method               VARCHAR2(20) := 'DELETE';
        l_url_delete           VARCHAR2(2000) := get_camunda_server_url ||
                                                 '/blacklist/delete/' ||
                                                 i_biometric_abis_id;

    BEGIN
        l_clob_request_camunda := '';

        dbms_lob.createtemporary(l_response,
                                 TRUE);

        send_json_request(i_request     => l_clob_request_camunda,
                          i_method      => l_method,
                          i_url         => l_url_delete,
                          o_http_status => l_http_status,
                          o_response    => l_response,
                          o_timestamp   => l_timestamp,
                          o_status      => l_status,
                          o_error       => l_error,
                          o_exception   => l_exception,
                          o_message     => l_message,
                          o_path        => l_path);

        IF l_http_status > 207
        THEN
            raise_application_error(-20001,
                                    'Error deleting biometric data from Abis via Camunda');
        ELSE
            UPDATE dl_blacklist.biometrics
            SET    dl_blacklist.biometrics.abis_id = NULL
            WHERE  dl_blacklist.biometrics.blacklist_case_id =
                   i_blacklist_case_id;
        END IF;
    END;

    /*
    *   Update ABIS via Camunda
    */
    PROCEDURE camunda_update_blacklist(i_biometric_json VARCHAR2) IS

        -- Update the Abis with the current set of images

        l_clob_request_camunda CLOB;
        l_response             CLOB;
        l_timestamp            VARCHAR2(200);
        l_status               NUMBER;
        l_error                VARCHAR2(32767);
        l_exception            VARCHAR2(32767);
        l_message              VARCHAR2(32767);
        l_path                 VARCHAR2(32767);
        l_http_status          NUMBER;
        l_method               VARCHAR2(20) := 'PUT';
        l_url_update           VARCHAR2(2000) := get_camunda_server_url ||
                                                 '/blacklist/update';

    BEGIN
        l_clob_request_camunda := '{"biometric": ' || i_biometric_json || '}';

        dbms_lob.createtemporary(l_response,
                                 TRUE);

        send_json_request(i_request     => l_clob_request_camunda,
                          i_method      => l_method,
                          i_url         => l_url_update,
                          o_http_status => l_http_status,
                          o_response    => l_response,
                          o_timestamp   => l_timestamp,
                          o_status      => l_status,
                          o_error       => l_error,
                          o_exception   => l_exception,
                          o_message     => l_message,
                          o_path        => l_path);

        IF l_http_status > 201
        THEN
            raise_application_error(-20001,
                                    'Error updating Biometric Data via Camunda');
        END IF;
    END;

    /*
    *   Insert ABIS via Camunda
    */
    PROCEDURE camunda_insert_blacklist
    (
        i_biometric_id      IN VARCHAR2,
        i_biometric_json    IN VARCHAR2,
        o_biometric_abis_id OUT VARCHAR2
    ) IS

        l_clob_request_camunda CLOB;
        l_response             CLOB;
        l_timestamp            VARCHAR2(200);
        l_status               NUMBER;
        l_error                VARCHAR2(32767);
        l_exception            VARCHAR2(32767);
        l_message              VARCHAR2(32767);
        l_path                 VARCHAR2(32767);
        l_http_status          NUMBER;
        l_method               VARCHAR2(20) := 'POST';
        l_url_insert           VARCHAR2(2000) := get_camunda_server_url ||
                                                 '/blacklist/insertBiometric';

    BEGIN
        l_clob_request_camunda := '{"biometric": ' || i_biometric_json || '}';

        dbms_lob.createtemporary(l_response,
                                 TRUE);

        send_json_request(i_request     => l_clob_request_camunda,
                          i_method      => l_method,
                          i_url         => l_url_insert,
                          o_http_status => l_http_status,
                          o_response    => l_response,
                          o_timestamp   => l_timestamp,
                          o_status      => l_status,
                          o_error       => l_error,
                          o_exception   => l_exception,
                          o_message     => l_message,
                          o_path        => l_path);

        IF l_http_status > 201
        THEN
            raise_application_error(-20001,
                                    'Error inserting Biometric Data into ABIS via Camunda, one of the servive may not not be available. This step must be repeated.');
        ELSE
            apex_json.parse(l_response);
            o_biometric_abis_id := apex_json.get_number('abisId');

            UPDATE dl_blacklist.biometrics
            SET    abis_id = o_biometric_abis_id
            WHERE  dl_blacklist.biometrics.id = i_biometric_id;

        END IF;
    END;

    /*
    *   Updates Biometric Records: Faces and Fingerprints
    *   Sends REST-Call to Camunda for updating ABIS
    *   Used in Instead OF Trigger of V_BLACKLIST_CASES
    */
    PROCEDURE update_biometrics
    (
        i_biometric_json    VARCHAR2,
        i_blacklist_case_id VARCHAR2
    ) IS

        l_biometric_id      dl_blacklist.biometrics.id%TYPE;
        l_biometric_abis_id dl_blacklist.biometrics.abis_id%TYPE;
        l_params            logger.tab_param;
        l_scope             logger_logs.scope%TYPE := g_scope_prefix ||
                                                      'update_biometrics';
        l_updated           BOOLEAN := FALSE;
        l_new_biometrics    BOOLEAN := FALSE;
    BEGIN
        -------------------------------------------------------------------------------------------
        -- Init
        -------------------------------------------------------------------------------------------
        logger.append_param(l_params,
                            'i_biometric_json',
                            i_biometric_json);

        logger.append_param(l_params,
                            'i_blacklist_case_id',
                            i_blacklist_case_id);

        logger.log(p_text   => 'START',
                   p_scope  => l_scope,
                   p_params => l_params);

        -------------------------------------------------------------------------------------------
        -- Merge Fingerprints and Faces
        -------------------------------------------------------------------------------------------

        -- Get biometric-id, if not found a new record will be created
        BEGIN
            SELECT id,
                   abis_id
            INTO   l_biometric_id,
                   l_biometric_abis_id
            FROM   dl_blacklist.biometrics b
            WHERE  b.blacklist_case_id = i_blacklist_case_id;
        EXCEPTION
            WHEN no_data_found THEN
                l_new_biometrics := TRUE;
                INSERT INTO dl_blacklist.biometrics
                    (blacklist_case_id)
                VALUES
                    (i_blacklist_case_id)
                RETURNING id INTO l_biometric_id;
        END;

        IF l_biometric_abis_id IS NOT NULL
        THEN

            -- Merges Fingerprints
            MERGE INTO dl_blacklist.fingerprints dest
            USING (SELECT jt.imageguid   AS image_id,
                          l_biometric_id AS biometric_id,
                          fi.id          AS impression_type_id,
                          fp.id          AS finger_position_id
                   FROM   json_table(i_biometric_json,
                                     '$.fingerprints[*]'
                                     columns(imageguid VARCHAR2(512 CHAR) path
                                             '$.image.guid',
                                             nistposition NUMBER path
                                             '$.nistPosition',
                                             nistimpressiontype NUMBER path
                                             '$.nistImpressionType')) jt,
                          dl_blacklist.finger_impression_types fi,
                          dl_blacklist.finger_positions fp
                   WHERE  fi.ordinal = jt.nistimpressiontype
                   AND    fp.ordinal = jt.nistposition) src
            ON (src.biometric_id = dest.biometric_id AND src.finger_position_id = dest.finger_position_id)
            WHEN MATCHED THEN
                UPDATE
                SET    dest.image_id           = src.image_id,
                       dest.impression_type_id = src.impression_type_id
                WHERE  dest.image_id != src.image_id
            WHEN NOT MATCHED THEN
                INSERT
                    (image_id,
                     biometric_id,
                     impression_type_id,
                     finger_position_id)
                VALUES
                    (src.image_id,
                     src.biometric_id,
                     src.impression_type_id,
                     src.finger_position_id);
            l_updated := (l_updated OR SQL%ROWCOUNT > 0);

            -- Delete existing Fingerprints THA20675-1816
            DELETE dl_blacklist.fingerprints f
            WHERE  biometric_id = l_biometric_id
            AND    NOT EXISTS
             (SELECT jt.*,
                           fp.value_short,
                           fi.value_short
                    FROM   json_table(i_biometric_json,
                                      '$.fingerprints[*]'
                                      columns(imageguid VARCHAR2(512 CHAR) path
                                              '$.image.guid',
                                              nistposition NUMBER path
                                              '$.nistPosition',
                                              nistimpressiontype NUMBER path
                                              '$.nistImpressionType')) jt,
                           dl_blacklist.finger_impression_types fi,
                           dl_blacklist.finger_positions fp
                    WHERE  fi.ordinal = jt.nistimpressiontype
                    AND    fp.ordinal = jt.nistposition
                    AND    fp.id = f.finger_position_id
                    AND    fi.id = f.impression_type_id);

            IF NOT l_updated
            THEN
                l_updated := (SQL%ROWCOUNT > 0);
            END IF;

            -- Delete Faces
            DELETE dl_blacklist.faces
            WHERE  biometric_id = l_biometric_id
            AND    image_id NOT IN
                   (SELECT jt.imageguid AS image_id
                     FROM   json_table(i_biometric_json,
                                       '$.faces[*]'
                                       columns(imageguid VARCHAR2(512 CHAR) path
                                               '$.image.guid')) jt);
            IF NOT l_updated
            THEN
                l_updated := (SQL%ROWCOUNT > 0);
            END IF;

            -- Insert New Faces
            INSERT INTO faces
                (image_id,
                 biometric_id,
                 face_position_id)
                SELECT jt.imageguid   AS image_id,
                       l_biometric_id AS biometric_id,
                       fp.id          AS face_position_id
                FROM   json_table(i_biometric_json,
                                  '$.faces[*]'
                                  columns(imageguid VARCHAR2(512 CHAR) path
                                          '$.image.guid',
                                          nistposition NUMBER path
                                          '$.nistPosition')) jt,
                       dl_blacklist.face_positions fp
                WHERE  fp.ordinal = jt.nistposition
                AND    NOT EXISTS
                 (SELECT 1
                        FROM   faces f
                        WHERE  f.image_id = jt.imageguid
                        AND    f.biometric_id = l_biometric_id
                        AND    f.face_position_id = fp.id);

            IF NOT l_updated
            THEN
                l_updated := (SQL%ROWCOUNT > 0);
            END IF;

            -------------------------------------------------------------------------------------------
            -- ABIS Update via Camunda
            -------------------------------------------------------------------------------------------
            IF l_updated
            THEN
                apex_json.parse(i_biometric_json);
                IF (apex_json.get_count('faces') = 0 AND
                   apex_json.get_count('fingerprints') = 0)
                -- There are no biometric images anymore - delete the Abis Id
                THEN
                    camunda_delete_blacklist(i_blacklist_case_id => i_blacklist_case_id,
                                             i_biometric_abis_id => l_biometric_abis_id);
                ELSE
                    camunda_update_blacklist(i_biometric_json);
                END IF;
            END IF;
        ELSE
            insert_biometrics(i_biometric_json,
                              i_blacklist_case_id);
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            logger.log_error(p_text   => 'Unhandled Exception',
                             p_scope  => l_scope,
                             p_params => l_params);
            RAISE;
    END;

    /*
    *   Inserts Biometric Records: Faces and Fingerprints
    *   Sends REST-Call to Camunda for inserting into ABIS
    *   Used in Instead OF Trigger of V_BLACKLIST_CASES and if an update is not possible
    */
    PROCEDURE insert_biometrics
    (
        i_biometric_json    VARCHAR2,
        i_blacklist_case_id VARCHAR2
    ) IS

        l_biometric_id      dl_blacklist.biometrics.id%TYPE;
        l_biometric_abis_id dl_blacklist.biometrics.abis_id%TYPE;
        l_params            logger.tab_param;
        l_scope             logger_logs.scope%TYPE := g_scope_prefix ||
                                                      'insert_biometrics';
        l_new_biometrics    BOOLEAN := FALSE;

    BEGIN
        -------------------------------------------------------------------------------------------
        -- Init
        -------------------------------------------------------------------------------------------
        logger.append_param(l_params,
                            'i_biometric_json',
                            i_biometric_json);

        logger.append_param(l_params,
                            'i_blacklist_case_id',
                            i_blacklist_case_id);

        logger.log(p_text   => 'START',
                   p_scope  => l_scope,
                   p_params => l_params);

        -------------------------------------------------------------------------------------------
        -- Merge Fingerprints and Faces
        -------------------------------------------------------------------------------------------

        -- Get biometric-id, if not found a new record will be created
        BEGIN
            SELECT id,
                   abis_id
            INTO   l_biometric_id,
                   l_biometric_abis_id
            FROM   dl_blacklist.biometrics b
            WHERE  b.blacklist_case_id = i_blacklist_case_id;
        EXCEPTION
            WHEN no_data_found THEN
                l_new_biometrics := TRUE;
                INSERT INTO dl_blacklist.biometrics
                    (blacklist_case_id)
                VALUES
                    (i_blacklist_case_id)
                RETURNING id INTO l_biometric_id;
        END;

        -- Merges Fingerprints
        MERGE INTO dl_blacklist.fingerprints dest
        USING (SELECT jt.imageguid   AS image_id,
                      l_biometric_id AS biometric_id,
                      fi.id          AS impression_type_id,
                      fp.id          AS finger_position_id
               FROM   json_table(i_biometric_json,
                                 '$.fingerprints[*]'
                                 columns(imageguid VARCHAR2(512 CHAR) path
                                         '$.image.guid',
                                         nistposition NUMBER path
                                         '$.nistPosition',
                                         nistimpressiontype NUMBER path
                                         '$.nistImpressionType')) jt,
                      dl_blacklist.finger_impression_types fi,
                      dl_blacklist.finger_positions fp
               WHERE  fi.ordinal = jt.nistimpressiontype
               AND    fp.ordinal = jt.nistposition) src
        ON (src.biometric_id = dest.biometric_id AND src.finger_position_id = dest.finger_position_id)
        WHEN MATCHED THEN
            UPDATE
            SET    dest.image_id           = src.image_id,
                   dest.impression_type_id = src.impression_type_id
            WHERE  dest.image_id != src.image_id
        WHEN NOT MATCHED THEN
            INSERT
                (image_id,
                 biometric_id,
                 impression_type_id,
                 finger_position_id)
            VALUES
                (src.image_id,
                 src.biometric_id,
                 src.impression_type_id,
                 src.finger_position_id);

        -- Delete existing Fingerprints THA20675-1816
        DELETE dl_blacklist.fingerprints f
        WHERE  biometric_id = l_biometric_id
        AND    NOT EXISTS
         (SELECT jt.*,
                       fp.value_short,
                       fi.value_short
                FROM   json_table(i_biometric_json,
                                  '$.fingerprints[*]'
                                  columns(imageguid VARCHAR2(512 CHAR) path
                                          '$.image.guid',
                                          nistposition NUMBER path
                                          '$.nistPosition',
                                          nistimpressiontype NUMBER path
                                          '$.nistImpressionType')) jt,
                       dl_blacklist.finger_impression_types fi,
                       dl_blacklist.finger_positions fp
                WHERE  fi.ordinal = jt.nistimpressiontype
                AND    fp.ordinal = jt.nistposition
                AND    fp.id = f.finger_position_id
                AND    fi.id = f.impression_type_id);

        -- Insert New Faces
        INSERT INTO faces
            (image_id,
             biometric_id,
             face_position_id)
            SELECT jt.imageguid   AS image_id,
                   l_biometric_id AS biometric_id,
                   fp.id          AS face_position_id
            FROM   json_table(i_biometric_json,
                              '$.faces[*]'
                              columns(imageguid VARCHAR2(512 CHAR) path
                                      '$.image.guid',
                                      nistposition NUMBER path
                                      '$.nistPosition')) jt,
                   dl_blacklist.face_positions fp
            WHERE  fp.ordinal = jt.nistposition
            AND    NOT EXISTS
             (SELECT 1
                    FROM   faces f
                    WHERE  f.image_id = jt.imageguid
                    AND    f.biometric_id = l_biometric_id
                    AND    f.face_position_id = fp.id);

        -- Delete Faces
        DELETE dl_blacklist.faces
        WHERE  biometric_id = l_biometric_id
        AND    image_id NOT IN
               (SELECT jt.imageguid AS image_id
                 FROM   json_table(i_biometric_json,
                                   '$.faces[*]'
                                   columns(imageguid VARCHAR2(512 CHAR) path
                                           '$.image.guid')) jt);

        apex_json.parse(i_biometric_json);
        IF apex_json.get_count('faces') > 0 OR
           apex_json.get_count('fingerprints') > 0
        THEN
            -- Insert record into Abis via camunda
            camunda_insert_blacklist(i_biometric_id      => l_biometric_id,
                                     i_biometric_json    => i_biometric_json,
                                     o_biometric_abis_id => l_biometric_abis_id);

        END IF;

    EXCEPTION
        WHEN OTHERS THEN
            logger.log_error(p_text   => 'Unhandled Exception',
                             p_scope  => l_scope,
                             p_params => l_params);
            RAISE;
    END;

BEGIN
    utl_http.set_transfer_timeout(timeout => 180);
END pkg_camunda_rest;
/
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_CAMUNDA_REST" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_CAMUNDA_REST" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_CAMUNDA_REST" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_CAMUNDA_REST" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_CAMUNDA_REST" TO "BIOSAADM";
