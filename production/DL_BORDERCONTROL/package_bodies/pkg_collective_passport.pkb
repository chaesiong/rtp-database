CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_COLLECTIVE_PASSPORT" AS
    /*******************************************************************************
    * This package provides a service for managing the Collective Passport Data
    * It can create, persits, and serve the Data
    *
    *
    * Author    Date        Description
    * --------  ----------  -------------------------------------------------------*
    * DNotzon   13.06.2018  Initial Release
	* DNotzon	25.06.2018	Added UPDATE_AT Column
    * DNotzon	25.06.2018	Added Count function for Fellow Passengers
	* DNotzon   19.09.2018  Added TM6 Field
    *******************************************************************************/


    /************************************************
    * ========== FUNCTIONS AND PROCEDURES ==========
    ************************************************/

    /**
    * Returns the absolute number of Fellow Passengers that are temporarily saved right now
    * THIS WILL NOT COUNT FELLOW PASSENGERS THAT ARE PERSISTED
    * @param i_persistable    BOOLEAN to return only persistable count. Default is false.
    *
    */
    FUNCTION GET_FELLOW_PASSENGER_COUNT(i_persistable IN BOOLEAN default false) RETURN NUMBER AS
        l_count NUMBER;
    BEGIN
        IF i_persistable THEN
            SELECT count(*) INTO l_count FROM TMP_COLLECTIVE_PASSPORT_DATA WHERE APP_SESSION = v('APP_SESSION') AND (LAST_NAME IS NOT NULL OR FIRST_NAME IS NOT NULL);
        ELSE
            SELECT count(*) INTO l_count FROM TMP_COLLECTIVE_PASSPORT_DATA WHERE APP_SESSION = v('APP_SESSION');
        END IF;
        return l_count;

        EXCEPTION when no_data_found then
            return 0;
    END GET_FELLOW_PASSENGER_COUNT;

    /**
    * Updates a Row in the Table TMP_COLLECTIVE_PASSPORT_DATA at SEQ_ID with the provided CLOB.
    * It will automatically convert the CLOB into a BLOB.
    *
    * @param i_seqID    SEQ_ID (Primary Key) of the row in the Table TMP_COLLECTIVE_PASSPORT_DATA
    * @param i_IMAGE    The Image that should be saved to the Table
    */
    PROCEDURE SAVE_IMAGE(i_KEY_VALUE IN TMP_COLLECTIVE_PASSPORT_DATA.KEY_VALUE%type, i_IMAGE IN CLOB) AS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        UPDATE
            TMP_COLLECTIVE_PASSPORT_DATA
        SET
            IMAGE = DL_COMMON.PKG_UTIL.Decode_Base64(i_IMAGE),
            UPDATE_AT = sysdate
        WHERE
            KEY_VALUE = i_KEY_VALUE AND
            APP_SESSION = v('APP_SESSION');

        commit;
    END;

    /**
    * Deletes a row from the Table TMP_COLLECTIVE_PASSPORT_DATA
    *
    * @param i_seqID    SEQ_ID (Primary Key) of the row in the Table TMP_COLLECTIVE_PASSPORT_DATA
    */
    PROCEDURE DELETE_FELLOW_PASSENGER(i_KEY_VALUE IN TMP_COLLECTIVE_PASSPORT_DATA.KEY_VALUE%type) AS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        DELETE FROM TMP_COLLECTIVE_PASSPORT_DATA WHERE APP_SESSION = v('APP_SESSION') AND KEY_VALUE = i_KEY_VALUE;
        commit;
    END DELETE_FELLOW_PASSENGER;


    /**
    * Adds an Empty row to the Table TMP_COLLECTIVE_PASSPORT_DATA
    * Automatically fills in the APP_SESSION, SEQ_ID and commits.
    *
    * @param i_seqID    SEQ_ID (Primary Key) of the row in the Table TMP_COLLECTIVE_PASSPORT_DATA
    */
    FUNCTION ADD_EMPTY_PASSENGER RETURN FELLOW_PASSENGER.KEY_VALUE%type AS
        PRAGMA AUTONOMOUS_TRANSACTION;

        l_new_key_value FELLOW_PASSENGER.KEY_VALUE%type;
    BEGIN
        l_new_key_value := SYS_GUID();

        INSERT INTO TMP_COLLECTIVE_PASSPORT_DATA (KEY_VALUE, APP_SESSION) VALUES (l_new_key_value ,v('APP_SESSION'));
        commit;

        return l_new_key_value;
    END ADD_EMPTY_PASSENGER;


    /**
    * Initializes the Table TMP_COLLECTIVE_PASSPORT_DATA with one Empty Row
    *
    * @param i_force_clear    BOOLEAN to force the Table to be emptied (for the current session).
    * @param i_init_record    BOOLEAN to add initial empty row to the Table (for the current session). Default is true for backward compatibility.
    */
    PROCEDURE INIT_TEMP_TABLE(i_force_clear IN BOOLEAN default false, i_add_empty_row IN BOOLEAN default true) AS
        PRAGMA AUTONOMOUS_TRANSACTION;

        l_number_of_entries NUMBER := 0;
        l_first_passenger TMP_COLLECTIVE_PASSPORT_DATA.KEY_VALUE%type;
    BEGIN
        IF i_force_clear then
            DELETE FROM TMP_COLLECTIVE_PASSPORT_DATA WHERE APP_SESSION = v('APP_SESSION');
            commit;
        END IF;

        SELECT count(*) INTO l_number_of_entries FROM TMP_COLLECTIVE_PASSPORT_DATA WHERE APP_SESSION = v('APP_SESSION');
        IF( l_number_of_entries <= 0 AND i_add_empty_row ) then
            l_first_passenger := PKG_COLLECTIVE_PASSPORT.ADD_EMPTY_PASSENGER();
        end iF;

    END INIT_TEMP_TABLE;


    /**
    * Loads all the Fellow Passengers of a Person into the Table TMP_COLLECTIVE_PASSPORT_DATA
    *
    * @param i_PERSON_FK    Foreign Key to Table PERSON (KEY_VALUE)
    * @param i_preserve_pk  BOOLEAN to re-use PK from source. Default is 0.
    *                       Usage Ex - true: when editing; false: when fetching arrival collective info during departure;
    */
    PROCEDURE LOAD_DATA(i_PERSON_FK IN DL_BORDERCONTROL.FELLOW_PASSENGER.KEY_VALUE%type, i_preserve_pk IN BOOLEAN default false) AS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_preserve_pk   CHAR(1) := 'N';
    BEGIN
        --Forces to Empty the Table first before we load it with Data--
        PKG_COLLECTIVE_PASSPORT.INIT_TEMP_TABLE(true, false);
        
        IF i_preserve_pk THEN
            l_preserve_pk := 'Y';
        END IF;
        
        INSERT INTO TMP_COLLECTIVE_PASSPORT_DATA 
        (
            KEY_VALUE,
            APP_SESSION,
            LAST_NAME,
            FIRST_NAME,
            RELATION,
            DATE_OF_BIRTH,
            GENDER,
            NATIONALITY,
            IMAGE,
            INSERT_AT,
            UPDATE_AT,
            TM6_NO
        )
        SELECT
            CASE l_preserve_pk WHEN 'Y' THEN KEY_VALUE ELSE NULL END,
            v('APP_SESSION'),
            LAST_NAME,
            FIRST_NAME,
            RELATION,
            DATE_OF_BIRTH,
            SEX,
            NATIONALITY,
            IMAGE,
            sysdate,
            sysdate,
            TM6_NO
        FROM FELLOW_PASSENGER
        WHERE FELLOW_PASSENGER.PERSON = i_PERSON_FK;

        commit;
        
        -- add a blank record if empty
        PKG_COLLECTIVE_PASSPORT.INIT_TEMP_TABLE();

    END LOAD_DATA;

    /**
    * This will save all the data From the Temp Table into the FELLOW_PASSENGERS table.
    * The Data will be saved for the supplied Person.
    *
    * @param i_PERSON_FK    Foreign Key to Table PERSON (KEY_VALUE)
    */
    PROCEDURE PERSIST_DATA(i_PERSON_FK IN DL_BORDERCONTROL.FELLOW_PASSENGER.KEY_VALUE%type) AS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN

        --Delete all The Fellow Passengers that are not associated with the Person anymore--
        DELETE FROM FELLOW_PASSENGER WHERE PERSON = i_PERSON_FK AND KEY_VALUE NOT IN (SELECT KEY_VALUE FROM TMP_COLLECTIVE_PASSPORT_DATA WHERE APP_SESSION = v('APP_SESSION') );
        commit;

        merge into FELLOW_PASSENGER dest
        using (SELECT * FROM TMP_COLLECTIVE_PASSPORT_DATA WHERE APP_SESSION = v('APP_SESSION') AND (LAST_NAME IS NOT NULL OR FIRST_NAME IS NOT NULL ) ) src
        on (src.KEY_VALUE = dest.KEY_VALUE)
        when matched then update set
          dest.RELATION      = src.RELATION,
          dest.LAST_NAME     = src.LAST_NAME,
          dest.FIRST_NAME    = src.FIRST_NAME,
          dest.DATE_OF_BIRTH = src.DATE_OF_BIRTH,
          dest.SEX           = src.GENDER,
          dest.NATIONALITY   = src.NATIONALITY,
          dest.IMAGE         = src.IMAGE,
          dest.TM6_NO        = src.TM6_NO
        when not matched then
          insert (KEY_VALUE, PERSON, RELATION, LAST_NAME, FIRST_NAME, DATE_OF_BIRTH, SEX, NATIONALITY, IMAGE, TM6_NO)
          values (src.KEY_VALUE,i_PERSON_FK ,src.RELATION, src.LAST_NAME, src.FIRST_NAME, src.DATE_OF_BIRTH, src.GENDER, src.NATIONALITY, src.IMAGE, src.TM6_NO);

          commit;

    END PERSIST_DATA;

    /**
    * Takes the Data from dynamically generated APEX Items (F00_ to FXX_) and Updates the Collection)
    *
    */
    PROCEDURE PROCESS_FXX_DATA AS
        PRAGMA AUTONOMOUS_TRANSACTION;

        l_KEY_VALUES         apex_application_global.vc_arr2;
        l_RELATION           apex_application_global.vc_arr2;
        l_LAST_NAME          apex_application_global.vc_arr2;
        l_FIRST_NAME         apex_application_global.vc_arr2;
        l_DATE_OF_BIRTHDAY   apex_application_global.vc_arr2;
        l_SEX                apex_application_global.vc_arr2;
        l_NATIONALITY        apex_application_global.vc_arr2;
        l_TM6_NO             apex_application_global.vc_arr2;

    BEGIN

        l_KEY_VALUES        := apex_application.g_F01;
        l_RELATION          := apex_application.g_F02;
        l_LAST_NAME         := apex_application.g_F03;
        l_FIRST_NAME        := apex_application.g_F04;
        l_DATE_OF_BIRTHDAY  := apex_application.g_F05;
        l_SEX               := apex_application.g_F06;
        l_NATIONALITY       := apex_application.g_F07;
        l_TM6_NO            := apex_application.g_F08;

        --APEX_DEBUG.INFO ( p_message => 'Number of Fellow Passengers: ' || l_SEQ_ID.COUNT );

        FOR l_idx IN 1..l_KEY_VALUES.COUNT LOOP

            UPDATE TMP_COLLECTIVE_PASSPORT_DATA SET
                LAST_NAME = l_LAST_NAME(l_idx),
                FIRST_NAME = l_FIRST_NAME(l_idx),
                RELATION = l_RELATION(l_idx),
                DATE_OF_BIRTH = to_date(l_DATE_OF_BIRTHDAY(l_idx),v('APP_NLS_DATE_FORMAT')),
                GENDER = l_SEX(l_idx),
                NATIONALITY = l_NATIONALITY(l_idx),
                UPDATE_AT = sysdate,
                TM6_NO = l_TM6_NO(l_idx)
            WHERE KEY_VALUE = l_KEY_VALUES(l_idx) AND APP_SESSION = v('APP_SESSION');


        END LOOP;

        commit;

    END PROCESS_FXX_DATA;


END PKG_COLLECTIVE_PASSPORT;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_COLLECTIVE_PASSPORT" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_COLLECTIVE_PASSPORT" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_COLLECTIVE_PASSPORT" TO "BIOSUPPORT";
