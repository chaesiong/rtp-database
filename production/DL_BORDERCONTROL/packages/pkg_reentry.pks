CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_REENTRY" AS
    /*******************************************************************************
    * This package provides a service for managing the TM8 Application Data
    * It can create, persists, and serve Data
    *
    *
    * Author    Date        Description
    * --------  ----------  -------------------------------------------------------*
    * DNotzon   18.06.2018  Initial Release
    * DNotzon   28.06.2018  Implemented Better Exception Handling
	* DNotzon   17.07.2018  Implemented Terminal Insert
    *******************************************************************************/

    /************************************************
    * ====== GLOBAL VARIABLES AND EXCEPTIONS =======
    ************************************************/

    --Exception raised when no entry form is found while scanning the Passport.
    NO_ENTRY_FORM_FOUND     EXCEPTION;
    --Exception raised when no borderdocument is found while scanning the Passport.
    NO_BORDERDOC_FOUND      EXCEPTION;
    --Exception raised when no Visa is found while scanning the Passport.
    NO_VISA_FOUND           EXCEPTION;
    --Exception raised when no Arrival is found while scanning the Passport.
    NO_ARRIVAL_FOUND        EXCEPTION;


    /************************************************
    * ========== FUNCTIONS AND PROCEDURES ==========
    ************************************************/

    /**
    * This Procedure takes an Application, Person and Visa Rowtype and Saves the Data into the Respective tables.
    *
    * @param io_application     The Application Rowtype with all the Data Input - Returns the Application with the given Primary Key
    * @param i_person           The Person Rowtype with all the Data Input
    * @param i_visa             The Visa Rowtype with all the Data Input
    * @param i_borderdocument   The Borderdocument that was used for this RE-Entry Permit
    */
    PROCEDURE save_application(io_application IN OUT DL_BORDERCONTROL.TM8_APPLICATION%rowtype, i_person DL_BORDERCONTROL.PERSON%rowtype, i_visa DL_BORDERCONTROL.VISAS%rowtype, i_borderdocument DL_BORDERCONTROL.BORDERDOCUMENTS%rowtype);
    /**
    * This Procedure loads the Data of the Applicant with provided Passport Data
    * It will return the Data for the LATEST movement found in the database for this Passport
    *
    * @param i_passport_no          The Passport Number
    * @param i_passport_valid_until The Expiry Date of the Passport
    * @param i_passport_issued_by   The Issuing Country of the Passport
    * @param o_borderdocument       The Borderdocument Rowtype with all the Data for the given Passport
    * @param o_visa                 The Visa Rowtype with all the Data for the given Passport
    * @param o_entry_form           The Entry Form Rowtype with all the Data for the given Passport
    * @param o_last_arrival         The Last arrival of the given Movement
    */
    PROCEDURE GET_DATA_BY_PASSPORT(
        i_passport_no IN VARCHAR2,
        i_passport_valid_until DATE,
        i_passport_issued_by VARCHAR2,
        o_borderdocument OUT NOCOPY DL_BORDERCONTROL.BORDERDOCUMENTS%rowtype,
        o_visa OUT NOCOPY DL_BORDERCONTROL.VISAS%rowtype,
        o_entry_form OUT NOCOPY DL_BORDERCONTROL.ENTRY_FORMS%rowtype,
        o_last_arrival OUT NOCOPY DL_BORDERCONTROL.MOVEMENTS%rowtype);

    /**
    * With this function you can increase the number of used Re-Entries for the given Primary Key of the TM8 Application Table
    *
    * @param l_KEY_VALUE          The Primary Key of the TM8 Application
    */
    FUNCTION INCREASE_REENTRY_USED(l_KEY_VALUE IN TM8_APPLICATION.KEY_VALUE%type) RETURN BOOLEAN;

END PKG_REENTRY;
/
