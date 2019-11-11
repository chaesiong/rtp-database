CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."XLIB_COMPONENT" AS
/*=========================================================================
   FILE  :  $Id: xlib_component.pkb 57 2013-05-13 07:09:51Z dietmar.aust $
=========================================================================*/

    TYPE vc2_arr_t IS
        TABLE OF VARCHAR2(32767 CHAR) INDEX BY BINARY_INTEGER;

    PROCEDURE create_component (
        p_name            xlib_components.comp_name%TYPE,
        p_version         xlib_components.comp_version%TYPE,
        p_version_label   xlib_components.comp_version_label%TYPE DEFAULT NULL,
        p_depends_on      xlib_components.comp_depends_on%TYPE DEFAULT NULL
    )
        IS
    BEGIN
        INSERT INTO xlib_components (
            comp_id,
            comp_name,
            comp_version,
            comp_version_label,
            comp_depends_on
        ) VALUES (
            xlib_seq.NEXTVAL,
            p_name,
            p_version,
            p_version_label,
            p_depends_on
        );

    END;

    PROCEDURE set_component (
        p_name            xlib_components.comp_name%TYPE,
        p_version         xlib_components.comp_version%TYPE,
        p_version_label   xlib_components.comp_version_label%TYPE DEFAULT NULL,
        p_depends_on      xlib_components.comp_depends_on%TYPE DEFAULT NULL
    )
        IS
    BEGIN
        INSERT INTO xlib_components (
            comp_id,
            comp_name,
            comp_version,
            comp_version_label,
            comp_depends_on
        ) VALUES (
            xlib_seq.NEXTVAL,
            p_name,
            p_version,
            p_version_label,
            p_depends_on
        );

    EXCEPTION
        WHEN dup_val_on_index THEN
            UPDATE xlib_components
                SET
                    comp_version = p_version,
                    comp_version_label = p_version_label,
                    comp_depends_on = p_depends_on
            WHERE
                comp_name = p_name;

            IF
                SQL%rowcount = 0
            THEN
                raise_application_error(-20006,'component '
                || p_name
                || ' not found');
            END IF;

    END;

    PROCEDURE delete_component (
        p_name   IN xlib_components.comp_name%TYPE
    )
        IS
    BEGIN
      -- delete component
        DELETE FROM xlib_components WHERE
            comp_name = p_name;

        IF
            SQL%rowcount = 0
        THEN
            raise_application_error(-20001,'Component '
            || p_name
            || ' not found');
        END IF;

    END;

    FUNCTION split_string (
        p_str   IN VARCHAR2,
        p_sep   IN VARCHAR2 DEFAULT ','
    ) RETURN vc2_arr_t AS

        l_string      VARCHAR2(32767) := p_str
        || p_sep;
        l_sep_index   PLS_INTEGER;
        l_index       PLS_INTEGER := 1;
        l_tab         vc2_arr_t;
    BEGIN
      -- assertions
        IF
            length(p_sep) != 1
        THEN
            raise_application_error(-20004,'wrong separator format, must be only one character');
        END IF;

        LOOP
            l_sep_index := instr(l_string,p_sep,l_index);
            EXIT WHEN l_sep_index = 0;
            l_tab(l_tab.count) := substr(l_string,l_index,l_sep_index - l_index);

            l_index := l_sep_index + 1;
        END LOOP;

        RETURN l_tab;
    END;

    FUNCTION get_version (
        p_name   IN xlib_components.comp_name%TYPE
    ) RETURN xlib_components.comp_version%TYPE IS
        l_version   xlib_components.comp_version%TYPE;
    BEGIN
        SELECT
            comp_version
        INTO
            l_version
        FROM
            xlib_components
        WHERE
            comp_name = p_name;

        RETURN l_version;
    END;

    PROCEDURE assert_version_format (
        p_version IN VARCHAR2
    ) IS
        l_tab   vc2_arr_t;
        l_num   NUMBER;
    BEGIN
      -- '.' at the beginning or end of the version?
        IF
            substr(p_version,1,1) = '.' OR substr(p_version,length(p_version),1) = '.' OR instr(p_version,' ') > 0
        THEN
            raise_application_error(-20002,'wrong version format');
        END IF;

        l_tab := split_string(p_version,'.');
        FOR i IN 0..l_tab.count - 1 LOOP
            l_num := to_number(l_tab(i) );
        END LOOP;

    EXCEPTION
        WHEN OTHERS THEN
            IF
                sqlcode =-6502   /* numeric or value error */
            THEN
                raise_application_error(-20005,'wrong version format, no numbers.');
            ELSE
                RAISE;
            END IF;
    END;

    FUNCTION make_version_string (
        p_version IN VARCHAR2
    ) RETURN VARCHAR2 IS
        l_num_dots   NUMBER;
        l_tab        vc2_arr_t;
        l_str        VARCHAR2(32767 CHAR);
        l_comp       VARCHAR2(50 CHAR);
    BEGIN
      -- assertions
        assert_version_format(p_version => p_version);
        l_tab := split_string(p_version,'.');
        FOR i IN 1..c_num_version_components LOOP
            IF
                l_tab.EXISTS(i - 1)
            THEN
                l_comp := TO_CHAR(to_number(nvl(l_tab(i - 1),'0') ),'FM0000');
            ELSE
                l_comp := '0000';
            END IF;

            IF
                l_str IS NULL
            THEN
                l_str := l_comp;
            ELSE
                l_str := l_str
                || '.'
                || l_comp;
            END IF;

        END LOOP;

        RETURN l_str;
    END;

    PROCEDURE verify_required_component (
        p_comp_name          IN VARCHAR2,
        p_comp_version_min   IN VARCHAR2
    ) IS
        l_current_version   VARCHAR2(50);
    BEGIN
        l_current_version := xlib_component.get_version(p_name => p_comp_name);
        IF
            make_version_string(l_current_version) >= make_version_string(p_comp_version_min)
        THEN
            NULL;   -- ok
        ELSE
            raise_application_error(-20020,'this upgrade requires '
            || p_comp_name
            || ' in version '
            || p_comp_version_min
            || ' or higher, not version '
            || l_current_version);
        END IF;

    END;

END xlib_component;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."XLIB_COMPONENT" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."XLIB_COMPONENT" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."XLIB_COMPONENT" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."XLIB_COMPONENT" TO "BIOSAADM";
