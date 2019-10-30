CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS_INTF"."PKG_TRANSCODE" AS
    /*
       see architectural description at https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+Dermalog+staging+System+to+Bordercontrol

    */
    g_terminal_borderpost_in pkg_hacks.terminal_borderpost_r;
    FUNCTION get_country(p_cd_or_seqno IN VARCHAR2
                        ,p_optional    IN BOOLEAN DEFAULT FALSE) RETURN VARCHAR2 IS
        l_res trcd_country.key_value%TYPE;
    BEGIN
        SELECT key_value
        INTO l_res
        FROM trcd_country t
        WHERE to_char(t.seqno) = p_cd_or_seqno;
        RETURN l_res;
    EXCEPTION
        WHEN no_data_found THEN
            BEGIN
                SELECT key_value
                INTO l_res
                FROM trcd_country t
                WHERE t.code = p_cd_or_seqno;
                RETURN l_res;
            EXCEPTION
                WHEN no_data_found THEN
                    IF p_optional THEN
                        RETURN NULL;
                    ELSE
                        RAISE no_data_found;
                    END IF;
            END;
    END get_country;

    FUNCTION get_icao_doc_code(p_cd_or_seqno IN VARCHAR2
                              ,p_optional    IN BOOLEAN DEFAULT FALSE) RETURN VARCHAR2 IS
        l_res trcd_icao_doc_codes.key_value%TYPE;
    BEGIN
        SELECT key_value
        INTO l_res
        FROM trcd_icao_doc_codes t
        WHERE to_char(t.seqno) = p_cd_or_seqno;
        RETURN l_res;
    EXCEPTION
        WHEN no_data_found THEN
            BEGIN
                SELECT key_value
                INTO l_res
                FROM trcd_icao_doc_codes t
                WHERE t.code = p_cd_or_seqno;
                RETURN l_res;
            EXCEPTION
                WHEN no_data_found THEN
                    IF p_optional THEN
                        RETURN NULL;
                    ELSE
                        RAISE no_data_found;
                    END IF;
            END;
    END get_icao_doc_code;

    FUNCTION get_continent(p_cd_or_seqno IN VARCHAR2
                          ,p_optional    IN BOOLEAN DEFAULT FALSE) RETURN VARCHAR2 IS
        l_res trcd_country.key_value%TYPE;
    BEGIN
        SELECT key_value
        INTO l_res
        FROM trcd_continent t
        WHERE to_char(t.seqno) = p_cd_or_seqno;
        RETURN l_res;
    EXCEPTION
        WHEN no_data_found THEN
            BEGIN
                SELECT key_value
                INTO l_res
                FROM trcd_continent t
                WHERE t.code = p_cd_or_seqno;
                RETURN l_res;
            EXCEPTION
                WHEN no_data_found THEN
                    IF p_optional THEN
                        RETURN NULL;
                    ELSE
                        RAISE no_data_found;
                    END IF;
            END;
    END get_continent;

    FUNCTION get_continent(p_cd_or_seqno IN VARCHAR2
                          ,p_optional    IN NUMBER DEFAULT 0) RETURN VARCHAR2 IS
    BEGIN
        IF p_optional = 1 THEN
            RETURN get_continent(p_cd_or_seqno => p_cd_or_seqno
                                ,p_optional    => TRUE);
        ELSE
            RETURN get_continent(p_cd_or_seqno => p_cd_or_seqno
                                ,p_optional    => FALSE);
        END IF;
    END get_continent;

    FUNCTION get_occupation(p_code_or_seqno IN VARCHAR2) RETURN VARCHAR2 IS
        l_res trcd_occupation.key_value%TYPE;
    BEGIN
        SELECT key_value
        INTO l_res
        FROM trcd_occupation t
        WHERE (1=1)
        --and t.seqno = p_code_or_seqno
        and t.code = p_code_or_seqno
        AND rownum = 1;
        RETURN l_res;
    EXCEPTION
        WHEN no_data_found THEN
            RETURN NULL;
    END get_occupation;

    -- TODO: Added by C.Hagemann 04.07.2018
    FUNCTION get_visa_type_by_seqno(p_seqno       IN NUMBER
                                   ,p_just_active IN VARCHAR2 DEFAULT 'N') RETURN VARCHAR2 IS
        l_res trcd_visatype.key_value%TYPE;
    BEGIN
        SELECT key_value
        INTO l_res
        FROM trcd_visatype t
        WHERE t. seqno = p_seqno;
        RETURN l_res;
    EXCEPTION
        WHEN no_data_found THEN
            RETURN NULL;
    END get_visa_type_by_seqno;

    -- TODO: Added by C.Hagemann 04.07.2018
    FUNCTION get_visa_type_by_cd(p_cd          IN VARCHAR2
                                ,p_just_active IN VARCHAR2 DEFAULT 'N') RETURN VARCHAR2 IS
        l_res trcd_visatype.key_value%TYPE;
    BEGIN
        SELECT key_value
        INTO l_res
        FROM trcd_visatype t
        WHERE t.code = p_cd;
        RETURN l_res;
    EXCEPTION
        WHEN no_data_found THEN
            RETURN NULL;
    END get_visa_type_by_cd;

    FUNCTION get_doctype(p_cd_or_seqno IN VARCHAR2) RETURN VARCHAR2 IS
        l_res trcd_traveldoctype.key_value%TYPE;
    BEGIN
        SELECT key_value
        INTO l_res
        FROM trcd_traveldoctype t
        WHERE t.seqno = to_number(p_cd_or_seqno DEFAULT NULL ON conversion error);
        RETURN l_res;
    EXCEPTION
        WHEN no_data_found THEN
            BEGIN
                SELECT key_value
                INTO l_res
                FROM trcd_traveldoctype t
                WHERE t.code = p_cd_or_seqno;
                RETURN l_res;
            EXCEPTION
                WHEN no_data_found THEN
                    RETURN NULL;
            END;
    END get_doctype;

    FUNCTION get_region_by_seqno(p_seqno IN NUMBER) RETURN VARCHAR2 DETERMINISTIC IS
        l_res trcd_region.key_value%TYPE;
    BEGIN
        SELECT key_value
        INTO l_res
        FROM trcd_region t
        WHERE t.seqno = p_seqno;
        RETURN l_res;
    EXCEPTION
        WHEN no_data_found THEN
            RETURN NULL;

    END get_region_by_seqno;

    FUNCTION get_province_by_seqno(p_seqno IN NUMBER) RETURN VARCHAR2 DETERMINISTIC IS
        l_res trcd_region.key_value%TYPE;
    BEGIN
        SELECT key_value
        INTO l_res
        FROM trcd_province t
        WHERE t.seqno = p_seqno;
        RETURN l_res;
    EXCEPTION
        WHEN no_data_found THEN
            RETURN NULL;
    END get_province_by_seqno;

    FUNCTION get_ampur_by_seqno(p_seqno IN NUMBER) RETURN VARCHAR2 DETERMINISTIC IS
        l_res trcd_region.key_value%TYPE;
    BEGIN
        SELECT key_value
        INTO l_res
        FROM trcd_ampur t
        WHERE t.seqno = p_seqno;
        RETURN l_res;
    EXCEPTION
        WHEN no_data_found THEN
            RETURN NULL;
    END get_ampur_by_seqno;

    FUNCTION get_conveyance(p_seqno IN NUMBER) RETURN VARCHAR2 DETERMINISTIC IS
        l_res trcd_conveyance.key_value%TYPE;
    BEGIN
        SELECT key_value
        INTO l_res
        FROM trcd_conveyance
        WHERE seqno = p_seqno;

        RETURN l_res;
    EXCEPTION
        WHEN no_data_found THEN
            RETURN NULL;
    END get_conveyance;

    FUNCTION get_borderpost_terminal(p_deptcd     IN VARCHAR2
                                    ,p_ip_address IN VARCHAR2
                                    ,p_cardtype   IN VARCHAR2) RETURN borderpost_terminal IS
        --ignore unused parameter for now
        l_res borderpost_terminal;
        l_cnt NUMBER;
    BEGIN
        -- if borderpost does not match return dummy values for both
        BEGIN
            SELECT t.key_value
            INTO l_res.borderpost
            FROM trcd_borderpost t
            WHERE to_char(t.seqno) = p_deptcd;
        EXCEPTION
            WHEN no_data_found THEN
                l_res.borderpost := g_terminal_borderpost_in.borderpost;
                l_res.terminal   := g_terminal_borderpost_in.terminal;
                logger.log_error('No Borderpost found for DEPTCD = ' || p_deptcd);
                RETURN l_res;
        END;
        SELECT coalesce(COUNT(*)
                       ,0)
        INTO l_cnt
        FROM dl_bordercontrol.terminals t
        WHERE t.border_post = l_res.borderpost
        AND ipaddress = p_ip_address;

        IF l_cnt = 1 THEN
            -- if the ip address matches, fine
            l_res.terminal := p_ip_address;
        ELSE
            -- give one of the correct ip addresses
            SELECT ipaddress
            INTO l_res.terminal
            FROM dl_bordercontrol.terminals t
            WHERE t.border_post = l_res.borderpost
            AND rownum = 1;
        END IF;
        RETURN l_res;
    END get_borderpost_terminal;

    FUNCTION get_department_by_cd(p_cd IN VARCHAR2) RETURN VARCHAR2 IS
    BEGIN
        RETURN NULL;
    END get_department_by_cd;

    FUNCTION get_department_by_seqno(p_seqno IN NUMBER) RETURN VARCHAR2 IS
    BEGIN
        RETURN NULL;
    END get_department_by_seqno;

    FUNCTION borderpostname(p_name       IN VARCHAR2
                           ,p_dept_seqno IN NUMBER) RETURN VARCHAR2 DETERMINISTIC IS
        l_res VARCHAR2(200);
    BEGIN
        IF TRIM(p_name) IS NULL THEN
            l_res := '(' || p_dept_seqno || ')';
        ELSE
            l_res := upper(p_name);
        END IF;
        RETURN l_res;
    END borderpostname;

    FUNCTION get_reason_code(p_in VARCHAR2) RETURN VARCHAR2 IS
        l_res VARCHAR2(200);
    BEGIN
        SELECT key_value
        INTO l_res
        FROM dl_common.reason_codes rc
        --WHERE rc.key_value = to_number(p_in);
        WHERE rc.NOTICE = p_in;
        RETURN l_res;
    END;
    
    FUNCTION get_reason_seq(p_in VARCHAR2) RETURN VARCHAR2 IS
        l_res VARCHAR2(200);
    BEGIN
        SELECT key_value
        INTO l_res
        FROM dl_common.reason_codes rc
        WHERE rc.NOTICE = p_in;
        RETURN l_res;
    END;
    
    FUNCTION get_doc_class(p_in VARCHAR2) RETURN VARCHAR2 IS
        l_res VARCHAR2(200);
    BEGIN
        RETURN l_res;
    END;

BEGIN
    g_terminal_borderpost_in := pkg_hacks.get_dummy_terminal_in;
END pkg_transcode;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_TRANSCODE" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_TRANSCODE" TO "PIBICSAPP";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_TRANSCODE" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_TRANSCODE" TO "BIOSUPPORT";
