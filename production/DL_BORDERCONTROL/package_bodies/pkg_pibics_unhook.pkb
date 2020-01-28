CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_PIBICS_UNHOOK" AS
/*******************************************************************************
 * This package provides dequeue functions
 *
 * Author    Date        Description
 * --------  ----------  -------------------------------------------------------*
 * MSCS      07.10.2019  Initial release
 *******************************************************************************/

    /*
    * Global declarations
    */
    c_scope_prefix        CONSTANT VARCHAR2(31) := lower($$plsql_unit) || '.';
    --
    c_pibics_date_format_timestamp      CONSTANT VARCHAR2(32 CHAR) := 'YYYY-MM-DD"T"HH24:MI:SS';
    c_pibics_date_format_unformat       CONSTANT VARCHAR2(32 CHAR) := 'YYYYMMDDHH24MISS';
    c_pibics_date_format_unformat_short CONSTANT VARCHAR2(32 CHAR) := 'YYYYMMDD';
    c_pibics_date_format_slashs         CONSTANT VARCHAR2(32 CHAR) := 'DD/MM/YYYY';
    c_pibics_username                   CONSTANT VARCHAR2(50 CHAR) := 'chiraphat.n';
    c_pibics_systemcode                 CONSTANT VARCHAR2(50 CHAR) := 'BIO';
    c_database_timezone                 CONSTANT VARCHAR2(25 CHAR) := CASE
                                                                      WHEN ASCII(SUBSTR(TZ_OFFSET(sessiontimezone), LENGTH(TZ_OFFSET(sessiontimezone)))) = 0
                                                                      THEN
                                                                        SUBSTR(TZ_OFFSET(sessiontimezone), 1, LENGTH(TZ_OFFSET(sessiontimezone)) - 1)
                                                                      ELSE
                                                                        TZ_OFFSET(sessiontimezone)
                                                                      END;
    --
    --
    /**
    * Function to convert blob images to clob base 64
    * @param p_blob blob image in
    * @return l_base64 base64 as pljson_value
    */
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
    
    /*
    * get_pibics_inout_from_movement
    */
    FUNCTION get_pibics_inout_from_movement
    (
        p_mvmntid       IN DL_BORDERCONTROL.MOVEMENTS.MVMNTID%TYPE
        ,p_dml_type     IN VARCHAR2 DEFAULT 'I'
    )
    RETURN CLOB IS
        -- logger
        l_scope                             logger_logs.scope%type := c_scope_prefix || 'get_pibics_inout_from_movement';
        l_params                            logger.tab_param;
        -- o/p
        l_result                            CLOB;
        -- records
        l_movement_rec                      DL_BORDERCONTROL.MOVEMENTS%ROWTYPE;
        l_borderdocument_rec                DL_BORDERCONTROL.BORDERDOCUMENTS%ROWTYPE;
        -- vars
        l_terminal_ipaddress                DL_BORDERCONTROL.TERMINALS.IPADDRESS%TYPE;
        --
        l_entry_form_no                     DL_BORDERCONTROL.ENTRY_FORMS.FORM_NO%TYPE;
        l_entry_form_note                   DL_BORDERCONTROL.ENTRY_FORMS.NOTE%TYPE;
        l_entry_form_province               DL_BORDERCONTROL.ENTRY_FORMS.PROVINCE%TYPE;
        --
        l_visa_expiry_date                  DL_BORDERCONTROL.VISAS.EXPIRY_DATE%TYPE;
        l_permit_type                       DL_BORDERCONTROL.VISAS.PERMIT_TYPE%TYPE;
        l_permit_expiry_date                DL_BORDERCONTROL.VISAS.PERMIT_EXPIRY_DATE%TYPE;
        --
        l_borderdocimage                    DL_BORDERCONTROL.BORDERDOCIMAGES.IMAGE%TYPE;
        l_borderdocimage_exists             VARCHAR2(1) := 'N';
        --
        l_live_photo_size                   NUMBER := 0;
        l_live_photo                        DL_BORDERCONTROL.MOVEMENTS_BLOB.LIVE_PHOTO%TYPE;
        --
        l_flagoverstay                      DL_BORDERCONTROL.MSCS_MOVEMENTS_OVERSTAY.FLAGOVERSTAY%TYPE := 'N';
        l_findoverstayamount                DL_BORDERCONTROL.MSCS_MOVEMENTS_OVERSTAY.FINDOVERSTAYAMOUNT%TYPE := 0;
        --
        l_resident_exists                   VARCHAR2(1) := 'N';
        l_res_rescerttype_seqno             DL_BORDERCONTROL.V_CRS_PERSON.RESCERTTYPE_SEQNO%TYPE;
        l_res_rcno_pvcd                     DL_BORDERCONTROL.V_CRS_PERSON.RCNO_PVCD%TYPE;
        l_res_rcno_runningno                DL_BORDERCONTROL.V_CRS_PERSON.RCNO_RUNNINGNO%TYPE;
        l_res_rcno_year                     DL_BORDERCONTROL.V_CRS_PERSON.RCNO_YEAR%TYPE;
        l_res_tfamilynm                     DL_BORDERCONTROL.V_CRS_PERSON.TFAMILYNM%TYPE;
        l_res_tfirstnm                      DL_BORDERCONTROL.V_CRS_PERSON.TFIRSTNM%TYPE;
        l_res_tmiddlenm                     DL_BORDERCONTROL.V_CRS_PERSON.TMIDDLENM%TYPE;
        --
        l_thaipassport_exists               VARCHAR2(1) := 'N';
        l_thaipassport_citizenid            DL_BORDERCONTROL.V_THAIPASSPORT.CITIZENID%TYPE;
        l_thaipassport_tfamilynm            DL_BORDERCONTROL.V_THAIPASSPORT.TFAMILYNM%TYPE;
        l_thaipassport_tfirstnm             DL_BORDERCONTROL.V_THAIPASSPORT.TFIRSTNM%TYPE;
        l_thaipassport_tmiddlenm            DL_BORDERCONTROL.V_THAIPASSPORT.TMIDDLENM%TYPE;
        -- fellow passengers
        l_fp_count                          NUMBER := 0;
        -- jsons
        l_pibics_header_json                JSON;
        l_pibics_record_json                JSON;
        l_pibics_mrz_json                   JSON;
        l_pibics_travel_info_json           JSON;
        l_pibics_travel_conveyance_json     JSON;
        l_pibics_travel_img_person_json     JSON;
        l_pibics_travel_img_pass_json       JSON;
        l_pibics_overstay_json              JSON;
        l_pibics_permit_info                JSON;
        l_pibics_resident_info              JSON;
        l_pibics_collective_passports       JSON_LIST;
        l_pibics_collective_passport        JSON;
        l_pibics_collective_passport_img    JSON;
        l_pibics_json                       JSON;
        --
        l_common_human_sexes                JSON_OBJECT_T;
        --
    BEGIN
        
        logger.append_param(l_params, 'p_mvmntid', p_mvmntid);
        logger.append_param(l_params, 'p_dml_type', p_dml_type);
        logger.log('GET PIBICS INOUT FORMAT FROM MOVEMENT: start', l_scope, null, l_params);
        
        -----------------------------
        -- movement record start --
        -----------------------------
        SELECT *
        INTO l_movement_rec
        FROM dl_bordercontrol.movements
        WHERE mvmntid = p_mvmntid;
        
        -- movement record updates here
        l_movement_rec.ins_by := SUBSTR(NVL(l_movement_rec.ins_by, l_movement_rec.dml_by), 0, INSTR(NVL(l_movement_rec.ins_by, l_movement_rec.dml_by) ,' @', 1));
        l_movement_rec.dml_by := TRANSLATE(l_movement_rec.dml_by, CHR(13), '');
        -----------------------------
        -- movement record end --
        -----------------------------
        
        
        -----------------------------
        -- related variables/record start --
        -----------------------------
        -- terminal ipaddress
        BEGIN
            SELECT ipaddress
            INTO l_terminal_ipaddress
            FROM dl_bordercontrol.terminals
            WHERE id = l_movement_rec.ins_terminal;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                l_terminal_ipaddress := NULL;
        END;
        --
        
        -- borderdocument record
        BEGIN
            SELECT *
            INTO l_borderdocument_rec
            FROM dl_bordercontrol.borderdocuments
            WHERE brddocid = l_movement_rec.brddocid;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                NULL;
        END;
        --
        
        -- entry from variables
        BEGIN
            SELECT form_no, note, province
            INTO l_entry_form_no, l_entry_form_note, l_entry_form_province
            FROM dl_bordercontrol.entry_forms
            WHERE key_value = l_movement_rec.entry_form;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                l_entry_form_no := NULL;
                l_entry_form_note := NULL;
                l_entry_form_province := NULL;
        END;
        --
        
        -- visa info
        BEGIN
            SELECT expiry_date, permit_type, permit_expiry_date
            INTO l_visa_expiry_date, l_permit_type, l_permit_expiry_date
            FROM dl_bordercontrol.visas
            WHERE key_value = l_movement_rec.visa;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                l_permit_type := NULL;
                l_permit_expiry_date := NULL;
        END;
        --
        
        -- borderdocimages
        BEGIN
            SELECT 'Y', image
            INTO l_borderdocimage_exists, l_borderdocimage
            FROM dl_bordercontrol.borderdocimages
            WHERE brddocid = l_movement_rec.brddocid
            AND seqno = 2;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                l_borderdocimage_exists := 'N';
                l_borderdocimage := NULL;
        END;
        --
        
        -- movements_blob
        BEGIN
            SELECT dbms_lob.getlength(live_photo), live_photo
            INTO l_live_photo_size, l_live_photo
            FROM dl_bordercontrol.movements_blob
            WHERE mvmnt_id = l_movement_rec.mvmntid;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                l_live_photo_size := 0;
                l_live_photo := NULL;
        END;
        --
        
        -----------------------------
        -- related variables end --
        -----------------------------
        
        
        -----------------------
        -- headerInfo start --
        -----------------------
        l_pibics_header_json := JSON();
        l_pibics_header_json.put('refNo'      , TO_CHAR(SYSDATE, 'YYYYMMDD'));
        l_pibics_header_json.put('dateTime'   , TO_CHAR(SYSDATE, c_pibics_date_format_timestamp) || c_database_timezone);
        --
        l_pibics_header_json.put('userID'     , CASE LOWER(TRIM(l_movement_rec.ins_by))
                                                    WHEN 'jaturong.su'      THEN 'Jaturong.su'
                                                    WHEN 'akkharadet.su'    THEN 'Akkharadet.su'
                                                    ELSE NVL(LOWER(TRIM(l_movement_rec.ins_by)), c_pibics_username)
                                                END
                                );
        
        l_pibics_header_json.put('systemCode' , c_pibics_systemcode);
        l_pibics_header_json.put('module'     , 'INOUT');
        l_pibics_header_json.put('ipClient'   , l_terminal_ipaddress);
        -----------------------
        -- headerInfo end --
        -----------------------
        
        
        -----------------------
        -- record start --
        -----------------------
        l_pibics_record_json := JSON();
        l_pibics_record_json.put('bioPk'      , l_movement_rec.mvmntid);
        l_pibics_record_json.put('deptSeqNo'  , NVL(dl_staging4pibics_intf.pkg_transcode_reverse.get_borderpost_seqno(l_movement_rec.ins_borderpost), 194));
        l_pibics_record_json.put('typeData'   , 'BIO');
        
        IF p_dml_type = 'I' THEN
            l_pibics_record_json.put('createDate' , TO_CHAR(l_movement_rec.ins_at, c_pibics_date_format_unformat));
        ELSIF p_dml_type = 'U' THEN
            l_pibics_record_json.put('updateDate', TO_CHAR(l_movement_rec.dml_at, c_pibics_date_format_unformat));
            l_pibics_record_json.put('pibicsPk'  , DL_INTERFACE.PKG_OBJECT_HANDLING.AA_GET_PIBICS_PK(l_movement_rec.mvmntid));
        END IF;
        -----------------------
        -- record end --
        -----------------------
        
        
        -----------------------
        -- mrz start --
        -----------------------
        l_pibics_mrz_json := JSON();
        --l_pibics_mrz_json.put('docType'       , '1');
        l_pibics_mrz_json.put('docType'       , NVL(l_borderdocument_rec.docclass,'1'));
        l_pibics_mrz_json.put('docNumber'     , l_borderdocument_rec.docno);
        l_pibics_mrz_json.put('docExpireDate' , TO_CHAR(l_borderdocument_rec.expirydate, c_pibics_date_format_unformat_short));
        --
        l_pibics_mrz_json.put('nationality'   , CASE l_borderdocument_rec.nat
                                                    WHEN 'D' THEN 'DEU'
                                                    ELSE l_borderdocument_rec.nat
                                                END
                             );
        --
        l_pibics_mrz_json.put('familyName'    , l_borderdocument_rec.surname);
        l_pibics_mrz_json.put('givenName'     , l_borderdocument_rec.givenname);
        l_pibics_mrz_json.put('middleName'    , l_borderdocument_rec.middlename);
        l_pibics_mrz_json.put('birthDate'     , l_borderdocument_rec.dob_partial.getFormatData('DD/MM/YYYY'));
        --
        l_pibics_mrz_json.put('gender'        , CASE l_borderdocument_rec.sex 
                                                    WHEN 1 THEN 'M' 
                                                    WHEN 2 THEN 'F' 
                                                    ELSE 'X' 
                                                END
                             );
        --
        l_pibics_mrz_json.put('issuingCountry'   ,  CASE l_borderdocument_rec.issuectry
                                                        WHEN 'D' THEN 'DEU'
                                                        ELSE l_borderdocument_rec.issuectry
                                                    END
                             );
        --
        -----------------------
        -- mrz end --
        -----------------------
        
        
        -----------------------
        -- travel event info start --
        -----------------------
        l_pibics_travel_info_json := JSON();
        l_pibics_travel_info_json.put('inOutDate'     , TO_CHAR(NVL(l_movement_rec.date_of_entry, l_movement_rec.movement_dt), c_pibics_date_format_unformat));
        l_pibics_travel_info_json.put('tm6Number'     , l_entry_form_no);
        l_pibics_travel_info_json.put('cardType'      , CASE WHEN l_movement_rec.exitflg = 0 THEN 1 ELSE 2 END);--since pibics does not like 0 we give it what it want (1) p_movement_json.movement.exitflg);
        l_pibics_travel_info_json.put('visaTypeSeqNo' , NVL(dl_staging4pibics_intf.pkg_transcode_reverse.get_visatype_seqno(l_movement_rec.visa_type), 2));
        l_pibics_travel_info_json.put('visaExpDate'   , TO_CHAR(l_visa_expiry_date, c_pibics_date_format_unformat_short));
        l_pibics_travel_info_json.put('passengerType' , l_movement_rec.person_type);
        l_pibics_travel_info_json.put('remark'        , l_entry_form_note);
        l_pibics_travel_info_json.put('initType'      , l_borderdocimage_exists);
        
          l_pibics_travel_conveyance_json := JSON();
          --l_pibics_travel_conveyance_json.put('convSeqNo', NVL(dl_staging4pibics_intf.pkg_transcode_reverse.get_conveyance_seqno(l_movement_rec.trnsprtunitid), 2));
          l_pibics_travel_conveyance_json.put('convSeqNo', NVL(dl_staging4pibics_intf.pkg_transcode_reverse_manual.get_conveyance_seqno_with_seqno(l_movement_rec.trnsprtunitid), 2));
          l_pibics_travel_conveyance_json.put('convName1', NVL(SUBSTR(l_movement_rec.scanned_flight, 1, 2),'--'));
          l_pibics_travel_conveyance_json.put('convName2', NVL(SUBSTR(l_movement_rec.scanned_flight, 3),'0000'));
          l_pibics_travel_conveyance_json.put('convProvSeqNo', NVL(dl_staging4pibics_intf.pkg_transcode_reverse.get_province_seqno(l_entry_form_province),1));
        
        l_pibics_travel_info_json.put('conveyanceInfo', l_pibics_travel_conveyance_json);
        
        IF p_dml_type = 'I' THEN
            -----------------------
            -- live image start --
            -----------------------
            l_live_photo_size := NVL(l_live_photo_size, 0);
            
            l_pibics_travel_img_person_json := JSON();
            l_pibics_travel_img_person_json.put('fileNameImgPerson' , CASE WHEN l_live_photo_size > 0 THEN l_movement_rec.mvmntid || '_livePhoto.png' ELSE NULL END);
            l_pibics_travel_img_person_json.put('binaryImgPerson'   , CASE WHEN l_live_photo_size > 0 THEN convert_image(l_live_photo) ELSE NULL END);
            l_pibics_travel_img_person_json.put('fileSizeImgPerson' , l_live_photo_size);
            
            l_pibics_travel_info_json.put('imgPerson'     , l_pibics_travel_img_person_json);
            -----------------------
            -- live image end --
            -----------------------
            
            -----------------------
            -- doc image start --
            -----------------------
            l_pibics_travel_img_pass_json := JSON();
            
            IF l_borderdocimage_exists = 'Y' THEN
                l_pibics_travel_img_pass_json.put('fileNameImgPassport' , l_movement_rec.mvmntid || '_passPhoto.png');
                l_pibics_travel_img_pass_json.put('binaryImgPassport'   , convert_image(l_borderdocimage));
                l_pibics_travel_img_pass_json.put('fileSizeImgPassport' , dbms_lob.getlength(l_borderdocimage));
            END IF;
            
            l_pibics_travel_info_json.put('imgPass'       , l_pibics_travel_img_pass_json);
            -----------------------
            -- doc image end --
            -----------------------
        END IF;
        -----------------------
        -- travel event info end --
        -----------------------
        
        
        
        -----------------------
        -- 'I' Others start --
        -----------------------
        IF p_dml_type = 'I' THEN
        
            -----------------------
            -- overstay start --
            -----------------------
            l_pibics_overstay_json := JSON();
            
            BEGIN
                SELECT 'Y', findoverstayamount
                into l_flagoverstay, l_findoverstayamount
                FROM dl_bordercontrol.mscs_movements_overstay
                WHERE mvmntid = l_movement_rec.mvmntid;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    l_flagoverstay := 'N';
                    l_findoverstayamount := 0;
            END;
            
            IF l_flagoverstay = 'Y' THEN
                l_pibics_overstay_json.put('flagOverStay'       , 'Y'); 
                l_pibics_overstay_json.put('findOverStayAmount' , l_findoverstayamount); -- no equivalent
            ELSE
                l_pibics_overstay_json.put('flagOverStay'       , 'N'); -- no equivalent
                l_pibics_overstay_json.put('findOverStayAmount' , '0'); -- no equivalent
            END IF;
            -----------------------
            -- overstay end --
            -----------------------
            
            
            -----------------------
            -- permit info start --
            -----------------------
            l_pibics_permit_info := JSON();
            IF l_permit_type IS NOT NULL THEN
                l_pibics_permit_info.put('permitTypeSeqNo', LPAD(l_permit_type, 4, '0'));
                l_pibics_permit_info.put('permitSeqNo'    , l_permit_type);
                l_pibics_permit_info.put('permitDate'     , TO_CHAR(NVL(l_permit_expiry_date, SYSDATE), c_pibics_date_format_unformat_short));
            END IF;
            -----------------------
            -- permit info end --
            -----------------------
            
            
            -----------------------
            -- resident info start --
            -----------------------
            l_pibics_resident_info := JSON();
            
            BEGIN
                SELECT 
                    'Y'
                    , rescerttype_seqno, rcno_pvcd, rcno_runningno, rcno_year
                    , tfamilynm, tfirstnm, tmiddlenm
                INTO 
                    l_resident_exists
                    , l_res_rescerttype_seqno, l_res_rcno_pvcd, l_res_rcno_runningno, l_res_rcno_year
                    , l_res_tfamilynm, l_res_tfirstnm, l_res_tmiddlenm from (
                SELECT 
                    'Y'
                    , rescerttype_seqno, rcno_pvcd, rcno_runningno, rcno_year
                    , tfamilynm, tfirstnm, tmiddlenm
                FROM dl_bordercontrol.v_crs_person
                WHERE crs_sts = 'A'
                AND birth_date = TO_CHAR(l_borderdocument_rec.calc_dob, c_pibics_date_format_slashs)
                AND nation_seqno = dl_staging4pibics_intf.pkg_transcode_reverse.get_country_seqno(l_borderdocument_rec.nat) 
                AND efamilynm = l_borderdocument_rec.surname
                AND efirstnm =  l_borderdocument_rec.givenname
                AND emiddlenm = l_borderdocument_rec.middlename
                order by CRSPERSON_SEQNO desc) zz
                where ROWNUM = 1;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    l_resident_exists := 'N';
            END;
            
            IF l_resident_exists = 'Y' THEN
                l_pibics_resident_info.put('citizenIDorResidentID', l_res_rescerttype_seqno || l_res_rcno_pvcd || l_res_rcno_runningno || '/' || l_res_rcno_year);
                l_pibics_resident_info.put('thaiFamilyName'       , l_res_tfamilynm);
                l_pibics_resident_info.put('thaiGivenName'        , l_res_tfirstnm);
                l_pibics_resident_info.put('thaiMiddleName'       , l_res_tmiddlenm);
            END IF;
            -----------------------
            -- resident info end --
            -----------------------
            
            -----------------------
            -- thaipassport start --
            -----------------------
            -- if resident info is not available
            IF l_pibics_resident_info.count() = 0 and l_borderdocument_rec.nat = 'THA' THEN
                BEGIN
                    SELECT
                        'Y'
                        , citizenid, tfamilynm, tfirstnm, tmiddlenm
                    INTO 
                        l_thaipassport_exists
                        , l_thaipassport_citizenid, l_thaipassport_tfamilynm, l_thaipassport_tfirstnm, l_thaipassport_tmiddlenm
                    FROM dl_bordercontrol.v_thaipassport
                    WHERE passportno = l_borderdocument_rec.docno
                    AND passportexpdte = l_borderdocument_rec.expirydate;
                EXCEPTION
                    WHEN OTHERS THEN
                        l_thaipassport_exists := 'N';
                END;
                
                IF l_thaipassport_exists = 'Y' THEN
                    l_pibics_resident_info.put('citizenIDorResidentID', l_thaipassport_citizenid);
                    l_pibics_resident_info.put('thaiFamilyName'       , l_thaipassport_tfamilynm);
                    l_pibics_resident_info.put('thaiGivenName'        , l_thaipassport_tfirstnm);
                    l_pibics_resident_info.put('thaiMiddleName'       , l_thaipassport_tmiddlenm);
                END IF;
            END IF;
            -----------------------
            -- thaipassport end --
            -----------------------
            
            -----------------------
            -- collective start --
            -----------------------
            l_pibics_collective_passports := JSON_LIST();
            
            SELECT COUNT(1)
            INTO l_fp_count
            FROM dl_bordercontrol.fellow_passenger
            WHERE mvmntid = l_movement_rec.mvmntid;
            
            IF l_fp_count > 0 THEN
                
                FOR fp IN 
                (
                    SELECT *
                    FROM dl_bordercontrol.fellow_passenger
                    WHERE mvmntid = l_movement_rec.mvmntid
                )
                LOOP
                    l_pibics_collective_passport_img := JSON();
                    l_pibics_collective_passport_img.put('fileNameImgJoinPerson' , fp.key_value || '_img.png');
                    l_pibics_collective_passport_img.put('binaryImgJoinPerson'   , convert_image(fp.image));
                    l_pibics_collective_passport_img.put('fileSizeImgJoinPerson' , dbms_lob.getlength(fp.image));
                    
                    IF fp.sex IS NOT NULL THEN
                        l_common_human_sexes := JSON_OBJECT_T.parse(dl_common.pkg_json_export.get_human_sex(fp.sex));
                    ELSE
                        l_common_human_sexes := JSON_OBJECT_T();
                    END IF;
                    
                    l_pibics_collective_passport := JSON();
                    l_pibics_collective_passport.put('joinTM6'        , fp.tm6_no);
                    l_pibics_collective_passport.put('joinFamilyName' , fp.last_name);
                    l_pibics_collective_passport.put('joinMiddleName' , fp.middle_name);
                    l_pibics_collective_passport.put('joinGivenName'  , fp.first_name);
                    l_pibics_collective_passport.put('joinNationality', fp.nationality);
                    l_pibics_collective_passport.put('joinGender'     , NVL(l_common_human_sexes.get_string('icao'), 'X'));
                    l_pibics_collective_passport.put('joinBirthDate'  , TO_CHAR(fp.date_of_birth, c_pibics_date_format_slashs));
                    l_pibics_collective_passport.put('relationSeqNo'  , dl_staging4pibics_intf.pkg_transcode_reverse.get_relation_seqno(fp.relation));
                    l_pibics_collective_passport.put('imgJoinPerson'  , l_pibics_collective_passport_img);
                    
                    l_pibics_collective_passports.append(l_pibics_collective_passport.to_json_value);
                END LOOP;
                
            END IF;
            
            -----------------------
            -- collective end --
            -----------------------
            
        END IF;
        -----------------------
        -- 'I' Others end --
        -----------------------
        

        
        -----------------------
        -- result json start --
        -----------------------
        l_pibics_json := JSON();
        l_pibics_json.put('headerInfo'     , l_pibics_header_json);
        l_pibics_json.put('recordInfo'     , l_pibics_record_json);
        l_pibics_json.put('mrzData'        , l_pibics_mrz_json);
        l_pibics_json.put('travelEventInfo', l_pibics_travel_info_json);
        
        IF p_dml_type = 'I' THEN
            IF l_permit_type IS NOT NULL THEN
                l_pibics_json.put('chkPermitInfo'   , l_pibics_permit_info);
            END IF;
            --
            l_pibics_json.put('overStayInfo'        , l_pibics_overstay_json);
            --
            IF l_pibics_resident_info.count() > 0 THEN
                l_pibics_json.put('mfaResidentInfo' , l_pibics_resident_info);
            END IF;
            --
            IF l_pibics_collective_passports.count() > 0 THEN
                l_pibics_json.put('joinPassport'    , l_pibics_collective_passports);
            END IF;
        END IF;
        -----------------------
        -- result json end --
        -----------------------
        
        dbms_lob.createtemporary( l_result, true );
        l_pibics_json.to_clob( l_result, false );
    
        logger.append_param(l_params, 'dbms_lob.substr(l_result, 3000, 1)', dbms_lob.substr(l_result, 3000, 1));
        logger.log('GET PIBICS INOUT FORMAT FROM MOVEMENT: done', l_scope, null, l_params);
    
        RETURN l_result;
        
    END get_pibics_inout_from_movement;

    FUNCTION get_pibics_crew_inout_from_movement
    (
        p_mvmntid       IN DL_BORDERCONTROL.MOVEMENTS.MVMNTID%TYPE
        ,p_dml_type     IN VARCHAR2 DEFAULT 'I'
    )
    RETURN CLOB IS
        -- logger
        l_scope                             logger_logs.scope%type := c_scope_prefix || 'get_pibics_crew_inout_from_movement';
        l_params                            logger.tab_param;
        -- o/p
        l_result                            CLOB;
        -- records
        l_movement_rec                      DL_BORDERCONTROL.MOVEMENTS%ROWTYPE;
        l_borderdocument_rec                DL_BORDERCONTROL.BORDERDOCUMENTS%ROWTYPE;
        -- vars
        l_terminal_ipaddress                DL_BORDERCONTROL.TERMINALS.IPADDRESS%TYPE;
        --
        l_entry_form_no                     DL_BORDERCONTROL.ENTRY_FORMS.FORM_NO%TYPE;
        l_entry_form_note                   DL_BORDERCONTROL.ENTRY_FORMS.NOTE%TYPE;
        l_entry_form_province               DL_BORDERCONTROL.ENTRY_FORMS.PROVINCE%TYPE;
        --
        l_visa_expiry_date                  DL_BORDERCONTROL.VISAS.EXPIRY_DATE%TYPE;
        l_permit_type                       DL_BORDERCONTROL.VISAS.PERMIT_TYPE%TYPE;
        l_permit_expiry_date                DL_BORDERCONTROL.VISAS.PERMIT_EXPIRY_DATE%TYPE;
        --
        l_borderdocimage                    DL_BORDERCONTROL.BORDERDOCIMAGES.IMAGE%TYPE;
        l_borderdocimage_exists             VARCHAR2(1) := 'N';
        --
        l_live_photo_size                   NUMBER := 0;
        l_live_photo                        DL_BORDERCONTROL.MOVEMENTS_BLOB.LIVE_PHOTO%TYPE;
        --
        l_thaipassport_exists               VARCHAR2(1) := 'N';
        l_thaipassport_citizenid            DL_BORDERCONTROL.V_THAIPASSPORT.CITIZENID%TYPE;
        l_thaipassport_tfamilynm            DL_BORDERCONTROL.V_THAIPASSPORT.TFAMILYNM%TYPE;
        l_thaipassport_tfirstnm             DL_BORDERCONTROL.V_THAIPASSPORT.TFIRSTNM%TYPE;
        l_thaipassport_tmiddlenm            DL_BORDERCONTROL.V_THAIPASSPORT.TMIDDLENM%TYPE;
        -- fellow passengers
        l_fp_count                          NUMBER := 0;
        -- jsons
        l_pibics_header_json                JSON;
        l_pibics_record_json                JSON;
        l_pibics_document_json                JSON;
        l_pibics_person_json                JSON;
        l_pibics_travel_info_json           JSON;
        l_pibics_travel_conveyance_json     JSON;
        l_pibics_travel_img_person_json     JSON;
        l_pibics_travel_img_pass_json       JSON;
        l_pibics_visa_json                  JSON;
        l_pibics_tm5_json                   JSON;
        l_pibics_json                       JSON;
        --
        l_common_human_sexes                JSON_OBJECT_T;
        --
        l_guard_seq number;
        l_tm2_seq number;
        l_tm5_rec dl_bordercontrol.mscs_tm5%rowtype;
        l_convregNo varchar2(50);
        --
    BEGIN
        
        logger.append_param(l_params, 'p_mvmntid', p_mvmntid);
        logger.append_param(l_params, 'p_dml_type', p_dml_type);
        logger.log('GET PIBICS CREW INOUT FORMAT FROM MOVEMENT: start', l_scope, null, l_params);
        
        -----------------------------
        -- movement record start --
        -----------------------------
        SELECT *
        INTO l_movement_rec
        FROM dl_bordercontrol.movements
        WHERE mvmntid = p_mvmntid;
        
        -- movement record updates here
        l_movement_rec.ins_by := SUBSTR(NVL(l_movement_rec.ins_by, l_movement_rec.dml_by), 0, INSTR(NVL(l_movement_rec.ins_by, l_movement_rec.dml_by) ,' @', 1));
        l_movement_rec.dml_by := TRANSLATE(l_movement_rec.dml_by, CHR(13), '');
        -----------------------------
        -- movement record end --
        -----------------------------
        
        
        -----------------------------
        -- related variables/record start --
        -----------------------------
        -- terminal ipaddress
        BEGIN
            SELECT ipaddress
            INTO l_terminal_ipaddress
            FROM dl_bordercontrol.terminals
            WHERE id = l_movement_rec.ins_terminal;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                l_terminal_ipaddress := NULL;
        END;
        --
        
        -- borderdocument record
        BEGIN
            SELECT *
            INTO l_borderdocument_rec
            FROM dl_bordercontrol.borderdocuments
            WHERE brddocid = l_movement_rec.brddocid;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                NULL;
        END;
        --
        
        -- entry from variables
        BEGIN
            SELECT form_no, note, province
            INTO l_entry_form_no, l_entry_form_note, l_entry_form_province
            FROM dl_bordercontrol.entry_forms
            WHERE key_value = l_movement_rec.entry_form;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                l_entry_form_no := NULL;
                l_entry_form_note := NULL;
                l_entry_form_province := NULL;
        END;
        --
        
        -- visa info
        BEGIN
            SELECT expiry_date, permit_type, permit_expiry_date
            INTO l_visa_expiry_date, l_permit_type, l_permit_expiry_date
            FROM dl_bordercontrol.visas
            WHERE key_value = l_movement_rec.visa;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                l_permit_type := NULL;
                l_permit_expiry_date := NULL;
        END;
        --
        
        -- borderdocimages
        BEGIN
            SELECT 'P', image
            INTO l_borderdocimage_exists, l_borderdocimage
            FROM dl_bordercontrol.borderdocimages
            WHERE brddocid = l_movement_rec.brddocid
            AND seqno = 2;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                l_borderdocimage_exists := 'N';
                l_borderdocimage := NULL;
        END;
        --
        
        -- movements_blob
        BEGIN
            SELECT dbms_lob.getlength(live_photo), live_photo
            INTO l_live_photo_size, l_live_photo
            FROM dl_bordercontrol.movements_blob
            WHERE mvmnt_id = l_movement_rec.mvmntid;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                l_live_photo_size := 0;
                l_live_photo := NULL;
        END;
        --
        
        BEGIN
        SELECT 'Y', citizenid, tfamilynm, tfirstnm, tmiddlenm
        INTO 
        l_thaipassport_exists
        , l_thaipassport_citizenid, l_thaipassport_tfamilynm, l_thaipassport_tfirstnm, l_thaipassport_tmiddlenm
        FROM dl_bordercontrol.v_thaipassport
        WHERE passportno = l_borderdocument_rec.docno
        AND passportexpdte = l_borderdocument_rec.expirydate;
        EXCEPTION
        WHEN OTHERS THEN
                        l_thaipassport_exists := 'N';
        END;
        
        -----------------------------
        -- related variables end --
        -----------------------------
        
        
        -----------------------
        -- headerInfo start --
        -----------------------
        l_pibics_header_json := JSON();
        l_pibics_header_json.put('refNo'      , TO_CHAR(SYSDATE, 'YYYYMMDD'));
        l_pibics_header_json.put('dateTime'   , TO_CHAR(SYSDATE, c_pibics_date_format_timestamp) || c_database_timezone);
        --
        l_pibics_header_json.put('userID'     , CASE LOWER(TRIM(l_movement_rec.ins_by))
                                                    WHEN 'jaturong.su'      THEN 'Jaturong.su'
                                                    WHEN 'akkharadet.su'    THEN 'Akkharadet.su'
                                                    ELSE NVL(LOWER(TRIM(l_movement_rec.ins_by)), c_pibics_username)
                                                END
                                );
        
        l_pibics_header_json.put('systemCode' , c_pibics_systemcode);
        l_pibics_header_json.put('module'     , 'CRW');
        l_pibics_header_json.put('ipClient'   , l_terminal_ipaddress);
        -----------------------
        -- headerInfo end --
        -----------------------
        
        
        -----------------------
        -- record start --
        -----------------------
        l_pibics_record_json := JSON();
        l_pibics_record_json.put('bioPk'      , l_movement_rec.mvmntid);
        l_pibics_record_json.put('deptSeqNo'  , NVL(dl_staging4pibics_intf.pkg_transcode_reverse.get_borderpost_seqno(l_movement_rec.ins_borderpost), 194));
        
        l_pibics_record_json.put('saveUser'    , nvl(LOWER(trim(l_movement_rec.ins_by)),c_pibics_username));
        l_pibics_record_json.put('saveDate'    , TO_CHAR(l_movement_rec.ins_at, c_pibics_date_format_unformat));
        l_pibics_record_json.put('saveIpClient', l_terminal_ipaddress);
        
        IF p_dml_type = 'U' THEN
        l_pibics_record_json.put('pibicsPk'  , DL_INTERFACE.PKG_OBJECT_HANDLING.AA_GET_PIBICS_PK(l_movement_rec.mvmntid));
        END IF;
        
        -----------------------
        -- record end --
        -----------------------
        
        -----------------------
        -- travel event info start --
        -----------------------
        l_pibics_travel_info_json := JSON();
        l_pibics_travel_info_json.put('inDate'          , TO_CHAR(NVL(l_movement_rec.date_of_entry, l_movement_rec.movement_dt), c_pibics_date_format_unformat));
        l_pibics_travel_info_json.put('cardType'      , CASE WHEN l_movement_rec.exitflg = 0 THEN 1 ELSE 2 END);
        
        l_pibics_travel_conveyance_json := JSON();
        l_pibics_travel_conveyance_json.put('convSeqNo', NVL(dl_staging4pibics_intf.pkg_transcode_reverse_manual.get_conveyance_seqno_with_seqno(l_movement_rec.trnsprtunitid), 2));
        
        BEGIN
        select PIBICSPK, CONVREGNO  into l_tm2_seq, l_convregNo from (
        select PIBICSPK, CONVREGNO  
        from DL_BORDERCONTROL.MSCS_TM2
        where FLIGHTNO = l_movement_rec.scanned_flight
        and TRUNC(IODTE) = TRUNC(SYSDATE)
        order by iodte desc)
        where rownum =1;
            exception
              when no_data_found then
                l_tm2_seq := null;
        end;
        
        if ( l_tm2_seq is null) then
        BEGIN
        select TM2_SEQNO, CONVREGNO into l_tm2_seq, l_convregNo from 
        (select TM2_SEQNO, CONVREGNO
        from pibicsdm2.v_tm2_prod
        where CONVREGNO = l_movement_rec.scanned_flight
        and TRUNC(IODTE) = TRUNC(SYSDATE)
        and CARDTYPE = CASE WHEN l_movement_rec.exitflg = 0 THEN 1 ELSE 2 END
        order by iodte desc)
        where rownum =1;
            exception
              when no_data_found then
                l_tm2_seq := null;
        end;
        
        if ( l_tm2_seq is not null) then
        l_pibics_travel_info_json.put('tm2InOutSeqNo'   , l_tm2_seq); 
        l_pibics_travel_conveyance_json.put('convregNo', l_movement_rec.scanned_flight);
            else
            
                begin
                    select TM2_SEQNO, CONVREGNO into l_tm2_seq, l_convregNo from (
                    select TM2_SEQNO, CONVREGNO
                    from pibicsdm2.v_tm2_prod
                    where CONVREGNO = l_movement_rec.scanned_flight
                    order by iodte desc)
                    where rownum =1;
                    exception
                    when no_data_found then
                        l_tm2_seq := null;
                end;
                
                if ( l_tm2_seq is not null) then
                    l_pibics_travel_info_json.put('tm2InOutSeqNo'   , l_tm2_seq); 
                    l_pibics_travel_conveyance_json.put('convregNo', nvl(l_convregNo,l_movement_rec.scanned_flight));
                else
                    l_pibics_travel_info_json.put('tm2InOutSeqNo'   , ''); 
                    l_pibics_travel_conveyance_json.put('convregNo', l_movement_rec.scanned_flight);
                end if;

            end if;
        
    else
    l_pibics_travel_info_json.put('tm2InOutSeqNo'   , l_tm2_seq); 
    l_pibics_travel_conveyance_json.put('convregNo', nvl(l_convregNo,l_movement_rec.scanned_flight));
    end if;
        
        l_pibics_travel_info_json.put('inType'          , l_borderdocimage_exists);
        l_pibics_travel_info_json.put('conveyanceInfo'  , l_pibics_travel_conveyance_json);
        
         IF p_dml_type = 'I' THEN
            -----------------------
            -- live image start --
            -----------------------
            l_live_photo_size := NVL(l_live_photo_size, 0);
            
            l_pibics_travel_img_person_json := JSON();
            l_pibics_travel_img_person_json.put('fileNameImgPerson' , CASE WHEN l_live_photo_size > 0 THEN l_movement_rec.mvmntid || '_livePhoto.png' ELSE NULL END);
            l_pibics_travel_img_person_json.put('binaryImgPerson'   , CASE WHEN l_live_photo_size > 0 THEN convert_image(l_live_photo) ELSE NULL END);
            l_pibics_travel_img_person_json.put('fileSizeImgPerson' , l_live_photo_size);

            -----------------------
            -- live image end --
            -----------------------
            
            -----------------------
            -- doc image start --
            -----------------------
            l_pibics_travel_img_pass_json := JSON();
            
            IF l_borderdocimage_exists = 'P' THEN
                l_pibics_travel_img_pass_json.put('fileNameImgPassport' , l_movement_rec.mvmntid || '_passPhoto.png');
                l_pibics_travel_img_pass_json.put('binaryImgPassport'   , convert_image(l_borderdocimage));
                l_pibics_travel_img_pass_json.put('fileSizeImgPassport' , dbms_lob.getlength(l_borderdocimage));
            END IF;
            -----------------------
            -- doc image end --
            -----------------------
        END IF;
        -----------------------
        -- travel event info end --
        -----------------------
        
        -----------------------
        -- document start --
        -----------------------
        l_pibics_document_json := JSON();
        l_pibics_document_json.put('docType'       , '0001');
        l_pibics_document_json.put('docNumber'     , l_borderdocument_rec.docno);
        l_pibics_document_json.put('docIssueDate' , TO_CHAR(l_borderdocument_rec.manual_issuing_date, c_pibics_date_format_unformat_short));
        l_pibics_document_json.put('docExpireDate' , TO_CHAR(l_borderdocument_rec.expirydate, c_pibics_date_format_unformat_short));
        l_pibics_document_json.put('imgPass'      , l_pibics_travel_img_pass_json);
        
        --
        -----------------------
        -- document end --
        -----------------------
        
        -----------------------
        -- person start --
        -----------------------
        l_pibics_person_json := JSON();
        l_pibics_person_json.put('tm6Number'       , l_entry_form_no);
        l_pibics_person_json.put('countSeqNo'       , dl_staging4pibics_intf.pkg_transcode_reverse.get_country_seqno(l_borderdocument_rec.nat));
        --
