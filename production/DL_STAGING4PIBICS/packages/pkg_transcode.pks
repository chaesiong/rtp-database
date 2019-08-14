CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS"."PKG_TRANSCODE" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
    -- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol

    /* Transport of the Lookup tables from PIBICS to DL_STAGING4PIBICS
    These tables are relatively small so they are rewriiten completely
    */

    lc_p_ampur         CONSTANT pkg_utils.process_name := 'AMPUR';
    lc_p_conveyance    CONSTANT pkg_utils.process_name := 'CONVEYANCE';
    lc_p_continent     CONSTANT pkg_utils.process_name := 'CONTINENT';
    lc_p_country       CONSTANT pkg_utils.process_name := 'COUNTRY';
    lc_p_department    CONSTANT pkg_utils.process_name := 'DEPARTMENT';
    lc_p_flightnumbers CONSTANT pkg_utils.process_name := 'FLIGHTNUMBERS';
    lc_p_fs_slipsystem CONSTANT pkg_utils.process_name := 'FS_SLIPSYSTEM';
    lc_p_occupation    CONSTANT pkg_utils.process_name := 'OCCUPATION';
    lc_p_paymentrate   CONSTANT pkg_utils.process_name := 'PAYMENTRATE';
    lc_p_permittype    CONSTANT pkg_utils.process_name := 'PERMITTYPE';
    lc_p_province      CONSTANT pkg_utils.process_name := 'PROVINCE';
    lc_p_rankcrw       CONSTANT pkg_utils.process_name := 'RANKCRW';
    lc_p_region        CONSTANT pkg_utils.process_name := 'REGION';
    lc_p_suffix        CONSTANT pkg_utils.process_name := 'SUFFIX';
    lc_p_tambon        CONSTANT pkg_utils.process_name := 'TAMBON';
    lc_p_transcode     CONSTANT pkg_utils.process_name := 'TRANSCODE';
    lc_p_traveldoctype CONSTANT pkg_utils.process_name := 'TRAVELDOCTYPE';
    lc_p_visabynation  CONSTANT pkg_utils.process_name := 'VISABYNATION';
    lc_p_visatype      CONSTANT pkg_utils.process_name := 'VISATYPE'; --

    PROCEDURE load_ampur;
    PROCEDURE load_conveyance;
    PROCEDURE load_continent;
    PROCEDURE load_country;
    PROCEDURE load_department;
    PROCEDURE load_flightnumbers;
    PROCEDURE load_fs_slipsystem;
    PROCEDURE load_occupation;
    PROCEDURE load_paymentrate;
    PROCEDURE load_permittype;
    PROCEDURE load_province;
    PROCEDURE load_rankcrw;
    PROCEDURE load_region;
    PROCEDURE load_suffix;
    PROCEDURE load_tambon;
    PROCEDURE load_traveldoctype;
    PROCEDURE load_visabynation;
    PROCEDURE load_visatype;

END pkg_transcode;
/
