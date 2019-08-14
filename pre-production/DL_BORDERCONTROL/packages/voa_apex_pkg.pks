CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."VOA_APEX_PKG" IS

 /*******************************************************************************
  * This package provides a service for saving the data of the Visa On Arrival
  * APEX application
  * It is used to set all parameters from the frontend to this PL/SQL package
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * CHageman  26.06.2018  Added function to save and delete the face/image from a collection
  * CHageman  22.06.2018  Added column passport doctype to search functionality
  * CHageman  11.06.2018  Added report_search functionality
  * CHageman  14.05.2018  Added p_blacklist_record to save functionality
  * CHageman  03.04.2018  Added function get_search_query
  * CHageman  08.03.2018  Added
  *******************************************************************************/

  /****************************************
   * ========== TYPE DEFINITIONS ==========
   ****************************************/



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
  RETURN visas.visa_number%TYPE;

  /**
   * Saves the parameter data into the database
   * Also provides that all data are inserted into the right table
   * and checks the given Collection data
   *
   * @p_key_value
   * @p_person
   * @p_last_name
   * @p_first_name
   * @p_middle_name
   * @p_nationality
   * @p_passport_no
   * @p_date_of_birth
   * @p_gender
   * @p_salutation
   * @p_tm6_no
   * @p_issuing_country
   * @p_from_country
   * @p_date_of_issue
   * @p_expiry_date
   * @p_travel_date
   * @p_transport_type
   * @p_flight_no
   * @p_profession
   * @p_permanent_address
   * @p_address_thailand
   * @p_province
   * @p_district
   * @p_subdistrict
   * @p_contaczt_person
   * @p_relation
   * @p_approve_status
   * @p_officer
   * @p_requesting_date
   * @p_visa_expiry_date
   * @p_receipt
   * @p_fee_exception
   * @p_passport_doctype
   * @p_passport_mrz
   * @p_passport_visual_face
   * @p_passport_icao_face
   * @p_passport_visualpage
   * @p_passport_uvpage
   * @p_passport_irpage
   * @p_passport_dg3_0
   * @p_passport_dg3_1
   * @p_status_fee_exception
   * @p_status_no_receipt
   * @p_status_print_form
   * @p_release_note
   * @p_cancel_note
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
                 ,x_visa_number           OUT dl_bordercontrol.visas.visa_number%TYPE);

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
                                  ,p_approval_status  IN VARCHAR2);

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
                   ,x_passport_doctype      OUT borderdocuments.doctype%TYPE);

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
  RETURN VARCHAR2;

  /**
  * Cancels this visa
  *
  * @p_key_value Primary key of Visa
  * @p_note      Cancellation note of Visa
  */
  PROCEDURE cancel_visa (p_key_value IN VARCHAR2
                        ,p_note      IN VARCHAR2);

  /**
  * Saves the receipt number (pk of table dl_bordercontrol.faf_fees_and_fines)
  * into the table dl_bordercontrol.visas
  *
  * @param p_key_value Primary key of Visa (dl_bordercontrol.visas)
  * @param p_receipt   Primary key of receipt (dl_bordercontrol.faf_fees_and_fines)
  */
  PROCEDURE set_receipt (p_key_value  IN dl_bordercontrol.visas.key_value%TYPE
                        ,p_receipt    IN dl_bordercontrol.visas.receipt%TYPE);

  /**
   * Generates the VOA file / document on the same page
   * !! Stops the APEX rendering engine !!
   *
   * @param p_key_value Primary key of table DL_BORDERCONTROL.VISAS
   */
  PROCEDURE print_voa_document (p_key_value IN visas.key_value%TYPE);

  /**
   * Generates the VOA file / document on the same page
   *
   * @param p_key_value Primary key of table DL_BORDERCONTROL.VISAS
   * @return BLOB VOA file (PDF-format)
   */
  FUNCTION print_voa_document (p_key_value IN visas.key_value%TYPE)
  RETURN BLOB;

  /**
   * Returns the URL to open the popup with the VOA print document
   * @param p_key_value Primary key of dl_bordercontrol.visas table
   */
  FUNCTION get_voa_print_link (p_key_value   IN visas.key_value%TYPE)
  RETURN VARCHAR2;

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
                                    ,p_created_by              IN VARCHAR2 DEFAULT NULL);

  /**
   * Saves the face/image of a customer into a collection to make sure
   * it can be saved successfully
   * @param p_image Base64 Code of the image
   */
  PROCEDURE save_tmp_face (p_image IN CLOB);

  /**
   * Deletes the face/image from the collection
   */
  PROCEDURE cleanup_tmp_face;

  /**
   * Returns the CLOB of the face that's saved into the collection
   * @return CLOB Base64 String of the face/image
   */
  FUNCTION get_tmp_face
  RETURN CLOB;

END;
/
