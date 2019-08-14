CREATE OR REPLACE EDITIONABLE PACKAGE "DL_INTERFACE"."PKG_LISTENER_MANUAL" AS 

  /* TODO enter package declarations (types, exceptions, methods etc) here */ 
     PROCEDURE send_bordercontrol_movement_jira (p_mvmntid   IN VARCHAR2
                                        ,p_dml_type  IN CHAR DEFAULT 'I');
                                        
    PROCEDURE send_bordercontrol_crew (p_mvmntid   IN VARCHAR2
                                    ,p_dml_type  IN CHAR DEFAULT 'I');
                                    
   PROCEDURE send_del_bordercontrol_movement (p_mvmntid   IN VARCHAR2);

END PKG_LISTENER_MANUAL;
/
