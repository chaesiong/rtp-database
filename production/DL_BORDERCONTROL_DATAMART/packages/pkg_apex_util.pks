CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL_DATAMART"."PKG_APEX_UTIL" AS

  /*******************************************************************************
   * This package provides several functionalities for managing the APEX applications
   * for the DATAMART
   *
   * Author    Date        Description
   * --------  ----------  -------------------------------------------------------*
   * CHageman  27.07.2018  Added
   *******************************************************************************/

  -- DEFINE TYPES
  TYPE t_charts_typ  IS RECORD (additional_value  VARCHAR2(400 CHAR)
                               ,disp_value        VARCHAR2(400 CHAR)
                               ,cnt               NUMBER
                               ,filter_value      VARCHAR2(400 CHAR));

  TYPE t_charts_tab_typ IS TABLE OF t_charts_typ;

  -- FUNCTIONS
  FUNCTION get_report_data (p_application_id  IN NUMBER
                           ,p_page_id         IN NUMBER)
  RETURN t_charts_tab_typ PIPELINED;

END PKG_APEX_UTIL;
/
