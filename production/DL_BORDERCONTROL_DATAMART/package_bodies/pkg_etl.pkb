CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL_DATAMART"."PKG_ETL" AS

    /*******************************************************************************
    * Package to handle ETL processes
    *
    * Author    Date        Description
    * --------  ----------  -------------------------------------------------------*
    * CHageman  07.06.2018  Copied from database
    *******************************************************************************/

  -- logs an event
  --  g_log_scope_prefix CONSTANT logger.logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';

    PROCEDURE log_import_run_event (
        i_run_id          IN import_runs.id%TYPE,
        i_event_type_id   IN event_types.id%TYPE,
        i_sqlcode         IN NUMBER,
        i_sqlerrm         IN VARCHAR2,
        i_remark          IN VARCHAR2
    ) AS
        l_new_id   import_run_events.id%TYPE := seq_import_run_events.nextval;
        PRAGMA autonomous_transaction;
    BEGIN
        INSERT INTO dl_bordercontrol_datamart.import_run_events (
            id,
            import_run_id,
            event_type_id,
            sqlcode,
            sqlerrm,
            insert_timestamp,
            remark
        ) VALUES (
            l_new_id,
            i_run_id,
            i_event_type_id,
            i_sqlcode,
            i_sqlerrm,
            systimestamp,
            i_remark
        );

        COMMIT; -- is autonomous transaction which is seperate from the main program
    END;

    PROCEDURE update_dim_visa_types
        AS
    BEGIN
        MERGE INTO dl_bordercontrol_datamart.dim_visa_types target USING
            ( SELECT
                key_value,
                display_value
            FROM
                dl_common.visa_types
            )
        source ON (
            target.id = source.key_value
        ) WHEN MATCHED THEN
            UPDATE
        SET target.name = source.display_value,
            target.modify_timestamp = systimestamp
        WHERE
            (
                target.name <> source.display_value
            ) -- update only if there are changes
        WHEN NOT MATCHED THEN INSERT ( target.id,target.name,target.create_timestamp ) VALUES ( source.key_value,source.display_value,systimestamp )
;

    END;

    PROCEDURE update_dim_transport_modes
        AS
    BEGIN
        MERGE INTO dl_bordercontrol_datamart.dim_transport_modes target USING
            ( SELECT
                key_value,
                display_value
            FROM
                dl_common.trans_modes
            )
        source ON (
            target.id = source.key_value
        ) WHEN MATCHED THEN
            UPDATE
        SET target.name = source.display_value,
            target.modify_timestamp = systimestamp
        WHERE
            (
                target.name <> source.display_value
            ) -- update only if there are changes
        WHEN NOT MATCHED THEN INSERT ( target.id,target.name,target.create_timestamp ) VALUES ( source.key_value,source.display_value,systimestamp )
;

    END;

    PROCEDURE update_dim_nationalities
        AS
    BEGIN
        MERGE INTO dl_bordercontrol_datamart.dim_nationalities target USING
            ( SELECT
                key_value,
                display_value
            FROM
                dl_common.icao_doc_codes
            )
        source ON (
            target.id = source.key_value
        ) WHEN MATCHED THEN
            UPDATE
        SET target.name = source.display_value,
            target.modify_timestamp = systimestamp
        WHERE
            (
                target.name <> source.display_value
            ) -- update only if there are changes
        WHEN NOT MATCHED THEN INSERT ( target.id,target.name,target.create_timestamp ) VALUES ( source.key_value,source.display_value,systimestamp )
;

    END;

    PROCEDURE update_dim_movement_types
        AS
    BEGIN
        MERGE INTO dl_bordercontrol_datamart.dim_movement_types target USING
            ( SELECT
                key_value,
                display_value
            FROM
                dl_common.port_movements
            )
        source ON (
            target.id = source.key_value
        ) WHEN MATCHED THEN
            UPDATE
        SET target.name = source.display_value,
            target.modify_timestamp = systimestamp
        WHERE
            (
                target.name <> source.display_value
            ) -- update only if there are changes
        WHEN NOT MATCHED THEN INSERT ( target.id,target.name,target.create_timestamp ) VALUES ( source.key_value,source.display_value,systimestamp )
;

    END;

    PROCEDURE update_dim_gender
        AS
    BEGIN
        MERGE INTO dl_bordercontrol_datamart.dim_genders target USING
            ( SELECT
                key_value,
                icao,
                display_value
            FROM
                dl_common.human_sexes
            )
        source ON (
            target.id = source.key_value
        ) WHEN MATCHED THEN
            UPDATE
        SET target.shortcode = source.icao,
            target.description = source.display_value,
            target.modify_timestamp = systimestamp
        WHERE
            (
                    target.shortcode <> source.icao
                OR
                    target.description <> source.display_value
            ) -- update only if there are changes
        WHEN NOT MATCHED THEN INSERT ( target.id,target.shortcode,target.description,target.create_timestamp ) VALUES ( source.key_value,source.icao
,source.display_value,systimestamp );

    END;

    PROCEDURE update_dim_borderposts
        AS
    BEGIN
        MERGE INTO dl_bordercontrol_datamart.dim_borderposts target USING
            ( SELECT
                key_value,
                name
            FROM
                dl_bordercontrol.borderposts
            )
        source ON (
            target.id = source.key_value
        ) WHEN MATCHED THEN
            UPDATE
        SET target.name = source.name,
            target.modify_timestamp = systimestamp
        WHERE
            (
                target.name <> source.name
            ) -- update only if there are changes
        WHEN NOT MATCHED THEN INSERT ( target.id,target.name,target.create_timestamp ) VALUES ( source.key_value,source.name,systimestamp );

    END;

    PROCEDURE update_dim_document_types
        AS
    BEGIN
        MERGE INTO dl_bordercontrol_datamart.dim_document_types target USING
            ( SELECT
                key_value,
                display_value
            FROM
                dl_common.bc_doc_types
            )
        source ON (
            target.id = source.key_value
        ) WHEN MATCHED THEN
            UPDATE
        SET target.name = source.display_value,
            target.modify_timestamp = systimestamp
        WHERE
            (
                target.name <> source.display_value
            ) -- update only if there are changes
        WHEN NOT MATCHED THEN INSERT ( target.id,target.name,target.create_timestamp ) VALUES ( source.key_value,source.display_value,systimestamp )
