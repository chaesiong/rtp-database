CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL_DATAMART"."PKG_REPORTING" AS
    /*******************************************************************************
    * Package to handle ETL processes
    *
    * Author    Date        Description
    * --------  ----------  -------------------------------------------------------*
	* CFunke    03.07.2018  Copied from database
    *******************************************************************************/

FUNCTION get_from_clause RETURN VARCHAR2 IS BEGIN
  RETURN 'FROM dl_bordercontrol_datamart.fact_border_movements fact_movements
        INNER JOIN dl_bordercontrol_datamart.dim_movement_types ON fact_movements.dimension_movement_types_id = dim_movement_types.id
        INNER JOIN dl_bordercontrol_datamart.dim_times dim_time ON fact_movements.dimension_time_id = dim_time.id
        INNER JOIN dl_bordercontrol_datamart.dim_nationalities dim_nationalities ON fact_movements.dimension_nationalities_id = dim_nationalities.id
        ';
END;

-- Returns the where clause using the dimension filters
FUNCTION get_where_clause(
           i_dim_agents_id IN VARCHAR2 DEFAULT NULL,
           i_dim_ages_id IN VARCHAR2 DEFAULT NULL,
           i_dim_borderposts_id IN VARCHAR2 DEFAULT NULL,
           i_dim_document_types_id IN VARCHAR2 DEFAULT NULL,
           i_dim_genders_id IN VARCHAR2 DEFAULT NULL,
           i_dim_movment_types_id IN VARCHAR2 DEFAULT NULL,
           i_dim_nationalities_id IN VARCHAR2 DEFAULT NULL,
           i_dim_officers_id IN VARCHAR2 DEFAULT NULL,

           i_time_interval IN VARCHAR2 DEFAULT NULL, -- interval for the reports
           i_dim_times_date_from IN DATE DEFAULT NULL,
           i_dim_times_date_to IN DATE DEFAULT NULL,
           i_dim_times_hour_from IN NUMBER DEFAULT NULL,
           i_dim_times_hour_to IN NUMBER DEFAULT NULL,
           i_dim_times_year_id IN VARCHAR2 DEFAULT NULL, -- for drilldown (will come in future versions)
           i_dim_times_month_id IN VARCHAR2 DEFAULT NULL, -- for drilldown (will come in future versions)
           i_dim_times_week_id IN VARCHAR2 DEFAULT NULL, -- for drilldown (will come in future versions)
           i_dim_times_day_id IN VARCHAR2 DEFAULT NULL, -- for drilldown (will come in future versions)



           i_dim_transport_modes_id IN VARCHAR2 DEFAULT NULL,
           i_dim_visa_types_id IN VARCHAR2 DEFAULT NULL

) RETURN VARCHAR2
IS
  l_sql_where VARCHAR2(4000);
