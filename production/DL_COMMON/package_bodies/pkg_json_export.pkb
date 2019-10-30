CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_COMMON"."PKG_JSON_EXPORT" as
    /*******************************************************************************
    * This package allows json export of different tables
    *
    * Author    Date        Description
    * --------  ----------  -------------------------------------------------------*
    * e1mstahl  07.09.2018  Initial release
    *******************************************************************************/

    c_output_date_format    CONSTANT VARCHAR2(32 CHAR) := 'DD.MM.YYYY HH24:MI:SS';

    /************************************************
    * ========== FUNCTIONS AND PROCEDURES ==========
    ************************************************/

    /**
     * Function to export the table VISA_TYPE
     * @param i_id ID of the wanted visa type
     * @return json returns pl/json object
     */
    function get_visa_type( i_id in varchar2) return json
        as
            l_vt_rec dl_common.visa_types%rowtype;  -- Visa types
            l_vt_json json;                         -- Visa types JSON
        begin
            begin
                select
                    vt.key_value,
                    vt.locale,
                    vt.display_value,
                    vt.display_value,
                    vt.notice,
                    vt.num_value,
                    vt.is_active,
                    vt.trans_mode,
                    vt.icao_dc_list,
                    vt.permit_days,
                    vt.can_edit_expiry_dt,
                    vt.auto_generate_visa,
                    vt.ins_at,
                    vt.ins_by,
                    vt.dml_at,
                    vt.dml_by,
                    vt.dml_type
                into
                    l_vt_rec.key_value,
                    l_vt_rec.locale,
                    l_vt_rec.display_value,
                    l_vt_rec.display_value,
                    l_vt_rec.notice,
                    l_vt_rec.num_value,
                    l_vt_rec.is_active,
                    l_vt_rec.trans_mode,
                    l_vt_rec.icao_dc_list,
                    l_vt_rec.permit_days,
                    l_vt_rec.can_edit_expiry_dt,
                    l_vt_rec.auto_generate_visa,
                    l_vt_rec.ins_at,
                    l_vt_rec.ins_by,
                    l_vt_rec.dml_at,
                    l_vt_rec.dml_by,
                    l_vt_rec.dml_type
                from dl_common.visa_types vt
                where vt.key_value = i_id;

                exception
                when no_data_found then
                    l_vt_json := json();
                    return l_vt_json;
            end;

            l_vt_json := json();
                l_vt_json.put( 'id'                    , l_vt_rec.key_value );
                l_vt_json.put( 'locale'                , l_vt_rec.locale );
                l_vt_json.put( 'displayValue'          , l_vt_rec.display_value );
                l_vt_json.put( 'displayOrder'          , l_vt_rec.display_order );
                l_vt_json.put( 'notice'                , l_vt_rec.notice );
                l_vt_json.put( 'numValue'              , l_vt_rec.num_value );
                l_vt_json.put( 'isActiveFlag'          , l_vt_rec.is_active );
                l_vt_json.put( 'transModeId'           , l_vt_rec.trans_mode );
                l_vt_json.put( 'icaoDocListId'         , l_vt_rec.icao_dc_list );
                l_vt_json.put( 'permitDays'            , l_vt_rec.permit_days );
                l_vt_json.put( 'canEditExpiryDateFlag' , l_vt_rec.can_edit_expiry_dt );
                l_vt_json.put( 'autoGenerateVisaFlag'  , l_vt_rec.auto_generate_visa );
                l_vt_json.put( 'createdAt'             , TO_CHAR(l_vt_rec.ins_at, c_output_date_format ));
                l_vt_json.put( 'createdBy'             , l_vt_rec.ins_by );
                l_vt_json.put( 'lastModifiedAt'        , TO_CHAR(l_vt_rec.dml_at, c_output_date_format ));
                l_vt_json.put( 'lastModifiedBy'        , l_vt_rec.dml_by );
                l_vt_json.put( 'lastModifiedType'      , l_vt_rec.dml_type );
            return l_vt_json;
        end;

    /**
     * Function to export the table HUMAN_SEXES
     * @param i_id ID of the wanted human sex
     * @return json returns pl/json object
     */
    function get_human_sex( i_id in varchar2) return clob
    as
        l_hs_rec dl_common.human_sexes%rowtype;
        l_hs_json json;
        --
        l_result clob;
    begin

    dbms_lob.createtemporary( l_result, true );
        begin
            select
                hs.key_value,
                hs.locale,
                hs.display_value,
                hs.display_order,
                hs.is_active,
                hs.dml_at,
                hs.dml_by,
                hs.dml_type,
                hs.ins_at,
                hs.ins_by,
                hs.notice,
                hs.iso5218,
                hs.icao,
                hs.num_value,
                hs.row_flag_mask
            into
                l_hs_rec.key_value,
                l_hs_rec.locale,
                l_hs_rec.display_value,
                l_hs_rec.display_order,
                l_hs_rec.is_active,
                l_hs_rec.dml_at,
                l_hs_rec.dml_by,
                l_hs_rec.dml_type,
                l_hs_rec.ins_at,
                l_hs_rec.ins_by,
                l_hs_rec.notice,
                l_hs_rec.iso5218,
                l_hs_rec.icao,
                l_hs_rec.num_value,
                l_hs_rec.row_flag_mask
            from dl_common.human_sexes hs
            where hs.key_value = i_id;

            exception
            when no_data_found then
                l_hs_json := json();
                l_hs_json.to_clob(l_result);
                return l_result;
        end;

        l_hs_json := json();
            l_hs_json.put( 'id'                 , l_hs_rec.key_value );
            l_hs_json.put( 'locale'             , l_hs_rec.locale );
            l_hs_json.put( 'displayValue'       , l_hs_rec.display_value );
            l_hs_json.put( 'displayOrder'       , l_hs_rec.display_order );
            l_hs_json.put( 'isActive'           , l_hs_rec.is_active );
            l_hs_json.put( 'lastModifiedAt'     , TO_CHAR(l_hs_rec.dml_at , c_output_date_format ));
            l_hs_json.put( 'lastModifiedBy'     , l_hs_rec.dml_by );
            l_hs_json.put( 'lastModifiedType'   , l_hs_rec.dml_type );
            l_hs_json.put( 'createdAt'          , TO_CHAR(l_hs_rec.ins_at , c_output_date_format ));
            l_hs_json.put( 'createdBy'          , l_hs_rec.ins_by );
            l_hs_json.put( 'notice'             , l_hs_rec.notice );
            l_hs_json.put( 'iso5218'            , l_hs_rec.iso5218 );
            l_hs_json.put( 'icao'               , l_hs_rec.icao );
            l_hs_json.put( 'numValue'           , l_hs_rec.num_value );
            l_hs_json.put( 'rowFlagMask'        , l_hs_rec.row_flag_mask );
        l_hs_json.to_clob(l_result);
        return l_result;
    end;
end pkg_json_export;
/
  GRANT EXECUTE ON "DL_COMMON"."PKG_JSON_EXPORT" TO "DL_INTERFACE";
  GRANT EXECUTE ON "DL_COMMON"."PKG_JSON_EXPORT" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_COMMON"."PKG_JSON_EXPORT" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_COMMON"."PKG_JSON_EXPORT" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_COMMON"."PKG_JSON_EXPORT" TO "BIOSUPPORT";
