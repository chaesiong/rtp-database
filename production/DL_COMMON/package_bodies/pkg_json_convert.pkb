CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_COMMON"."PKG_JSON_CONVERT" as

  /*******************************************************************************
   * ???
   *
   * Author    Date        Description
   * --------  ----------  -------------------------------------------------------*
   * CHageman  01.11.2018  Added
   *******************************************************************************/

  c_input_date_format CONSTANT VARCHAR2(32 CHAR) := 'DD.MM.YYYY HH24:MI:SS';


  FUNCTION extract_visa_type_from_json (p_visa_type_json IN CLOB)
  RETURN t_visa_type_typ
  IS

    l_visa_type_obj JSON_OBJECT_T;

    l_result        t_visa_type_typ;

  BEGIN

    l_visa_type_obj := JSON_OBJECT_T.parse(p_visa_type_json);

    l_result.key_value          := l_visa_type_obj.get_string('id');
    l_result.locale             := l_visa_type_obj.get_string('locale');
    l_result.display_value      := l_visa_type_obj.get_string('displayValue');
    l_result.display_order      := l_visa_type_obj.get_string('displayOrder');
    l_result.is_active          := l_visa_type_obj.get_string('isActiveFlag');
    l_result.dml_at             := TO_DATE(l_visa_type_obj.get_string('lastModifiedAt'), c_input_date_format);
    l_result.dml_by             := l_visa_type_obj.get_string('lastModifiedBy');
    l_result.dml_type           := l_visa_type_obj.get_string('lastModifiedType');
    l_result.notice             := l_visa_type_obj.get_string('notice');
    l_result.num_value          := l_visa_type_obj.get_string('numValue');
    l_result.trans_mode         := l_visa_type_obj.get_string('transModeId');
    l_result.icao_dc_list       := l_visa_type_obj.get_string('icaoDocListId');
    l_result.permit_days        := l_visa_type_obj.get_string('permitDays');
    l_result.can_edit_expiry_dt := l_visa_type_obj.get_string('canEditExpiryDateFlag');
    l_result.auto_generate_visa := l_visa_type_obj.get_string('autoGenerateVisaFlag');
    l_result.ins_at             := TO_DATE(l_visa_type_obj.get_string('createdAt'), c_input_date_format);
    l_result.ins_by             := l_visa_type_obj.get_string('createdBy');
    --l_result.row_flag_mask      := l_visa_type_obj.get_string('');

    RETURN l_result;

  END extract_visa_type_from_json;


end pkg_json_convert;
/
  GRANT EXECUTE ON "DL_COMMON"."PKG_JSON_CONVERT" TO "DL_INTERFACE";
  GRANT EXECUTE ON "DL_COMMON"."PKG_JSON_CONVERT" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_COMMON"."PKG_JSON_CONVERT" TO "DERMALOG_PROXY";
