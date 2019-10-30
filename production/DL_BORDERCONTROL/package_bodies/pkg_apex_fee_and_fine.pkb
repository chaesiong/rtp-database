CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_APEX_FEE_AND_FINE" IS

 /*******************************************************************************
  * This package provides a service for saving the data of the Fees and Fines
  * APEX application
  * It is used to set all parameters from the frontend to this PL/SQL package
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * e1SPreuss 25.06.2018  ExtStay Search Added THA20675-1011
  * CHageman  08.05.2018  Added function get_receipt_link
  * CHageman  04.05.2018  Added function and procedure print_receipt
  * CHageman  10.04.2018  Added
  *******************************************************************************/

  /****************************************
   * ========== TYPE DEFINITIONS ==========
   ****************************************/

  c_scope_prefix        CONSTANT VARCHAR2(31) := lower($$plsql_unit) || '.';
  c_status_cancelled    CONSTANT faf_fees_and_fines.status%TYPE := 'CANCEL';
  --
  c_report_datasource   CONSTANT VARCHAR2(255 CHAR) := 'default';
  c_report_link_param   CONSTANT VARCHAR2(50 CHAR)  := 'LINK_REPORT_SERVICE';
  c_receipt_fine_report CONSTANT VARCHAR2(255 CHAR) := 'apex/receipt_fine_overstay';
  c_receipt_fee_report  CONSTANT VARCHAR2(255 CHAR) := 'apex/receipt_fee';
  c_report_format       CONSTANT VARCHAR2(50 CHAR)  := jasper_reporting.xlib_jasperreports.c_rep_format_pdf;
  c_report_locale       CONSTANT VARCHAR2(50 CHAR)  := 'de_DE';
  c_report_encoding     CONSTANT VARCHAR2(50 CHAR)  := 'UTF-8';
  --
  c_print_application   CONSTANT NUMBER             := 520;
  c_print_page          CONSTANT NUMBER             := 15;

  /************************************************
   * ========== FUNCTIONS AND PROCEDURES ==========
   ************************************************/

  /**
   * This function gets and returns the next booking number
   *
   * @return VARCHAR2: Next booking number
   */
  FUNCTION get_next_booking_number
  RETURN faf_fees_and_fines.booking_number%TYPE
  IS

    l_result faf_fees_and_fines.booking_number%TYPE;
    --
    l_scope logger_logs.scope%type := c_scope_prefix || 'get_next_booking_number';
    l_params logger.tab_param;

  BEGIN

    l_result := dl_bordercontrol.faf_fees_and_fines$seq01.nextval();

    logger.append_param(l_params, 'l_result', l_result);
    logger.log('GOT BOOKING NUMBER', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('UNHANDLED EXCEPTION', l_scope, null, l_params);
  END get_next_booking_number;

  /**
   * This function gets and returns the next receipt number
   *
   * @return VARCHAR2: Next receipt number
   */
  FUNCTION get_next_receipt_number
  RETURN faf_fees_and_fines.receipt_number%TYPE
  IS

    l_result faf_fees_and_fines.receipt_number%TYPE;
    --
    l_scope logger_logs.scope%type := c_scope_prefix || 'get_next_receipt_number';
    l_params logger.tab_param;

  BEGIN

    l_result := dl_bordercontrol.faf_fees_and_fines$seq02.nextval();

    logger.append_param(l_params, 'l_result', l_result);
    logger.log('GOT RECEIPT NUMBER', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('UNHANDLED EXCEPTION', l_scope, null, l_params);
  END get_next_receipt_number;

  /**
   * Initializes the collection c_collection_payment_rates
   * Also provides an empty collection (apex_collection package) if its already filled
   * and used
   */
  PROCEDURE init_collection
  IS
  BEGIN
    apex_collection.create_or_truncate_collection(c_collection_payment_rates);
  END init_collection;

  /**
   * Deletes the collection c_collection_payment_rates with apex_collection package
   */
  PROCEDURE del_collection
  IS
  BEGIN

    IF apex_collection.collection_exists(c_collection_payment_rates)
    THEN
      apex_collection.delete_collection(
          p_collection_name => c_collection_payment_rates
      );
    END IF;

  END del_collection;

  /**
   * Adds a new entry to the collection c_collection_payment_rates
   * Uses the apex_collection package
   *
   * @p_key_value  Primary key of the payment_rate
   */
  PROCEDURE add_collection_entry (p_key_value IN VARCHAR2)
  IS

    l_result_values apex_application_global.vc_arr2;

  BEGIN

    l_result_values := apex_util.string_to_table(
        p_string => p_key_value
      , p_separator => ':'
    );

    apex_collection.add_member(
        p_collection_name => c_collection_payment_rates
      , p_c001 => l_result_values(1)
      , p_n001 => l_result_values(2)
      , p_n002 => 1
    );

  END add_collection_entry;

  /**
   * Removes an entry from the collection c_collection_payment_rates
   * Uses the apex_collection package
   *
   * @p_seq_id  Unique number of collection entry
   */
  PROCEDURE del_collection_entry (p_seq_id  IN NUMBER)
  IS
  BEGIN

    apex_collection.delete_member(
        p_collection_name => c_collection_payment_rates
      , p_seq => p_seq_id
    );

  END del_collection_entry;

  /**
   * Extracts collection entries from Report with checkboxes to provide
   * that the chosen payment rates are added to the collection c_collection_payment_rates
   * Uses the apex_collection package and the g_f01 apex array
   */
  PROCEDURE get_payment_rates
  IS
  BEGIN

    FOR i IN 1 .. APEX_APPLICATION.G_F01.COUNT
    LOOP

      IF APEX_APPLICATION.G_F01(i) IS NOT NULL
      THEN
        add_collection_entry(APEX_APPLICATION.G_F01(i));
      END IF;

    END LOOP;

  END get_payment_rates;

  /**
   * Updates an payment rate entry and saves the changes to the collection
   * c_collection_payment_rates
   *
   * @p_apex_status             Row status from apex (C.reate, U.pdate, D.elete)
   * @seq_id                    Primary Key of collection
   * @p_key_value               Primary Key of payment rate
   * @p_fees_and_fines_details
   * @p_costs                   Costs the customer has to pay
   * @p_overstayed_days         Number of overstayed days
   */
  PROCEDURE upd_col_payment_rate(p_apex_status            IN VARCHAR2
                                ,p_seq_id                 IN NUMBER
                                ,p_key_value              IN VARCHAR2
                                ,p_fees_and_fines_details IN VARCHAR2
                                ,p_costs                  IN NUMBER
                                ,p_overstayed_days        IN NUMBER DEFAULT 0)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'upd_col_payment_rate';
    l_params logger.tab_param;

  BEGIN

    logger.append_param(l_params, 'p_apex_status'           , p_apex_status);
    logger.append_param(l_params, 'p_seq_id'                , p_seq_id);
    logger.append_param(l_params, 'p_key_value'             , p_key_value);
    logger.append_param(l_params, 'p_fees_and_fines_details', p_fees_and_fines_details);
    logger.append_param(l_params, 'p_costs'                 , p_costs);
    logger.append_param(l_params, 'p_overstayed_days'       , p_overstayed_days);

    logger.log('PAYMENT RATE: Save information into collection', l_scope, null, l_params);

    -- 'C' will not happen here because there are no buttons to add any new entries
    -- (except the modal dialog). For future reasons we will handle this status too.
    IF p_apex_status IN ('C','U')
    THEN

      -- check if dataset comes from database (update) or was added by the user
      IF p_seq_id IS NULL
      THEN

        apex_collection.add_member(
            p_collection_name => c_collection_payment_rates
          , p_c001 => p_key_value
          , p_c002 => p_fees_and_fines_details
          , p_n001 => p_costs
          , p_n002 => p_overstayed_days
        );

      ELSE

        apex_collection.update_member(
            p_collection_name => c_collection_payment_rates
          , p_seq => p_seq_id
          , p_c001 => p_key_value
          , p_c002 => p_fees_and_fines_details
          , p_n001 => p_costs
          , p_n002 => p_overstayed_days
        );
      END IF;

    ELSIF p_apex_status = 'D'
    THEN

      apex_collection.delete_member(
          p_collection_name => c_collection_payment_rates
        , p_seq => p_seq_id
      );
    ELSE
      logger.append_param(l_params, 'APEX$STATUS did not match anything', 0);
    END IF;

    logger.log('PAYMENT RATE: Saved successfully', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('PAYMENT RATE: Unhandled Exception', l_scope, null, l_params);
  END upd_col_payment_rate;

  /**
   * Fetches the detailed payment rate information from the given fees and fines structure
   * and adds the different entries to the given collection
   *
   * @p_key_value Primary Key of table dl_bordercontrol.faf_fees_and_fines
   */
  PROCEDURE fetch_col_payment_rate (p_key_value IN faf_fees_and_fines.key_value%TYPE)
  IS

    CURSOR l_details_cur IS
    SELECT payment_rate
          ,costs
          ,key_value
          ,overstayed_days
      FROM dl_bordercontrol.faf_fees_and_fines_details
     WHERE fees_and_fines = p_key_value;

  BEGIN

    FOR l_detail_rec IN l_details_cur
    LOOP

      apex_collection.add_member(
          p_collection_name => c_collection_payment_rates
        , p_c001 => l_detail_rec.payment_rate
        , p_c002 => l_detail_rec.key_value
        , p_n001 => l_detail_rec.costs
        , p_n002 => l_detail_rec.overstayed_days
      );

    END LOOP;

  END fetch_col_payment_rate;

  /**
   * Saves the data of a new (or existing) fee or fine entry
   * Returns the key value of table faf_fees_and_fines if a new dataset was created
   *
   * Fines have some additional information that are declared with default values,
   * so a fine creation can done with the relevant information
   *
   * Also calls save functionalities with the collection c_collection_payment_rates
   *
   * @p_key_value
   * @p_reference_number
   * @p_booking_number
   * @p_receipt_number
   * @p_issuing_date
   * @p_print_flag
   * @p_docno
   * @p_tm6no
   * @p_first_name
   * @p_last_name
   * @p_middle_name
   * @p_thai_last_name
   * @p_thai_first_name
   * @p_sex
   * @p_date_of_birth
   * @p_nationality
   * @p_trans_vehicles
   * @p_trans_number
   * @p_arrival_date
   * @p_visa_type
   * @p_visa_expiry_date
   * @p_departure_date
   * @p_status
   * @p_status_note
   * @p_owner
   * @p_permi
   * @p_permit_date
   * @p_generation_status
   * @p_salutation
   * @p_fee_or_fine
   */
  PROCEDURE save (p_key_value           IN OUT faf_fees_and_fines.key_value%TYPE
                 ,p_reference_entity    IN faf_fees_and_fines.reference_entity%TYPE
                 ,p_reference_number    IN faf_fees_and_fines.reference_number%TYPE
                 ,p_booking_number      IN faf_fees_and_fines.booking_number%TYPE
                 ,p_receipt_number      IN faf_fees_and_fines.receipt_number%TYPE
                 ,p_issuing_date        IN faf_fees_and_fines.issuing_date%TYPE
                 ,p_print_flag          IN faf_fees_and_fines.print_flag%TYPE
                 ,p_borderdocument      IN faf_fees_and_fines.borderdocument%TYPE
                 ,p_docno               IN faf_fees_and_fines.docno%TYPE
                 ,p_tm6no               IN entry_forms.form_no%TYPE
                 ,p_entry_form          IN faf_fees_and_fines.entry_form%TYPE
                 ,p_person              IN faf_fees_and_fines.person%TYPE
                 ,p_first_name          IN faf_fees_and_fines.first_name%TYPE
                 ,p_last_name           IN faf_fees_and_fines.last_name%TYPE
                 ,p_middle_name         IN faf_fees_and_fines.middle_name%TYPE
                 ,p_thai_last_name      IN faf_fees_and_fines.thai_last_name%TYPE DEFAULT NULL -- Fine field only
                 ,p_thai_first_name     IN faf_fees_and_fines.thai_first_name%TYPE DEFAULT NULL -- Fine field only
                 ,p_sex                 IN  faf_fees_and_fines.sex%TYPE
                 ,p_date_of_birth       IN faf_fees_and_fines.date_of_birth%TYPE
                 ,p_nationality         IN faf_fees_and_fines.nationality%TYPE
                 ,p_trans_vehicles      IN faf_fees_and_fines.trans_vehicles%TYPE
                 ,p_trans_number        IN faf_fees_and_fines.trans_number%TYPE
                 ,p_arrival_date        IN faf_fees_and_fines.arrival_date%TYPE
                 ,p_visa_type           IN faf_fees_and_fines.visa_type%TYPE
                 ,p_visa_expiry_date    IN faf_fees_and_fines.visa_expiry_date%TYPE DEFAULT NULL -- Fine field only
                 ,p_departure_date      IN faf_fees_and_fines.departure_date%TYPE DEFAULT NULL -- Fine field only
                 ,p_status              IN faf_fees_and_fines.status%TYPE
                 ,p_status_note         IN faf_fees_and_fines.status_note%TYPE
                 ,p_owner               IN faf_fees_and_fines.owner%TYPE
                 ,p_permit              IN faf_fees_and_fines.permit%TYPE DEFAULT NULL -- Fine field only
                 ,p_permit_date         IN faf_fees_and_fines.permit_date%TYPE DEFAULT NULL -- Fine field only
                 ,p_generation_status   IN faf_fees_and_fines.generation_status%TYPE
                 ,p_salutation          IN faf_fees_and_fines.salutation%TYPE
                 ,p_fee_or_fine         IN faf_fees_and_fines.fee_or_fine%TYPE
                 ,p_ins_terminal        IN faf_fees_and_fines.ins_terminal%TYPE
                 ,p_borderpost          IN faf_fees_and_fines.ins_borderpost%TYPE
                 ,p_charge_number       IN faf_fees_and_fines.charge_number%TYPE)

  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'save';
    l_params logger.tab_param;
    --
    l_fees_and_fines_rec  dl_bordercontrol.faf_fees_and_fines%ROWTYPE;

  BEGIN

    logger.append_param(l_params, 'p_key_value'        , p_key_value);
    logger.append_param(l_params, 'p_reference_entity' , p_reference_entity);
    logger.append_param(l_params, 'p_reference_number' , p_reference_number);
    logger.append_param(l_params, 'p_booking_number'   , p_booking_number);
    logger.append_param(l_params, 'p_receipt_number'   , p_receipt_number);
    logger.append_param(l_params, 'p_issuing_date'     , p_issuing_date);
    logger.append_param(l_params, 'p_print_flag'       , p_print_flag);
    logger.append_param(l_params, 'p_docno'            , p_docno);
    logger.append_param(l_params, 'p_borderdocument'   , p_borderdocument);
    logger.append_param(l_params, 'p_tm6no'            , p_tm6no);
    logger.append_param(l_params, 'p_entry_form'       , p_entry_form);
    logger.append_param(l_params, 'p_person'           , p_person);
    logger.append_param(l_params, 'p_first_name'       , p_first_name);
    logger.append_param(l_params, 'p_last_name'        , p_last_name);
    logger.append_param(l_params, 'p_middle_name'      , p_middle_name);
    logger.append_param(l_params, 'p_thai_last_name'   , p_thai_last_name);
    logger.append_param(l_params, 'p_thai_first_name'  , p_thai_first_name);
    logger.append_param(l_params, 'p_sex'              , p_sex);
    logger.append_param(l_params, 'p_date_of_birth'    , p_date_of_birth);
    logger.append_param(l_params, 'p_nationality'      , p_nationality);
    logger.append_param(l_params, 'p_trans_vehicles'   , p_trans_vehicles);
    logger.append_param(l_params, 'p_trans_number'     , p_trans_number);
    logger.append_param(l_params, 'p_arrival_date'     , p_arrival_date);
    logger.append_param(l_params, 'p_visa_type'        , p_visa_type);
    logger.append_param(l_params, 'p_visa_expiry_date' , p_visa_expiry_date);
    logger.append_param(l_params, 'p_departure_date'   , p_departure_date);
    logger.append_param(l_params, 'p_status'           , p_status);
    logger.append_param(l_params, 'p_status_note'      , p_status_note);
    logger.append_param(l_params, 'p_owner'            , p_owner);
    logger.append_param(l_params, 'p_permit'           , p_permit);
    logger.append_param(l_params, 'p_permit_date'      , p_permit_date);
    logger.append_param(l_params, 'p_generation_status', p_generation_status);
    logger.append_param(l_params, 'p_salutation'       , p_salutation);
    logger.append_param(l_params, 'p_fee_or_fine'      , p_fee_or_fine);
    logger.append_param(l_params, 'p_charge_number'    , p_charge_number);

    logger.log('START', l_scope, null, l_params);

    l_fees_and_fines_rec.key_value         := p_key_value;
    l_fees_and_fines_rec.reference_entity  := NVL(p_reference_entity, 'ANY');
    l_fees_and_fines_rec.reference_number  := p_reference_number;
    l_fees_and_fines_rec.booking_number    := p_booking_number;
    l_fees_and_fines_rec.receipt_number    := p_receipt_number;
    l_fees_and_fines_rec.issuing_date      := p_issuing_date;
    l_fees_and_fines_rec.print_flag        := p_print_flag;
    l_fees_and_fines_rec.docno             := p_docno;
    l_fees_and_fines_rec.borderdocument    := p_borderdocument;
    --l_fees_and_fines_rec.tm6no             := p_tm6no;
    l_fees_and_fines_rec.entry_form        := p_entry_form;
    l_fees_and_fines_rec.person            := p_person;
    l_fees_and_fines_rec.first_name        := p_first_name;
    l_fees_and_fines_rec.last_name         := p_last_name;
    l_fees_and_fines_rec.middle_name       := p_middle_name;
    l_fees_and_fines_rec.thai_last_name    := p_thai_last_name;
    l_fees_and_fines_rec.thai_first_name   := p_thai_first_name;
    l_fees_and_fines_rec.sex               := p_sex;
    l_fees_and_fines_rec.date_of_birth     := p_date_of_birth;
    l_fees_and_fines_rec.nationality       := p_nationality;
    l_fees_and_fines_rec.trans_vehicles    := p_trans_vehicles;
    l_fees_and_fines_rec.trans_number      := p_trans_number;
    l_fees_and_fines_rec.arrival_date      := p_arrival_date;
    l_fees_and_fines_rec.visa_type         := p_visa_type;
    l_fees_and_fines_rec.visa_expiry_date  := p_visa_expiry_date;
    l_fees_and_fines_rec.departure_date    := p_departure_date;
    l_fees_and_fines_rec.status            := p_status;
    l_fees_and_fines_rec.notice            := p_status_note;
    l_fees_and_fines_rec.owner             := p_owner;
    l_fees_and_fines_rec.permit            := p_permit;
    l_fees_and_fines_rec.permit_date       := p_permit_date;
    l_fees_and_fines_rec.generation_status := p_generation_status;
    l_fees_and_fines_rec.salutation        := p_salutation;
    l_fees_and_fines_rec.fee_or_fine       := p_fee_or_fine;
    l_fees_and_fines_rec.row_flag_mask     := 2;
    l_fees_and_fines_rec.ins_terminal      := p_ins_terminal;
    l_fees_and_fines_rec.ins_borderpost    := p_borderpost;
    l_fees_and_fines_rec.charge_number     := p_charge_number;

    IF p_tm6no IS NOT NULL
    THEN

      -- search number for TM6No
      BEGIN

        SELECT key_value
          INTO l_fees_and_fines_rec.entry_form
          FROM dl_bordercontrol.entry_forms
        WHERE form_no = p_tm6no;

      EXCEPTION
        WHEN TOO_MANY_ROWS
        THEN

          logger.log_warning('SEARCHING FOR entry_form returned too many data', l_scope, null, l_params);

        WHEN NO_DATA_FOUND
        THEN

          INSERT INTO entry_forms (ins_terminal
                                  ,ins_borderpost
                                  ,form_no)
          VALUES (p_ins_terminal
                 ,p_borderpost
                 ,p_tm6no)
          RETURNING key_value INTO l_fees_and_fines_rec.entry_form;

        WHEN OTHERS
        THEN
          logger.log_error('UNHANDLED EXCEPTION: SEARCHINF FOR entry_form', l_scope, null, l_params);
          RAISE;
      END;

    END IF;

    -- insert dataset (with collection)
    IF p_key_value IS NULL
    THEN

      INSERT INTO dl_bordercontrol.faf_fees_and_fines
      VALUES l_fees_and_fines_rec
      RETURNING key_value INTO l_fees_and_fines_rec.key_value;

      p_key_value := l_fees_and_fines_rec.key_value;

    -- update dataset (with collection)
    ELSE

      UPDATE dl_bordercontrol.faf_fees_and_fines
         SET reference_number   = l_fees_and_fines_rec.reference_number
            ,booking_number     = l_fees_and_fines_rec.booking_number
            ,receipt_number     = l_fees_and_fines_rec.receipt_number
            ,total_costs        = l_fees_and_fines_rec.total_costs
            ,print_flag         = l_fees_and_fines_rec.print_flag
            ,borderdocument     = l_fees_and_fines_rec.borderdocument
            ,docno              = l_fees_and_fines_rec.docno
            ,person             = l_fees_and_fines_rec.person
            ,entry_form         = l_fees_and_fines_rec.entry_form
            ,first_name         = l_fees_and_fines_rec.first_name
            ,middle_name        = l_fees_and_fines_rec.middle_name
            ,last_name          = l_fees_and_fines_rec.last_name
            ,thai_last_name     = l_fees_and_fines_rec.thai_last_name
            ,thai_first_name    = l_fees_and_fines_rec.thai_first_name
            ,sex                = l_fees_and_fines_rec.sex
            ,date_of_birth      = l_fees_and_fines_rec.date_of_birth
            ,nationality        = l_fees_and_fines_rec.nationality
            ,trans_vehicles     = l_fees_and_fines_rec.trans_vehicles
            ,trans_number       = l_fees_and_fines_rec.trans_number
            ,visa_type          = l_fees_and_fines_rec.visa_type
            ,arrival_date       = l_fees_and_fines_rec.arrival_date
            ,visa_expiry_date   = l_fees_and_fines_rec.visa_expiry_date
            ,departure_date     = l_fees_and_fines_rec.departure_date
            ,status             = NVL(l_fees_and_fines_rec.status, 'ACTIVE')
            ,status_note        = l_fees_and_fines_rec.status_note
            ,owner              = l_fees_and_fines_rec.owner
            ,permit             = l_fees_and_fines_rec.permit
            ,permit_date        = l_fees_and_fines_rec.permit_date
            ,generation_status  = l_fees_and_fines_rec.generation_status
            ,salutation         = l_fees_and_fines_rec.salutation
            ,notice             = l_fees_and_fines_rec.notice
            ,charge_number      = l_fees_and_fines_rec.charge_number
       WHERE key_value          = l_fees_and_fines_rec.key_value;

    END IF;

    -- update detail information
    MERGE INTO dl_bordercontrol.faf_fees_and_fines_details dest
    USING dl_bordercontrol.col_faf_payment_rate src
    ON (dest.key_value = src.faf_fees_and_fines_details)

    WHEN MATCHED THEN
    UPDATE SET dest.costs = src.costs

    WHEN NOT MATCHED THEN
    INSERT (payment_rate
            ,fees_and_fines
            ,costs
            ,ins_terminal
            ,ins_borderpost
            ,position
            ,overstayed_days)
    VALUES (src.key_value
            ,l_fees_and_fines_rec.key_value
            ,src.costs
            ,l_fees_and_fines_rec.ins_terminal
            ,l_fees_and_fines_rec.ins_borderpost
            ,src.seq_id
            ,src.overstayed_days);

    -- update collection data
    del_collection();
    init_collection();
    fetch_col_payment_rate(l_fees_and_fines_rec.key_value);

    -- set total costs
    set_and_upd_total_costs(p_key_value => l_fees_and_fines_rec.key_value);

    logger.log('DONE', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('SAVE FEE AND FINE: Unhandled Exception', l_scope, null, l_params);
      RAISE;
  END save;

  /**
   * Saves a receipt with 0 Bath and less information (will be created automatically if the user
   * checkes the option "Fee Exception")
   * @param p_key_value
   * @param p_booking_number
   * @param p_receipt_number
   * @param p_reference_entity
   * @param p_reference_number
   * @param p_owner
   * @param p_print_flag
   * @param p_fee_or_fine
   * @param p_ins_terminal
   * @param p_ins_borderpost
   */
  PROCEDURE save (p_key_value         IN OUT faf_fees_and_fines.key_value%TYPE
                 ,p_booking_number    IN OUT faf_fees_and_fines.booking_number%TYPE
                 ,p_receipt_number    IN OUT faf_fees_and_fines.receipt_number%TYPE
                 ,p_reference_entity  IN faf_fees_and_fines.reference_entity%TYPE
                 ,p_reference_number  IN faf_fees_and_fines.reference_number%TYPE
                 ,p_owner             IN faf_fees_and_fines.owner%TYPE
                 ,p_print_flag        IN faf_fees_and_fines.print_flag%TYPE
                 ,p_fee_or_fine       IN faf_fees_and_fines.fee_or_fine%TYPE
                 ,p_ins_terminal      IN faf_fees_and_fines.ins_terminal%TYPE
                 ,p_ins_borderpost    IN faf_fees_and_fines.ins_borderpost%TYPE)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'save';
    l_params logger.tab_param;
    --
    l_fees_and_fines_rec faf_fees_and_fines%ROWTYPE;
    --
    l_form_no entry_forms.form_no%TYPE;

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.append_param(l_params, 'p_booking_number', p_booking_number);
    logger.append_param(l_params, 'p_receipt_number', p_receipt_number);
    logger.append_param(l_params, 'p_reference_entity', p_reference_entity);
    logger.append_param(l_params, 'p_reference_number', p_reference_number);
    logger.append_param(l_params, 'p_owner', p_owner);
    logger.append_param(l_params, 'p_print_flag', p_print_flag);
    logger.append_param(l_params, 'p_fee_or_fine', p_fee_or_fine);
    logger.append_param(l_params, 'p_ins_terminal', p_ins_terminal);
    logger.append_param(l_params, 'p_ins_borderpost', p_ins_borderpost);

    logger.log('SAVE FEE AND FINE (FEE EXCEPTION): start', l_scope, null, l_params);

    l_fees_and_fines_rec.key_value        := p_key_value;
    l_fees_and_fines_rec.booking_number   := get_next_booking_number();
    l_fees_and_fines_rec.receipt_number   := get_next_receipt_number();
    l_fees_and_fines_rec.reference_entity := p_reference_entity;
    l_fees_and_fines_rec.reference_number := p_reference_number;
    l_fees_and_fines_rec.owner            := p_owner;
    l_fees_and_fines_rec.print_flag       := p_print_flag;
    l_fees_and_fines_rec.fee_or_fine      := p_fee_or_fine;
    l_fees_and_fines_rec.ins_terminal     := p_ins_terminal;
    l_fees_and_fines_rec.ins_borderpost   := p_ins_borderpost;

    search_reference_data (p_owner              => l_fees_and_fines_rec.owner
                          ,p_reference_entity   => l_fees_and_fines_rec.reference_entity
                          ,p_reference_number   => l_fees_and_fines_rec.reference_number
                          ,x_print_flag         => l_fees_and_fines_rec.print_flag
                          ,x_borderdocument     => l_fees_and_fines_rec.borderdocument
                          ,x_docno              => l_fees_and_fines_rec.docno
                          ,x_tm6no              => l_form_no
                          ,x_entry_form         => l_fees_and_fines_rec.entry_form
                          ,x_person             => l_fees_and_fines_rec.person
                          ,x_first_name         => l_fees_and_fines_rec.first_name
                          ,x_last_name          => l_fees_and_fines_rec.last_name
                          ,x_middle_name        => l_fees_and_fines_rec.middle_name
                          ,x_thai_last_name     => l_fees_and_fines_rec.thai_last_name
                          ,x_thai_first_name    => l_fees_and_fines_rec.thai_first_name
                          ,x_sex                => l_fees_and_fines_rec.sex
                          ,x_date_of_birth      => l_fees_and_fines_rec.date_of_birth
                          ,x_nationality        => l_fees_and_fines_rec.nationality
                          ,x_trans_vehicles     => l_fees_and_fines_rec.trans_vehicles
                          ,x_trans_number       => l_fees_and_fines_rec.trans_number
                          ,x_arrival_date       => l_fees_and_fines_rec.arrival_date
                          ,x_visa_type          => l_fees_and_fines_rec.visa_type
                          ,x_visa_expiry_date   => l_fees_and_fines_rec.visa_expiry_date
                          ,x_departure_date     => l_fees_and_fines_rec.departure_date
                          ,x_status             => l_fees_and_fines_rec.status
                          ,x_status_note        => l_fees_and_fines_rec.status_note
                          ,x_permit             => l_fees_and_fines_rec.permit
                          ,x_permit_date        => l_fees_and_fines_rec.permit_date
                          ,x_generation_status  => l_fees_and_fines_rec.generation_status
                          ,x_salutation         => l_fees_and_fines_rec.salutation);

    -- filter fine only fields
    IF UPPER(p_fee_or_fine) = 'FINE'
    THEN
      l_fees_and_fines_rec.visa_expiry_date := NULL;
      l_fees_and_fines_rec.departure_date   := NULL;
      l_fees_and_fines_rec.permit           := NULL;
      l_fees_and_fines_rec.permit_date      := NULL;
      l_fees_and_fines_rec.charge_number    := '/';
    END IF;

    l_fees_and_fines_rec.issuing_date := SYSDATE;

    -- save fee or fine
    save (p_key_value           => l_fees_and_fines_rec.key_value
         ,p_reference_entity    => l_fees_and_fines_rec.reference_entity
         ,p_reference_number    => l_fees_and_fines_rec.reference_number
         ,p_booking_number      => l_fees_and_fines_rec.booking_number
         ,p_receipt_number      => l_fees_and_fines_rec.receipt_number
         ,p_issuing_date        => l_fees_and_fines_rec.issuing_date
         ,p_print_flag          => l_fees_and_fines_rec.print_flag
         ,p_borderdocument      => l_fees_and_fines_rec.borderdocument
         ,p_docno               => l_fees_and_fines_rec.docno
         ,p_tm6no               => l_form_no
         ,p_entry_form          => l_fees_and_fines_rec.entry_form
         ,p_person              => l_fees_and_fines_rec.person
         ,p_first_name          => l_fees_and_fines_rec.first_name
         ,p_last_name           => l_fees_and_fines_rec.last_name
         ,p_middle_name         => l_fees_and_fines_rec.middle_name
         ,p_thai_last_name      => l_fees_and_fines_rec.thai_last_name
         ,p_thai_first_name     => l_fees_and_fines_rec.thai_first_name
         ,p_sex                 => l_fees_and_fines_rec.sex
         ,p_date_of_birth       => l_fees_and_fines_rec.date_of_birth
         ,p_nationality         => l_fees_and_fines_rec.nationality
         ,p_trans_vehicles      => l_fees_and_fines_rec.trans_vehicles
         ,p_trans_number        => l_fees_and_fines_rec.trans_number
         ,p_arrival_date        => l_fees_and_fines_rec.arrival_date
         ,p_visa_type           => l_fees_and_fines_rec.visa_type
         ,p_visa_expiry_date    => l_fees_and_fines_rec.visa_expiry_date
         ,p_departure_date      => l_fees_and_fines_rec.departure_date
         ,p_status              => l_fees_and_fines_rec.status
         ,p_status_note         => l_fees_and_fines_rec.status_note
         ,p_owner               => l_fees_and_fines_rec.owner
         ,p_permit              => l_fees_and_fines_rec.permit
         ,p_permit_date         => l_fees_and_fines_rec.permit_date
         ,p_generation_status   => l_fees_and_fines_rec.generation_status
         ,p_salutation          => l_fees_and_fines_rec.salutation
         ,p_fee_or_fine         => l_fees_and_fines_rec.fee_or_fine
         ,p_ins_terminal        => l_fees_and_fines_rec.ins_terminal
         ,p_borderpost          => l_fees_and_fines_rec.ins_borderpost
         ,p_charge_number       => l_fees_and_fines_rec.charge_number);

    -- return saved values
    p_key_value := l_fees_and_fines_rec.key_value;
    p_booking_number := l_fees_and_fines_rec.booking_number;
    p_receipt_number := l_fees_and_fines_rec.receipt_number;

    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.append_param(l_params, 'p_booking_number', p_booking_number);
    logger.append_param(l_params, 'p_receipt_number', p_receipt_number);

    logger.log('SAVE FEE AND FINE (FEE EXCEPTION): done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('SAVE FEE AND FINE (FEE EXCEPTION): unhandled exeption', l_scope, null, l_params);
      RAISE;
  END save;

  /**
   * Calculates the total costs of a receipt / fees and fines entry
   * Needs to be in it's own function because of the changes that might have to be made
   * if the software is checked by the thai customer
   *
   * @p_key_value Primary Key of dl_bordercontrol.faf_fees_and_fines
   */
  PROCEDURE set_and_upd_total_costs (p_key_value IN faf_fees_and_fines.key_value%TYPE)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'set_and_upd_total_costs';
    l_params logger.tab_param;
    --
    l_result faf_fees_and_fines.total_costs%TYPE;

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);

    logger.log('SET AND UPD TOTAL COSTS: start', l_scope, null, l_params);

    SELECT SUM(costs)
      INTO l_result
      FROM dl_bordercontrol.faf_fees_and_fines_details
     WHERE costs IS NOT NULL
       AND fees_and_fines = p_key_value;

    logger.append_param(l_params, 'l_result', l_result);

    UPDATE dl_bordercontrol.faf_fees_and_fines
       SET total_costs = NVL(l_result, 0)
     WHERE key_value = p_key_value;

    logger.log('SET AND UPD TOTAL COSTS: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('UNHANDLED EXCEPTION: set and upd total costs', l_scope, null, l_params);
  END set_and_upd_total_costs;

  /**
   * Cancels the given fee or fine entry and saves the remark note
   *
   * @p_key_value Primary Key of dl_bordercontrol.faf_fees_and_fines
   * @p_remark    Note why this entry was cancelled
   */
  PROCEDURE cancel_fee_or_fine (p_key_value   IN faf_fees_and_fines.key_value%TYPE
                               ,p_remark      IN faf_fees_and_fines.status_note%TYPE)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'set_and_upd_total_costs';
    l_params logger.tab_param;
    --

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.append_param(l_params, 'p_remark'   , p_remark);

    logger.log('CANCEL FEE OR FINE: start', l_scope, null, l_params);

    UPDATE dl_bordercontrol.faf_fees_and_fines
       SET status       = c_status_cancelled
          ,status_note  = p_remark
     WHERE key_value = p_key_value;

    logger.log('CANCEL FEE OR FINE: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('UNHANDLED EXCEPTION: cancel fee or fine', l_scope, null, l_params);
  END cancel_fee_or_fine;

  /**
   * This function converts the information if Owner (aka working system), reference_entity
   * and reference_number to information and returns them to the fee and fine frontend so
   * all information for the receipt can be saved without filling them a second time
   *
   * The different reference entities / owners have to be implemented in this function
   *
   * p_owner
   * p_reference_entity
   * p_reference_number
   * x_print_flag
   * x_borderdocument
   * x_docno
   * x_tm6no
   * x_entry_form
   * x_person
   * x_first_name
   * x_last_name
   * x_middle_name
   * x_thai_last_name
   * x_thai_first_name
   * x_sex
   * x_date_of_birth
   * x_nationality
   * x_trans_vehicles
   * x_trans_number
   * x_arrival_date
   * x_visa_type
   * x_visa_expiry_date
   * x_departure_date
   * x_status
   * x_status_note
   * x_permit
   * x_permit_date
   * x_generation_status
   * x_salutation
   */
  PROCEDURE search_reference_data (p_owner              IN  faf_fees_and_fines.owner%TYPE
                                  ,p_reference_entity   IN  faf_fees_and_fines.reference_entity%TYPE
                                  ,p_reference_number   IN  faf_fees_and_fines.reference_number%TYPE
                                  ,x_print_flag         OUT faf_fees_and_fines.print_flag%TYPE
                                  ,x_borderdocument     OUT faf_fees_and_fines.borderdocument%TYPE
                                  ,x_docno              OUT faf_fees_and_fines.docno%TYPE
                                  ,x_tm6no              OUT entry_forms.form_no%TYPE
                                  ,x_entry_form         OUT faf_fees_and_fines.entry_form%TYPE
                                  ,x_person             OUT faf_fees_and_fines.person%TYPE
                                  ,x_first_name         OUT faf_fees_and_fines.first_name%TYPE
                                  ,x_last_name          OUT faf_fees_and_fines.last_name%TYPE
                                  ,x_middle_name        OUT faf_fees_and_fines.middle_name%TYPE
                                  ,x_thai_last_name     OUT faf_fees_and_fines.thai_last_name%TYPE
                                  ,x_thai_first_name    OUT faf_fees_and_fines.thai_first_name%TYPE
                                  ,x_sex                OUT faf_fees_and_fines.sex%TYPE
                                  ,x_date_of_birth      OUT faf_fees_and_fines.date_of_birth%TYPE
                                  ,x_nationality        OUT faf_fees_and_fines.nationality%TYPE
                                  ,x_trans_vehicles     OUT faf_fees_and_fines.trans_vehicles%TYPE
                                  ,x_trans_number       OUT faf_fees_and_fines.trans_number%TYPE
                                  ,x_arrival_date       OUT faf_fees_and_fines.arrival_date%TYPE
                                  ,x_visa_type          OUT faf_fees_and_fines.visa_type%TYPE
                                  ,x_visa_expiry_date   OUT faf_fees_and_fines.visa_expiry_date%TYPE
                                  ,x_departure_date     OUT faf_fees_and_fines.departure_date%TYPE
                                  ,x_status             OUT faf_fees_and_fines.status%TYPE
                                  ,x_status_note        OUT faf_fees_and_fines.status_note%TYPE
                                  ,x_permit             OUT faf_fees_and_fines.permit%TYPE
                                  ,x_permit_date        OUT faf_fees_and_fines.permit_date%TYPE
                                  ,x_generation_status  OUT faf_fees_and_fines.generation_status%TYPE
                                  ,x_salutation         OUT faf_fees_and_fines.salutation%TYPE)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'search_reference_data';
    l_params logger.tab_param;
    --
    l_statement VARCHAR2(4000 CHAR);
    --
    l_reference_entity  dl_bordercontrol.faf_fees_and_fines.reference_entity%TYPE := p_reference_entity;

  BEGIN

    logger.append_param(l_params, 'p_owner'            , p_owner);
    logger.append_param(l_params, 'p_reference_entity' , l_reference_entity);
    logger.append_param(l_params, 'p_reference_number' , p_reference_number);

    logger.log('SEARCH REFERENCE INFORMATION: start', l_scope, null, l_params);

    -- get information if owner = VOA
    IF p_owner = 'APEX_VOA'
    THEN

      -- set default value
      IF l_reference_entity IS NULL
      THEN
        l_reference_entity := 'VISAS.VISA_NUMBER';
      END IF;

      -- define statement
      l_statement := 'SELECT print_flag
                            ,borderdocument
                            ,docno
                            ,tm6_no
                            ,entry_form
                            ,person
                            ,first_name
                            ,last_name
                            ,middle_name
                            ,thai_last_name
                            ,thai_first_name
                            ,sex
                            ,date_of_birth
                            ,nationality
                            ,trans_vehicle
                            ,trans_number
                            ,arrival_date
                            ,visa_type
                            ,expiry_date
                            ,departure_date
                            ,permit
                            ,permit_date
                            ,salutation
                        FROM rep_faf_visas visas
                       WHERE ' || l_reference_entity || ' = ''' || p_reference_number || '''';

    -- get information if owner = REENTRY
    ELSIF p_owner = 'APEX_REENTRY'
    THEN
      -- set default value
      IF l_reference_entity IS NULL
      THEN
        l_reference_entity := 'TM8_APPLICATION.APPLICATION_NUMBER';
      END IF;

        -- define statement
        l_statement :=
        'SELECT ''Y'' as print_flag
      ,NULL as borderdocument
      ,PASSPORTNO as docno
      ,TM6_NUMBER
      ,NULL as entry_form
      ,PERSON_FK as person
      ,first_name
      ,last_name
      ,middle_name
      ,last_name as thai_last_name
      ,first_name as thai_first_name
      ,sex
      ,date_of_birth
      ,nationality
      ,TRANSPORTTYPE_SEQNO trans_vehicle
      ,NULL as trans_number
      ,ARRIVE_DATE as arrival_date
      ,VISAS.VISA_TYPE as visa_type
      ,ENDPERMIT_DATE as expiry_date
      ,NULL as departure_date
      ,NULL as permit
      ,NULL as permit_date
      ,salutation
      FROM TM8_APPLICATION,PERSON, VISAS
      WHERE TM8_APPLICATION.PERSON_FK = PERSON.KEY_VALUE AND TM8_APPLICATION.VISA_FK = VISAS.KEY_VALUE
      AND APPLICATION_NUMBER = ''' || p_reference_number || '''';

    -- THA20675-1011 : Integrate Fee and Fine
    -- Search Statement included
    ELSIF p_owner = 'APEX_EXTSTAY'
    THEN
      -- set default value
      IF l_reference_entity IS NULL
      THEN
        l_reference_entity := 'EXTSTAY_FAF_SEARCH_V.APPLICATION_NUMBER';
      END IF;
        l_statement := '
SELECT PRINT_FLAG
     , BORDERDOCUMENT
     , DOCNO
     , TM6_NUMBER
     , ENTRY_FORM
     , PERSON
     , FIRST_NAME
     , LAST_NAME
     , MIDDLE_NAME
     , THAI_LAST_NAME
     , THAI_FIRST_NAME
     , SEX
     , DATE_OF_BIRTH
     , NATIONALITY
     , TRANS_VEHICLE
     , TRANS_NUMBER
     , ARRIVAL_DATE
     , VISA_TYPE
     , EXPIRY_DATE
     , DEPARTURE_DATE
     , PERMIT
     , PERMIT_DATE
     , SALUTATION
  FROM DL_BORDERCONTROL.EXTSTAY_FAF_SEARCH_V
 where APPLICATION_NUMBER = ''' || p_reference_number || '''';
    END IF;

    -- execute sql statement
    IF l_statement IS NOT NULL
    THEN

      EXECUTE IMMEDIATE l_statement
         INTO  x_print_flag
              ,x_borderdocument
              ,x_docno
              ,x_tm6no
              ,x_entry_form
              ,x_person
              ,x_first_name
              ,x_last_name
              ,x_middle_name
              ,x_thai_last_name
              ,x_thai_first_name
              ,x_sex
              ,x_date_of_birth
              ,x_nationality
              ,x_trans_vehicles
              ,x_trans_number
              ,x_arrival_date
              ,x_visa_type
              ,x_visa_expiry_date
              ,x_departure_date
              ,x_permit
              ,x_permit_date
              ,x_salutation;

    END IF;

    logger.log('SEARCH REFERENCE INFORMATION: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('SEARCH REFERENCE INFORMATION: unhandled exception', l_scope, null, l_params);
  END search_reference_data;

  /**
   * This function searches the data of a fees_and_fines dataset by the given primary key
   *
   * p_key_value
   * x_print_flag
   * x_borderdocument
   * x_docno
   * x_tm6no
   * x_entry_form
   * x_person
   * x_first_name
   * x_last_name
   * x_middle_name
   * x_thai_last_name
   * x_thai_first_name
   * x_sex
   * x_date_of_birth
   * x_nationality
   * x_trans_vehicles
   * x_trans_number
   * x_arrival_date
   * x_visa_type
   * x_visa_expiry_date
   * x_departure_date
   * x_status
   * x_status_note
   * x_permit
   * x_permit_date
   * x_generation_status
   * x_salutation
   */
  PROCEDURE fetch_data (p_key_value          IN  faf_fees_and_fines.key_value%TYPE
                       ,x_print_flag         OUT faf_fees_and_fines.print_flag%TYPE
                       ,x_borderdocument     OUT faf_fees_and_fines.borderdocument%TYPE
                       ,x_docno              OUT faf_fees_and_fines.docno%TYPE
                       ,x_tm6no              OUT entry_forms.form_no%TYPE
                       ,x_entry_form         OUT faf_fees_and_fines.entry_form%TYPE
                       ,x_person             OUT faf_fees_and_fines.person%TYPE
                       ,x_first_name         OUT faf_fees_and_fines.first_name%TYPE
                       ,x_last_name          OUT faf_fees_and_fines.last_name%TYPE
                       ,x_middle_name        OUT faf_fees_and_fines.middle_name%TYPE
                       ,x_thai_last_name     OUT faf_fees_and_fines.thai_last_name%TYPE
                       ,x_thai_first_name    OUT faf_fees_and_fines.thai_first_name%TYPE
                       ,x_sex                OUT faf_fees_and_fines.sex%TYPE
                       ,x_date_of_birth      OUT faf_fees_and_fines.date_of_birth%TYPE
                       ,x_nationality        OUT faf_fees_and_fines.nationality%TYPE
                       ,x_trans_vehicles     OUT faf_fees_and_fines.trans_vehicles%TYPE
                       ,x_trans_number       OUT faf_fees_and_fines.trans_number%TYPE
                       ,x_arrival_date       OUT faf_fees_and_fines.arrival_date%TYPE
                       ,x_visa_type          OUT faf_fees_and_fines.visa_type%TYPE
                       ,x_visa_expiry_date   OUT faf_fees_and_fines.visa_expiry_date%TYPE
                       ,x_departure_date     OUT faf_fees_and_fines.departure_date%TYPE
                       ,x_status             OUT faf_fees_and_fines.status%TYPE
                       ,x_status_note        OUT faf_fees_and_fines.status_note%TYPE
                       ,x_permit             OUT faf_fees_and_fines.permit%TYPE
                       ,x_permit_date        OUT faf_fees_and_fines.permit_date%TYPE
                       ,x_generation_status  OUT faf_fees_and_fines.generation_status%TYPE -- AUTO / MANU
                       ,x_salutation         OUT faf_fees_and_fines.salutation%TYPE
                       ,x_working_system     OUT faf_fees_and_fines.owner%TYPE
                       ,x_reference_number   OUT faf_fees_and_fines.reference_number%TYPE
                       ,x_reference_entity   OUT faf_fees_and_fines.reference_entity%TYPE
                       ,x_booking_number     OUT faf_fees_and_fines.booking_number%TYPE
                       ,x_receipt_number     OUT faf_fees_and_fines.receipt_number%TYPE
                       ,x_fee_or_fine        OUT faf_fees_and_fines.fee_or_fine%TYPE)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'fetch';
    l_params logger.tab_param;
    --
    l_receipt_rec   faf_fees_and_fines%ROWTYPE;

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);

    logger.log('SEARCH AND FETCH INFORMATION: start', l_scope, null, l_params);

    -- search information
    fetch_data (p_key_value          => p_key_value
               ,x_print_flag         => x_print_flag
               ,x_borderdocument     => x_borderdocument
               ,x_docno              => x_docno
               ,x_tm6no              => x_tm6no
               ,x_entry_form         => x_entry_form
               ,x_person             => x_person
               ,x_first_name         => x_first_name
               ,x_last_name          => x_last_name
               ,x_middle_name        => x_middle_name
               ,x_thai_last_name     => x_thai_last_name
               ,x_thai_first_name    => x_thai_first_name
               ,x_sex                => x_sex
               ,x_date_of_birth      => x_date_of_birth
               ,x_nationality        => x_nationality
               ,x_trans_vehicles     => x_trans_vehicles
               ,x_trans_number       => x_trans_number
               ,x_arrival_date       => x_arrival_date
               ,x_visa_type          => x_visa_type
               ,x_visa_expiry_date   => x_visa_expiry_date
               ,x_departure_date     => x_departure_date
               ,x_status             => x_status
               ,x_status_note        => x_status_note
               ,x_permit             => x_permit
               ,x_permit_date        => x_permit_date
               ,x_generation_status  => x_generation_status
               ,x_salutation         => x_salutation
               ,x_working_system     => x_working_system
               ,x_reference_number   => x_reference_number
               ,x_reference_entity   => x_reference_entity
               ,x_booking_number     => x_booking_number
               ,x_receipt_number     => x_receipt_number
               ,x_fee_or_fine        => x_fee_or_fine
               ,x_issuing_date       => l_receipt_rec.issuing_date
               ,x_total_costs        => l_receipt_rec.total_costs);

    logger.log('SEARCH AND FETCH INFORMATION: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('UNHANDLED EXCEPTION', l_scope, null, l_params);
  END fetch_data;

  /**
   * This function searches the data of a fees_and_fines dataset by the given primary key
   *
   * p_key_value
   * x_print_flag
   * x_borderdocument
   * x_docno
   * x_tm6no
   * x_entry_form
   * x_person
   * x_first_name
   * x_last_name
   * x_middle_name
   * x_thai_last_name
   * x_thai_first_name
   * x_sex
   * x_date_of_birth
   * x_nationality
   * x_trans_vehicles
   * x_trans_number
   * x_arrival_date
   * x_visa_type
   * x_visa_expiry_date
   * x_departure_date
   * x_status
   * x_status_note
   * x_permit
   * x_permit_date
   * x_generation_status
   * x_salutation
   * x_issuing_date
   * x_total_costs
   */
  PROCEDURE fetch_data (p_key_value          IN  faf_fees_and_fines.key_value%TYPE
                       ,x_print_flag         OUT faf_fees_and_fines.print_flag%TYPE
                       ,x_borderdocument     OUT faf_fees_and_fines.borderdocument%TYPE
                       ,x_docno              OUT faf_fees_and_fines.docno%TYPE
                       ,x_tm6no              OUT entry_forms.form_no%TYPE
                       ,x_entry_form         OUT faf_fees_and_fines.entry_form%TYPE
                       ,x_person             OUT faf_fees_and_fines.person%TYPE
                       ,x_first_name         OUT faf_fees_and_fines.first_name%TYPE
                       ,x_last_name          OUT faf_fees_and_fines.last_name%TYPE
                       ,x_middle_name        OUT faf_fees_and_fines.middle_name%TYPE
                       ,x_thai_last_name     OUT faf_fees_and_fines.thai_last_name%TYPE
                       ,x_thai_first_name    OUT faf_fees_and_fines.thai_first_name%TYPE
                       ,x_sex                OUT faf_fees_and_fines.sex%TYPE
                       ,x_date_of_birth      OUT faf_fees_and_fines.date_of_birth%TYPE
                       ,x_nationality        OUT faf_fees_and_fines.nationality%TYPE
                       ,x_trans_vehicles     OUT faf_fees_and_fines.trans_vehicles%TYPE
                       ,x_trans_number       OUT faf_fees_and_fines.trans_number%TYPE
                       ,x_arrival_date       OUT faf_fees_and_fines.arrival_date%TYPE
                       ,x_visa_type          OUT faf_fees_and_fines.visa_type%TYPE
                       ,x_visa_expiry_date   OUT faf_fees_and_fines.visa_expiry_date%TYPE
                       ,x_departure_date     OUT faf_fees_and_fines.departure_date%TYPE
                       ,x_status             OUT faf_fees_and_fines.status%TYPE
                       ,x_status_note        OUT faf_fees_and_fines.status_note%TYPE
                       ,x_permit             OUT faf_fees_and_fines.permit%TYPE
                       ,x_permit_date        OUT faf_fees_and_fines.permit_date%TYPE
                       ,x_generation_status  OUT faf_fees_and_fines.generation_status%TYPE -- AUTO / MANU
                       ,x_salutation         OUT faf_fees_and_fines.salutation%TYPE
                       ,x_working_system     OUT faf_fees_and_fines.owner%TYPE
                       ,x_reference_number   OUT faf_fees_and_fines.reference_number%TYPE
                       ,x_reference_entity   OUT faf_fees_and_fines.reference_entity%TYPE
                       ,x_booking_number     OUT faf_fees_and_fines.booking_number%TYPE
                       ,x_receipt_number     OUT faf_fees_and_fines.receipt_number%TYPE
                       ,x_fee_or_fine        OUT faf_fees_and_fines.fee_or_fine%TYPE
                       ,x_issuing_date       OUT faf_fees_and_fines.issuing_date%TYPE
                       ,x_total_costs        OUT faf_fees_and_fines.total_costs%TYPE)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'fetch';
    l_params logger.tab_param;
    --

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);

    logger.log('SEARCH AND FETCH INFORMATION: start', l_scope, null, l_params);

    -- search information
    SELECT faf.print_flag
          ,faf.borderdocument
          ,faf.docno
          ,frm.form_no
          ,faf.entry_form
          ,faf.person
          ,faf.first_name
          ,faf.last_name
          ,faf.middle_name
          ,faf.thai_last_name
          ,faf.thai_first_name
          ,faf.sex
          ,faf.date_of_birth
          ,faf.nationality
          ,faf.trans_vehicles
          ,faf.trans_number
          ,faf.arrival_date
          ,faf.visa_type
          ,faf.visa_expiry_date
          ,faf.departure_date
          ,faf.status
          ,faf.status_note
          ,faf.permit
          ,faf.permit_date
          ,faf.generation_status
          ,faf.salutation
          ,faf.owner
          ,faf.reference_number
          ,faf.reference_entity
          ,faf.booking_number
          ,faf.receipt_number
          ,faf.fee_or_fine
          ,faf.issuing_date
          ,faf.total_costs
      INTO x_print_flag
          ,x_borderdocument
          ,x_docno
          ,x_tm6no
          ,x_entry_form
          ,x_person
          ,x_first_name
          ,x_last_name
          ,x_middle_name
          ,x_thai_last_name
          ,x_thai_first_name
          ,x_sex
          ,x_date_of_birth
          ,x_nationality
          ,x_trans_vehicles
          ,x_trans_number
          ,x_arrival_date
          ,x_visa_type
          ,x_visa_expiry_date
          ,x_departure_date
          ,x_status
          ,x_status_note
          ,x_permit
          ,x_permit_date
          ,x_generation_status
          ,x_salutation
          ,x_working_system
          ,x_reference_number
          ,x_reference_entity
          ,x_booking_number
          ,x_receipt_number
          ,x_fee_or_fine
          ,x_issuing_date
          ,x_total_costs
      FROM dl_bordercontrol.faf_fees_and_fines faf
      LEFT JOIN dl_bordercontrol.entry_forms frm ON faf.entry_form = frm.key_value
     WHERE faf.key_value = p_key_value;

    logger.log('SEARCH AND FETCH INFORMATION: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('UNHANDLED EXCEPTION', l_scope, null, l_params);
  END fetch_data;

  /**
   * This function searches the fee and fine information with the given key_value
   * Returns a record of faf_fees_and_fines with all result information
   * Should replace the other functions because it's easier to handle and changes or
   * new columns can implemented easier
   *
   * @param i_key_value Column key_value of table dl_bordercontrol.faf_fees_and_fines
   * @return fee_or_fine_typ Record with all relevant information
   */
  FUNCTION get_fee_or_fine_by_pk (i_key_value	IN faf_fees_and_fines.key_value%TYPE)
  RETURN fee_or_fine_typ
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'get_fee_or_fine_by_pk';
    l_params logger.tab_param;
    --
    l_result  fee_or_fine_typ;

  BEGIN

    logger.append_param(l_params, 'i_key_value', i_key_value);
    logger.log('GET FEE OR FINE RECORD BY PK: start', l_scope, null, l_params);

    SELECT *
      INTO l_result
      FROM faf_fees_and_fines
     WHERE key_value = i_key_value;

    logger.log('GET FEE OR FINE RECORD BY PK: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('GET FEE OR FINE RECORD BY PK: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END get_fee_or_fine_by_pk;

  /**
   * This function provides the search of existing fee and fine entries
   *
   * @p_docno
   * @p_tm6no
   * @p_last_name
   * @p_first_name
   * @p_middle_name
   * @p_sex
   * @p_date_of_birth
   * @p_nationality
   * @p_borderpost
   * @p_terminal
   * @p_reference_number
   * @p_receipt_number_from
   * @p_receipt_number_to
   * @p_fee
   * @p_fine
   * @p_issuing_date_from
   * @p_issuing_date_to
   * @p_status
   * @p_receipt_type
   * @p_fee_or_fine
   *
   * @return VARCHAR2: SQL Statement to search for data
   */
  -- TODO: secure variables
  FUNCTION search (p_docno                IN faf_fees_and_fines.docno%TYPE
                  ,p_tm6no                IN entry_forms.form_no%TYPE
                  ,p_last_name            IN faf_fees_and_fines.last_name%TYPE
                  ,p_first_name           IN faf_fees_and_fines.first_name%TYPE
                  ,p_middle_name          IN faf_fees_and_fines.middle_name%TYPE
                  ,p_sex                  IN faf_fees_and_fines.sex%TYPE
                  ,p_date_of_birth        IN faf_fees_and_fines.date_of_birth%TYPE
                  ,p_nationality          IN faf_fees_and_fines.nationality%TYPE
                  ,p_borderpost           IN faf_fees_and_fines.ins_borderpost%TYPE
                  ,p_terminal             IN faf_fees_and_fines.ins_terminal%TYPE
                  ,p_reference_number     IN faf_fees_and_fines.reference_number%TYPE
                  ,p_receipt_number_from  IN faf_fees_and_fines.receipt_number%TYPE
                  ,p_receipt_number_to    IN faf_fees_and_fines.receipt_number%TYPE
                  ,p_fee                  IN faf_payment_rate.key_value%TYPE
                  ,p_fine                 IN faf_payment_rate.key_value%TYPE
                  ,p_issuing_date_from    IN faf_fees_and_fines.issuing_date%TYPE
                  ,p_issuing_date_to      IN faf_fees_and_fines.issuing_date%TYPE
                  ,p_status               IN faf_fees_and_fines.status%TYPE
                  ,p_receipt_type         IN faf_fees_and_fines.generation_status%TYPE
                  ,p_fee_or_fine          IN VARCHAR2)
  RETURN VARCHAR2
  IS

    l_statement VARCHAR2(32000 CHAR);
    --
    l_scope logger_logs.scope%type := c_scope_prefix || 'search_reference_data';
    l_params logger.tab_param;

  BEGIN

    logger.append_param(l_params, 'p_docno'               , p_docno);
    logger.append_param(l_params, 'p_tm6no'               , p_tm6no);
    logger.append_param(l_params, 'p_last_name'           , p_last_name);
    logger.append_param(l_params, 'p_first_name'          , p_first_name);
    logger.append_param(l_params, 'p_middle_name'         , p_middle_name);
    logger.append_param(l_params, 'p_sex'                 , p_sex);
    logger.append_param(l_params, 'p_date_of_birth'       , p_date_of_birth);
    logger.append_param(l_params, 'p_nationality'         , p_nationality);
    logger.append_param(l_params, 'p_borderpost'          , p_borderpost);
    logger.append_param(l_params, 'p_terminal'            , p_terminal);
    logger.append_param(l_params, 'p_reference_number'    , p_reference_number);
    logger.append_param(l_params, 'p_receipt_number_from' , p_receipt_number_from);
    logger.append_param(l_params, 'p_receipt_number_to'   , p_receipt_number_to);
    logger.append_param(l_params, 'p_fee'                 , p_fee);
    logger.append_param(l_params, 'p_fine'                , p_fine);
    logger.append_param(l_params, 'p_issuing_date_from'   , p_issuing_date_from);
    logger.append_param(l_params, 'p_issuing_date_to'     , p_issuing_date_to);
    logger.append_param(l_params, 'p_status'              , p_status);
    logger.append_param(l_params, 'p_receipt_type'        , p_receipt_type);
    logger.append_param(l_params, 'p_fee_or_fine'         , p_fee_or_fine);

    logger.log('SEARCH FEE OR FINE: start', l_scope, null, l_params);

    l_statement := 'SELECT rwnum
                          ,receipt_number
                          ,payment_rate
                          ,docno
                          ,name
                          ,sex
                          ,date_of_birth
                          ,nationality
                          ,issuing_date
                          ,total_costs
                          ,status
                          ,key_value
                          ,CASE status
                            WHEN ''CANCEL'' THEN ''apex_disabled''
                            ELSE NULL
                           END AS cancel_attribute
                          ,CASE status
                            WHEN ''CANCEL'' THEN ''apex_disabled''
                            ELSE NULL
                           END AS print_attribute
                          ,CASE status
                            WHEN ''CANCEL'' THEN ''red''
                            ELSE NULL
                           END AS report_row_color
                          ,dl_bordercontrol.pkg_apex_fee_and_fine.get_receipt_link(key_value) AS print_link
                      FROM rep_faf_fees_and_fines src
                     WHERE 1 = 1';

    -- filter fee_or_fine
    IF p_fee_or_fine IS NOT NULL
    THEN
      l_statement := l_statement || ' AND fee_or_fine = ''' || p_fee_or_fine || '''';
    END IF;


    -- filter docno / passport number
    IF p_docno IS NOT NULL
    THEN
      l_statement := l_statement || ' AND UPPER(docno) LIKE ''%' || UPPER(p_docno) || '%''';
    END IF;

    -- filter tm6no
    IF p_docno IS NOT NULL
    THEN
      l_statement := l_statement || ' AND UPPER(tm6no) LIKE ''%' || UPPER(p_tm6no) || '%''';
    END IF;

    -- filter last_name
    IF p_last_name IS NOT NULL
    THEN
      l_statement := l_statement || ' AND UPPER(last_name) LIKE ''%' || UPPER(p_last_name) || '%''';
    END IF;

    -- filter first_name
    IF p_first_name IS NOT NULL
    THEN
      l_statement := l_statement || ' AND UPPER(first_name) LIKE ''%' || UPPER(p_first_name) || '%''';
    END IF;

    -- filter middle_name
    IF p_middle_name IS NOT NULL
    THEN
      l_statement := l_statement || ' AND UPPER(middle_name) LIKE ''%' || UPPER(p_middle_name) || '%''';
    END IF;

    -- filter sex
    IF p_sex IS NOT NULL
    THEN
      l_statement := l_statement || ' AND sex = ''' || p_sex || '''';
    END IF;

    -- filter date_of_birth
    IF p_date_of_birth IS NOT NULL
    THEN
      l_statement := l_statement || ' AND date_of_birth = ''' || p_date_of_birth || '''';
    END IF;

    -- filter nationality
    IF p_nationality IS NOT NULL
    THEN
      l_statement := l_statement || ' AND nationality = ''' || p_nationality || '''';
    END IF;

    -- filter borderpost
    IF p_borderpost IS NOT NULL
    THEN
      l_statement := l_statement || ' AND ins_borderpost = ''' || p_borderpost || '''';
    END IF;

    -- filter terminal
    IF p_terminal IS NOT NULL
    THEN
      l_statement := l_statement || ' AND ins_terminal = ''' || p_terminal || '''';
    END IF;

    -- filter reference_number
    IF p_reference_number IS NOT NULL
    THEN
      l_statement := l_statement || ' AND UPPER(reference_number) LIKE ''%' || UPPER(p_reference_number) || '%''';
    END IF;

    -- filter receipt_number_from from
    IF p_receipt_number_from IS NOT NULL
    THEN
      l_statement := l_statement || ' AND search_receipt_number >= ' || TO_NUMBER(p_receipt_number_from);
    END IF;

    -- filter receipt_number_to from
    IF p_receipt_number_to IS NOT NULL
    THEN
      l_statement := l_statement || ' AND search_receipt_number <= ' || TO_NUMBER(p_receipt_number_to);
    END IF;

    -- filter fee payment rate
    IF p_fee IS NOT NULL
    THEN
      l_statement := l_statement || ' AND EXISTS(SELECT 1 FROM dl_bordercontrol.faf_fees_and_fines_details WHERE fees_and_fines = src.key_value AND payment_rate = ''' || p_fee || ''')';
    END IF;

    -- filter fine payment rate
    IF p_fine IS NOT NULL
    THEN
      l_statement := l_statement || ' AND EXISTS(SELECT 1 FROM dl_bordercontrol.faf_fees_and_fines_details WHERE fees_and_fines = src.key_value AND payment_rate = ''' || p_fine || ''')';
    END IF;

    -- filter issuing date from
    IF p_issuing_date_from IS NOT NULL
    THEN
      l_statement := l_statement || ' AND issuing_date >= ''' || p_issuing_date_from || '''';
    END IF;

    -- filter issuing date to
    IF p_issuing_date_to IS NOT NULL
    THEN
      l_statement := l_statement || ' AND issuing_date <= ''' || p_issuing_date_to || '''';
    END IF;

    -- filter status
    IF p_status IS NOT NULL
    THEN
      l_statement := l_statement || ' AND status = ''' || p_status || '''';
    END IF;

    -- filter receipt_type / generation_status
    IF p_receipt_type IS NOT NULL
    THEN
      l_statement := l_statement || ' AND generation_status = ''' || p_receipt_type || '''';
    END IF;

    logger.append_param(l_params, 'l_statement', l_statement);

    logger.log('SEARCH FEE OR FINE: done', l_scope, null, l_params);

    RETURN l_statement;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('UNHANDLED EXCEPTION: search fee or fine', l_scope, null, l_params);
  END search;

  /**
   * Generates the receipt file / document on the same page
   * !! Stops the APEX rendering engine !!
   *
   * @param p_key_value Primary key of table DL_BORDERCONTROL.FAF_FEES_AND_FINES
   */
  -- TODO: implement report for fees
  PROCEDURE print_receipt (p_key_value     IN faf_fees_and_fines.key_value%TYPE)
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'print_receipt';
    l_params logger.tab_param;
    --
    l_jasperreport_server   VARCHAR2(500 CHAR) := pkg_apex_util.get_server_url() || pkg_common.get_parameter(c_report_link_param);
    --
    l_fee_or_fine           dl_bordercontrol.faf_fees_and_fines.fee_or_fine%TYPE;
    l_report                VARCHAR2(100 CHAR);

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.append_param(l_params, 'l_jasperreport_server', l_jasperreport_server);
    logger.log('PRINT RECEIPT IN APEX: start', l_scope, null, l_params);

    SELECT fee_or_fine
      INTO l_fee_or_fine
      FROM dl_bordercontrol.faf_fees_and_fines
     WHERE key_value = p_key_value;

    logger.append_param(l_params, 'l_fee_or_fine', l_fee_or_fine);

    CASE l_fee_or_fine
      WHEN 'FEE'  THEN l_report := c_receipt_fee_report;
      WHEN 'FINE' THEN l_report := c_receipt_fine_report;
      ELSE NULL;
    END CASE;

    jasper_reporting.xlib_jasperreports.set_report_url(l_jasperreport_server);
    jasper_reporting.xlib_jasperreports.show_report (p_rep_name           => l_report
                                                    ,p_rep_format         => c_report_format
                                                    ,p_data_source        => c_report_datasource
                                                    ,p_rep_locale         => c_report_locale
                                                    ,p_rep_encoding       => c_report_encoding
                                                    ,p_additional_params  => 'IN_VISA_KEY_VALUE=' || p_key_value);
    apex_application.stop_apex_engine;

    logger.log('PRINT RECEIPT IN APEX: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('PRINT RECEIPT IN APEX: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END print_receipt;

  /**
   * Returns the receipt file (fee or fine) as BLOB datatype
   *
   * @param p_key_value Primary key of table DL_BORDERCONTROL.FAF_FEES_AND_FINES
   * @return BLOB receipt file (PDF-format)
   */
  -- TODO: implement report for fees
  FUNCTION print_receipt (p_key_value IN faf_fees_and_fines.key_value%TYPE)
  RETURN BLOB
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'print_receipt';
    l_params logger.tab_param;
    --
    l_jasperreport_server   VARCHAR2(500 CHAR) := pkg_apex_util.get_server_url() || pkg_common.get_parameter(c_report_link_param);
    l_result_blob           BLOB;
    l_result_mime           VARCHAR2(250 CHAR);
    --
    l_fee_or_fine           dl_bordercontrol.faf_fees_and_fines.fee_or_fine%TYPE;
    l_report                VARCHAR2(100 CHAR);

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.append_param(l_params, 'l_jasperreport_server', l_jasperreport_server);
    logger.log('PRINT RECEIPT AS BLOB: start', l_scope, null, l_params);

    SELECT fee_or_fine
      INTO l_fee_or_fine
      FROM dl_bordercontrol.faf_fees_and_fines
     WHERE key_value = p_key_value;

    logger.append_param(l_params, 'l_fee_or_fine', l_fee_or_fine);

    CASE l_fee_or_fine
      WHEN 'FEE'  THEN l_report := c_receipt_fee_report;
      WHEN 'FINE' THEN l_report := c_receipt_fine_report;
      ELSE NULL;
    END CASE;

    jasper_reporting.xlib_jasperreports.set_report_url(l_jasperreport_server);
    jasper_reporting.xlib_jasperreports.get_report (p_rep_name           => l_report
                                                   ,p_rep_format         => c_report_format
                                                   ,p_data_source        => c_report_datasource
                                                   ,p_rep_locale         => c_report_locale
                                                   ,p_rep_encoding       => c_report_encoding
                                                   ,p_additional_params  => 'IN_VISA_KEY_VALUE=' || p_key_value
                                                   ,p_out_blob           => l_result_blob
                                                   ,p_out_mime_type      => l_result_mime);

    logger.log('PRINT RECEIPT AS BLOB: done', l_scope, null, l_params);

    RETURN l_result_blob;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('PRINT RECEIPT AS BLOB: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END print_receipt;

  /**
   * Returns the URL to open the popup with the fees and fines document
   * @param p_key_value Primary key of dl_bordercontrol.faf_fees_and_fines table
   */
  FUNCTION get_receipt_link (p_key_value   IN faf_fees_and_fines.key_value%TYPE)
  RETURN VARCHAR2
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'get_receipt_link';
    l_params logger.tab_param;
    --
    l_url             VARCHAR2(255 CHAR);
    l_set_normal_mode BOOLEAN := FALSE;

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.log('GET RECEIPT URL: start', l_scope, null, l_params);

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

    logger.log('GET RECEIPT URL: done', l_scope, null, l_params);
    RETURN l_url;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log('GET RECEIPT URL: unhandled error', l_scope, null, l_params);
  END get_receipt_link;

  /**
   * Returns the prepared URL for the fee and fine modal dialog that should be opened
   * If fee exception is set to 'Y' a smaller (faster) version of the modal dialog will open
   *
   * @param p_key_value Primary key of the table DL_BORDERCONTROL.FAF_FEES_AND_FINES
   * @param p_fee_and_fine Describes if there should be generated a fee or a fine receipt (valid values: FEE / FINE)
   * @param p_reference_entity Defines the referenced entity of the reference_number (for example for VISA number -> VISAS.VISA_NUMBER); this is the most flexible solution to connect the original references to this receipt
   * @param p_reference_number Defines the reference_number of this receipt (the reference number is for example the original VISA number this receipt was generated from); has to be defined together with column reference_entity
   * @param p_owner FK dl_bordercontrol.owners (defines the application which is the working system for this fee or fine entry)
   * @param p_print_flag Defines if the receipt was printed (Y.es, N.o)
   * @param p_fee_exception Defines if the receipt should not be created (this option created a receipt without any positions and with 0 costs) (valid values: Y / N)
   * @return VARCHAR2 Prepared URL to the modal dialog
   */
  FUNCTION prepare_form_url (p_key_value        IN faf_fees_and_fines.key_value%TYPE
                            ,p_fee_or_fine      IN faf_fees_and_fines.fee_or_fine%TYPE
                            ,p_reference_entity IN faf_fees_and_fines.reference_entity%TYPE
                            ,p_reference_number IN faf_fees_and_fines.reference_number%TYPE
                            ,p_owner            IN faf_fees_and_fines.owner%TYPE
                            ,p_print_flag       IN faf_fees_and_fines.print_flag%TYPE DEFAULT 'Y'
                            ,p_fee_exception    IN CHAR DEFAULT 'N')
  RETURN VARCHAR2
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'prepare_form_url';
    l_params logger.tab_param;
    --
    l_result  VARCHAR2(4000 CHAR);

  BEGIN

    logger.append_param(l_params, 'p_key_value', p_key_value);
    logger.append_param(l_params, 'p_fee_or_fine', p_fee_or_fine);
    logger.append_param(l_params, 'p_reference_entity', p_reference_entity);
    logger.append_param(l_params, 'p_reference_number', p_reference_number);
    logger.append_param(l_params, 'p_owner', p_owner);
    logger.append_param(l_params, 'p_print_flag', p_print_flag);
    logger.append_param(l_params, 'p_fee_exception', p_fee_exception);

    logger.log('PREPARE FROM URL: start', l_scope, null, l_params);

    IF p_key_value IS NOT NULL
    THEN

      l_result := APEX_UTIL.PREPARE_URL(p_url => 'f?p=FEENFINE:10:'|| apex_application.g_instance
                                  ||'::NO:10:P10_KEY_VALUE:' || p_key_value);
    ELSIF NVL(p_fee_exception, 'N') = 'N'
    THEN

      l_result := APEX_UTIL.PREPARE_URL(p_url => 'f?p=FEENFINE:10:'|| apex_application.g_instance
                                 ||'::NO:10:P10_FEE_OR_FINE'
                                 || ',P10_REFERENCE_ENTITY'
                                 || ',P10_WORKING_SYSTEM'
                                 || ',P10_NUMBER_REFERENCE'
                                 || ',P10_PRINT_RECEIPT'
                                 || ':' || p_fee_or_fine
                                 || ',' || p_reference_entity
                                 || ',' || p_owner
                                 || ',' || p_reference_number
                                 || ',' || p_print_flag);

    ELSIF p_fee_exception = 'Y'
    THEN

      l_result := APEX_UTIL.PREPARE_URL(p_url => 'f?p=FEENFINE:50:'|| apex_application.g_instance
                                 ||'::NO:50,10:P50_FEE_OR_FINE'
                                 || ',P50_REFERENCE_ENTITY'
                                 || ',P50_WORKING_SYSTEM'
                                 || ',P50_NUMBER_REFERENCE'
                                 || ',P50_PRINT_RECEIPT'
                                 || ':' || p_fee_or_fine
                                 || ',' || p_reference_entity
                                 || ',' || p_owner
                                 || ',' || p_reference_number
                                 || ',' || p_print_flag);

    ELSE

      NULL;
    END IF;

    logger.append_param(l_params, 'l_result', l_result);
    logger.log('PREPARE FROM URL: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('PREPARE FROM URL: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END prepare_form_url;

END;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_APEX_FEE_AND_FINE" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_APEX_FEE_AND_FINE" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_APEX_FEE_AND_FINE" TO "BIOSUPPORT";
