CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_APEX_FEE_AND_FINE" IS

 /*******************************************************************************
  * This package provides a service for saving the data of the Fees and Fines
  * APEX application
  * It is used to set all parameters from the frontend to this PL/SQL package
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * CHageman  28.06.2018  Added function to save 0 Bath receipts (at Fee Exception)
  * CHageman  16.06.2018  Added additional fetch function with more information
  * CHageman  08.05.2018  Added function get_receipt_link
  * CHageman  04.05.2018  Added function and procedure print_receipt
  * CHageman  13.04.2018  Added comments and documentation and changed get_payment_rates to procedure
  * CHageman  10.04.2018  Added
  *******************************************************************************/

  /****************************************
   * ========== TYPE DEFINITIONS ==========
   ****************************************/

  c_collection_payment_rates CONSTANT VARCHAR2(255 CHAR) := 'FAF_PAYMENT_RATES';
  SUBTYPE fee_or_fine_typ IS faf_fees_and_fines%ROWTYPE;

  /************************************************
   * ========== FUNCTIONS AND PROCEDURES ==========
   ************************************************/

  /**
   * This function gets and returns the next booking number
   *
   * @return VARCHAR2: Next booking number
   */
  FUNCTION get_next_booking_number
  RETURN faf_fees_and_fines.booking_number%TYPE;

  /**
   * This function gets and returns the next receipt number
   *
   * @return VARCHAR2: Next receipt number
   */
  FUNCTION get_next_receipt_number
  RETURN faf_fees_and_fines.receipt_number%TYPE;

  /**
   * Initializes the collection c_collection_payment_rates
   * Also provides an empty collection (apex_collection package) if its already filled
   * and used
   */
  PROCEDURE init_collection;

  /**
   * Deletes the collection c_collection_payment_rates with apex_collection package
   */
  PROCEDURE del_collection;

  /**
   * Adds a new entry to the collection c_collection_payment_rates
   * Uses the apex_collection package
   *
   * @p_key_value  Primary key of the payment_rate
   */
  PROCEDURE add_collection_entry (p_key_value IN VARCHAR2);

  /**
   * Removes an entry from the collection c_collection_payment_rates
   * Uses the apex_collection package
   *
   * @p_seq_id  Unique number of collection entry
   */
  PROCEDURE del_collection_entry (p_seq_id  IN NUMBER);

  /**
   * Extracts collection entries from Report with checkboxes to provide
   * that the chosen payment rates are added to the collection c_collection_payment_rates
   * Uses the apex_collection package and the g_f01 apex array
   */
  PROCEDURE get_payment_rates;

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
                                ,p_overstayed_days        IN NUMBER DEFAULT 0);

  /**
   * Fetches the detailed payment rate information from the given fees and fines structure
   * and adds the different entries to the given collection
   *
   * @p_key_value Primary Key of table dl_bordercontrol.faf_fees_and_fines
   */
  PROCEDURE fetch_col_payment_rate (p_key_value IN faf_fees_and_fines.key_value%TYPE);

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
   * @p_visa_type         Fine field only
   * @p_visa_expiry_date  Fine field only
   * @p_departure_date
   * @p_status
   * @p_status_note
   * @p_owner
   * @p_permit          Fine field only
   * @p_permit_date     Fine field only
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
                 ,p_charge_number       IN faf_fees_and_fines.charge_number%TYPE);

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
                 ,p_ins_borderpost    IN faf_fees_and_fines.ins_borderpost%TYPE);

  /**
   * Calculates the total costs of a receipt / fees and fines entry
   * Needs to be in it's own function because of the changes that might have to be made
   * if the software is checked by the thai customer
   *
   * @p_key_value Primary Key of dl_bordercontrol.faf_fees_and_fines
   */
  PROCEDURE set_and_upd_total_costs (p_key_value IN faf_fees_and_fines.key_value%TYPE);

  /**
   * Cancels the given fee or fine entry and saves the remark note
   *
   * @p_key_value Primary Key of dl_bordercontrol.faf_fees_and_fines
   * @p_remark    Note why this entry was cancelled
   */
  PROCEDURE cancel_fee_or_fine (p_key_value   IN faf_fees_and_fines.key_value%TYPE
                               ,p_remark      IN faf_fees_and_fines.status_note%TYPE);

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
                                  ,x_salutation         OUT faf_fees_and_fines.salutation%TYPE);

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
                       ,x_fee_or_fine        OUT faf_fees_and_fines.fee_or_fine%TYPE);

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
                       ,x_total_costs        OUT faf_fees_and_fines.total_costs%TYPE);

  /**
   * This function searches the fee and fine information with the given key_value
   * Returns a record of faf_fees_and_fines with all result information
   * Should replace the other functions because it's easier to handle and changes or
   * new columns can implemented easier
   *
   * @param i_key_value Column key_value of table dl_bordercontrol.faf_fees_and_fines
   * @return faf_fees_and_fines%ROWTYPE Record with all relevant information
   */
  FUNCTION get_fee_or_fine_by_pk (i_key_value	IN faf_fees_and_fines.key_value%TYPE)
  RETURN fee_or_fine_typ;


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
  RETURN VARCHAR2;

  /**
   * Generates the receipt file / document on the same page
   * !! Stops the APEX rendering engine !!
   *
   * @param p_key_value Primary key of table DL_BORDERCONTROL.FAF_FEES_AND_FINES
   */
  PROCEDURE print_receipt (p_key_value     IN faf_fees_and_fines.key_value%TYPE);

  /**
   * Returns the receipt file (fee or fine) as BLOB datatype
   *
   * @param p_key_value Primary key of table DL_BORDERCONTROL.FAF_FEES_AND_FINES
   * @return BLOB receipt file (PDF-format)
   */
  FUNCTION print_receipt (p_key_value      IN faf_fees_and_fines.key_value%TYPE)
  RETURN BLOB;

  /**
   * Returns the URL to open the popup with the fees and fines document
   * @param p_key_value Primary key of dl_bordercontrol.faf_fees_and_fines table
   */
  FUNCTION get_receipt_link (p_key_value   IN faf_fees_and_fines.key_value%TYPE)
  RETURN VARCHAR2;

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
  RETURN VARCHAR2;

END;
/
