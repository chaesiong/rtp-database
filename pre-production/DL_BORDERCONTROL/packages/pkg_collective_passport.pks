CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_COLLECTIVE_PASSPORT" AS
   /*******************************************************************************
    * This package provides a service for managing the Collective Passport Data
    * It can create, persists, and serve the Data
    *
    *
    * Author    Date        Description
    * --------  ----------  -------------------------------------------------------*
    * DNotzon   13.06.2018  Initial Release
    *******************************************************************************/


    /************************************************
    * ========== FUNCTIONS AND PROCEDURES ==========
    ************************************************/

    /**
    * Returns the absolute number of Fellow Passengers that are temporarily saved right now
    * THIS WILL NOT COUNT FELLOW PASSENGERS THAT ARE PERSISTED
    *
    */
    FUNCTION GET_FELLOW_PASSENGER_COUNT RETURN NUMBER;

    /**
    * Updates a Row in the Table TMP_COLLECTIVE_PASSPORT_DATA at SEQ_ID with the provided CLOB.
    * It will automatically convert the CLOB into a BLOB.
    *
    * @param i_seqID    SEQ_ID (Primary Key) of the row in the Table TMP_COLLECTIVE_PASSPORT_DATA
    * @param i_IMAGE    The Image that should be saved to the Table
    */
    PROCEDURE SAVE_IMAGE(i_KEY_VALUE IN TMP_COLLECTIVE_PASSPORT_DATA.KEY_VALUE%type, i_IMAGE IN CLOB);

    /**
    * Deletes a row from the Table TMP_COLLECTIVE_PASSPORT_DATA
    *
    * @param i_seqID    SEQ_ID (Primary Key) of the row in the Table TMP_COLLECTIVE_PASSPORT_DATA
    */
    PROCEDURE DELETE_FELLOW_PASSENGER(i_KEY_VALUE IN TMP_COLLECTIVE_PASSPORT_DATA.KEY_VALUE%type);

    /**
    * Adds an Empty row to the Table TMP_COLLECTIVE_PASSPORT_DATA
    * Automatically fills in the APP_SESSION, SEQ_ID and commits.
    *
    * @param i_seqID    SEQ_ID (Primary Key) of the row in the Table TMP_COLLECTIVE_PASSPORT_DATA
    */
    FUNCTION ADD_EMPTY_PASSENGER RETURN FELLOW_PASSENGER.KEY_VALUE%type;

    /**
    * Initializes the Table TMP_COLLECTIVE_PASSPORT_DATA with one Empty Row
    *
    * @param i_force_clear    BOOLEAN to force the Table to be emptied (for the current session) and filled with an empty row.
    */
    PROCEDURE INIT_TEMP_TABLE(i_force_clear IN BOOLEAN default false);

    /**
    * Loads all the Fellow Passengers of a Person into the Table TMP_COLLECTIVE_PASSPORT_DATA
    *
    * @param i_PERSON_FK    Foreign Key to Table PERSON (KEY_VALUE)
    */
    PROCEDURE LOAD_DATA(i_PERSON_FK IN DL_BORDERCONTROL.FELLOW_PASSENGER.KEY_VALUE%type);


    /**
    * This will save all the data From the Temp Table into the FELLOW_PASSENGERS table.
    * The Data will be saved for the supplied Person.
    *
    * @param i_PERSON_FK    Foreign Key to Table PERSON (KEY_VALUE)
    */
    PROCEDURE PERSIST_DATA(i_PERSON_FK IN DL_BORDERCONTROL.FELLOW_PASSENGER.KEY_VALUE%type);


    /**
    * Takes the Data from dynamically generated APEX Items (F00_ to FXX_) and Updates the Collection)
    *
    */
    PROCEDURE PROCESS_FXX_DATA;

END PKG_COLLECTIVE_PASSPORT;
/
