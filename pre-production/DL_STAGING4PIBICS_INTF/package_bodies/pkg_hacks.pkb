CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS_INTF"."PKG_HACKS" AS
    gc_borderpost_name CONSTANT VARCHAR2(100) := 'ระหว่างทดสอบ';
    FUNCTION get_dummy_terminal_in RETURN terminal_borderpost_r IS
        l_res terminal_borderpost_r;
    BEGIN
        SELECT t.id
              ,t.border_post
        INTO l_res.terminal
            ,l_res.borderpost
        FROM dl_bordercontrol.terminals t
        INNER JOIN dl_bordercontrol.borderposts b
        ON b.key_value = t.border_post
        WHERE b.name = gc_borderpost_name
        AND t.defaultexitflg = 0;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE no_data_found;
        END IF;
        RETURN l_res;
    END get_dummy_terminal_in;

    FUNCTION get_dummy_terminal_out RETURN terminal_borderpost_r IS
        l_res terminal_borderpost_r;
    BEGIN
        SELECT t.id
              ,t.border_post
        INTO l_res.terminal
            ,l_res.borderpost
        FROM dl_bordercontrol.terminals t
        INNER JOIN dl_bordercontrol.borderposts b
        ON b.key_value = t.border_post
        WHERE b.name = gc_borderpost_name
        AND t.defaultexitflg = 1;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE no_data_found;
        END IF;
        RETURN l_res;
    END get_dummy_terminal_out;

BEGIN
    pkg_preferences.get_and_use_logger_preferences;
END pkg_hacks;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_HACKS" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_HACKS" TO "PIBICSAPP";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_HACKS" TO "TRAINEE";
