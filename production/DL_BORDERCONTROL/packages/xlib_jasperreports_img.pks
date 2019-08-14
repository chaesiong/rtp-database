CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."XLIB_JASPERREPORTS_IMG" AS
----------------------------------------------------------------------------
-- get_image: retrieves a report image from the server
----------------------------------------------------------------------------
   PROCEDURE get_image (p_url in varchar2, p_image IN VARCHAR2);


end xlib_jasperreports_img;
/