--        l_pibics_person_json.put('nationality'   , CASE l_borderdocument_rec.nat
--                                                    WHEN 'D' THEN 'DEU'
--                                                    ELSE l_borderdocument_rec.nat
--                                                END
--                             );
        --
        l_pibics_person_json.put('familyName'    , l_borderdocument_rec.surname);
        l_pibics_person_json.put('givenName'     , l_borderdocument_rec.givenname);
        l_pibics_person_json.put('middleName'    , l_borderdocument_rec.middlename);
        
        IF l_thaipassport_exists = 'Y' THEN
        l_pibics_person_json.put('thaiFamilyName'       , l_thaipassport_tfamilynm);
        l_pibics_person_json.put('thaiGivenName'        , l_thaipassport_tfirstnm);
        l_pibics_person_json.put('thaiMiddleName'       , l_thaipassport_tmiddlenm);
        END IF;
        
        l_pibics_person_json.put('birthDate'     , l_borderdocument_rec.dob_partial.getFormatData('DD/MM/YYYY'));
        --
        l_pibics_person_json.put('gender'        , CASE l_borderdocument_rec.sex 
                                                    WHEN 1 THEN 'M' 
                                                    WHEN 2 THEN 'F' 
                                                    ELSE 'X' 
                                                END
                             );
        l_pibics_person_json.put('rankCrewSeqNo'  , '');
        l_pibics_person_json.put('imgPerson'     , l_pibics_travel_img_person_json);
        --
        -----------------------
        -- person end --
        -----------------------
        
         -----------------------
        -- visa start --
        -----------------------
        l_pibics_visa_json := JSON();
        l_pibics_visa_json.put('visaType'       , NVL(dl_staging4pibics_intf.pkg_transcode_reverse.get_visatype_seqno(l_movement_rec.visa_type), 2));
        l_pibics_visa_json.put('visaExpireDate' , TO_CHAR(l_visa_expiry_date, c_pibics_date_format_unformat_short));
        l_pibics_visa_json.put('remark'         , l_entry_form_note);
        --
        -----------------------
        -- visa end --
        -----------------------
        
         -----------------------
        -- tm5 start --
        -----------------------
      l_pibics_tm5_json := JSON();
      BEGIN
        SELECT a.tm5_seqno,indept_seqno,instype,insstatus,flag,amount,tm2_seqno,
        a.version,a.actflag,chkdept_seqno,note,guarantor,mvmntid,GUART_SEQNO 
            into 
            l_tm5_rec.tm5_seqno,l_tm5_rec.indept_seqno,l_tm5_rec.instype,l_tm5_rec.insstatus,l_tm5_rec.flag,l_tm5_rec.amount
            ,l_tm5_rec.tm2_seqno,l_tm5_rec.version,l_tm5_rec.actflag,l_tm5_rec.chkdept_seqno
            ,l_tm5_rec.note,l_tm5_rec.guarantor,l_tm5_rec.mvmntid,l_guard_seq 
            FROM dl_bordercontrol.mscs_tm5 a
            left join dl_bordercontrol.mscs_insdept b on a.indept_seqno = b.insdept_seqno
            where (1=1) and mvmntid = l_movement_rec.mvmntid
            and a.actflag = 'Y';
            exception
              when no_data_found then
                l_tm5_rec.tm5_seqno := null;
            end;
            
        if ( l_tm5_rec.tm5_seqno is not null) then
        l_pibics_tm5_json.put('flag'          , l_tm5_rec.flag);
        l_pibics_tm5_json.put('inDeptSeqNo'   , l_tm5_rec.indept_seqno);
        l_pibics_tm5_json.put('chkDeptSeqNo'  , l_tm5_rec.chkdept_seqno);
        l_pibics_tm5_json.put('guarantor'     , l_tm5_rec.guarantor);
        l_pibics_tm5_json.put('insType'       , l_tm5_rec.instype);
        l_pibics_tm5_json.put('guartDeptSeqNo', l_guard_seq);
        l_pibics_tm5_json.put('amount'        , l_tm5_rec.amount);
        l_pibics_tm5_json.put('insStatus'     , l_tm5_rec.insstatus);
        l_pibics_tm5_json.put('note'          , l_tm5_rec.note);
        end if;
        --
        -----------------------
        -- tm5 end --
        -----------------------

        -----------------------
        -- result json start --
        -----------------------
        l_pibics_json := JSON();
        l_pibics_json.put('headerInfo'     , l_pibics_header_json);
        l_pibics_json.put('recordInfo'     , l_pibics_record_json);
        l_pibics_json.put('travelEventInfo' , l_pibics_travel_info_json);
        l_pibics_json.put('documentData'    , l_pibics_document_json);
        l_pibics_json.put('personData'      , l_pibics_person_json);
        l_pibics_json.put('visaInfo'        , l_pibics_visa_json);
    
     IF l_tm5_rec.tm5_seqno is not null
        THEN
        l_pibics_json.put('tm5Info'         , l_pibics_tm5_json);
    end if;
          
        -----------------------
        -- result json end --
        -----------------------
        
        dbms_lob.createtemporary( l_result, true );
        l_pibics_json.to_clob( l_result, false );
    
        logger.append_param(l_params, 'dbms_lob.substr(l_result, 3000, 1)', dbms_lob.substr(l_result, 3000, 1));
        logger.log('GET PIBICS CREW INOUT FORMAT FROM MOVEMENT: done', l_scope, null, l_params);
    
        RETURN l_result;
        
    END get_pibics_crew_inout_from_movement;

END PKG_PIBICS_UNHOOK;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_PIBICS_UNHOOK" TO "DL_INTERFACE";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_PIBICS_UNHOOK" TO "BIOSAADM";
