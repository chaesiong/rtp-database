CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."VOA_APEX_PKG" IS

 /*******************************************************************************
  * This package provides a service for saving the data of the Visa On Arrival
  * APEX application
  * It is used to set all parameters from the frontend to this PL/SQL package
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * CHageman  22.06.2018  Added column passport doctype to search functionality
  * CHageman  11.06.2018  Added report_search functionality
  * CHageman  14.05.2018  Added p_blacklist_record to save functionality
  * CHageman  03.04.2018  Added function get_search_query
  * CHageman  08.03.2018  Added
  *******************************************************************************/

  /****************************************
   * ========== TYPE DEFINITIONS ==========
   ****************************************/

  c_scope_prefix        CONSTANT VARCHAR2(31) := lower($$plsql_unit) || '.';
  c_icao_dc_list        CONSTANT VARCHAR2(32) := 'VISA_ON_ARRIVAL';
  --
  c_report_datasource   CONSTANT VARCHAR2(255 CHAR) := 'default';
  c_report_link_param   CONSTANT VARCHAR2(50 CHAR)  := 'LINK_REPORT_SERVICE';
  c_voa_report          CONSTANT VARCHAR2(255 CHAR) := 'apex/VOA';
  c_report_format       CONSTANT VARCHAR2(50 CHAR)  := jasper_reporting.xlib_jasperreports.c_rep_format_pdf;
  c_report_locale       CONSTANT VARCHAR2(50 CHAR)  := 'de_DE';
  c_report_encoding     CONSTANT VARCHAR2(50 CHAR)  := 'UTF-8';
  --
  c_print_application   CONSTANT NUMBER             := 510;
  c_print_page          CONSTANT NUMBER             := 40;
  --
  c_image_col_name      CONSTANT VARCHAR2(50 CHAR)  := 'VOA_IMAGES';

  /************************************************
   * ========== FUNCTIONS AND PROCEDURES ==========
   ************************************************/

  /**
   * Returns the next possible visa number from sequence
   * DL_BORDERCONTROL.VISAS$SEQ01
   *
   * @return visas.visa_number%TYPE: Visa Number
   */
  FUNCTION get_next_visa_number
  RETURN visas.visa_number%TYPE
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'get_next_visa_number';
    l_params logger.tab_param;
    --
    l_result visas.visa_number%TYPE;

  BEGIN


    logger.log('GET NEXT VISA NUMBER: start', l_scope, null, l_params);

    l_result := dl_bordercontrol.visas$seq01.nextval();

    logger.append_param(l_params, 'l_result', l_result);
    logger.log('GET NEXT VISA NUMBER: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('UNHANDLED EXCEPTION', l_scope, null, l_params);
      RAISE;
  END get_next_visa_number;

  /**
   * Saves the parameter data into the database
   * Also provides that all data are inserted into the right table
   * and checks the given Collection data
   *
   * @param p_key_value
   * @param p_person
   * @param p_last_name
   * @param p_first_name
   * @param p_middle_name
   * @param p_nationality
   * @param p_passport_no
   * @param p_date_of_birth
   * @param p_gender
   * @param p_salutation
   * @param p_tm6_no
   * @param p_issuing_country
   * @param p_from_country
   * @param p_date_of_issue
   * @param p_expiry_date
   * @param p_travel_date
   * @param p_transport_type
   * @param p_flight_no
   * @param p_profession
   * @param p_permanent_address
   * @param p_address_thailand
   * @param p_province
   * @param p_district
   * @param p_subdistrict
   * @param p_contaczt_person
   * @param p_relation
   * @param p_approve_status
   * @param p_officer
   * @param p_requesting_date
   * @param p_visa_expiry_date
   * @param p_receipt
   * @param p_fee_exception
   * @param p_passport_doctype
   * @param p_passport_mrz
   * @param p_passport_visual_face
   * @param p_passport_icao_face
   * @param p_passport_visualpage
   * @param p_passport_uvpage
   * @param p_passport_irpage
   * @param p_passport_dg3_0
   * @param p_passport_dg3_1
   * @param p_status_fee_exception
   * @param p_status_no_receipt
   * @param p_status_print_form
   * @param p_release_note
   * @param p_cancel_note
   * @param p_blacklist_record
   */
  PROCEDURE save (p_key_value             IN OUT VARCHAR2
                 ,p_person                IN OUT VARCHAR2
                 ,p_last_name             IN VARCHAR2
                 ,p_first_name            IN VARCHAR2
                 ,p_middle_name           IN VARCHAR2
                 ,p_nationality           IN VARCHAR2
                 ,p_passport_no           IN VARCHAR2
                 ,p_date_of_birth         IN VARCHAR2
                 ,p_gender                IN VARCHAR2
                 ,p_salutation            IN VARCHAR2
                 ,p_tm6_no                IN VARCHAR2
                 ,p_issuing_country       IN VARCHAR2
                 ,p_from_country          IN VARCHAR2
                 ,p_date_of_issue         IN DATE
                 ,p_expiry_date           IN DATE
                 ,p_travel_date           IN DATE
                 ,p_transport_type        IN VARCHAR2
                 ,p_flight_no             IN VARCHAR2
                 ,p_profession            IN VARCHAR2
                 ,p_permanent_address     IN VARCHAR2
                 ,p_address_thailand      IN VARCHAR2
                 ,p_province              IN VARCHAR2
                 ,p_district              IN VARCHAR2
                 ,p_subdistrict           IN VARCHAR2
                 ,p_contact_person        IN VARCHAR2
                 ,p_relation              IN VARCHAR2
                 ,p_approve_status        IN VARCHAR2 --> approve status (bottom of page 510:1)
                 ,p_officer               IN VARCHAR2
                 ,p_requesting_date       IN DATE
                 ,p_visa_expiry_date      IN DATE
                 ,p_receipt               IN VARCHAR2
                 ,p_fee_exception         IN VARCHAR2
                 ,p_person_photo          IN BLOB
                 ,p_terminal_id           IN VARCHAR2
                 ,p_borderpost_id         IN VARCHAR2
                 ,p_passport_doctype      IN VARCHAR2
                 ,p_passport_mrz          IN VARCHAR2
                 ,p_passport_dob          IN VARCHAR2
                 ,p_passport_visual_face  IN BLOB
                 ,p_passport_icao_face    IN BLOB
                 ,p_passport_visualpage   IN BLOB
                 ,p_passport_uvpage       IN BLOB
                 ,p_passport_irpage       IN BLOB
                 ,p_passport_dg3_0        IN BLOB
                 ,p_passport_dg3_1        IN BLOB
                 ,p_status_fee_exception  IN visas.status_fee_exception%TYPE
                 ,p_status_no_receipt     IN visas.status_no_receipt%TYPE
                 ,p_status_print_form     IN visas.status_print_form%TYPE
                 ,p_release_note          IN visas.release_note%TYPE
                 ,p_cancel_note           IN visas.cancel_note%TYPE
                 ,p_blacklist_record      IN visas.blacklist_record%TYPE
                 ,p_visa_number           IN visas.visa_number%TYPE DEFAULT NULL
                 ,x_visa_number           OUT dl_bordercontrol.visas.visa_number%TYPE)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'save';
    l_params logger.tab_param;
    --
    l_person_rec          person%ROWTYPE;
    l_visa_rec            visas%ROWTYPE;
    l_borderdocument_rec  borderdocuments%ROWTYPE;

  BEGIN

    logger.append_param(l_params, 'p_key_value'           ,p_key_value);
    logger.append_param(l_params, 'p_person'              ,p_person);
    logger.append_param(l_params, 'p_last_name'           ,p_last_name);
    logger.append_param(l_params, 'p_first_name'          ,p_first_name);
    logger.append_param(l_params, 'p_middle_name'         ,p_middle_name);
    logger.append_param(l_params, 'p_nationality'         ,p_nationality);
    logger.append_param(l_params, 'p_passport_no'         ,p_passport_no);
    logger.append_param(l_params, 'p_date_of_birth'       ,p_date_of_birth);
    logger.append_param(l_params, 'p_gender'              ,p_gender);
    logger.append_param(l_params, 'p_salutation'          ,p_salutation);
    logger.append_param(l_params, 'p_tm6_no'              ,p_tm6_no);
    logger.append_param(l_params, 'p_issuing_country'     ,p_issuing_country);
    logger.append_param(l_params, 'p_from_country'        ,p_from_country);
    logger.append_param(l_params, 'p_date_of_issue'       ,p_date_of_issue);
    logger.append_param(l_params, 'p_expiry_date'         ,p_expiry_date);
    logger.append_param(l_params, 'p_travel_date'         ,p_travel_date);
    logger.append_param(l_params, 'p_transport_type'      ,p_transport_type);
    logger.append_param(l_params, 'p_flight_no'           ,p_flight_no);
    logger.append_param(l_params, 'p_profession'          ,p_profession);
    logger.append_param(l_params, 'p_permanent_address'   ,p_permanent_address);
    logger.append_param(l_params, 'p_address_thailand'    ,p_address_thailand);
    logger.append_param(l_params, 'p_province'            ,p_province);
    logger.append_param(l_params, 'p_district'            ,p_district);
    logger.append_param(l_params, 'p_subdistrict'         ,p_subdistrict);
    logger.append_param(l_params, 'p_contact_person'      ,p_contact_person);
    logger.append_param(l_params, 'p_relation'            ,p_relation);
    logger.append_param(l_params, 'p_approve_status'      ,p_approve_status);
    logger.append_param(l_params, 'p_officer'             ,p_officer);
    logger.append_param(l_params, 'p_requesting_date'     ,p_requesting_date);
    logger.append_param(l_params, 'p_visa_expiry_date'    ,p_visa_expiry_date);
    logger.append_param(l_params, 'p_receipt'             ,p_receipt);
    logger.append_param(l_params, 'p_fee_exception'       ,p_fee_exception);
    --logger.append_param(l_params, 'p_person_photo'        ,p_person_photo);
    logger.append_param(l_params, 'p_terminal_id'         ,p_terminal_id);
    logger.append_param(l_params, 'p_borderpost_id'       ,p_borderpost_id);
    logger.append_param(l_params, 'p_passport_doctype'    ,p_passport_doctype);
    logger.append_param(l_params, 'p_passport_mrz'        ,p_passport_mrz);
    logger.append_param(l_params, 'p_passport_dob'        ,p_passport_dob);
    --logger.append_param(l_params, 'p_passport_visual_face',p_passport_visual_face);
    --logger.append_param(l_params, 'p_passport_icao_face'  ,p_passport_icao_face);
    --logger.append_param(l_params, 'p_passport_visualpage' ,p_passport_visualpage);
    --logger.append_param(l_params, 'p_passport_uvpage'     ,p_passport_uvpage);
    --logger.append_param(l_params, 'p_passport_irpage'     ,p_passport_irpage);
    --logger.append_param(l_params, 'p_passport_dg3_0'      ,p_passport_dg3_0);
    --logger.append_param(l_params, 'p_passport_dg3_1'      ,p_passport_dg3_1);
    logger.append_param(l_params, 'p_status_fee_exception', p_status_fee_exception);
    logger.append_param(l_params, 'p_status_no_receipt', p_status_no_receipt);
    logger.append_param(l_params, 'p_status_print_form', p_status_print_form);
    logger.append_param(l_params, 'p_release_note', p_release_note);
    logger.append_param(l_params, 'p_cancel_note', p_cancel_note);
    logger.append_param(l_params, 'p_blacklist_record', p_blacklist_record);
    logger.append_param(l_params, 'p_visa_number', p_visa_number);

    logger.log('SAVE VISA INFORMATION: start', l_scope, null, l_params);

    -- FELLOW_PASSENGER

    -- -----------------------------------------------
    -- SAVE DATA
    -- -----------------------------------------------

    -- get gender information
    IF p_gender IS NOT NULL
    THEN

      BEGIN

        SELECT key_value
          INTO l_person_rec.sex
          FROM dl_common.human_sexes$lc
         WHERE num_value = p_gender;

        logger.append_param(l_params, 'l_person_rec.sex', l_person_rec.sex);

      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          logger.log_warning('ISO Code of human sexes could not be found', l_scope, null, l_params);
          RAISE;
        WHEN TOO_MANY_ROWS
        THEN
          logger.log_warning('Too many rows were found while searching for the given human sex', l_scope, null, l_params);
          RAISE;
      END;
    END IF;

    -- save person data
    l_person_rec.key_value                := p_person;
    l_person_rec.first_name               := p_first_name;
    l_person_rec.last_name                := p_last_name;
    l_person_rec.middle_name              := p_middle_name;
    l_person_rec.date_of_birth            := p_date_of_birth;
    l_person_rec.place_of_birth           := NULL;
    l_person_rec.birth_country            := NULL;
    l_person_rec.phone_number             := NULL;
    l_person_rec.ta_street                := p_address_thailand;
    l_person_rec.ta_adm_class_district    := p_district;
    l_person_rec.ta_adm_class_subdistrict := p_subdistrict;
    l_person_rec.ta_adm_class_province    := p_province;
    l_person_rec.nationality              := p_nationality;
    l_person_rec.profession               := p_profession;
    l_person_rec.permanent_address        := p_permanent_address;
    l_person_rec.contact_person           := p_contact_person;
    l_person_rec.salutation               := p_salutation;
    l_person_rec.relation                 := p_relation;
    l_person_rec.tm6_no                   := p_tm6_no;
    l_person_rec.image                    := p_person_photo;

    logger.log('set person record: start', l_scope, null, l_params);

    -- SAVE OR INSERT PERSON information
    IF l_person_rec.key_value IS NULL
    THEN

      INSERT
        INTO person
      VALUES l_person_rec
      RETURNING key_value INTO l_person_rec.key_value;

    ELSE

      UPDATE person
         SET first_name               = l_person_rec.first_name
            ,last_name                = l_person_rec.last_name
            ,middle_name              = l_person_rec.middle_name
            ,date_of_birth            = l_person_rec.date_of_birth
            ,place_of_birth           = place_of_birth -- always null in VOA
            ,birth_country            = birth_country -- always null in VOA
            ,phone_number             = phone_number -- always null in VOA
            ,ta_street                = l_person_rec.ta_street
            ,ta_adm_class_district    = l_person_rec.ta_adm_class_district
            ,ta_adm_class_province    = l_person_rec.ta_adm_class_province
            ,ta_adm_class_subdistrict = l_person_rec.ta_adm_class_subdistrict
            ,nationality              = l_person_rec.nationality
            ,profession               = l_person_rec.profession
            ,permanent_address        = l_person_rec.permanent_address
            ,contact_person           = l_person_rec.contact_person
            ,salutation               = l_person_rec.salutation
            ,relation                 = l_person_rec.relation
            ,tm6_no                   = l_person_rec.tm6_no
            ,image                    = NVL(l_person_rec.image, image)
       WHERE key_value = l_person_rec.key_value;
    END IF;

    logger.append_param(l_params, 'l_person_rec.key_value', l_person_rec.key_value);

    logger.log('set person record: done', l_scope, null, l_params);

    -- INSERT BORDERDOCUMENT information
    -- save borderdocument data
    IF p_passport_doctype IS NOT NULL AND p_key_value IS NULL
    THEN

      -- search existing borderdocument so no duplicate entries are saved
      l_borderdocument_rec.brddocid := dl_bordercontrol.pkg_borderdocuments.get_document (p_docno      => p_passport_no
                                                                                         ,p_issuectry  => p_issuing_country
                                                                                         ,p_expirydate => p_expiry_date);

      -- if no existing borderdocument was found, insert a new one
      IF l_borderdocument_rec.brddocid  IS NULL      AND
         p_last_name                    IS NOT NULL  AND
         p_expiry_date                  IS NOT NULL  AND
         (p_passport_dob                IS NOT NULL  OR
          p_date_of_birth               IS NOT NULL) AND
         p_nationality                  IS NOT NULL  AND
         p_issuing_country              IS NOT NULL  AND
         p_passport_no                  IS NOT NULL  AND
         p_passport_doctype             IS NOT NULL  AND
         p_gender                       IS NOT NULL
      THEN
        l_borderdocument_rec.brddocid := dl_bordercontrol.pkg_borderdocuments.create_document(p_docno              => p_passport_no
                                                                                            ,p_doctype             => p_passport_doctype
                                                                                            ,p_issuectry           => p_issuing_country
                                                                                            ,p_expirydate          => p_expiry_date
                                                                                            ,p_surname             => p_last_name
                                                                                            ,p_middlename          => p_middle_name
                                                                                            ,p_givenname           => p_first_name
                                                                                            ,p_sex                 => p_gender
                                                                                            ,p_dob                 => NVL(p_passport_dob, TO_CHAR(TO_DATE(p_date_of_birth), 'YYMMDD'))
                                                                                            ,p_mrzdg1              => p_passport_mrz
                                                                                            ,p_ins_terminal        => p_terminal_id
                                                                                            ,p_ins_borderpost      => p_borderpost_id
                                                                                            ,p_img_visual_face     => p_passport_visual_face
                                                                                            ,p_img_icao_face       => p_passport_icao_face
                                                                                            ,p_img_visualpage      => p_passport_visualpage
                                                                                            ,p_img_uvpage          => p_passport_uvpage
                                                                                            ,p_img_irpage          => p_passport_irpage
                                                                                            ,p_img_dg3_0           => p_passport_dg3_0
                                                                                            ,p_img_dg3_1           => p_passport_dg3_1
                                                                                            ,p_manual_expiry_date  => p_expiry_date
                                                                                            ,p_manual_issuing_date => p_date_of_issue
                                                                                            ,p_manual_nationality  => p_nationality
                                                                                            ,p_manual_placeofbirth => NULL --No place of birth is set in VOA
                                                                                            --
                                                                                            );
      END IF;
    END IF;

    logger.append_param(l_params, 'l_borderdocument_rec.brddocid', l_borderdocument_rec.brddocid);

    -- SAVE OR INSERT VISA information
    -- get visa_type
    BEGIN

      SELECT key_value
        INTO l_visa_rec.visa_type
        FROM dl_common.visa_types
        WHERE icao_dc_list = c_icao_dc_list
          AND PERMIT_DAYS = 15
          AND ROWNUM       = 1;

      logger.append_param(l_params, 'l_visa_rec.visa_type', l_visa_rec.visa_type);

    EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
        raise_application_error(-20999, 'Could not find the right Visa-Type');
    END;

    -- save visa data
    l_visa_rec.key_value            := p_key_value;
    l_visa_rec.visa_number          := NVL(p_visa_number, get_next_visa_number());
    l_visa_rec.issuing_date         := SYSDATE;
    l_visa_rec.issuing_place        := NULL; -- not needed at Visa on Arrival
    l_visa_rec.additional_info      := NULL;
    l_visa_rec.borderdocument       := l_borderdocument_rec.brddocid;
    l_visa_rec.visa_image           := NULL; -- TODO --> Report File
    l_visa_rec.expiry_date          := p_visa_expiry_date;
    l_visa_rec.person               := l_person_rec.key_value;
    l_visa_rec.applicant_date       := p_requesting_date;
    l_visa_rec.from_country         := p_from_country;
    l_visa_rec.trans_vehicle        := p_transport_type;
    l_visa_rec.trans_number         := p_flight_no;
    l_visa_rec.status               := p_approve_status;
    l_visa_rec.release_note         := p_release_note;
    l_visa_rec.cancel_note          := p_cancel_note;
    l_visa_rec.payment_status       := CASE p_fee_exception WHEN 'Y' THEN 'DONT_PAY' ELSE 'NOT_YET_PAID' END;
    l_visa_rec.ins_terminal         := p_terminal_id;
    l_visa_rec.ins_borderpost       := p_borderpost_id;
    l_visa_rec.status_fee_exception := p_status_fee_exception;
    l_visa_rec.status_no_receipt    := NVL(p_status_no_receipt, 'N');
    l_visa_rec.status_print_form    := NVL(p_status_print_form, 'N');
    l_visa_rec.ins_officer          := p_officer;
    l_visa_rec.blacklist_record     := p_blacklist_record;

    logger.append_param(l_params, 'l_visa_rec.status_fee_exception', l_visa_rec.status_fee_exception);

    IF l_visa_rec.key_value IS NULL
    THEN

      INSERT
        INTO visas
      VALUES l_visa_rec
      RETURNING key_value INTO l_visa_rec.key_value;

      logger.append_param(l_params, 'l_visa_rec.key_value', l_visa_rec.key_value);

    ELSE

      UPDATE visas
         SET visa_number          = visa_number
            ,issuing_date         = issuing_date
            ,issuing_place        = issuing_place
            ,additional_info      = additional_info
            ,borderdocument       = borderdocument
            ,visa_image           = visa_image -- TODO: replace file here on update?
            ,expiry_date          = l_visa_rec.expiry_date
            ,person               = l_person_rec.key_value
            ,applicant_date       = l_visa_rec.applicant_date
            ,from_country         = l_visa_rec.from_country
            ,trans_vehicle        = l_visa_rec.trans_vehicle
            ,trans_number         = l_visa_rec.trans_number
            ,status               = l_visa_rec.status
            ,release_note         = release_note --l_visa_rec.release_note
            ,cancel_note          = cancel_note --l_visa_rec.cancel_note
            ,payment_status       = l_visa_rec.payment_status
            ,status_fee_exception = NVL(l_visa_rec.status_fee_exception, status_fee_exception)
            ,status_no_receipt    = NVL(l_visa_rec.status_no_receipt, status_no_receipt)
            ,status_print_form    = NVL(l_visa_rec.status_print_form, status_print_form)
            ,ins_officer          = l_visa_rec.ins_officer
       WHERE key_value = l_visa_rec.key_value;

    END IF;

    -- update VISA document
    BEGIN

      UPDATE visas
        SET visa_image = print_voa_document(l_visa_rec.key_value)
      WHERE key_value = l_visa_rec.key_value;
    EXCEPTION
      WHEN OTHERS
      THEN
        logger.log_warning('SAVE VISA INFORMATION: WARNING - print did not work', l_scope, null, l_params);
    END;

    logger.append_param(l_params, 'l_visa_rec.key_value', l_visa_rec.key_value);

    p_key_value   := l_visa_rec.key_value;
    p_person      := l_person_rec.key_value;
    x_visa_number := l_visa_rec.visa_number;

    -- commit information to persist all other information to make sure the asynchronous plsql function works

    COMMIT;

    -- persists collective passport information
    pkg_collective_passport.persist_data(l_person_rec.key_value);
    pkg_collective_passport.init_temp_table(true);

    logger.log('SAVE VISA INFORMATION: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      -- log error here
      logger.log_error('UNHANDLED EXCEPTION', l_scope, null, l_params);
      RAISE;
  END save;

  /**
   * Saves the fellow passenger information
   * Will be executed through the Interactive Grid (by row) in APEX
   *
   * @p_apex_status Describes the actual DML-Operation (C.reate, U.pdate, D.elete)
   * @p_key_value
   * @p_person
   * @p_relation
   * @p_nationality
   * @p_receipt
   * @p_tm6_no
   * @p_last_name
   * @p_first_name
   * @p_middle_name
   * @p_sex
   * @p_date_of_birth
   * @p_place_of_birth
   * @p_reason
   * @p_approval_status
   */
  PROCEDURE save_fellow_passenger (p_apex_status      IN CHAR
                                  ,p_key_value        IN OUT VARCHAR2
                                  ,p_person           IN VARCHAR2
                                  ,p_relation         IN VARCHAR2
                                  ,p_nationality      IN VARCHAR2
                                  ,p_receipt          IN VARCHAR2
                                  ,p_tm6_no           IN VARCHAR2
                                  ,p_first_name       IN VARCHAR2
                                  ,p_middle_name      IN VARCHAR2
                                  ,p_last_name        IN VARCHAR2
                                  ,p_sex              IN VARCHAR2
                                  ,p_date_of_birth    IN VARCHAR2
                                  ,p_place_of_birth   IN VARCHAR2
                                  ,p_reason           IN VARCHAR2
                                  ,p_approval_status  IN VARCHAR2)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'save_fellow_passenger';
    l_params logger.tab_param;
    --
    l_fellow_passenger_rec  fellow_passenger%ROWTYPE;

  BEGIN

    logger.append_param(l_params, 'p_apex_status', p_apex_status);
    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.append_param(l_params, 'p_person', p_person);
    logger.append_param(l_params, 'p_relation', p_relation);
    logger.append_param(l_params, 'p_nationality', p_nationality);
    logger.append_param(l_params, 'p_receipt', p_receipt);
    logger.append_param(l_params, 'p_tm6_no', p_tm6_no);
    logger.append_param(l_params, 'p_first_name', p_first_name);
    logger.append_param(l_params, 'p_middle_name', p_middle_name);
    logger.append_param(l_params, 'p_last_name', p_last_name);
    logger.append_param(l_params, 'p_sex', p_sex);
    logger.append_param(l_params, 'p_date_of_birth', p_date_of_birth);
    logger.append_param(l_params, 'p_place_of_birth', p_place_of_birth);
    logger.append_param(l_params, 'p_reason', p_reason);
    logger.append_param(l_params, 'p_approval_status', p_approval_status);

    logger.log('SAVE FELLOW PASSENGER: start', l_scope, null, l_params);

    l_fellow_passenger_rec.key_value        := p_key_value;
    l_fellow_passenger_rec.person           := p_person;
    l_fellow_passenger_rec.relation         := p_relation;
    l_fellow_passenger_rec.nationality      := p_nationality;
    l_fellow_passenger_rec.receipt          := p_receipt;
    l_fellow_passenger_rec.tm6_no           := p_tm6_no;
    l_fellow_passenger_rec.first_name       := p_first_name;
    l_fellow_passenger_rec.middle_name      := p_middle_name;
    l_fellow_passenger_rec.last_name        := p_last_name;
    l_fellow_passenger_rec.sex              := p_sex;
    l_fellow_passenger_rec.date_of_birth    := p_date_of_birth;
    l_fellow_passenger_rec.place_of_birth   := p_place_of_birth;
    l_fellow_passenger_rec.reason           := p_reason;
    l_fellow_passenger_rec.approval_status  := p_approval_status;

    IF p_apex_status = 'C'
    THEN

      l_fellow_passenger_rec.key_value := SYS_GUID();

      INSERT
        INTO fellow_passenger
      VALUES l_fellow_passenger_rec
      RETURNING key_value INTO p_key_value;

    END IF;

    logger.log('SAVE FELLOW PASSENGER: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log('SAVE FELLOW PASSENGER: unhandled exception', l_scope, null, l_params);
      RAISE;
  END save_fellow_passenger;

  /**
   * Searches for the given parameters and returns the values for the
   * APEX-ITEMS
   *
   * Params with prefix p_ are input parameters
   * Params with prefix x_ are output parameters
   *
   * p_key_value
   * x_key_value
   * x_person
   * x_last_name
   * x_first_name
   * x_middle_name
   * x_nationality
   * x_passport_no
   * x_date_of_birth
   * x_gender
   * x_salutation
   * x_tm6_no
   * x_issuing_country
   * x_from_county
   * x_date_of_issue
   * x_expiry_date
   * x_travel_date
   * x_transport_type
   * x_flight_no
   * x_profession
   * x_permanent_address
   * x_address_thailand
   * x_province
   * x_district
   * x_subdistrict
   * x_contact_person
   * x_relation
   * x_approve_status
   * x_officer
   * x_requesting_date
   * x_visa_expiry_date
   * x_receipt
   * x_fee_exception
   * x_person_photo
   * x_cancel_note
   * x_release_note
   * x_payment_status
   * x_ins_officer
   * x_receipt_no1
   * x_receipt_no2
   * x_status_fee_exception
   * x_status_no_receipt
   * x_status_print_form
   * x_passport_doctype
   */
  PROCEDURE search (p_key_value             IN  VARCHAR2
                   ,x_key_value             OUT VARCHAR2
                   ,x_person                OUT VARCHAR2
                   ,x_last_name             OUT VARCHAR2
                   ,x_first_name            OUT VARCHAR2
                   ,x_middle_name           OUT VARCHAR2
                   ,x_nationality           OUT VARCHAR2
                   ,x_passport_no           OUT VARCHAR2
                   ,x_date_of_birth         OUT VARCHAR2
                   ,x_gender                OUT dl_common.human_sexes.num_value%TYPE
                   ,x_salutation            OUT VARCHAR2
                   ,x_tm6_no                OUT VARCHAR2
                   ,x_issuing_country       OUT VARCHAR2
                   ,x_from_county           OUT VARCHAR2
                   ,x_date_of_issue         OUT DATE
                   ,x_expiry_date           OUT DATE
                   ,x_travel_date           OUT DATE
                   ,x_transport_type        OUT VARCHAR2
                   ,x_flight_no             OUT VARCHAR2
                   ,x_profession            OUT VARCHAR2
                   ,x_permanent_address     OUT VARCHAR2
                   ,x_address_thailand      OUT VARCHAR2
                   ,x_province              OUT VARCHAR2
                   ,x_district              OUT VARCHAR2
                   ,x_subdistrict           OUT VARCHAR2
                   ,x_contact_person        OUT VARCHAR2
                   ,x_relation              OUT VARCHAR2
                   ,x_approve_status        OUT VARCHAR2
                   ,x_officer               OUT VARCHAR2
                   ,x_requesting_date       OUT DATE
                   ,x_visa_expiry_date      OUT DATE
                   ,x_receipt               OUT VARCHAR2
                   ,x_fee_exception         OUT VARCHAR2
                   ,x_person_photo          OUT CLOB
                   ,x_cancel_note           OUT visas.cancel_note%TYPE
                   ,x_release_note          OUT visas.release_note%TYPE
                   ,x_payment_status        OUT visas.payment_status%TYPE
                   ,x_ins_officer           OUT visas.ins_officer%TYPE
                   ,x_receipt_no1           OUT faf_fees_and_fines.booking_number%TYPE
                   ,x_receipt_no2           OUT faf_fees_and_fines.receipt_number%TYPE
                   ,x_status_fee_exception  OUT visas.status_fee_exception%TYPE
                   ,x_status_no_receipt     OUT visas.status_no_receipt%TYPE
                   ,x_status_print_form     OUT visas.status_print_form%TYPE
                   ,x_visa_number           OUT visas.visa_number%TYPE
                   ,x_ins_terminal          OUT visas.ins_terminal%TYPE
                   ,x_passport_doctype      OUT borderdocuments.doctype%TYPE)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'search';
    l_params logger.tab_param;
    --
    l_image BLOB;

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.log('SEARCH VISA: start', l_scope, null, l_params);

    SELECT v.key_value
          ,v.person
          ,v.expiry_date
          ,v.applicant_date
          ,v.from_country
          ,v.trans_vehicle
          ,v.trans_number
          ,v.status
          ,v.cancel_note
          ,v.release_note
          ,v.payment_status
          ,p.last_name
          ,p.first_name
          ,p.middle_name
          ,p.date_of_birth
          ,sex.num_value
          ,p.date_of_birth
          ,p.ta_street
          ,p.ta_adm_class_district
          ,p.ta_adm_class_subdistrict
          ,p.ta_adm_class_province
          ,p.nationality
          ,p.profession
          ,p.permanent_address
          ,p.contact_person
          ,p.salutation
          ,p.relation
          ,p.tm6_no
          ,CASE WHEN dbms_lob.getlength(p.image) > 0 THEN 1 ELSE 0 END --dl_common.pkg_util.encode_base64(p.image)
          ,image
          ,bd.docno
          ,bd.expirydate
          ,bd.issuectry
          ,v.issuing_date
          ,v.applicant_date
          ,v.ins_officer
          ,v.receipt
          ,faf.booking_number
          ,faf.receipt_number
          ,v.status_fee_exception
          ,v.status_no_receipt
          ,v.status_print_form
          ,v.visa_number
          ,v.ins_terminal
          ,bd.doctype
      INTO x_key_value
          ,x_person
          ,x_visa_expiry_date
          ,x_requesting_date
          ,x_from_county
          ,x_transport_type
          ,x_flight_no
          ,x_approve_status
          ,x_cancel_note
          ,x_release_note
          ,x_payment_status
          ,x_last_name
          ,x_first_name
          ,x_middle_name
          ,x_date_of_birth
          ,x_gender
          ,x_date_of_birth
          ,x_address_thailand
          ,x_district
          ,x_subdistrict
          ,x_province
          ,x_nationality
          ,x_profession
          ,x_permanent_address
          ,x_contact_person
          ,x_salutation
          ,x_relation
          ,x_tm6_no
          ,x_person_photo
          ,l_image
          ,x_passport_no
          ,x_expiry_date
          ,x_issuing_country
          ,x_date_of_issue
          ,x_travel_date
          ,x_ins_officer
          ,x_receipt
          ,x_receipt_no1
          ,x_receipt_no2
          ,x_status_fee_exception
          ,x_status_no_receipt
          ,x_status_print_form
          ,x_visa_number
          ,x_ins_terminal
          ,x_passport_doctype
      FROM visas v
      JOIN person p ON v.person = p.key_value
      LEFT JOIN borderdocuments bd        ON bd.brddocid = v.borderdocument
      LEFT JOIN faf_fees_and_fines faf    ON faf.key_value = v.receipt
      LEFT JOIN dl_common.human_sexes sex ON sex.key_value = p.sex
     WHERE v.key_value = p_key_value;

    logger.append_param(l_params, 'x_key_value', x_key_value);
    logger.append_param(l_params, 'x_person', x_person);
    logger.append_param(l_params, 'x_visa_expiry_date', x_visa_expiry_date);
    logger.append_param(l_params, 'x_requesting_date', x_requesting_date);
    logger.append_param(l_params, 'x_from_county', x_from_county);
    logger.append_param(l_params, 'x_transport_type', x_transport_type);
    logger.append_param(l_params, 'x_flight_no', x_flight_no);
    logger.append_param(l_params, 'x_approve_status', x_approve_status);
    logger.append_param(l_params, 'x_last_name', x_last_name);
    logger.append_param(l_params, 'x_first_name', x_first_name);
    logger.append_param(l_params, 'x_middle_name', x_middle_name);
    logger.append_param(l_params, 'x_date_of_birth', x_date_of_birth);
    logger.append_param(l_params, 'x_gender', x_gender);
    logger.append_param(l_params, 'x_address_thailand', x_address_thailand);
    logger.append_param(l_params, 'x_district', x_district);
    logger.append_param(l_params, 'x_subdistrict', x_subdistrict);
    logger.append_param(l_params, 'x_province', x_province);
    logger.append_param(l_params, 'x_nationality', x_nationality);
    logger.append_param(l_params, 'x_profession', x_profession);
    logger.append_param(l_params, 'x_permanent_address', x_permanent_address);
    logger.append_param(l_params, 'x_contact_person', x_contact_person);
    logger.append_param(l_params, 'x_salutation', x_salutation);
    logger.append_param(l_params, 'x_relation', x_relation);
    logger.append_param(l_params, 'x_tm6_no', x_tm6_no);
    --logger.append_param(l_params, 'x_person_photo', x_person_photo);
    logger.append_param(l_params, 'x_passport_no', x_passport_no);
    logger.append_param(l_params, 'x_expiry_date', x_expiry_date);
    logger.append_param(l_params, 'x_issuing_country', x_issuing_country);
    logger.append_param(l_params, 'x_date_of_issue', x_date_of_issue);
    logger.append_param(l_params, 'x_travel_date', x_travel_date);
    logger.append_param(l_params, 'x_ins_officer', x_ins_officer);
    logger.append_param(l_params, 'x_receipt', x_receipt);
    logger.append_param(l_params, 'x_cancel_note', x_cancel_note);
    logger.append_param(l_params, 'x_release_note', x_release_note);
    logger.append_param(l_params, 'x_payment_status', x_payment_status);
    logger.append_param(l_params, 'x_receipt_no1', x_receipt_no1);
    logger.append_param(l_params, 'x_receipt_no2', x_receipt_no2);
    logger.append_param(l_params, 'x_status_fee_exception', x_status_fee_exception);
    logger.append_param(l_params, 'x_status_no_receipt', x_status_no_receipt);
    logger.append_param(l_params, 'x_status_print_form', x_status_print_form);
    logger.append_param(l_params, 'x_visa_number', x_visa_number);
    logger.append_param(l_params, 'x_ins_terminal', x_ins_terminal);
    logger.append_param(l_params, 'x_passport_doctype', x_passport_doctype);

    save_tmp_face(dl_common.pkg_util.encode_base64(l_image));

    logger.log('SEARCH VISA: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('SEARCH VISA: UNHANDLED EXCEPTION', l_scope, null, l_params);
      RAISE;
  END search;

  /**
  * Returns SQL-Statement for searching VOA data
  *
  * p_passport_no
  * p_issuing_date
  * p_visa_number
  * p_first_name
  * p_middle_name
  * p_last_name
  * p_nationality
  * p_date_of_birth
  * p_sex
  * p_approved_status
  * p_arrival_border
  */
  FUNCTION get_search_query (p_passport_no      IN VARCHAR2
                            ,p_issuing_date     IN DATE
                            ,p_visa_number      IN VARCHAR2
                            ,p_first_name       IN VARCHAR2
                            ,p_middle_name      IN VARCHAR2
                            ,p_last_name        IN VARCHAR2
                            ,p_nationality      IN VARCHAR2
                            ,p_date_of_birth    IN DATE
                            ,p_sex              IN VARCHAR2
                            ,p_approved_status  IN VARCHAR2
                            ,p_arrival_border   IN VARCHAR2
                            ,p_visa_type        IN NUMBER)
  RETURN VARCHAR2
  IS

    l_statement VARCHAR2(32000 CHAR);

  BEGIN

    l_statement := 'SELECT visa_key_value
                          ,passport_no
                          ,visa_number
                          ,person_name
                          ,sex
                          ,date_of_birth
                          ,nationality
                          ,borderpost
                          ,status
                          ,CASE status WHEN ''CANCELED'' THEN ''apex_disabled'' ELSE NULL END AS link_class
                          ,dl_bordercontrol.voa_apex_pkg.get_voa_print_link(visa_key_value) AS print_url
                      FROM dl_bordercontrol.v_visas
                    WHERE 1 = 1
                      AND  visa_type in (SELECT key_value FROM dl_common.visa_types WHERE icao_dc_list = ''VISA_ON_ARRIVAL'')';

    -- search for the visas type
  /*  IF p_visa_type IS NOT NULL
    THEN
      l_statement := l_statement || ' AND visa_type = ' || p_visa_type;
    END IF;*/

    -- search for passport_no
    IF p_passport_no IS NOT NULL
    THEN
      l_statement := l_statement || ' AND UPPER(passport_no) LIKE ''%' || UPPER(p_passport_no) || '%''';
    END IF;

    -- search for issuing_date
    IF p_issuing_date IS NOT NULL
    THEN
      l_statement := l_statement || ' AND TRUNC(issuing_date) = ''' || TO_DATE(p_issuing_date, 'DD/MM/YYYY') || '''';
    END IF;

    -- search for visa_number
    IF p_visa_number IS NOT NULL
    THEN
      l_statement := l_statement || ' AND UPPER(visa_number) LIKE ''%' || UPPER(p_visa_number) || '%''';
    END IF;

    -- search for first_name
    IF p_first_name IS NOT NULL
    THEN
      l_statement := l_statement || ' AND UPPER(first_name) LIKE ''%' || UPPER(p_first_name) || '%''';
    END IF;

    -- search for middle_name
    IF p_middle_name IS NOT NULL
    THEN
      l_statement := l_statement || ' AND UPPER(middle_name) LIKE ''%' || UPPER(p_middle_name) || '%''';
    END IF;

    -- search for last_name
    IF p_last_name IS NOT NULL
    THEN
      l_statement := l_statement || ' AND UPPER(last_name) LIKE ''%' || UPPER(p_last_name) || '%''';
    END IF;

    -- search for nationality
    IF p_nationality IS NOT NULL
    THEN
      l_statement := l_statement || ' AND nationality = ''' || p_nationality || '''';
    END IF;

    -- search for date_of_birth
    IF p_date_of_birth IS NOT NULL
    THEN
      l_statement := l_statement || ' AND date_of_birth = ''' || p_date_of_birth || '''';
    END IF;

    -- search for sex
    IF p_sex IS NOT NULL
    THEN
      l_statement := l_statement || ' AND sex = ''' || p_sex || '''';
    END IF;

    -- search for (approved) status
    IF p_approved_status IS NOT NULL
    THEN
      l_statement := l_statement || ' AND status = ''' || p_approved_status || '''';
    END IF;

    -- search for arrival_border
    IF p_arrival_border IS NOT NULL
    THEN
      l_statement := l_statement || ' AND borderpost  = ''' || p_arrival_border || '''';
    END IF;

    -- add order by clause
    l_statement := 'SELECT v.*
                          ,ROWNUM AS rwnum
                      FROM (' || l_statement ||') v';

    RETURN l_statement;

  END get_search_query;

  /**
   * Cancels this visa
   *
   * @p_key_value Primary key of Visa
   * @p_note      Cancellation note of Visa
   */
  PROCEDURE cancel_visa (p_key_value IN VARCHAR2
                        ,p_note      IN VARCHAR2)
  IS
  BEGIN

    UPDATE dl_bordercontrol.visas
       SET status = 'CANCELED'
          ,cancel_note = p_note
     WHERE key_value = p_key_value;

  END cancel_visa;

 /**
  * Saves the receipt number (pk of table dl_bordercontrol.faf_fees_and_fines)
  * into the table dl_bordercontrol.visas
  *
  * @param p_key_value Primary key of Visa (dl_bordercontrol.visas)
  * @param p_receipt   Primary key of receipt (dl_bordercontrol.faf_fees_and_fines)
  */
  PROCEDURE set_receipt (p_key_value  IN dl_bordercontrol.visas.key_value%TYPE
                        ,p_receipt    IN dl_bordercontrol.visas.receipt%TYPE)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'set_receipt';
    l_params logger.tab_param;

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.append_param(l_params, 'p_receipt', p_receipt);

    logger.log('SAVE RECEIPT INFORMATION TO VISA: start', l_scope, null, l_params);

    UPDATE dl_bordercontrol.visas
       SET receipt = p_receipt
     WHERE key_value = p_key_value;

    logger.log('SAVE RECEIPT INFORMATION TO VISA: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      -- log error here
      logger.log_error('UNHANDLED EXCEPTION', l_scope, null, l_params);
      RAISE;
  END set_receipt;

  /**
   * Generates the VOA file / document on the same page
   * !! Stops the APEX rendering engine !!
   *
   * @param p_key_value Primary key of table DL_BORDERCONTROL.VISAS
   */
  PROCEDURE print_voa_document (p_key_value IN visas.key_value%TYPE)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'print_voa_document';
    l_params logger.tab_param;
    --
    l_jasperreport_server   VARCHAR2(500 CHAR) := pkg_apex_util.get_server_url() || pkg_common.get_parameter(c_report_link_param);

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.log('PRINT VOA DOCUMENT: start', l_scope, null, l_params);

    jasper_reporting.xlib_jasperreports.set_report_url(l_jasperreport_server);
    jasper_reporting.xlib_jasperreports.show_report (p_rep_name           => c_voa_report
                                                    ,p_rep_format         => c_report_format
                                                    ,p_data_source        => c_report_datasource
                                                    ,p_rep_locale         => c_report_locale
                                                    ,p_rep_encoding       => c_report_encoding
                                                    ,p_additional_params  => 'VISA_KEY_VALUE=' || p_key_value);
    apex_application.stop_apex_engine;

    logger.log('PRINT VOA DOCUMENT: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('PRINT VOA DOCUMENT: unhandled exception', l_scope, null, l_params);
      RAISE;
  END print_voa_document;

  /**
   * Generates the VOA file / document on the same page
   *
   * @param p_key_value Primary key of table DL_BORDERCONTROL.VISAS
   * @return BLOB VOA file (PDF-format)
   */
  FUNCTION print_voa_document (p_key_value IN visas.key_value%TYPE)
  RETURN BLOB
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'print_voa_document';
    l_params logger.tab_param;
    --
    l_jasperreport_server   VARCHAR2(500 CHAR) := pkg_apex_util.get_server_url() || pkg_common.get_parameter(c_report_link_param);
    l_result_blob           BLOB;
    l_result_mime           VARCHAR2(50 CHAR);

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.log('PRINT VOA DOCUMENT: start', l_scope, null, l_params);

    jasper_reporting.xlib_jasperreports.set_report_url(l_jasperreport_server);
    jasper_reporting.xlib_jasperreports.get_report (p_rep_name           => c_voa_report
                                                   ,p_rep_format         => c_report_format
                                                   ,p_data_source        => c_report_datasource
                                                   ,p_rep_locale         => c_report_locale
                                                   ,p_rep_encoding       => c_report_encoding
                                                   ,p_additional_params  => 'VISA_KEY_VALUE=' || p_key_value
                                                   ,p_out_blob           => l_result_blob
                                                   ,p_out_mime_type      => l_result_mime);

    logger.append_param(l_params, 'l_result_mime', l_result_mime);
    logger.log('PRINT VOA DOCUMENT: done', l_scope, null, l_params);

    RETURN l_result_blob;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('PRINT VOA DOCUMENT: unhandled exception', l_scope, null, l_params);
      RAISE;
  END print_voa_document;

  /**
   * Returns the URL to open the popup with the VOA print document
   * @param p_key_value Primary key of dl_bordercontrol.visas table
   */
  FUNCTION get_voa_print_link (p_key_value   IN visas.key_value%TYPE)
  RETURN VARCHAR2
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'get_voa_print_link';
    l_params logger.tab_param;
    --
    l_url             VARCHAR2(255 CHAR);
    l_set_normal_mode BOOLEAN := FALSE;

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.log('GET VOA PRINT URL: start', l_scope, null, l_params);

    -- the page modes have to be set in cause of a bug that adds close dialog
    -- javascript code to the prepared url
    -- setting the page mode to NORMAL doesn't add the additional javascript code
    IF apex_application.g_page_mode = 'MODAL'
    THEN
      l_set_normal_mode := TRUE;
      apex_application.g_page_mode := 'NORMAL';
    END IF;

    l_url := apex_util.prepare_url(p_url => 'f?p='
                                    || c_print_application || ':'
                                    || c_print_page || ':'
                                    || v('APP_SESSION')
                                    || '::::'
                                    || 'P' || c_print_page || '_KEY_VALUE:'
                                    || p_key_value
                                  ,p_checksum_type => 'SESSION');

    IF l_set_normal_mode
    THEN
      apex_application.g_page_mode := 'MODAL';
    END IF;

    logger.log('GET VOA PRINT URL: done', l_scope, null, l_params);
    RETURN l_url;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('GET VOA PRINT URL: unhandled error', l_scope, null, l_params);
  END get_voa_print_link;

  /**
   * Sets the different Interactive Report filters to define
   * the result of the report
   *
   * @param p_app_id
   * @param p_page_id
   * @param p_requesting_date applicant_date of VISAS table
   * @param p_nationality
   * @param p_visa_number
   * @param p_sex
   * @param p_officer
   * @param p_borderpost_id
   * @param p_terminal_id
   * @param p_transport_type
   * @param p_transport_number
   * @param p_report_type
   * @param p_receipt_booking_number
   * @param p_receipt_number
   * @param p_created_by
   */
  PROCEDURE get_report_search_query (p_app_id                  IN NUMBER
                                    ,p_page_id                 IN NUMBER
                                    ,p_requesting_date         IN DATE
                                    ,p_nationality             IN VARCHAR2 DEFAULT NULL
                                    ,p_visa_number             IN VARCHAR2 DEFAULT NULL
                                    ,p_sex                     IN VARCHAR2 DEFAULT NULL
                                    ,p_officer                 IN VARCHAR2
                                    ,p_borderpost_id           IN VARCHAR2
                                    ,p_terminal_id             IN VARCHAR2
                                    ,p_transport_type          IN VARCHAR2 DEFAULT NULL
                                    ,p_transport_number        IN VARCHAR2 DEFAULT NULL
                                    ,p_report_type             IN VARCHAR2
                                    ,p_receipt_booking_number  IN VARCHAR2 DEFAULT NULL
                                    ,p_receipt_number          IN VARCHAR2 DEFAULT NULL
                                    ,p_created_by              IN VARCHAR2 DEFAULT NULL)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'get_report_search_query';
    l_params logger.tab_param;
    --
    l_report_region_id NUMBER;
  BEGIN

    logger.append_param(l_params, 'p_requesting_date', p_requesting_date);
    logger.append_param(l_params, 'p_nationality', p_nationality);
    logger.append_param(l_params, 'p_visa_number', p_visa_number);
    logger.append_param(l_params, 'p_sex', p_sex);
    logger.append_param(l_params, 'p_officer', p_officer);
    logger.append_param(l_params, 'p_borderpost_id', p_borderpost_id);
    logger.append_param(l_params, 'p_terminal_id', p_terminal_id);
    logger.append_param(l_params, 'p_transport_type', p_transport_type);
    logger.append_param(l_params, 'p_transport_number', p_transport_number);
    logger.append_param(l_params, 'p_report_type', p_report_type);
    logger.append_param(l_params, 'p_receipt_booking_number', p_receipt_booking_number);
    logger.append_param(l_params, 'p_receipt_number', p_receipt_number);
    logger.append_param(l_params, 'p_created_by', p_created_by);

    logger.log('GET REPORT SEARCH QUERY: start', l_scope, null, l_params);

    -- select report_id
    SELECT region_id
      INTO l_report_region_id
      FROM apex_application_page_ir
     WHERE application_id = p_app_id
       AND page_id        = p_page_id;

    -- reset report
    apex_ir.clear_report(
        p_page_id   => p_page_id
      , p_region_id => l_report_region_id
      , p_report_id => NULL
    );

    -- requesting_date
    IF p_requesting_date IS NOT NULL
    THEN
      apex_ir.add_filter(
          p_page_id       => p_page_id
        , p_region_id     => l_report_region_id
        , p_report_column => 'REQUESTED_DATE'
        , p_filter_value  => p_requesting_date
        , p_operator_abbr => 'EQ'
        , p_report_id     => NULL
      );
    END IF;

    -- nationality
    IF p_nationality IS NOT NULL
    THEN
      apex_ir.add_filter(
          p_page_id       => p_page_id
        , p_region_id     => l_report_region_id
        , p_report_column => 'FILTER_NATIONALITY'
        , p_filter_value  => p_nationality
        , p_operator_abbr => 'EQ'
        , p_report_id     => NULL
      );
    END IF;

    -- visa number
    IF p_visa_number IS NOT NULL
    THEN
      apex_ir.add_filter(
          p_page_id       => p_page_id
        , p_region_id     => l_report_region_id
        , p_report_column => 'VISA_NUMBER'
        , p_filter_value  => p_visa_number
        , p_operator_abbr => 'C'
        , p_report_id     => NULL
      );
    END IF;

    -- sex
    IF p_sex IS NOT NULL
    THEN
      apex_ir.add_filter(
          p_page_id       => p_page_id
        , p_region_id     => l_report_region_id
        , p_report_column => 'FILTER_SEX'
        , p_filter_value  => p_sex
        , p_operator_abbr => 'EQ'
        , p_report_id     => NULL
      );
    END IF;

    -- officer
    IF p_officer IS NOT NULL
    THEN
      apex_ir.add_filter(
          p_page_id       => p_page_id
        , p_region_id     => l_report_region_id
        , p_report_column => 'OFFICER'
        , p_filter_value  => p_officer
        , p_operator_abbr => 'C'
        , p_report_id     => NULL
      );
    END IF;

    -- borderpost
    IF p_borderpost_id IS NOT NULL
    THEN
      apex_ir.add_filter(
          p_page_id       => p_page_id
        , p_region_id     => l_report_region_id
        , p_report_column => 'FILTER_BORDERPOST'
        , p_filter_value  => p_borderpost_id
        , p_operator_abbr => 'EQ'
        , p_report_id     => NULL
      );
    END IF;

    -- workstation
    IF p_terminal_id IS NOT NULL
    THEN
      apex_ir.add_filter(
          p_page_id       => p_page_id
        , p_region_id     => l_report_region_id
        , p_report_column => 'FILTER_WORKSTATION'
        , p_filter_value  => p_terminal_id
        , p_operator_abbr => 'EQ'
        , p_report_id     => NULL
      );
    END IF;

    -- vehicle_type
    IF p_transport_type IS NOT NULL
    THEN
      apex_ir.add_filter(
          p_page_id       => p_page_id
        , p_region_id     => l_report_region_id
        , p_report_column => 'FILTER_TRANS_VEHICLE'
        , p_filter_value  => p_transport_type
        , p_operator_abbr => 'EQ'
        , p_report_id     => NULL
      );
    END IF;

    -- flight_no
    IF p_transport_number IS NOT NULL
    THEN
      apex_ir.add_filter(
          p_page_id       => p_page_id
        , p_region_id     => l_report_region_id
        , p_report_column => 'TRANS_NUMBER'
        , p_filter_value  => p_transport_number
        , p_operator_abbr => 'C'
        , p_report_id     => NULL
      );
    END IF;

    -- receipt_booking_number
    IF p_receipt_booking_number IS NOT NULL
    THEN
      apex_ir.add_filter(
          p_page_id       => p_page_id
        , p_region_id     => l_report_region_id
        , p_report_column => 'RECEIPT_BOOKING_NUMBER'
        , p_filter_value  => p_receipt_booking_number
        , p_operator_abbr => 'C'
        , p_report_id     => NULL
      );
    END IF;

    -- receipt_number
    IF p_receipt_number IS NOT NULL
    THEN
      apex_ir.add_filter(
          p_page_id       => p_page_id
        , p_region_id     => l_report_region_id
        , p_report_column => 'RECEIPT_NUMBER'
        , p_filter_value  => p_receipt_number
        , p_operator_abbr => 'C'
        , p_report_id     => NULL
      );
    END IF;

    -- report_type
    IF p_report_type IS NOT NULL
    THEN
      apex_ir.add_filter(
          p_page_id       => p_page_id
        , p_region_id     => l_report_region_id
        , p_report_column => 'REPORT_TYPE'
        , p_filter_value  => p_report_type
        , p_operator_abbr => 'C'
        , p_report_id     => NULL
      );
    END IF;

    -- created_by
    IF p_created_by IS NOT NULL
    THEN
      apex_ir.add_filter(
          p_page_id       => p_page_id
        , p_region_id     => l_report_region_id
        , p_report_column => 'CREATED_BY'
        , p_filter_value  => p_created_by
        , p_operator_abbr => 'C'
        , p_report_id     => NULL
      );
    END IF;

    logger.log('GET REPORT SEARCH QUERY: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('GET REPORT SEARCH QUERY: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END get_report_search_query;

  /**
   * Saves the face/image of a customer into a collection to make sure
   * it can be saved successfully
   * @param p_image Base64 Code of the image
   */
  PROCEDURE save_tmp_face (p_image IN CLOB)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'SAVE TMP FACE/IMAGE';
    l_params logger.tab_param;
    --

  BEGIN

    logger.append_param(l_params, 'dbms_lob.getlength(p_image)', dbms_lob.getlength(p_image));
    logger.log('SAVE TMP FACE/IMAGE: start', l_scope, null, l_params);

    IF NOT apex_collection.collection_exists(p_collection_name => c_image_col_name)
    THEN

      apex_collection.create_collection(
          p_collection_name => c_image_col_name
      );

      apex_collection.add_member(
          p_collection_name => c_image_col_name
      );
    END IF;

    apex_collection.update_member(
        p_collection_name => c_image_col_name
      , p_seq     => 1
      , p_clob001 => p_image
    );

    logger.log('SAVE TMP FACE/IMAGE: start', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('SAVE TMP FACE/IMAGE: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END save_tmp_face;

  /**
   * Deletes the face/image from the collection
   */
  PROCEDURE cleanup_tmp_face
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'cleanup_tmp_face';
    l_params logger.tab_param;
    --

  BEGIN

    logger.log('CLEAN UP TMP FACE/IMAGE: start', l_scope, null, l_params);

    IF apex_collection.collection_exists(p_collection_name => c_image_col_name)
    THEN

      apex_collection.update_member(
          p_collection_name => c_image_col_name
        , p_seq => 1
        , p_clob001 => NULL
      );

    END IF;

    logger.log('CLEAN UP TMP FACE/IMAGE: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('CLEAN UP TMP FACE/IMAGE: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END cleanup_tmp_face;

  /**
   * Returns the CLOB of the face that's saved into the collection
   * @return CLOB Base64 String of the face/image
   */
  FUNCTION get_tmp_face
  RETURN CLOB
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'get_tmp_face';
    l_params logger.tab_param;
    --
    l_result  CLOB;

  BEGIN

    logger.log('GET TMP FACE/IMAGE: start', l_scope, null, l_params);

    SELECT clob001
      INTO l_result
      FROM apex_collections
     WHERE collection_name = c_image_col_name
       AND seq_id = 1;

    logger.append_param(l_params, 'dbms_lob.getlength(l_result)', dbms_lob.getlength(l_result));
    logger.log('GET TMP FACE/IMAGE: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_warning('GET TMP FACE/IMAGE: No image found', l_scope, null, l_params);
      RETURN NULL;
  END get_tmp_face;

END;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."VOA_APEX_PKG" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."VOA_APEX_PKG" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."VOA_APEX_PKG" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."VOA_APEX_PKG" TO "BIOSAADM";
