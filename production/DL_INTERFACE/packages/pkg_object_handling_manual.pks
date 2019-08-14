CREATE OR REPLACE EDITIONABLE PACKAGE "DL_INTERFACE"."PKG_OBJECT_HANDLING_MANUAL" is
  --
  --
  /*******************************************************************************
   */

  FUNCTION get_pibics_crew_from_crew (p_crew_json IN dl_bordercontrol.pkg_json_convert.t_movement_json_typ
                                     ,p_dml_type  IN VARCHAR2 DEFAULT 'I')
  RETURN CLOB;
end;
/
