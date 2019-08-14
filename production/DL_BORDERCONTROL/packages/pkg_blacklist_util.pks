CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_BLACKLIST_UTIL" IS

/*******************************************************************************
 * This package provides several functionalities to call blacklist information
 * and handle with those
 *
 * Author    Date        Description
 * --------  ----------  -------------------------------------------------------*
 * CHageman  14.05.2018  Added get_params_blacklist_service
 * CHageman  14.05.2018  Added get_details_from_collection
 * CHageman  11.05.2018  Added
 *******************************************************************************/

  /****************************************
   * ========== TYPE DEFINITIONS ==========
   ****************************************/
  TYPE blacklist_search_typ IS RECORD (date_of_birth    DATE
                                      ,expiry_date      DATE
                                      ,first_name       dl_bordercontrol.borderdocuments.givenname%TYPE
                                      ,middle_name      dl_bordercontrol.borderdocuments.middlename%TYPE
                                      ,last_name        dl_bordercontrol.borderdocuments.surname%TYPE
                                      ,nationality      dl_bordercontrol.borderdocuments.nat%TYPE
                                      ,passport_no      dl_bordercontrol.borderdocuments.docno%TYPE
                                      ,sex              dl_bordercontrol.borderdocuments.sex%TYPE);
  --
  c_collection_name           CONSTANT VARCHAR2(50 CHAR) := 'BLACKLIST_HITS';
  c_entires_collection_name   CONSTANT VARCHAR2(50 CHAR) := 'BLACKLIST_HITS_ENTRIES';

  /************************************************
   * ========== FUNCTIONS AND PROCEDURES ==========
   ************************************************/

  /**
   * This function creates (or replaces) the existing Blacklist Hits collection and inserts
   * the plain JSON CLOB, but also the entries into the entries collection
   * @param p_blacklist_search_rec Includes all information and data to search for entries
   */
  PROCEDURE set_coll_by_advanced_search (p_blacklist_search_rec   blacklist_search_typ);

  /**
   * Searches the information from BLACKLIST_HITS collection and converts them into JSON
   * @param p_rec_id Record id of blacklist entry
   */
  PROCEDURE get_details_from_collection (p_rec_id   IN VARCHAR2);

  /**
   * Gets the different parameters and returns them as a JSON (varchar2) string
   * @return VARCHAR2 JSON string with parameters
   */
  FUNCTION get_params_blacklist_service
  RETURN VARCHAR2;

END pkg_blacklist_util;
/
