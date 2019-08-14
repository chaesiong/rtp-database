CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_IDENTITIES" IS

  /*******************************************************************************
  * Defines several functions to manage the identity information or the abis status
  * information of a person
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * CHageman  25.10.2018  Added save_identity functionality
  * CHageman  18.10.2018  Added
  *******************************************************************************/

  TYPE t_varchar32_tab IS TABLE OF VARCHAR2(32 CHAR) INDEX BY BINARY_INTEGER;

  /**
   * Saves the given information into the table identities
   *
   * @param p_identity_rec Record of the identity
   * @return identities.key_value%TYPE  Key value of the inserted or updated identity
   */
  FUNCTION save_identity (p_identity_rec IN dl_bordercontrol.identities%ROWTYPE)
  RETURN identities.key_value%TYPE;

  /**
   * Returns a new biometric / bio id to save new information or a new identity into
   * the bio_identitites table
   *
   * @return bio_identities.bio_id Key of new identity
   */
  FUNCTION get_new_bio_id
  RETURN identities.identity%TYPE;

  /**
   * Merges the given identities by the newest passport / document
   *
   * @param p_borderdocuments_tab Table of Borderdocuments that should be changed
   * @param p_merge_borderdocument Borderdocument that called this function
   * @return identities.identity%TYPE Identity ID of the table IDENTITY (to group all the given borderdocuments)
   */
  FUNCTION merge_identities (p_borderdocuments_tab  IN pkg_borderdocuments.t_borderdocuments_tab
                            ,p_merge_borderdocument IN borderdocuments%ROWTYPE)
  RETURN identities.identity%TYPE;

END;
/
