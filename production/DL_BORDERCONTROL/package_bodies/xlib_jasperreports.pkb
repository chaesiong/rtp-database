CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."XLIB_JASPERREPORTS" AS
/*=========================================================================
 $Id: xlib_jasperreports.pkb 56 2013-05-13 07:06:46Z dietmar.aust $
=========================================================================*/

    m_module       VARCHAR2(50) := 'XLIB_JASPERREPORTS';
    m_report_url   VARCHAR2(2000) := NULL;
    m_images_uri   VARCHAR2(2000) := NULL;

    -- convert boolean to 'true' or 'false'

    FUNCTION bool2string (
        b IN BOOLEAN
    ) RETURN VARCHAR2
        IS
    BEGIN
        IF
            b
        THEN
            RETURN 'true';
        ELSE
            RETURN 'false';
        END IF;
    END;

----------------------------------------------------------------------------
-- sets the url for the report server for all requests in the
-- current session
----------------------------------------------------------------------------

    PROCEDURE set_report_url (
        p_report_url IN VARCHAR2
    )
        IS
    BEGIN
        m_report_url := p_report_url;
    END;

    FUNCTION get_report_url RETURN VARCHAR2
        IS
    BEGIN
        RETURN m_report_url;
    END;

----------------------------------------------------------------------------
-- sets the images_uri only for http reports!
----------------------------------------------------------------------------

    PROCEDURE set_images_uri (
        p_images_uri IN VARCHAR2
    )
        IS
    BEGIN
        m_images_uri := p_images_uri;
    END;

    FUNCTION get_images_uri RETURN VARCHAR2
        IS
    BEGIN
        RETURN m_images_uri;
    END;

    FUNCTION compute_images_uri_tunnel RETURN VARCHAR2 IS
        l_uri   VARCHAR2(2000 CHAR);
    BEGIN
        l_uri := sys_context('userenv','current_schema')
        || '.'
        || c_images_uri_tunnel;

     /*
         c_images_uri_tunnel
             :='xlib_jasperreports_img.get_image?p_url=#REPORT_URL#'||chr(38)||'p_image=';
      */

     --l_uri := replace(l_uri, '#REPORT_URL#', APEX_UTIL.URL_ENCODE(m_report_url));
        l_uri := replace(l_uri,'#REPORT_URL#',m_report_url);
        xlog('compute tunnel',l_uri);
        RETURN l_uri;
    END;

----------------------------------------------------------------------------
-- make a callout with utl_http to the j2ee container running the
-- JasperReportsIntegration webapp
-- => return the results
----------------------------------------------------------------------------

    PROCEDURE show_report (
        p_rep_name             IN VARCHAR2 DEFAULT 'test',
        p_rep_format           IN VARCHAR2 DEFAULT c_rep_format_pdf,
        p_data_source          IN VARCHAR2 DEFAULT 'default',
        p_out_filename         IN VARCHAR2 DEFAULT NULL,
        p_rep_locale           IN VARCHAR2 DEFAULT 'de_DE',
        p_rep_encoding         IN VARCHAR2 DEFAULT 'UTF-8',
        p_additional_params    IN VARCHAR2 DEFAULT NULL,
        p_print_is_enabled     IN BOOLEAN DEFAULT false,
        p_print_printer_name   IN VARCHAR2 DEFAULT NULL,
        p_print_media          IN VARCHAR2 DEFAULT NULL,
        p_print_copies         IN NUMBER DEFAULT 1,
        p_print_duplex         IN BOOLEAN DEFAULT false,
        p_print_collate        IN BOOLEAN DEFAULT false,
        p_save_is_enabled      IN BOOLEAN DEFAULT false,
        p_save_filename        IN VARCHAR2 DEFAULT NULL
    ) IS
        l_proc   VARCHAR2(100) := m_module
        || '.SHOW_REPORT';
        l_url    VARCHAR2(32767);
    BEGIN
      -------------------------------------------------------
      -- assert valid values for the input variables
      -------------------------------------------------------
        IF
            m_report_url IS NULL
        THEN
            RAISE report_url_not_defined;
        END IF;

      -------------------------------------------------------
      -- construct URL
      -------------------------------------------------------
        l_url := m_report_url;
        l_url := l_url
        || '?_repName='
        || p_rep_name;
        l_url := l_url
        || ''
        || chr(38)
        || '_repFormat='
        || p_rep_format;

        l_url := l_url
        || ''
        || chr(38)
        || '_dataSource='
        || p_data_source;

        l_url := l_url
        || ''
        || chr(38)
        || '_outFilename='
        || p_out_filename;

        l_url := l_url
        || ''
        || chr(38)
        || '_repLocale='
        || p_rep_locale;

        l_url := l_url
        || ''
        || chr(38)
        || '_repEncoding='
        || p_rep_encoding;

        IF
            m_images_uri IS NULL
        THEN
        -- tunnel through database
            l_url := l_url
            || ''
            || chr(38)
            || '_imagesURI='
            || apex_util.url_encode(compute_images_uri_tunnel);
        ELSE
        -- use parameter, mostly for direct access to servlet
            l_url := l_url
            || ''
            || chr(38)
            || '_imagesURI='
            || m_images_uri;
        END IF;

      -- direct printing

        l_url := l_url
        || ''
        || chr(38)
        || '_printIsEnabled='
        || bool2string(p_print_is_enabled);

        l_url := l_url
        || ''
        || chr(38)
        || '_printPrinterName='
        || p_print_printer_name;

        l_url := l_url
        || ''
        || chr(38)
        || '_printPrinterTray='
        || p_print_media;

        l_url := l_url
        || ''
        || chr(38)
        || '_printCopies='
        || p_print_copies;

        l_url := l_url
        || ''
        || chr(38)
        || '_printDuplex='
        || bool2string(p_print_duplex);

        l_url := l_url
        || ''
        || chr(38)
        || '_printCollate='
        || bool2string(p_print_collate);

      -- save file on server

        l_url := l_url
        || ''
        || chr(38)
        || '_saveIsEnabled='
        || bool2string(p_save_is_enabled);

        l_url := l_url
        || ''
        || chr(38)
        || '_saveFileName='
        || p_save_filename;

      -- additional report parameter passed?

        IF
            ( p_additional_params IS NOT NULL )
        THEN
            l_url := l_url
            || ''
            || chr(38)
            || ''
            || p_additional_params;
        END IF;

      -------------------------------------------------------
      -- call J2EE server
      -------------------------------------------------------

        xlib_http.display_url_raw(p_url => l_url);
    END;

