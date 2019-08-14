CREATE OR REPLACE EDITIONABLE PACKAGE "DL_INTERFACE"."PKG_WEBSERVICES_BLACKLIST" AS
/*******************************************************************************
 * ???
 *
 * Author    Date        Description
 * --------  ----------  -------------------------------------------------------*
 * CHageman  19.09.2018  Added
 *******************************************************************************/

  /**
   * Searches blacklist system via Webservice Request to BlacklistService and sends the answer as response (CLOB)
   * Also logs the request and response information into DL_INTERFACE.LOG_BLACKLIST_HITS
   * @param p_request_clob Request CLOB
   * @return CLOB Response CLOB
   */
  FUNCTION search_blacklist_system (p_request_clob  IN CLOB
                                   ,p_user          IN VARCHAR2 DEFAULT NULL
                                   ,p_system        IN VARCHAR2 DEFAULT NULL
                                   ,p_object_id     IN VARCHAR2 DEFAULT NULL)
  RETURN CLOB;
  
  /**
   * Searches blacklist system via Webservice Request to BlacklistService and sends the answer as response (CLOB)
   * Also logs the request and response information into DL_INTERFACE.LOG_BLACKLIST_HITS
   * @param p_request_clob Request CLOB
   * @return CLOB Response CLOB
   */
  FUNCTION search_BLDemographic_system (p_request_clob  IN CLOB
                                       ,p_user          IN VARCHAR2 DEFAULT NULL
                                       ,p_system        IN VARCHAR2 DEFAULT NULL
                                       ,p_object_id     IN VARCHAR2 DEFAULT NULL)
  RETURN CLOB;
  
  /**
   * Searches ICPO system via Webservice Request
   * Also logs the request and response information into DL_INTERFACE.LOG_BLACKLIST_HITS
   * @param p_request_clob Request CLOB
   * @return CLOB Response CLOB
   */
  FUNCTION search_ICPO (p_request_clob  IN CLOB
                       ,p_request_type  IN VARCHAR2 DEFAULT NULL
                       ,p_user          IN VARCHAR2 DEFAULT NULL
                       ,p_system        IN VARCHAR2 DEFAULT NULL
                       ,p_object_id     IN VARCHAR2 DEFAULT NULL)
  RETURN CLOB;

END;
/
