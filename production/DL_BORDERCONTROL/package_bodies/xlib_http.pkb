CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."XLIB_HTTP" AS
/*=========================================================================
   FILE  :  $Id: xlib_http.pkb 57 2013-05-13 07:09:51Z dietmar.aust $
=========================================================================*/

    m_module             VARCHAR2(50) := 'XLIB_HTTP';
    TYPE vc_arr_t IS
        TABLE OF VARCHAR2(32767) INDEX BY BINARY_INTEGER;

    PROCEDURE display_url_raw (
        p_url                  VARCHAR2,
        p_mime_type_override   IN VARCHAR2 DEFAULT NULL,
        p_charset              IN VARCHAR2 DEFAULT NULL
    ) IS

        l_http_request       utl_http.req;
        l_http_response      utl_http.resp;
        l_blob               BLOB;
        l_raw                RAW(32767);
        l_buffer_size        NUMBER := 32767;
      --
        l_proc               VARCHAR2(100) := m_module
        || '.DISPLAY_URL_RAW';
      --
        l_mime_type          VARCHAR2(100);
        l_header_name        VARCHAR2(256);
        l_header_value       VARCHAR2(1024);
      --
        l_header_name_arr    vc_arr_t;
        l_header_value_arr   vc_arr_t;
    BEGIN
        xlog(l_proc,'show url: '
        || p_url);

      -- Initialize the BLOB.
        dbms_lob.createtemporary(l_blob,false);
        l_http_request := utl_http.begin_request(p_url);
        l_http_response := utl_http.get_response(l_http_request);
        FOR i IN 1..utl_http.get_header_count(l_http_response) LOOP
            utl_http.get_header(l_http_response,i,l_header_name,l_header_value);
         -- store header value in arr
            l_header_name_arr(i) := l_header_name;
            l_header_value_arr(i) := l_header_value;
            IF
                lower(l_header_name) = 'content-type'
            THEN
                l_mime_type := l_header_value;
            END IF;
        END LOOP;

      -- override mime type

        IF
            p_mime_type_override IS NOT NULL
        THEN
            l_mime_type := p_mime_type_override;
        END IF;

      -- Copy the response into the BLOB.
        BEGIN
            LOOP
                utl_http.read_raw(l_http_response,l_raw,l_buffer_size);
                dbms_lob.writeappend(l_blob,utl_raw.length(l_raw),l_raw);
            END LOOP;
        EXCEPTION
            WHEN utl_http.end_of_body THEN
                utl_http.end_response(l_http_response);
        END;

        owa_util.mime_header(ccontent_type => l_mime_type,bclose_header => false,ccharset => p_charset);

        FOR i IN 1..l_header_name_arr.count LOOP
            xlog(l_proc,'set header: '
            || l_header_name_arr(i)
            || ': '
            || l_header_value_arr(i) );

            IF
                upper(l_header_name_arr(i) ) IN (
                    'CONTENT-LENGTH',
                    'CONTENT-TYPE',
                    'MIME-TYPE',
                    'TRANSFER-ENCODING'
                )
            THEN
                xlog(l_proc,'skip header '
                || l_header_name_arr(i) );
            ELSE
                htp.p(l_header_name_arr(i)
                || ': '
                || l_header_value_arr(i) );
            END IF;

        END LOOP;

      -- set content length

        htp.p('Content-length: '
        || dbms_lob.getlength(l_blob) );
        owa_util.http_header_close;
        wpg_docload.download_file(l_blob);
      -- Relase the resources associated with the temporary LOB.
        dbms_lob.freetemporary(l_blob);
    EXCEPTION
        WHEN utl_http.end_of_body THEN
            utl_http.end_response(l_http_response);
            dbms_lob.freetemporary(l_blob);
            RAISE;
        WHEN OTHERS THEN
            xlog(l_proc,'Error: '
            || sqlerrm,'ERROR');
            RAISE;
    END;

    PROCEDURE retrieve_blob_from_url (
        p_url         VARCHAR2,
        o_blob        OUT BLOB,
        o_mime_type   OUT VARCHAR2
    ) IS

        l_http_request    utl_http.req;
        l_http_response   utl_http.resp;
        l_raw             RAW(32767);
      --
        l_proc            VARCHAR2(100) := m_module
        || '.RETRIEVE_BLOB_FROM_URL';
      --
        l_header_name     VARCHAR2(256);
        l_header_value    VARCHAR2(1024);
    BEGIN
      -- Initialize the BLOB.
        dbms_lob.createtemporary(o_blob,false);
        l_http_request := utl_http.begin_request(p_url);
        l_http_response := utl_http.get_response(l_http_request);
        FOR i IN 1..utl_http.get_header_count(l_http_response) LOOP
            utl_http.get_header(l_http_response,i,l_header_name,l_header_value);
            IF
                lower(l_header_name) = 'content-type'
            THEN
                o_mime_type := l_header_value;
            END IF;
        END LOOP;

      -- Copy the response into the BLOB.

        BEGIN
            LOOP
                utl_http.read_raw(l_http_response,l_raw,32767);
                dbms_lob.writeappend(o_blob,utl_raw.length(l_raw),l_raw);
            END LOOP;
        EXCEPTION
            WHEN utl_http.end_of_body THEN
                utl_http.end_response(l_http_response);
        END;
   -- Relase the resources associated with the temporary LOB.
   --DBMS_LOB.freetemporary (l_blob);

    EXCEPTION
        WHEN OTHERS THEN
            utl_http.end_response(l_http_response);
            dbms_lob.freetemporary(o_blob);
            xlog(l_proc,'Error: '
            || sqlerrm,'ERROR');
            RAISE;
    END;

    FUNCTION escape_form_data (
        s VARCHAR2
    ) RETURN VARCHAR2 IS

        l_s   VARCHAR2(500 CHAR);

        FUNCTION r (
            s VARCHAR2,
            c VARCHAR2
        ) RETURN VARCHAR2
            IS
        BEGIN
            RETURN replace(s,c,'%'
            || trim(TO_CHAR(ascii(c),'XX') ) );
        END;

    BEGIN
        l_s := s;
        l_s := replace(l_s,' ','+');
        l_s := r(l_s,chr(37) );  -- %
        l_s := r(l_s,chr(37) );  -- /
        l_s := r(l_s,chr(63) );  -- ?
        l_s := r(l_s,chr(38) );  -- &
        l_s := r(l_s,chr(228) );  -- ä
        l_s := r(l_s,chr(196) );  -- Ä
        l_s := r(l_s,chr(246) );  -- ö
        l_s := r(l_s,chr(214) );  -- Ö
        l_s := r(l_s,chr(252) );  -- ü
        l_s := r(l_s,chr(220) );  -- Ü
        l_s := r(l_s,chr(223) );  -- ß
        RETURN l_s;
    END;

    FUNCTION check_get_request (
        p_url VARCHAR2
    ) RETURN CHAR IS
        l_clob   CLOB;
    BEGIN
        IF
            p_url IS NULL
        THEN
            RETURN c_fail;
        END IF;
        SELECT
            httpuritype(p_url).getclob()
        INTO
            l_clob
        FROM
            dual;

      /*SELECT c_success
        INTO l_ret
        FROM DUAL
       WHERE EXISTS (SELECT HTTPURITYPE (p_url).getclob ()
                       FROM DUAL);
                       */

        RETURN c_success;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN c_fail;
    END;

END;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."XLIB_HTTP" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."XLIB_HTTP" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."XLIB_HTTP" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."XLIB_HTTP" TO "BIOSAADM";
