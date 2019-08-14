CREATE OR REPLACE EDITIONABLE PACKAGE "DL_COMMON"."PKG_JSON_CONVERT" as

  /*******************************************************************************
   * ???
   *
   * Author    Date        Description
   * --------  ----------  -------------------------------------------------------*
   * CHageman  01.11.2018  Added
   *******************************************************************************/

  SUBTYPE t_visa_type_typ   IS VISA_TYPES%ROWTYPE;

  FUNCTION extract_visa_type_from_json (p_visa_type_json IN CLOB)
  RETURN t_visa_type_typ;

end pkg_json_convert;
/
