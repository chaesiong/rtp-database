CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."XLIB_HTTP" 
AS

/*=========================================================================
  $Id: xlib_http.pks 57 2013-05-13 07:09:51Z dietmar.aust $

  Purpose  : Make http callouts

  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             http://www.opal-consulting.de/pls/apex/f?p=20090928:14

  $LastChangedDate: 2013-05-13 09:09:51 +0200 (Mon, 13 May 2013) $
  $LastChangedBy: dietmar.aust $

 Date        Author           Comment
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 19.02.2007  D. Aust          initial creation
 07.08.2008  D. Aust          added check_get_request
                              display_url_raw: pass all request headers
                                 to the client
 05.08.2012  D. Aust          suppress mime header TRANSFER-ENCODING,
                              causes lots of problems with XMLDB listener
                              and others choking.
=========================================================================*/

   c_success   CONSTANT CHAR (1) := '1';
   c_fail      CONSTANT CHAR (1) := '0';

   PROCEDURE display_url_raw (
      p_url                       VARCHAR2,
      p_mime_type_override   IN   VARCHAR2 DEFAULT NULL,
      p_charset              IN   VARCHAR2 DEFAULT NULL
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
