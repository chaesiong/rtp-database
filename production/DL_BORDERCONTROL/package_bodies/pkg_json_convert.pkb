CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_JSON_CONVERT" as
/*******************************************************************************
 * This package provides several functions connected to the data to JSON export
 *
 * Author    Date        Description
 * --------  ----------  -------------------------------------------------------*
 * CHageman  31.10.2018  Added
 * MStahl    06.11.2018  Changed get_string to get_number where needed
 *******************************************************************************/

  c_scope_prefix        CONSTANT VARCHAR2(31) := lower($$plsql_unit) || '.';
  --
  c_input_date_format CONSTANT VARCHAR2(32 CHAR) := 'DD.MM.YYYY HH24:MI:SS';

  -- --------------------------------------------------------------------------------

  FUNCTION convert_base64_clob_to_blob (p_clob IN CLOB)
  RETURN BLOB
  IS

    l_result BLOB;

  BEGIN

    l_result := apex_web_service.clobbase642blob(p_clob);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      RETURN NULL;
  END convert_base64_clob_to_blob;

  -- --------------------------------------------------------------------------------

  FUNCTION extract_collective_passports_from_json (p_collective_passport_json IN CLOB)
  RETURN t_fellow_passengers_tab_typ
  IS

    l_scope  logger_logs.scope%type := c_scope_prefix || 'extract_collective_passports_from_json';
    l_params logger.tab_param;
    --
    --
    l_collective_passport_obj       PLJSON;
    l_collective_passports_obj      JSON_LIST;
    l_image_clob        clob;
    -- 
    l_result                        t_fellow_passengers_tab_typ;
    l_result_fellow_passenger       t_fellow_passengers_typ;

  BEGIN

    logger.append_param(l_params, 'dbms_lob.substr(p_collective_passport_json, 4000, 1)', dbms_lob.substr(p_collective_passport_json, 4000, 1));
    logger.log('extract_collective_passports_from_json: start', l_scope, null, l_params);

    l_collective_passports_obj  := JSON_LIST(p_collective_passport_json);

    -- collective_passports
    IF l_collective_passports_obj IS NOT NULL
    THEN
      FOR i IN 1 .. l_collective_passports_obj.count()
      LOOP

        l_collective_passport_obj := PLJSON(l_collective_passports_obj.get(i));        

        l_result_fellow_passenger := NULL;
        l_result_fellow_passenger.key_value       := l_collective_passport_obj.get('id').get_string();
        l_result_fellow_passenger.person          := l_collective_passport_obj.get('personId').get_string();
        l_result_fellow_passenger.relation        := l_collective_passport_obj.get('relationId').get_string();
        l_result_fellow_passenger.nationality     := l_collective_passport_obj.get('nationalityId').get_string();
        l_result_fellow_passenger.receipt         := l_collective_passport_obj.get('receiptId').get_string();
        l_result_fellow_passenger.tm6_no          := l_collective_passport_obj.get('tm6No').get_string();
        l_result_fellow_passenger.first_name      := l_collective_passport_obj.get('firstName').get_string();
        l_result_fellow_passenger.middle_name     := l_collective_passport_obj.get('middleName').get_string();
        l_result_fellow_passenger.last_name       := l_collective_passport_obj.get('lastName').get_string();
        l_result_fellow_passenger.sex             := l_collective_passport_obj.get('sexId').get_string();
        --l_result_fellow_passenger.date_of_birth   := l_collective_passport_obj.get('dateOfBirth').get_string();
        l_result_fellow_passenger.date_of_birth   := TO_DATE(l_collective_passport_obj.get('dateOfBirth').get_string(), c_input_date_format);
        l_result_fellow_passenger.place_of_birth  := l_collective_passport_obj.get('placeOfBirth').get_string();
        l_result_fellow_passenger.reason          := l_collective_passport_obj.get('reason').get_string();
        l_result_fellow_passenger.approval_status := l_collective_passport_obj.get('approvalStatus').get_string();

        --l_collective_passport_obj.get_blob('image' , l_result_fellow_passenger.image);

        dbms_lob.createtemporary(l_image_clob, true);
        l_collective_passport_obj.get('image').get_string(l_image_clob);

        l_result_fellow_passenger.image           := convert_base64_clob_to_blob(l_image_clob);
        l_result_fellow_passenger.dml_at          := TO_DATE(l_collective_passport_obj.get('lastModifiedAt').get_string(), c_input_date_format);
        l_result_fellow_passenger.dml_by          := l_collective_passport_obj.get('lastModifiedBy').get_string();
        l_result_fellow_passenger.dml_type        := l_collective_passport_obj.get('lastModifiedAction').get_string();
        l_result_fellow_passenger.ins_at          := TO_DATE(l_collective_passport_obj.get('createdAt').get_string(), c_input_date_format);
        l_result_fellow_passenger.ins_by          := l_collective_passport_obj.get('createdBy').get_string();
        --l_result_fellow_passenger.mvmntid         := NULL;

        l_result(l_result.COUNT) := l_result_fellow_passenger;
      END LOOP;
    ELSE
      l_result(l_result.COUNT) := l_result_fellow_passenger;
    END IF;

    logger.log('extract_collective_passports_from_json: end', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('extract_collective_passports_from_json: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END extract_collective_passports_from_json;

  -- --------------------------------------------------------------------------------

  FUNCTION extract_receipt_from_json (p_receipt_json IN CLOB)
  RETURN t_receipts_typ
  IS

    l_scope  logger_logs.scope%type := c_scope_prefix || 'extract_receipt_from_json';
    l_params logger.tab_param;

    l_receipt_obj   JSON;
    --
    l_result        t_receipts_typ;

  BEGIN

    logger.append_param(l_params, 'dbms_lob.substr(p_receipt_json, 4000, 1)', dbms_lob.substr(p_receipt_json, 4000, 1));
    logger.log('extract_receipt_from_json: start', l_scope, null, l_params);

    l_receipt_obj := JSON(p_receipt_json);

    SELECT key_value
          ,TO_DATE(ins_at, c_input_date_format)
          ,ins_by
          ,TO_DATE(dml_at, c_input_date_format)
          ,dml_by
          ,dml_type
          ,reference_entity
          ,reference_number
          ,booking_number
          ,receipt_number
          ,TO_DATE(issuing_date, c_input_date_format)
          ,total_costs
          ,print_flag
          ,borderdocument
          ,docno
          ,person
          ,entry_form
          ,first_name
          ,middle_name
          ,last_name
          ,thai_last_name
          ,thai_first_name
          ,sex
          ,TO_DATE(date_of_birth, c_input_date_format)
          ,nationality
          ,trans_vehicles
          ,trans_number
          ,TO_DATE(arrival_date, c_input_date_format)
          ,visa_type
          ,TO_DATE(visa_expiry_date, c_input_date_format)
          ,TO_DATE(departure_date, c_input_date_format)
          ,status
          ,status_note
          ,owner
          ,permit
          ,TO_DATE(permit_date, c_input_date_format)
          ,generation_status
          ,salutation
          ,fee_or_fine
          ,ins_terminal
          ,ins_borderpost
          ,charge_number
      INTO l_result.key_value
          ,l_result.ins_at
          ,l_result.ins_by
          ,l_result.dml_at
          ,l_result.dml_by
          ,l_result.dml_type
          ,l_result.reference_entity
          ,l_result.reference_number
          ,l_result.booking_number
          ,l_result.receipt_number
          ,l_result.issuing_date
          ,l_result.total_costs
          ,l_result.print_flag
          ,l_result.borderdocument
          ,l_result.docno
          ,l_result.person
          ,l_result.entry_form
          ,l_result.first_name
          ,l_result.middle_name
          ,l_result.last_name
          ,l_result.thai_last_name
          ,l_result.thai_first_name
          ,l_result.sex
          ,l_result.date_of_birth
          ,l_result.nationality
          ,l_result.trans_vehicles
          ,l_result.trans_number
          ,l_result.arrival_date
          ,l_result.visa_type
          ,l_result.visa_expiry_date
          ,l_result.departure_date
          ,l_result.status
          ,l_result.status_note
          ,l_result.owner
          ,l_result.permit
          ,l_result.permit_date
          ,l_result.generation_status
          ,l_result.salutation
          ,l_result.fee_or_fine
          ,l_result.ins_terminal
          ,l_result.ins_borderpost
          ,l_result.charge_number
      FROM JSON_TABLE(p_receipt_json, '$'
           COLUMNS (key_value           VARCHAR2(500 CHAR) PATH '$.id'
                   ,ins_at              VARCHAR2(500 CHAR) PATH '$.createdAt'
                   ,ins_by              VARCHAR2(500 CHAR) PATH '$.createdBy'
                   ,dml_at              VARCHAR2(500 CHAR) PATH '$.lastModifiedAt'
                   ,dml_by              VARCHAR2(500 CHAR) PATH '$.lastModifiedBy'
                   ,dml_type            VARCHAR2(500 CHAR) PATH '$.lastModifiedType'
                   ,reference_entity    VARCHAR2(500 CHAR) PATH '$.referenceEntity'
                   ,reference_number    VARCHAR2(500 CHAR) PATH '$.referenceNumber'
                   ,booking_number      VARCHAR2(500 CHAR) PATH '$.bookingNumber'
                   ,receipt_number      VARCHAR2(500 CHAR) PATH '$.receiptNumber'
                   ,issuing_date        VARCHAR2(500 CHAR) PATH '$.issuingDate'
                   ,total_costs         VARCHAR2(500 CHAR) PATH '$.totalCosts'
                   ,print_flag          VARCHAR2(500 CHAR) PATH '$.printFlag'
                   ,borderdocument      VARCHAR2(500 CHAR) PATH '$.borderdocumentId'
                   ,docno               VARCHAR2(500 CHAR) PATH '$.documentNumber'
                   ,person              VARCHAR2(500 CHAR) PATH '$.personId'
                   ,entry_form          VARCHAR2(500 CHAR) PATH '$.entryFormId'
                   ,first_name          VARCHAR2(500 CHAR) PATH '$.firstName'
                   ,middle_name         VARCHAR2(500 CHAR) PATH '$.middleName'
                   ,last_name           VARCHAR2(500 CHAR) PATH '$.lastName'
                   ,thai_last_name      VARCHAR2(500 CHAR) PATH '$.thaiFirstName'
                   ,thai_first_name     VARCHAR2(500 CHAR) PATH '$.thaiLastName'
                   ,sex                 VARCHAR2(500 CHAR) PATH '$.genderId'
                   ,date_of_birth       VARCHAR2(500 CHAR) PATH '$.dateOfBirth'
                   ,nationality         VARCHAR2(500 CHAR) PATH '$.nationalityId'
                   ,trans_vehicles      VARCHAR2(500 CHAR) PATH '$.transVehicleId'
                   ,trans_number        VARCHAR2(500 CHAR) PATH '$.transNumber'
                   ,arrival_date        VARCHAR2(500 CHAR) PATH '$.arrivalDate'
                   ,visa_type           VARCHAR2(500 CHAR) PATH '$.visaTypeId'
                   ,visa_expiry_date    VARCHAR2(500 CHAR) PATH '$.visaExpiryDate'
                   ,departure_date      VARCHAR2(500 CHAR) PATH '$.departureDate'
                   ,status              VARCHAR2(500 CHAR) PATH '$.status'
                   ,status_note         VARCHAR2(500 CHAR) PATH '$.statusNote'
                   ,owner               VARCHAR2(500 CHAR) PATH '$.ownerId'
                   ,permit              VARCHAR2(500 CHAR) PATH '$.permitId'
                   ,permit_date         VARCHAR2(500 CHAR) PATH '$.permitDate'
                   ,generation_status   VARCHAR2(500 CHAR) PATH '$.generationStatus'
                   ,salutation          VARCHAR2(500 CHAR) PATH '$.salutationId'
                   ,fee_or_fine         VARCHAR2(500 CHAR) PATH '$.feeOrFine'
                   ,ins_terminal        VARCHAR2(500 CHAR) PATH '$.createdByTerminalId'
                   ,ins_borderpost      VARCHAR2(500 CHAR) PATH '$.createdByBorderpostId'
                   ,charge_number       VARCHAR2(500 CHAR) PATH '$.chargeNumber')) jt;

    --l_result.notice             => NULL;
    --l_result.row_flag_mask      => NULL;

    RETURN l_result;

    EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('extract_receipt_from_json: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END extract_receipt_from_json;

  -- --------------------------------------------------------------------------------

  FUNCTION extract_person_from_json (p_person_json IN CLOB)
  RETURN t_persons_typ
  IS

    l_scope  logger_logs.scope%type := c_scope_prefix || 'extract_person_from_json';
    l_params logger.tab_param;

    l_person_obj      JSON;
    l_image_clob      clob;
    -- 
    l_result          t_persons_typ;

  BEGIN

    logger.append_param(l_params, 'dbms_lob.substr(p_person_json, 4000, 1)', dbms_lob.substr(p_person_json, 4000, 1));
    logger.log('extract_person_from_json: start', l_scope, null, l_params);

    l_person_obj  := JSON(p_person_json);

    SELECT key_value
          ,first_name
          ,middle_name
          ,last_name
          ,TO_DATE(date_of_birth, c_input_date_format)
          ,sex
          ,place_of_birth
          ,birth_country
          ,phone_number
          ,ta_street
          ,ta_adm_class_district
          ,ta_adm_class_subdistrict
          ,ta_adm_class_province
          ,nationality
          ,permanent_address
          ,contact_person
          ,salutation
          ,relation
          ,TO_DATE(dml_at, c_input_date_format)
          ,dml_by
          ,dml_type
          ,TO_DATE(ins_at, c_input_date_format)
          ,ins_by
      INTO l_result.key_value
          ,l_result.first_name
          ,l_result.middle_name
          ,l_result.last_name
          ,l_result.date_of_birth
          ,l_result.sex
          ,l_result.place_of_birth
          ,l_result.birth_country
          ,l_result.phone_number
          ,l_result.ta_street
          ,l_result.ta_adm_class_district
          ,l_result.ta_adm_class_subdistrict
          ,l_result.ta_adm_class_province
          ,l_result.nationality
          ,l_result.permanent_address
          ,l_result.contact_person
          ,l_result.salutation
          ,l_result.relation
          ,l_result.dml_at
          ,l_result.dml_by
          ,l_result.dml_type
          ,l_result.ins_at
          ,l_result.ins_by
      FROM JSON_TABLE(p_person_json, '$'
           COLUMNS (key_value                 VARCHAR2(500 CHAR) PATH '$.id'
                   ,first_name                VARCHAR2(500 CHAR) PATH '$.firstName'
                   ,middle_name               VARCHAR2(500 CHAR) PATH '$.middleName'
                   ,last_name                 VARCHAR2(500 CHAR) PATH '$.lastName'
                   ,date_of_birth             VARCHAR2(500 CHAR) PATH '$.dateOfBirth'
                   ,sex                       VARCHAR2(500 CHAR) PATH '$.genderId'
                   ,place_of_birth            VARCHAR2(500 CHAR) PATH '$.placeOfBirth'
                   ,birth_country             VARCHAR2(500 CHAR) PATH '$.birthCountryId'
                   ,phone_number              VARCHAR2(500 CHAR) PATH '$.phoneNumber'
                   ,ta_street                 VARCHAR2(500 CHAR) PATH '$.thaiAddressStreet'
                   ,ta_adm_class_district     VARCHAR2(500 CHAR) PATH '$.thaiAddressDistrictId'
                   ,ta_adm_class_subdistrict  VARCHAR2(500 CHAR) PATH '$.thaiAddressSubdistrictId'
                   ,ta_adm_class_province     VARCHAR2(500 CHAR) PATH '$.thaiAddressProvinceId'
                   ,nationality               VARCHAR2(500 CHAR) PATH '$.nationalityId'
                   ,permanent_address         VARCHAR2(500 CHAR) PATH '$.permanentAddress'
                   ,contact_person            VARCHAR2(500 CHAR) PATH '$.contactPerson'
                   ,salutation                VARCHAR2(500 CHAR) PATH '$.salutationId'
                   ,relation                  VARCHAR2(500 CHAR) PATH '$.relationId'
                   ,dml_at                    VARCHAR2(500 CHAR) PATH '$.lastModifiedAt'
                   ,dml_by                    VARCHAR2(500 CHAR) PATH '$.lastModifiedBy'
                   ,dml_type                  VARCHAR2(500 CHAR) PATH '$.lastModifiedAction'
                   ,ins_at                    VARCHAR2(500 CHAR) PATH '$.createdAt'
                   ,ins_by                    VARCHAR2(500 CHAR) PATH '$.createdBy')) jt;

    IF l_person_obj.exist('image')
    THEN
      dbms_lob.createtemporary(l_image_clob, true);
      l_person_obj.get('image').get_string(l_image_clob);

      l_result.image := convert_base64_clob_to_blob(l_image_clob);
    END IF;

    --l_result.addr_report_day          => l_visa_obj.get('');
    --l_result.addr_report_period       => l_visa_obj.get('');
    --l_result.addr_report_last_day     => l_visa_obj.get('');
    --l_result.ta_city                  => l_visa_obj.get('');
    --l_result.profession               => l_visa_obj.get('');
    --l_result.tm6_no                   => l_visa_obj.get('');

    RETURN l_result;


    EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('extract_person_from_json: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END extract_person_from_json;

  -- --------------------------------------------------------------------------------

  FUNCTION extract_visa_data_from_json (p_visa_json IN CLOB)
  RETURN t_visa_data_typ
  IS

    l_scope  logger_logs.scope%type := c_scope_prefix || 'extract_visa_data_from_json';
    l_params logger.tab_param;

    l_visa_obj        JSON;
    l_image_clob      clob;
    --
    l_result          t_visa_data_typ;
    l_result_visa     t_visas_typ;
    --
    l_clob            CLOB;

  BEGIN

    logger.append_param(l_params, 'dbms_lob.substr(p_visa_json, 4000, 1)', dbms_lob.substr(p_visa_json, 4000, 1));
    logger.log('extract_visa_data_from_json: start', l_scope, null, l_params);

    DBMS_LOB.CREATETEMPORARY (l_clob, false);

    l_visa_obj  := JSON(p_visa_json);

    SELECT key_value
          ,visa_type
          ,visa_number
          ,TO_DATE(issuing_date, c_input_date_format)
          ,issuing_place
          ,additional_info
          ,ins_terminal
          ,ins_borderpost
          ,borderdocument
          ,TO_DATE(expiry_date, c_input_date_format)
          ,TO_DATE(applicant_date, c_input_date_format)
          ,from_country
          ,trans_vehicle
          ,trans_number
          ,status
          ,release_note
          ,cancel_note
          ,payment_status
          ,permit_type
          ,TO_DATE(permit_expiry_date, c_input_date_format)
          ,status_fee_exception
          ,status_no_receipt
          ,status_print_form
          ,ins_at
          ,ins_by
          ,dml_at
          ,dml_by
          ,dml_type
      INTO l_result_visa.key_value
          ,l_result_visa.visa_type
          ,l_result_visa.visa_number
          ,l_result_visa.issuing_date
          ,l_result_visa.issuing_place
          ,l_result_visa.additional_info
          ,l_result_visa.ins_terminal
          ,l_result_visa.ins_borderpost
          ,l_result_visa.borderdocument
          ,l_result_visa.expiry_date
          ,l_result_visa.applicant_date
          ,l_result_visa.from_country
          ,l_result_visa.trans_vehicle
          ,l_result_visa.trans_number
          ,l_result_visa.status
          ,l_result_visa.release_note
          ,l_result_visa.cancel_note
          ,l_result_visa.payment_status
          ,l_result_visa.permit_type
          ,l_result_visa.permit_expiry_date
          ,l_result_visa.status_fee_exception
          ,l_result_visa.status_no_receipt
          ,l_result_visa.status_print_form
          ,l_result_visa.ins_at
          ,l_result_visa.ins_by
          ,l_result_visa.dml_at
          ,l_result_visa.dml_by
          ,l_result_visa.dml_type
      FROM JSON_TABLE(p_visa_json, '$'
           COLUMNS (key_value             VARCHAR2(500 CHAR) PATH '$.id'
                   ,visa_type             VARCHAR2(500 CHAR) PATH '$.visaTypeId'
                   ,visa_number           VARCHAR2(500 CHAR) PATH '$.visaNumber'
                   ,issuing_date          VARCHAR2(500 CHAR) PATH '$.issuingDate'
                   ,issuing_place         VARCHAR2(500 CHAR) PATH '$.issuingPlace'
                   ,additional_info       VARCHAR2(500 CHAR) PATH '$.additionalInfo'
                   ,ins_terminal          VARCHAR2(500 CHAR) PATH '$.terminalId'
                   ,ins_borderpost        VARCHAR2(500 CHAR) PATH '$.borderpostId'
                   ,borderdocument        VARCHAR2(500 CHAR) PATH '$.borderdocId'
                   ,expiry_date           VARCHAR2(500 CHAR) PATH '$.expiryDate'
                   ,applicant_date        VARCHAR2(500 CHAR) PATH '$.applicantDate'
                   ,from_country          VARCHAR2(500 CHAR) PATH '$.fromCountryId'
                   ,trans_vehicle         VARCHAR2(500 CHAR) PATH '$.transVehicleId'
                   ,trans_number          VARCHAR2(500 CHAR) PATH '$.transNumber'
                   ,status                VARCHAR2(500 CHAR) PATH '$.status'
                   ,release_note          VARCHAR2(500 CHAR) PATH '$.releaseNote'
                   ,cancel_note           VARCHAR2(500 CHAR) PATH '$.cancelNote'
                   ,payment_status        VARCHAR2(500 CHAR) PATH '$.paymentStatus'
                   ,permit_type           VARCHAR2(500 CHAR) PATH '$.permitTypeId'
                   ,permit_expiry_date    VARCHAR2(500 CHAR) PATH '$.permitExpiryDate'
                   ,status_fee_exception  VARCHAR2(500 CHAR) PATH '$.statusFeeException'
                   ,status_no_receipt     VARCHAR2(500 CHAR) PATH '$.statusNoReceipt'
                   ,status_print_form     VARCHAR2(500 CHAR) PATH '$.statusPrintForm'
                   ,ins_at                VARCHAR2(500 CHAR) PATH '$.createdAt'
                   ,ins_by                VARCHAR2(500 CHAR) PATH '$.createdBy'
                   ,dml_at                VARCHAR2(500 CHAR) PATH '$.changedAt'
                   ,dml_by                VARCHAR2(500 CHAR) PATH '$.changedBy'
                   ,dml_type              VARCHAR2(500 CHAR) PATH '$.changedType')) jt;

    IF l_visa_obj.exist('visaImage')
    THEN
      dbms_lob.createtemporary(l_image_clob, true);
      l_visa_obj.get('visaImage').get_string(l_image_clob);

      l_result_visa.visa_image            := convert_base64_clob_to_blob(l_image_clob);
    END IF;

    --l_result_visa.blacklist_record      := l_visa_obj.get('');
    --l_result_visa.ins_officer           := l_visa_obj.get('');

    -- person
    IF l_visa_obj.exist('person')
    THEN
      JSON(l_visa_obj.get('person')).to_clob(l_clob);
      l_result.person   := extract_person_from_json(l_clob);
    END IF;

    -- receipt
    IF l_visa_obj.exist('receipt')
    THEN
      JSON(l_visa_obj.get('receipt')).to_clob(l_clob);
      l_result.receipt  := extract_receipt_from_json(l_clob);
    END IF;

    l_result_visa.person                := l_result.person.key_value;
    l_result_visa.receipt               := l_result.receipt.key_value;

    l_result.visa     := l_result_visa;

    DBMS_LOB.FREETEMPORARY (l_clob); 

    RETURN l_result;

    EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('extract_visa_data_from_json: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END extract_visa_data_from_json;

  -- --------------------------------------------------------------------------------

  FUNCTION extract_entry_form_data_from_json (p_entry_form_json IN CLOB)
  RETURN t_entry_form_data_typ
  IS

    l_scope  logger_logs.scope%type := c_scope_prefix || 'extract_entry_form_data_from_json';
    l_params logger.tab_param;

    l_entry_form_obj    JSON;
    l_district_obj      JSON;
    l_subdistrict_obj   JSON;
    l_province_obj      JSON;
    --
    l_result            t_entry_form_data_typ;
    l_result_entry_form t_entry_form_typ;
    --
    l_clob              CLOB;
    l_image_clob        clob;

  BEGIN

    logger.append_param(l_params, 'dbms_lob.substr(p_entry_form_json, 4000, 1)', dbms_lob.substr(p_entry_form_json, 4000, 1));
    logger.log('extract_entry_form_data_from_json: start', l_scope, null, l_params);

    DBMS_LOB.CREATETEMPORARY (l_clob, false);

    l_entry_form_obj  := JSON(p_entry_form_json);

    IF l_entry_form_obj.exist('id')
    THEN

      l_district_obj    := JSON(l_entry_form_obj.get('district'));
      l_subdistrict_obj := JSON(l_entry_form_obj.get('subdistrict'));
      l_province_obj    := JSON(l_entry_form_obj.get('province'));

      l_result_entry_form.key_value       := l_entry_form_obj.get('id').get_string();
      l_result_entry_form.ins_at          := TO_DATE(l_entry_form_obj.get('createdAt').get_string(), c_input_date_format);
      l_result_entry_form.ins_by          := l_entry_form_obj.get('createdBy').get_string();
      l_result_entry_form.dml_at          := TO_DATE(l_entry_form_obj.get('lastModifiedAt').get_string(), c_input_date_format);
      l_result_entry_form.dml_by          := l_entry_form_obj.get('lastModifiedBy').get_string();
      l_result_entry_form.dml_type        := l_entry_form_obj.get('lastModifiedAction').get_string();
      l_result_entry_form.ins_terminal    := l_entry_form_obj.get('createdByTerminalId').get_string();
      l_result_entry_form.ins_borderpost  := l_entry_form_obj.get('createdByBorderpostId').get_string();

      dbms_lob.createtemporary(l_image_clob, true);
      l_entry_form_obj.get('formImage').get_string(l_image_clob);

      l_result_entry_form.form_image      := convert_base64_clob_to_blob(l_image_clob);
      l_result_entry_form.form_no         := l_entry_form_obj.get('formNo').get_string();
      l_result_entry_form.address         := l_entry_form_obj.get('address').get_string();
      l_result_entry_form.note            := l_entry_form_obj.get('note').get_string();

      -- province
      l_province_obj.to_clob(l_clob);
      l_result.province     := extract_province_from_json(l_clob);

      -- district
      l_district_obj.to_clob(l_clob);
      l_result.district     := extract_district_from_json(l_clob);

      -- subdistrict
      l_subdistrict_obj.to_clob(l_clob);
      l_result.subdistrict  := extract_subdistrict_from_json(l_clob);

      l_result_entry_form.province        := l_result.province.key_value;
      l_result_entry_form.district        := l_result.district.key_value;
      l_result_entry_form.subdistrict     := l_result.subdistrict.key_value;

      l_result.entry_form   := l_result_entry_form;

    END IF;

    DBMS_LOB.FREETEMPORARY (l_clob); 

    RETURN l_result;

    EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('extract_entry_form_data_from_json: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END extract_entry_form_data_from_json;

  -- --------------------------------------------------------------------------------

  FUNCTION extract_subdistrict_from_json (p_subdistrict_json IN CLOB)
  RETURN t_subdistrict_typ
  IS

    l_scope  logger_logs.scope%type := c_scope_prefix || 'extract_subdistrict_from_json';
    l_params logger.tab_param;

    l_subdistrict_obj   JSON;
    --
    l_result            t_subdistrict_typ;

  BEGIN

    logger.append_param(l_params, 'dbms_lob.substr(p_subdistrict_json, 4000, 1)', dbms_lob.substr(p_subdistrict_json, 4000, 1));
    logger.log('extract_subdistrict_from_json: start', l_scope, null, l_params);

    l_subdistrict_obj := JSON(p_subdistrict_json);

    --l_result.row_flag_mask      => NULL;

    SELECT key_value
          ,TO_DATE(dml_at, c_input_date_format)
          ,dml_by
          ,dml_type
          ,TO_DATE(ins_at, c_input_date_format)
          ,ins_by
          ,locale
          ,is_active
          ,notice
          ,num_value
          ,display_value
          ,display_order
          ,display_code
          ,adm_class_district
      INTO l_result.key_value
          ,l_result.dml_at
          ,l_result.dml_by
          ,l_result.dml_type
          ,l_result.ins_at
          ,l_result.ins_by
          ,l_result.locale
          ,l_result.is_active
          ,l_result.notice
          ,l_result.num_value
          ,l_result.display_value
          ,l_result.display_order
          ,l_result.display_code
          ,l_result.adm_class_district
      FROM JSON_TABLE(p_subdistrict_json, '$'
           COLUMNS (key_value           VARCHAR2(500 CHAR) PATH '$.id'
                   ,dml_at              VARCHAR2(500 CHAR) PATH '$.lastModifiedAt'
                   ,dml_by              VARCHAR2(500 CHAR) PATH '$.lastModifiedBy'
                   ,dml_type            VARCHAR2(500 CHAR) PATH '$.lastModifiedAction'
                   ,ins_at              VARCHAR2(500 CHAR) PATH '$.createdAt'
                   ,ins_by              VARCHAR2(500 CHAR) PATH '$.createdBy'
                   ,locale              VARCHAR2(500 CHAR) PATH '$.locale'
                   ,is_active           VARCHAR2(500 CHAR) PATH '$.isActiveFlag'
                   ,notice              VARCHAR2(500 CHAR) PATH '$.notice'
                   ,num_value           VARCHAR2(500 CHAR) PATH '$.numValue'
                   ,display_value       VARCHAR2(500 CHAR) PATH '$.displayValue'
                   ,display_order       VARCHAR2(500 CHAR) PATH '$.displayOrder'
                   ,display_code        VARCHAR2(500 CHAR) PATH '$.displayCode'
                   ,adm_class_district  VARCHAR2(500 CHAR) PATH '$.districtId')) jt;

    RETURN l_result;

    EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('extract_subdistrict_from_json: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END extract_subdistrict_from_json;

  -- --------------------------------------------------------------------------------

  FUNCTION extract_district_from_json (p_district_json IN CLOB)
  RETURN t_district_typ
  IS

    l_scope  logger_logs.scope%type := c_scope_prefix || 'extract_district_from_json';
    l_params logger.tab_param;

    l_district_obj    JSON;
    --
    l_result          t_district_typ;

  BEGIN

    logger.append_param(l_params, 'dbms_lob.substr(p_district_json, 4000, 1)', dbms_lob.substr(p_district_json, 4000, 1));
    logger.log('extract_district_from_json: start', l_scope, null, l_params);

    l_district_obj := JSON(p_district_json);

    --l_result.row_flag_mask      => NULL;

    SELECT key_value
          ,TO_DATE(dml_at, c_input_date_format)
          ,dml_by
          ,dml_type
          ,TO_DATE(ins_at, c_input_date_format)
          ,ins_by
          ,locale
          ,is_active
          ,notice
          ,num_value
          ,display_value
          ,display_order
          ,display_code
          ,adm_class_province
      INTO l_result.key_value
          ,l_result.dml_at
          ,l_result.dml_by
          ,l_result.dml_type
          ,l_result.ins_at
          ,l_result.ins_by
          ,l_result.locale
          ,l_result.is_active
          ,l_result.notice
          ,l_result.num_value
          ,l_result.display_value
          ,l_result.display_order
          ,l_result.display_code
          ,l_result.adm_class_province
      FROM JSON_TABLE(p_district_json, '$'
           COLUMNS (key_value           VARCHAR2(500 CHAR) PATH '$.id'
                   ,dml_at              VARCHAR2(500 CHAR) PATH '$.lastModifiedAt'
                   ,dml_by              VARCHAR2(500 CHAR) PATH '$.lastModifiedBy'
                   ,dml_type            VARCHAR2(500 CHAR) PATH '$.lastModifiedAction'
                   ,ins_at              VARCHAR2(500 CHAR) PATH '$.createdAt'
                   ,ins_by              VARCHAR2(500 CHAR) PATH '$.createdBy'
                   ,locale              VARCHAR2(500 CHAR) PATH '$.locale'
                   ,is_active           VARCHAR2(500 CHAR) PATH '$.isActiveFlag'
                   ,notice              VARCHAR2(500 CHAR) PATH '$.notice'
                   ,num_value           VARCHAR2(500 CHAR) PATH '$.numValue'
                   ,display_value       VARCHAR2(500 CHAR) PATH '$.displayValue'
                   ,display_order       VARCHAR2(500 CHAR) PATH '$.displayOrder'
                   ,display_code        VARCHAR2(500 CHAR) PATH '$.displayCode'
                   ,adm_class_province  VARCHAR2(500 CHAR) PATH '$.provinceId')) jt;

    RETURN l_result;

    EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('extract_district_from_json: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END extract_district_from_json;

  -- --------------------------------------------------------------------------------

  FUNCTION extract_province_from_json (p_province_json IN CLOB)
  RETURN t_province_typ
  IS

    l_scope  logger_logs.scope%type := c_scope_prefix || 'extract_province_from_json';
    l_params logger.tab_param;

    l_province_obj    JSON;
    --
    l_result          t_province_typ;

  BEGIN

    logger.append_param(l_params, 'dbms_lob.substr(p_province_json, 4000, 1)', dbms_lob.substr(p_province_json, 4000, 1));
    logger.log('extract_province_from_json: start', l_scope, null, l_params);

    l_province_obj := JSON(p_province_json);

    SELECT key_value
          ,TO_DATE(dml_at, c_input_date_format)
          ,dml_by
          ,dml_type
          ,TO_DATE(ins_at, c_input_date_format)
          ,ins_by
          ,locale
          ,is_active
          ,notice
          ,num_value
          ,display_value
          ,display_order
          ,display_code
          ,adm_class_region
      INTO l_result.key_value
          ,l_result.dml_at
          ,l_result.dml_by
          ,l_result.dml_type
          ,l_result.ins_at
          ,l_result.ins_by
          ,l_result.locale
          ,l_result.is_active
          ,l_result.notice
          ,l_result.num_value
          ,l_result.display_value
          ,l_result.display_order
          ,l_result.display_code
          ,l_result.adm_class_region
      FROM JSON_TABLE(p_province_json, '$'
           COLUMNS (key_value         VARCHAR2(500 CHAR) PATH '$.id'
                   ,dml_at            VARCHAR2(500 CHAR) PATH '$.lastModifiedAt'
                   ,dml_by            VARCHAR2(500 CHAR) PATH '$.lastModifiedBy'
                   ,dml_type          VARCHAR2(500 CHAR) PATH '$.lastModifiedAction'
                   ,ins_at            VARCHAR2(500 CHAR) PATH '$.createdAt'
                   ,ins_by            VARCHAR2(500 CHAR) PATH '$.createdBy'
                   ,locale            VARCHAR2(500 CHAR) PATH '$.locale'
                   ,is_active         VARCHAR2(500 CHAR) PATH '$.isActiveFlag'
                   ,notice            VARCHAR2(500 CHAR) PATH '$.notice'
                   ,num_value         VARCHAR2(500 CHAR) PATH '$.numValue'
                   ,display_value     VARCHAR2(500 CHAR) PATH '$.displayValue'
                   ,display_order     VARCHAR2(500 CHAR) PATH '$.displayOrder'
                   ,display_code      VARCHAR2(500 CHAR) PATH '$.displayCode'
                   ,adm_class_region  VARCHAR2(500 CHAR) PATH '$.regionId')) jt;

    --l_result.row_flag_mask    => NULL;

    RETURN l_result;

    EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('extract_province_from_json: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END extract_province_from_json;

  -- --------------------------------------------------------------------------------

  FUNCTION extract_movementimages_from_json (p_movements_blob_json IN CLOB)
  RETURN t_movements_blob_typ
  IS

    l_scope  logger_logs.scope%type := c_scope_prefix || 'extract_movementimages_from_json';
    l_params logger.tab_param;

    l_blob              BLOB;
    l_movementblob_obj  JSON;
    l_image_clob        clob;
    --
    l_result            t_movements_blob_typ;

  BEGIN

    logger.append_param(l_params, 'dbms_lob.substr(p_movements_blob_json, 4000, 1)', dbms_lob.substr(p_movements_blob_json, 4000, 1));
    logger.log('extract_movementimages_from_json: start', l_scope, null, l_params);

    l_movementblob_obj := JSON(p_movements_blob_json);

    l_result.wsq_ll           := convert_base64_clob_to_blob(l_movementblob_obj.get('wsqLL').get_string());
    l_result.wsq_li           := convert_base64_clob_to_blob(l_movementblob_obj.get('wsqLI').get_string());
    l_result.wsq_lm           := convert_base64_clob_to_blob(l_movementblob_obj.get('wsqLM').get_string());
    l_result.wsq_lr           := convert_base64_clob_to_blob(l_movementblob_obj.get('wsqLR').get_string());
    l_result.wsq_lt           := convert_base64_clob_to_blob(l_movementblob_obj.get('wsqLT').get_string());
    l_result.wsq_rl           := convert_base64_clob_to_blob(l_movementblob_obj.get('wsqRL').get_string());
    l_result.wsq_ri           := convert_base64_clob_to_blob(l_movementblob_obj.get('wsqRI').get_string());
    l_result.wsq_rm           := convert_base64_clob_to_blob(l_movementblob_obj.get('wsqRM').get_string());
    l_result.wsq_rr           := convert_base64_clob_to_blob(l_movementblob_obj.get('wsqRR').get_string());
    l_result.wsq_rt           := convert_base64_clob_to_blob(l_movementblob_obj.get('wsqRT').get_string());
    l_result.visa_page        := convert_base64_clob_to_blob(l_movementblob_obj.get('visaPage').get_string());
    l_result.travelcard_page  := convert_base64_clob_to_blob(l_movementblob_obj.get('travelcardPage').get_string());

    dbms_lob.createtemporary(l_image_clob, true);
    l_movementblob_obj.get('livePhoto').get_string(l_image_clob);

    l_result.live_photo       := convert_base64_clob_to_blob(l_image_clob);
    l_result.psblob_1         := convert_base64_clob_to_blob(l_movementblob_obj.get('psBlob1').get_string());
    l_result.psblob_2         := convert_base64_clob_to_blob(l_movementblob_obj.get('psBlob2').get_string());
    l_result.psblob_3         := convert_base64_clob_to_blob(l_movementblob_obj.get('psBlob3').get_string());
    l_result.psblob_4         := convert_base64_clob_to_blob(l_movementblob_obj.get('psBlob4').get_string());
    l_result.psblob_5         := convert_base64_clob_to_blob(l_movementblob_obj.get('psBlob5').get_string());
    l_result.psblob_6         := convert_base64_clob_to_blob(l_movementblob_obj.get('psBlob6').get_string());
    l_result.psblob_7         := convert_base64_clob_to_blob(l_movementblob_obj.get('psBlob7').get_string());
    l_result.psblob_8         := convert_base64_clob_to_blob(l_movementblob_obj.get('psBlob8').get_string());
    l_result.psblob_9         := convert_base64_clob_to_blob(l_movementblob_obj.get('psBlob9').get_string());
    l_result.psblob_10        := convert_base64_clob_to_blob(l_movementblob_obj.get('psBlob10').get_string());
    l_result.template_ll      := convert_base64_clob_to_blob(l_movementblob_obj.get('templateLL').get_string());
    l_result.template_li      := convert_base64_clob_to_blob(l_movementblob_obj.get('templateLI').get_string());
    l_result.template_lm      := convert_base64_clob_to_blob(l_movementblob_obj.get('templateLM').get_string());
    l_result.template_lr      := convert_base64_clob_to_blob(l_movementblob_obj.get('templateLR').get_string());
    l_result.template_lt      := convert_base64_clob_to_blob(l_movementblob_obj.get('templateLT').get_string());
    l_result.template_rl      := convert_base64_clob_to_blob(l_movementblob_obj.get('templateRL').get_string());
    l_result.template_ri      := convert_base64_clob_to_blob(l_movementblob_obj.get('templateRI').get_string());
    l_result.template_rm      := convert_base64_clob_to_blob(l_movementblob_obj.get('templateRM').get_string());
    l_result.template_rr      := convert_base64_clob_to_blob(l_movementblob_obj.get('templateRR').get_string());
    l_result.template_rt      := convert_base64_clob_to_blob(l_movementblob_obj.get('templateRT').get_string());

    SELECT TO_DATE(ins_at, c_input_date_format)
          ,ins_by
          ,TO_DATE(dml_at, c_input_date_format)
          ,dml_by
          ,dml_type
          ,ins_terminal
          ,ins_borderpost
      INTO l_result.ins_at
          ,l_result.ins_by
          ,l_result.dml_at
          ,l_result.dml_by
          ,l_result.dml_type
          ,l_result.ins_terminal
          ,l_result.ins_borderpost
      FROM JSON_TABLE(p_movements_blob_json, '$'
           COLUMNS (ins_at            VARCHAR2(500 CHAR) PATH '$.createdAt'
                   ,ins_by            VARCHAR2(500 CHAR) PATH '$.createdBy'
                   ,dml_at            VARCHAR2(500 CHAR) PATH '$.lastModifiedAt'
                   ,dml_by            VARCHAR2(500 CHAR) PATH '$.lastModifiedBy'
                   ,dml_type          VARCHAR2(500 CHAR) PATH '$.lastModifiedAction'
                   ,ins_terminal      VARCHAR2(500 CHAR) PATH '$.createdByTerminalId'
                   ,ins_borderpost    VARCHAR2(500 CHAR) PATH '$.createdByBorderpostId')) jt;

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('extract_movementimages_from_json: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END extract_movementimages_from_json;

  -- --------------------------------------------------------------------------------

  FUNCTION extract_borderpost_from_json (p_borderpost_json IN CLOB)
  RETURN t_borderposts_typ
  IS

    l_scope  logger_logs.scope%type := c_scope_prefix || 'extract_borderpost_from_json';
    l_params logger.tab_param;

    l_borderpost_obj  JSON;
    --
    l_result          t_borderposts_typ;

  BEGIN

    logger.append_param(l_params, 'dbms_lob.substr(p_borderpost_json, 4000, 1)', dbms_lob.substr(p_borderpost_json, 4000, 1));
    logger.log('extract_borderpost_from_json: start', l_scope, null, l_params);

    l_borderpost_obj := JSON(p_borderpost_json);

    SELECT key_value
          ,border_type
          ,name
          ,is_active
          ,TO_DATE(dml_at, c_input_date_format)
          ,dml_by
          ,dml_type
          ,border_to_country
          ,locale
          ,display_order
          ,TO_DATE(ins_at, c_input_date_format)
          ,ins_by
      INTO l_result.key_value
          ,l_result.border_type
          ,l_result.name
          ,l_result.is_active
          ,l_result.dml_at
          ,l_result.dml_by
          ,l_result.dml_type
          ,l_result.border_to_country
          ,l_result.locale
          ,l_result.display_order
          ,l_result.ins_at
          ,l_result.ins_by
      FROM JSON_TABLE(p_borderpost_json, '$'
           COLUMNS (key_value           VARCHAR2(500 CHAR) PATH '$.id'
                   ,border_type         VARCHAR2(500 CHAR) PATH '$.borderType'
                   ,name                VARCHAR2(500 CHAR) PATH '$.name'
                   ,is_active           VARCHAR2(500 CHAR) PATH '$.isActiveFlag'
                   ,dml_at              VARCHAR2(500 CHAR) PATH '$.lastModifiedAt'
                   ,dml_by              VARCHAR2(500 CHAR) PATH '$.lastModifiedBy'
                   ,dml_type            VARCHAR2(500 CHAR) PATH '$.lastModifiedAction'
                   ,border_to_country   VARCHAR2(500 CHAR) PATH '$.borderToCountry'
                   ,locale              VARCHAR2(500 CHAR) PATH '$.locale'
                   ,display_order       VARCHAR2(500 CHAR) PATH '$.displayOrder'
                   ,ins_at              VARCHAR2(500 CHAR) PATH '$.createdAt'
                   ,ins_by              VARCHAR2(500 CHAR) PATH '$.createdBy')) jt;

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('extract_borderpost_from_json: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END extract_borderpost_from_json;

  -- --------------------------------------------------------------------------------

  FUNCTION extract_terminal_from_json (p_terminal_json IN CLOB)
  RETURN t_terminals_typ
  IS

    l_scope  logger_logs.scope%type := c_scope_prefix || 'extract_terminal_from_json';
    l_params logger.tab_param;

    l_terminal_obj  JSON;
    l_blob          BLOB;
    --
    l_result        t_terminals_typ;

  BEGIN

    logger.append_param(l_params, 'dbms_lob.substr(p_terminal_json, 4000, 1)', dbms_lob.substr(p_terminal_json, 4000, 1));
    logger.log('extract_terminal_from_json: start', l_scope, null, l_params);

    l_terminal_obj := JSON(p_terminal_json);

    SELECT id
          ,ipaddress
          ,defaultexitflg
          ,active
          ,trnsprtmodeid
          ,isgate
          ,pos_x
          ,pos_y
          ,width
          ,height
          ,floor_id
          ,bio_capturing
          ,name
          ,border_post
          ,locale
          ,TO_DATE(ins_at, c_input_date_format)
          ,TO_DATE(dml_at, c_input_date_format)
          ,dml_by
          ,dml_type
          ,ins_by
          ,default_traveler_type
      INTO l_result.id
          ,l_result.ipaddress
          ,l_result.defaultexitflg
          ,l_result.active
          ,l_result.trnsprtmodeid
          ,l_result.isgate
          ,l_result.pos_x
          ,l_result.pos_y
          ,l_result.width
          ,l_result.height
          ,l_result.floor_id
          ,l_result.bio_capturing
          ,l_result.name
          ,l_result.border_post
          ,l_result.locale
          ,l_result.ins_at
          ,l_result.dml_at
          ,l_result.dml_by
          ,l_result.dml_type
          ,l_result.ins_by
          ,l_result.default_traveler_type
      FROM JSON_TABLE(p_terminal_json, '$'
           COLUMNS (id                    VARCHAR2(500 CHAR) PATH '$.id'
                   ,ipaddress             VARCHAR2(500 CHAR) PATH '$.ipAddress'
                   ,defaultexitflg        VARCHAR2(500 CHAR) PATH '$.defaultExitFlag'
                   ,active                VARCHAR2(500 CHAR) PATH '$.activeFlag'
                   ,trnsprtmodeid         VARCHAR2(500 CHAR) PATH '$.transportModeId'
                   ,isgate                VARCHAR2(500 CHAR) PATH '$.isGateFlag'
                   ,pos_x                 VARCHAR2(500 CHAR) PATH '$.posX'
                   ,pos_y                 VARCHAR2(500 CHAR) PATH '$.posY'
                   ,width                 VARCHAR2(500 CHAR) PATH '$.width'
                   ,height                VARCHAR2(500 CHAR) PATH '$.height'
                   ,floor_id              VARCHAR2(500 CHAR) PATH '$.floorId'
                   ,bio_capturing         VARCHAR2(500 CHAR) PATH '$.bioCapturing'
                   ,name                  VARCHAR2(500 CHAR) PATH '$.name'
                   ,border_post           VARCHAR2(500 CHAR) PATH '$.borderpostId'
                   ,locale                VARCHAR2(500 CHAR) PATH '$.locale'
                   ,ins_at                VARCHAR2(500 CHAR) PATH '$.createdAt'
                   ,dml_at                VARCHAR2(500 CHAR) PATH '$.lastModifiedAt'
                   ,dml_by                VARCHAR2(500 CHAR) PATH '$.lastModifiedBy'
                   ,dml_type              VARCHAR2(500 CHAR) PATH '$.lastModifiedAction'
                   ,ins_by                VARCHAR2(500 CHAR) PATH '$.createdBy'
                   ,default_traveler_type VARCHAR2(500 CHAR) PATH '$.defaultTravelerType')) jt;

    --l_result.default_camera_direction := NULL;

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('extract_terminal_from_json: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END extract_terminal_from_json;

  -- --------------------------------------------------------------------------------

  FUNCTION extract_thaipassport_from_json (p_thaipassport_json IN CLOB)
  RETURN t_thaipassport_typ
  IS

    l_scope  logger_logs.scope%type := c_scope_prefix || 'extract_thaipassport_from_json';
    l_params logger.tab_param;

    l_thaipassport_obj  JSON;
    l_image_clob        clob;
    --
    l_result t_thaipassport_typ;

  BEGIN

    logger.append_param(l_params, 'dbms_lob.substr(p_thaipassport_json, 4000, 1)', dbms_lob.substr(p_thaipassport_json, 4000, 1));
    logger.log('extract_thaipassport_from_json: start', l_scope, null, l_params);

    l_thaipassport_obj       := JSON(p_thaipassport_json);

    IF l_thaipassport_obj IS NULL
    THEN
      l_thaipassport_obj := JSON();
    END IF;

    SELECT citizenid
          ,personid
          ,passportno
          ,passno
          ,tfamilynm
          ,tfirstnm
          ,tmiddlenm
          ,efamilynm
          ,efirstnm
          ,emiddlenm
          ,sex
          ,nationcd
          ,height
          ,weight
          ,addr
          ,district
          ,citycd
          ,statecd
          ,zipcode
          ,telno
          ,TO_DATE(passportdte, c_input_date_format)
          ,TO_DATE(passportexpdte, c_input_date_format)
          ,microrollno
          ,micropicno
          ,micropicnol
          ,birthdte
          ,birthplace
          ,domicile
          ,pps_seqno
          ,pass_seqno
          ,TO_DATE(create_date, c_input_date_format)
          ,TO_DATE(update_date, c_input_date_format)
          ,typedpassport
          ,tmppass_seqno
          ,key_value
          ,TO_DATE(dml_at, c_input_date_format)
          ,dml_by
          ,dml_type
          ,TO_DATE(ins_at, c_input_date_format)
          ,ins_by
      INTO l_result.citizenid
          ,l_result.personid
          ,l_result.passportno
          ,l_result.passno
          ,l_result.tfamilynm
          ,l_result.tfirstnm
          ,l_result.tmiddlenm
          ,l_result.efamilynm
          ,l_result.efirstnm
          ,l_result.emiddlenm
          ,l_result.sex
          ,l_result.nationcd
          ,l_result.height
          ,l_result.weight
          ,l_result.addr
          ,l_result.district
          ,l_result.citycd
          ,l_result.statecd
          ,l_result.zipcode
          ,l_result.telno
          ,l_result.passportdte
          ,l_result.passportexpdte
          ,l_result.microrollno
          ,l_result.micropicno
          ,l_result.micropicnol
          ,l_result.birthdte
          ,l_result.birthplace
          ,l_result.domicile
          ,l_result.pps_seqno
          ,l_result.pass_seqno
          ,l_result.create_date
          ,l_result.update_date
          ,l_result.typedpassport
          ,l_result.tmppass_seqno
          ,l_result.key_value
          ,l_result.dml_at
          ,l_result.dml_by
          ,l_result.dml_type
          ,l_result.ins_at
          ,l_result.ins_by
      FROM JSON_TABLE(p_thaipassport_json, '$'
           COLUMNS (citizenid       VARCHAR2(500 CHAR) PATH '$.citizenId'
                   ,personid        VARCHAR2(500 CHAR) PATH '$.personId'
                   ,passportno      VARCHAR2(500 CHAR) PATH '$.passportNumber'
                   ,passno          VARCHAR2(500 CHAR) PATH '$.passNumber'
                   ,tfamilynm       VARCHAR2(500 CHAR) PATH '$.thaiFamilyName'
                   ,tfirstnm        VARCHAR2(500 CHAR) PATH '$.thaiFirstName'
                   ,tmiddlenm       VARCHAR2(500 CHAR) PATH '$.thaiMiddleName'
                   ,efamilynm       VARCHAR2(500 CHAR) PATH '$.familyName'
                   ,efirstnm        VARCHAR2(500 CHAR) PATH '$.firstName'
                   ,emiddlenm       VARCHAR2(500 CHAR) PATH '$.middleName'
                   ,sex             VARCHAR2(500 CHAR) PATH '$.gender'
                   ,nationcd        VARCHAR2(500 CHAR) PATH '$.nationCode'
                   ,height          VARCHAR2(500 CHAR) PATH '$.height'
                   ,weight          VARCHAR2(500 CHAR) PATH '$.weight'
                   ,addr            VARCHAR2(500 CHAR) PATH '$.address'
                   ,district        VARCHAR2(500 CHAR) PATH '$.district'
                   ,citycd          VARCHAR2(500 CHAR) PATH '$.cityCode'
                   ,statecd         VARCHAR2(500 CHAR) PATH '$.stateCode'
                   ,zipcode         VARCHAR2(500 CHAR) PATH '$.zipCode'
                   ,telno           VARCHAR2(500 CHAR) PATH '$.telephoneNumber'
                   ,passportdte     VARCHAR2(500 CHAR) PATH '$.passportDate'
                   ,passportexpdte  VARCHAR2(500 CHAR) PATH '$.passportExpiryDate'
                   ,microrollno     VARCHAR2(500 CHAR) PATH '$.microRollNo'
                   ,micropicno      VARCHAR2(500 CHAR) PATH '$.microPicNo'
                   ,micropicnol     VARCHAR2(500 CHAR) PATH '$.microPicNol'
                   ,birthdte        VARCHAR2(500 CHAR) PATH '$.dateOfBirth'
                   ,birthplace      VARCHAR2(500 CHAR) PATH '$.placeOfBirth'
                   ,domicile        VARCHAR2(500 CHAR) PATH '$.domicile'
                   ,pps_seqno       VARCHAR2(500 CHAR) PATH '$.ppsSeqno'
                   ,pass_seqno      VARCHAR2(500 CHAR) PATH '$.passSeqno'
                   ,create_date     VARCHAR2(500 CHAR) PATH '$.createDate'
                   ,update_date     VARCHAR2(500 CHAR) PATH '$.lastModifiedDate'
                   ,typedpassport   VARCHAR2(500 CHAR) PATH '$.typedPassport'
                   ,tmppass_seqno   VARCHAR2(500 CHAR) PATH '$.tmppassSeqno'
                   ,key_value       VARCHAR2(500 CHAR) PATH '$.id'
                   ,dml_at          VARCHAR2(500 CHAR) PATH '$.systemLastModifiedAt'
                   ,dml_by          VARCHAR2(500 CHAR) PATH '$.systemLastModifiedBy'
                   ,dml_type        VARCHAR2(500 CHAR) PATH '$.systemLastModifiedByAction'
                   ,ins_at          VARCHAR2(500 CHAR) PATH '$.systemCreatedAt'
                   ,ins_by          VARCHAR2(500 CHAR) PATH '$.systemCreatedBy')) jt;

    IF l_thaipassport_obj.exist('imagePassport')
    THEN

      dbms_lob.createtemporary(l_image_clob, true);
      l_thaipassport_obj.get('imagePassport').get_string(l_image_clob);

      l_result.imgpass := convert_base64_clob_to_blob(l_image_clob);
    END IF;

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('extract_thaipassport_from_json: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END extract_thaipassport_from_json;

  -- --------------------------------------------------------------------------------

  FUNCTION extract_borderdocimages_from_json (p_borderdocimages_json  IN CLOB)
  RETURN t_borderdocimages_tab_typ
  IS

    l_scope  logger_logs.scope%type := c_scope_prefix || 'extract_borderdocimages_from_json';
    l_params logger.tab_param;

    l_borderdocimages_obj   JSON_LIST;
    l_borderdocimage_obj    JSON;
    l_image_clob            clob;
    --
    l_result                t_borderdocimages_tab_typ;
    l_result_borderdocimage t_borderdocimages_typ;

  BEGIN

    logger.append_param(l_params, 'dbms_lob.substr(p_borderdocimages_json, 4000, 1)', dbms_lob.substr(p_borderdocimages_json, 4000, 1));
    logger.log('extract_borderdocimages_from_json: start', l_scope, null, l_params);

    IF p_borderdocimages_json IS NOT NULL
    THEN
      l_borderdocimages_obj := JSON_LIST(p_borderdocimages_json);
    ELSE
      l_borderdocimages_obj := JSON_LIST();
    END IF;

    IF l_borderdocimages_obj IS NOT NULL
    THEN
      FOR i IN 1 .. l_borderdocimages_obj.count()
      LOOP

        l_borderdocimage_obj := JSON(l_borderdocimages_obj.get(i));

        l_result_borderdocimage                 := NULL;
        l_result_borderdocimage.brddocid        := l_borderdocimage_obj.get('borderdocumentId').get_string();
        l_result_borderdocimage.seqno           := l_borderdocimage_obj.get('seqno').get_number();

        dbms_lob.createtemporary(l_image_clob, true);
  	    l_borderdocimage_obj.get('image').get_string(l_image_clob);

        l_result_borderdocimage.image           := convert_base64_clob_to_blob(l_image_clob);
        l_result_borderdocimage.ins_at          := TO_DATE(l_borderdocimage_obj.get('createdAt').get_string(), c_input_date_format);
        l_result_borderdocimage.ins_terminal    := l_borderdocimage_obj.get('createdAtTerminalId').get_string();
        l_result_borderdocimage.ins_borderpost  := l_borderdocimage_obj.get('createdAtBorderpostId').get_string();
        l_result_borderdocimage.dml_at          := TO_DATE(l_borderdocimage_obj.get('lastModifiedAt').get_string(), c_input_date_format);
        l_result_borderdocimage.dml_by          := l_borderdocimage_obj.get('lastModifiedBy').get_string();
        l_result_borderdocimage.dml_type        := l_borderdocimage_obj.get('lastModifiedAction').get_string();
        l_result_borderdocimage.ins_by          := l_borderdocimage_obj.get('createdBy').get_string();

        l_result(l_result.COUNT) := l_result_borderdocimage;
      END LOOP;
    ELSE
      l_result(l_result.COUNT) := l_result_borderdocimage;
    END IF;

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('extract_borderdocimages_from_json: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END extract_borderdocimages_from_json;

  -- --------------------------------------------------------------------------------

  FUNCTION extract_borderdocument_from_json (p_borderdocument_json IN CLOB)
  RETURN t_borderdocument_data_typ
  IS

    l_scope  logger_logs.scope%type := c_scope_prefix || 'extract_borderdocument_from_json';
    l_params logger.tab_param;

    l_borderdocument_obj      JSON;
    --
    l_result                  t_borderdocument_data_typ;
    l_result_borderdocument   t_borderdocument_typ;
    --
    l_clob                    CLOB;

  BEGIN

    logger.append_param(l_params, 'dbms_lob.substr(p_borderdocument_json, 4000, 1)', dbms_lob.substr(p_borderdocument_json, 4000, 1));
    logger.log('extract_borderdocument_from_json: start', l_scope, null, l_params);

    DBMS_LOB.CREATETEMPORARY (l_clob, false);

    l_borderdocument_obj    := JSON(p_borderdocument_json);

    SELECT brddocid
          ,doctype
          ,docno
          ,issuectry
          ,nat
          --,dob
          ,dob_partial
          ,TO_DATE(expirydate, c_input_date_format)
          ,givenname
          ,surname
          ,optionaldata
          ,afisid
          ,TO_DATE(ins_at, c_input_date_format)
          ,ins_terminal
          ,ins_borderpost
          ,officer_observation
          ,mrzdg1
          ,p_01
          ,p_02
          ,p_03
          ,p_04
          ,p_05
          ,middlename
          ,givenname_thai
          ,middlename_thai
          ,surname_thai
          ,TO_DATE(calc_dob, c_input_date_format)
          ,TO_DATE(manual_expiry_date, c_input_date_format)
          ,TO_DATE(manual_issuing_date, c_input_date_format)
          ,manual_nationality
          ,manual_placeofbirth
          ,TO_DATE(dml_at, c_input_date_format)
          ,dml_by
          ,dml_type
          ,sex
          ,ins_by
          ,docclass
          ,sub_nationality
      INTO l_result_borderdocument.brddocid
          ,l_result_borderdocument.doctype
          ,l_result_borderdocument.docno
          ,l_result_borderdocument.issuectry
          ,l_result_borderdocument.nat
          ,l_result_borderdocument.dob
          ,l_result_borderdocument.expirydate
          ,l_result_borderdocument.givenname
          ,l_result_borderdocument.surname
          ,l_result_borderdocument.optionaldata
          ,l_result_borderdocument.afisid
          ,l_result_borderdocument.ins_at
          ,l_result_borderdocument.ins_terminal
          ,l_result_borderdocument.ins_borderpost
          ,l_result_borderdocument.officer_observation
          ,l_result_borderdocument.mrzdg1
          ,l_result_borderdocument.p_01
          ,l_result_borderdocument.p_02
          ,l_result_borderdocument.p_03
          ,l_result_borderdocument.p_04
          ,l_result_borderdocument.p_05
          ,l_result_borderdocument.middlename
          ,l_result_borderdocument.givenname_thai
          ,l_result_borderdocument.middlename_thai
          ,l_result_borderdocument.surname_thai
          ,l_result_borderdocument.calc_dob
          ,l_result_borderdocument.manual_expiry_date
          ,l_result_borderdocument.manual_issuing_date
          ,l_result_borderdocument.manual_nationality
          ,l_result_borderdocument.manual_placeofbirth
          ,l_result_borderdocument.dml_at
          ,l_result_borderdocument.dml_by
          ,l_result_borderdocument.dml_type
          ,l_result_borderdocument.sex
          ,l_result_borderdocument.ins_by
          ,l_result_borderdocument.docclass
          ,l_result_borderdocument.sub_nationality
      FROM JSON_TABLE(p_borderdocument_json, '$'
           COLUMNS (brddocid             VARCHAR2(500 CHAR) PATH '$.id'
                   ,doctype              VARCHAR2(500 CHAR) PATH '$.documentType'
                   ,docno                VARCHAR2(500 CHAR) PATH '$.documentNumber'
                   ,issuectry            VARCHAR2(500 CHAR) PATH '$.issuingCountryId'
                   ,nat                  VARCHAR2(500 CHAR) PATH '$.nationalityId'
                   ,dob                  VARCHAR2(500 CHAR) PATH '$.dateOfBirthCode'
                   ,expirydate           VARCHAR2(500 CHAR) PATH '$.expiryDate'
                   ,givenname            VARCHAR2(500 CHAR) PATH '$.givenName'
                   ,surname              VARCHAR2(500 CHAR) PATH '$.surname'
                   ,optionaldata         VARCHAR2(500 CHAR) PATH '$.optionalData'
                   ,afisid               VARCHAR2(500 CHAR) PATH '$.afisId'
                   ,ins_at               VARCHAR2(500 CHAR) PATH '$.createdAt'
                   ,ins_terminal         VARCHAR2(500 CHAR) PATH '$.createdByTerminalId'
                   ,ins_borderpost       VARCHAR2(500 CHAR) PATH '$.createdByBorderpostId'
                   ,officer_observation  VARCHAR2(500 CHAR) PATH '$.officerObservation'
                   ,mrzdg1               VARCHAR2(500 CHAR) PATH '$.mrzDg1'
                   ,p_01                 VARCHAR2(500 CHAR) PATH '$.p01'
                   ,p_02                 VARCHAR2(500 CHAR) PATH '$.p02'
                   ,p_03                 VARCHAR2(500 CHAR) PATH '$.p03'
                   ,p_04                 VARCHAR2(500 CHAR) PATH '$.p04'
                   ,p_05                 VARCHAR2(500 CHAR) PATH '$.p05'
                   ,middlename           VARCHAR2(500 CHAR) PATH '$.middleName'
                   ,givenname_thai       VARCHAR2(500 CHAR) PATH '$.thaiGivenName'
                   ,middlename_thai      VARCHAR2(500 CHAR) PATH '$.thaiMiddleName'
                   ,surname_thai         VARCHAR2(500 CHAR) PATH '$.thaiSurname'
                   ,calc_dob             VARCHAR2(500 CHAR) PATH '$.dateOfBirthDate'
                   ,manual_expiry_date   VARCHAR2(500 CHAR) PATH '$.manuelExpiryDate'
                   ,manual_issuing_date  VARCHAR2(500 CHAR) PATH '$.manuelIssuingDate'
                   ,manual_nationality   VARCHAR2(500 CHAR) PATH '$.manualNationalityId'
                   ,manual_placeofbirth  VARCHAR2(500 CHAR) PATH '$.manualPlaceOfBirth'
                   ,dml_at               VARCHAR2(500 CHAR) PATH '$.lastModifiedAt'
                   ,dml_by               VARCHAR2(500 CHAR) PATH '$.lastModifiedBy'
                   ,dml_type             VARCHAR2(500 CHAR) PATH '$.lastModifiedAction'
                   ,sex                  VARCHAR2(500 CHAR) PATH '$.genderId'
                   ,ins_by               VARCHAR2(500 CHAR) PATH '$.createdBy'
                   ,docclass             VARCHAR2(500 CHAR) PATH '$.documentClassId'
                   ,sub_nationality      VARCHAR2(500 CHAR) PATH '$.subNationality'
                   ,dob_partial          VARCHAR2(500 CHAR) PATH '$.dateOfBirthDatePartial')) jt;

    l_result.borderdocument   := l_result_borderdocument;

    -- borderdocimages
    IF l_borderdocument_obj.exist('images')
    THEN
      JSON_LIST(l_borderdocument_obj.get('images')).to_clob(l_clob);
      l_result.borderdocimages  := extract_borderdocimages_from_json(l_clob);
    ELSE
      l_result.borderdocimages  := extract_borderdocimages_from_json(NULL);
    END IF;

    -- thaipassport
    IF l_borderdocument_obj.exist('thaipassport')
    THEN
      JSON(l_borderdocument_obj.get('thaipassport')).to_clob(l_clob);
      l_result.thaipassport     := extract_thaipassport_from_json(l_clob);
    END IF;

    DBMS_LOB.FREETEMPORARY (l_clob); 

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('extract_borderdocument_from_json: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END extract_borderdocument_from_json;

  -- --------------------------------------------------------------------------------

  FUNCTION extract_movement_from_json (p_movement_json  IN CLOB)
  RETURN t_movement_json_typ
  IS

    l_scope  logger_logs.scope%type := c_scope_prefix || 'extract_movement_from_json';
    l_params logger.tab_param;

    l_movement_obj          JSON;
    l_result                t_movement_json_typ;
    l_movement_rec          t_movement_typ;
    --
    l_json_obj              JSON;
    l_clob                  CLOB;

  BEGIN

    logger.append_param(l_params, 'dbms_lob.substr(p_movement_json, 4000, 1)', dbms_lob.substr(p_movement_json, 4000, 1));
    logger.log('extract_movement_from_json: start', l_scope, null, l_params);

    DBMS_LOB.CREATETEMPORARY (l_clob, false);

    l_movement_obj    := JSON(p_movement_json);

    l_movement_rec.mvmntid              := l_movement_obj.get('id').get_string();
    l_movement_rec.landbarcd            := l_movement_obj.get('landbarCode').get_string();
    l_movement_rec.exitflg              := l_movement_obj.get('exitFlag').get_number();
    l_movement_rec.max_stay_dt          := TO_DATE(l_movement_obj.get('maxStayDate').get_string(), c_input_date_format);
    l_movement_rec.fingermatch          := l_movement_obj.get('fingermatch').get_string();
    l_movement_rec.facematch            := l_movement_obj.get('facematch').get_string();
    l_movement_rec.mvmntaddr            := l_movement_obj.get('movementAdress').get_string();
    l_movement_rec.oridest              := l_movement_obj.get('oriDest').get_string();
    l_movement_rec.ins_at               := TO_DATE(l_movement_obj.get('createdAt').get_string(), c_input_date_format);
    l_movement_rec.refusedflg           := l_movement_obj.get('refusedFlag').get_string();
    l_movement_rec.observation          := l_movement_obj.get('observation').get_string();
    l_movement_rec.trnsprtunitid        := l_movement_obj.get('transportUnitId').get_string();
    l_movement_rec.person_type          := l_movement_obj.get('personType').get_number();
    l_movement_rec.scanned_flight       := l_movement_obj.get('scannedFlight').get_string();
    l_movement_rec.ps_1                 := l_movement_obj.get('ps1').get_string();
    l_movement_rec.ps_2                 := l_movement_obj.get('ps2').get_string();
    l_movement_rec.ps_3                 := l_movement_obj.get('ps3').get_string();
    l_movement_rec.ps_4                 := l_movement_obj.get('ps4').get_string();
    l_movement_rec.ps_5                 := l_movement_obj.get('ps5').get_string();
    l_movement_rec.ps_6                 := l_movement_obj.get('ps6').get_string();
    l_movement_rec.ps_7                 := l_movement_obj.get('ps7').get_string();
    l_movement_rec.ps_8                 := l_movement_obj.get('ps8').get_string();
    l_movement_rec.ps_9                 := l_movement_obj.get('ps9').get_string();
    l_movement_rec.ps_10                := l_movement_obj.get('ps10').get_string();
    l_movement_rec.fingermatch_history  := l_movement_obj.get('fingermatchHistory').get_string();
    l_movement_rec.facematc_history     := l_movement_obj.get('facematchHistory').get_string();
    l_movement_rec.reason_offload       := l_movement_obj.get('reasonOffload').get_string();
    l_movement_rec.reason_deportee      := l_movement_obj.get('reasonDeportee').get_string();
    l_movement_rec.dml_at               := TO_DATE(l_movement_obj.get('lastModifiedAt').get_string(), c_input_date_format);
    l_movement_rec.dml_by               := l_movement_obj.get('lastModifiedBy').get_string();
    l_movement_rec.dml_type             := l_movement_obj.get('lastModifiedAction').get_string();
    l_movement_rec.ins_by               := l_movement_obj.get('createdBy').get_string();
    l_movement_rec.is_finished          := l_movement_obj.get('isFinishedFlag').get_string();
    l_movement_rec.prior_movement       := l_movement_obj.get('priorMovementId').get_string();
    l_movement_rec.form_no_approved     := l_movement_obj.get('entryFormNoApproved').get_string();
    l_movement_rec.movement_dt          := TO_DATE(l_movement_obj.get('movementDate').get_string(), c_input_date_format);
    l_movement_rec.source_system        := l_movement_obj.get('sourceSystem').get_string();
    l_movement_rec.date_of_entry        := TO_DATE(l_movement_obj.get('dateOfEntry').get_string(), c_input_date_format);
    l_movement_rec.mrzvisa              := l_movement_obj.get('mrzVisa').get_string();

    -- set result
    -- borderdocument
    JSON(l_movement_obj.get('borderdocuments')).to_clob(l_clob);
    l_result.borderdocument     := extract_borderdocument_from_json(l_clob);

    -- terminal
    JSON(l_movement_obj.get('terminal')).to_clob(l_clob);
    l_result.terminal           := extract_terminal_from_json(l_clob);

    -- borderpost
    JSON(l_movement_obj.get('borderpost')).to_clob(l_clob);
    l_result.borderpost         := extract_borderpost_from_json(l_clob);

    -- visa data
    JSON(l_movement_obj.get('visa')).to_clob(l_clob);
    l_result.visa_data          := extract_visa_data_from_json(l_clob);

    -- movement blobs
    JSON(l_movement_obj.get('movementImages')).to_clob(l_clob);
    l_result.movement_blobs     := extract_movementimages_from_json(l_clob);

    -- entry form
    JSON(l_movement_obj.get('entryForm')).to_clob(l_clob);
    l_result.entry_form         := extract_entry_form_data_from_json(l_clob);

    -- fellow passenger
    --JSON(l_movement_obj.get('collectivePassports')).to_clob(l_clob);
    --l_result.fellow_passengers  := extract_collective_passports_from_json(l_clob);
    
    -- fellow passenger
    JSON_LIST(l_movement_obj.get('collectivePassports')).to_clob(l_clob);
    l_result.fellow_passengers  := extract_collective_passports_from_json(l_clob);

    -- visa type
    JSON(l_movement_obj.get('visaType')).to_clob(l_clob);
    l_result.visa_type          := dl_common.pkg_json_convert.extract_visa_type_from_json (l_clob);

    -- fill ids
    l_movement_rec.ins_terminal         := l_result.terminal.id;
    l_movement_rec.ins_borderpost       := l_result.borderpost.key_value;
    l_movement_rec.brddocid             := l_result.borderdocument.borderdocument.brddocid;
    l_movement_rec.visa_type            := l_result.visa_type.key_value;
    l_movement_rec.visa                 := l_result.visa_data.visa.key_value;
    l_movement_rec.entry_form           := l_result.entry_form.entry_form.key_value;

    l_result.movement           := l_movement_rec;

    DBMS_LOB.FREETEMPORARY (l_clob); 

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('extract_movement_from_json: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END extract_movement_from_json;

end pkg_json_convert;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_JSON_CONVERT" TO "DL_INTERFACE";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_JSON_CONVERT" TO "DERMALOG_PROXY";