;

    END;

    PROCEDURE update_dim_agents
        AS
    BEGIN
        MERGE INTO dl_bordercontrol_datamart.dim_agents target USING
            ( SELECT
                key_value,
                display_value,
                icao,
                iata
            FROM
                dl_common.carriers
            )
        source ON (
            target.id = TO_CHAR(source.key_value)
        ) WHEN MATCHED THEN
            UPDATE
        SET target.name = source.display_value,
            target.icao = source.icao,
            target.iata = source.iata,
            target.modify_timestamp = systimestamp
        WHERE
            (
                    target.name <> source.display_value
                OR
                    target.icao <> source.icao
                OR
                    target.iata <> source.iata
            ) -- update only if there are changes
        WHEN NOT MATCHED THEN INSERT ( target.id,target.name,target.icao,target.iata,target.create_timestamp ) VALUES ( source.key_value,source.display_value
,source.icao,source.iata,systimestamp );

    END;

    PROCEDURE update_dim_officers
        AS
    BEGIN
        MERGE INTO dl_bordercontrol_datamart.dim_officers target USING
            ( SELECT
                id,
                username
            FROM
                user_management.users_lt
            )
        source ON (
            target.id = source.id
        ) WHEN MATCHED THEN
            UPDATE
        SET target.username = source.username,
            target.modify_timestamp = systimestamp
        WHERE
            (
                target.username <> source.username
            ) -- update only if there are changes
        WHEN NOT MATCHED THEN INSERT ( target.id,target.username,target.create_timestamp ) VALUES ( source.id,source.username,systimestamp );

    END;

  -- Updates all the dimensions that are derived from the
  -- operative lookup tables. Calculdated Dimensions such as the time
  -- dimension are not updated.

    PROCEDURE update_dims ( i_import_run_id   IN dl_bordercontrol_datamart.import_runs.id%TYPE )
        AS
    BEGIN
        log_import_run_event(
            i_run_id          => i_import_run_id,
            i_event_type_id   => 'START_UPDATE_DIMS',
            i_sqlcode         => NULL,
            i_sqlerrm         => NULL,
            i_remark          => NULL
        );

        log_import_run_event(
            i_run_id          => i_import_run_id,
            i_event_type_id   => 'START_UPDATE_DIM_AGENTS',
            i_sqlcode         => NULL,
            i_sqlerrm         => NULL,
            i_remark          => NULL
        );

        update_dim_agents;
        log_import_run_event(
            i_run_id          => i_import_run_id,
            i_event_type_id   => 'START_UPDATE_DIM_BORDERPOSTS',
            i_sqlcode         => NULL,
            i_sqlerrm         => NULL,
            i_remark          => NULL
        );

        update_dim_borderposts;
        log_import_run_event(
            i_run_id          => i_import_run_id,
            i_event_type_id   => 'START_UPDATE_DIM_DOCUMENTS_TYPES',
            i_sqlcode         => NULL,
            i_sqlerrm         => NULL,
            i_remark          => NULL
        );

        update_dim_document_types;
        log_import_run_event(
            i_run_id          => i_import_run_id,
            i_event_type_id   => 'START_UPDATE_DIM_GENDER',
            i_sqlcode         => NULL,
            i_sqlerrm         => NULL,
            i_remark          => NULL
        );

        update_dim_gender;
        log_import_run_event(
            i_run_id          => i_import_run_id,
            i_event_type_id   => 'START_UPDATE_DIM_MOVEMENT_TYPES',
            i_sqlcode         => NULL,
            i_sqlerrm         => NULL,
            i_remark          => NULL
        );

        update_dim_movement_types;
        log_import_run_event(
            i_run_id          => i_import_run_id,
            i_event_type_id   => 'START_UPDATE_DIM_NATIONALITIES',
            i_sqlcode         => NULL,
            i_sqlerrm         => NULL,
            i_remark          => NULL
        );

        update_dim_nationalities;
        log_import_run_event(
            i_run_id          => i_import_run_id,
            i_event_type_id   => 'START_UPDATE_DIM_TRANSPORT_MODES',
            i_sqlcode         => NULL,
            i_sqlerrm         => NULL,
            i_remark          => NULL
        );

        update_dim_transport_modes;
        log_import_run_event(
            i_run_id          => i_import_run_id,
            i_event_type_id   => 'START_UPDATE_DIM_VISA_TYPES',
            i_sqlcode         => NULL,
            i_sqlerrm         => NULL,
            i_remark          => NULL
        );

        update_dim_visa_types;
        log_import_run_event(
            i_run_id          => i_import_run_id,
            i_event_type_id   => 'START_UPDATE_DIM_OFFICERS',
            i_sqlcode         => NULL,
            i_sqlerrm         => NULL,
            i_remark          => NULL
        );

        update_dim_officers;
        log_import_run_event(
            i_run_id          => i_import_run_id,
            i_event_type_id   => 'END_UPDATE_DIMS',
            i_sqlcode         => NULL,
            i_sqlerrm         => NULL,
            i_remark          => NULL
        );

    END;

  -- Initializes the agea dimension. Table has to empty.

    PROCEDURE initialize_dim_ages
        AS
    BEGIN
        FOR l_age IN gc_dim_age_year_start..gc_dim_age_year_end LOOP -- loop from min to max age
            INSERT INTO dl_bordercontrol_datamart.dim_ages (
                id,
                id_age_group_10,
                id_all_ages,
                create_timestamp
            ) VALUES (
                l_age,-- id_age,
                floor(l_age / 10) * 10,-- id_age_group_10 (10 year intervals),
                gc_id_all_ages,-- id_all_ages,
                systimestamp -- create_timestamp
            );

        END LOOP;

        COMMIT;
    END;

  -- Initializes the time dimension. Table has to empty.

    PROCEDURE initialize_dim_time AS
        l_current_date             DATE;
        l_current_date_with_hour   DATE; -- includes also the hour
    BEGIN
        FOR l_year IN gc_dim_time_year_start..gc_dim_time_year_end LOOP
            FOR l_month IN 1..12 LOOP
                l_current_date := TO_DATE(
                    TO_CHAR(l_year)
                     || '-'
                     || TO_CHAR(l_month)
                     || '-'
                     || '01',
                    'YYYY-MM-DD'
                ); -- go to first of month

                WHILE extract ( MONTH FROM l_current_date ) = l_month LOOP -- loop over days of this month
                    FOR l_hour IN 0..23 LOOP
                        l_current_date_with_hour := l_current_date + l_hour / 24; -- add 1 hour
            -- insert the current date into the time dimension table:
                        INSERT INTO dl_bordercontrol_datamart.dim_times (
                            id,
                            year_numeric,
                            month_numeric,
                            weekday_numeric,
                            hour24_numeric,
                            month_name,
                            weekday_name,
                            quarter_numeric,
                            quarter_name,
                            calweek_numeric,
                            create_timestamp,
                            date_value,
                            day_numeric
                        ) VALUES (
                            to_number(TO_CHAR(
                                l_current_date_with_hour,
                                'YYYYMMDDHH24'
                            ) ),-- id,
                            EXTRACT(YEAR FROM l_current_date_with_hour),-- year_numeric,
                            EXTRACT(MONTH FROM l_current_date_with_hour),-- month_numeric,
                            to_number(TO_CHAR(
                                l_current_date_with_hour,
                                'D'
                            ) ),-- weekday_numeric,
                            to_number(TO_CHAR(
                                l_current_date_with_hour,
                                'HH24'
                            ) ),-- hour24_numeric,
                            TO_CHAR(
                                l_current_date_with_hour,
                                'Month',
                                'NLS_DATE_LANGUAGE=' || gc_format_date_name
                            ),-- month_name,
                            TO_CHAR(
                                l_current_date_with_hour,
                                'Day',
                                'NLS_DATE_LANGUAGE=' || gc_format_date_name
                            ),-- weekday_name,
                            to_number(TO_CHAR(
                                l_current_date_with_hour,
                                'Q'
                            ) ),-- quarter_numeric,
                            'Quarter ' || TO_CHAR(
                                l_current_date_with_hour,
                                'Q'
                            ),-- quarter_name,
                            to_number(TO_CHAR(
                                l_current_date_with_hour,
                                'IW'
                            ) ),-- calweek_numeric,
                            systimestamp,-- create_timestamp,
                            l_current_date_with_hour,-- date_value
                            to_number(TO_CHAR(
                                l_current_date_with_hour,
                                'DD'
                            ) )--day_numeric
                        );

                    END LOOP;

                    l_current_date := l_current_date + 1; -- next day in this month
                END LOOP;

                COMMIT; -- for each month,commit the generated dates
            END LOOP;
        END LOOP;
    END;

  -- Initializes the calculated dimensions DIM_TIME and DIM_AGES for first time
  -- For security reasons,have to be emptied manually before

    PROCEDURE initialize_calculated_dims
        AS
    BEGIN
        initialize_dim_time;
        initialize_dim_ages;
    END;

  -- insert the "empty" values for the dimensions,because not every value
  -- has to be not-NULL in the MOVEMENTS/BORDERDOCUMENTS tables

    PROCEDURE initialize_dim_empty_values
        AS
    BEGIN
        INSERT INTO dim_agents (
            id,
            name,
            create_timestamp,
            modify_timestamp,
            icao,
            iata
        ) VALUES (
            gc_empty_key,
            gc_empty_value,
            systimestamp,
            NULL,
            NULL,
            NULL
        );

        INSERT INTO dim_agents (
            id,
            name,
            create_timestamp,
            modify_timestamp,
            icao,
            iata
        ) VALUES (
            gc_invalid_key,
            gc_invalid_value,
            systimestamp,
            NULL,
            NULL,
            NULL
        );

    ----------------------------------------------------------------------------

        INSERT INTO dim_ages (
            id,
            id_age_group_10,
            id_all_ages,
            create_timestamp,
            modify_timestamp
        ) VALUES (
            gc_empty_key_numeric,-- id,
            NULL,-- id_age_group_10,
            gc_id_all_ages,-- id_all_ages,
            systimestamp,-- create_timestamp,
            NULL -- modify_timestamp
        );

        INSERT INTO dim_ages (
            id,
            id_age_group_10,
            id_all_ages,
            create_timestamp,
            modify_timestamp
        ) VALUES (
            gc_invalid_key_numeric,-- id,
            NULL,-- id_age_group_10,
            gc_id_all_ages,-- id_all_ages,
            systimestamp,-- create_timestamp,
            NULL -- modify_timestamp
        );

    ----------------------------------------------------------------------------

        INSERT INTO dim_borderposts (
            id,
            name,
            city,
            country,
            iata_faa_code,
            latitude,
            longitude,
            altitude,
            timezone,
            dst,
            create_timestamp,
            modify_timestamp
        ) VALUES (
            gc_empty_key,-- id,
            gc_empty_value,-- name,
            NULL,-- city,
            NULL,-- country,
            NULL,-- iata_faa_code,
            NULL,-- latitude,
            NULL,-- longitude,
            NULL,-- altitude,
            NULL,-- timezone
            NULL,-- dst,
            systimestamp,-- create_timestamp,
            NULL -- modify_timestamp
        );

        INSERT INTO dim_borderposts (
            id,
            name,
            city,
            country,
            iata_faa_code,
            latitude,
            longitude,
            altitude,
            timezone,
            dst,
            create_timestamp,
            modify_timestamp
        ) VALUES (
            gc_invalid_key,-- id,
            gc_invalid_value,-- name,
            NULL,-- city,
            NULL,-- country,
            NULL,-- iata_faa_code,
            NULL,-- latitude,
            NULL,-- longitude,
            NULL,-- altitude,
            NULL,-- timezone
            NULL,-- dst,
            systimestamp,-- create_timestamp,
            NULL -- modify_timestamp
        );

    ----------------------------------------------------------------------------

        INSERT INTO dim_document_types (
            id,
            name,
            create_timestamp,
            modify_timestamp
        ) VALUES (
            gc_empty_key,-- id,
            gc_empty_value,-- name,
            systimestamp,-- create_timestamp,
            NULL -- modify_timestamp
        );

        INSERT INTO dim_document_types (
            id,
            name,
            create_timestamp,
            modify_timestamp
        ) VALUES (
            gc_invalid_key,-- id,
            gc_invalid_value,-- name,
            systimestamp,-- create_timestamp,
            NULL -- modify_timestamp
        );

    ----------------------------------------------------------------------------

        INSERT INTO dim_genders (
            id,
            shortcode,
            description,
            create_timestamp,
            modify_timestamp
        ) VALUES (
            gc_empty_key,-- id,
            gc_empty_value,-- shortcode,
            gc_empty_value,-- description,
            systimestamp,-- create_timestamp,
            NULL -- modify_timestamp
        );

        INSERT INTO dim_genders (
            id,
            shortcode,
            description,
            create_timestamp,
            modify_timestamp
        ) VALUES (
            gc_invalid_key,-- id,
            gc_invalid_value,-- shortcode,
            gc_invalid_value,-- description,
            systimestamp,-- create_timestamp,
            NULL -- modify_timestamp
        );

    ----------------------------------------------------------------------------

        INSERT INTO dim_nationalities (
            id,
            name,
            create_timestamp,
            modify_timestamp
        ) VALUES (
            gc_empty_key,-- id,
            gc_empty_value,-- name,
            systimestamp,-- create_timestamp,
            NULL -- modify_timestamp
        );

        INSERT INTO dim_nationalities (
            id,
            name,
            create_timestamp,
            modify_timestamp
        ) VALUES (
            gc_invalid_key,-- id,
            gc_invalid_value,-- name,
            systimestamp,-- create_timestamp,
            NULL -- modify_timestamp
        );

    ----------------------------------------------------------------------------

        INSERT INTO dim_officers (
            id,
            username,
            create_timestamp,
            modify_timestamp
        ) VALUES (
            gc_empty_key,-- id,
            gc_empty_value,-- username,
            systimestamp,-- create_timestamp,
            NULL -- modify_timestamp
        );

        INSERT INTO dim_officers (
            id,
            username,
            create_timestamp,
            modify_timestamp
        ) VALUES (
            gc_invalid_key,-- id,
            gc_invalid_value,-- username,
            systimestamp,-- create_timestamp,
            NULL -- modify_timestamp
        );

    ----------------------------------------------------------------------------

        INSERT INTO dim_times (
            id,
            year_numeric,
            month_numeric,
            weekday_numeric,
            hour24_numeric,
            month_name,
            weekday_name,
            quarter_numeric,
            quarter_name,
            calweek_numeric,
            create_timestamp,
            date_value,
            day_numeric,
            modify_timestamp
        ) VALUES (
            gc_empty_key,-- id,
            NULL,-- year_numeric,
            NULL,-- month_numeric,
            NULL,-- weekday_numeric,
            NULL,-- hour24_numeric
            NULL,-- month_name
            NULL,-- weekday_name
            NULL,-- quarter_numeric
            NULL,-- quarter_name
            NULL,-- calweek_numeric
            systimestamp,-- create_timestamp
            NULL,-- date_value
            NULL,-- day_numeric
            NULL -- modify_timestamp
        );

        INSERT INTO dim_times (
            id,
            year_numeric,
            month_numeric,
            weekday_numeric,
            hour24_numeric,
            month_name,
            weekday_name,
            quarter_numeric,
            quarter_name,
            calweek_numeric,
            create_timestamp,
            date_value,
            day_numeric,
            modify_timestamp
        ) VALUES (
            gc_invalid_key,-- id,
            NULL,-- year_numeric,
            NULL,-- month_numeric,
            NULL,-- weekday_numeric,
            NULL,-- hour24_numeric
            NULL,-- month_name
            NULL,-- weekday_name
            NULL,-- quarter_numeric
            NULL,-- quarter_name
            NULL,-- calweek_numeric
            systimestamp,-- create_timestamp
            NULL,-- date_value
            NULL,-- day_numeric
            NULL -- modify_timestamp
        );

    ----------------------------------------------------------------------------

        INSERT INTO dim_transport_modes (
            id,
            name,
            create_timestamp,
            modify_timestamp
        ) VALUES (
            gc_empty_key,-- id,
            gc_empty_value,-- name,
            systimestamp,-- create_timestamp,
            NULL -- modify_timestamp
        );

        INSERT INTO dim_transport_modes (
            id,
            name,
            create_timestamp,
            modify_timestamp
        ) VALUES (
            gc_invalid_key,-- id,
            gc_invalid_value,-- name,
            systimestamp,-- create_timestamp,
            NULL -- modify_timestamp
        );

    ----------------------------------------------------------------------------

        INSERT INTO dim_movement_types (
            id,
            name,
            create_timestamp,
            modify_timestamp
        ) VALUES (
            gc_empty_key,--id,
            gc_empty_value,--name,
            systimestamp,--create_timestamp,
            NULL--modify_timestamp
        );

        INSERT INTO dim_movement_types (
            id,
            name,
            create_timestamp,
            modify_timestamp
        ) VALUES (
            gc_invalid_key,--id,
            gc_invalid_value,--name,
            systimestamp,--create_timestamp,
            NULL--modify_timestamp
        );

    ----------------------------------------------------------------------------

        INSERT INTO dim_visa_types (
            id,
            name,
            create_timestamp,
            modify_timestamp
        ) VALUES (
            gc_empty_key,-- id,
            gc_empty_value,-- name,
            systimestamp,-- create_timestamp,
            NULL -- modify_timestamp
        );

        INSERT INTO dim_visa_types (
            id,
            name,
            create_timestamp,
            modify_timestamp
        ) VALUES (
            gc_invalid_key,-- id,
            gc_invalid_value,-- name,
            systimestamp,-- create_timestamp,
            NULL -- modify_timestamp
        );

    END; -- initialize_dim_empty_values


  -- initializes the dimensions for the first time after installation

    PROCEDURE initialize_dims AS
        l_run_id   import_runs.id%TYPE;
    BEGIN
        l_run_id := seq_run.nextval;
        INSERT INTO dl_bordercontrol_datamart.import_runs (
            id,
            starttime,
            endtime,
            count
        ) VALUES (
            l_run_id,
            SYSDATE,
            NULL,
            NULL
        );

        COMMIT;
        log_import_run_event(
            i_run_id          => l_run_id,
            i_event_type_id   => 'START_INIT_DIMS',
            i_sqlcode         => NULL,
            i_sqlerrm         => NULL,
            i_remark          => NULL
        );

    -- log end of dimension initialization

        log_import_run_event(
            i_run_id          => l_run_id,
            i_event_type_id   => 'START_INIT_CALC_DIMS',
            i_sqlcode         => NULL,
            i_sqlerrm         => NULL,
            i_remark          => NULL
        );

        initialize_calculated_dims ();

    -- log end of dimension initialization
        log_import_run_event(
            i_run_id          => l_run_id,
            i_event_type_id   => 'START_INIT_DIM_EMPTY_VALUES',
            i_sqlcode         => NULL,
            i_sqlerrm         => NULL,
            i_remark          => NULL
        );

        initialize_dim_empty_values ();

    -- log end of dimension initialization
        log_import_run_event(
            i_run_id          => l_run_id,
            i_event_type_id   => 'START_UPDATE_DIMS',
            i_sqlcode         => NULL,
            i_sqlerrm         => NULL,
            i_remark          => NULL
        );

    -- now update the dimensions for the first time. since this is the first
    -- update,it means that they are being filled the first time.

        update_dims(l_run_id); -- logs on its own
        UPDATE import_runs
            SET
                endtime = systimestamp
        WHERE
            id = l_run_id;

        COMMIT;
    END;

    PROCEDURE update_fact_table (
        i_date_from_incl   IN DATE,-- import all movements from this date (including,>= is used)
        i_date_to_excl     IN DATE, -- import all movements up to this date (excluding,the < operator is used)
        i_import_run_id    IN dl_bordercontrol_datamart.import_runs.id%TYPE,
        o_count            OUT dl_bordercontrol_datamart.import_runs.count%TYPE
    ) IS
    -- build a cursor with a GROUP BY that selects the data to be inserted from
    -- the MOVEMENTS / BORDER DOCUEMENTS / INCIDENTS tables
    --K.Sarikaya
 --     l_log_scope  logger.logger_logs.scope%TYPE := g_log_scope_prefix || 'update_movements';
 --     l_params logger.logger.tab_param;

        CURSOR cur_movement_incident_data IS
            SELECT
                mov.exitflg,
             --   mov.scanned_flight, remove this column because of email from Tobias and Jaro C.Funke
                substr(mov.dml_by, 1,INSTR(mov.dml_by, ' ')-1) created_by,
                mov.ins_at created,
                mov.ins_borderpost server_id,-- needed later for border posts
                bdoc.sex "SEX_NUM_VALUE",
                bdoc.docclass doctype,       -- change doctype to docclass
                mov.visa_type "VISA_NUM_VALUE",
                bdoc.calc_dob "DATE_OF_BIRTH",
                bdoc.nat "NAT_KEY_VALUE",
                mov.ins_borderpost "BORDERPOST_KEY_VALUE",
                mov.ins_terminal terminal_ip_addr,
                COUNT(mov.mvmntid) "COUNT_MOVEMENTS",-- number of movements
                SUM(
                    CASE
                        WHEN inc.docno IS NULL THEN 0
                        ELSE 1
                    END
                ) "COUNT_INCIDENTS" -- number of incidents
            FROM
                dl_bordercontrol.movements mov
                INNER JOIN dl_bordercontrol.borderdocuments bdoc ON mov.brddocid = bdoc.brddocid -- Per definition: a movement has always a related border document
                LEFT JOIN dl_bordercontrol.incidents inc ON
                    bdoc.brddocid = inc.docno
                AND
                   inc.ins_at BETWEEN mov.ins_at - INTERVAL '5' MINUTE AND mov.ins_at + INTERVAL '5' MINUTE -- Not sure how to relate to the incidents from a movement...no direct key available. So,we use the border document and the time of the movement +/- 5 minute
      -- now join lookup tables where fields other than key_value is used
      -- in the movements table
            WHERE
                   mov.ins_at >= i_date_from_incl
                AND
                   mov.ins_at < i_date_to_excl
                AND -- load only completed movements
                    mov.is_finished = 'Y'
            GROUP BY
                mov.exitflg,
            --    mov.scanned_flight,   remove this column because of email from Tobias and Jaro C.Funke
                substr(mov.dml_by, 1,INSTR(mov.dml_by, ' ')-1),
                mov.ins_at,
                mov.ins_borderpost,
                bdoc.sex,
                bdoc.docclass,
                mov.visa_type,
                bdoc.calc_dob,
                bdoc.nat,
                mov.ins_borderpost,
                mov.ins_terminal;

        l_count   dl_bordercontrol_datamart.import_runs.count%TYPE := 0; -- total records affected

    BEGIN
        log_import_run_event(
            i_run_id          => i_import_run_id,
            i_event_type_id   => 'START_UPDATE_FACT_TABLE',
            i_sqlcode         => NULL,
            i_sqlerrm         => NULL,
            i_remark          => NULL
        );

    -- run through grouped data and make

            --K.Sarikaya
       --     logger.LOGGER.log('Before cur_movement_incident_data LOOP' ,l_log_scope);

        FOR l_row IN cur_movement_incident_data LOOP
            DECLARE
                l_key_agent           dl_bordercontrol_datamart.dim_agents.id%TYPE;
                l_key_age             dl_bordercontrol_datamart.dim_ages.id%TYPE;
                l_dob                 DATE;
        -- l_key_borderposts VARCHAR2(32); not yet available
                l_key_document_type   dl_bordercontrol_datamart.dim_document_types.id%TYPE;
                l_key_gender          dl_bordercontrol_datamart.dim_genders.id%TYPE;
                l_key_movement_type   dl_bordercontrol_datamart.dim_movement_types.id%TYPE;
                l_key_nationality     dl_bordercontrol_datamart.dim_nationalities.id%TYPE;
                l_key_officer         dl_bordercontrol_datamart.dim_officers.id%TYPE;
                l_key_time            dl_bordercontrol_datamart.dim_times.id%TYPE;
                l_key_visa_type       dl_bordercontrol_datamart.dim_visa_types.id%TYPE;
                l_key_transportmode   dl_bordercontrol_datamart.dim_transport_modes.id%TYPE;
                l_key_borderpost      dl_bordercontrol_datamart.dim_borderposts.id%TYPE;
                l_iata                CHAR(2); -- extract IATA code and try to find carrier/agent
            BEGIN
        -- Time ------------------------------------------------------------------
        -- time dimension is mandatory!
        -- l_key_times
                IF
                    l_row.created IS NOT NULL
                THEN
          -- try to find time dimension key;
                    BEGIN
                        SELECT
                            id
                        INTO
                            l_key_time
                        FROM
                            dim_times
                        WHERE
                            id = to_number(TO_CHAR(
                                l_row.created,
                                'YYYYMMDDHH24'
                            ) );

                    EXCEPTION
                        WHEN no_data_found THEN
                            l_key_time := gc_invalid_key_numeric; -- important!
                    END;
                ELSE
                    l_key_time := gc_empty_key_numeric;
          -- Raise Error because time cannot be empty!
                END IF;

        -- insert record only if time dim is set because the data is saved time oriented

                IF
                    l_key_time <> gc_empty_key_numeric AND l_key_time <> gc_invalid_key_numeric AND
                        l_key_time IS NOT NULL
                THEN

          -- determine the dimension key values
          -- Agent -----------------------------------------------------------------
          /*          l_iata := substr(
                        l_row.scanned_flight,
                        1,
                        2
                    );
          -- search for IATA carrier/agent
                    IF
                        l_iata IS NOT NULL
                    THEN
                        BEGIN
                            SELECT
                                id
                            INTO
                                l_key_agent
                            FROM
                                dl_bordercontrol_datamart.dim_agents
                            WHERE
                                upper(iata) = upper(l_iata);

                        EXCEPTION
              -- when Agent cannot be found: is invalid key
              -- it might also occur that an IATA code is present twice in the
              -- dim_agents (for example: LH=Lufthansa,LH=Lufthansa Cargo),so
              -- this would also be invalid because it is not possible to determine
              -- the correct carrier
                            WHEN OTHERS THEN
                                l_key_agent := gc_invalid_key;
                        END;

                    ELSE
                        l_key_agent := gc_empty_key;
                    END IF;
                 remove this column because of email from Tobias and Jaro C.Funke */
                 l_key_agent := gc_empty_key;

          -- Age -------------------------------------------------------------------
          -- l_key_age
          -- check if dob is empty

                    IF
                        NOT l_row.date_of_birth IS NULL
                    THEN
                        l_dob := l_row.date_of_birth; -- attention! use RR because ICAO date of birth is always stored with two digits only

            -- try to lookup age in the age dimension
                        IF
                            l_dob IS NOT NULL
                        THEN
                            BEGIN
                                SELECT
                                    id
                                INTO
                                    l_key_age
                                FROM
                                    dl_bordercontrol_datamart.dim_ages
                                WHERE
                                    id = round( (SYSDATE - l_dob) / 365);

                            EXCEPTION
                                WHEN no_data_found THEN
                                    l_key_age := gc_invalid_key_numeric; -- if not present,
                            END;

                        ELSE
                            l_key_age := gc_invalid_key_numeric;
                        END IF;

                    ELSE
                        l_key_age := gc_empty_key_numeric;
                    END IF;

          -- Border Post -------------------------------------------------------------
          -- l_key_borderposts

                    IF
                        l_row.borderpost_key_value IS NOT NULL
                    THEN
                        BEGIN
                            SELECT
                                key_value
                            INTO
                                l_key_borderpost
                            FROM
                                dl_bordercontrol.borderposts
                            WHERE
                                key_value = l_row.borderpost_key_value;

                        EXCEPTION
                            WHEN no_data_found THEN
                                l_key_borderpost := gc_invalid_key;
                        END;
                    ELSE
                        l_key_borderpost := gc_empty_key;
                    END IF;

          -- Transport Mode ----------------------------------------------------------
          -- determine by terminal!
          -- l_key_transportmode

                    IF
                        l_row.terminal_ip_addr IS NOT NULL
                    THEN
            -- lookup the terminal by terminal IP adress and from there,lookup the transport mode
                        BEGIN
                            SELECT
                                key_value
                            INTO
                                l_key_transportmode
                            FROM
                                dl_common.trans_modes
                            WHERE
                                num_value = (
                                    SELECT
                                        trnsprtmodeid
                                    FROM
                                        dl_bordercontrol.terminals
                                    WHERE
                                        ID = l_row.terminal_ip_addr
                                );

                        EXCEPTION
                            WHEN no_data_found THEN
                                l_key_transportmode := gc_invalid_key;
                        END;
                    ELSE
                        l_key_transportmode := gc_empty_key;
                    END IF;


          -- Document Type ---------------------------------------------------------
          -- l_key_document_types

                    IF
                        l_row.doctype IS NOT NULL
                    THEN -- check if doctype is empty
            -- try to lookup doctype
                        BEGIN
                            SELECT
                                id
                            INTO
                                l_key_document_type
                            FROM
                                dl_bordercontrol_datamart.dim_document_types
                            WHERE
                                id = l_row.doctype;

                        EXCEPTION
                            WHEN no_data_found THEN
                                l_key_document_type := gc_invalid_key;
                        END;
                    ELSE
                        l_key_document_type := gc_empty_key;
                    END IF;

          -- Gender ----------------------------------------------------------------
          -- l_key_genders

                    IF
                        l_row.sex_num_value IS NOT NULL
                    THEN -- is the sex empty?
                        BEGIN
              -- try to lookup in dimension
              -- we have to find out the key value first because num_value is stored
                            SELECT
                                id
                            INTO
                                l_key_gender
                            FROM
                                dl_bordercontrol_datamart.dim_genders
                            WHERE
                                id = (
                                    SELECT
                                        key_value
                                    FROM
                                        dl_common.human_sexes
                                    WHERE
                                        num_value = l_row.sex_num_value
                                );

                        EXCEPTION
                            WHEN no_data_found THEN
                                l_key_gender := gc_invalid_key;
                        END;
                    ELSE
                        l_key_gender := gc_empty_key;
                    END IF;

          -- Movement Type ---------------------------------------------------------
          -- l_key_movement_types

                    IF
                        l_row.exitflg IS NOT NULL
                    THEN -- is movement type empty?
            -- try to lookup key_value in the movements dimension and productive table via the num_value
                        BEGIN
                            SELECT
                                id
                            INTO
                                l_key_movement_type
                            FROM
                                dl_bordercontrol_datamart.dim_movement_types
                            WHERE
                                id = (
                                    SELECT
                                        key_value
                                    FROM
                                        dl_common.port_movements
                                    WHERE
                                        num_value = l_row.exitflg
                                );

                        EXCEPTION
                            WHEN no_data_found THEN
                                l_key_movement_type := gc_invalid_key;
                        END;
                    ELSE
                        l_key_movement_type := gc_empty_key;
                    END IF;

          -- Nationality -----------------------------------------------------------
          -- l_key_nationalities

                    IF
                        l_row.nat_key_value IS NOT NULL
                    THEN
            -- try to lookup key_value in the nationality dimension
                        BEGIN
                            SELECT
                                id
                            INTO
                                l_key_nationality
                            FROM
                                dl_bordercontrol_datamart.dim_nationalities
                            WHERE
                                id = l_row.nat_key_value;

                        EXCEPTION
                            WHEN no_data_found THEN
                                l_key_nationality := gc_invalid_key;
                        END;
                    ELSE
                        l_key_nationality := gc_empty_key;
                    END IF;

          -- Officer ---------------------------------------------------------------
          -- l_key_officers

                    IF
                        l_row.created_by IS NOT NULL
                    THEN -- officer is empty?
            -- try to lookup officer username in user management
                        BEGIN
                            SELECT
                                max(id) id
                            INTO
                                l_key_officer
                            FROM
                                dl_bordercontrol_datamart.dim_officers
                            WHERE
                                username = l_row.created_by;

                        EXCEPTION
                            WHEN no_data_found THEN
                                l_key_officer := gc_invalid_key;
                        END;
                    ELSE
                        l_key_officer := gc_empty_key;
                    END IF;

          -- Visa Type -------------------------------------------------------------
          -- l_key_visa_types

                    IF
                        l_row.visa_num_value IS NOT NULL
                    THEN
                        BEGIN
              -- transform num_value to key_value
                            SELECT
                                id
                            INTO
                                l_key_visa_type
                            FROM
                                dl_bordercontrol_datamart.dim_visa_types
                            WHERE
                                id = (
                                    SELECT
                                        key_value
                                    FROM
                                        dl_common.visa_types
                                    WHERE
                                        num_value = l_row.visa_num_value
                                );

                        EXCEPTION
                            WHEN no_data_found THEN
                                l_key_visa_type := gc_invalid_key_numeric;
                        END;
                    ELSE
                        l_key_visa_type := gc_empty_key_numeric;
                    END IF;

          -- now merge the record into the fact table
          -- we have to merge because due to the transformations above,there
          -- might develop double rows which would violate the primary key of
          -- the fact table
          --K.Sarikaya
      --      logger.LOGGER.log('Before MERGE INTO fact_border_movements target' ,l_log_scope);

                    MERGE INTO fact_border_movements target USING
                        ( SELECT
                            l_key_movement_type AS dimension_movement_types_id,
                            l_key_agent AS dimension_agents_id, --  remove this column because of email from Tobias and Jaro C.Funke
                            l_key_officer AS dimension_officers_id,
                            l_key_borderpost AS dimension_border_posts_id,
                            l_key_transportmode AS dimension_transport_modes_id,
                            l_key_gender AS dimension_gender_id,
                            l_key_document_type AS dimension_document_types_id,
                            l_key_time AS dimension_time_id,
                            l_key_visa_type AS dimension_visa_types_id,
                            l_key_age AS dimension_ages_id,
                            l_key_nationality AS dimension_nationalities_id,
                            l_row.count_movements AS count_movements,
                            l_row.count_incidents AS count_incidents
                        FROM
                            dual
                        )
                    source ON (
                            source.dimension_movement_types_id = target.dimension_movement_types_id
                        AND
                            source.dimension_agents_id = target.dimension_agents_id   -- remove this column because of email from Tobias and Jaro C.Funke
                        AND
                            source.dimension_officers_id = target.dimension_officers_id
                        AND
                            source.dimension_border_posts_id = target.dimension_border_posts_id
                        AND
                            source.dimension_transport_modes_id = target.dimension_transport_modes_id
                        AND
                            source.dimension_gender_id = target.dimension_gender_id
                        AND
                            source.dimension_document_types_id = target.dimension_document_types_id
                        AND
                            source.dimension_time_id = target.dimension_time_id
                        AND
                            source.dimension_visa_types_id = target.dimension_visa_types_id
                        AND
                            source.dimension_ages_id = target.dimension_ages_id
                        AND
                            source.dimension_nationalities_id = target.dimension_nationalities_id
                    ) WHEN MATCHED THEN
                        UPDATE
                    SET target.count_movements = target.count_movements + source.count_movements,
                        target.count_incidents = target.count_incidents + source.count_incidents
                    WHEN NOT MATCHED THEN INSERT ( target.dimension_movement_types_id,target.dimension_agents_id,target.dimension_officers_id,target.dimension_border_posts_id
,target.dimension_transport_modes_id,target.dimension_gender_id,target.dimension_document_types_id,target.dimension_time_id,target
.dimension_visa_types_id,target.dimension_ages_id,target.dimension_nationalities_id,target.count_movements,target.count_incidents
 ) VALUES ( source.dimension_movement_types_id,source.dimension_agents_id,source.dimension_officers_id,source.dimension_border_posts_id
,source.dimension_transport_modes_id,source.dimension_gender_id,source.dimension_document_types_id,source.dimension_time_id,source
.dimension_visa_types_id,source.dimension_ages_id,source.dimension_nationalities_id,source.count_movements,source.count_incidents
 );
          --K.Sarikaya
          --  logger.LOGGER.log('Before MERGE INTO fact_border_movements target' ,l_log_scope);

                    l_count := l_count + SQL%rowcount; -- affected records
                    COMMIT;
                ELSE -- time dim is not valid
                    log_import_run_event(
                        i_run_id          => i_import_run_id,
                        i_event_type_id   => 'DIM_TIME_MISSING',
                        i_sqlcode         => NULL,
                        i_sqlerrm         => NULL,
                        i_remark          => 'Missing: '
                         || TO_CHAR(
                            l_row.created,
                            'YYYYMMDDHH24'
                        )
                    );
                END IF; -- time dim is valid
          --K.Sarikaya
          --  logger.LOGGER.log('After MERGE INTO fact_border_movements target, Rowcount:'||l_count ,l_log_scope);

            END; -- block for one record
        END LOOP; -- loop over all records

        log_import_run_event(
            i_run_id          => i_import_run_id,
            i_event_type_id   => 'END_UPDATE_FACT_TABLE',
            i_sqlcode         => NULL,
            i_sqlerrm         => NULL,
            i_remark          => NULL
        );

        o_count := l_count;
    END;

  -- updates the fact table from 00:00 the day after the last record until midnight yesterday

    PROCEDURE update_fact_table (
        i_import_run_id   IN dl_bordercontrol_datamart.import_runs.id%TYPE,
        o_count           OUT dl_bordercontrol_datamart.import_runs.count%TYPE
    ) IS
        l_from_date   DATE;
    BEGIN
    -- determine fact table record with max date
    -- if not exists,start at default date
        SELECT
            trunc(nvl(
                1 + TO_DATE(
                    TO_CHAR(MAX(dimension_time_id) ),
                    'YYYYMMDDHH24'
                ),
                gc_default_load_startdate
            ) )
        INTO
            l_from_date
        FROM
            dl_bordercontrol_datamart.fact_border_movements;

    -- now call main procedure for updating fact table,import only until yesterday

        update_fact_table(
            l_from_date,
            trunc(SYSDATE),
            i_import_run_id,
            o_count
        );
    END;

    PROCEDURE update_datamart IS
        l_import_run_id   import_runs.id%TYPE;
        l_count           dl_bordercontrol_datamart.import_runs.count%TYPE;
    BEGIN

    -- create import run
        l_import_run_id := dl_bordercontrol_datamart.seq_run.nextval;
        INSERT INTO dl_bordercontrol_datamart.import_runs (
            id,
            starttime,
            endtime,
            count
        ) VALUES (
            l_import_run_id,
            SYSDATE,
            NULL,
            NULL
        );

        COMMIT;
        log_import_run_event(
            i_run_id          => l_import_run_id,
            i_event_type_id   => 'START_IMPORT_RUN',
            i_sqlcode         => NULL,
            i_sqlerrm         => NULL,
            i_remark          => NULL
        );

    -- update the dimensions with the current values from bordercontrol lookups

        update_dims(l_import_run_id);

    -- load not loaded data into fact table
        update_fact_table(
            l_import_run_id,
            l_count
        );
        log_import_run_event(
            i_run_id          => l_import_run_id,
            i_event_type_id   => 'END_IMPORT_RUN',
            i_sqlcode         => NULL,
            i_sqlerrm         => NULL,
            i_remark          => NULL
        );

    -- end run

        UPDATE import_runs
            SET
                endtime = SYSDATE,
                count = l_count
        WHERE
            id = l_import_run_id;

        COMMIT;

        -- update Materialized View
        DBMS_MVIEW.REFRESH('DIM_NATIONALITY_TIME_MOVEMENT');
        DBMS_MVIEW.REFRESH('DIM_TIME_MOVEMENT');

    END;

  -- writes test data to the FACT_BORDER_MOVEMENTS table so that we can test
  -- our data mart load procedure afterwards

    PROCEDURE create_testdata_fact_table (
        i_security_code      IN NUMBER,-- must be 123456 so that we don't generate test data in the prod system accidentally
        i_start_year         IN NUMBER,-- generate data from 1.1. of this year
        i_end_year           IN NUMBER,-- generate data until 31.12. of this year
        i_min_movements      IN NUMBER,-- minimum number of movements for each fact table record
        i_max_movements      IN NUMBER,-- maximum
        i_min_incidents      IN NUMBER,-- as above
        i_max_incidents      IN NUMBER,-- as above
        i_num_combinations   IN NUMBER -- number of dimension primary key value combinations per hour
    ) AS

        l_count_agents             NUMBER(10);
        l_count_ages               NUMBER(10);
        l_count_borderposts        NUMBER(10);
        l_count_document_types     NUMBER(10);
        l_count_genders            NUMBER(10);
        l_count_movment_types      NUMBER(10);
        l_count_nationalities      NUMBER(10);
        l_count_officers           NUMBER(10);
        l_count_times              NUMBER(10);
        l_count_transport_modes    NUMBER(10);
        l_count_visa_types         NUMBER(10);
        l_fk_agents                VARCHAR2(32);
        l_fk_ages                  VARCHAR2(32);
        l_fk_borderposts           VARCHAR2(32);
        l_fk_document_types        VARCHAR2(32);
        l_fk_genders               VARCHAR2(32);
        l_fk_movement_types        VARCHAR2(32);
        l_fk_nationalities         VARCHAR2(32);
        l_fk_officers              VARCHAR2(32);
        l_fk_transport_modes       VARCHAR2(32);
        l_fk_visa_types            VARCHAR2(32);
        l_fk_dim_times             NUMBER;
        l_rownum                   NUMBER; -- temp variable for the rownum of the desired record
        l_current_date             DATE;
        l_current_date_with_hour   DATE;
        l_count_movements          NUMBER; -- random number of movements
        l_count_incidents          NUMBER; -- random number of incidents
    BEGIN
        IF
            i_security_code = 123456
        THEN
      -- for the random data generation in the loop,we need to know how many
      -- different values are available in the dimensions
            SELECT
                COUNT(0)
            INTO
                l_count_agents
            FROM
                dl_bordercontrol_datamart.dim_agents
            WHERE
                id NOT IN (
                    '-100','-200'
                );

            SELECT
                COUNT(0)
            INTO
                l_count_ages
            FROM
                dl_bordercontrol_datamart.dim_ages
            WHERE
                id NOT IN (
                    '-100','-200'
                );

            SELECT
                COUNT(0)
            INTO
                l_count_borderposts
            FROM
                dl_bordercontrol_datamart.dim_borderposts
            WHERE
                id NOT IN (
                    '-100','-200'
                );

            SELECT
                COUNT(0)
            INTO
                l_count_document_types
            FROM
                dl_bordercontrol_datamart.dim_document_types
            WHERE
                id NOT IN (
                    '-100','-200'
                );

            SELECT
                COUNT(0)
            INTO
                l_count_genders
            FROM
                dl_bordercontrol_datamart.dim_genders
            WHERE
                id NOT IN (
                    '-100','-200'
                );

            SELECT
                COUNT(0)
            INTO
                l_count_movment_types
            FROM
                dl_bordercontrol_datamart.dim_movement_types
            WHERE
                id NOT IN (
                    '-100','-200'
                );

            SELECT
                COUNT(0)
            INTO
                l_count_nationalities
            FROM
                dl_bordercontrol_datamart.dim_nationalities
            WHERE
                id NOT IN (
                    '-100','-200'
                );

            SELECT
                COUNT(0)
            INTO
                l_count_officers
            FROM
                dl_bordercontrol_datamart.dim_officers
            WHERE
                id NOT IN (
                    '-100','-200'
                );

            SELECT
                COUNT(0)
            INTO
                l_count_transport_modes
            FROM
                dl_bordercontrol_datamart.dim_transport_modes
            WHERE
                id NOT IN (
                    '-100','-200'
                );

            SELECT
                COUNT(0)
            INTO
                l_count_visa_types
            FROM
                dl_bordercontrol_datamart.dim_visa_types
            WHERE
                id NOT IN (
                    '-100','-200'
                );

            l_current_date := TO_DATE(
                '01.01.' || TO_CHAR(i_start_year),
                'DD.MM.YYYY'
            );
      -- start at 1.1.
            WHILE extract ( YEAR FROM l_current_date ) <= i_end_year LOOP

        -- now loop over all hours of this day
                FOR l_current_hour IN 0..23 LOOP

          -- in one hour,many different combinations of distinct values are possible
                    FOR l_current_combination IN 1..i_num_combinations LOOP
                        l_current_date_with_hour := l_current_date + l_current_hour / 24;
                        l_fk_dim_times := to_number(TO_CHAR(
                            l_current_date_with_hour,
                            'YYYYMMDDHH24'
                        ) );

            -- get random primary keys from dimension tables
            -- Attention! We cannot just select WHERE rownum = ... because the WHERE is evaluated before SELECT and it would give random results!
                        l_rownum := 1 + round(dbms_random.value * (l_count_agents - 1) );
                        SELECT
                            id
                        INTO
                            l_fk_agents
                        FROM
                            (
                                SELECT
                                    id,
                                    ROWNUM rn
                                FROM
                                    dl_bordercontrol_datamart.dim_agents
                                WHERE
                                    id NOT IN (
                                        '-100','-200'
                                    )
                            )
                        WHERE
                            rn = l_rownum;

                        l_rownum := 1 + round(dbms_random.value * (l_count_ages - 1) );
                        SELECT
                            id
                        INTO
                            l_fk_ages
                        FROM
                            (
                                SELECT
                                    id,
                                    ROWNUM rn
                                FROM
                                    dl_bordercontrol_datamart.dim_ages
                                WHERE
                                    id NOT IN (
                                        '-100','-200'
                                    )
                            )
                        WHERE
                            rn = l_rownum;

                        l_rownum := 1 + round(dbms_random.value * (l_count_borderposts - 1) );
                        SELECT
                            id
                        INTO
                            l_fk_borderposts
                        FROM
                            (
                                SELECT
                                    id,
                                    ROWNUM rn
                                FROM
                                    dl_bordercontrol_datamart.dim_borderposts
                                WHERE
                                    id NOT IN (
                                        '-100','-200'
                                    )
                            )
                        WHERE
                            rn = l_rownum;

                        l_rownum := 1 + round(dbms_random.value * (l_count_document_types - 1) );
                        SELECT
                            id
                        INTO
                            l_fk_document_types
                        FROM
                            (
                                SELECT
                                    id,
                                    ROWNUM rn
                                FROM
                                    dl_bordercontrol_datamart.dim_document_types
                                WHERE
                                    id NOT IN (
                                        '-100','-200'
                                    )
                            )
                        WHERE
                            rn = l_rownum;

                        l_rownum := 1 + round(dbms_random.value * (l_count_genders - 1) );
                        SELECT
                            id
                        INTO
                            l_fk_genders
                        FROM
                            (
                                SELECT
                                    id,
                                    ROWNUM rn
                                FROM
                                    dl_bordercontrol_datamart.dim_genders
                                WHERE
                                    id NOT IN (
                                        '-100','-200'
                                    )
                            )
                        WHERE
                            rn = l_rownum;

                        l_rownum := 1 + round(dbms_random.value * (l_count_movment_types - 1) );
                        SELECT
                            id
                        INTO
                            l_fk_movement_types
                        FROM
                            (
                                SELECT
                                    id,
                                    ROWNUM rn
                                FROM
                                    dl_bordercontrol_datamart.dim_movement_types
                                WHERE
                                    id NOT IN (
                                        '-100','-200'
                                    )
                            )
                        WHERE
                            rn = l_rownum;

                        l_rownum := 1 + round(dbms_random.value * (l_count_nationalities - 1) );
                        SELECT
                            id
                        INTO
                            l_fk_nationalities
                        FROM
                            (
                                SELECT
                                    id,
                                    ROWNUM rn
                                FROM
                                    dl_bordercontrol_datamart.dim_nationalities
                                WHERE
                                    id NOT IN (
                                        '-100','-200'
                                    )
                            )
                        WHERE
                            rn = l_rownum;

                        l_rownum := 1 + round(dbms_random.value * (l_count_officers - 1) );
                        SELECT
                            id
                        INTO
                            l_fk_officers
                        FROM
                            (
                                SELECT
                                    id,
                                    ROWNUM rn
                                FROM
                                    dl_bordercontrol_datamart.dim_officers
                                WHERE
                                    id NOT IN (
                                        '-100','-200'
                                    )
                            )
                        WHERE
                            rn = l_rownum;

                        l_rownum := 1 + round(dbms_random.value * (l_count_transport_modes - 1) );
                        SELECT
                            id
                        INTO
                            l_fk_transport_modes
                        FROM
                            (
                                SELECT
                                    id,
                                    ROWNUM rn
                                FROM
                                    dl_bordercontrol_datamart.dim_transport_modes
                                WHERE
                                    id NOT IN (
                                        '-100','-200'
                                    )
                            )
                        WHERE
                            rn = l_rownum;

                        l_rownum := 1 + round(dbms_random.value * (l_count_visa_types - 1) );
                        SELECT
                            id
                        INTO
                            l_fk_visa_types
                        FROM
                            (
                                SELECT
                                    id,
                                    ROWNUM rn
                                FROM
                                    dl_bordercontrol_datamart.dim_visa_types
                                WHERE
                                    id NOT IN (
                                        '-100','-200'
                                    )
                            )
                        WHERE
                            rn = l_rownum;

            -- now generate random number of movements/incidents

                        l_count_movements := round(i_min_movements + (dbms_random.value * (i_max_movements - i_min_movements) ) );

                        l_count_incidents := round(i_min_incidents + (dbms_random.value * (i_max_incidents - i_min_incidents) ) );

            -- in case of conflict: ignore the violated key

                        BEGIN
              -- now insert the random values
                            INSERT INTO fact_border_movements (
                                dimension_movement_types_id,
                                dimension_agents_id,
                                dimension_officers_id,
                                dimension_border_posts_id,
                                dimension_transport_modes_id,
                                dimension_gender_id,
                                dimension_document_types_id,
                                dimension_time_id,
                                dimension_visa_types_id,
                                dimension_ages_id,
                                count_movements,
                                count_incidents,
                                dimension_nationalities_id
                            ) VALUES (
                                l_fk_movement_types,-- dimension_movement_types_id,
                                l_fk_agents,-- dimension_agents_id,
                                l_fk_officers,-- dimension_officers_id,
                                l_fk_borderposts,-- dimension_border_posts_id,
                                l_fk_transport_modes,-- dimension_transport_modes_id,
                                l_fk_genders,-- dimension_gender_id,
                                l_fk_document_types,-- dimension_document_types_id,
                                l_fk_dim_times,-- dimension_time_id,
                                l_fk_visa_types,-- dimension_visa_types_id,
                                l_fk_ages,-- dimension_ages_id,
                                l_count_movements,-- count_movements,
                                l_count_incidents,-- count_incidents,
                                l_fk_nationalities -- dimension_nationalities_id
                            );

                        EXCEPTION
                            WHEN OTHERS THEN
                                NULL;
                        END;

                        COMMIT;
                    END LOOP; -- combinations
                END LOOP; -- hours 0..23

                l_current_date := l_current_date + INTERVAL '1' DAY; -- next day
            END LOOP; -- from start year to end year increase day by day

        END IF;
    END;


  -- writes test data to the DL_BORDERCONTROL.MOVEMENTS table so that we can test
  -- our data mart load procedure
  -- CAUTION: use for development only!

    PROCEDURE create_testdata_movements (
        i_security_code           IN NUMBER,-- must be 123456 so that we don't generate test data in the prod system accidentally
        i_start_date              IN DATE,-- generate data from this date
        i_end_date                IN DATE,-- generate data up to this date
        i_num_movments_per_hour   IN NUMBER -- movements to be generated per hour
    ) AS

        l_count_agents             NUMBER(10);
        l_count_ages               NUMBER(10);
        l_count_borderposts        NUMBER(10);
        l_count_document_types     NUMBER(10);
        l_count_genders            NUMBER(10);
        l_count_movment_types      NUMBER(10);
        l_count_nationalities      NUMBER(10);
        l_count_officers           NUMBER(10);
        l_count_transport_modes    NUMBER(10);
        l_count_visa_types         NUMBER(10);
        l_key_agents               VARCHAR2(32); -- is extracted from scanned_flight
        l_flight                   VARCHAR(32);
        l_key_ages                 VARCHAR2(32); -- is extracted from date of birth
        l_date_of_birth            DATE; -- for age
        l_key_borderposts          VARCHAR2(32); -- not available yet xxx
        l_key_document_types       VARCHAR2(32);
        l_key_genders              NUMBER(32); -- num_value
        l_key_movement_types       NUMBER(32); -- num_value
        l_key_nationalities        VARCHAR2(32); -- key value
        l_key_officers             VARCHAR2(32); -- id from user_management.users
        l_key_transport_modes      VARCHAR2(32); -- xxx not clear yet which field is stored in movements table and in which column. Related to SERVER_ID
        l_server_id                VARCHAR2(32); -- needed to determine the transport mode,this has to be discussd with Kazim and William!
        l_key_visa_types           NUMBER(32);
        l_key_dim_times            NUMBER;
        l_rownum                   NUMBER; -- temp variable for the rownum of the desired record
        l_current_date             DATE;
        l_current_date_with_hour   DATE;
        l_count_total              NUMBER := 0; -- number of inserted movements so far
        l_current_serial_nr        VARCHAR2(50);
        l_border_doc_id            VARCHAR2(32);
        lc_firstname               CONSTANT VARCHAR2(20) := 'FIRSTNAME_ETL';
        lc_lastname                CONSTANT VARCHAR2(20) := 'LASTNAME_ETL';
    BEGIN
        IF
            i_security_code = 123456
        THEN
      -- for the random data generation in the loop,we need to know how many
      -- different values are available in the dimensions
            SELECT
                COUNT(0)
            INTO
                l_count_agents
            FROM
                dl_common.carriers;

            SELECT
                COUNT(0)
            INTO
                l_count_ages
            FROM
                dl_bordercontrol_datamart.dim_ages;

            SELECT
                COUNT(0)
            INTO
                l_count_borderposts
            FROM
                dl_bordercontrol.borderposts;

            SELECT
                COUNT(0)
            INTO
                l_count_document_types
            FROM
                dl_common.bc_doc_types;

            SELECT
                COUNT(0)
            INTO
                l_count_genders
            FROM
                dl_common.human_sexes
            WHERE
                    num_value IS NOT NULL
                AND
                    is_active = 'Y';

            SELECT
                COUNT(0)
            INTO
                l_count_movment_types
            FROM
                dl_common.port_movements
            WHERE
                is_active = 'Y';

            SELECT
                COUNT(0)
            INTO
                l_count_nationalities
            FROM
                dl_common.icao_doc_codes;

            SELECT
                COUNT(0)
            INTO
                l_count_officers
            FROM
                user_management.users_lt;

            SELECT
                COUNT(0)
            INTO
                l_count_transport_modes
            FROM
                dl_common.trans_modes;

            SELECT
                COUNT(0)
            INTO
                l_count_visa_types
            FROM
                dl_common.visa_types;

            l_current_date := i_start_date;
      -- start at 1.1.
            WHILE l_current_date <= i_end_date LOOP

        -- now loop over all hours of this day
                FOR l_current_hour IN 0..23 LOOP
                    FOR l_movement_nr IN 1..i_num_movments_per_hour LOOP
                        l_current_serial_nr := 'DWH_'
                         || lpad(
                            TO_CHAR(l_count_total),
                            10,
                            '0'
                        );
                        l_current_date_with_hour := l_current_date + l_current_hour / 24;
                        l_key_dim_times := to_number(TO_CHAR(
                            l_current_date_with_hour,
                            'YYYYMMDDHH24'
                        ) );

            -- get random primary keys from lookup tables
            -- Attention! We cannot just select WHERE rownum = ... because the WHERE is evaluated before SELECT and it would give random results!
                        l_rownum := 1 + round(dbms_random.value * (l_count_agents - 1) );
                        SELECT
                            iata
                        INTO
                            l_key_agents
                        FROM
                            (
                                SELECT
                                    iata,
                                    ROWNUM rn
                                FROM
                                    dl_common.carriers
                            )
                        WHERE
                            rn = l_rownum; -- use IATA code,for example LH or AF

                        l_flight := l_key_agents
                         || lpad(
                            TO_CHAR(trunc(dbms_random.value * 9999) ),
                            4,
                            '0'
                        ); -- random flight number

                        l_rownum := 20 + round(dbms_random.value * 60); -- age
                        l_date_of_birth := SYSDATE () - l_rownum * 365; -- use age in order to calculate birth date

            -- Borderpost not available yet in application
                        l_rownum := 1 + round(dbms_random.value * (l_count_borderposts - 1) );
                        SELECT
                            key_value
                        INTO
                            l_key_borderposts
                        FROM
                            (
                                SELECT
                                    key_value,
                                    ROWNUM rn
                                FROM
                                    dl_bordercontrol.borderposts
                            )
                        WHERE
                            rn = l_rownum;

                        l_rownum := 1 + round(dbms_random.value * (l_count_document_types - 1) );
                        SELECT
                            key_value
                        INTO
                            l_key_document_types
                        FROM
                            (
                                SELECT
                                    key_value,
                                    ROWNUM rn
                                FROM
                                    dl_common.bc_doc_types
                            )
                        WHERE
                            rn = l_rownum;

                        l_rownum := 1 + round(dbms_random.value * (l_count_genders - 1) );
                        SELECT
                            num_value
                        INTO
                            l_key_genders
                        FROM
                            (
                                SELECT
                                    num_value,
                                    ROWNUM rn
                                FROM
                                    dl_common.human_sexes
                                WHERE
                                        num_value IS NOT NULL
                                    AND
                                        is_active = 'Y'
                            )
                        WHERE
                            rn = l_rownum;

                        l_rownum := 1 + round(dbms_random.value * (l_count_movment_types - 1) );
                        SELECT
                            num_value
                        INTO
                            l_key_movement_types
                        FROM
                            (
                                SELECT
                                    num_value,
                                    ROWNUM rn
                                FROM
                                    dl_common.port_movements
                                WHERE
                                    is_active = 'Y'
                            )
                        WHERE
                            rn = l_rownum;

                        l_rownum := 1 + round(dbms_random.value * (l_count_nationalities - 1) );
                        SELECT
                            key_value
                        INTO
                            l_key_nationalities
                        FROM
                            (
                                SELECT
                                    key_value,
                                    ROWNUM rn
                                FROM
                                    dl_common.icao_doc_codes
                            )
                        WHERE
                            rn = l_rownum;

                        l_rownum := 1 + round(dbms_random.value * (l_count_officers - 1) );
                        SELECT
                            id
                        INTO
                            l_key_officers
                        FROM
                            (
                                SELECT
                                    id,
                                    ROWNUM rn
                                FROM
                                    user_management.users_lt
                            )
                        WHERE
                            rn = l_rownum;

                        l_rownum := 1 + round(dbms_random.value * (l_count_transport_modes - 1) );
                        SELECT
                            key_value
                        INTO
                            l_key_transport_modes
                        FROM
                            (
                                SELECT
                                    key_value,
                                    ROWNUM rn
                                FROM
                                    dl_common.trans_modes
                            )
                        WHERE
                            rn = l_rownum;

                        l_server_id := 'ST-PAULI'; -- this is stored in the MOVEMENTS table and the transport mode is indirect
                        l_rownum := 1 + round(dbms_random.value * (l_count_visa_types - 1) );
                        SELECT
                            num_value
                        INTO
                            l_key_visa_types
                        FROM
                            (
                                SELECT
                                    num_value,
                                    ROWNUM rn
                                FROM
                                    dl_common.visa_types
                            )
                        WHERE
                            rn = l_rownum;

                        -- now insert the random values

                        INSERT INTO dl_bordercontrol.borderdocuments (
                            brddocid,
                            doctype,
                            docno,
                            issuectry,
                            nat,
                            dob,
                            sex,
                            expirydate,
                            givenname,
                            surname,
                            optionaldata,
                            afisid,
                            INS_AT,
                            DML_BY,
                            INS_TERMINAL,
                            INS_BORDERPOST,
                            officer_observation,
                            mrzdg1,
                            p_01,
                            p_02,
                            p_03,
                            p_04,
                            p_05,
                            calc_dob
                        ) VALUES (
                            sys_guid,-- brddocid,in reality: SYS_GUID,but with our own key we can delete the test data easily
                            l_key_document_types,-- doctype,
                            l_current_serial_nr,-- docno,
                            l_key_nationalities,-- issuectry,
                            l_key_nationalities,-- nat,
                            TO_CHAR(
                                l_date_of_birth,
                                'YYMMDD'
                            ),-- dob,
                            l_key_genders,-- sex,
                            TO_DATE('2015-01-01','YYYY-MM-DD'),-- expirydate,
                            lc_firstname,-- givenname,
                            lc_lastname,-- surname,
                            NULL,-- optionaldata,
                            NULL,-- afisid,
                            l_current_date,-- created,
                            'PKG_ETL',-- created_by,
                            '1.2.3.4',-- workstation_name,
                            l_server_id,-- server_id,
                            'OFFICER_ETL',-- officer_observation,
                            'DIETSCH<<MALTE<<<<<<<<<<<<<<<<<<<<<<<N999991276KHM7102279M2310244<<<<<<<<<<<<<<<0',-- mrzdg1,
                            NULL,-- p_01,
                            NULL,-- p_02,
                            NULL,-- p_03,
                            NULL,-- p_04,
                            NULL,-- p_05,
                            l_date_of_birth -- calc_dob,
                        ) RETURNING brddocid INTO l_border_doc_id;

            -- after the border doc has been created,create the movement

                        INSERT INTO dl_bordercontrol.movements (
                            mvmntid,
                            brddocid,
                            landbarcd,
                            exitflg,
                            MAX_STAY_DT,
                            fingermatch,
                            facematch,
                            mvmntaddr,
                            oridest,
                            INS_AT,
                            DML_BY,
                            INS_TERMINAL,
                            INS_BORDERPOST,
                            refusedflg,
                            observation,
                            trnsprtunitid,
                            PERSON_TYPE,
                            --rnkdsgntdid,
                            scanned_flight,
                            visa,
                            ps_1,
                            ps_2,
                            ps_3,
                            ps_4,
                            ps_5,
                            ps_6,
                            ps_7,
                            ps_8,
                            ps_9,
                            ps_10,
                            fingermatch_history,
                            facematc_history,
                            reason_offload,
                            reason_deportee
                            --,INS_BORDERPOST
                        ) VALUES (
                            sys_guid,-- mvmntid,in real application: SYSGUID
                            l_border_doc_id,-- brddocid,
                            NULL,-- landbarcd,
                            l_key_movement_types,-- exitflg,
                            l_current_date + 200 + trunc(dbms_random.value() * 400),-- visaexpdt,
                            0,-- fingermatch,
                            0,-- facematch,
                            NULL,-- mvmntaddr,
                            NULL,-- oridest,
                            l_current_date,-- created,
                            'PKG_ETL',-- created_by,
                            '10.120.10.24',-- terminal_ip_addr,
                            l_key_borderposts,-- server_id,
                            NULL,-- refusedflg,
                            NULL,-- observation,
                            NULL,-- trnsprtunitid,
                            NULL,-- pssngrstatus,
                            --NULL,-- rnkdsgntdid,
                            l_flight,-- scanned_flight,
                            l_key_visa_types,-- visa,
                            NULL,-- ps_1,
                            NULL,-- ps_2,
                            NULL,-- ps_3,
                            NULL,-- ps_4,
                            NULL,-- ps_5,
                            NULL,-- ps_6,
                            NULL,-- ps_7,
                            NULL,-- ps_8,
                            NULL,-- ps_9,
                            NULL,-- ps_10,
                            NULL,-- fingermatch_history,
                            NULL,-- facematc_history,
                            NULL,-- reason_offload,
                            NULL -- reason_deportee
                            --,
                           -- l_key_borderposts--borderpost
                        );

            -- create incident (if random number says so

                        IF
                            ( 1 + trunc(dbms_random.value() * 10) = 5 )
                        THEN
                            INSERT INTO "DL_BORDERCONTROL"."INCIDENTS" (
                                docno,
                                client_ip,
                                officer,
                                dob,
                                lastname,
                                gender,
                                issuingcountry,
                                INS_AT,
                                givenname,
                                id,
                                type
                            ) VALUES (
                                l_border_doc_id,-- docno,
                                '1.2.3.4',-- client_ip,
                                'OFFICER_ETL',-- officer,
                                TO_CHAR(
                                    l_date_of_birth,
                                    'YYMMDD'
                                ),-- dob,
                                lc_lastname,-- lastname,
                                'M',-- gender,
                                'D',-- issuingcountry,
                                l_current_date,-- ts,
                                lc_firstname,-- givenname,
                                sys_guid,-- id,
                                1-- type
                            );

                        END IF;

                        COMMIT; -- commit for every record
                        l_count_total := l_count_total + 1; -- count records

                    END LOOP;
                END LOOP; -- hours 0..23

                l_current_date := l_current_date + INTERVAL '1' DAY; -- next day
            END LOOP; -- from start date to end date

        END IF;
    END;

END pkg_etl;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL_DATAMART"."PKG_ETL" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BORDERCONTROL_DATAMART"."PKG_ETL" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL_DATAMART"."PKG_ETL" TO "BIOSUPPORT";
