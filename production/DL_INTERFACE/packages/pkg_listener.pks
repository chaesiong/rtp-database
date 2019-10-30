CREATE OR REPLACE EDITIONABLE PACKAGE "DL_INTERFACE"."PKG_LISTENER" is
  --
  --
  /*******************************************************************************
  * This package provides that requests from Advanced Queues can be proceeded and
  * also provides some functionalities to
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * CHageman  08.08.2018  Added function to register to Advanced Queue
  * CHageman  22.05.2018  Added
  *******************************************************************************/
  --
  --
  /**
   * Adds a new entry into the table log_sync_webservices
   * @param p_log_rec Record of Logging entry
   * @return log_sync_webservices.key_value Primary key of new logging entry
   */
  FUNCTION add_log_sync_webservice (p_log_rec  IN log_sync_webservices%ROWTYPE)
  RETURN log_sync_webservices.key_value%TYPE;

  /**
   * Sets different actions to a new, updated or deleted movement
   *
   * @param p_mvmntid Primary key of movement that was inserted, updated or deleted
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.date, D.elete)
   */
  PROCEDURE send_bordercontrol_movement (p_mvmntid   IN VARCHAR2
                                        ,p_dml_type  IN CHAR DEFAULT 'I');
                                        
   PROCEDURE send_bordercontrol_movement_jira (p_mvmntid   IN VARCHAR2
                                        ,p_dml_type  IN CHAR DEFAULT 'I');
                                        
  PROCEDURE send_del_bordercontrol_movement (p_mvmntid   IN VARCHAR2);

 PROCEDURE AA_send_bordercontrol_movement (p_dml_type  IN CHAR DEFAULT 'I');

  /**
   * Sets different actions to a new, updated or deleted crew movements and calls the action to send
   * the request to the needed webservice
   *
   * @param p_mvmntid   Primary key of movement that was inserted, updated or deleted for a crew member
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.date, D.elete)
   */
  PROCEDURE send_bordercontrol_crew (p_mvmntid   IN VARCHAR2
                                    ,p_dml_type  IN CHAR DEFAULT 'I');
                                    
 PROCEDURE send_bordercontrol_crew_manual (p_mvmntid   IN VARCHAR2
                                    ,p_dml_type  IN CHAR DEFAULT 'I');

  /**
   * Sets different actions to a new, updated or deleted crew movements and calls the action to send
   * the request to the needed webservice
   *
   * @param p_mvmntid   Primary key of movement that was inserted, updated or deleted for a crew member
   * @param p_dml_type  Describes the DML type of the action (possible values: I.nsert, U.date, D.elete)
   */
  PROCEDURE send_bordercontrol_voa (p_key_value   IN VARCHAR2
                                   ,p_dml_type  IN CHAR DEFAULT 'I');

  /**
   * Handles the request for Queue DL_BORDERCONTROL.AQ_BORDERCONTROL_HOOKS_QUEUE
   *
   * @context
   * @reginfo
   * @descr
   * @payload
   * @payloadl
   */
  PROCEDURE handle_hook (context  RAW
                        ,reginfo  SYS.AQ$_REG_INFO
                        ,descr    SYS.AQ$_DESCRIPTOR
                        ,payload  VARCHAR2
                        ,payloadl NUMBER);

  /**
   * Dequeues and processes all entries from Queue for the given consumer name (e.g. SEND_MOVEMENT)
   *
   * @param p_consumer_name Name of the consumer that should be dequeued
   */
  PROCEDURE dequeue_hooks (p_consumer_name VARCHAR2);
  
  /**
   * Dequeues and processes all entries from Queue for the given consumer name (e.g. SEND_MOVEMENT)
   * Secondary
   * @param p_consumer_name Name of the consumer that should be dequeued
   */
  PROCEDURE dequeue_hooks_sec (p_consumer_name VARCHAR2);
  
  PROCEDURE AA_receive_country;

end;
/
