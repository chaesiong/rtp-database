CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_PIBICS_UNHOOK" AS
/*******************************************************************************
 * This package provides dequeue functions 
 *
 * Author    Date        Description
 * --------  ----------  -------------------------------------------------------*
 * MSCS      07.10.2019  Initial release
 *******************************************************************************/

    /*
    * Global declarations
    */
    
    /*
    * get_pibics_inout_from_movement
    */
    FUNCTION get_pibics_inout_from_movement
    (
        p_mvmntid       IN DL_BORDERCONTROL.MOVEMENTS.MVMNTID%TYPE
        ,p_dml_type     IN VARCHAR2 DEFAULT 'I'
    )
    RETURN CLOB;
    
    FUNCTION get_pibics_crew_inout_from_movement
    (
        p_mvmntid       IN DL_BORDERCONTROL.MOVEMENTS.MVMNTID%TYPE
        ,p_dml_type     IN VARCHAR2 DEFAULT 'I'
    )
    RETURN CLOB;

END PKG_PIBICS_UNHOOK;
/
