CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_JSON_EXPORT" as
/*******************************************************************************
 * This package provides several functions connected to the data to JSON export
 *
 * Author    Date        Description
 * --------  ----------  -------------------------------------------------------*
 * e1mstahl  06.09.2018  Initial release
 * e1mstahl  31.10.2018  Format date, fixed dob and calc dob
 *******************************************************************************/

    /************************************************
    * ========== FUNCTIONS AND PROCEDURES ==========
    ************************************************/

    /**
    * Function to convert blob images to clob base 64
    * @param p_blob blob image in
    * @return l_base64 base64 as pljson_value
    */
    function resize_img (p_blob in blob) RETURN BLOB
    as
    vSizedImage BLOB;
    begin
    
     if p_blob is null then
                return p_blob;
    end if;

    DBMS_Lob.createTemporary(vSizedImage, FALSE, DBMS_LOB.CALL);
    ORDSYS.OrdImage.processCopy(p_blob, 'maxscale=120 160', vSizedImage);
    
     return vSizedImage;
    
    EXCEPTION
    WHEN OTHERS
    THEN

    return p_blob;

   end;
    
    function convert_image(p_blob in blob) return json_value
        as
            l_img clob;         -- image as base64
            l_b64 json_value;   -- base64 as pljson value
        begin
            if p_blob is null then
                return l_b64;
            end if;

            -- convert image from blob to base64 in clob
            l_img := apex_web_service.blob2clobbase64( p_blob );
            -- transform image clob to pljson value
            l_b64 := pljson_value( l_img );

            return l_b64;
        end;
        
     function convert_image_toclob(p_blob in blob) return clob
        as
            l_img clob;         -- image as base64
        begin
            if p_blob is null then
                return l_img;
            end if;

            -- convert image from blob to base64 in clob
            l_img := apex_web_service.blob2clobbase64( p_blob );

            return l_img;
        end;

    /**
    * Function to export the table BORDERDOCIMAGES
    * @param p_id ID of the borderdocument associated with images
    * @return json returns pl/json object
    */
    function get_borderdocimages(p_id in varchar2) return json_list
        as
            l_bi_json json_list;        -- Borderdocument Images JSON
            l_bi_json_one json;         -- Borderdocument Images JSON
            l_bd_img_cnt number(4);     -- Counter variable to check if images exist
        begin
            -- fill and then insert Border Images if exist
            l_bi_json := json_list();

            select count(*)
            into l_bd_img_cnt
            from dl_bordercontrol.borderdocimages bi
            where bi.brddocid = p_id;

            if ( l_bd_img_cnt > 0) then

                for l_bi_rec in (select
                                    bi.brddocid,
                                    bi.seqno,
                                    bi.image,
                                    bi.ins_at,
                                    bi.ins_by,
                                    bi.dml_at,
                                    bi.dml_by,
                                    bi.dml_type,
                                    bi.ins_terminal,
                                    bi.ins_borderpost
                                from dl_bordercontrol.borderdocimages bi
                                where bi.brddocid = p_id
                                )
                loop
                    l_bi_json_one := json();
                        l_bi_json_one.put( 'borderdocumentId'      , l_bi_rec.brddocid );
                        l_bi_json_one.put( 'seqno'                 , l_bi_rec.seqno );
                        l_bi_json_one.put( 'image'                 , convert_image( l_bi_rec.image ) ) ;
                        --l_bi_json_one.put( 'image'                 , convert_image( resize_img(l_bi_rec.image) ) ) ;
                        l_bi_json_one.put( 'createdAt'             , to_char( l_bi_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                        l_bi_json_one.put( 'createdBy'             , translate(l_bi_rec.ins_by, chr(10), '') );
                        l_bi_json_one.put( 'lastModifiedAt'        , to_char( l_bi_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                        l_bi_json_one.put( 'lastModifiedBy'        , translate(l_bi_rec.dml_by, chr(10), '') );
                        l_bi_json_one.put( 'lastModifiedAction'    , l_bi_rec.dml_type );
                        l_bi_json_one.put( 'createdAtTerminalId'   , l_bi_rec.ins_terminal );
                        l_bi_json_one.put( 'createdAtBorderpostId' , l_bi_rec.ins_borderpost );
                    l_bi_json.append( l_bi_json_one.to_json_value() );
                end loop;
            end if;
            return l_bi_json;
        end;

    /**
     * Function to export the table THAIPASSPORT
     * @param p_id ID of the wanted thaipassport
     * @return json returns pl/json object
     */
    function get_thaipassport(p_id in varchar2) return json
        as
            l_tp_rec dl_bordercontrol.thaipassport%rowtype; -- Thaipassport
            l_tp_json json;                                 -- Thaipassport JSON
        begin
            begin
                select
                    tp.citizenid,
                    tp.personid,
                    tp.passportno,
                    tp.passno,
                    tp.tfamilynm,
                    tp.tfirstnm,
                    tp.tmiddlenm,
                    tp.efamilynm,
                    tp.efirstnm,
                    tp.emiddlenm,
                    tp.sex,
                    tp.nationcd,
                    tp.height,
                    tp.weight,
                    tp.addr,
                    tp.district,
                    tp.citycd,
                    tp.statecd,
                    tp.zipcode,
                    tp.telno,
                    tp.passportdte,
                    tp.passportexpdte,
                    tp.microrollno,
                    tp.micropicno,
                    tp.micropicnol,
                    tp.birthdte,
                    tp.imgpass,
                    tp.birthplace,
                    tp.domicile,
                    tp.pps_seqno,
                    tp.pass_seqno,
                    tp.create_date,
                    tp.update_date,
                    tp.typedpassport,
                    tp.tmppass_seqno,
                    tp.key_value,
                    tp.ins_at,
                    translate(tp.ins_by, chr(13), ''),
                    tp.dml_at,
                    translate(tp.dml_by, chr(13), ''),
                    tp.dml_type
                into
                    l_tp_rec.citizenid,
                    l_tp_rec.personid,
                    l_tp_rec.passportno,
                    l_tp_rec.passno,
                    l_tp_rec.tfamilynm,
                    l_tp_rec.tfirstnm,
                    l_tp_rec.tmiddlenm,
                    l_tp_rec.efamilynm,
                    l_tp_rec.efirstnm,
                    l_tp_rec.emiddlenm,
                    l_tp_rec.sex,
                    l_tp_rec.nationcd,
                    l_tp_rec.height,
                    l_tp_rec.weight,
                    l_tp_rec.addr,
                    l_tp_rec.district,
                    l_tp_rec.citycd,
                    l_tp_rec.statecd,
                    l_tp_rec.zipcode,
                    l_tp_rec.telno,
                    l_tp_rec.passportdte,
                    l_tp_rec.passportexpdte,
                    l_tp_rec.microrollno,
                    l_tp_rec.micropicno,
                    l_tp_rec.micropicnol,
                    l_tp_rec.birthdte,
                    l_tp_rec.imgpass,
                    l_tp_rec.birthplace,
                    l_tp_rec.domicile,
                    l_tp_rec.pps_seqno,
                    l_tp_rec.pass_seqno,
                    l_tp_rec.create_date,
                    l_tp_rec.update_date,
                    l_tp_rec.typedpassport,
                    l_tp_rec.tmppass_seqno,
                    l_tp_rec.key_value,
                    l_tp_rec.ins_at,
                    l_tp_rec.ins_by,
                    l_tp_rec.dml_at,
                    l_tp_rec.dml_by,
                    l_tp_rec.dml_type
                from dl_bordercontrol.thaipassport tp
                where tp.passportno || tp.nationcd || tp.passportexpdte = p_id;

                exception
                when no_data_found then
                    l_tp_json := json();
                    return l_tp_json;
            end;

            l_tp_json := json();
                l_tp_json.put( 'citizenId'                  , l_tp_rec.citizenid );
                l_tp_json.put( 'personId'                   , l_tp_rec.personid );
                l_tp_json.put( 'passportNumber'             , l_tp_rec.passportno );
                l_tp_json.put( 'passNumber'                 , l_tp_rec.passno );
                l_tp_json.put( 'thaiFamilyName'             , l_tp_rec.tfamilynm );
                l_tp_json.put( 'thaiFirstName'              , l_tp_rec.tfirstnm );
                l_tp_json.put( 'thaiMiddleName'             , l_tp_rec.tmiddlenm );
                l_tp_json.put( 'familyName'                 , l_tp_rec.efamilynm );
                l_tp_json.put( 'firstName'                  , l_tp_rec.efirstnm );
                l_tp_json.put( 'middleName'                 , l_tp_rec.emiddlenm );
                l_tp_json.put( 'gender'                     , l_tp_rec.sex );
                l_tp_json.put( 'nationCode'                 , l_tp_rec.nationcd );
                l_tp_json.put( 'height'                     , l_tp_rec.height );
                l_tp_json.put( 'weight'                     , l_tp_rec.weight );
                l_tp_json.put( 'address'                    , l_tp_rec.addr );
                l_tp_json.put( 'district'                   , l_tp_rec.district );
                l_tp_json.put( 'cityCode'                   , l_tp_rec.citycd );
                l_tp_json.put( 'stateCode'                  , l_tp_rec.statecd );
                l_tp_json.put( 'zipCode'                    , l_tp_rec.zipcode );
                l_tp_json.put( 'telephoneNumber'            , l_tp_rec.telno );
                l_tp_json.put( 'passportDate'               , to_char( l_tp_rec.passportdte, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_tp_json.put( 'passportExpiryDate'         , to_char( l_tp_rec.passportexpdte, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_tp_json.put( 'microRollNo'                , l_tp_rec.microrollno );
                l_tp_json.put( 'microPicNo'                 , l_tp_rec.micropicno );
                l_tp_json.put( 'microPicNol'                , l_tp_rec.micropicnol );
                l_tp_json.put( 'dateOfBirth'                , to_char( l_tp_rec.birthdte, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_tp_json.put( 'imagePassport'              , convert_image( l_tp_rec.imgpass ) );
                l_tp_json.put( 'placeOfBirth'               , l_tp_rec.birthplace );
                l_tp_json.put( 'domicile'                   , l_tp_rec.domicile );
                l_tp_json.put( 'ppsSeqno'                   , l_tp_rec.pps_seqno );
                l_tp_json.put( 'passSeqno'                  , l_tp_rec.pass_seqno );
                l_tp_json.put( 'createDate'                 , to_char( l_tp_rec.create_date, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_tp_json.put( 'lastModifiedDate'           , to_char( l_tp_rec.update_date, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_tp_json.put( 'typedPassport'              , l_tp_rec.typedpassport );
                l_tp_json.put( 'tmppassSeqno'               , l_tp_rec.tmppass_seqno );
                l_tp_json.put( 'id'                         , l_tp_rec.key_value );
                l_tp_json.put( 'systemCreatedAt'            , to_char( l_tp_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_tp_json.put( 'systemCreatedBy'            , l_tp_rec.ins_by );
                l_tp_json.put( 'systemLastModifiedAt'       , to_char( l_tp_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_tp_json.put( 'systemLastModifiedBy'       , l_tp_rec.dml_by );
                l_tp_json.put( 'systemLastModifiedByAction' , l_tp_rec.dml_type );
            return l_tp_json;
        end;

    function get_thaipassport_dm2(p_id in varchar2, p_expdate in date) return json
        as
            l_tp_rec PIBICSDM2.THAIPASSPORT%rowtype; -- Thaipassport
            l_tp_json json;                          -- Thaipassport JSON
        begin
            begin
                select
                    tp.citizenid,
                    tp.personid,
                    tp.passportno,
                    tp.passno,
                    tp.tfamilynm,
                    tp.tfirstnm,
                    tp.tmiddlenm,
                    tp.efamilynm,
                    tp.efirstnm,
                    tp.emiddlenm,
                    tp.sex,
                    tp.nationcd,
                    tp.height,
                    tp.weight,
                    tp.addr,
                    tp.district,
                    tp.citycd,
                    tp.statecd,
                    tp.zipcode,
                    tp.telno,
                    tp.passportdte,
                    tp.passportexpdte,
                    tp.microrollno,
                    tp.micropicno,
                    tp.micropicnol,
                    tp.birthdte,
                    tp.imgpass,
                    tp.birthplace,
                    tp.domicile,
                    tp.pps_seqno,
                    tp.pass_seqno,
                    tp.create_date,
                    tp.update_date,
                    tp.typedpassport,
                    tp.tmppass_seqno
                into
                    l_tp_rec.citizenid,
                    l_tp_rec.personid,
                    l_tp_rec.passportno,
                    l_tp_rec.passno,
                    l_tp_rec.tfamilynm,
                    l_tp_rec.tfirstnm,
                    l_tp_rec.tmiddlenm,
                    l_tp_rec.efamilynm,
                    l_tp_rec.efirstnm,
                    l_tp_rec.emiddlenm,
                    l_tp_rec.sex,
                    l_tp_rec.nationcd,
                    l_tp_rec.height,
                    l_tp_rec.weight,
                    l_tp_rec.addr,
                    l_tp_rec.district,
                    l_tp_rec.citycd,
                    l_tp_rec.statecd,
                    l_tp_rec.zipcode,
                    l_tp_rec.telno,
                    l_tp_rec.passportdte,
                    l_tp_rec.passportexpdte,
                    l_tp_rec.microrollno,
                    l_tp_rec.micropicno,
                    l_tp_rec.micropicnol,
                    l_tp_rec.birthdte,
                    l_tp_rec.imgpass,
                    l_tp_rec.birthplace,
                    l_tp_rec.domicile,
                    l_tp_rec.pps_seqno,
                    l_tp_rec.pass_seqno,
                    l_tp_rec.create_date,
                    l_tp_rec.update_date,
                    l_tp_rec.typedpassport,
                    l_tp_rec.tmppass_seqno
                from PIBICSDM2.thaipassport tp
                where tp.passportno = p_id
                and tp.passportexpdte = p_expdate;

                exception
                when no_data_found then
                    l_tp_json := json();
                    return l_tp_json;
            end;

            l_tp_json := json();
                l_tp_json.put( 'citizenId'                  , l_tp_rec.citizenid );
                l_tp_json.put( 'personId'                   , l_tp_rec.personid );
                l_tp_json.put( 'passportNumber'             , l_tp_rec.passportno );
                l_tp_json.put( 'passNumber'                 , l_tp_rec.passno );
                l_tp_json.put( 'thaiFamilyName'             , l_tp_rec.tfamilynm );
                l_tp_json.put( 'thaiFirstName'              , l_tp_rec.tfirstnm );
                l_tp_json.put( 'thaiMiddleName'             , l_tp_rec.tmiddlenm );
                l_tp_json.put( 'familyName'                 , l_tp_rec.efamilynm );
                l_tp_json.put( 'firstName'                  , l_tp_rec.efirstnm );
                l_tp_json.put( 'middleName'                 , l_tp_rec.emiddlenm );
                l_tp_json.put( 'gender'                     , l_tp_rec.sex );
                l_tp_json.put( 'nationCode'                 , l_tp_rec.nationcd );
                l_tp_json.put( 'height'                     , l_tp_rec.height );
                l_tp_json.put( 'weight'                     , l_tp_rec.weight );
                l_tp_json.put( 'address'                    , l_tp_rec.addr );
                l_tp_json.put( 'district'                   , l_tp_rec.district );
                l_tp_json.put( 'cityCode'                   , l_tp_rec.citycd );
                l_tp_json.put( 'stateCode'                  , l_tp_rec.statecd );
                l_tp_json.put( 'zipCode'                    , l_tp_rec.zipcode );
                l_tp_json.put( 'telephoneNumber'            , l_tp_rec.telno );
                l_tp_json.put( 'passportDate'               , to_char( l_tp_rec.passportdte, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_tp_json.put( 'passportExpiryDate'         , to_char( l_tp_rec.passportexpdte, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_tp_json.put( 'microRollNo'                , l_tp_rec.microrollno );
                l_tp_json.put( 'microPicNo'                 , l_tp_rec.micropicno );
                l_tp_json.put( 'microPicNol'                , l_tp_rec.micropicnol );
                l_tp_json.put( 'dateOfBirth'                , l_tp_rec.birthdte );
                l_tp_json.put( 'imagePassport'              , convert_image( l_tp_rec.imgpass ) );
                l_tp_json.put( 'placeOfBirth'               , l_tp_rec.birthplace );
                l_tp_json.put( 'domicile'                   , l_tp_rec.domicile );
                l_tp_json.put( 'ppsSeqno'                   , l_tp_rec.pps_seqno );
                l_tp_json.put( 'passSeqno'                  , l_tp_rec.pass_seqno );
                l_tp_json.put( 'createDate'                 , to_char( l_tp_rec.create_date, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_tp_json.put( 'lastModifiedDate'           , to_char( l_tp_rec.update_date, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_tp_json.put( 'typedPassport'              , l_tp_rec.typedpassport );
                l_tp_json.put( 'tmppassSeqno'               , l_tp_rec.tmppass_seqno );
            return l_tp_json;
        end;
    /**
     * Function to export the table BORDERDOCUMENTS
     * @param p_id ID of the wanted Borderdocument
     * @return json returns pl/json object
     */
     function get_borderdocuments(p_id in varchar2) return json
        as
            l_bd_rec dl_bordercontrol.borderdocuments%rowtype;  -- Borderdocuments
            l_bd_json json;                                     -- Borderdocuments JSON
        begin
            begin
                select
                    bd.brddocid,
                    bd.doctype,
                    bd.docno,
                    bd.issuectry,
                    bd.nat,
                    bd.calc_dob,
                    bd.expirydate,
                    bd.givenname,
                    bd.middlename,
                    bd.surname,
                    bd.givenname_thai,
                    bd.middlename_thai,
                    bd.surname_thai,
                    bd.optionaldata,
                    bd.afisid,
                    bd.officer_observation,
                    bd.mrzdg1,
                    bd.p_01,
                    bd.p_02,
                    bd.p_03,
                    bd.p_04,
                    bd.p_05,
                    bd.dob,
                    bd.manual_expiry_date,
                    bd.manual_issuing_date,
                    bd.manual_nationality,
                    bd.manual_placeofbirth,
                    bd.docclass,
                    bd.sub_nationality,
                    bd.sex,
                    bd.ins_at,
                    translate(bd.ins_by, chr(13), ''),
                    bd.dml_at,
                    translate(bd.dml_by, chr(13), ''),
                    bd.dml_type,
                    bd.ins_terminal,
                    bd.ins_borderpost,
                    bd.dob_partial
                into
                    l_bd_rec.brddocid,
                    l_bd_rec.doctype,
                    l_bd_rec.docno,
                    l_bd_rec.issuectry,
                    l_bd_rec.nat,
                    l_bd_rec.calc_dob,
                    l_bd_rec.expirydate,
                    l_bd_rec.givenname,
                    l_bd_rec.middlename,
                    l_bd_rec.surname,
                    l_bd_rec.givenname_thai,
                    l_bd_rec.middlename_thai,
                    l_bd_rec.surname_thai,
                    l_bd_rec.optionaldata,
                    l_bd_rec.afisid,
                    l_bd_rec.officer_observation,
                    l_bd_rec.mrzdg1,
                    l_bd_rec.p_01,
                    l_bd_rec.p_02,
                    l_bd_rec.p_03,
                    l_bd_rec.p_04,
                    l_bd_rec.p_05,
                    l_bd_rec.dob,
                    l_bd_rec.manual_expiry_date,
                    l_bd_rec.manual_issuing_date,
                    l_bd_rec.manual_nationality,
                    l_bd_rec.manual_placeofbirth,
                    l_bd_rec.docclass,
                    l_bd_rec.sub_nationality,
                    l_bd_rec.sex,
                    l_bd_rec.ins_at,
                    l_bd_rec.ins_by,
                    l_bd_rec.dml_at,
                    l_bd_rec.dml_by,
                    l_bd_rec.dml_type,
                    l_bd_rec.ins_terminal,
                    l_bd_rec.ins_borderpost,
                    l_bd_rec.dob_partial
                from dl_bordercontrol.borderdocuments bd
                where bd.brddocid = p_id;

            exception
              when no_data_found then
                l_bd_json := json();
                return l_bd_json;
            end;

            l_bd_json := json();
                l_bd_json.put( 'id'                    , l_bd_rec.brddocid );
                l_bd_json.put( 'documentType'          , l_bd_rec.doctype );
                l_bd_json.put( 'documentNumber'        , l_bd_rec.docno );
                l_bd_json.put( 'issuingCountryId'      , l_bd_rec.issuectry );
                l_bd_json.put( 'nationalityId'         , l_bd_rec.nat );
                l_bd_json.put( 'dateOfBirthCode'       , l_bd_rec.dob );
                l_bd_json.put( 'expiryDate'            , to_char( l_bd_rec.expirydate, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_bd_json.put( 'givenName'             , l_bd_rec.givenname );
                l_bd_json.put( 'middleName'            , l_bd_rec.middlename );
                l_bd_json.put( 'surname'               , l_bd_rec.surname );
                l_bd_json.put( 'thaiGivenName'         , l_bd_rec.givenname_thai );
                l_bd_json.put( 'thaiMiddleName'        , l_bd_rec.middlename_thai );
                l_bd_json.put( 'thaiSurname'           , l_bd_rec.surname_thai );
                l_bd_json.put( 'optionalData'          , l_bd_rec.optionaldata );
                l_bd_json.put( 'afisId'                , l_bd_rec.afisid );
                l_bd_json.put( 'officerObservation'    , l_bd_rec.officer_observation );
                l_bd_json.put( 'mrzDg1'                , l_bd_rec.mrzdg1 );
                l_bd_json.put( 'p01'                   , l_bd_rec.p_01 );
                l_bd_json.put( 'p02'                   , l_bd_rec.p_02 );
                l_bd_json.put( 'p03'                   , l_bd_rec.p_03 );
                l_bd_json.put( 'p04'                   , l_bd_rec.p_04 );
                l_bd_json.put( 'p05'                   , l_bd_rec.p_05 );
                l_bd_json.put( 'dateOfBirthDate'       , to_char( l_bd_rec.calc_dob, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_bd_json.put( 'manuelExpiryDate'      , to_char( l_bd_rec.manual_expiry_date, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_bd_json.put( 'manuelIssuingDate'     , to_char( l_bd_rec.manual_issuing_date, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_bd_json.put( 'manualNationalityId'   , l_bd_rec.manual_nationality );
                l_bd_json.put( 'manualPlaceOfBirth'    , l_bd_rec.manual_placeofbirth );
                l_bd_json.put( 'documentClassId'       , l_bd_rec.docclass );
                l_bd_json.put( 'subNationality'        , l_bd_rec.sub_nationality );
                l_bd_json.put( 'genderId'              , l_bd_rec.sex );
                l_bd_json.put( 'createdAt'             , to_char( l_bd_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_bd_json.put( 'createdBy'             , l_bd_rec.ins_by );
                l_bd_json.put( 'lastModifiedAt'        , to_char( l_bd_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_bd_json.put( 'lastModifiedBy'        , l_bd_rec.dml_by );
                l_bd_json.put( 'lastModifiedAction'    , l_bd_rec.dml_type );
                l_bd_json.put( 'createdByTerminalId'   , l_bd_rec.ins_terminal );
                l_bd_json.put( 'createdByBorderpostId' , l_bd_rec.ins_borderpost );
                l_bd_json.put( 'images'                , get_borderdocimages( l_bd_rec.brddocid ) );
                --l_bd_json.put( 'thaipassport'          , get_thaipassport( l_bd_rec.docno || l_bd_rec.issuectry || l_bd_rec.expirydate ) );
                l_bd_json.put( 'thaipassport'          , get_thaipassport_dm2( l_bd_rec.docno, l_bd_rec.expirydate ) );
                l_bd_json.put( 'dateOfBirthDatePartial' ,l_bd_rec.dob_partial.getFormatData('DD/MM/YYYY') );
            return l_bd_json;
        end;

    /**
     * Function to export the table TERMINALS
     * @param p_id ID of the wanted terminal
     * @return json returns pl/json object
     */
     function AA_get_borderdocuments(p_id in varchar2) return json
        as
            l_bd_rec dl_bordercontrol.borderdocuments%rowtype;  -- Borderdocuments
            l_bd_json json;                                     -- Borderdocuments JSON
        begin
            begin
                select
                    bd.brddocid,
                    bd.doctype,
                    bd.docno,
                    bd.issuectry,
                    bd.nat,
                    bd.calc_dob,
                    bd.expirydate,
                    bd.givenname,
                    bd.middlename,
                    bd.surname,
                    bd.givenname_thai,
                    bd.middlename_thai,
                    bd.surname_thai,
                    bd.optionaldata,
                    bd.afisid,
                    bd.officer_observation,
                    bd.mrzdg1,
                    bd.p_01,
                    bd.p_02,
                    bd.p_03,
                    bd.p_04,
                    bd.p_05,
                    bd.dob,
                    bd.manual_expiry_date,
                    bd.manual_issuing_date,
                    bd.manual_nationality,
                    bd.manual_placeofbirth,
                    bd.docclass,
                    bd.sub_nationality,
                    bd.sex,
                    bd.ins_at,
                    translate(bd.ins_by, chr(13), ''),
                    bd.dml_at,
                    translate(bd.dml_by, chr(13), ''),
                    bd.dml_type,
                    bd.ins_terminal,
                    bd.ins_borderpost
                into
                    l_bd_rec.brddocid,
                    l_bd_rec.doctype,
                    l_bd_rec.docno,
                    l_bd_rec.issuectry,
                    l_bd_rec.nat,
                    l_bd_rec.calc_dob,
                    l_bd_rec.expirydate,
                    l_bd_rec.givenname,
                    l_bd_rec.middlename,
                    l_bd_rec.surname,
                    l_bd_rec.givenname_thai,
                    l_bd_rec.middlename_thai,
                    l_bd_rec.surname_thai,
                    l_bd_rec.optionaldata,
                    l_bd_rec.afisid,
                    l_bd_rec.officer_observation,
                    l_bd_rec.mrzdg1,
                    l_bd_rec.p_01,
                    l_bd_rec.p_02,
                    l_bd_rec.p_03,
                    l_bd_rec.p_04,
                    l_bd_rec.p_05,
                    l_bd_rec.dob,
                    l_bd_rec.manual_expiry_date,
                    l_bd_rec.manual_issuing_date,
                    l_bd_rec.manual_nationality,
                    l_bd_rec.manual_placeofbirth,
                    l_bd_rec.docclass,
                    l_bd_rec.sub_nationality,
                    l_bd_rec.sex,
                    l_bd_rec.ins_at,
                    l_bd_rec.ins_by,
                    l_bd_rec.dml_at,
                    l_bd_rec.dml_by,
                    l_bd_rec.dml_type,
                    l_bd_rec.ins_terminal,
                    l_bd_rec.ins_borderpost
                from dl_bordercontrol.borderdocuments bd
                where bd.brddocid = p_id;

            exception
              when no_data_found then
                l_bd_json := json();
                return l_bd_json;
            end;

            l_bd_json := json();
                l_bd_json.put( 'id'                    , l_bd_rec.brddocid );
                l_bd_json.put( 'documentType'          , l_bd_rec.doctype );
                l_bd_json.put( 'documentNumber'        , l_bd_rec.docno );
                l_bd_json.put( 'issuingCountryId'      , l_bd_rec.issuectry );
                l_bd_json.put( 'nationalityId'         , l_bd_rec.nat );
                l_bd_json.put( 'dateOfBirthCode'       , l_bd_rec.dob );
                l_bd_json.put( 'expiryDate'            , to_char( l_bd_rec.expirydate, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_bd_json.put( 'givenName'             , l_bd_rec.givenname );
                l_bd_json.put( 'middleName'            , l_bd_rec.middlename );
                l_bd_json.put( 'surname'               , l_bd_rec.surname );
                l_bd_json.put( 'thaiGivenName'         , l_bd_rec.givenname_thai );
                l_bd_json.put( 'thaiMiddleName'        , l_bd_rec.middlename_thai );
                l_bd_json.put( 'thaiSurname'           , l_bd_rec.surname_thai );
                l_bd_json.put( 'optionalData'          , l_bd_rec.optionaldata );
                l_bd_json.put( 'afisId'                , l_bd_rec.afisid );
                l_bd_json.put( 'officerObservation'    , l_bd_rec.officer_observation );
                l_bd_json.put( 'mrzDg1'                , l_bd_rec.mrzdg1 );
                l_bd_json.put( 'p01'                   , l_bd_rec.p_01 );
                l_bd_json.put( 'p02'                   , l_bd_rec.p_02 );
                l_bd_json.put( 'p03'                   , l_bd_rec.p_03 );
                l_bd_json.put( 'p04'                   , l_bd_rec.p_04 );
                l_bd_json.put( 'p05'                   , l_bd_rec.p_05 );
                l_bd_json.put( 'dateOfBirthDate'       , to_char( l_bd_rec.calc_dob, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_bd_json.put( 'manuelExpiryDate'      , to_char( l_bd_rec.manual_expiry_date, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_bd_json.put( 'manuelIssuingDate'     , to_char( l_bd_rec.manual_issuing_date, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_bd_json.put( 'manualNationalityId'   , l_bd_rec.manual_nationality );
                l_bd_json.put( 'manualPlaceOfBirth'    , l_bd_rec.manual_placeofbirth );
                l_bd_json.put( 'documentClassId'       , l_bd_rec.docclass );
                l_bd_json.put( 'subNationality'        , l_bd_rec.sub_nationality );
                l_bd_json.put( 'genderId'              , l_bd_rec.sex );
                l_bd_json.put( 'createdAt'             , to_char( l_bd_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_bd_json.put( 'createdBy'             , l_bd_rec.ins_by );
                l_bd_json.put( 'lastModifiedAt'        , to_char( l_bd_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_bd_json.put( 'lastModifiedBy'        , l_bd_rec.dml_by );
                l_bd_json.put( 'lastModifiedAction'    , l_bd_rec.dml_type );
                l_bd_json.put( 'createdByTerminalId'   , l_bd_rec.ins_terminal );
                l_bd_json.put( 'createdByBorderpostId' , l_bd_rec.ins_borderpost );
                l_bd_json.put( 'images'                , get_borderdocimages( l_bd_rec.brddocid ) );
                l_bd_json.put( 'thaipassport'          , get_thaipassport( l_bd_rec.docno || l_bd_rec.issuectry || l_bd_rec.expirydate ) );
                l_bd_json.put( 'residence'          , get_residence(l_bd_rec.docno, l_bd_rec.nat) );
            return l_bd_json;
        end;
     
     function get_terminals(p_id in varchar2) return json
        as
            l_te_rec dl_bordercontrol.terminals%rowtype;    -- Terminal
            l_te_json json;                                 -- Terminal JSON
        begin
            begin
                select
                    te.id,
                    te.ipaddress,
                    te.defaultexitflg,
                    te.active,
                    te.trnsprtmodeid,
                    te.isgate,
                    te.pos_x,
                    te.pos_y,
                    te.width,
                    te.height,
                    te.floor_id,
                    te.bio_capturing,
                    te.name,
                    te.border_post,
                    te.locale,
                    te.ins_at,
                    translate(te.ins_by, chr(13), ''),
                    te.dml_at,
                    translate(te.dml_by, chr(13), ''),
                    te.dml_type,
                    te.default_traveler_type
                into
                    l_te_rec.id,
                    l_te_rec.ipaddress,
                    l_te_rec.defaultexitflg,
                    l_te_rec.active,
                    l_te_rec.trnsprtmodeid,
                    l_te_rec.isgate,
                    l_te_rec.pos_x,
                    l_te_rec.pos_y,
                    l_te_rec.width,
                    l_te_rec.height,
                    l_te_rec.floor_id,
                    l_te_rec.bio_capturing,
                    l_te_rec.name,
                    l_te_rec.border_post,
                    l_te_rec.locale,
                    l_te_rec.ins_at,
                    l_te_rec.ins_by,
                    l_te_rec.dml_at,
                    l_te_rec.dml_by,
                    l_te_rec.dml_type,
                    l_te_rec.default_traveler_type
                from dl_bordercontrol.terminals te
                where te.id = p_id;

            exception
              when no_data_found then
                l_te_json := json();
                return l_te_json;
            end;
            l_te_json := json();
                l_te_json.put( 'id'                  , l_te_rec.id );
                l_te_json.put( 'ipAddress'           , l_te_rec.ipaddress );
                l_te_json.put( 'defaultExitFlag'     , l_te_rec.defaultexitflg );
                l_te_json.put( 'activeFlag'          , l_te_rec.active );
                l_te_json.put( 'transportModeId'     , l_te_rec.trnsprtmodeid );
                l_te_json.put( 'isGateFlag'          , l_te_rec.isgate );
                l_te_json.put( 'posX'                , l_te_rec.pos_x );
                l_te_json.put( 'posY'                , l_te_rec.pos_y );
                l_te_json.put( 'width'               , l_te_rec.width );
                l_te_json.put( 'height'              , l_te_rec.height );
                l_te_json.put( 'floorId'             , l_te_rec.floor_id );
                l_te_json.put( 'bioCapturing'        , l_te_rec.bio_capturing );
                l_te_json.put( 'name'                , l_te_rec.name );
                l_te_json.put( 'borderpostId'        , l_te_rec.border_post );
                l_te_json.put( 'locale'              , l_te_rec.locale );
                l_te_json.put( 'createdAt'           , to_char( l_te_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_te_json.put( 'createdBy'           , l_te_rec.ins_by );
                l_te_json.put( 'lastModifiedAt'      , to_char( l_te_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_te_json.put( 'lastModifiedBy'      , l_te_rec.dml_by );
                l_te_json.put( 'lastModifiedAction'  , l_te_rec.dml_type );
                l_te_json.put( 'defaultTravelerType' , l_te_rec.default_traveler_type );
            return l_te_json;
        end;

     /**
     * Function to export the table BORDERPOSTS
     * @param p_id ID of the wanted borderpost
     * @return json returns pl/json object
     */
     function get_borderposts(p_id in varchar2) return json
        as
            l_bp_rec dl_bordercontrol.borderposts%rowtype;  -- Borderpost
            l_bp_json json;                                 -- Borderpost JSON
        begin
            begin
                select
                    bp.key_value,
                    bp.border_type,
                    bp.name,
                    bp.is_active,
                    bp.border_to_country,
                    bp.locale,
                    bp.display_order,
                    bp.ins_at,
                    translate(bp.ins_by, chr(13), ''),
                    bp.dml_at,
                    translate(bp.dml_by, chr(13), ''),
                    bp.dml_type
                into
                    l_bp_rec.key_value,
                    l_bp_rec.border_type,
                    l_bp_rec.name,
                    l_bp_rec.is_active,
                    l_bp_rec.border_to_country,
                    l_bp_rec.locale,
                    l_bp_rec.display_order,
                    l_bp_rec.ins_at,
                    l_bp_rec.ins_by,
                    l_bp_rec.dml_at,
                    l_bp_rec.dml_by,
                    l_bp_rec.dml_type
                from dl_bordercontrol.borderposts bp
                where bp.key_value = p_id;

            exception
              when no_data_found then
                l_bp_json := json();
                return l_bp_json;
            end;
            l_bp_json := json();
                l_bp_json.put( 'id'                 , l_bp_rec.key_value );
                l_bp_json.put( 'borderType'         , l_bp_rec.border_type );
                l_bp_json.put( 'name'               , l_bp_rec.name );
                l_bp_json.put( 'isActiveFlag'       , l_bp_rec.is_active );
                l_bp_json.put( 'borderToCountry'    , l_bp_rec.border_to_country );
                l_bp_json.put( 'locale'             , l_bp_rec.locale );
                l_bp_json.put( 'displayOrder'       , l_bp_rec.display_order );
                l_bp_json.put( 'createdAt'          , to_char( l_bp_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_bp_json.put( 'createdBy'          , l_bp_rec.ins_by );
                l_bp_json.put( 'lastModifiedAt'     , to_char( l_bp_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_bp_json.put( 'lastModifiedBy'     , l_bp_rec.dml_by );
                l_bp_json.put( 'lastModifiedAction' , l_bp_rec.dml_type );
            return l_bp_json;
        end;

     /**
     * Function to export the table PERSON
     * @param p_id ID of of the wanted person
     * @return json returns pl/json object
     */
     function get_person(p_id in varchar2) return json
        as
            l_ps_rec dl_bordercontrol.person%rowtype;   -- Person
            l_ps_json json;                             -- Person JSON
        begin
            begin
                select
                    ps.key_value,
                    ps.first_name,
                    ps.middle_name,
                    ps.last_name,
                    ps.date_of_birth,
                    ps.sex,
                    ps.place_of_birth,
                    ps.birth_country,
                    ps.phone_number,
                    ps.image,
                    ps.ta_street,
                    ps.ta_adm_class_district,
                    ps.ta_adm_class_subdistrict,
                    ps.ta_adm_class_province,
                    ps.nationality,
                    ps.permanent_address,
                    ps.contact_person,
                    ps.salutation,
                    ps.relation,
                    ps.ins_at,
                    translate(ps.ins_by, chr(13), ''),
                    ps.dml_at,
                    translate(ps.dml_by, chr(13), ''),
                    ps.dml_type
                into
                    l_ps_rec.key_value,
                    l_ps_rec.first_name,
                    l_ps_rec.middle_name,
                    l_ps_rec.last_name,
                    l_ps_rec.date_of_birth,
                    l_ps_rec.sex,
                    l_ps_rec.place_of_birth,
                    l_ps_rec.birth_country,
                    l_ps_rec.phone_number,
                    l_ps_rec.image,
                    l_ps_rec.ta_street,
                    l_ps_rec.ta_adm_class_district,
                    l_ps_rec.ta_adm_class_subdistrict,
                    l_ps_rec.ta_adm_class_province,
                    l_ps_rec.nationality,
                    l_ps_rec.permanent_address,
                    l_ps_rec.contact_person,
                    l_ps_rec.salutation,
                    l_ps_rec.relation,
                    l_ps_rec.ins_at,
                    l_ps_rec.ins_by,
                    l_ps_rec.dml_at,
                    l_ps_rec.dml_by,
                    l_ps_rec.dml_type
                from dl_bordercontrol.person ps
                where ps.key_value = p_id;

            exception
              when no_data_found then
                l_ps_json := json();
                return l_ps_json;
            end;

            l_ps_json := json();
                l_ps_json.put( 'id'                       , l_ps_rec.key_value );
                l_ps_json.put( 'firstName'                , l_ps_rec.first_name );
                l_ps_json.put( 'middleName'               , l_ps_rec.middle_name );
                l_ps_json.put( 'lastName'                 , l_ps_rec.last_name );
                l_ps_json.put( 'dateOfBirth'              , to_char( l_ps_rec.date_of_birth, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ps_json.put( 'genderId'                 , l_ps_rec.sex );
                l_ps_json.put( 'placeOfBirth'             , l_ps_rec.place_of_birth );
                l_ps_json.put( 'birthCountryId'           , l_ps_rec.birth_country );
                l_ps_json.put( 'phoneNumber'              , l_ps_rec.phone_number );
                l_ps_json.put( 'image'                    , convert_image( l_ps_rec.image ) );
                l_ps_json.put( 'thaiAddressStreet'        , l_ps_rec.ta_street );
                l_ps_json.put( 'thaiAddressDistrictId'    , l_ps_rec.ta_adm_class_district );
                l_ps_json.put( 'thaiAddressSubdistrictId' , l_ps_rec.ta_adm_class_subdistrict );
                l_ps_json.put( 'thaiAddressProvinceId'    , l_ps_rec.ta_adm_class_province );
                l_ps_json.put( 'nationalityId'            , l_ps_rec.nationality );
                l_ps_json.put( 'permanentAddress'         , l_ps_rec.permanent_address );
                l_ps_json.put( 'contactPerson'            , l_ps_rec.contact_person );
                l_ps_json.put( 'salutationId'             , l_ps_rec.salutation );
                l_ps_json.put( 'relationId'               , l_ps_rec.relation );
                l_ps_json.put( 'createdAt'                , to_char( l_ps_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ps_json.put( 'createdBy'                , translate(l_ps_rec.ins_by, chr(10), '') );
                l_ps_json.put( 'lastModifiedAt'           , to_char( l_ps_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ps_json.put( 'lastModifiedBy'           , translate(l_ps_rec.dml_by, chr(10), '') );
                l_ps_json.put( 'lastModifiedAction'       , l_ps_rec.dml_type );
            return l_ps_json;
        end;

     /**
     * Function to export the table FAF_FEES_AND_FINES
     * @param p_id ID of the wanted faf receipt
     * @return json returns pl/json object
     */
     function get_faf_fees_and_fines(p_id in varchar2) return json
        as
            l_ff_rec dl_bordercontrol.faf_fees_and_fines%rowtype;   -- Receipt
            l_ff_json json;                                         -- Receipt JSON
        begin
            begin
                select
                    ff.key_value,
                    ff.reference_entity,
                    ff.reference_number,
                    ff.booking_number,
                    ff.receipt_number,
                    ff.issuing_date,
                    ff.total_costs,
                    ff.print_flag,
                    ff.borderdocument,
                    ff.docno,
                    ff.person,
                    ff.entry_form,
                    ff.first_name,
                    ff.middle_name,
                    ff.last_name,
                    ff.thai_first_name,
                    ff.thai_last_name,
                    ff.sex,
                    ff.date_of_birth,
                    ff.nationality,
                    ff.trans_vehicles,
                    ff.trans_number,
                    ff.arrival_date,
                    ff.visa_type,
                    ff.visa_expiry_date,
                    ff.departure_date,
                    ff.status,
                    ff.status_note,
                    ff.owner,
                    ff.permit,
                    ff.permit_date,
                    ff.generation_status,
                    ff.salutation,
                    ff.fee_or_fine,
                    ff.charge_number,
                    ff.ins_at,
                    translate(ff.ins_by, chr(13), ''),
                    ff.dml_at,
                    translate(ff.dml_by, chr(13), ''),
                    ff.dml_type,
                    ff.ins_terminal,
                    ff.ins_borderpost
                into
                    l_ff_rec.key_value,
                    l_ff_rec.reference_entity,
                    l_ff_rec.reference_number,
                    l_ff_rec.booking_number,
                    l_ff_rec.receipt_number,
                    l_ff_rec.issuing_date,
                    l_ff_rec.total_costs,
                    l_ff_rec.print_flag,
                    l_ff_rec.borderdocument,
                    l_ff_rec.docno,
                    l_ff_rec.person,
                    l_ff_rec.entry_form,
                    l_ff_rec.first_name,
                    l_ff_rec.middle_name,
                    l_ff_rec.last_name,
                    l_ff_rec.thai_first_name,
                    l_ff_rec.thai_last_name,
                    l_ff_rec.sex,
                    l_ff_rec.date_of_birth,
                    l_ff_rec.nationality,
                    l_ff_rec.trans_vehicles,
                    l_ff_rec.trans_number,
                    l_ff_rec.arrival_date,
                    l_ff_rec.visa_type,
                    l_ff_rec.visa_expiry_date,
                    l_ff_rec.departure_date,
                    l_ff_rec.status,
                    l_ff_rec.status_note,
                    l_ff_rec.owner,
                    l_ff_rec.permit,
                    l_ff_rec.permit_date,
                    l_ff_rec.generation_status,
                    l_ff_rec.salutation,
                    l_ff_rec.fee_or_fine,
                    l_ff_rec.charge_number,
                    l_ff_rec.ins_at,
                    l_ff_rec.ins_by,
                    l_ff_rec.dml_at,
                    l_ff_rec.dml_by,
                    l_ff_rec.dml_type,
                    l_ff_rec.ins_terminal,
                    l_ff_rec.ins_borderpost
                from dl_bordercontrol.faf_fees_and_fines ff
                where ff.key_value = p_id;

            exception
              when no_data_found then
                l_ff_json := json();
                return l_ff_json;
            end;

            l_ff_json := json();
                l_ff_json.put( 'id'                    , l_ff_rec.key_value );
                l_ff_json.put( 'referenceEntity'       , l_ff_rec.reference_entity );
                l_ff_json.put( 'referenceNumber'       , l_ff_rec.reference_number );
                l_ff_json.put( 'bookingNumber'         , l_ff_rec.booking_number );
                l_ff_json.put( 'receiptNumber'         , l_ff_rec.receipt_number );
                l_ff_json.put( 'issuingDate'           , to_char( l_ff_rec.issuing_date, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ff_json.put( 'totalCosts'            , l_ff_rec.total_costs );
                l_ff_json.put( 'printFlag'             , l_ff_rec.print_flag );
                l_ff_json.put( 'borderdocumentId'      , l_ff_rec.borderdocument );
                l_ff_json.put( 'documentNumber'        , l_ff_rec.docno );
                l_ff_json.put( 'personId'              , l_ff_rec.person );
                l_ff_json.put( 'entryFormId'           , l_ff_rec.entry_form );
                l_ff_json.put( 'firstName'             , l_ff_rec.first_name );
                l_ff_json.put( 'middleName'            , l_ff_rec.middle_name );
                l_ff_json.put( 'lastName'              , l_ff_rec.last_name );
                l_ff_json.put( 'thaiFirstName'         , l_ff_rec.thai_first_name );
                l_ff_json.put( 'thaiLastName'          , l_ff_rec.thai_last_name );
                l_ff_json.put( 'genderId'              , l_ff_rec.sex );
                l_ff_json.put( 'dateOfBirth'           , to_char( l_ff_rec.date_of_birth, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ff_json.put( 'nationalityId'         , l_ff_rec.nationality );
                l_ff_json.put( 'transVehicleId'        , l_ff_rec.trans_vehicles );
                l_ff_json.put( 'transNumber'           , l_ff_rec.trans_number );
                l_ff_json.put( 'arrivalDate'           , to_char( l_ff_rec.arrival_date, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ff_json.put( 'visaTypeId'            , l_ff_rec.visa_type );
                l_ff_json.put( 'visaExpiryDate'        , to_char( l_ff_rec.visa_expiry_date, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ff_json.put( 'departureDate'         , l_ff_rec.departure_date );
                l_ff_json.put( 'status'                , l_ff_rec.status );
                l_ff_json.put( 'statusNote'            , l_ff_rec.status_note );
                l_ff_json.put( 'ownerId'               , l_ff_rec.owner );
                l_ff_json.put( 'permitId'              , l_ff_rec.permit );
                l_ff_json.put( 'permitDate'            , to_char( l_ff_rec.permit_date, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ff_json.put( 'generationStatus'      , l_ff_rec.generation_status );
                l_ff_json.put( 'salutationId'          , l_ff_rec.salutation );
                l_ff_json.put( 'feeOrFine'             , l_ff_rec.fee_or_fine );
                l_ff_json.put( 'chargeNumber'          , l_ff_rec.charge_number );
                l_ff_json.put( 'createdAt'             , to_char( l_ff_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ff_json.put( 'createdBy'             , translate( l_ff_rec.ins_by, chr(10), '') );
                l_ff_json.put( 'lastModifiedAt'        , to_char( l_ff_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ff_json.put( 'lastModifiedBy'        , translate( l_ff_rec.dml_by, chr(10), '') );
                l_ff_json.put( 'lastModifiedType'      , l_ff_rec.dml_type );
                l_ff_json.put( 'createdByTerminalId'   , l_ff_rec.ins_terminal );
                l_ff_json.put( 'createdByBorderpostId' , l_ff_rec.ins_borderpost );
            return l_ff_json;
        end;


     /**
     * Function to export the table VISAS
     * @param p_id ID of the wanted visa
     * @return json returns pl/json object
     */
     function get_visas(p_id in varchar2) return json
        as
            l_vi_rec dl_bordercontrol.visas%rowtype;    -- Visa
            l_vi_json json;                             -- Visa JSON
        begin
            begin
                select
                    vi.key_value,
                    vi.visa_type,
                    vi.visa_number,
                    vi.issuing_date,
                    vi.issuing_place,
                    vi.additional_info,
                    vi.ins_terminal,
                    vi.ins_borderpost,
                    vi.borderdocument,
                    vi.visa_image,
                    vi.expiry_date,
                    vi.person,
                    vi.applicant_date,
                    vi.from_country,
                    vi.trans_vehicle,
                    vi.trans_number,
                    vi.status,
                    vi.release_note,
                    vi.cancel_note,
                    vi.payment_status,
                    vi.receipt,
                    vi.permit_type,
                    vi.permit_expiry_date,
                    vi.status_fee_exception,
                    vi.status_no_receipt,
                    vi.status_print_form,
                    vi.ins_at,
                    vi.ins_by,
                    vi.dml_at,
                    vi.dml_by,
                    vi.dml_type
                into
                    l_vi_rec.key_value,
                    l_vi_rec.visa_type,
                    l_vi_rec.visa_number,
                    l_vi_rec.issuing_date,
                    l_vi_rec.issuing_place,
                    l_vi_rec.additional_info,
                    l_vi_rec.ins_terminal,
                    l_vi_rec.ins_borderpost,
                    l_vi_rec.borderdocument,
                    l_vi_rec.visa_image,
                    l_vi_rec.expiry_date,
                    l_vi_rec.person,
                    l_vi_rec.applicant_date,
                    l_vi_rec.from_country,
                    l_vi_rec.trans_vehicle,
                    l_vi_rec.trans_number,
                    l_vi_rec.status,
                    l_vi_rec.release_note,
                    l_vi_rec.cancel_note,
                    l_vi_rec.payment_status,
                    l_vi_rec.receipt,
                    l_vi_rec.permit_type,
                    l_vi_rec.permit_expiry_date,
                    l_vi_rec.status_fee_exception,
                    l_vi_rec.status_no_receipt,
                    l_vi_rec.status_print_form,
                    l_vi_rec.ins_at,
                    l_vi_rec.ins_by,
                    l_vi_rec.dml_at,
                    l_vi_rec.dml_by,
                    l_vi_rec.dml_type
                from dl_bordercontrol.visas vi
                where vi.key_value = p_id;

            exception
              when no_data_found then
                l_vi_json := json();
                return l_vi_json;
            end;

            l_vi_json := json();
                l_vi_json.put( 'id'                 , l_vi_rec.key_value );
                l_vi_json.put( 'visaTypeId'         , l_vi_rec.visa_type );
                l_vi_json.put( 'visaNumber'         , l_vi_rec.visa_number );
                l_vi_json.put( 'issuingDate'        , to_char( l_vi_rec.issuing_date, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_vi_json.put( 'issuingPlace'       , l_vi_rec.issuing_place );
                l_vi_json.put( 'additionalInfo'     , l_vi_rec.additional_info );
                l_vi_json.put( 'terminalId'         , l_vi_rec.ins_terminal );
                l_vi_json.put( 'borderpostId'       , l_vi_rec.ins_borderpost );
                l_vi_json.put( 'borderdocId'        , l_vi_rec.borderdocument );
                l_vi_json.put( 'visaImage'          , convert_image( l_vi_rec.visa_image ) );
                l_vi_json.put( 'expiryDate'         , to_char( l_vi_rec.expiry_date, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_vi_json.put( 'person'             , get_person( l_vi_rec.person ) );
                l_vi_json.put( 'applicantDate'      , l_vi_rec.applicant_date );
                l_vi_json.put( 'fromCountryId'      , l_vi_rec.from_country );
                l_vi_json.put( 'transVehicleId'     , l_vi_rec.trans_vehicle );
                l_vi_json.put( 'transNumber'        , l_vi_rec.trans_number );
                l_vi_json.put( 'status'             , l_vi_rec.status );
                l_vi_json.put( 'releaseNote'        , l_vi_rec.release_note );
                l_vi_json.put( 'cancelNote'         , l_vi_rec.cancel_note );
                l_vi_json.put( 'paymentStatus'      , l_vi_rec.payment_status );
                l_vi_json.put( 'receipt'            , get_faf_fees_and_fines( l_vi_rec.receipt ) );
                l_vi_json.put( 'permitTypeId'       , l_vi_rec.permit_type );
                l_vi_json.put( 'permitExpiryDate'   , to_char( l_vi_rec.permit_expiry_date, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_vi_json.put( 'statusFeeException' , l_vi_rec.status_fee_exception );
                l_vi_json.put( 'statusNoReceipt'    , l_vi_rec.status_no_receipt );
                l_vi_json.put( 'statusPrintForm'    , l_vi_rec.status_print_form );
                l_vi_json.put( 'createdAt'          , l_vi_rec.ins_at );
                l_vi_json.put( 'createdBy'          , l_vi_rec.ins_by );
                l_vi_json.put( 'changedAt'          , l_vi_rec.dml_at );
                l_vi_json.put( 'changedBy'          , l_vi_rec.dml_by );
                l_vi_json.put( 'changedType'        , l_vi_rec.dml_type );
            return l_vi_json;
        end;


     /**
     * Function to export the table ADM_CLASS_PROVINCE
     * @param p_id ID of the wanted province
     * @return json returns pl/json object
     */
     
     function AA_get_visas(p_id in varchar2) return json
        as
            l_vi_rec dl_bordercontrol.visas%rowtype;    -- Visa
            l_vi_json json;                             -- Visa JSON
        begin
            begin
                select
                    vi.key_value,
                    vi.visa_type,
                    vi.visa_number,
                    vi.issuing_date,
                    vi.issuing_place,
                    vi.additional_info,
                    vi.ins_terminal,
                    vi.ins_borderpost,
                    vi.borderdocument,
                    vi.visa_image,
                    vi.expiry_date,
                    vi.person,
                    vi.applicant_date,
                    vi.from_country,
                    vi.trans_vehicle,
                    vi.trans_number,
                    vi.status,
                    vi.release_note,
                    vi.cancel_note,
                    vi.payment_status,
                    vi.receipt,
                    vi.permit_type,
                    vi.permit_expiry_date,
                    vi.status_fee_exception,
                    vi.status_no_receipt,
                    vi.status_print_form,
                    vi.ins_at,
                    vi.ins_by,
                    vi.dml_at,
                    vi.dml_by,
                    vi.dml_type
                into
                    l_vi_rec.key_value,
                    l_vi_rec.visa_type,
                    l_vi_rec.visa_number,
                    l_vi_rec.issuing_date,
                    l_vi_rec.issuing_place,
                    l_vi_rec.additional_info,
                    l_vi_rec.ins_terminal,
                    l_vi_rec.ins_borderpost,
                    l_vi_rec.borderdocument,
                    l_vi_rec.visa_image,
                    l_vi_rec.expiry_date,
                    l_vi_rec.person,
                    l_vi_rec.applicant_date,
                    l_vi_rec.from_country,
                    l_vi_rec.trans_vehicle,
                    l_vi_rec.trans_number,
                    l_vi_rec.status,
                    l_vi_rec.release_note,
                    l_vi_rec.cancel_note,
                    l_vi_rec.payment_status,
                    l_vi_rec.receipt,
                    l_vi_rec.permit_type,
                    l_vi_rec.permit_expiry_date,
                    l_vi_rec.status_fee_exception,
                    l_vi_rec.status_no_receipt,
                    l_vi_rec.status_print_form,
                    l_vi_rec.ins_at,
                    l_vi_rec.ins_by,
                    l_vi_rec.dml_at,
                    l_vi_rec.dml_by,
                    l_vi_rec.dml_type
                from dl_bordercontrol.visas vi
                where vi.key_value = p_id;

            exception
              when no_data_found then
                l_vi_json := json();
                
                l_vi_json.put( 'id'                 , '' );
                l_vi_json.put( 'visaTypeId'         , '' );
                l_vi_json.put( 'visaNumber'         , '' );
                l_vi_json.put( 'issuingDate'        , '' );
                l_vi_json.put( 'issuingPlace'       , '' );
                l_vi_json.put( 'additionalInfo'     , '' );
                l_vi_json.put( 'terminalId'         , '' );
                l_vi_json.put( 'borderpostId'       , '' );
                l_vi_json.put( 'borderdocId'        , '' );
                l_vi_json.put( 'visaImage'          , '' );
                l_vi_json.put( 'expiryDate'         , '' );
                l_vi_json.put( 'person'             , '' );
                l_vi_json.put( 'applicantDate'      , '' );
                l_vi_json.put( 'fromCountryId'      , '' );
                l_vi_json.put( 'transVehicleId'     , '' );
                l_vi_json.put( 'transNumber'        , '' );
                l_vi_json.put( 'status'             , '' );
                l_vi_json.put( 'releaseNote'        , '' );
                l_vi_json.put( 'cancelNote'         , '' );
                l_vi_json.put( 'paymentStatus'      , '' );
                l_vi_json.put( 'receipt'            , '' );
                l_vi_json.put( 'permitTypeId'       , '' );
                l_vi_json.put( 'permitExpiryDate'   , '' );
                l_vi_json.put( 'statusFeeException' , '' );
                l_vi_json.put( 'statusNoReceipt'    , '' );
                l_vi_json.put( 'statusPrintForm'    , '' );
                l_vi_json.put( 'createdAt'          , '' );
                l_vi_json.put( 'createdBy'          , '' );
                l_vi_json.put( 'changedAt'          , '' );
                l_vi_json.put( 'changedBy'          , '' );
                l_vi_json.put( 'changedType'        , '' );
                
                return l_vi_json;
            end;

            l_vi_json := json();
                l_vi_json.put( 'id'                 , l_vi_rec.key_value );
                l_vi_json.put( 'visaTypeId'         , l_vi_rec.visa_type );
                l_vi_json.put( 'visaNumber'         , l_vi_rec.visa_number );
                l_vi_json.put( 'issuingDate'        , to_char( l_vi_rec.issuing_date, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_vi_json.put( 'issuingPlace'       , l_vi_rec.issuing_place );
                l_vi_json.put( 'additionalInfo'     , l_vi_rec.additional_info );
                l_vi_json.put( 'terminalId'         , l_vi_rec.ins_terminal );
                l_vi_json.put( 'borderpostId'       , l_vi_rec.ins_borderpost );
                l_vi_json.put( 'borderdocId'        , l_vi_rec.borderdocument );
                l_vi_json.put( 'visaImage'          , convert_image( l_vi_rec.visa_image ) );
                l_vi_json.put( 'expiryDate'         , to_char( l_vi_rec.expiry_date, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_vi_json.put( 'person'             , get_person( l_vi_rec.person ) );
                l_vi_json.put( 'applicantDate'      , l_vi_rec.applicant_date );
                l_vi_json.put( 'fromCountryId'      , l_vi_rec.from_country );
                l_vi_json.put( 'transVehicleId'     , l_vi_rec.trans_vehicle );
                l_vi_json.put( 'transNumber'        , l_vi_rec.trans_number );
                l_vi_json.put( 'status'             , l_vi_rec.status );
                l_vi_json.put( 'releaseNote'        , l_vi_rec.release_note );
                l_vi_json.put( 'cancelNote'         , l_vi_rec.cancel_note );
                l_vi_json.put( 'paymentStatus'      , l_vi_rec.payment_status );
                l_vi_json.put( 'receipt'            , get_faf_fees_and_fines( l_vi_rec.receipt ) );
                l_vi_json.put( 'permitTypeId'       , l_vi_rec.permit_type );
                l_vi_json.put( 'permitExpiryDate'   , to_char( l_vi_rec.permit_expiry_date, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_vi_json.put( 'statusFeeException' , l_vi_rec.status_fee_exception );
                l_vi_json.put( 'statusNoReceipt'    , l_vi_rec.status_no_receipt );
                l_vi_json.put( 'statusPrintForm'    , l_vi_rec.status_print_form );
                l_vi_json.put( 'createdAt'          , l_vi_rec.ins_at );
                l_vi_json.put( 'createdBy'          , l_vi_rec.ins_by );
                l_vi_json.put( 'changedAt'          , l_vi_rec.dml_at );
                l_vi_json.put( 'changedBy'          , l_vi_rec.dml_by );
                l_vi_json.put( 'changedType'        , l_vi_rec.dml_type );
            return l_vi_json;
        end;
     
     function get_adm_class_province(p_id in varchar2) return json
        as
            l_ap_rec dl_bordercontrol.adm_class_province%rowtype;   -- Province
            l_ap_json json;                                         -- Province JSON
        begin
            begin
                select
                    ap.key_value,
                    ap.locale,
                    ap.is_active,
                    ap.notice,
                    ap.num_value,
                    ap.display_value,
                    ap.display_order,
                    ap.display_code,
                    ap.adm_class_region,
                    ap.ins_at,
                    translate(ap.ins_by, chr(13), ''),
                    ap.dml_at,
                    translate(ap.dml_by, chr(13), ''),
                    ap.dml_type
                into
                    l_ap_rec.key_value,
                    l_ap_rec.locale,
                    l_ap_rec.is_active,
                    l_ap_rec.notice,
                    l_ap_rec.num_value,
                    l_ap_rec.display_value,
                    l_ap_rec.display_order,
                    l_ap_rec.display_code,
                    l_ap_rec.adm_class_region,
                    l_ap_rec.ins_at,
                    l_ap_rec.ins_by,
                    l_ap_rec.dml_at,
                    l_ap_rec.dml_by,
                    l_ap_rec.dml_type
                from dl_bordercontrol.adm_class_province ap
                where ap.key_value = p_id;

            exception
              when no_data_found then
                l_ap_json := json();
            end;

            l_ap_json := json();
                l_ap_json.put( 'id'                 , l_ap_rec.key_value );
                l_ap_json.put( 'locale'             , l_ap_rec.locale );
                l_ap_json.put( 'isActiveFlag'       , l_ap_rec.is_active );
                l_ap_json.put( 'notice'             , l_ap_rec.notice );
                l_ap_json.put( 'numValue'           , l_ap_rec.num_value );
                l_ap_json.put( 'displayValue'       , l_ap_rec.display_value );
                l_ap_json.put( 'displayOrder'       , l_ap_rec.display_order );
                l_ap_json.put( 'displayCode'        , l_ap_rec.display_code );
                l_ap_json.put( 'regionId'           , l_ap_rec.adm_class_region );
                l_ap_json.put( 'createdAt'          , to_char( l_ap_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ap_json.put( 'createdBy'          , l_ap_rec.ins_by );
                l_ap_json.put( 'lastModifiedAt'     , to_char( l_ap_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ap_json.put( 'lastModifiedBy'     , l_ap_rec.dml_by );
                l_ap_json.put( 'lastModifiedAction' , l_ap_rec.dml_type );
            return l_ap_json;
        end;


     /**
     * Function to export the table ADM_CLASS_DISTRICT
     * @param p_id ID of the wanted district
     * @return json returns pl/json object
     */
     function AA_get_adm_class_province(p_id in varchar2) return json
        as
            l_ap_rec dl_bordercontrol.adm_class_province%rowtype;   -- Province
            l_ap_json json;                                         -- Province JSON
        begin
            begin
                select
                    ap.key_value,
                    ap.locale,
                    ap.is_active,
                    ap.notice,
                    ap.num_value,
                    ap.display_value,
                    ap.display_order,
                    ap.display_code,
                    ap.adm_class_region,
                    ap.ins_at,
                    translate(ap.ins_by, chr(13), ''),
                    ap.dml_at,
                    translate(ap.dml_by, chr(13), ''),
                    ap.dml_type
                into
                    l_ap_rec.key_value,
                    l_ap_rec.locale,
                    l_ap_rec.is_active,
                    l_ap_rec.notice,
                    l_ap_rec.num_value,
                    l_ap_rec.display_value,
                    l_ap_rec.display_order,
                    l_ap_rec.display_code,
                    l_ap_rec.adm_class_region,
                    l_ap_rec.ins_at,
                    l_ap_rec.ins_by,
                    l_ap_rec.dml_at,
                    l_ap_rec.dml_by,
                    l_ap_rec.dml_type
                from dl_bordercontrol.adm_class_province ap
                where ap.key_value = p_id;

            exception
              when no_data_found then
                l_ap_json := json();
                l_ap_json.put( 'id'                 , '' );
                l_ap_json.put( 'locale'             , '' );
                l_ap_json.put( 'isActiveFlag'       , '' );
                l_ap_json.put( 'notice'             , '' );
                l_ap_json.put( 'numValue'           , '' );
                l_ap_json.put( 'displayValue'       , '' );
                l_ap_json.put( 'displayOrder'       , '' );
                l_ap_json.put( 'displayCode'        , '' );
                l_ap_json.put( 'regionId'           , '' );
                l_ap_json.put( 'createdAt'          , '' );
                l_ap_json.put( 'createdBy'          , '' );
                l_ap_json.put( 'lastModifiedAt'     , '' );
                l_ap_json.put( 'lastModifiedBy'     , '' );
                l_ap_json.put( 'lastModifiedAction' , '' );
                return l_ap_json;
            end;

            l_ap_json := json();
                l_ap_json.put( 'id'                 , l_ap_rec.key_value );
                l_ap_json.put( 'locale'             , l_ap_rec.locale );
                l_ap_json.put( 'isActiveFlag'       , l_ap_rec.is_active );
                l_ap_json.put( 'notice'             , l_ap_rec.notice );
                l_ap_json.put( 'numValue'           , l_ap_rec.num_value );
                l_ap_json.put( 'displayValue'       , l_ap_rec.display_value );
                l_ap_json.put( 'displayOrder'       , l_ap_rec.display_order );
                l_ap_json.put( 'displayCode'        , l_ap_rec.display_code );
                l_ap_json.put( 'regionId'           , l_ap_rec.adm_class_region );
                l_ap_json.put( 'createdAt'          , to_char( l_ap_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ap_json.put( 'createdBy'          , l_ap_rec.ins_by );
                l_ap_json.put( 'lastModifiedAt'     , to_char( l_ap_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ap_json.put( 'lastModifiedBy'     , l_ap_rec.dml_by );
                l_ap_json.put( 'lastModifiedAction' , l_ap_rec.dml_type );
            return l_ap_json;
        end;
     
     function get_adm_class_district(p_id in varchar2) return json
        as
            l_ad_rec dl_bordercontrol.adm_class_district%rowtype;   -- District
            l_ad_json json;                                         -- District JSON
        begin
            begin
                select
                    ad.key_value,
                    ad.locale,
                    ad.is_active,
                    ad.notice,
                    ad.num_value,
                    ad.display_value,
                    ad.display_order,
                    ad.display_code,
                    ad.adm_class_province,
                    ad.ins_at,
                    translate(ad.ins_by, chr(13), ''),
                    ad.dml_at,
                    translate(ad.dml_by, chr(13), ''),
                    ad.dml_type
                into
                    l_ad_rec.key_value,
                    l_ad_rec.locale,
                    l_ad_rec.is_active,
                    l_ad_rec.notice,
                    l_ad_rec.num_value,
                    l_ad_rec.display_value,
                    l_ad_rec.display_order,
                    l_ad_rec.display_code,
                    l_ad_rec.adm_class_province,
                    l_ad_rec.ins_at,
                    l_ad_rec.ins_by,
                    l_ad_rec.dml_at,
                    l_ad_rec.dml_by,
                    l_ad_rec.dml_type
                from dl_bordercontrol.adm_class_district ad
                where ad.key_value = p_id;

            exception
              when no_data_found then
                l_ad_json := json();
                return l_ad_json;
            end;

            l_ad_json := json();
                l_ad_json.put( 'id'                 , l_ad_rec.key_value );
                l_ad_json.put( 'locale'             , l_ad_rec.locale );
                l_ad_json.put( 'isActiveFlag'       , l_ad_rec.is_active );
                l_ad_json.put( 'notice'             , l_ad_rec.notice );
                l_ad_json.put( 'numValue'           , l_ad_rec.num_value );
                l_ad_json.put( 'displayValue'       , l_ad_rec.display_value );
                l_ad_json.put( 'displayOrder'       , l_ad_rec.display_order );
                l_ad_json.put( 'displayCode'        , l_ad_rec.display_code );
                l_ad_json.put( 'provinceId'         , l_ad_rec.adm_class_province );
                l_ad_json.put( 'createdAt'          , to_char( l_ad_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ad_json.put( 'createdBy'          , l_ad_rec.ins_by );
                l_ad_json.put( 'lastModifiedAt'     , to_char( l_ad_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ad_json.put( 'lastModifiedBy'     , l_ad_rec.dml_by );
                l_ad_json.put( 'lastModifiedAction' , l_ad_rec.dml_type );
            return l_ad_json;
        end;


     /**
     * Function to export the table ADM_CLASS_SUBDISTRICT
     * @param p_id ID of the wanted subdistrict
     * @return json returns pl/json object
     */
     function get_adm_class_subdistrict(p_id in varchar2) return json
        as
            l_sd_rec dl_bordercontrol.adm_class_subdistrict%rowtype;    -- Subdistrict
            l_sd_json json;                                             -- Subdistrict JSON
        begin
            begin
                select
                    sd.key_value,
                    sd.locale,
                    sd.is_active,
                    sd.notice,
                    sd.num_value,
                    sd.display_value,
                    sd.display_order,
                    sd.display_code,
                    sd.adm_class_district,
                    sd.ins_at,
                    translate(sd.ins_by, chr(13), ''),
                    sd.dml_at,
                    translate(sd.dml_by, chr(13), ''),
                    sd.dml_type
                into
                    l_sd_rec.key_value,
                    l_sd_rec.locale,
                    l_sd_rec.is_active,
                    l_sd_rec.notice,
                    l_sd_rec.num_value,
                    l_sd_rec.display_value,
                    l_sd_rec.display_order,
                    l_sd_rec.display_code,
                    l_sd_rec.adm_class_district,
                    l_sd_rec.ins_at,
                    l_sd_rec.ins_by,
                    l_sd_rec.dml_at,
                    l_sd_rec.dml_by,
                    l_sd_rec.dml_type
                from dl_bordercontrol.adm_class_subdistrict sd
                where sd.key_value = p_id;

            exception
              when no_data_found then
                l_sd_json := json();
                return l_sd_json;
            end;

            l_sd_json := json();
                l_sd_json.put( 'id'                 , l_sd_rec.key_value );
                l_sd_json.put( 'locale'             , l_sd_rec.locale );
                l_sd_json.put( 'isActiveFlag'       , l_sd_rec.is_active );
                l_sd_json.put( 'notice'             , l_sd_rec.notice );
                l_sd_json.put( 'numValue'           , l_sd_rec.num_value );
                l_sd_json.put( 'displayValue'       , l_sd_rec.display_value );
                l_sd_json.put( 'displayOrder'       , l_sd_rec.display_order );
                l_sd_json.put( 'displayCode'        , l_sd_rec.display_code );
                l_sd_json.put( 'districtId'         , l_sd_rec.adm_class_district );
                l_sd_json.put( 'createdAt'          , to_char( l_sd_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_sd_json.put( 'createdBy'          , l_sd_rec.ins_by );
                l_sd_json.put( 'lastModifiedAt'     , to_char( l_sd_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_sd_json.put( 'lastModifiedBy'     , l_sd_rec.dml_by );
                l_sd_json.put( 'lastModifiedAction' , l_sd_rec.dml_type );
            return l_sd_json;
        end;


     /**
     * Function to export the table ENTRY_FORMS
     * @param p_id ID of the wanted entry form
     * @return json returns pl/json object
     */
     function get_entry_forms(p_id in varchar2) return json
        as
            l_ef_rec dl_bordercontrol.entry_forms%rowtype;  -- Entry Forms
            l_ef_json json;                                 -- Entry Forms JSON
        begin
            begin
                select
                    ef.key_value,
                    ef.form_image,
                    ef.form_no,
                    ef.province,
                    ef.district,
                    ef.subdistrict,
                    ef.address,
                    ef.note,
                    ef.ins_at,
                    translate(ef.ins_by, chr(13), ''),
                    ef.dml_at,
                    translate(ef.dml_by, chr(13), ''),
                    ef.dml_type,
                    ef.ins_terminal,
                    ef.ins_borderpost
                into
                    l_ef_rec.key_value,
                    l_ef_rec.form_image,
                    l_ef_rec.form_no,
                    l_ef_rec.province,
                    l_ef_rec.district,
                    l_ef_rec.subdistrict,
                    l_ef_rec.address,
                    l_ef_rec.note,
                    l_ef_rec.ins_at,
                    l_ef_rec.ins_by,
                    l_ef_rec.dml_at,
                    l_ef_rec.dml_by,
                    l_ef_rec.dml_type,
                    l_ef_rec.ins_terminal,
                    l_ef_rec.ins_borderpost
                from dl_bordercontrol.entry_forms ef
                where ef.key_value = p_id;

            exception
              when no_data_found then
                l_ef_json := json();
                return l_ef_json;
            end;

            l_ef_json := json();
                l_ef_json.put( 'id'                    , l_ef_rec.key_value );
                l_ef_json.put( 'formImage'             , convert_image( l_ef_rec.form_image ) );
                l_ef_json.put( 'formNo'                , l_ef_rec.form_no );
                l_ef_json.put( 'province'              , get_adm_class_province( l_ef_rec.province ) );
                l_ef_json.put( 'district'              , get_adm_class_district( l_ef_rec.district ) );
                l_ef_json.put( 'subdistrict'           , get_adm_class_subdistrict( l_ef_rec.subdistrict ) );
                l_ef_json.put( 'address'               , l_ef_rec.address );
                l_ef_json.put( 'note'                  , l_ef_rec.note );
                l_ef_json.put( 'createdAt'             , to_char(l_ef_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ef_json.put( 'createdBy'             , l_ef_rec.ins_by );
                l_ef_json.put( 'lastModifiedAt'        , to_char( l_ef_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ef_json.put( 'lastModifiedBy'        , l_ef_rec.dml_by );
                l_ef_json.put( 'lastModifiedAction'    , l_ef_rec.dml_type );
                l_ef_json.put( 'createdByTerminalId'   , l_ef_rec.ins_terminal );
                l_ef_json.put( 'createdByBorderpostId' , l_ef_rec.ins_borderpost );
            return l_ef_json;
        end;


     /**
     * Function to export the table MOVEMENTS_BLOB
     * @param p_id ID of the wanted movement images
     * @return json returns pl/json object
     */
     
     function AA_get_entry_forms(p_id in varchar2) return json
        as
            l_ef_rec dl_bordercontrol.entry_forms%rowtype;  -- Entry Forms
            l_ef_json json;                                 -- Entry Forms JSON
        begin
            begin
                select
                    ef.key_value,
                    ef.form_image,
                    ef.form_no,
                    ef.province,
                    ef.district,
                    ef.subdistrict,
                    ef.address,
                    ef.note,
                    ef.ins_at,
                    translate(ef.ins_by, chr(13), ''),
                    ef.dml_at,
                    translate(ef.dml_by, chr(13), ''),
                    ef.dml_type,
                    ef.ins_terminal,
                    ef.ins_borderpost
                into
                    l_ef_rec.key_value,
                    l_ef_rec.form_image,
                    l_ef_rec.form_no,
                    l_ef_rec.province,
                    l_ef_rec.district,
                    l_ef_rec.subdistrict,
                    l_ef_rec.address,
                    l_ef_rec.note,
                    l_ef_rec.ins_at,
                    l_ef_rec.ins_by,
                    l_ef_rec.dml_at,
                    l_ef_rec.dml_by,
                    l_ef_rec.dml_type,
                    l_ef_rec.ins_terminal,
                    l_ef_rec.ins_borderpost
                from dl_bordercontrol.entry_forms ef
                where ef.key_value = p_id;

            exception
              when no_data_found then
                l_ef_json := json();
                
                l_ef_json.put( 'id'                    , '' );
                l_ef_json.put( 'formImage'             , '' );
                l_ef_json.put( 'formNo'                , '' );
                l_ef_json.put( 'province'              , AA_get_adm_class_province( '' ) );
                l_ef_json.put( 'district'              , '' );
                l_ef_json.put( 'subdistrict'           , '' );
                l_ef_json.put( 'address'               , '' );
                l_ef_json.put( 'note'                  , '' );
                l_ef_json.put( 'createdAt'             , '' );
                l_ef_json.put( 'createdBy'             , '' );
                l_ef_json.put( 'lastModifiedAt'        , '' );
                l_ef_json.put( 'lastModifiedBy'        , '' );
                l_ef_json.put( 'lastModifiedAction'    , '' );
                l_ef_json.put( 'createdByTerminalId'   , '' );
                l_ef_json.put( 'createdByBorderpostId' , '' );
                
                return l_ef_json;
            end;

            l_ef_json := json();
                l_ef_json.put( 'id'                    , l_ef_rec.key_value );
                l_ef_json.put( 'formImage'             , convert_image( l_ef_rec.form_image ) );
                l_ef_json.put( 'formNo'                , l_ef_rec.form_no );
                l_ef_json.put( 'province'              , AA_get_adm_class_province( l_ef_rec.province ) );
                l_ef_json.put( 'district'              , get_adm_class_district( l_ef_rec.district ) );
                l_ef_json.put( 'subdistrict'           , get_adm_class_subdistrict( l_ef_rec.subdistrict ) );
                l_ef_json.put( 'address'               , l_ef_rec.address );
                l_ef_json.put( 'note'                  , l_ef_rec.note );
                l_ef_json.put( 'createdAt'             , to_char(l_ef_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ef_json.put( 'createdBy'             , l_ef_rec.ins_by );
                l_ef_json.put( 'lastModifiedAt'        , to_char( l_ef_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_ef_json.put( 'lastModifiedBy'        , l_ef_rec.dml_by );
                l_ef_json.put( 'lastModifiedAction'    , l_ef_rec.dml_type );
                l_ef_json.put( 'createdByTerminalId'   , l_ef_rec.ins_terminal );
                l_ef_json.put( 'createdByBorderpostId' , l_ef_rec.ins_borderpost );
            return l_ef_json;
        end;
     
     function get_movements_blob(p_id in varchar2) return json
        as
            l_mb_rec dl_bordercontrol.movements_blob%rowtype;   -- Movement Images
            l_mb_json json;                                     -- Movement Images JSON
        begin
            begin
                select
                    mb.live_photo,
                    mb.ins_at,
                    translate(mb.ins_by, chr(13), ''),
                    mb.dml_at,
                    translate(mb.dml_by, chr(13), ''),
                    mb.dml_type,
                    mb.ins_terminal,
                    mb.ins_borderpost
                into
                    l_mb_rec.live_photo,
                    l_mb_rec.ins_at,
                    l_mb_rec.ins_by,
                    l_mb_rec.dml_at,
                    l_mb_rec.dml_by,
                    l_mb_rec.dml_type,
                    l_mb_rec.ins_terminal,
                    l_mb_rec.ins_borderpost
                from dl_bordercontrol.movements_blob mb
                where mb.mvmnt_id = p_id;

            exception
              when no_data_found then
                l_mb_json := json();
                return l_mb_json;
            end;

            l_mb_json := json();
                l_mb_json.put( 'wsqLL'                 , 'null' );
                l_mb_json.put( 'wsqLI'                 , 'null' );
                l_mb_json.put( 'wsqLM'                 , 'null' );
                l_mb_json.put( 'wsqLR'                 , 'null' );
                l_mb_json.put( 'wsqLT'                 , 'null' );
                l_mb_json.put( 'wsqRL'                 , 'null' );
                l_mb_json.put( 'wsqRI'                 , 'null' );
                l_mb_json.put( 'wsqRM'                 , 'null' );
                l_mb_json.put( 'wsqRR'                 , 'null' );
                l_mb_json.put( 'wsqRT'                 , 'null' );
                l_mb_json.put( 'livePhoto'             , convert_image( l_mb_rec.live_photo) );
                --l_mb_json.put( 'livePhoto'             , convert_image( resize_img(l_mb_rec.live_photo) ) );
                l_mb_json.put( 'psBlob1'               , 'null' );
                l_mb_json.put( 'psBlob2'               , 'null' );
                l_mb_json.put( 'psBlob3'               , 'null' );
                l_mb_json.put( 'psBlob4'               , 'null' );
                l_mb_json.put( 'psBlob5'               , 'null' );
                l_mb_json.put( 'psBlob6'               , 'null' );
                l_mb_json.put( 'psBlob7'               , 'null' );
                l_mb_json.put( 'psBlob8'               , 'null' );
                l_mb_json.put( 'psBlob9'               , 'null' );
                l_mb_json.put( 'psBlob10'              , 'null' );
                l_mb_json.put( 'templateLL'            , 'null' );
                l_mb_json.put( 'templateLI'            , 'null' );
                l_mb_json.put( 'templateLM'            , 'null' );
                l_mb_json.put( 'templateLR'            , 'null' );
                l_mb_json.put( 'templateLT'            , 'null' );
                l_mb_json.put( 'templateRL'            , 'null' );
                l_mb_json.put( 'templateRI'            , 'null' );
                l_mb_json.put( 'templateRM'            , 'null' );
                l_mb_json.put( 'templateRR'            , 'null' );
                l_mb_json.put( 'templateRT'            , 'null' );
                l_mb_json.put( 'visaPage'              , 'null' );
                l_mb_json.put( 'travelcardPage'        , 'null' );
                l_mb_json.put( 'createdAt'             , to_char( l_mb_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_mb_json.put( 'createdBy'             , l_mb_rec.ins_by );
                l_mb_json.put( 'lastModifiedAt'        , to_char( l_mb_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_mb_json.put( 'lastModifiedBy'        , l_mb_rec.dml_by );
                l_mb_json.put( 'lastModifiedAction'    , l_mb_rec.dml_type );
                l_mb_json.put( 'createdByTerminalId'   , l_mb_rec.ins_terminal );
                l_mb_json.put( 'createdByBorderpostId' , l_mb_rec.ins_borderpost );
            return l_mb_json;
        end;

    /**
     * Function to export the table FELLOW_PASSENGER
     * @param p_id ID of the wanted movement
     * @return json returns pl/json object
     */
     function get_movement_fellow_passenger(p_id in varchar2) return json_list
     is
        l_fp_json       json_list;        -- Fellow passenger JSON
        l_fp_json_one   json;         -- Fellow passenger JSON
        l_fp_cnt        number(4);         -- Counter variable to check if images exist
     begin

        -- fill and then insert Border Images if exist
        l_fp_json := json_list();

        select count(1)
        into l_fp_cnt
        from dl_bordercontrol.fellow_passenger
        where mvmntid = p_id;

        if ( l_fp_cnt > 0) then

            for l_fp_rec in (select
                                 key_value
                                ,person
                                ,relation
                                ,nationality
                                ,receipt
                                ,tm6_no
                                ,first_name
                                ,middle_name
                                ,last_name
                                ,sex
                                ,date_of_birth
                                ,place_of_birth
                                ,reason
                                ,approval_status
                                ,image
                                ,dml_at
                                ,dml_by
                                ,dml_type
                                ,ins_at
                                ,ins_by
                            from dl_bordercontrol.fellow_passenger
                            where mvmntid = p_id
                            )
            loop
                l_fp_json_one := json();

                    l_fp_json_one.put( 'id'                     , l_fp_rec.key_value);
                    l_fp_json_one.put( 'personId'               , l_fp_rec.person);
                    l_fp_json_one.put( 'relationId'             , l_fp_rec.relation);
                    l_fp_json_one.put( 'nationalityId'          , l_fp_rec.nationality);
                    l_fp_json_one.put( 'receiptId'              , l_fp_rec.receipt);
                    l_fp_json_one.put( 'tm6No'                  , l_fp_rec.tm6_no);
                    l_fp_json_one.put( 'firstName'              , l_fp_rec.first_name);
                    l_fp_json_one.put( 'middleName'             , l_fp_rec.middle_name);
                    l_fp_json_one.put( 'lastName'               , l_fp_rec.last_name);
                    l_fp_json_one.put( 'sexId'                  , l_fp_rec.sex);
                    l_fp_json_one.put( 'dateOfBirth'            , to_char(l_fp_rec.date_of_birth, 'dd.mm.yyyy hh24:mi:ss' ) );
                    l_fp_json_one.put( 'placeOfBirth'           , l_fp_rec.place_of_birth);
                    l_fp_json_one.put( 'reason'                 , l_fp_rec.reason);
                    l_fp_json_one.put( 'approvalStatus'         , l_fp_rec.approval_status);
                    l_fp_json_one.put( 'image'                  , convert_image(l_fp_rec.image));
                    l_fp_json_one.put( 'lastModifiedAt'         , to_char(l_fp_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                    l_fp_json_one.put( 'lastModifiedBy'         , l_fp_rec.dml_by);
                    l_fp_json_one.put( 'lastModifiedAction'     , translate(l_fp_rec.dml_type, chr(10), ''));
                    l_fp_json_one.put( 'createdAt'              , to_char(l_fp_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                    l_fp_json_one.put( 'createdBy'              , translate(l_fp_rec.ins_by, chr(10), ''));
                l_fp_json.append( l_fp_json_one.to_json_value() );
            end loop;
        end if;
        return l_fp_json;

     end get_movement_fellow_passenger;


     /**
     * Function to export the table MOVEMENTS including all previous sub tables
     * @param p_id ID of the wanted movement
     * @return json returns pl/json object
     */
     function AA_get_movement_fellow_passenger(p_id in varchar2) return json_list
     is
        l_fp_json       json_list;        -- Fellow passenger JSON
        l_fp_json_one   json;         -- Fellow passenger JSON
        l_fp_cnt        number(4);         -- Counter variable to check if images exist
     begin

        -- fill and then insert Border Images if exist
        l_fp_json := json_list();

        select count(1)
        into l_fp_cnt
        from dl_bordercontrol.fellow_passenger
        where mvmntid = p_id;

        if ( l_fp_cnt > 0) then

            for l_fp_rec in (select
                                 key_value
                                ,person
                                ,relation
                                ,nationality
                                ,receipt
                                ,tm6_no
                                ,first_name
                                ,middle_name
                                ,last_name
                                ,sex
                                ,date_of_birth
                                ,place_of_birth
                                ,reason
                                ,approval_status
                                ,image
                                ,dml_at
                                ,dml_by
                                ,dml_type
                                ,ins_at
                                ,ins_by
                            from dl_bordercontrol.fellow_passenger
                            where mvmntid = p_id
                            )
            loop
                l_fp_json_one := json();

                    l_fp_json_one.put( 'id'                     , l_fp_rec.key_value);
                    l_fp_json_one.put( 'personId'               , l_fp_rec.person);
                    l_fp_json_one.put( 'relationId'             , l_fp_rec.relation);
                    l_fp_json_one.put( 'nationalityId'          , l_fp_rec.nationality);
                    l_fp_json_one.put( 'receiptId'              , l_fp_rec.receipt);
                    l_fp_json_one.put( 'tm6No'                  , l_fp_rec.tm6_no);
                    l_fp_json_one.put( 'firstName'              , l_fp_rec.first_name);
                    l_fp_json_one.put( 'middleName'             , l_fp_rec.middle_name);
                    l_fp_json_one.put( 'lastName'               , l_fp_rec.last_name);
                    l_fp_json_one.put( 'sexId'                  , l_fp_rec.sex);
                    l_fp_json_one.put( 'dateOfBirth'            , to_char(l_fp_rec.date_of_birth, 'dd.mm.yyyy hh24:mi:ss' ) );
                    l_fp_json_one.put( 'placeOfBirth'           , l_fp_rec.place_of_birth);
                    l_fp_json_one.put( 'reason'                 , l_fp_rec.reason);
                    l_fp_json_one.put( 'approvalStatus'         , l_fp_rec.approval_status);
                    l_fp_json_one.put( 'image'                  , convert_image(l_fp_rec.image));
                    l_fp_json_one.put( 'lastModifiedAt'         , to_char(l_fp_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                    l_fp_json_one.put( 'lastModifiedBy'         , l_fp_rec.dml_by);
                    l_fp_json_one.put( 'lastModifiedAction'     , translate(l_fp_rec.dml_type, chr(10), ''));
                    l_fp_json_one.put( 'createdAt'              , to_char(l_fp_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                    l_fp_json_one.put( 'createdBy'              , translate(l_fp_rec.ins_by, chr(10), ''));
                l_fp_json.append( l_fp_json_one.to_json_value() );
            end loop;
        else
            l_fp_json_one := json();

                    l_fp_json_one.put( 'id'                     , '');
                    l_fp_json_one.put( 'personId'               , '');
                    l_fp_json_one.put( 'relationId'             , '');
                    l_fp_json_one.put( 'nationalityId'          , '');
                    l_fp_json_one.put( 'receiptId'              , '');
                    l_fp_json_one.put( 'tm6No'                  , '');
                    l_fp_json_one.put( 'firstName'              , '');
                    l_fp_json_one.put( 'middleName'             , '');
                    l_fp_json_one.put( 'lastName'               , '');
                    l_fp_json_one.put( 'sexId'                  , '');
                    l_fp_json_one.put( 'dateOfBirth'            , '');
                    l_fp_json_one.put( 'placeOfBirth'           , '');
                    l_fp_json_one.put( 'reason'                 , '');
                    l_fp_json_one.put( 'approvalStatus'         , '');
                    l_fp_json_one.put( 'image'                  , '');
                    l_fp_json_one.put( 'lastModifiedAt'         , '');
                    l_fp_json_one.put( 'lastModifiedBy'         , '');
                    l_fp_json_one.put( 'lastModifiedAction'     , '');
                    l_fp_json_one.put( 'createdAt'              , '');
                    l_fp_json_one.put( 'createdBy'              , '');
                    l_fp_json.append( l_fp_json_one.to_json_value() );
        end if;
        return l_fp_json;

     end AA_get_movement_fellow_passenger;
     
     function get_movements(p_id in varchar2) return clob
        as
            l_mv_rec dl_bordercontrol.movements%rowtype;    -- Movement
            l_mv_json json;                                 -- Movement JSON
            l_mv_clob clob;                                 -- Movement JSON as clob for export
        begin
            begin
                select
                    mv.mvmntid,
                    mv.brddocid,
                    mv.landbarcd,
                    mv.exitflg,
                    mv.max_stay_dt,
                    mv.fingermatch,
                    mv.facematch,
                    mv.mvmntaddr,
                    mv.oridest,
                    mv.ins_at,
                    --translate(mv.ins_by, chr(13), ''),
                    --SUBSTR(nvl(mv.dml_by,mv.ins_by), 0, INSTR(nvl(mv.dml_by,mv.ins_by) ,' @', 1)),
                    SUBSTR(nvl(mv.ins_by,mv.dml_by), 0, INSTR(nvl(mv.ins_by,mv.dml_by) ,' @', 1)),
                    mv.dml_at,
                    translate(mv.dml_by, chr(13), ''),
                    mv.dml_type,
                    mv.ins_terminal,
                    mv.ins_borderpost,
                    mv.refusedflg,
                    mv.observation,
                    mv.trnsprtunitid,
                    mv.person_type,
                    mv.scanned_flight,
                    mv.ps_1,
                    mv.ps_2,
                    mv.ps_3,
                    mv.ps_4,
                    mv.ps_5,
                    mv.ps_6,
                    mv.ps_7,
                    mv.ps_8,
                    mv.ps_9,
                    mv.ps_10,
                    mv.fingermatch_history,
                    mv.facematc_history,
                    mv.reason_offload,
                    mv.reason_deportee,
                    mv.visa_type,
                    mv.visa,
                    mv.is_finished,
                    mv.prior_movement,
                    mv.entry_form,
                    mv.form_no_approved,
                    mv.movement_dt,
                    mv.source_system,
                    mv.date_of_entry,
                    mv.mrzvisa
                into
                    l_mv_rec.mvmntid,
                    l_mv_rec.brddocid,
                    l_mv_rec.landbarcd,
                    l_mv_rec.exitflg,
                    l_mv_rec.max_stay_dt,
                    l_mv_rec.fingermatch,
                    l_mv_rec.facematch,
                    l_mv_rec.mvmntaddr,
                    l_mv_rec.oridest,
                    l_mv_rec.ins_at,
                    l_mv_rec.ins_by,
                    l_mv_rec.dml_at,
                    l_mv_rec.dml_by,
                    l_mv_rec.dml_type,
                    l_mv_rec.ins_terminal,
                    l_mv_rec.ins_borderpost,
                    l_mv_rec.refusedflg,
                    l_mv_rec.observation,
                    l_mv_rec.trnsprtunitid,
                    l_mv_rec.person_type,
                    l_mv_rec.scanned_flight,
                    l_mv_rec.ps_1,
                    l_mv_rec.ps_2,
                    l_mv_rec.ps_3,
                    l_mv_rec.ps_4,
                    l_mv_rec.ps_5,
                    l_mv_rec.ps_6,
                    l_mv_rec.ps_7,
                    l_mv_rec.ps_8,
                    l_mv_rec.ps_9,
                    l_mv_rec.ps_10,
                    l_mv_rec.fingermatch_history,
                    l_mv_rec.facematc_history,
                    l_mv_rec.reason_offload,
                    l_mv_rec.reason_deportee,
                    l_mv_rec.visa_type,
                    l_mv_rec.visa,
                    l_mv_rec.is_finished,
                    l_mv_rec.prior_movement,
                    l_mv_rec.entry_form,
                    l_mv_rec.form_no_approved,
                    l_mv_rec.movement_dt,
                    l_mv_rec.source_system,
                    l_mv_rec.date_of_entry,
                    l_mv_rec.mrzvisa
                from dl_bordercontrol.movements mv
                where mv.mvmntid = p_id;

            exception
              when no_data_found then
                return l_mv_clob;
            end;

            l_mv_json := json();
                l_mv_json.put( 'id'                  , l_mv_rec.mvmntid );
                l_mv_json.put( 'borderdocuments'     , get_borderdocuments( l_mv_rec.brddocid ) );
                l_mv_json.put( 'landbarCode'         , l_mv_rec.landbarcd );
                l_mv_json.put( 'exitFlag'            , l_mv_rec.exitflg );
                l_mv_json.put( 'maxStayDate'         , l_mv_rec.max_stay_dt );
                l_mv_json.put( 'fingermatch'         , l_mv_rec.fingermatch );
                l_mv_json.put( 'facematch'           , l_mv_rec.facematch );
                l_mv_json.put( 'movementAdress'      , l_mv_rec.mvmntaddr );
                l_mv_json.put( 'oriDest'             , l_mv_rec.oridest );
                l_mv_json.put( 'createdAt'           , to_char( l_mv_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_mv_json.put( 'createdBy'           , l_mv_rec.ins_by );
                l_mv_json.put( 'lastModifiedAt'      , to_char( l_mv_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_mv_json.put( 'lastModifiedBy'      , l_mv_rec.dml_by );
                l_mv_json.put( 'lastModifiedAction'  , l_mv_rec.dml_type );
                l_mv_json.put( 'terminal'            , get_terminals( l_mv_rec.ins_terminal ) );
                l_mv_json.put( 'borderpost'          , get_borderposts( l_mv_rec.ins_borderpost ) );
                l_mv_json.put( 'refusedFlag'         , l_mv_rec.refusedflg );
                l_mv_json.put( 'observation'         , l_mv_rec.observation );
                l_mv_json.put( 'transportUnitId'     , l_mv_rec.trnsprtunitid );
                l_mv_json.put( 'personType'          , l_mv_rec.person_type );
                l_mv_json.put( 'scannedFlight'       , l_mv_rec.scanned_flight );
                l_mv_json.put( 'ps1'                 , l_mv_rec.ps_1 );
                l_mv_json.put( 'ps2'                 , l_mv_rec.ps_2 );
                l_mv_json.put( 'ps3'                 , l_mv_rec.ps_3 );
                l_mv_json.put( 'ps4'                 , l_mv_rec.ps_4 );
                l_mv_json.put( 'ps5'                 , l_mv_rec.ps_5 );
                l_mv_json.put( 'ps6'                 , l_mv_rec.ps_6 );
                l_mv_json.put( 'ps7'                 , l_mv_rec.ps_7 );
                l_mv_json.put( 'ps8'                 , l_mv_rec.ps_8 );
                l_mv_json.put( 'ps9'                 , l_mv_rec.ps_9 );
                l_mv_json.put( 'ps10'                , l_mv_rec.ps_10 );
                l_mv_json.put( 'fingermatchHistory'  , l_mv_rec.fingermatch_history );
                l_mv_json.put( 'facematchHistory'    , l_mv_rec.facematc_history );
                l_mv_json.put( 'reasonOffload'       , l_mv_rec.reason_offload );
                l_mv_json.put( 'reasonDeportee'      , l_mv_rec.reason_deportee );
                l_mv_json.put( 'visaType'            , dl_common.pkg_json_export.get_visa_type( l_mv_rec.visa_type ) );
                l_mv_json.put( 'visa'                , get_visas( l_mv_rec.visa ) );
                l_mv_json.put( 'isFinishedFlag'      , l_mv_rec.is_finished );
                l_mv_json.put( 'priorMovementId'     , l_mv_rec.prior_movement );
                l_mv_json.put( 'entryForm'           , get_entry_forms( l_mv_rec.entry_form ) );
                l_mv_json.put( 'entryFormNoApproved' , l_mv_rec.form_no_approved );
                l_mv_json.put( 'movementDate'        , to_char( l_mv_rec.movement_dt, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_mv_json.put( 'sourceSystem'        , l_mv_rec.source_system );
                l_mv_json.put( 'dateOfEntry'         , to_char( l_mv_rec.date_of_entry, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_mv_json.put( 'mrzVisa'             , l_mv_rec.mrzvisa );
                l_mv_json.put( 'movementImages'      , get_movements_blob( l_mv_rec.mvmntid ) );
                l_mv_json.put( 'collectivePassports' , get_movement_fellow_passenger( l_mv_rec.mvmntid ) );

            dbms_lob.createtemporary( l_mv_clob, true );
            l_mv_json.to_clob( l_mv_clob );

            return l_mv_clob;
        end;
        
    function get_movements_jira(p_id in varchar2) return clob
        as
            l_mv_rec dl_bordercontrol.movements%rowtype;    -- Movement
            l_mv_json json;                                 -- Movement JSON
            l_mv_clob clob;                                 -- Movement JSON as clob for export
        begin
            begin
                select
                    mv.mvmntid,
                    mv.brddocid,
                    mv.landbarcd,
                    mv.exitflg,
                    mv.max_stay_dt,
                    mv.fingermatch,
                    mv.facematch,
                    mv.mvmntaddr,
                    mv.oridest,
                    mv.ins_at,
                    --translate(mv.ins_by, chr(13), ''),
                    'PRIMTHAWAN.B',
                    mv.dml_at,
                    translate(mv.dml_by, chr(13), ''),
                    mv.dml_type,
                    mv.ins_terminal,
                    mv.ins_borderpost,
                    mv.refusedflg,
                    mv.observation,
                    mv.trnsprtunitid,
                    mv.person_type,
                    mv.scanned_flight,
                    mv.ps_1,
                    mv.ps_2,
                    mv.ps_3,
                    mv.ps_4,
                    mv.ps_5,
                    mv.ps_6,
                    mv.ps_7,
                    mv.ps_8,
                    mv.ps_9,
                    mv.ps_10,
                    mv.fingermatch_history,
                    mv.facematc_history,
                    mv.reason_offload,
                    mv.reason_deportee,
                    mv.visa_type,
                    mv.visa,
                    mv.is_finished,
                    mv.prior_movement,
                    mv.entry_form,
                    mv.form_no_approved,
                    mv.movement_dt,
                    mv.source_system,
                    mv.date_of_entry,
                    mv.mrzvisa
                into
                    l_mv_rec.mvmntid,
                    l_mv_rec.brddocid,
                    l_mv_rec.landbarcd,
                    l_mv_rec.exitflg,
                    l_mv_rec.max_stay_dt,
                    l_mv_rec.fingermatch,
                    l_mv_rec.facematch,
                    l_mv_rec.mvmntaddr,
                    l_mv_rec.oridest,
                    l_mv_rec.ins_at,
                    l_mv_rec.ins_by,
                    l_mv_rec.dml_at,
                    l_mv_rec.dml_by,
                    l_mv_rec.dml_type,
                    l_mv_rec.ins_terminal,
                    l_mv_rec.ins_borderpost,
                    l_mv_rec.refusedflg,
                    l_mv_rec.observation,
                    l_mv_rec.trnsprtunitid,
                    l_mv_rec.person_type,
                    l_mv_rec.scanned_flight,
                    l_mv_rec.ps_1,
                    l_mv_rec.ps_2,
                    l_mv_rec.ps_3,
                    l_mv_rec.ps_4,
                    l_mv_rec.ps_5,
                    l_mv_rec.ps_6,
                    l_mv_rec.ps_7,
                    l_mv_rec.ps_8,
                    l_mv_rec.ps_9,
                    l_mv_rec.ps_10,
                    l_mv_rec.fingermatch_history,
                    l_mv_rec.facematc_history,
                    l_mv_rec.reason_offload,
                    l_mv_rec.reason_deportee,
                    l_mv_rec.visa_type,
                    l_mv_rec.visa,
                    l_mv_rec.is_finished,
                    l_mv_rec.prior_movement,
                    l_mv_rec.entry_form,
                    l_mv_rec.form_no_approved,
                    l_mv_rec.movement_dt,
                    l_mv_rec.source_system,
                    l_mv_rec.date_of_entry,
                    l_mv_rec.mrzvisa
                from dl_bordercontrol.movements mv
                where mv.mvmntid = p_id;

            exception
              when no_data_found then
                return l_mv_clob;
            end;

            l_mv_json := json();
                l_mv_json.put( 'id'                  , l_mv_rec.mvmntid );
                l_mv_json.put( 'borderdocuments'     , get_borderdocuments( l_mv_rec.brddocid ) );
                l_mv_json.put( 'landbarCode'         , l_mv_rec.landbarcd );
                l_mv_json.put( 'exitFlag'            , l_mv_rec.exitflg );
                l_mv_json.put( 'maxStayDate'         , l_mv_rec.max_stay_dt );
                l_mv_json.put( 'fingermatch'         , l_mv_rec.fingermatch );
                l_mv_json.put( 'facematch'           , l_mv_rec.facematch );
                l_mv_json.put( 'movementAdress'      , l_mv_rec.mvmntaddr );
                l_mv_json.put( 'oriDest'             , l_mv_rec.oridest );
                l_mv_json.put( 'createdAt'           , to_char( l_mv_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_mv_json.put( 'createdBy'           , l_mv_rec.ins_by );
                l_mv_json.put( 'lastModifiedAt'      , to_char( l_mv_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_mv_json.put( 'lastModifiedBy'      , l_mv_rec.dml_by );
                l_mv_json.put( 'lastModifiedAction'  , l_mv_rec.dml_type );
                l_mv_json.put( 'terminal'            , get_terminals( l_mv_rec.ins_terminal ) );
                l_mv_json.put( 'borderpost'          , get_borderposts( l_mv_rec.ins_borderpost ) );
                l_mv_json.put( 'refusedFlag'         , l_mv_rec.refusedflg );
                l_mv_json.put( 'observation'         , l_mv_rec.observation );
                l_mv_json.put( 'transportUnitId'     , l_mv_rec.trnsprtunitid );
                l_mv_json.put( 'personType'          , l_mv_rec.person_type );
                l_mv_json.put( 'scannedFlight'       , l_mv_rec.scanned_flight );
                l_mv_json.put( 'ps1'                 , l_mv_rec.ps_1 );
                l_mv_json.put( 'ps2'                 , l_mv_rec.ps_2 );
                l_mv_json.put( 'ps3'                 , l_mv_rec.ps_3 );
                l_mv_json.put( 'ps4'                 , l_mv_rec.ps_4 );
                l_mv_json.put( 'ps5'                 , l_mv_rec.ps_5 );
                l_mv_json.put( 'ps6'                 , l_mv_rec.ps_6 );
                l_mv_json.put( 'ps7'                 , l_mv_rec.ps_7 );
                l_mv_json.put( 'ps8'                 , l_mv_rec.ps_8 );
                l_mv_json.put( 'ps9'                 , l_mv_rec.ps_9 );
                l_mv_json.put( 'ps10'                , l_mv_rec.ps_10 );
                l_mv_json.put( 'fingermatchHistory'  , l_mv_rec.fingermatch_history );
                l_mv_json.put( 'facematchHistory'    , l_mv_rec.facematc_history );
                l_mv_json.put( 'reasonOffload'       , l_mv_rec.reason_offload );
                l_mv_json.put( 'reasonDeportee'      , l_mv_rec.reason_deportee );
                l_mv_json.put( 'visaType'            , dl_common.pkg_json_export.get_visa_type( l_mv_rec.visa_type ) );
                l_mv_json.put( 'visa'                , get_visas( l_mv_rec.visa ) );
                l_mv_json.put( 'isFinishedFlag'      , l_mv_rec.is_finished );
                l_mv_json.put( 'priorMovementId'     , l_mv_rec.prior_movement );
                l_mv_json.put( 'entryForm'           , get_entry_forms( l_mv_rec.entry_form ) );
                l_mv_json.put( 'entryFormNoApproved' , l_mv_rec.form_no_approved );
                l_mv_json.put( 'movementDate'        , to_char( l_mv_rec.movement_dt, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_mv_json.put( 'sourceSystem'        , l_mv_rec.source_system );
                l_mv_json.put( 'dateOfEntry'         , to_char( l_mv_rec.date_of_entry, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_mv_json.put( 'mrzVisa'             , l_mv_rec.mrzvisa );
                l_mv_json.put( 'movementImages'      , get_movements_blob( l_mv_rec.mvmntid ) );
                l_mv_json.put( 'collectivePassports' , get_movement_fellow_passenger( l_mv_rec.mvmntid ) );

            dbms_lob.createtemporary( l_mv_clob, true );
            l_mv_json.to_clob( l_mv_clob );

            return l_mv_clob;
        end;    

function AA_get_movements(p_id in varchar2) return clob
        as
            l_mv_rec dl_bordercontrol.movements%rowtype;    -- Movement
            l_mv_json json;                                 -- Movement JSON
            l_mv_clob clob;                                 -- Movement JSON as clob for export
        begin
            begin
                select
                    mv.mvmntid,
                    mv.brddocid,
                    mv.landbarcd,
                    mv.exitflg,
                    mv.max_stay_dt,
                    mv.fingermatch,
                    mv.facematch,
                    mv.mvmntaddr,
                    mv.oridest,
                    mv.ins_at,
                    translate(mv.ins_by, chr(13), ''),
                    mv.dml_at,
                    translate(mv.dml_by, chr(13), ''),
                    mv.dml_type,
                    mv.ins_terminal,
                    mv.ins_borderpost,
                    mv.refusedflg,
                    mv.observation,
                    mv.trnsprtunitid,
                    mv.person_type,
                    mv.scanned_flight,
                    mv.ps_1,
                    mv.ps_2,
                    mv.ps_3,
                    mv.ps_4,
                    mv.ps_5,
                    mv.ps_6,
                    mv.ps_7,
                    mv.ps_8,
                    mv.ps_9,
                    mv.ps_10,
                    mv.fingermatch_history,
                    mv.facematc_history,
                    mv.reason_offload,
                    mv.reason_deportee,
                    mv.visa_type,
                    mv.visa,
                    mv.is_finished,
                    mv.prior_movement,
                    mv.entry_form,
                    mv.form_no_approved,
                    mv.movement_dt,
                    mv.source_system,
                    mv.date_of_entry,
                    mv.mrzvisa
                into
                    l_mv_rec.mvmntid,
                    l_mv_rec.brddocid,
                    l_mv_rec.landbarcd,
                    l_mv_rec.exitflg,
                    l_mv_rec.max_stay_dt,
                    l_mv_rec.fingermatch,
                    l_mv_rec.facematch,
                    l_mv_rec.mvmntaddr,
                    l_mv_rec.oridest,
                    l_mv_rec.ins_at,
                    l_mv_rec.ins_by,
                    l_mv_rec.dml_at,
                    l_mv_rec.dml_by,
                    l_mv_rec.dml_type,
                    l_mv_rec.ins_terminal,
                    l_mv_rec.ins_borderpost,
                    l_mv_rec.refusedflg,
                    l_mv_rec.observation,
                    l_mv_rec.trnsprtunitid,
                    l_mv_rec.person_type,
                    l_mv_rec.scanned_flight,
                    l_mv_rec.ps_1,
                    l_mv_rec.ps_2,
                    l_mv_rec.ps_3,
                    l_mv_rec.ps_4,
                    l_mv_rec.ps_5,
                    l_mv_rec.ps_6,
                    l_mv_rec.ps_7,
                    l_mv_rec.ps_8,
                    l_mv_rec.ps_9,
                    l_mv_rec.ps_10,
                    l_mv_rec.fingermatch_history,
                    l_mv_rec.facematc_history,
                    l_mv_rec.reason_offload,
                    l_mv_rec.reason_deportee,
                    l_mv_rec.visa_type,
                    l_mv_rec.visa,
                    l_mv_rec.is_finished,
                    l_mv_rec.prior_movement,
                    l_mv_rec.entry_form,
                    l_mv_rec.form_no_approved,
                    l_mv_rec.movement_dt,
                    l_mv_rec.source_system,
                    l_mv_rec.date_of_entry,
                    l_mv_rec.mrzvisa
                from dl_bordercontrol.movements mv
                where mv.mvmntid = p_id;

            exception
              when no_data_found then
                return l_mv_clob;
            end;

            l_mv_json := json();
                l_mv_json.put( 'id'                  , l_mv_rec.mvmntid );
                l_mv_json.put( 'borderdocuments'     , AA_get_borderdocuments( l_mv_rec.brddocid ) );
                l_mv_json.put( 'landbarCode'         , l_mv_rec.landbarcd );
                l_mv_json.put( 'exitFlag'            , l_mv_rec.exitflg );
                l_mv_json.put( 'maxStayDate'         , l_mv_rec.max_stay_dt );
                l_mv_json.put( 'fingermatch'         , l_mv_rec.fingermatch );
                l_mv_json.put( 'facematch'           , l_mv_rec.facematch );
                l_mv_json.put( 'movementAdress'      , l_mv_rec.mvmntaddr );
                l_mv_json.put( 'oriDest'             , l_mv_rec.oridest );
                l_mv_json.put( 'createdAt'           , to_char( l_mv_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_mv_json.put( 'createdBy'           , l_mv_rec.ins_by );
                l_mv_json.put( 'lastModifiedAt'      , to_char( l_mv_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_mv_json.put( 'lastModifiedBy'      , l_mv_rec.dml_by );
                l_mv_json.put( 'lastModifiedAction'  , l_mv_rec.dml_type );
                l_mv_json.put( 'terminal'            , get_terminals( l_mv_rec.ins_terminal ) );
                l_mv_json.put( 'borderpost'          , get_borderposts( l_mv_rec.ins_borderpost ) );
                l_mv_json.put( 'refusedFlag'         , l_mv_rec.refusedflg );
                l_mv_json.put( 'observation'         , l_mv_rec.observation );
                l_mv_json.put( 'transportUnitId'     , l_mv_rec.trnsprtunitid );
                l_mv_json.put( 'personType'          , l_mv_rec.person_type );
                l_mv_json.put( 'scannedFlight'       , l_mv_rec.scanned_flight );
                l_mv_json.put( 'ps1'                 , l_mv_rec.ps_1 );
                l_mv_json.put( 'ps2'                 , l_mv_rec.ps_2 );
                l_mv_json.put( 'ps3'                 , l_mv_rec.ps_3 );
                l_mv_json.put( 'ps4'                 , l_mv_rec.ps_4 );
                l_mv_json.put( 'ps5'                 , l_mv_rec.ps_5 );
                l_mv_json.put( 'ps6'                 , l_mv_rec.ps_6 );
                l_mv_json.put( 'ps7'                 , l_mv_rec.ps_7 );
                l_mv_json.put( 'ps8'                 , l_mv_rec.ps_8 );
                l_mv_json.put( 'ps9'                 , l_mv_rec.ps_9 );
                l_mv_json.put( 'ps10'                , l_mv_rec.ps_10 );
                l_mv_json.put( 'fingermatchHistory'  , l_mv_rec.fingermatch_history );
                l_mv_json.put( 'facematchHistory'    , l_mv_rec.facematc_history );
                l_mv_json.put( 'reasonOffload'       , l_mv_rec.reason_offload );
                l_mv_json.put( 'reasonDeportee'      , l_mv_rec.reason_deportee );
                l_mv_json.put( 'visaType'            , dl_common.pkg_json_export.get_visa_type( l_mv_rec.visa_type ) );
                l_mv_json.put( 'visa'                , AA_get_visas( l_mv_rec.visa ) );
                l_mv_json.put( 'isFinishedFlag'      , l_mv_rec.is_finished );
                l_mv_json.put( 'priorMovementId'     , l_mv_rec.prior_movement );
                l_mv_json.put( 'entryForm'           , AA_get_entry_forms( l_mv_rec.entry_form ) );
                l_mv_json.put( 'entryFormNoApproved' , l_mv_rec.form_no_approved );
                l_mv_json.put( 'movementDate'        , to_char( l_mv_rec.movement_dt, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_mv_json.put( 'sourceSystem'        , l_mv_rec.source_system );
                l_mv_json.put( 'dateOfEntry'         , to_char( l_mv_rec.date_of_entry, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_mv_json.put( 'mrzVisa'             , l_mv_rec.mrzvisa );
                l_mv_json.put( 'movementImages'      , get_movements_blob( l_mv_rec.mvmntid ) );
                l_mv_json.put( 'collectivePassports' , get_movement_fellow_passenger( l_mv_rec.mvmntid ) );
            
            dbms_lob.createtemporary( l_mv_clob, true );
            l_mv_json.to_clob( l_mv_clob );

            return l_mv_clob;
        end;
        
function get_residence(p_id in varchar2, nat in varchar2) return json
        as
            l_residence_rec dl_bordercontrol.residence%rowtype;   -- Province
            l_residence_json json;                                         -- Province JSON
        begin
            begin
                select
                    ap.key_value,
                    ap.document_no,
                    ap.nationality,
                    ap.expire_date,
                    ap.resident_type,
                    ap.resident_no,
                    ap.first_name_thai,
                    ap.middle_name_thai,
                    ap.last_name_thai,
                    ap.dml_at,
                    ap.dml_by,
                    ap.dml_type,
                    ap.ins_at,
                    ap.ins_by,
                    ap.resident_addr_l1,
                    ap.resident_addr_l2,
                    ap.resident_addr_l3,
                    ap.endorsement_no,
                    ap.endorsement_from,
                    ap.endorsement_until,
                    ap.endorsement_by,
                    ap.residentbook_no,
                    ap.created_at,
                    ap.created_by
                into
                    l_residence_rec.key_value,
                    l_residence_rec.document_no,
                    l_residence_rec.nationality,
                    l_residence_rec.expire_date,
                    l_residence_rec.resident_type,
                    l_residence_rec.resident_no,
                    l_residence_rec.first_name_thai,
                    l_residence_rec.middle_name_thai,
                    l_residence_rec.last_name_thai,
                    l_residence_rec.dml_at,
                    l_residence_rec.dml_by,
                    l_residence_rec.dml_type,
                    l_residence_rec.ins_at,
                    l_residence_rec.ins_by,
                    l_residence_rec.resident_addr_l1,
                    l_residence_rec.resident_addr_l2,
                    l_residence_rec.resident_addr_l3,
                    l_residence_rec.endorsement_no,
                    l_residence_rec.endorsement_from,
                    l_residence_rec.endorsement_until,
                    l_residence_rec.endorsement_by,
                    l_residence_rec.residentbook_no,
                    l_residence_rec.created_at,
                    l_residence_rec.created_by
                from dl_bordercontrol.residence ap
                where ap.document_no = p_id and ap.nationality = nat;

            exception
              when no_data_found then
                l_residence_json := json();
                l_residence_json.put( 'id'          , '' );
                l_residence_json.put( 'document_no'          , '' );
                l_residence_json.put( 'nationality'          , '' );
                l_residence_json.put( 'expire_date'          , '' );
                l_residence_json.put( 'resident_type'        , '' );
                l_residence_json.put( 'resident_no'          , '' );
                l_residence_json.put( 'first_name_thai'      , '' );
                l_residence_json.put( 'middle_name_thai'     , '' );
                l_residence_json.put( 'last_name_thai'     , '' );
                l_residence_json.put( 'dml_at'     , '' );
                l_residence_json.put( 'dml_by'     , '' );
                l_residence_json.put( 'dml_type'     , '' );
                l_residence_json.put( 'ins_at'     , '' );
                l_residence_json.put( 'ins_by'     , '' );
                l_residence_json.put( 'resident_addr_l1'     , '' );
                l_residence_json.put( 'resident_addr_l2'     , '' );
                l_residence_json.put( 'resident_addr_l3'     , '' );
                l_residence_json.put( 'endorsement_no'     , '' );
                l_residence_json.put( 'endorsement_from'     , '' );
                l_residence_json.put( 'endorsement_until'     , '' );
                l_residence_json.put( 'endorsement_by'     , '' );
                l_residence_json.put( 'residentbook_no'     , '' );
                l_residence_json.put( 'created_at'     , '' );
                l_residence_json.put( 'created_by'     , '' );
            return l_residence_json;
            end;

            l_residence_json := json();
                l_residence_json.put( 'id'          , l_residence_rec.key_value );
                l_residence_json.put( 'document_no'          , l_residence_rec.document_no );
                l_residence_json.put( 'nationality'          , l_residence_rec.nationality );
                l_residence_json.put( 'expire_date'          , l_residence_rec.expire_date );
                l_residence_json.put( 'resident_type'        , l_residence_rec.resident_type );
                l_residence_json.put( 'resident_no'          , l_residence_rec.resident_no );
                l_residence_json.put( 'first_name_thai'      , l_residence_rec.first_name_thai );
                l_residence_json.put( 'middle_name_thai'     , l_residence_rec.middle_name_thai );
                l_residence_json.put( 'last_name_thai'     , l_residence_rec.last_name_thai );
                l_residence_json.put( 'dml_at'     , to_char(l_residence_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_residence_json.put( 'dml_by'     , l_residence_rec.dml_by );
                l_residence_json.put( 'dml_type'     , l_residence_rec.dml_type );
                l_residence_json.put( 'ins_at'     , to_char(l_residence_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_residence_json.put( 'ins_by'     , l_residence_rec.ins_by );
                l_residence_json.put( 'resident_addr_l1'     , l_residence_rec.resident_addr_l1 );
                l_residence_json.put( 'resident_addr_l2'     , l_residence_rec.resident_addr_l2 );
                l_residence_json.put( 'resident_addr_l3'     , l_residence_rec.resident_addr_l3 );
                l_residence_json.put( 'endorsement_no'     , l_residence_rec.endorsement_no );
                l_residence_json.put( 'endorsement_from'     , l_residence_rec.endorsement_from );
                l_residence_json.put( 'endorsement_until'     , l_residence_rec.endorsement_until );
                l_residence_json.put( 'endorsement_by'     , l_residence_rec.endorsement_by );
                l_residence_json.put( 'residentbook_no'     , l_residence_rec.residentbook_no );
                l_residence_json.put( 'created_at'     , to_char(l_residence_rec.created_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_residence_json.put( 'created_by'     , l_residence_rec.created_by );
            return l_residence_json;
        end;

end pkg_json_export;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_JSON_EXPORT" TO "DL_INTERFACE";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_JSON_EXPORT" TO "DERMALOG_PROXY";
