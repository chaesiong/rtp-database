CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_REENTRY" AS
    /*******************************************************************************
    * This package provides a service for managing the TM8 Application Data
    * It can create, persists, and serve Data
    *
    *
    * Author    Date        Description
    * --------  ----------  -------------------------------------------------------*
    * DNotzon   18.06.2018  Initial Release
    * DNotzon   28.06.2018  Implemented Better Exception Handling
    *******************************************************************************/

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
    PROCEDURE save_application(io_application IN OUT DL_BORDERCONTROL.TM8_APPLICATION%rowtype, i_person DL_BORDERCONTROL.PERSON%rowtype, i_visa DL_BORDERCONTROL.VISAS%rowtype, i_borderdocument DL_BORDERCONTROL.BORDERDOCUMENTS%rowtype) AS
        l_person      DL_BORDERCONTROL.PERSON%rowtype                 := i_person; --The Information of the Person for the TM8
        --l_application DL_BORDERCONTROL.TM8_APPLICATION%rowtype        := io_application; --The Information for the TM8 to be inserted or update
        l_visa        DL_BORDERCONTROL.VISAS%rowtype                  := i_visa;
        l_oldApp      DL_BORDERCONTROL.TM8_APPLICATION%rowtype        := NULL; --Values of the already Existing Application
    BEGIN

        BEGIN
            SELECT
                * INTO l_oldApp FROM DL_BORDERCONTROL.TM8_APPLICATION
            WHERE
                DL_BORDERCONTROL.TM8_APPLICATION.APPLICATION_NUMBER = io_application.APPLICATION_NUMBER;

            --This Application Number Exists Already, Update it and the Person and Visa attached to it--
            UPDATE DL_BORDERCONTROL.TM8_APPLICATION
            SET
                -- SET FEES_FK = NULL
                -- SET PERSON_FK = NULL,
                PURPOSE_SEQNO        = io_application.PURPOSE_SEQNO,
                PURPOSE              = io_application.PURPOSE,
                TRANSPORTTYPE_SEQNO  = io_application.TRANSPORTTYPE_SEQNO,
                --VISANO               = i_application.VISANO,
                DOC_DATE             = io_application.DOC_DATE,
                ARRIVE_DATE          = io_application.ARRIVE_DATE,
                LEAVE_DATE           = io_application.LEAVE_DATE,
                RETURN_DATE          = io_application.RETURN_DATE,
                ENDPERMIT_DATE       = io_application.ENDPERMIT_DATE,
                PASSPORTNO           = io_application.PASSPORTNO,
                PASSPORT_ISSUED_DATE = io_application.PASSPORT_ISSUED_DATE,
                PASSPORT_EXPIRY_DATE = io_application.PASSPORT_EXPIRY_DATE,
                PASSPORT_ISSUED_BY   = io_application.PASSPORT_ISSUED_BY,
                TM8_TYPE             = io_application.TM8_TYPE,
                MANUALTM8            = io_application.MANUALTM8,
                APPROVAL_STATUS      = io_application.APPROVAL_STATUS,
                TM6_NUMBER           = io_application.TM6_NUMBER,
                DESTINATION_COUNTRY  = io_application.DESTINATION_COUNTRY,
                ADDITIONAL_INFO      = io_application.ADDITIONAL_INFO,
                NUMBER_OF_ENTRIES    = io_application.NUMBER_OF_ENTRIES
            WHERE
                KEY_VALUE = l_oldApp.KEY_VALUE;

            UPDATE DL_BORDERCONTROL.PERSON
            SET
                FIRST_NAME               = i_person.FIRST_NAME,
                MIDDLE_NAME              = i_person.MIDDLE_NAME,
                LAST_NAME                = i_person.LAST_NAME,
                DATE_OF_BIRTH            = i_person.DATE_OF_BIRTH,
                SEX                      = i_person.SEX,
                PLACE_OF_BIRTH           = i_person.PLACE_OF_BIRTH,
                BIRTH_COUNTRY            = i_person.BIRTH_COUNTRY,
                PHONE_NUMBER             = i_person.PHONE_NUMBER,
                TA_STREET                = i_person.TA_STREET,
                TA_ADM_CLASS_DISTRICT    = i_person.TA_ADM_CLASS_DISTRICT,
                TA_ADM_CLASS_SUBDISTRICT = i_person.TA_ADM_CLASS_SUBDISTRICT,
                TA_ADM_CLASS_PROVINCE    = i_person.TA_ADM_CLASS_PROVINCE,
                NATIONALITY              = i_person.NATIONALITY,
                PROFESSION               = i_person.PROFESSION,
                PERMANENT_ADDRESS        = i_person.PERMANENT_ADDRESS,
                CONTACT_PERSON           = i_person.CONTACT_PERSON,
                SALUTATION               = i_person.SALUTATION,
                RELATION                 = i_person.RELATION,
                TM6_NO                   = i_person.TM6_NO,
                IMAGE                    = i_person.IMAGE
            WHERE
                KEY_VALUE = l_oldApp.PERSON_FK;

            UPDATE VISAS
            SET
                VISA_NUMBER   = l_visa.VISA_NUMBER,
                ISSUING_PLACE = l_visa.ISSUING_PLACE,
                ISSUING_DATE  = l_visa.ISSUING_DATE,
                VISA_TYPE     = l_visa.VISA_TYPE,
                EXPIRY_DATE   = l_visa.EXPIRY_DATE
            WHERE
                KEY_VALUE = l_oldApp.VISA_FK;

            --Update the Borderdocuments table--
            UPDATE BORDERDOCUMENTS
            SET
                DOCTYPE   = i_borderdocument.DOCTYPE,
                DOCCLASS  = i_borderdocument.DOCCLASS
            WHERE
                BRDDOCID     = i_borderdocument.BRDDOCID;

            PKG_COLLECTIVE_PASSPORT.PERSIST_DATA(l_oldApp.PERSON_FK);
            PKG_COLLECTIVE_PASSPORT.INIT_TEMP_TABLE(true);

            SELECT
                * INTO io_application FROM DL_BORDERCONTROL.TM8_APPLICATION
            WHERE
                DL_BORDERCONTROL.TM8_APPLICATION.APPLICATION_NUMBER = io_application.APPLICATION_NUMBER;

        EXCEPTION WHEN no_data_found then
            --It's a new Application Number...--

            --Generate Unique Identifiers and defaults--
            io_application.KEY_VALUE := SYS_GUID();
            l_person.KEY_VALUE      := SYS_GUID();
            --l_application.DOC_DATE  := sysdate;


            l_visa.INS_TERMINAL := v ('AI_TERMINAL_ID');

            --Use that as a reference for the application
            io_application.VISA_FK := l_visa.KEY_VALUE;
            io_application.PERSON_FK := l_person.KEY_VALUE;

            --Insert Person Data--
            INSERT INTO PERSON VALUES l_person;

            --Insert Visa Data--
            --INSERT INTO VISAS VALUES l_visa;
            UPDATE VISAS
            SET
                ISSUING_PLACE = l_visa.ISSUING_PLACE,
                ISSUING_DATE  = l_visa.ISSUING_DATE,
                VISA_TYPE     = l_visa.VISA_TYPE,
                EXPIRY_DATE   = l_visa.EXPIRY_DATE,
                VISA_NUMBER   = l_visa.VISA_NUMBER
            WHERE
                KEY_VALUE     = l_visa.KEY_VALUE;

            --Update the Borderdocuments table--
            UPDATE BORDERDOCUMENTS
            SET
                DOCTYPE   = i_borderdocument.DOCTYPE,
                DOCCLASS  = i_borderdocument.DOCCLASS
            WHERE
                BRDDOCID     = i_borderdocument.BRDDOCID;

            --Insert TM8 Application Data--
            INSERT INTO TM8_APPLICATION VALUES io_application;

            commit;
            --Persist Child Data
            PKG_COLLECTIVE_PASSPORT.PERSIST_DATA(l_person.KEY_VALUE);
            PKG_COLLECTIVE_PASSPORT.INIT_TEMP_TABLE(true);
        END;

        commit;
    END save_application;

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
        o_last_arrival OUT NOCOPY DL_BORDERCONTROL.MOVEMENTS%rowtype) AS
    BEGIN

        BEGIN

            --apex_debug.error('Getting BorderDoc-ID. PassporNot: %s Issued By %s Expiry Date %s', i_passport_no, i_passport_issued_by, to_char(i_passport_valid_until) );

            --Get the Lastest BRDDOCID from the Borderdocuments Table
            o_borderdocument.BRDDOCID := PKG_BORDERDOCUMENTS.GET_DOCUMENT(
                            p_DOCNO      => i_passport_no,
                            p_ISSUECTRY  => i_passport_issued_by,
                            p_EXPIRYDATE => i_passport_valid_until);

            --apex_debug.error('BorderDocument ID: %s', o_borderdocument.BRDDOCID);

            --Get the Borderdocument
            SELECT
                *
            INTO
                o_borderdocument
            FROM
                DL_BORDERCONTROL.BORDERDOCUMENTS
            WHERE
                BORDERDOCUMENTS.BRDDOCID = o_borderdocument.BRDDOCID;

        EXCEPTION WHEN no_data_found then
            raise NO_BORDERDOC_FOUND;
        END GET_BORDERDOC;

        BEGIN
            --Get Last Visa Information by Borderdocument
            SELECT
                *
            INTO
                o_visa
            FROM
                DL_BORDERCONTROL.VISAS
            WHERE
                BORDERDOCUMENT = o_borderdocument.BRDDOCID
            ORDER BY INS_AT DESC
            FETCH FIRST 1 ROWS ONLY;

        EXCEPTION WHEN no_data_found then
            raise NO_VISA_FOUND;
        END GET_VISA;

        BEGIN
            o_last_arrival.MVMNTID := DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT(i_passport_no, i_passport_issued_by, i_passport_valid_until, 'LAST_MOVEMENT', 0);
            SELECT
                *
            INTO
                o_last_arrival
            FROM
                DL_BORDERCONTROL.MOVEMENTS
            WHERE
                MVMNTID = o_last_arrival.MVMNTID;
        EXCEPTION WHEN no_data_found then
            raise NO_ARRIVAL_FOUND;
        END GET_LAST_ARRIVAL;


        BEGIN
            --Get TM6 Form Infos--
            --Get the Entry Form Primary Key for the Last Movement
            o_entry_form.KEY_VALUE := DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT(i_passport_no, i_passport_issued_by, i_passport_valid_until, 'ENTRY_FORM' );
            SELECT
                *
            INTO
                o_entry_form
            FROM
                DL_BORDERCONTROL.ENTRY_FORMS
            WHERE
                ENTRY_FORMS.KEY_VALUE = o_entry_form.KEY_VALUE;

        EXCEPTION WHEN no_data_found then
            raise NO_ENTRY_FORM_FOUND;
        END GET_ENTRY_FORM;

    END;

    /**
    * With this function you can increase the number of Re-Entries for the given Primary Key of the TM8 Application Table
    *
    * @param l_KEY_VALUE          The Primary Key of the TM8 Application
    */
    FUNCTION INCREASE_REENTRY_USED(l_KEY_VALUE IN TM8_APPLICATION.KEY_VALUE%type) RETURN BOOLEAN
    AS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_number_of_rows_affected NUMBER;
    BEGIN
        UPDATE
            TM8_APPLICATION
        SET
            NUMBER_OF_ENTRIES_USED = NUMBER_OF_ENTRIES_USED+1
        WHERE
            KEY_VALUE = l_KEY_VALUE AND
            NUMBER_OF_ENTRIES >= NUMBER_OF_ENTRIES_USED+1 AND
            NUMBER_OF_ENTRIES IS NOT NULL;

        l_number_of_rows_affected := sql%rowcount;
        commit;
        return (l_number_of_rows_affected > 0);
    END;

END PKG_REENTRY;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_REENTRY" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_REENTRY" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_REENTRY" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_REENTRY" TO "BIOSAADM";
