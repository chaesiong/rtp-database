CREATE OR REPLACE EDITIONABLE PACKAGE "DL_INTERFACE"."PKG_OBJECT_HANDLING" is
  --
  --
  /*******************************************************************************
  * ???
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * CHageman  26.10.2018  Added
  *******************************************************************************/
  --
  --

  /**
   * Convert the given movement JSON into the needed JSON format for PIBICS
   * There might be different formats that should be sent to PIBICS (Insert/Update vs. Delete)

   * @param p_movement_json JSON of the bordercontrol movement
   * @param p_dml_type      DML Type of this transaction
   * @return CLOB JSON for PIBICS
   */
  FUNCTION get_pibics_inout_from_movement (p_movement_json  IN dl_bordercontrol.pkg_json_convert.t_movement_json_typ
                                          ,p_dml_type       IN VARCHAR2 DEFAULT 'I')
  RETURN CLOB;

  /**
   * description
   * @param parameter param_desc
   * @return return_param return_param_value
   * @throws error error_desc
   */
FUNCTION AA_get_pibics_pk (p_id in varchar2)
RETURN VARCHAR2;

FUNCTION AA_get_bio_pk (p_id in varchar2)
RETURN VARCHAR2;

FUNCTION AA_get_update_inout_from_pibics (p_date in Date)
RETURN VARCHAR2;
   
FUNCTION AA_get_pibics_inout_from_movement (p_id in varchar2, p_dml_type       IN VARCHAR2 DEFAULT 'I')
  RETURN CLOB;
   
  FUNCTION get_pibics_crew_from_crew (p_crew_json IN dl_bordercontrol.pkg_json_convert.t_movement_json_typ
                                     ,p_dml_type  IN VARCHAR2 DEFAULT 'I')
  RETURN CLOB;
  
 FUNCTION get_pibics_crew_from_crew_manual (p_crew_json IN dl_bordercontrol.pkg_json_convert.t_movement_json_typ
                                     ,p_dml_type IN VARCHAR2 DEFAULT 'I')
  RETURN CLOB;

  /**
   * description
   * @param parameter param_desc
   * @return return_param return_param_value
   * @throws error error_desc
   */
  FUNCTION get_pibics_voa_from_voa (p_voa_json  IN dl_bordercontrol.pkg_json_convert.t_visa_data_typ
                                   ,p_dml_type  IN VARCHAR2 DEFAULT 'I')
  RETURN CLOB;

  FUNCTION del_pibics_inout_from_movement (p_movement_json  IN dl_bordercontrol.pkg_json_convert.t_movement_json_typ)
  RETURN CLOB;
end;
/