----------------------------------------------------------------------------
-- run the report and return the result as a blob
----------------------------------------------------------------------------

    PROCEDURE get_report (
        p_rep_name             IN VARCHAR2 DEFAULT 'test',
        p_rep_format           IN VARCHAR2 DEFAULT c_rep_format_pdf,
        p_data_source          IN VARCHAR2 DEFAULT 'default',
        p_rep_locale           IN VARCHAR2 DEFAULT 'de_DE',
        p_rep_encoding         IN VARCHAR2 DEFAULT 'UTF-8',
        p_additional_params    IN VARCHAR2 DEFAULT NULL,
        p_print_is_enabled     IN BOOLEAN DEFAULT false,
        p_print_printer_name   IN VARCHAR2 DEFAULT NULL,
        p_print_media          IN VARCHAR2 DEFAULT NULL,
        p_print_copies         IN NUMBER DEFAULT 1,
        p_print_duplex         IN BOOLEAN DEFAULT false,
        p_print_collate        IN BOOLEAN DEFAULT false,
        p_save_is_enabled      IN BOOLEAN DEFAULT false,
        p_save_filename        IN VARCHAR2 DEFAULT NULL,
        p_out_blob IN OUT BLOB,
        p_out_mime_type IN OUT VARCHAR2
    ) IS
        l_proc   VARCHAR2(100) := m_module
        || '.GET_REPORT';
        l_url    VARCHAR2(32767);
    BEGIN
      -------------------------------------------------------
      -- assert valid values for the input variables
      -------------------------------------------------------
        IF
            m_report_url IS NULL
        THEN
            RAISE report_url_not_defined;
        END IF;

      -------------------------------------------------------
      -- construct URL
      -------------------------------------------------------
        l_url := m_report_url;
        l_url := l_url
        || '?_repName='
        || p_rep_name;
        l_url := l_url
        || ''
        || chr(38)
        || '_repFormat='
        || p_rep_format;

        l_url := l_url
        || ''
        || chr(38)
        || '_dataSource='
        || p_data_source;

        l_url := l_url
        || ''
        || chr(38)
        || '_repLocale='
        || p_rep_locale;

        l_url := l_url
        || ''
        || chr(38)
        || '_repEncoding='
        || p_rep_encoding;

        IF
            m_images_uri IS NULL
        THEN
        -- tunnel through database
            l_url := l_url
            || ''
            || chr(38)
            || '_imagesURI='
            || compute_images_uri_tunnel;
        ELSE
        -- use parameter, mostly for direct access to servlet
            l_url := l_url
            || ''
            || chr(38)
            || '_imagesURI='
            || m_images_uri;
        END IF;

      -- direct printing

        l_url := l_url
        || ''
        || chr(38)
        || '_printIsEnabled='
        || bool2string(p_print_is_enabled);

        l_url := l_url
        || ''
        || chr(38)
        || '_printPrinterName='
        || p_print_printer_name;

        l_url := l_url
        || ''
        || chr(38)
        || '_printPrinterTray='
        || p_print_media;

        l_url := l_url
        || ''
        || chr(38)
        || '_printCopies='
        || p_print_copies;

        l_url := l_url
        || ''
        || chr(38)
        || '_printDuplex='
        || bool2string(p_print_duplex);

        l_url := l_url
        || ''
        || chr(38)
        || '_printCollate='
        || bool2string(p_print_collate);

      -- save file on server

        l_url := l_url
        || ''
        || chr(38)
        || '_saveIsEnabled='
        || bool2string(p_save_is_enabled);

        l_url := l_url
        || ''
        || chr(38)
        || '_saveFileName='
        || p_save_filename;

      -- additional report parameter passed?

        IF
            ( p_additional_params IS NOT NULL )
        THEN
            l_url := l_url
            || ''
            || chr(38)
            || ''
            || p_additional_params;
        END IF;

      -------------------------------------------------------
      -- call Tomcat
      -------------------------------------------------------

        xlib_http.retrieve_blob_from_url(p_url => l_url,o_blob => p_out_blob,o_mime_type => p_out_mime_type);

    END;

END;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."XLIB_JASPERREPORTS" TO "DERMALOG_PROXY";
