CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."XLIB_JASPERREPORTS" 
AS
/*=========================================================================
  $Id: xlib_jasperreports.pks 56 2013-05-13 07:06:46Z dietmar.aust $

  Purpose  :

  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             http://www.opal-consulting.de/pls/apex/f?p=20090928:14

  $LastChangedDate: 2013-05-13 09:06:46 +0200 (Mon, 13 May 2013) $
  $LastChangedBy: dietmar.aust $

  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  06.01.2010  D. Aust         Initial creation
  06.05.2011  D. Aust         added constants for xlsx and docx
  05.08.2012  D. Aust         added version 2.0.0 features:
                              - direct printing
                              - save file on server
  11.05.2013  D. Aust         added support for tunneling images for html
                              exports only
=========================================================================*/

   -- constants
   -- supported formats
   c_rep_format_pdf    CONSTANT VARCHAR2 (20) := 'pdf';
   c_rep_format_rtf    CONSTANT VARCHAR2 (20) := 'rtf';
   c_rep_format_xls    CONSTANT VARCHAR2 (20) := 'xls';
   c_rep_format_html   constant varchar2 (20) := 'html';
   c_rep_format_html2   CONSTANT VARCHAR2 (20) := 'html2';
   c_rep_format_csv    CONSTANT VARCHAR2 (20) := 'csv';
   c_rep_format_docx    CONSTANT VARCHAR2 (20) := 'docx';
   c_rep_format_pptx    CONSTANT VARCHAR2 (20) := 'pptx';
   c_rep_format_xlsx    CONSTANT VARCHAR2 (20) := 'xlsx';

   -- images uri
   c_images_uri_tunnel constant varchar2(100 char)
          := 'xlib_jasperreports_img.get_image?p_url=#REPORT_URL#'||chr(38)||'p_image=';
   c_images_uri_no_tunnel constant varchar2(100 char) := 'report_image?image=';

   -- exceptions
   report_url_not_defined       EXCEPTION;

----------------------------------------------------------------------------
-- sets the url for the report server for all requests in the
-- current session
----------------------------------------------------------------------------
   PROCEDURE set_report_url (p_report_url IN VARCHAR2);

   FUNCTION get_report_url
      RETURN VARCHAR2;

----------------------------------------------------------------------------
-- set the image uri for html reports only!
----------------------------------------------------------------------------
   PROCEDURE set_images_uri (p_images_uri IN VARCHAR2 default null);

   FUNCTION get_images_uri
      return varchar2;


/**  make a callout with utl_http to the j2ee container running the
 *   JasperReportsIntegration web application
 *   => return the results
 *
 * @param p_rep_name      name of the report (needs a name.jasper file deployed on the server)
 * @param p_rep_format    report format, e.g. pdf, rtf, etc, see constants
 * @param p_data_source   data source name, needs to be configured in J2EE application
 * @param p_out_filename  filename if the file should be downloaded
 * @param p_rep_locale    report locale setting, e.g. de_DE or en_US
 * @param p_rep_encoding  encoding, e.g. UTF-8
 * @param p_additional_params additional parameters, e.g.: p1=1&p2=2
 * @param p_print_is_enabled shall the report be sent to the printer directly?
 * @param p_print_printer_name  name or substring of printer name
 * @param p_print_media   media used, either the paper size or the tray
 * @param p_print_copies  number of copies to be printed
 * @param p_print_duplex  duplex printing?
 * @param p_print_collate sorting the print output?
 * @param p_save_is_enabled shall the generated file be saved on the server?
 * @param p_save_filename filename for the file to be saved on the server
 *
 */
   PROCEDURE show_report (
      p_rep_name            IN   VARCHAR2 DEFAULT 'test',
      p_rep_format          IN   VARCHAR2 DEFAULT c_rep_format_pdf,
      p_data_source         IN   VARCHAR2 DEFAULT 'default',
      p_out_filename        IN   VARCHAR2 DEFAULT NULL,
      p_rep_locale          in   varchar2 default 'de_DE',
      p_rep_encoding        in   varchar2 default 'UTF-8',
      p_additional_params   in   varchar2 default null,
      p_print_is_enabled    in   boolean default false,
      p_print_printer_name  in   varchar2 default null,
      p_print_media         in   varchar2 default null,
      p_print_copies        in   number default 1,
      p_print_duplex        in   boolean default false,
      p_print_collate       in   boolean default false,
      p_save_is_enabled     in   boolean default false,
      p_save_filename       in   varchar2 default null
   );

/**  run the report and return the result as a blob
 *
 * @param p_rep_name      name of the report (needs a name.jasper file deployed on the server)
 * @param p_rep_format    report format, e.g. pdf, rtf, etc, see constants
 * @param p_data_source   data source name, needs to be configured in J2EE application
 * @param p_out_filename  filename if the file should be downloaded
 * @param p_rep_locale    report locale setting, e.g. de_DE or en_US
 * @param p_rep_encoding  encoding, e.g. UTF-8
 * @param p_additional_params additional parameters, e.g.: p1=1&p2=2
 * @param p_print_is_enabled shall the report be sent to the printer directly?
 * @param p_print_printer_name  name or substring of printer name
 * @param p_print_media   media used, either the paper size or the tray
 * @param p_print_copies  number of copies to be printed
 * @param p_print_duplex  duplex printing?
 * @param p_print_collate sorting the print output?
 * @param p_save_is_enabled shall the generated file be saved on the server?
 * @param p_save_filename filename for the file to be saved on the server
 * @param p_out_blob      the blob will be returned here
 * @param p_out_mime_type the proper mime type of the generated file
 *
 */
   PROCEDURE get_report (
      p_rep_name            IN   VARCHAR2 DEFAULT 'test',
      p_rep_format          in   varchar2 default c_rep_format_pdf,
      p_data_source         IN   VARCHAR2 DEFAULT 'default',
      p_rep_locale          in   varchar2 default 'de_DE',
      p_rep_encoding        IN   VARCHAR2 DEFAULT 'UTF-8',
      p_additional_params   in   varchar2 default null,
      p_print_is_enabled    in   boolean default  false,
      p_print_printer_name  in   varchar2 default null,
      p_print_media         in   varchar2 default null,
      p_print_copies        in   number default 1,
      p_print_duplex        in   boolean default false,
      p_print_collate       in   boolean default false,
      p_save_is_enabled     in   boolean default false,
      p_save_filename       in   varchar2 default null,
      p_out_blob            IN OUT   BLOB,
      p_out_mime_type       IN OUT   VARCHAR2
   );

END;
/
