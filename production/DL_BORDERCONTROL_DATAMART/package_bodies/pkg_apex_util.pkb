CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL_DATAMART"."PKG_APEX_UTIL" AS

  /*******************************************************************************
   * This package provides several functionalities for managing the APEX applications
   * for the DATAMART
   *
   * Author    Date        Description
   * --------  ----------  -------------------------------------------------------*
   * CHageman  27.07.2018  Added
   *******************************************************************************/

  /**
   * get report data from last used query of interactive report
   * @param p_application_id Application ID of the actual application
   * @param p_page_id Page ID of the actual page
   * @return t_charts_tab_typ Generic Table of Records for queries in reports
   */
  FUNCTION get_report_data (p_application_id  IN NUMBER
                           ,p_page_id         IN NUMBER)
  RETURN t_charts_tab_typ PIPELINED
  IS

    l_scope logger_logs.scope%type := 'get_report_data';
    l_params logger.tab_param;
    --

    l_report        apex_ir.t_report;
    l_report_alias  VARCHAR2(50 CHAR);
    l_region_id     NUMBER;
    l_query         VARCHAR2(32000 CHAR);
    --
    l_result        t_charts_tab_typ;
    l_result_rec    t_charts_typ;
    --
    l_entries_cur   SYS_REFCURSOR;

  BEGIN

    -- get region id of report region
    SELECT region_id
      INTO l_region_id
      FROM apex_application_page_ir ir
      JOIN apex_application_page_regions r USING(application_id, page_id, region_id)
     WHERE application_id = p_application_id
       AND page_id        = p_page_id
       AND static_id      = 'GetReportRegion';

    -- get alias of report
    SELECT report_alias
      INTO l_report_alias
      FROM apex_application_page_ir_rpt
     WHERE report_id = APEX_IR.GET_LAST_VIEWED_REPORT_ID(p_page_id, l_region_id);

    -- get query from report
    l_report := APEX_IR.GET_REPORT (
                     p_page_id   => p_page_id
                    ,p_region_id => l_region_id
                    ,p_view      => APEX_IR.C_VIEW_GROUPBY);

    l_query := l_report.sql_query;

    -- check if the reports are for blacklist
    IF p_application_id = 600 AND
       p_page_id = 1000
    THEN

      l_query := 'SELECT ' ||
                  CASE l_report_alias
                    WHEN 'YEARLY'   THEN 'exitflg AS additional_value, year as disp_value, apxws_gbfc_01 AS cnt, NULL AS filter_value'
                    WHEN 'MONTHLY'  THEN 'exitflg AS additional_value, year || ''/'' || month as disp_value, apxws_gbfc_01 AS cnt, NULL AS filter_value'
                    WHEN 'WEEKLY'   THEN 'exitflg AS additional_value, year || ''/'' || week as disp_value, apxws_gbfc_01 AS cnt, NULL AS filter_value'
                    WHEN 'DAILY'    THEN 'exitflg AS additional_value, year || ''/'' || month || ''/'' || day as disp_value, apxws_gbfc_01 AS cnt, NULL AS filter_value'
                    WHEN 'HOURLY'   THEN 'exitflg AS additional_value, hour as disp_value, apxws_gbfc_01 AS cnt, NULL AS filter_value'
                    ELSE NULL
                  END ||
                  ' FROM (' || l_query || ')';

    ELSIF p_application_id = 600 AND
          p_page_id = 1200
    THEN

      l_query := 'SELECT ' ||
                  CASE l_report_alias
                    WHEN 'YEARLY'   THEN 'NVL(nat,''Other'') AS additional_value, year as disp_value, apxws_gbfc_01 AS cnt, exitflg AS filter_value'
                    WHEN 'MONTHLY'  THEN 'NVL(nat,''Other'') AS additional_value, year || ''/'' || month as disp_value, apxws_gbfc_01 AS cnt, exitflg AS filter_value'
                    WHEN 'WEEKLY'   THEN 'NVL(nat,''Other'') AS additional_value, year || ''/'' || week as disp_value, apxws_gbfc_01 AS cnt, exitflg AS filter_value'
                    WHEN 'DAILY'    THEN 'NVL(nat,''Other'') AS additional_value, year || ''/'' || month || ''/'' || day as disp_value, apxws_gbfc_01 AS cnt, exitflg AS filter_value'
                    WHEN 'HOURLY'   THEN 'NVL(nat,''Other'') AS additional_value, hour as disp_value, apxws_gbfc_01 AS cnt, exitflg AS filter_value'
                    ELSE NULL
                  END ||
                  ' FROM (' || l_query || ')';


    ELSIF p_application_id = 600 AND
          p_page_id = 1300
    THEN

      l_query := 'SELECT ' ||
                  CASE l_report_alias
                    WHEN 'YEARLY'   THEN 'issuingcountry AS additional_value, year as disp_value, apxws_gbfc_01 AS cnt, NULL AS filter_value'
                    WHEN 'MONTHLY'  THEN 'issuingcountry AS additional_value, year || ''/'' || month as disp_value, apxws_gbfc_01 AS cn, NULL AS filter_value'
                    WHEN 'WEEKLY'   THEN 'issuingcountry AS additional_value, year || ''/'' || week as disp_value, apxws_gbfc_01 AS cnt, NULL AS filter_value'
                    WHEN 'DAILY'    THEN 'issuingcountry AS additional_value, year || ''/'' || month || ''/'' || day as disp_value, apxws_gbfc_01 AS cnt, NULL AS filter_value'
                    WHEN 'HOURLY'   THEN 'issuingcountry AS additional_value, hour as disp_value, apxws_gbfc_01 AS cnt, NULL AS filter_value'
                    ELSE NULL
                  END ||
                  ' FROM (' || l_query || ')';

    ELSIF p_application_id = 600 AND
          p_page_id = 1100
    THEN

      l_query := 'SELECT ' ||
                  CASE l_report_alias
                    WHEN 'YEARLY'   THEN 'type AS additional_value, year as disp_value, apxws_gbfc_01 AS cnt, NULL AS filter_value'
                    WHEN 'MONTHLY'  THEN 'type AS additional_value, year || ''/'' || month as disp_value, apxws_gbfc_01 AS cnt, NULL AS filter_value'
                    WHEN 'WEEKLY'   THEN 'type AS additional_value, year || ''/'' || week as disp_value, apxws_gbfc_01 AS cnt, NULL AS filter_value'
                    WHEN 'DAILY'    THEN 'type AS additional_value, year || ''/'' || month || ''/'' || day as disp_value, apxws_gbfc_01 AS cnt, NULL AS filter_value'
                    WHEN 'HOURLY'   THEN 'type AS additional_value, hour as disp_value, apxws_gbfc_01 AS cnt, NULL AS filter_value'
                    ELSE NULL
                  END ||
                  ' FROM (' || l_query || ')';

    END IF;

    logger.log('l_query: ' || l_query, l_scope, null, l_params);

    --l_query := 'SELECT null as additional_value, null as cnt, null as display_value FROM dual';

    -- set information with dynamic plsql / sql
    OPEN l_entries_cur FOR l_query USING 50000;
    LOOP

      FETCH l_entries_cur INTO l_result_rec;
      PIPE ROW(l_result_rec);
      EXIT WHEN l_entries_cur%NOTFOUND;
    END LOOP;
    CLOSE l_entries_cur;

    RETURN;

  EXCEPTION
    WHEN OTHERS
    THEN
      l_result_rec.additional_value := NULL;
      l_result_rec.disp_value := NULL;
      l_result_rec.cnt := NULL;
      l_result_rec.filter_value := NULL;
  END get_report_data;

END pkg_apex_util;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL_DATAMART"."PKG_APEX_UTIL" TO "DERMALOG_PROXY";
