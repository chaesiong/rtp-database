CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_PIBICS_HOOK" authid current_user is
  --
  --
  /*******************************************************************************
  * This package provides a function to define different interactions with several
  * systems.
  * Example: New movement was created and there should be send a new dataset via
  * REST to PIBICS and also documented into another structure. This hook function
  * calls different functions so every system can be informed.
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * CHageman  22.05.2018  Added
  *******************************************************************************/
  --
  --
  /**
   * Sets different actions to a new, updated or deleted movement
   *
   * @param p_mvmntid Primary key of movement that was inserted, updated or deleted
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.date, D.elete)
   */
  PROCEDURE set_action_movement (p_mvmntid  IN dl_bordercontrol.movements.mvmntid%TYPE
                                ,p_dml_type IN CHAR DEFAULT 'I');

  /**
   * Sets different actions to a new, updated or deleted crew movement
   *
   * @param p_mvmntid Primary key of movement that was inserted, updated or deleted
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.date, D.elete)
   */
  PROCEDURE set_action_crew (p_mvmntid  IN dl_bordercontrol.movements.mvmntid%TYPE
                            ,p_dml_type IN CHAR DEFAULT 'I');

  /**
   * Sets actions to push information about new VISA on Arrival entries
   *
   * @param p_key_value Primary key of VISA on Arrival that was inserted, updated or deleted
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.pdate, D.elete)
   */
  PROCEDURE set_action_visa_on_arrival (p_key_value IN dl_bordercontrol.visas.key_value%TYPE
                                       ,p_dml_type  IN CHAR DEFAULT 'I');

  /**
   * Sets actions to push information about new Fee entries
   *
   * @param p_key_value Primary key of the Fee that was inserted, updated or deleted
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.pdate, D.elete)
   */
  PROCEDURE set_action_fees (p_key_value IN dl_bordercontrol.faf_fees_and_fines.key_value%TYPE
                            ,p_dml_type  IN CHAR DEFAULT 'I');

  /**
   * Sets actions to push information about new Fine entries
   *
   * @param p_key_value Primary key of Fine that was inserted, updated or deleted
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.pdate, D.elete)
   */
  PROCEDURE set_action_fines (p_key_value IN dl_bordercontrol.faf_fees_and_fines.key_value%TYPE
                             ,p_dml_type  IN CHAR DEFAULT 'I');

  /**
   * Sets actions to push information about new Extend Stay entries
   *
   * @param p_key_value Primary key of Extend Stay that was inserted, updated or deleted
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.pdate, D.elete)
   */
  /*PROCEDURE set_action_extend_stay (p_key_value  IN dl_bordercontrol.extstay_application.key_value%TYPE
                                   ,p_dml_type   IN CHAR DEFAULT 'I');*/

  /**
   * Sets actions to push information about new ReEntry entries
   *
   * @param p_key_value Primary key of ReEntry that was inserted, updated or deleted
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.pdate, D.elete)
   */
  PROCEDURE set_action_reentry (p_key_value  IN dl_bordercontrol.tm8_application.key_value%TYPE
                               ,p_dml_type   IN CHAR DEFAULT 'I');

end PKG_PIBICS_HOOK;
/
