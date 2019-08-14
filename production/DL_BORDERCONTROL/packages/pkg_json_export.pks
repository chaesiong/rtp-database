CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_JSON_EXPORT" as
/*******************************************************************************
 * This package provides several functions connected to the data to JSON export
 *
 * Author    Date        Description
 * --------  ----------  -------------------------------------------------------*
 * CHageman  27.10.2018  Added function get_movement_fellow_passenger
 * e1mstahl  06.09.2018  Initial release
 *******************************************************************************/

    /************************************************
    * ========== FUNCTIONS AND PROCEDURES ==========
    ************************************************/

    /**
    * Function to convert blob images to clob base 64
    * @param p_blob blob image in
    * @return l_base64 base64 as pljson_value
    */
    function resize_img (p_blob in blob) RETURN BLOB;
    
    function convert_image(p_blob in blob) return json_value;
    
    function convert_image_toclob(p_blob in blob) return clob;

    /**
    * Function to export the table BORDERDOCIMAGES
    * @param p_id ID of the borderdocument associated with images
    * @return json returns pl/json object
    */
    function get_borderdocimages(p_id in varchar2) return json_list;

    /**
     * Function to export the table THAIPASSPORT
     * @param p_id ID of the wanted thaipassport
     * @return json returns pl/json object
     */
    function get_thaipassport(p_id in varchar2) return json;
    
    function get_thaipassport_dm2(p_id in varchar2, p_expdate in date) return json;

    /**
     * Function to export the table BORDERDOCUMENTS
     * @param p_id ID of the wanted Borderdocument
     * @return json returns pl/json object
     */
     function get_borderdocuments(p_id in varchar2) return json;

    /**
     * Function to export the table TERMINALS
     * @param p_id ID of the wanted terminal
     * @return json returns pl/json object
     */
     function AA_get_borderdocuments(p_id in varchar2) return json;
     
     function get_terminals(p_id in varchar2) return json;

     /**
     * Function to export the table BORDERPOSTS
     * @param p_id ID of the wanted borderpost
     * @return json returns pl/json object
     */
     function get_borderposts(p_id in varchar2) return json;

     /**
     * Function to export the table PERSON
     * @param p_id ID of of the wanted person
     * @return json returns pl/json object
     */
     function get_person(p_id in varchar2) return json;

     /**
     * Function to export the table FAF_FEES_AND_FINES
     * @param p_id ID of the wanted faf receipt
     * @return json returns pl/json object
     */
     function get_faf_fees_and_fines(p_id in varchar2) return json;

     /**
     * Function to export the table VISAS
     * @param p_id ID of the wanted visa
     * @return json returns pl/json object
     */
     function get_visas(p_id in varchar2) return json;

     /**
     * Function to export the table ADM_CLASS_PROVINCE
     * @param p_id ID of the wanted province
     * @return json returns pl/json object
     */
     function AA_get_visas(p_id in varchar2) return json;
     
     function get_adm_class_province(p_id in varchar2) return json;

     /**
     * Function to export the table ADM_CLASS_DISTRICT
     * @param p_id ID of the wanted district
     * @return json returns pl/json object
     */
     function AA_get_adm_class_province(p_id in varchar2) return json;
     
     function get_adm_class_district(p_id in varchar2) return json;

     /**
     * Function to export the table ADM_CLASS_SUBDISTRICT
     * @param p_id ID of the wanted subdistrict
     * @return json returns pl/json object
     */
     function get_adm_class_subdistrict(p_id in varchar2) return json;

     /**
     * Function to export the table ENTRY_FORMS
     * @param p_id ID of the wanted entry form
     * @return json returns pl/json object
     */
     function get_entry_forms(p_id in varchar2) return json;

     /**
     * Function to export the table MOVEMENTS_BLOB
     * @param p_id ID of the wanted movement images
     * @return json returns pl/json object
     */
     function AA_get_entry_forms(p_id in varchar2) return json;
     
     function get_movements_blob(p_id in varchar2) return json;

     /**
     * Function to export the table MOVEMENTS including all previous sub tables
     * @param p_id ID of the wanted movement
     * @return json returns pl/json object
     */
     function get_movements(p_id in varchar2) return clob;
     
     function get_movements_jira(p_id in varchar2) return clob;

    /**
     * Function to export the table FELLOW_PASSENGER
     * @param p_id ID of the wanted movement
     * @return json returns pl/json object
     */
     function AA_get_movements(p_id in varchar2) return clob;
     
     function get_movement_fellow_passenger(p_id in varchar2) return json_list;
     
     function AA_get_movement_fellow_passenger(p_id in varchar2) return json_list;
     
     function get_residence(p_id in varchar2, nat in varchar2) return json;

end pkg_json_export;
/
