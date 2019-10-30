CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS_INTF"."PKG_FROM_PIBICS" AS

    FUNCTION cardtype(p_cardtype IN VARCHAR2) RETURN INTEGER AS
        l_result INTEGER;
    BEGIN
        CASE to_number(p_cardtype)
            WHEN 2 THEN
                l_result := 1;
            WHEN 1 THEN
                l_result := 0;
            ELSE
                l_result := NULL;
        END CASE;

        RETURN l_result;
    END cardtype;

    FUNCTION birthdte(p_birthdte IN VARCHAR2) RETURN VARCHAR2 IS
        l_result VARCHAR2(6);
    BEGIN
        l_result := to_char(to_date(p_birthdte DEFAULT NULL ON conversion error
                                   ,'DD/MM/YYYY')
                           ,'YYMMDD');
        RETURN l_result;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN NULL;
    END birthdte;

    FUNCTION birthdte_date(p_birthdte IN VARCHAR2) RETURN DATE IS
        l_result DATE;
    BEGIN
        l_result := to_date(p_birthdte DEFAULT NULL ON conversion error
                           ,'DD/MM/YYYY');
        RETURN l_result;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN NULL;
    END birthdte_date;

    FUNCTION sex(p_sex IN VARCHAR2) RETURN VARCHAR2 IS
    BEGIN
        RETURN CASE p_sex WHEN 'F' THEN '2' WHEN 'M' THEN '1' ELSE '?' END;
    END sex;

END pkg_from_pibics;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_FROM_PIBICS" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_FROM_PIBICS" TO "PIBICSAPP";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_FROM_PIBICS" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_FROM_PIBICS" TO "BIOSUPPORT";
