CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BLACKLIST"."PKG_DL_UTILS" AS

  -- An artificial primary key in any database table or view is supposed to have
  -- 'global unique identifier' values represented as hex-encoded strings.
  SUBTYPE guid_t IS VARCHAR2(32 CHAR) NULL;

  TYPE collection_of_pls_integer_t IS TABLE OF PLS_INTEGER;
  TYPE collection_of_varchar2_t IS TABLE OF VARCHAR2(32767 CHAR);

  e_missing_parameter EXCEPTION;
  e_invalid_parameter EXCEPTION;

  -- STRING --------------------------------------------------------------------------------------

  FUNCTION is_empty_string(i_string IN VARCHAR2) RETURN BOOLEAN;

  FUNCTION is_whitespace_string(i_string IN VARCHAR2) RETURN BOOLEAN;

  FUNCTION is_null_or_empty_string(i_string IN VARCHAR2) RETURN BOOLEAN;

  FUNCTION is_null_or_whitespace_string(i_string IN VARCHAR2) RETURN BOOLEAN;

  -- BOOLEAN -------------------------------------------------------------------------------------

  FUNCTION to_boolean(i_string IN VARCHAR2) RETURN BOOLEAN;

  FUNCTION to_string(i_boolean IN BOOLEAN) RETURN VARCHAR2;

  -- DATE / TIME ---------------------------------------------------------------------------------

  FUNCTION get_days_since_19700101(i_date IN DATE) RETURN NATURALN;

  -- TRACING -------------------------------------------------------------------------------------

  PROCEDURE output_message_dbms(i_message IN VARCHAR2 DEFAULT NULL, i_label IN VARCHAR2 DEFAULT NULL);

  PROCEDURE output_message_apex(i_message IN VARCHAR2 DEFAULT NULL, i_label IN VARCHAR2 DEFAULT NULL);

  PROCEDURE output_message(i_message IN VARCHAR2 DEFAULT NULL, i_label IN VARCHAR2 DEFAULT NULL);

  -- OTHER ---------------------------------------------------------------------------------------

  FUNCTION is_valid_guid(i_guid IN guid_t) RETURN BOOLEAN;

  /*TODO:
  FUNCTION get_parm_value( i_key IN VARCHAR2 ) RETURN VARCHAR2;

  FUNCTION get_coll_ident_ins_name RETURN VARCHAR2;
  */

  FUNCTION get_partial_from_varchar (
        p_varchar_date IN   VARCHAR2
    ) RETURN dl_blacklist.ct_partial_date;

  FUNCTION get_vs$date_from_varchar (
        p_varchar_date IN   VARCHAR2
    ) RETURN VARCHAR2;
END PKG_DL_UTILS;
/
