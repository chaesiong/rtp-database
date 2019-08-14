CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_JSON_CONVERT" as
/*******************************************************************************
 * This package provides several functions connected to the data to JSON export
 *
 * Author    Date        Description
 * --------  ----------  -------------------------------------------------------*
 * CHageman  31.10.2018  Added
 *******************************************************************************/

  SUBTYPE t_movement_typ            IS movements%ROWTYPE;
  SUBTYPE t_borderdocument_typ      IS borderdocuments%ROWTYPE;
  SUBTYPE t_borderdocimages_typ     IS borderdocimages%ROWTYPE;
  SUBTYPE t_thaipassport_typ        IS thaipassport%ROWTYPE;
  SUBTYPE t_terminals_typ           IS terminals%ROWTYPE;
  SUBTYPE t_borderposts_typ         IS borderposts%ROWTYPE;
  SUBTYPE t_visas_typ               IS visas%ROWTYPE;
  SUBTYPE t_persons_typ             IS person%ROWTYPE;
  SUBTYPE t_receipts_typ            IS faf_fees_and_fines%ROWTYPE;
  SUBTYPE t_movements_blob_typ      IS movements_blob%ROWTYPE;
  SUBTYPE t_fellow_passengers_typ   IS fellow_passenger%ROWTYPE;

  SUBTYPE t_entry_form_typ          IS entry_forms%ROWTYPE;
  SUBTYPE t_province_typ            IS adm_class_province%ROWTYPE;
  SUBTYPE t_district_typ            IS adm_class_district%ROWTYPE;
  SUBTYPE t_subdistrict_typ         IS adm_class_subdistrict%ROWTYPE;

  TYPE t_borderdocimages_tab_typ    IS TABLE OF t_borderdocimages_typ   INDEX BY PLS_INTEGER;
  TYPE t_fellow_passengers_tab_typ  IS TABLE OF t_fellow_passengers_typ INDEX BY PLS_INTEGER;

  TYPE t_entry_form_data_typ        IS RECORD (entry_form   t_entry_form_typ
                                              ,province     t_province_typ
                                              ,district     t_district_typ
                                              ,subdistrict  t_subdistrict_typ);

  TYPE t_visa_data_typ IS RECORD (visa    t_visas_typ
                                 ,person  t_persons_typ
                                 ,receipt t_receipts_typ);

  TYPE t_borderdocument_data_typ IS RECORD (borderdocument   t_borderdocument_typ
                                           ,borderdocimages  t_borderdocimages_tab_typ
                                           ,thaipassport     t_thaipassport_typ);

  TYPE t_movement_json_typ IS RECORD (movement          t_movement_typ
                                     ,borderdocument    t_borderdocument_data_typ
                                     ,terminal          t_terminals_typ
                                     ,borderpost        t_borderposts_typ
                                     ,visa_type         dl_common.pkg_json_convert.t_visa_type_typ
                                     ,visa_data         t_visa_data_typ
                                     ,movement_blobs    t_movements_blob_typ
                                     ,entry_form        t_entry_form_data_typ
                                     ,fellow_passengers t_fellow_passengers_tab_typ);

  -- TODO: visatype
  FUNCTION extract_collective_passports_from_json (p_collective_passport_json IN CLOB)
  RETURN t_fellow_passengers_tab_typ;

  FUNCTION extract_receipt_from_json (p_receipt_json IN CLOB)
  RETURN t_receipts_typ;

  FUNCTION extract_person_from_json (p_person_json IN CLOB)
  RETURN t_persons_typ;

  FUNCTION extract_visa_data_from_json (p_visa_json IN CLOB)
  RETURN t_visa_data_typ;

  FUNCTION extract_entry_form_data_from_json (p_entry_form_json IN CLOB)
  RETURN t_entry_form_data_typ;

  FUNCTION extract_subdistrict_from_json (p_subdistrict_json IN CLOB)
  RETURN t_subdistrict_typ;

  FUNCTION extract_district_from_json (p_district_json IN CLOB)
  RETURN t_district_typ;

  FUNCTION extract_province_from_json (p_province_json IN CLOB)
  RETURN t_province_typ;

  FUNCTION extract_movementimages_from_json (p_movements_blob_json IN CLOB)
  RETURN t_movements_blob_typ;

  FUNCTION extract_borderpost_from_json (p_borderpost_json IN CLOB)
  RETURN t_borderposts_typ;

  FUNCTION extract_terminal_from_json (p_terminal_json IN CLOB)
  RETURN t_terminals_typ;

  FUNCTION extract_thaipassport_from_json (p_thaipassport_json IN CLOB)
  RETURN t_thaipassport_typ;

  FUNCTION extract_borderdocimages_from_json (p_borderdocimages_json  IN CLOB)
  RETURN t_borderdocimages_tab_typ;

  FUNCTION extract_borderdocument_from_json (p_borderdocument_json IN CLOB)
  RETURN t_borderdocument_data_typ;

  FUNCTION extract_movement_from_json (p_movement_json  IN CLOB)
  RETURN t_movement_json_typ;
  
  FUNCTION convert_base64_clob_to_blob (p_clob IN CLOB) RETURN BLOB;

end pkg_json_convert;
/
