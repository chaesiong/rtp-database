CREATE OR REPLACE EDITIONABLE PACKAGE "DL_COMMON"."PKG_JSON_EXPORT" as
    /*******************************************************************************
    * This package allows json export of different tables
    *
    * Author    Date        Description
    * --------  ----------  -------------------------------------------------------*
    * CHageman  27.10.2018  Added function get_human_sex
    * e1mstahl  07.09.2018  Initial release
    *******************************************************************************/

    /************************************************
    * ========== FUNCTIONS AND PROCEDURES ==========
    ************************************************/

    /**
     * Function to export the table VISA_TYPE
     * @param i_id ID of the wanted visa type
     * @return json returns pl/json object
     */
    function get_visa_type( i_id in varchar2) return json;

    /**
     * Function to export the table HUMAN_SEXES
     * @param i_id ID of the wanted human sex
     * @return json returns pl/json object
     */
    function get_human_sex( i_id in varchar2) return clob;

end pkg_json_export;
/
