CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_BMBS_APEX_UTIL" IS
/*******************************************************************************
 * This package provides several functions that are called from the apex application
 * 500 (BMBS)
 *
 * Author    Date        Description
 * --------  ----------  -------------------------------------------------------*
 * CHageman  14.09.2018  Added
 * MStephan  17.04.2019  Added bmbs_insert_travel_abis
 * MSCS      19.07.2019  Added Partial DOB capability
  *******************************************************************************/

  /**
   * Calculates several information and set those information into the global variables array
   */
  PROCEDURE p17_calc_after_submit_passport;

  PROCEDURE p17_create_document_after_submit_passport;

  /**
   * Checks information like extended stays or lost passports or blacklist entries
   */
  PROCEDURE p17_check_warning_information;

  /**
   * Validates the demographic input information if a relevant field or item was changed
   *
   */
  PROCEDURE p17_validate_demographic_input;

  PROCEDURE p17_merge_identities;

  /**
   * Get permit info: re-entry, extend stay or request for residence
   * Added by MSCS
   */
  PROCEDURE p17_get_permit_info;

  /**
   * Get Overstay info
   * Added by MSCS
   */
  PROCEDURE p17_get_overstay_info;

  /**
   * Get Last Movement info
   * Added by MSCS
   */
  PROCEDURE p17_get_last_movement_info (p_load_data_on_departure in varchar2 default 'N');

  /**
   * Get travel history sql: P17
   * Added by MSCS
   */
  FUNCTION p17_get_travel_history_sql
  (
    p_identity              IN VARCHAR2 DEFAULT NULL
    , p_docno               IN VARCHAR2 DEFAULT NULL
    , p_nationality         IN VARCHAR2 DEFAULT NULL
    , p_stateless           IN VARCHAR2 DEFAULT NULL
    , p_sex                 IN NUMBER   DEFAULT NULL
    , p_dob                 IN VARCHAR2 DEFAULT NULL
    , p_surname             IN VARCHAR2 DEFAULT NULL
    , p_givenname           IN VARCHAR2 DEFAULT NULL
    , p_middlename          IN VARCHAR2 DEFAULT NULL
    , p_rows                IN NUMBER   DEFAULT 1000
    , p_pibics_prd_conn     IN NUMBER   DEFAULT 0
    , p_dr                  IN VARCHAR2 DEFAULT 'Y'
  ) RETURN CLOB;

  /**
   * Get travel history sql
   * Added by MSCS
   */
  FUNCTION p8001_get_travel_history_sql
  (
    p_borderpost            IN VARCHAR2 DEFAULT NULL
    , p_scope               IN NUMBER   DEFAULT 0
    , p_direction           IN NUMBER   DEFAULT NULL
    , p_source              IN VARCHAR2 DEFAULT NULL
    , p_nationality         IN VARCHAR2 DEFAULT NULL
    , p_dob                 IN VARCHAR2 DEFAULT NULL
    , p_sex                 IN NUMBER   DEFAULT NULL
    , p_docno               IN VARCHAR2 DEFAULT NULL
    , p_tm6                 IN VARCHAR2 DEFAULT NULL
    , p_vehicle_no          IN VARCHAR2 DEFAULT NULL
    , p_travel_date_from    IN VARCHAR2 DEFAULT NULL
    , p_travel_date_to      IN VARCHAR2 DEFAULT NULL
    , p_givenname           IN VARCHAR2 DEFAULT NULL
    , p_middlename          IN VARCHAR2 DEFAULT NULL
    , p_surname             IN VARCHAR2 DEFAULT NULL
    , p_givenname_th        IN VARCHAR2 DEFAULT NULL
    , p_middlename_th       IN VARCHAR2 DEFAULT NULL
    , p_surname_th          IN VARCHAR2 DEFAULT NULL
    , p_dept_1              IN NUMBER   DEFAULT NULL
    , p_dept_2              IN NUMBER   DEFAULT NULL
    , p_dept_3              IN NUMBER   DEFAULT NULL
    , p_citizenid           IN VARCHAR2 DEFAULT NULL
    , p_created_by          IN VARCHAR2 DEFAULT NULL
    , p_rows                IN NUMBER   DEFAULT 1000
    , p_pibics_prd_conn     IN NUMBER   DEFAULT 0
    --, p_dr                  IN VARCHAR2 DEFAULT 'Y'
  ) RETURN CLOB;

  /**
   * Get travel history data in a collection
   * Added by MSCS
   */
  FUNCTION p8001_get_coll_travel_history
  (
    p_coll_name			    IN VARCHAR2
    , p_borderpost          IN VARCHAR2 DEFAULT NULL
    , p_scope               IN NUMBER   DEFAULT 0
    , p_direction           IN NUMBER   DEFAULT NULL
    , p_source              IN VARCHAR2 DEFAULT NULL
    , p_nationality         IN VARCHAR2 DEFAULT NULL
    , p_dob                 IN VARCHAR2 DEFAULT NULL
    , p_sex                 IN NUMBER   DEFAULT NULL
    , p_docno               IN VARCHAR2 DEFAULT NULL
    , p_tm6                 IN VARCHAR2 DEFAULT NULL
    , p_vehicle_no          IN VARCHAR2 DEFAULT NULL
    , p_travel_date_from    IN VARCHAR2 DEFAULT NULL
    , p_travel_date_to      IN VARCHAR2 DEFAULT NULL
    , p_givenname           IN VARCHAR2 DEFAULT NULL
    , p_middlename          IN VARCHAR2 DEFAULT NULL
    , p_surname             IN VARCHAR2 DEFAULT NULL
    , p_givenname_th        IN VARCHAR2 DEFAULT NULL
    , p_middlename_th       IN VARCHAR2 DEFAULT NULL
    , p_surname_th          IN VARCHAR2 DEFAULT NULL
    , p_dept_1              IN NUMBER   DEFAULT NULL
    , p_dept_2              IN NUMBER   DEFAULT NULL
    , p_dept_3              IN NUMBER   DEFAULT NULL
    , p_citizenid           IN VARCHAR2 DEFAULT NULL
    , p_created_by          IN VARCHAR2 DEFAULT NULL
    , p_rows                IN NUMBER   DEFAULT 1000
    , p_pibics_prd_conn     IN NUMBER   DEFAULT 0
    --, p_dr                  IN VARCHAR2 DEFAULT 'Y'
  ) RETURN NUMBER;

  FUNCTION bmbs_insert_travel_abis_movement(
      p_mvmntid in varchar2
  ) return number;

  function bmbs_insert_travel_abis_document(
      p_brddocid in varchar2
  ) return number;
  
  /** 
   * Updates the borderdocument with a corrected MRZ that was selected by the officer
   */  
  PROCEDURE p17_update_calc_mrz;
END;
/
