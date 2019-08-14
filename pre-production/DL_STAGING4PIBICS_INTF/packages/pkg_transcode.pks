CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS_INTF"."PKG_TRANSCODE" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
    -- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol

    /* These routines use the TRCD-Tables in DL_STAGING4PIBICS_INTF */

    TYPE borderpost_terminal IS RECORD(
         terminal   VARCHAR2(32)
        ,borderpost VARCHAR2(32));

    FUNCTION get_country(p_cd_or_seqno IN VARCHAR2
                        ,p_optional    IN BOOLEAN DEFAULT FALSE) RETURN VARCHAR2;

    FUNCTION get_icao_doc_code(p_cd_or_seqno IN VARCHAR2
                              ,p_optional    IN BOOLEAN DEFAULT FALSE) RETURN VARCHAR2;
    FUNCTION get_continent(p_cd_or_seqno IN VARCHAR2
                          ,p_optional    IN BOOLEAN DEFAULT FALSE) RETURN VARCHAR2;
    FUNCTION get_continent(p_cd_or_seqno IN VARCHAR2
                          ,p_optional    IN NUMBER DEFAULT 0) RETURN VARCHAR2;

    FUNCTION get_visa_type_by_seqno(p_seqno       IN NUMBER
                                   ,p_just_active IN VARCHAR2 DEFAULT 'N') RETURN VARCHAR2;
    FUNCTION get_visa_type_by_cd(p_cd          IN VARCHAR2
                                ,p_just_active IN VARCHAR2 DEFAULT 'N') RETURN VARCHAR2;

    FUNCTION get_doctype(p_cd_or_seqno IN VARCHAR2) RETURN VARCHAR2;

    FUNCTION get_conveyance(p_seqno IN NUMBER) RETURN VARCHAR2 DETERMINISTIC;

    FUNCTION get_region_by_seqno(p_seqno IN NUMBER) RETURN VARCHAR2 DETERMINISTIC;
    FUNCTION get_province_by_seqno(p_seqno IN NUMBER) RETURN VARCHAR2 DETERMINISTIC;
    FUNCTION get_ampur_by_seqno(p_seqno IN NUMBER) RETURN VARCHAR2 DETERMINISTIC;
    --
    FUNCTION get_occupation(p_code_or_seqno IN VARCHAR2) RETURN VARCHAR2;
    FUNCTION get_borderpost_terminal(p_deptcd     IN VARCHAR2
                                    ,p_ip_address IN VARCHAR2
                                    ,p_cardtype   IN VARCHAR2) RETURN borderpost_terminal;
    FUNCTION get_department_by_cd(p_cd IN VARCHAR2) RETURN VARCHAR2;
    FUNCTION get_department_by_seqno(p_seqno IN NUMBER) RETURN VARCHAR2;

    FUNCTION borderpostname(p_name       IN VARCHAR2
                           ,p_dept_seqno IN NUMBER) RETURN VARCHAR2 DETERMINISTIC;

    FUNCTION get_reason_code(p_in VARCHAR2) RETURN VARCHAR2;
    FUNCTION get_reason_seq(p_in VARCHAR2) RETURN VARCHAR2;
    FUNCTION get_doc_class(p_in VARCHAR2) RETURN VARCHAR2;
END pkg_transcode;
/
