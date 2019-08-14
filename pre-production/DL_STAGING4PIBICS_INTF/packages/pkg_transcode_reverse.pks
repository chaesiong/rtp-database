CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS_INTF"."PKG_TRANSCODE_REVERSE" AS

    /*******************************************************************************
     * ???
     *
     * Author    Date        Description
     * --------  ----------  -------------------------------------------------------*
     * CHageman  27.10.2018  Added
     *******************************************************************************/

    FUNCTION get_ampur_seqno (p_key_value  IN trcd_ampur.key_value%TYPE)
    RETURN trcd_ampur.seqno%TYPE;

    FUNCTION get_borderpost_seqno (p_key_value IN trcd_borderpost.key_value%TYPE)
    RETURN trcd_borderpost.seqno%TYPE;

    FUNCTION get_continent_seqno (p_key_value IN trcd_continent.key_value%TYPE)
    RETURN trcd_continent.seqno%TYPE;

    FUNCTION get_conveyance_seqno (p_key_value IN trcd_conveyance.key_value%TYPE)
    RETURN trcd_conveyance.seqno%TYPE;

    FUNCTION get_country_seqno (p_key_value IN trcd_country.key_value%TYPE)
    RETURN trcd_country.seqno%TYPE;

    FUNCTION get_flightnumbers_seqno (p_key_value IN trcd_flightnumbers.key_value%TYPE)
    RETURN trcd_flightnumbers.seqno%TYPE;

    FUNCTION get_icao_doc_codes_seqno (p_key_value IN trcd_icao_doc_codes.key_value%TYPE)
    RETURN trcd_icao_doc_codes.seqno%TYPE;

    FUNCTION get_occupation_seqno (p_key_value IN trcd_occupation.key_value%TYPE)
    RETURN trcd_occupation.seqno%TYPE;

    FUNCTION get_paymentrate_seqno (p_key_value IN trcd_paymentrate.key_value%TYPE)
    RETURN trcd_paymentrate.seqno%TYPE;

    FUNCTION get_permittype_seqno (p_key_value IN trcd_permittype.key_value%TYPE)
    RETURN trcd_permittype.seqno%TYPE;

    FUNCTION get_province_seqno (p_key_value IN trcd_province.key_value%TYPE)
    RETURN trcd_province.seqno%TYPE;

    FUNCTION get_rankcrw_seqno (p_key_value IN trcd_rankcrw.key_value%TYPE)
    RETURN trcd_rankcrw.rankcrw_seqno%TYPE;

    FUNCTION get_region_seqno (p_key_value IN trcd_region.key_value%TYPE)
    RETURN trcd_region.seqno%TYPE;

    FUNCTION get_suffix_seqno (p_key_value IN trcd_suffix.key_value%TYPE)
    RETURN trcd_suffix.seqno%TYPE;

    FUNCTION get_tambon_seqno (p_key_value IN trcd_tambon.key_value%TYPE)
    RETURN trcd_tambon.seqno%TYPE;

    FUNCTION get_traveldoctype_seqno (p_key_value IN trcd_traveldoctype.key_value%TYPE)
    RETURN trcd_traveldoctype.seqno%TYPE;

    FUNCTION get_visatype_seqno (p_key_value IN trcd_visatype.key_value%TYPE)
    RETURN trcd_visatype.seqno%TYPE;
    
    FUNCTION get_relation_seqno (p_key_value IN varchar2)
    RETURN int;

    FUNCTION get_movement_seqno (p_key_value IN sync_movements.mvmntid%TYPE)
    RETURN sync_movements.seqno%TYPE;

END pkg_transcode_reverse;
/
