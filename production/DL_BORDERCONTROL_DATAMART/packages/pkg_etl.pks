CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL_DATAMART"."PKG_ETL" AS

  -- constants
  gc_dim_time_year_start CONSTANT NUMBER(4) := 1980; -- for generating the time diemnsion
  gc_dim_time_year_end CONSTANT NUMBER(4) := 2067; -- start/end year

  gc_dim_age_year_start CONSTANT NUMBER(3) := 0; -- for generating the age diemnsion
  gc_dim_age_year_end CONSTANT NUMBER(3) := 200; -- start/end age

  gc_format_date_name CONSTANT VARCHAR(20) := 'AMERICAN'; -- NLS language setting (relates to en-US locale)
  gc_id_all_ages CONSTANT NUMBER := 0; -- the value which identifies for the time dimension that this age is part of "all ages"

  -- "empty" valu which is used when a field needed for a dimension
  -- is NULL in the MOVEMENTS/BORDERDOCUMENTS table. This makes joining
  -- the dimension tables possible which would not be possible with NULL
  -- values
  gc_empty_value CONSTANT VARCHAR2(20) := '(empty)'; -- string for empty
  gc_empty_key CONSTANT VARCHAR2(20) := '-100'; -- key for empty
  gc_empty_key_numeric CONSTANT NUMBER := -100; -- key for empty (numeric)
  gc_invalid_value CONSTANT VARCHAR2(20) := '(invalid)'; -- string for invalid
  gc_invalid_key CONSTANT VARCHAR2(20) := '-200'; -- key for invalid
  gc_invalid_key_numeric CONSTANT NUMBER := -200; -- key for invalid (numeric)

  gc_default_load_startdate CONSTANT DATE := TO_DATE('1970-01-01', 'YYYY-MM-DD'); -- if not data present in data mart, begin loading at this date

  -- procedures
  PROCEDURE initialize_dims;
  PROCEDURE initialize_dim_empty_values;
  PROCEDURE update_dim_agents;
  PROCEDURE update_dim_document_types;
  PROCEDURE update_dim_gender;
  PROCEDURE update_dim_movement_types;
  PROCEDURE update_dim_nationalities;
  PROCEDURE update_dim_transport_modes;
  PROCEDURE update_dim_visa_types;

  PROCEDURE initialize_dim_ages;
  PROCEDURE initialize_dim_time;

  PROCEDURE update_datamart;
  PROCEDURE create_testdata_fact_table( i_security_code IN NUMBER, -- must be 123456 so that we don't generate test data in the prod system accidentally
                                        i_start_year IN NUMBER, -- generate data from 1.1. of this year
                                        i_end_year IN NUMBER, -- generate data until 31.12. of this year
                                        i_min_movements IN NUMBER, -- minimum number of movements for each fact table record
                                        i_max_movements IN NUMBER, -- maximum
                                        i_min_incidents IN NUMBER, -- as above
                                        i_max_incidents IN NUMBER, -- as above
                                        i_num_combinations IN NUMBER -- number of dimension primary key value combinations per hour
  );

  PROCEDURE create_testdata_movements( i_security_code IN NUMBER, -- must be 123456 so that we don't generate test data in the prod system accidentally
                                        i_start_date IN DATE, -- generate data from this date
                                        i_end_date IN DATE, -- generate data up to this date
                                        i_num_movments_per_hour IN NUMBER -- movements to be generated per hour
  );

  PROCEDURE update_fact_table( i_import_run_ID IN dl_bordercontrol_datamart.import_runs.ID%type, o_count OUT dl_bordercontrol_datamart.import_runs.count%TYPE );
  PROCEDURE update_fact_table( i_date_from_incl IN DATE, -- import all movements from this date (including)
                               i_date_to_excl   IN DATE,  -- import all movements up to this date (excluding, the < operator is used)
                               i_import_run_ID IN dl_bordercontrol_datamart.import_runs.ID%type,
                               o_count OUT dl_bordercontrol_datamart.import_runs.count%TYPE
                               );

END PKG_ETL;
/
