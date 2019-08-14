CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL_DATAMART"."PKG_REPORTING" AS

/*******************************************************************************
 * Package to handle reporting queries for APEX
 *
 * Author    Date        Description
 * --------  ----------  -------------------------------------------------------*
 * CHageman  07.06.2018  Copied from database
 * CFunke    03.07.2018  Remove BC_DOC_TYPES
 *******************************************************************************/

-- gets the SQL for the standard time based report (traveler in/out, blacklist)
FUNCTION get_report_time_sql(
           i_facts IN VARCHAR2, -- 'MOVEMENTS' or 'INCIDENTS'

           -- Filter criteria
           i_dim_agents_id IN VARCHAR2,
           i_dim_ages_id IN VARCHAR2,
           i_dim_borderposts_id IN VARCHAR2,
           i_dim_document_types_id IN VARCHAR2,
           i_dim_genders_id IN VARCHAR2,
           i_dim_movment_types_id IN VARCHAR2,
           i_dim_nationalities_id IN VARCHAR2,
           i_dim_officers_id IN VARCHAR2,

           i_time_interval IN VARCHAR2, -- interval for the reports
           i_dim_times_date_from IN DATE,
           i_dim_times_date_to IN DATE,
           i_dim_times_hour_from IN NUMBER,
           i_dim_times_hour_to IN NUMBER,
           i_dim_times_year_id IN VARCHAR2, -- for drilldown (will come in future versions)
           i_dim_times_month_id IN VARCHAR2, -- for drilldown (will come in future versions)
           i_dim_times_week_id IN VARCHAR2, -- for drilldown (will come in future versions)
           i_dim_times_day_id IN VARCHAR2, -- for drilldown (will come in future versions)

           i_dim_transport_modes_id IN VARCHAR2,
           i_dim_visa_types_id IN VARCHAR2,

           -- if the sql is for a table
           i_is_for_table IN BOOLEAN,

           -- if the sql is for a chart series
           i_is_for_chart IN BOOLEAN,
           i_chart_series_name IN VARCHAR2,
           i_chart_series_movement_type IN VARCHAR2 -- filter movement type by this key value

         )
RETURN VARCHAR2;


FUNCTION get_report_country_sql(
           i_facts IN VARCHAR2, -- 'MOVEMENTS' or 'INCIDENTS'

           -- Filter criteria
           i_dim_agents_id IN VARCHAR2,
           i_dim_ages_id IN VARCHAR2,
           i_dim_borderposts_id IN VARCHAR2,
           i_dim_document_types_id IN VARCHAR2,
           i_dim_genders_id IN VARCHAR2,
           i_dim_movment_types_id IN VARCHAR2,
           i_dim_nationalities_id IN VARCHAR2,
           i_dim_officers_id IN VARCHAR2,

           i_time_interval IN VARCHAR2, -- interval for the reports
           i_dim_times_date_from IN DATE,
           i_dim_times_date_to IN DATE,
           i_dim_times_hour_from IN NUMBER,
           i_dim_times_hour_to IN NUMBER,
           i_dim_times_year_id IN VARCHAR2, -- for drilldown (will come in future versions)
           i_dim_times_month_id IN VARCHAR2, -- for drilldown (will come in future versions)
           i_dim_times_week_id IN VARCHAR2, -- for drilldown (will come in future versions)
           i_dim_times_day_id IN VARCHAR2, -- for drilldown (will come in future versions)

           i_dim_transport_modes_id IN VARCHAR2,
           i_dim_visa_types_id IN VARCHAR2,

           -- if the sql is for a table
           i_is_for_table IN BOOLEAN,

           -- if the sql is for a chart series
           i_is_for_chart IN BOOLEAN,
           i_chart_series_name IN VARCHAR2,
           i_chart_series_movement_type IN VARCHAR2 -- filter movement type by this key value
         )
RETURN VARCHAR2;


FUNCTION translate_agent(i_ID IN dl_bordercontrol_datamart.dim_agents.ID%TYPE)
  RETURN dl_bordercontrol_datamart.dim_agents.name%TYPE
  --RESULT_CACHE;
  ;

FUNCTION translate_borderpost(i_ID IN dl_bordercontrol_datamart.dim_borderposts.ID%TYPE)
  RETURN dl_bordercontrol_datamart.dim_borderposts.name%TYPE;
  --RESULT_CACHE;

FUNCTION translate_document_type(i_ID IN dl_bordercontrol_datamart.dim_document_types.ID%TYPE)
  RETURN dl_bordercontrol_datamart.dim_document_types.name%TYPE;
  --RESULT_CACHE;

FUNCTION translate_gender(i_ID IN dl_bordercontrol_datamart.dim_genders.ID%TYPE)
  RETURN dl_bordercontrol_datamart.dim_genders.description%TYPE;
  --RESULT_CACHE;

FUNCTION translate_movement_type(i_ID IN dl_bordercontrol_datamart.dim_movement_types.ID%TYPE)
  RETURN dl_bordercontrol_datamart.dim_movement_types.name%TYPE;
  --RESULT_CACHE;

FUNCTION translate_nationality(i_ID IN dl_bordercontrol_datamart.dim_nationalities.ID%TYPE)
  RETURN dl_bordercontrol_datamart.dim_nationalities.name%TYPE;
  --RESULT_CACHE;

FUNCTION translate_transport_mode(i_ID IN dl_bordercontrol_datamart.dim_transport_modes.ID%TYPE)
  RETURN dl_bordercontrol_datamart.dim_transport_modes.name%TYPE;
  --RESULT_CACHE;

FUNCTION translate_visa_type(i_ID IN dl_bordercontrol_datamart.dim_visa_types.ID%TYPE)
  RETURN dl_bordercontrol_datamart.dim_visa_types.name%TYPE;
  --RESULT_CACHE;

END PKG_REPORTING;
/
