CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_WARRANT_UTIL" IS

/*******************************************************************************
* Author    Date        Description                                            *
* --------  ----------  -------------------------------------------------------*
* MSCS      13.11.2019  Added for wanted polis warrant search
*******************************************************************************/
    
    -- search_warrant
    FUNCTION search_warrant
    (
         p_system           IN VARCHAR2
        ,p_object           IN VARCHAR2
        ,p_object_id        IN VARCHAR2
        ,p_user             IN VARCHAR2 DEFAULT NULL
        ,p_id_no            IN VARCHAR2 DEFAULT NULL
        ,p_first_name_en    IN VARCHAR2 DEFAULT NULL
        ,p_middle_name_en   IN VARCHAR2 DEFAULT NULL
        ,p_last_name_en     IN VARCHAR2 DEFAULT NULL
        ,p_first_name_th    IN VARCHAR2 DEFAULT NULL
        ,p_last_name_th     IN VARCHAR2 DEFAULT NULL
        ,p_sex              IN NUMBER   DEFAULT NULL
        ,p_dob              IN VARCHAR2 DEFAULT NULL
    ) 
    --RETURN CLOB
    --<TEMPORARILY ONLY>
    RETURN log_warrant_search%ROWTYPE
    ;
    
    --
    --
    --
    FUNCTION get_object_name RETURN VARCHAR2 DETERMINISTIC;
    --
    FUNCTION get_object_copyright RETURN VARCHAR2 DETERMINISTIC;
    --
    FUNCTION get_object_version$vc RETURN VARCHAR2 DETERMINISTIC;
    --
END PKG_WARRANT_UTIL;
/
