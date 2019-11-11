CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BLACKLIST"."PKG_DL_UTILS" AS

    FUNCTION is_empty_string (
        i_string IN   VARCHAR2
    ) RETURN BOOLEAN IS
    BEGIN
        IF '' IS NULL THEN
            RETURN false;
        ELSE
            RETURN i_string = '';
        END IF;
    END is_empty_string;

  ------------------------------------------------------------------------------------------------

    FUNCTION is_whitespace_string (
        i_string IN   VARCHAR2
    ) RETURN BOOLEAN IS
    BEGIN
        IF i_string IS NULL THEN
            RETURN false;
        ELSE
      -- http://docs.oracle.com/cd/B19306_01/server.102/b14200/ap_posix002.htm
            RETURN regexp_like(i_string, '^[ \t\r\n\f]+$'); -- TODO: unit test this extensively!
        END IF;
    END is_whitespace_string;

  ------------------------------------------------------------------------------------------------

    FUNCTION is_null_or_empty_string (
        i_string IN   VARCHAR2
    ) RETURN BOOLEAN IS
    BEGIN
        IF i_string IS NULL THEN
            RETURN true;
        ELSE
            RETURN '' IS NOT NULL AND i_string = '';
        END IF;
    END is_null_or_empty_string;

  ------------------------------------------------------------------------------------------------

    FUNCTION is_null_or_whitespace_string (
        i_string IN   VARCHAR2
    ) RETURN BOOLEAN IS
    BEGIN
        IF i_string IS NULL THEN
            RETURN true;
        ELSE
            RETURN is_whitespace_string(i_string);
        END IF;
    END is_null_or_whitespace_string;

  ------------------------------------------------------------------------------------------------

  --
  -- EXCEPTIONS: e_invalid_parameter
  --

    FUNCTION to_boolean (
        i_string IN   VARCHAR2
    ) RETURN BOOLEAN IS
        l_retvalue   BOOLEAN default NULL;
    BEGIN
        IF i_string IS NOT NULL THEN
      -- https://docs.oracle.com/cd/B19306_01/server.102/b14200/expressions004.htm
      -- https://docs.oracle.com/cd/A97630_01/appdev.920/a96624/04_struc.htm
            l_retvalue :=
                CASE upper(i_string)
                    WHEN 'TRUE' THEN true
                    WHEN 'FALSE' THEN false
                END;
            IF l_retvalue IS NULL THEN
                RAISE e_invalid_parameter;
            END IF;
        END IF;

        RETURN l_retvalue;
    END to_boolean;

  ------------------------------------------------------------------------------------------------

    FUNCTION to_string (
        i_boolean IN   BOOLEAN
    ) RETURN VARCHAR2 IS
        l_retvalue   VARCHAR2(5 CHAR) DEFAULT NULL;
    BEGIN
        IF i_boolean IS NOT NULL THEN
      -- https://docs.oracle.com/cd/B19306_01/server.102/b14200/expressions004.htm
      -- https://docs.oracle.com/cd/A97630_01/appdev.920/a96624/04_struc.htm
            l_retvalue :=
                CASE
                    WHEN i_boolean THEN 'TRUE'
                    ELSE 'FALSE'
                END;
        END IF;

        RETURN l_retvalue;
    END;

  ------------------------------------------------------------------------------------------------

    FUNCTION get_days_since_19700101 (
        i_date IN   DATE
    ) RETURN NATURALN IS
        l_difference   NATURAL;
    BEGIN

    -- NOTE: TO_DATE('1970-01-01', 'YYYY-MM-DD')
        SELECT
            trunc(SYSDATE - i_date)
        INTO l_difference
        FROM
            dual;

        RETURN l_difference;
    END;

  ------------------------------------------------------------------------------------------------

    PROCEDURE output_message_dbms (
        i_message   IN          VARCHAR2 DEFAULT NULL,
        i_label     IN          VARCHAR2 DEFAULT NULL
    ) IS
    BEGIN
        IF is_null_or_whitespace_string(i_label) THEN
            sys.dbms_output.put_line(i_message);
        ELSE
            sys.dbms_output.put_line(i_label
                                     || ': '
                                     || i_message);
        END IF;
    END output_message_dbms;

  ------------------------------------------------------------------------------------------------

    PROCEDURE output_message_apex (
        i_message   IN          VARCHAR2 DEFAULT NULL,
        i_label     IN          VARCHAR2 DEFAULT NULL
    ) IS
        c_message_level   CONSTANT PLS_INTEGER NOT NULL := 1;
    BEGIN
    -- ATTENTION: Logging needs to have been enabled previously by APEX_DEBUG_MESSAGE.ENABLE_DEBUG_MESSAGES(p_level => 3);
        IF is_null_or_whitespace_string(i_label) THEN
            apex_debug_message.log_long_message(i_message, false, c_message_level);
        ELSE
            apex_debug_message.log_long_message(i_label
                                                || ': '
                                                || i_message, false, c_message_level);
        END IF;
    END output_message_apex;

  ------------------------------------------------------------------------------------------------

    PROCEDURE output_message (
        i_message   IN          VARCHAR2 DEFAULT NULL,
        i_label     IN          VARCHAR2 DEFAULT NULL
    ) IS
    BEGIN
        IF '-'
           || v('APP_SESSION')
           || '-' = '--' THEN
            output_message_dbms(i_message, i_label);
        ELSE
            output_message_apex(i_message, i_label);
        END IF;
    END output_message;

  -- OTHER ---------------------------------------------------------------------------------------

    FUNCTION is_valid_guid (
        i_guid IN   guid_t
    ) RETURN BOOLEAN IS
    BEGIN
        RETURN i_guid IS NOT NULL AND length(i_guid) = 32; -- TODO AND REGEXP_LIKE(i_guid, '[a-z][A-Z][0-9]'); -- TODO: unit test this extensively!
    END;

  ------------------------------------------------------------------------------------------------

     FUNCTION get_partial_from_varchar (
        p_varchar_date IN   VARCHAR2
    ) RETURN dl_blacklist.ct_partial_date AS
        l_date         VARCHAR2(24);

    BEGIN
        l_date := regexp_replace(p_varchar_date, '[-.//]', '');
        IF substr(regexp_replace(p_varchar_date, '[-.//]', '.'), 5, 1) <> '.' THEN
            l_date := substr(l_date, 5, 4)
                      || substr(l_date, 3, 2)
                      || substr(l_date, 1, 2);

        END IF;
        --DBMS_OUTPUT.PUT_LINE('v_Return = '  || l_Date); -- Always 'YYYYMMDD'
        l_date := regexp_replace(l_date,'(<<)|(XX)', '00');
        RETURN dl_blacklist.ct_partial_date(substr(l_date, 7, 2), substr(l_date, 5, 2), substr(l_date, 1, 4)); -- Always 'YYYYMMDD'

    END get_partial_from_varchar;


    FUNCTION get_vs$date_from_varchar (
            p_varchar_date IN   VARCHAR2
        ) RETURN VARCHAR2 AS
            l_date         VARCHAR2(24);

        BEGIN
            l_date := regexp_replace(p_varchar_date, '[-.//]', '');
            IF substr(regexp_replace(p_varchar_date, '[-.//]', '.'), 5, 1) <> '.' THEN
                l_date := '00' || substr(l_date, 1, 2)
                          || substr(l_date, 3, 2)
                          || substr(l_date, 5, 2);

            END IF;
            --DBMS_OUTPUT.PUT_LINE('v_Return = '  || l_Date); -- Always 'YYMMDD'

            RETURN substr(l_date, 3, 2)||substr(l_date, 5, 2)||substr(l_date, 7, 2); -- Always 'YYMMDD'

        END get_vs$date_from_varchar;



    -- Lookup-Functions for util_parm
    /* TODO:
    FUNCTION get_parm_value( i_key IN VARCHAR2 )
        RETURN VARCHAR2
    IS
        l_value util_parm.value%TYPE;
    BEGIN
        SELECT  VALUE
        INTO    l_value
        FROM    util_parm
        WHERE   key = i_key
        ;

        RETURN l_value;

    EXCEPTION
        WHEN OTHERS THEN
            RETURN NULL;
    END;

    -- returns collection_name
    FUNCTION get_coll_ident_ins_name
        RETURN VARCHAR2
    IS
        l_value util_parm.value%TYPE;
    BEGIN
        RETURN get_parm_value( i_key => 'COLL_INS_IDENT' );
    END;
    */

  ------------------------------------------------------------------------------------------------

END pkg_dl_utils;
/
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_DL_UTILS" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_DL_UTILS" TO "DL_STAGING4PIBICS_INTF";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_DL_UTILS" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_DL_UTILS" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_DL_UTILS" TO "BIOSAADM";
