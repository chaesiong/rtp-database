CREATE OR REPLACE EDITIONABLE PACKAGE "JASPER_REPORTING"."XLIB_HTTP" 
AS

/*=========================================================================
  $Id: xlib_http.pks 60 2015-10-05 15:08:20Z dietmar.aust $

  Purpose  : Make http callouts

  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             http://www.opal-consulting.de/pls/apex/f?p=20090928:14

  $LastChangedDate: 2015-10-05 17:08:20 +0200 (Mon, 05 Oct 2015) $
  $LastChangedBy: dietmar.aust $

 Version Date        Author           Comment
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         19.02.2007  D. Aust          initial creation
         07.08.2008  D. Aust          - added check_get_request
                                      - display_url_raw: pass all request headers
                                          to the client
         05.08.2012  D. Aust		      suppress mime header TRANSFER-ENCODING,
                                        causes lots of problems with XMLDB listener
                                        and others choking.
 2.3.0.0 19.05.2014  D. Aust          - #294 - Fix chunked encoding problem in
                                          xlib_http.get_report
                                      - added version information to this package
 2.3.0.0 09.05.2015  D. Aust          pass JSESSIONID from backend J2EE server to client
                                        for image rendering in html reports

=========================================================================*/

   c_success   CONSTANT CHAR (1) := '1';
   c_fail      CONSTANT CHAR (1) := '0';

  -- version of this package
  version_c constant varchar2(20 char) := '2.3.0.0';

  TYPE vc_arr_t IS TABLE OF VARCHAR2 (32767) INDEX BY BINARY_INTEGER;
  g_empty_vc_arr vc_arr_t;

   PROCEDURE display_url_raw (
      p_url                       VARCHAR2,
      p_mime_type_override   IN   VARCHAR2 DEFAULT NULL,
      p_charset              IN   VARCHAR2 DEFAULT NULL,
      p_header_name_arr      IN   vc_arr_t default g_empty_vc_arr,
      p_header_value_arr     IN   vc_arr_t default g_empty_vc_arr
   );

   PROCEDURE retrieve_blob_from_url (
      p_url               VARCHAR2,
      o_blob        OUT   BLOB,
      o_mime_type   OUT   VARCHAR2
   );

   FUNCTION escape_form_data (s VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION check_get_request (p_url VARCHAR2)
      RETURN CHAR;
END;
/
