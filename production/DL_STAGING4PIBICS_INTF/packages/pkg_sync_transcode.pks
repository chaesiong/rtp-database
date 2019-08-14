CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS_INTF"."PKG_SYNC_TRANSCODE" AUTHID DEFINER AS
    -- part of Data transport from PIBICS to Bordercontrol,
    -- See here for a high-level description https://confluence.dc.dermalog.com/display/THA20675/Data+transport+from+PIBICS+to+Bordercontrol
    /*
      Fill the trcd-tables in DL_STAGING4PIBICS_INTF

    */
    err_no_data_merged EXCEPTION;
    PRAGMA EXCEPTION_INIT(err_no_data_merged
                         ,-20000);
    gc_process_name CONSTANT pkg_utils.table_name := 'TRANSCODE';

    gc_t_ampur         CONSTANT pkg_utils.table_name := 'TRCD_AMPUR';
    gc_t_conveyance    CONSTANT pkg_utils.table_name := 'TRCD_CONVEYANCE';
    gc_t_continent     CONSTANT pkg_utils.table_name := 'TRCD_CONTINENT';
    gc_t_country       CONSTANT pkg_utils.table_name := 'TRCD_COUNTRY';
    gc_t_department    CONSTANT pkg_utils.table_name := 'TRCD_DEPARTMENT';
    gc_t_flightnumbers CONSTANT pkg_utils.table_name := 'TRCD_FLIGHTNUMBERS';
    gc_t_occupation    CONSTANT pkg_utils.table_name := 'TRCD_OCCUPATION';
    gc_t_paymentrate   CONSTANT pkg_utils.table_name := 'TRCD_PAYMENTRATE';
    gc_t_permittype    CONSTANT pkg_utils.table_name := 'TRCD_PERMITTYPE';
    gc_t_province      CONSTANT pkg_utils.table_name := 'TRCD_PROVINCE';
    gc_t_rankcrw       CONSTANT pkg_utils.table_name := 'TRCD_RANKCRW';
    gc_t_region        CONSTANT pkg_utils.table_name := 'TRCD_REGION';
    gc_t_suffix        CONSTANT pkg_utils.table_name := 'TRCD_SUFFIX';
    gc_t_tambon        CONSTANT pkg_utils.table_name := 'TRCD_TAMBON';
    gc_t_traveldoctype CONSTANT pkg_utils.table_name := 'TRCD_TRAVELDOCTYPE';
    gc_t_visabynation  CONSTANT pkg_utils.table_name := 'TRCD_VISABYNATION';
    gc_t_visatype      CONSTANT pkg_utils.table_name := 'TRCD_VISATYPE';
    PROCEDURE fill_region;
    PROCEDURE fill_province;
    PROCEDURE fill_ampur;
    PROCEDURE fill_tambon;
    PROCEDURE fill_occupation;
    PROCEDURE fill_suffix;
    PROCEDURE fill_visatype;
    PROCEDURE fill_conveyance;
    PROCEDURE fill_traveldoctype;
    PROCEDURE fill_permittype;
    PROCEDURE fill_paymentrate;
    PROCEDURE fill_country;
    PROCEDURE fill_continent;
    PROCEDURE fill_flightnumbers;
    PROCEDURE fill_visabynation;

END pkg_sync_transcode;
/
