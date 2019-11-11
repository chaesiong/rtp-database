CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."XLIB_JASPERREPORTS_IMG" AS

    m_module   VARCHAR2(50) := 'XLIB_JASPERREPORTS_IMG';

----------------------------------------------------------------------------
-- get_image: retrieves a report image from the server
----------------------------------------------------------------------------

    PROCEDURE get_image (
        p_url     IN VARCHAR2,
        p_image   IN VARCHAR2
    ) IS
        l_url    VARCHAR2(32767);
        l_proc   VARCHAR2(100) := m_module
        || '.GET_IMAGE';
    BEGIN

      -------------------------------------------------------
      -- construct URL
      -------------------------------------------------------
        l_url := p_url;
      -- use image servlet
      --l_url := l_url || '_image?image=' || p_image;
      -- use images directory /report_tmp/
        l_url := l_url
        || '_tmp/'
        || p_image;

      -------------------------------------------------------
      -- call J2EE server
      -------------------------------------------------------
        xlog(l_proc,l_url);
        xlib_http.display_url_raw(p_url => l_url);
    END;

END xlib_jasperreports_img;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."XLIB_JASPERREPORTS_IMG" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."XLIB_JASPERREPORTS_IMG" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."XLIB_JASPERREPORTS_IMG" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."XLIB_JASPERREPORTS_IMG" TO "BIOSAADM";