BEGIN
    l_sql_where := 'WHERE 1=1';

    -- now add the filter conditions (APEX items)
    IF i_dim_agents_id IS NOT NULL THEN
      l_sql_where := l_sql_where || CHR(13) || 'AND DIMENSION_AGENTS_ID = ''' || i_dim_agents_id || '''';
    END IF;

    IF i_dim_ages_id IS NOT NULL THEN
      l_sql_where := l_sql_where || CHR(13) || 'AND DIMENSION_AGES_ID = ''' || i_dim_ages_id || '''';
    END IF;
    ---
    IF i_dim_borderposts_id IS NOT NULL THEN
      l_sql_where := l_sql_where || CHR(13) || 'AND DIMENSION_BORDER_POSTS_ID = ''' || i_dim_borderposts_id || '''';
    END IF;

    IF i_dim_agents_id IS NOT NULL THEN
      l_sql_where := l_sql_where || CHR(13) || 'AND DIMENSION_AGENTS_ID = ''' || i_dim_agents_id || '''';
    END IF;

    IF i_dim_document_types_id IS NOT NULL THEN
      l_sql_where := l_sql_where || CHR(13) || 'AND DIMENSION_DOCUMENT_TYPES_ID = ''' || i_dim_document_types_id || '''';
    END IF;

    IF i_dim_genders_id IS NOT NULL THEN
      l_sql_where := l_sql_where || CHR(13) || 'AND DIMENSION_GENDER_ID = ''' || i_dim_genders_id || '''';
    END IF;

    IF i_dim_movment_types_id IS NOT NULL THEN
      l_sql_where := l_sql_where || CHR(13) || 'AND DIMENSION_MOVEMENT_TYPES_ID = ''' || i_dim_movment_types_id || '''';
    END IF;

    IF i_dim_nationalities_id IS NOT NULL THEN
      l_sql_where := l_sql_where || CHR(13) || 'AND DIMENSION_NATIONALITIES_ID = ''' || i_dim_nationalities_id || '''';
    END IF;

    IF i_dim_officers_id IS NOT NULL THEN
      l_sql_where := l_sql_where || CHR(13) || 'AND DIMENSION_OFFICERS_ID = ''' || i_dim_officers_id || '''';
    END IF;

    IF i_dim_agents_id IS NOT NULL THEN
      l_sql_where := l_sql_where || CHR(13) || 'AND DIMENSION_AGENTS_ID = ''' || i_dim_agents_id || '''';
    END IF;


    -- time dimension ---------------------
    IF i_dim_times_year_id IS NOT NULL THEN
      l_sql_where := l_sql_where || CHR(13) || 'AND YEAR_NUMERIC = TO_NUMBER(' || i_dim_times_year_id || ')';
    END IF;

    IF i_dim_times_date_from IS NOT NULL THEN
      l_sql_where := l_sql_where || CHR(13) || 'AND DIMENSION_TIME_ID >= ' || TO_NUMBER(TO_CHAR(i_dim_times_date_from, 'YYYYMMDD') || LPAD(i_dim_times_hour_from, 2, '0')); -- from hour zero of the from date
    END IF;

    IF i_dim_times_date_to IS NOT NULL THEN
      l_sql_where := l_sql_where || CHR(13) || 'AND DIMENSION_TIME_ID <= ' || TO_NUMBER(TO_CHAR(i_dim_times_date_to, 'YYYYMMDD') || LPAD(i_dim_times_hour_from, 2, '0')); -- from hour zero of the from date
    END IF;

    IF i_dim_transport_modes_id IS NOT NULL THEN
      l_sql_where := l_sql_where || CHR(13) || 'AND DIMENSION_TRANSPORT_MODES_ID = ''' || i_dim_transport_modes_id || '''';
    END IF;

    IF i_dim_visa_types_id IS NOT NULL THEN
      l_sql_where := l_sql_where || CHR(13) || 'AND DIMENSION_VISA_TYPES_ID = ''' || i_dim_visa_types_id || '''';
    END IF;

    RETURN l_sql_where;
END;

  FUNCTION get_where_clause_realtime (i_dim_borderposts_id      IN VARCHAR2,
                                      i_dim_document_types_id   IN VARCHAR2,
                                      i_dim_genders_id          IN VARCHAR2,
                                      i_dim_nationalities_id    IN VARCHAR2,
                                      i_dim_officers_id         IN VARCHAR2,
                                      i_dim_transport_modes_id  IN VARCHAR2,
                                      i_dim_visa_types_id       IN VARCHAR2)
  RETURN VARCHAR2
  IS

    l_result VARCHAR(32000 CHAR);

  BEGIN

    IF i_dim_borderposts_id IS NOT NULL
    THEN
      l_result := l_result || CHR(13) || ' AND ins_borderpost = ''' || i_dim_borderposts_id || '''';
    END IF;

    IF i_dim_document_types_id IS NOT NULL
    THEN
      l_result := l_result || CHR(13) || ' AND docclass = ''' || i_dim_document_types_id || '''';
    END IF;

    IF i_dim_genders_id IS NOT NULL
    THEN
      l_result := l_result || CHR(13) || ' AND DECODE(sex, 1, ''MALE'', 2, ''FEMALE'', 3, ''UNKNOWN'') = ''' || i_dim_genders_id || '''';
    END IF;

    IF i_dim_nationalities_id IS NOT NULL
    THEN
      l_result := l_result || CHR(13) || ' AND issuectry = ''' || i_dim_nationalities_id || '''';
    END IF;

    -- TODO
    IF i_dim_officers_id IS NOT NULL
    THEN
      l_result := l_result || CHR(13) || ' AND ins_borderpost = ''' || i_dim_officers_id || '''';
    END IF;

    -- TODO
    IF i_dim_transport_modes_id IS NOT NULL
    THEN
      l_result := l_result || CHR(13) || ' AND ins_borderpost = ''' || i_dim_transport_modes_id || '''';
    END IF;

    IF i_dim_visa_types_id IS NOT NULL
    THEN
      l_result := l_result || CHR(13) || ' AND visa_type = ''' || i_dim_visa_types_id || '''';
    END IF;

    RETURN l_result;

  END get_where_clause_realtime;

-- gets the SQL for the time based movements statistics report (traveler in/out, blacklist)
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
RETURN VARCHAR2 IS
  l_sql_text VARCHAR2(4000);
  l_sql_select VARCHAR2(4000);
  l_sql_from VARCHAR2(4000);
  l_sql_where VARCHAR2(4000);
  l_sql_group_by VARCHAR2(4000);
  l_sql_order_by VARCHAR2(4000);
  l_sqlerrm VARCHAR2(4000);
  l_sqlcode NUMBER;
  l_fact_field VARCHAR2(30);
BEGIN

  BEGIN

    -- determine the facts field which represents the actual information
    -- displayed in this report
    IF i_facts = 'MOVEMENTS' THEN
      l_fact_field := 'COUNT_MOVEMENTS';
    ELSIF i_facts = 'INCIDENTS' THEN
      l_fact_field := 'COUNT_INCIDENTS';
    END IF;

    -- 1. Create the SELECT clause ---------------------------------------------
    IF i_is_for_chart THEN -- for charts

      IF i_time_interval = 'annually' THEN
        l_sql_select := 'SELECT NULL AS link, TO_CHAR(dim_time.year_numeric) AS label, SUM(' || l_fact_field || ')"'|| i_chart_series_name || '"';
      ELSIF i_time_interval = 'monthly' THEN
        l_sql_select := 'SELECT NULL AS link, TO_CHAR(dim_time.year_numeric) || '' '' || LPAD(dim_time.month_numeric, 2, ''0'') AS label, SUM(' || l_fact_field || ')"' || i_chart_series_name || '"';
      ELSIF i_time_interval = 'weekly' THEN
        l_sql_select := 'SELECT NULL AS link, TO_CHAR(dim_time.year_numeric) || '' '' || LPAD(dim_time.calweek_numeric, 2, ''0'') AS label, SUM(' || l_fact_field || ')"' || i_chart_series_name || '"';
      ELSIF i_time_interval = 'daily' THEN
        l_sql_select := 'SELECT NULL AS link, TO_CHAR(dim_time.year_numeric) || ''-'' || LPAD(TO_CHAR(dim_time.month_numeric), 2, ''0'') || ''-'' || LPAD(TO_CHAR(dim_time.day_numeric), 2, ''0'') AS label, SUM(' || l_fact_field || ')"' || i_chart_series_name || '"';
      ELSIF i_time_interval = 'hourly' THEN
        l_sql_select := 'SELECT NULL AS link, TO_CHAR(dim_time.year_numeric) || ''-'' || LPAD(TO_CHAR(dim_time.month_numeric), 2, ''0'') || ''-'' || LPAD(TO_CHAR(dim_time.day_numeric), 2, ''0'') || '' '' || LPAD(TO_CHAR(HOUR24_NUMERIC), 2, ''0'') || '':00'' AS label, SUM(' || l_fact_field || ')"' || i_chart_series_name || '"';
      END IF;

    ELSIF i_is_for_table THEN -- for reports (tables)

      IF i_time_interval = 'annually' THEN
        l_sql_select := 'SELECT dim_time.year_numeric"Year", dim_movement_types.NAME"Movement Type", SUM(' || l_fact_field || ')"Count"';
      ELSIF i_time_interval = 'monthly' THEN
        l_sql_select := 'SELECT dim_time.year_numeric"Year", dim_time.month_numeric"Month", dim_movement_types.NAME"Movement Type", SUM(' || l_fact_field || ')"Count"';
      ELSIF i_time_interval = 'weekly' THEN
        l_sql_select := 'SELECT dim_time.year_numeric"Year", dim_time.month_numeric"Month", dim_time.calweek_numeric"Cal.week", dim_movement_types.NAME"Movement Type", SUM(' || l_fact_field || ')"Count"';
      ELSIF i_time_interval = 'daily' THEN
        l_sql_select := 'SELECT dim_time.year_numeric"Year", dim_time.month_numeric"Month", dim_time.calweek_numeric"Cal.week", dim_time.day_numeric"Day", dim_movement_types.NAME"Movement Type", SUM(' || l_fact_field || ')"Count"';
      ELSIF i_time_interval = 'hourly' THEN
        l_sql_select := 'SELECT dim_time.year_numeric"Year", dim_time.month_numeric"Month", dim_time.calweek_numeric"Cal.week", dim_time.day_numeric"Day", dim_time.hour24_numeric"Hour", dim_movement_types.NAME"Movement Type", SUM(' || l_fact_field || ')"Count"';
      END IF;

    END IF;

    -- 2. Create the FROM clause -----------------------------------------------
    l_sql_from := get_from_clause();

    -- 3. Create the WHERE condition -------------------------------------------
    l_sql_where := get_where_clause(
           i_dim_agents_id => i_dim_agents_id,
           i_dim_ages_id => i_dim_ages_id,
           i_dim_borderposts_id  => i_dim_borderposts_id,
           i_dim_document_types_id  => i_dim_document_types_id,
           i_dim_genders_id  => i_dim_genders_id,
           i_dim_movment_types_id  => i_dim_movment_types_id,
           i_dim_nationalities_id  => i_dim_nationalities_id,
           i_dim_officers_id  => i_dim_officers_id,

           i_time_interval  => i_time_interval, -- interval for the reports
           i_dim_times_date_from  => i_dim_times_date_from,
           i_dim_times_date_to  => i_dim_times_date_to,
           i_dim_times_hour_from  => i_dim_times_hour_from,
           i_dim_times_hour_to  => i_dim_times_hour_to,
           i_dim_times_year_id  => i_dim_times_year_id, -- for drilldown (will come in future versions)
           i_dim_times_month_id  => i_dim_times_month_id, -- for drilldown (will come in future versions)
           i_dim_times_week_id  => i_dim_times_week_id, -- for drilldown (will come in future versions)
           i_dim_times_day_id  => i_dim_times_day_id, -- for drilldown (will come in future versions)

           i_dim_transport_modes_id => i_dim_transport_modes_id,
           i_dim_visa_types_id => i_dim_visa_types_id
    );

    -- add additional condition for filtering the current series movement type
    -- (arrival/deparutre/transit)
    IF i_is_for_chart AND i_chart_series_movement_type IS NOT NULL THEN -- for chart series, we need to filter the data accordingly
        l_sql_where := l_sql_where || CHR(13) ||
        'AND dimension_movement_types_id  = ''' || i_chart_series_movement_type || '''' ;
    ELSE -- is not for chart but for table
      NULL;
    END IF;


    -- 4. Create the GROUP BY condition ----------------------------------------
    -- depending on the aggregation level, create group by accordingly
    -- fortunately, for charts and tables, the sames group by can be used
    IF i_time_interval = 'annually' THEN
      l_sql_group_by := 'GROUP BY dim_time.year_numeric, dim_movement_types.NAME';
    ELSIF i_time_interval = 'monthly' THEN
      l_sql_group_by := 'GROUP BY dim_time.year_numeric, dim_time.month_numeric, dim_movement_types.NAME';
    ELSIF i_time_interval = 'weekly' THEN
      l_sql_group_by := 'GROUP BY dim_time.year_numeric, dim_time.month_numeric, dim_time.calweek_numeric,  dim_movement_types.NAME';
    ELSIF i_time_interval = 'daily' THEN
      l_sql_group_by := 'GROUP BY dim_time.year_numeric, dim_time.month_numeric, dim_time.calweek_numeric, dim_time.day_numeric, dim_movement_types.NAME';
    ELSIF i_time_interval = 'hourly' THEN
      l_sql_group_by := 'GROUP BY dim_time.year_numeric, dim_time.month_numeric, dim_time.calweek_numeric, dim_time.day_numeric, dim_time.hour24_numeric, dim_movement_types.NAME';
    END IF;

    /*
    IF i_is_for_chart THEN -- is for a chart
      l_sql_group_by := 'GROUP BY dim_time.year_numeric, dim_time.month_numeric, dim_movement_types.NAME';
    ELSIF i_is_for_table THEN -- is for a table
      l_sql_group_by := 'GROUP BY ' || i_group_by_columns;
    END IF;
    */


    -- 5. Create the ORDER BY clause -------------------------------------------
      IF i_time_interval = 'annually' THEN
        l_sql_order_by  := 'ORDER BY dim_time.year_numeric, dim_movement_types.NAME';
      ELSIF i_time_interval = 'monthly' THEN
        l_sql_order_by  := 'ORDER BY dim_time.year_numeric, dim_time.month_numeric, dim_movement_types.NAME';
      ELSIF i_time_interval = 'weekly' THEN
        l_sql_order_by  := 'ORDER BY dim_time.year_numeric, dim_time.month_numeric, dim_time.calweek_numeric,  dim_movement_types.NAME';
      ELSIF i_time_interval = 'daily' THEN
        l_sql_order_by  := 'ORDER BY dim_time.year_numeric, dim_time.month_numeric, dim_time.calweek_numeric, dim_time.day_numeric, dim_movement_types.NAME';
      ELSIF i_time_interval = 'hourly' THEN
        l_sql_order_by  := 'ORDER BY dim_time.year_numeric, dim_time.month_numeric, dim_time.calweek_numeric, dim_time.day_numeric, dim_time.hour24_numeric, dim_movement_types.NAME';
      END IF;


    -- now construct the whole SQL command
    l_sql_text := l_sql_select || CHR(13) || l_sql_from || CHR(13) ||
      l_sql_where || CHR(13) || l_sql_group_by || CHR(13) || l_sql_order_by;

    -- log the created SQL command
    INSERT INTO sql_reporting_log (
      sqltext_generated,
      create_timestamp
    ) VALUES (
      l_sql_text,
      SYSTIMESTAMP
    );
    COMMIT;

  EXCEPTION
    WHEN OTHERS THEN
      l_sqlerrm := SQLERRM;
      l_sqlcode := SQLCODE;
      ROLLBACK;

      INSERT INTO sql_reporting_log (
        sqltext_generated,
        create_timestamp,
        sqlerr,
        sqlcode
      ) VALUES (
        NULL,
        SYSTIMESTAMP,
        l_sqlerrm,
        l_sqlcode
      );
      COMMIT;
  END;

  RETURN l_sql_text;

END;


-- gets the SQL for the time based movements statistics report (traveler in/out, blacklist)
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
           i_chart_series_movement_type IN VARCHAR2 -- filter movement type by this key value (not implemented in this function because not needed)
         )
RETURN VARCHAR2 IS
    l_sql_text VARCHAR2(4000);
    l_sql_select VARCHAR2(4000);
    l_sql_from VARCHAR2(4000);
    l_sql_where VARCHAR2(4000);
    l_sql_group_by VARCHAR2(4000);
    l_sql_order_by VARCHAR2(4000);
    l_sqlerrm VARCHAR2(4000);
    l_sqlcode NUMBER;
    l_fact_field VARCHAR2(30);
BEGIN

  -- determine the facts field which represents the actual information
  -- displayed in this report
  IF i_facts = 'MOVEMENTS' THEN
    l_fact_field := 'COUNT_MOVEMENTS';
  ELSIF i_facts = 'INCIDENTS' THEN
    l_fact_field := 'COUNT_INCIDENTS';
  END IF;

  -- 1. Create the SELECT clause ---------------------------------------------
  IF i_is_for_chart THEN -- for charts

    -- no time hierarchy here
    l_sql_select := 'SELECT NULL AS link, dim_nationalities.name AS label, SUM(' || l_fact_field || ')"'|| i_chart_series_name || '"';

  ELSIF i_is_for_table THEN -- for reports (tables)

    IF i_time_interval = 'annually' THEN
      l_sql_select := 'SELECT dim_time.year_numeric"Year", dim_nationalities.name"Nationality", SUM(' || l_fact_field || ')"Count"';
    ELSIF i_time_interval = 'monthly' THEN
      l_sql_select := 'SELECT dim_time.year_numeric"Year", dim_time.month_numeric"Month", dim_nationalities.name"Nationality", SUM(' || l_fact_field || ')"Count"';
    ELSIF i_time_interval = 'weekly' THEN
      l_sql_select := 'SELECT dim_time.year_numeric"Year", dim_time.month_numeric"Month", dim_time.calweek_numeric"Cal.week", dim_nationalities.name"Nationality", SUM(' || l_fact_field || ')"Count"';
    END IF;

  END IF;

  -- 2. Create the FROM clause -----------------------------------------------
  l_sql_from := get_from_clause();

  -- 3. Create the WHERE condition -------------------------------------------
  l_sql_where := get_where_clause(
    i_dim_agents_id => i_dim_agents_id,
    i_dim_ages_id => i_dim_ages_id,
    i_dim_borderposts_id  => i_dim_borderposts_id,
    i_dim_document_types_id  => i_dim_document_types_id,
    i_dim_genders_id  => i_dim_genders_id,
    i_dim_movment_types_id  => i_dim_movment_types_id,
    i_dim_nationalities_id  => i_dim_nationalities_id,
    i_dim_officers_id  => i_dim_officers_id,

    i_time_interval  => i_time_interval, -- interval for the reports
    i_dim_times_date_from  => i_dim_times_date_from,
    i_dim_times_date_to  => i_dim_times_date_to,
    i_dim_times_hour_from  => i_dim_times_hour_from,
    i_dim_times_hour_to  => i_dim_times_hour_to,
    i_dim_times_year_id  => i_dim_times_year_id, -- for drilldown (will come in future versions)
    i_dim_times_month_id  => i_dim_times_month_id, -- for drilldown (will come in future versions)
    i_dim_times_week_id  => i_dim_times_week_id, -- for drilldown (will come in future versions)
    i_dim_times_day_id  => i_dim_times_day_id, -- for drilldown (will come in future versions)

    i_dim_transport_modes_id => i_dim_transport_modes_id,
    i_dim_visa_types_id => i_dim_visa_types_id
  );

  -- 4. Create the GROUP BY condition ----------------------------------------
  -- depending on the aggregation level, create group by accordingly
  -- fortunately, for charts and tables, the sames group by can be used
  IF i_is_for_chart THEN
    l_sql_group_by := 'GROUP BY dim_nationalities.name';
  ELSIF i_is_for_table THEN
    IF i_time_interval = 'annually' THEN
      l_sql_group_by := 'GROUP BY dim_nationalities.name, dim_time.year_numeric';
    ELSIF i_time_interval = 'monthly' THEN
      l_sql_group_by := 'GROUP BY dim_nationalities.name, dim_time.year_numeric, dim_time.month_numeric';
    ELSIF i_time_interval = 'weekly' THEN
      l_sql_group_by := 'GROUP BY dim_nationalities.name, dim_time.year_numeric, dim_time.month_numeric, dim_time.calweek_numeric';
    END IF;
  END IF;

  /*
  IF i_is_for_chart THEN -- is for a chart
    l_sql_group_by := 'GROUP BY dim_time.year_numeric, dim_time.month_numeric, dim_movement_types.NAME';
  ELSIF i_is_for_table THEN -- is for a table
    l_sql_group_by := 'GROUP BY ' || i_group_by_columns;
  END IF;
  */


  -- 5. Create the ORDER BY clause -------------------------------------------
  IF i_is_for_chart THEN
    l_sql_order_by := 'ORDER BY SUM(' || l_fact_field || ') DESC'; -- highest nationality first
  ELSIF i_is_for_table THEN
    IF i_time_interval = 'annually' THEN
      l_sql_order_by  := 'ORDER BY dim_time.year_numeric, dim_nationalities.name';
    ELSIF i_time_interval = 'monthly' THEN
      l_sql_order_by  := 'ORDER BY dim_time.year_numeric, dim_time.month_numeric, dim_nationalities.name';
    ELSIF i_time_interval = 'weekly' THEN
      l_sql_order_by  := 'ORDER BY dim_time.year_numeric, dim_time.month_numeric, dim_time.calweek_numeric, dim_nationalities.name';
    END IF;
  END IF;


  -- now construct the whole SQL command
  l_sql_text := l_sql_select || CHR(13) || l_sql_from || CHR(13) ||
    l_sql_where || CHR(13) || l_sql_group_by || CHR(13) || l_sql_order_by;

  -- log the created SQL command
  INSERT INTO sql_reporting_log (
    sqltext_generated,
    create_timestamp
  ) VALUES (
    l_sql_text,
    SYSTIMESTAMP
  );
  COMMIT;

  RETURN l_sql_text;

EXCEPTION
  WHEN OTHERS THEN BEGIN
    l_sqlerrm := SQLERRM;
    l_sqlcode := SQLCODE;
    ROLLBACK;

    INSERT INTO sql_reporting_log (
      sqltext_generated,
      create_timestamp,
      sqlerr,
      sqlcode
    ) VALUES (
      NULL,
      SYSTIMESTAMP,
      l_sqlerrm,
      l_sqlcode
    );
    COMMIT;
  END;

END;


-- Translation functions -------------------------------------------------------
-- returns the translated agent name. NULL when ID not found
FUNCTION translate_agent(i_ID IN dl_bordercontrol_datamart.dim_agents.ID%TYPE)
  RETURN dl_bordercontrol_datamart.dim_agents.name%TYPE
  --RESULT_CACHE RELIES_ON(DL_BORDERCONTROL.BORDERPOSTS$I18N)
  IS
    l_translation dl_bordercontrol_datamart.dim_agents.name%TYPE;
  BEGIN
    BEGIN
      SELECT NVL(display_value, display_value$DLC) INTO l_translation
      FROM DL_COMMON.CARRIERS$LC
      WHERE key_value = i_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN NULL;
    END;

    RETURN l_translation;
END;


-- returns the translated borderpost name. NULL when ID not found
FUNCTION translate_borderpost(i_ID IN dl_bordercontrol_datamart.dim_borderposts.ID%TYPE)
  RETURN dl_bordercontrol_datamart.dim_borderposts.name%TYPE
  --RESULT_CACHE RELIES_ON(DL_BORDERCONTROL.BORDERPOSTS$I18N)
  IS
    l_translation dl_bordercontrol_datamart.dim_borderposts.name%TYPE;
  BEGIN
    BEGIN
      SELECT NVL(name, name$DLC) INTO l_translation
      FROM DL_BORDERCONTROL.BORDERPOSTS$LC
      WHERE key_value = i_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN NULL;
    END;

    RETURN l_translation;
END;


-- remove table DL_COMMON.BC_DOC_TYPES$LC
-- returns the translated document type name. NULL when ID not found
FUNCTION translate_document_type(i_ID IN dl_bordercontrol_datamart.dim_document_types.ID%TYPE)
  RETURN dl_bordercontrol_datamart.dim_document_types.name%TYPE
  --RESULT_CACHE RELIES_ON(DL_COMMON.BC_DOC_TYPES$I18N)
  IS
    l_translation dl_bordercontrol_datamart.dim_document_types.name%TYPE;
  BEGIN
    BEGIN
      SELECT NVL(display_value, display_value$DLC) INTO l_translation
      FROM DL_COMMON.BC_DOC_CLASS$LC
      WHERE key_value = i_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN NULL;
    END;

    RETURN l_translation;
END;


-- returns the translated gender name. NULL when ID not found
FUNCTION translate_gender(i_ID IN dl_bordercontrol_datamart.dim_genders.ID%TYPE)
  RETURN dl_bordercontrol_datamart.dim_genders.description%TYPE
  --RESULT_CACHE RELIES_ON(DL_COMMON.human_sexes$I18N)
  IS
    l_translation dl_bordercontrol_datamart.dim_genders.description%TYPE;
  BEGIN
    BEGIN
      SELECT NVL(display_value, display_value$DLC) INTO l_translation
      FROM DL_COMMON.HUMAN_SEXES$LC
      WHERE key_value = i_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN NULL;
    END;

    RETURN l_translation;
END;


-- returns the translated movement type name. NULL when ID not found
FUNCTION translate_movement_type(i_ID IN dl_bordercontrol_datamart.dim_movement_types.ID%TYPE)
  RETURN dl_bordercontrol_datamart.dim_movement_types.name%TYPE
  --RESULT_CACHE RELIES_ON(DL_COMMON.PORT_MOVEMENTS$I18N)
  IS
    l_translation dl_bordercontrol_datamart.dim_movement_types.name%TYPE;
  BEGIN
    BEGIN
      SELECT NVL(display_value, display_value$DLC) INTO l_translation
      FROM DL_COMMON.PORT_MOVEMENTS$LC
      WHERE key_value = i_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN NULL;
    END;

    RETURN l_translation;
END;


-- returns the translated nationallity name. NULL when ID not found
FUNCTION translate_nationality(i_ID IN dl_bordercontrol_datamart.dim_nationalities.ID%TYPE)
  RETURN dl_bordercontrol_datamart.dim_nationalities.name%TYPE
  --RESULT_CACHE RELIES_ON(DL_COMMON.ICAO_DOC_CODES$I18N)
  IS
    l_translation dl_bordercontrol_datamart.dim_nationalities.name%TYPE;
  BEGIN
    BEGIN
      SELECT NVL(display_value, display_value$DLC) INTO l_translation
      FROM DL_COMMON.ICAO_DOC_CODES$LC
      WHERE key_value = i_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN NULL;
    END;

    RETURN l_translation;
END;


-- returns the translated transport mode name. NULL when ID not found
FUNCTION translate_transport_mode(i_ID IN dl_bordercontrol_datamart.dim_transport_modes.ID%TYPE)
  RETURN dl_bordercontrol_datamart.dim_transport_modes.name%TYPE
  --RESULT_CACHE RELIES_ON(DL_COMMON.TRANS_MODES$I18N)
  IS
    l_translation dl_bordercontrol_datamart.dim_transport_modes.name%TYPE;
  BEGIN
    BEGIN
      SELECT NVL(display_value, display_value$DLC) INTO l_translation
      FROM DL_COMMON.TRANS_MODES$LC
      WHERE key_value = i_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN NULL;
    END;

    RETURN l_translation;
END;


-- returns the translated visa type name. NULL when ID not found
FUNCTION translate_visa_type(i_ID IN dl_bordercontrol_datamart.dim_visa_types.ID%TYPE)
  RETURN dl_bordercontrol_datamart.dim_visa_types.name%TYPE
  --RESULT_CACHE RELIES_ON(DL_COMMON.visa_typesS$I18N)
  IS
    l_translation dl_bordercontrol_datamart.dim_visa_types.name%TYPE;
  BEGIN
    BEGIN
      SELECT NVL(display_value, display_value$DLC) INTO l_translation
      FROM DL_COMMON.visa_types$LC
      WHERE key_value = i_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN NULL;
    END;

    RETURN l_translation;
END;


END PKG_REPORTING;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL_DATAMART"."PKG_REPORTING" TO "DERMALOG_PROXY";
