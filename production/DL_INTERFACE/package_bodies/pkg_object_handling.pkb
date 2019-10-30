CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_INTERFACE"."PKG_OBJECT_HANDLING" IS

 /*******************************************************************************
  * ???
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * CHageman  26.10.2018  Added
  * MStahl    06.11.2018  added nvl so that the json does not contain null
  * MStahl    12.11.2018  Changes voa export
  *******************************************************************************/

  /****************************************
   * ========== TYPE DEFINITIONS ==========
   ****************************************/

  c_scope_prefix        CONSTANT VARCHAR2(31) := lower($$plsql_unit) || '.';
  --
  c_income_date_format                CONSTANT VARCHAR2(32 CHAR) := 'DD.MM.YYYY HH24:MI:SS';
  c_pibics_date_format_timestamp      CONSTANT VARCHAR2(32 CHAR) := 'YYYY-MM-DD"T"HH24:MI:SS';
  c_pibics_date_format_unformat       CONSTANT VARCHAR2(32 CHAR) := 'YYYYMMDDHH24MISS';
  c_pibics_date_format_unformat_short CONSTANT VARCHAR2(32 CHAR) := 'YYYYMMDD';
  c_pibics_date_format_slashs         CONSTANT VARCHAR2(32 CHAR) := 'DD/MM/YYYY';
  c_pibics_username                   CONSTANT VARCHAR2(50 CHAR) := 'chiraphat.n';
  c_pibics_systemcode                 CONSTANT VARCHAR2(50 CHAR) := 'BIO';
  c_pibics_bio_username               CONSTANT VARCHAR2(50 CHAR) := 'ISDS';
  c_database_timezone                 CONSTANT VARCHAR2(25 CHAR) := CASE
                                                                      WHEN ASCII(SUBSTR(TZ_OFFSET(sessiontimezone), LENGTH(TZ_OFFSET(sessiontimezone)))) = 0
                                                                      THEN
                                                                        SUBSTR(TZ_OFFSET(sessiontimezone), 1, LENGTH(TZ_OFFSET(sessiontimezone)) - 1)
                                                                      ELSE
                                                                        TZ_OFFSET(sessiontimezone)
                                                                      END;
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
   * Convert the given movement JSON into the needed JSON format for PIBICS
   * There might be different formats that should be sent to PIBICS (Insert/Update vs. Delete)

   * @param p_movement_json JSON of the bordercontrol movement
   * @param p_dml_type      DML Type of this transaction
   * @return CLOB JSON for PIBICS
   */
  FUNCTION get_pibics_inout_from_movement (p_movement_json  IN dl_bordercontrol.pkg_json_convert.t_movement_json_typ
                                          ,p_dml_type       IN VARCHAR2 DEFAULT 'I')
  RETURN CLOB
  IS

    l_scope   logger_logs.scope%type := c_scope_prefix || 'get_pibics_inout_from_movement';
    l_params  logger.tab_param;
    --
    l_result  CLOB;
    --
    l_pibics_json                     JSON;
    l_pibics_header_json              JSON;
    l_pibics_record_json              JSON;
    l_pibics_mrz_json                 JSON;
    l_pibics_travel_info_json         JSON;
    l_pibics_travel_conveyance_json   JSON;
    l_pibics_travel_img_person_json   JSON;
    l_pibics_travel_img_pass_json     JSON;
    l_pibics_overstay_json            JSON;
    l_pibics_permit_info              JSON;
    l_pibics_resident_info            JSON;
    l_pibics_collective_passports     JSON_LIST;
    l_pibics_collective_passport_img  JSON;
    l_pibics_collective_passport      JSON;
    --
    --
    l_common_human_sexes                  JSON_OBJECT_T;
    
    l_residence_cnt number(4);
    l_residence_rec pibicsdm2.crs_person%rowtype;
    l_overstay_rec dl_bordercontrol.mscs_movements_overstay%rowtype;

  BEGIN

    --logger.append_param(l_params, 'dbms_lob.substr(p_movement_json, 4000, 1)', dbms_lob.substr(p_movement_json, 4000, 1));
    logger.append_param(l_params, 'p_dml_type', p_dml_type);
    logger.log('GET PIBICS INOUT FORMAT FROM MOVEMENT: start', l_scope, null, l_params);

    --
    -- headerInfo
    l_pibics_header_json := JSON();
    l_pibics_header_json.put('refNo'      , TO_CHAR(SYSDATE, 'YYYYMMDD'));
    l_pibics_header_json.put('dateTime'   , TO_CHAR(SYSDATE, c_pibics_date_format_timestamp) || c_database_timezone);
    --l_pibics_header_json.put('userID'     , nvl(LOWER(trim(p_movement_json.movement.ins_by)),c_pibics_username));
    
    IF LOWER(trim(p_movement_json.movement.ins_by)) = 'jaturong.su' THEN
    l_pibics_header_json.put('userID'     , 'Jaturong.su');
    ELSIF LOWER(trim(p_movement_json.movement.ins_by)) = 'akkharadet.su' THEN
    l_pibics_header_json.put('userID'     , 'Akkharadet.su');
    ELSE
    l_pibics_header_json.put('userID'     , nvl(LOWER(trim(p_movement_json.movement.ins_by)),c_pibics_username));
    END IF;
    
    l_pibics_header_json.put('systemCode' , c_pibics_systemcode);
    l_pibics_header_json.put('module'     , 'INOUT');
    l_pibics_header_json.put('ipClient'   , p_movement_json.terminal.ipaddress);

    -- record
    l_pibics_record_json := JSON();
    l_pibics_record_json.put('bioPk'      , p_movement_json.movement.mvmntid);
    --l_pibics_record_json.put('createUser' , c_pibics_bio_username); --p_movement_json.movement.ins_by
    l_pibics_record_json.put('deptSeqNo'  , nvl(dl_staging4pibics_intf.pkg_transcode_reverse.get_borderpost_seqno(p_movement_json.borderpost.key_value), 194));
    l_pibics_record_json.put('typeData'   , 'BIO');

    IF p_dml_type = 'I' THEN
      l_pibics_record_json.put('createDate' , TO_CHAR(p_movement_json.movement.ins_at, c_pibics_date_format_unformat));
    ELSIF p_dml_type = 'U' THEN
      l_pibics_record_json.put('updateDate', TO_CHAR(p_movement_json.movement.dml_at, c_pibics_date_format_unformat));
      --l_pibics_record_json.put('pibicsPk'  , dl_staging4pibics_intf.pkg_transcode_reverse.get_movement_seqno (p_movement_json.movement.mvmntid));
      l_pibics_record_json.put('pibicsPk'  , DL_INTERFACE.PKG_OBJECT_HANDLING.AA_GET_PIBICS_PK(p_movement_json.movement.mvmntid));
    END IF;

    -- mrz
    l_pibics_mrz_json := JSON();
    --l_pibics_mrz_json.put('docType'       , nvl(dl_staging4pibics_intf.pkg_transcode_reverse.get_traveldoctype_seqno(p_movement_json.borderdocument.borderdocument.docclass),1));
    --l_pibics_mrz_json.put('docType'       , nvl(p_movement_json.borderdocument.borderdocument.docclass,'1'));
    l_pibics_mrz_json.put('docType'       , '1');
    l_pibics_mrz_json.put('docNumber'     , p_movement_json.borderdocument.borderdocument.docno);
    l_pibics_mrz_json.put('docExpireDate' , TO_CHAR(p_movement_json.borderdocument.borderdocument.expirydate, c_pibics_date_format_unformat_short));
    --l_pibics_mrz_json.put('nationality'   , 'XXX' /*NVL(TO_CHAR(dl_staging4pibics_intf.pkg_transcode_reverse.get_icao_doc_codes_seqno(p_movement_json.borderdocument.borderdocument.nat)), 'XXX')*/);
    
    IF p_movement_json.borderdocument.borderdocument.nat = 'D' THEN
    l_pibics_mrz_json.put('nationality'   , 'DEU');
    ELSE
    l_pibics_mrz_json.put('nationality'   , p_movement_json.borderdocument.borderdocument.nat);
    END IF;
    
    l_pibics_mrz_json.put('familyName'    , p_movement_json.borderdocument.borderdocument.surname);
    l_pibics_mrz_json.put('givenName'     , p_movement_json.borderdocument.borderdocument.givenname);
    l_pibics_mrz_json.put('middleName'    , p_movement_json.borderdocument.borderdocument.middlename);
    --l_pibics_mrz_json.put('birthDate'     , TO_CHAR(p_movement_json.borderdocument.borderdocument.calc_dob, c_pibics_date_format_slashs));
    l_pibics_mrz_json.put('birthDate'     , p_movement_json.borderdocument.borderdocument.dob);
    l_pibics_mrz_json.put('gender'        , CASE p_movement_json.borderdocument.borderdocument.sex WHEN 1 THEN 'M' WHEN 2 THEN 'F' ELSE 'X' END);
    --l_pibics_mrz_json.put('issuingCountry', 'XXX' /*NVL(TO_CHAR(dl_staging4pibics_intf.pkg_transcode_reverse.get_icao_doc_codes_seqno(p_movement_json.borderdocument.borderdocument.issuectry)), 'XXX')*/);
    IF p_movement_json.borderdocument.borderdocument.issuectry = 'D' THEN
    l_pibics_mrz_json.put('issuingCountry', 'DEU');
    ELSE
    l_pibics_mrz_json.put('issuingCountry', p_movement_json.borderdocument.borderdocument.issuectry);
    END IF;

    -- travel event information
    l_pibics_travel_info_json := JSON();
    l_pibics_travel_info_json.put('inOutDate'     , TO_CHAR(NVL(p_movement_json.movement.date_of_entry, p_movement_json.movement.movement_dt), c_pibics_date_format_unformat));
    l_pibics_travel_info_json.put('tm6Number'     , p_movement_json.entry_form.entry_form.form_no);
    l_pibics_travel_info_json.put('cardType'      , CASE WHEN p_movement_json.movement.exitflg = 0 THEN 1 ELSE 2 END);--since pibics does not like 0 we give it what it want (1) p_movement_json.movement.exitflg);
    l_pibics_travel_info_json.put('visaTypeSeqNo' , nvl(dl_staging4pibics_intf.pkg_transcode_reverse.get_visatype_seqno(p_movement_json.visa_data.visa.visa_type),2));
    l_pibics_travel_info_json.put('visaExpDate'   , TO_CHAR(p_movement_json.visa_data.visa.expiry_date, c_pibics_date_format_unformat_short));
    l_pibics_travel_info_json.put('passengerType' , p_movement_json.movement.person_type);
    l_pibics_travel_info_json.put('remark'        , p_movement_json.entry_form.entry_form.note);
    l_pibics_travel_info_json.put('initType'      , CASE WHEN p_movement_json.borderdocument.borderdocimages.COUNT = 0 THEN 'N' ELSE 'Y' END);

    l_pibics_travel_conveyance_json := JSON();
    --l_pibics_travel_conveyance_json.put('convSeqNo', NVL(dl_staging4pibics_intf.pkg_transcode_reverse.get_conveyance_seqno(p_movement_json.movement.trnsprtunitid), 2));
    l_pibics_travel_conveyance_json.put('convSeqNo', NVL(dl_staging4pibics_intf.pkg_transcode_reverse_manual.get_conveyance_seqno_with_seqno(p_movement_json.movement.trnsprtunitid), 2));
    l_pibics_travel_conveyance_json.put('convName1', NVL(SUBSTR(p_movement_json.movement.scanned_flight, 1, 2),'--'));
    l_pibics_travel_conveyance_json.put('convName2', NVL(SUBSTR(p_movement_json.movement.scanned_flight, 3),'0000'));
    l_pibics_travel_conveyance_json.put('convProvSeqNo', nvl(dl_staging4pibics_intf.pkg_transcode_reverse.get_province_seqno(p_movement_json.entry_form.province.key_value),1));
    
    l_pibics_travel_info_json.put('conveyanceInfo', l_pibics_travel_conveyance_json);

    IF p_dml_type = 'I'
    THEN

      l_pibics_travel_img_person_json := JSON();
      l_pibics_travel_img_person_json.put('fileNameImgPerson' , CASE WHEN p_movement_json.movement_blobs.live_photo IS NOT NULL THEN p_movement_json.movement.mvmntid || '_livePhoto.png' ELSE NULL END);
      l_pibics_travel_img_person_json.put('binaryImgPerson'   , convert_image(p_movement_json.movement_blobs.live_photo));
      l_pibics_travel_img_person_json.put('fileSizeImgPerson' , dbms_lob.getlength(p_movement_json.movement_blobs.live_photo));

      l_pibics_travel_img_pass_json := JSON();
      IF p_movement_json.borderdocument.borderdocimages IS NOT NULL
      THEN

        FOR i IN 0 .. p_movement_json.borderdocument.borderdocimages.COUNT -1
        LOOP
          IF p_movement_json.borderdocument.borderdocimages(i).seqno = 2
          --IF i = 2
          THEN

            l_pibics_travel_img_pass_json.put('fileNameImgPassport' , p_movement_json.movement.mvmntid || '_passPhoto.png');
            l_pibics_travel_img_pass_json.put('binaryImgPassport'   , convert_image(p_movement_json.borderdocument.borderdocimages(i).image));
            l_pibics_travel_img_pass_json.put('fileSizeImgPassport' , dbms_lob.getlength(p_movement_json.borderdocument.borderdocimages(i).image));
          END IF;
        END LOOP;
      END IF;

      l_pibics_travel_info_json.put('imgPerson'     , l_pibics_travel_img_person_json);
      l_pibics_travel_info_json.put('imgPass'       , l_pibics_travel_img_pass_json);

      -- overstay
      l_pibics_overstay_json := JSON();
      BEGIN
       SELECT key_value, extovs_date,flagoverstay,findoverstaydays,findoverstayamount
            into 
            l_overstay_rec.key_value,
            l_overstay_rec.extovs_date,
            l_overstay_rec.flagoverstay,
            l_overstay_rec.findoverstaydays,
            l_overstay_rec.findoverstayamount
            FROM dl_bordercontrol.mscs_movements_overstay
            WHERE mvmntid = p_movement_json.movement.mvmntid;
            exception
              when no_data_found then
                l_overstay_rec.key_value := null;
        END;
      
       if ( l_overstay_rec.key_value is not null) then
       
        l_pibics_overstay_json.put('flagOverStay'       , 'Y'); 
        l_pibics_overstay_json.put('findOverStayAmount' , l_overstay_rec.findoverstayamount); -- no equivalent
       else
        l_pibics_overstay_json.put('flagOverStay'       , 'N'); -- no equivalent
        l_pibics_overstay_json.put('findOverStayAmount' , '0'); -- no equivalent
       end if;

      -- permit info
      l_pibics_permit_info := JSON();
        IF p_movement_json.visa_data.visa.permit_type IS NOT NULL
        THEN
      --l_pibics_permit_info.put('permitTypeSeqNo', nvl(dl_staging4pibics_intf.pkg_transcode_reverse.get_permittype_seqno(p_movement_json.visa_data.visa.permit_type),1));
      --l_pibics_permit_info.put('permitSeqNo'    , 1/*p_movement_json.visa_data.visa.key_value*/); -- TODO: Wo kommt der Wert her? Vorgeschlagen von MSC: 1
      l_pibics_permit_info.put('permitTypeSeqNo', CASE WHEN p_movement_json.visa_data.visa.permit_type IS NOT NULL THEN LPAD(p_movement_json.visa_data.visa.permit_type,4,'0') ELSE NULL END);
      l_pibics_permit_info.put('permitSeqNo'    , p_movement_json.visa_data.visa.permit_type);
      l_pibics_permit_info.put('permitDate'     , TO_CHAR(nvl(p_movement_json.visa_data.visa.permit_expiry_date, sysdate), c_pibics_date_format_unformat_short));
      
      END IF;

      -- resident info
      l_pibics_resident_info := JSON();
      BEGIN
       SELECT RESCERTTYPE_SEQNO, RCNO_PVCD, RCNO_RUNNINGNO, RCNO_YEAR
            , TFAMILYNM, TFIRSTNM, TMIDDLENM
            into 
            l_residence_rec.RESCERTTYPE_SEQNO,
            l_residence_rec.RCNO_PVCD,
            l_residence_rec.RCNO_RUNNINGNO,
            l_residence_rec.RCNO_YEAR,
            l_residence_rec.TFAMILYNM,
            l_residence_rec.TFIRSTNM,
            l_residence_rec.TMIDDLENM
            FROM PIBICSDM2.CRS_PERSON
            WHERE CRS_STS = 'A'
            AND BIRTH_DATE = TO_CHAR(p_movement_json.borderdocument.borderdocument.calc_dob, c_pibics_date_format_slashs)
            AND NATION_SEQNO = dl_staging4pibics_intf.pkg_transcode_reverse.get_country_seqno(p_movement_json.borderdocument.borderdocument.nat) 
            AND EFAMILYNM = p_movement_json.borderdocument.borderdocument.surname
            AND EFIRSTNM =  p_movement_json.borderdocument.borderdocument.givenname
            AND EMIDDLENM = p_movement_json.borderdocument.borderdocument.middlename;
            exception
              when no_data_found then
                l_residence_rec.RESCERTTYPE_SEQNO := null;
            end;
            
        if ( l_residence_rec.RESCERTTYPE_SEQNO is not null) then
        l_pibics_resident_info.put('citizenIDorResidentID', l_residence_rec.RESCERTTYPE_SEQNO || l_residence_rec.RCNO_PVCD || l_residence_rec.RCNO_RUNNINGNO || '/' || l_residence_rec.RCNO_YEAR);
        l_pibics_resident_info.put('thaiFamilyName'       , l_residence_rec.TFAMILYNM);
        l_pibics_resident_info.put('thaiGivenName'        , l_residence_rec.TFIRSTNM);
        l_pibics_resident_info.put('thaiMiddleName'       , l_residence_rec.TMIDDLENM);
        end if;
      
        IF l_pibics_resident_info.count() = 0
      THEN
      IF p_movement_json.borderdocument.thaipassport.citizenid  IS NOT NULL
      THEN
        l_pibics_resident_info.put('citizenIDorResidentID', p_movement_json.borderdocument.thaipassport.citizenid);
        l_pibics_resident_info.put('thaiFamilyName'       , p_movement_json.borderdocument.thaipassport.tfamilynm);
        l_pibics_resident_info.put('thaiGivenName'        , p_movement_json.borderdocument.thaipassport.tfirstnm);
        l_pibics_resident_info.put('thaiMiddleName'       , p_movement_json.borderdocument.thaipassport.tmiddlenm);
      END IF;
      END IF;

      l_pibics_collective_passports := JSON_LIST();
      IF p_movement_json.fellow_passengers IS NOT NULL
      THEN

        FOR i IN 0 .. p_movement_json.fellow_passengers.COUNT - 1
        LOOP

          l_pibics_collective_passport_img := JSON();
          l_pibics_collective_passport_img.put('fileNameImgJoinPerson' , p_movement_json.fellow_passengers(i).key_value || '_img.png');
          l_pibics_collective_passport_img.put('binaryImgJoinPerson'   , convert_image(p_movement_json.fellow_passengers(i).image));
          l_pibics_collective_passport_img.put('fileSizeImgJoinPerson' , dbms_lob.getlength(p_movement_json.fellow_passengers(i).image));

          IF p_movement_json.fellow_passengers(i).sex IS NOT NULL
          THEN
            l_common_human_sexes := JSON_OBJECT_T.parse(dl_common.pkg_json_export.get_human_sex(p_movement_json.fellow_passengers(i).sex));
          ELSE
            l_common_human_sexes := JSON_OBJECT_T();
          END IF;

          l_pibics_collective_passport := JSON();
          l_pibics_collective_passport.put('joinTM6'        , p_movement_json.fellow_passengers(i).tm6_no);
          l_pibics_collective_passport.put('joinFamilyName' , p_movement_json.fellow_passengers(i).last_name);
          l_pibics_collective_passport.put('joinMiddleName' , p_movement_json.fellow_passengers(i).middle_name);
          l_pibics_collective_passport.put('joinGivenName'  , p_movement_json.fellow_passengers(i).first_name);
          --l_pibics_collective_passport.put('joinNationality', dl_staging4pibics_intf.pkg_transcode_reverse.get_country_seqno(p_movement_json.fellow_passengers(i).nationality));
          l_pibics_collective_passport.put('joinNationality', p_movement_json.fellow_passengers(i).nationality);
          l_pibics_collective_passport.put('joinGender'     , NVL(l_common_human_sexes.get_string('icao'), 'X'));
          l_pibics_collective_passport.put('joinBirthDate'  , TO_CHAR(p_movement_json.fellow_passengers(i).date_of_birth, c_pibics_date_format_slashs));
          --l_pibics_collective_passport.put('relationSeqNo'  , p_movement_json.fellow_passengers(i).relation); -- TODO: Lookup (possible after implementation in DL_STAGING4PIBICS)
          l_pibics_collective_passport.put('relationSeqNo'  , dl_staging4pibics_intf.pkg_transcode_reverse.get_relation_seqno(p_movement_json.fellow_passengers(i).relation));
          l_pibics_collective_passport.put('imgJoinPerson'  , l_pibics_collective_passport_img);
          l_pibics_collective_passports.append(l_pibics_collective_passport.to_json_value);
        END LOOP;
      END IF;
    END IF;

    -- set result json
    l_pibics_json := JSON();
    l_pibics_json.put('headerInfo'     , l_pibics_header_json);
    l_pibics_json.put('recordInfo'     , l_pibics_record_json);
    l_pibics_json.put('mrzData'        , l_pibics_mrz_json);
    l_pibics_json.put('travelEventInfo', l_pibics_travel_info_json);
   

    IF p_dml_type = 'I'
    THEN
    
       IF p_movement_json.visa_data.visa.permit_type IS NOT NULL
        THEN
        l_pibics_json.put('chkPermitInfo'  , l_pibics_permit_info);
        end if;
    
      l_pibics_json.put('overStayInfo'   , l_pibics_overstay_json);
      
      IF l_pibics_resident_info.count() > 0
      THEN
        l_pibics_json.put('mfaResidentInfo', l_pibics_resident_info);
      END IF;
      IF l_pibics_collective_passports.count() > 0
      THEN
        l_pibics_json.put('joinPassport'   , l_pibics_collective_passports);
      END IF;
    END IF;

    dbms_lob.createtemporary( l_result, true );
    l_pibics_json.to_clob( l_result, false );

    logger.append_param(l_params, 'dbms_lob.substr(l_result, 4000, 1)', dbms_lob.substr(l_result, 4000, 1));
    logger.log('GET PIBICS INOUT FORMAT FROM MOVEMENT: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('GET PIBICS INOUT FORMAT FROM MOVEMENT: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END get_pibics_inout_from_movement;

  /**
   * description
   * @param parameter param_desc
   * @return return_param return_param_value
   * @throws error error_desc
   */
   
 FUNCTION AA_get_pibics_pk (p_id in varchar2)
  RETURN VARCHAR2
  IS
    l_json_object         CLOB;
    l_log_sync_webservices_obj        JSON;
    l_lmsgRes_obj        JSON;
    --
    l_result  VARCHAR2(255);
    --
    l_log_rec dl_interface.log_sync_webservices%rowtype;

  BEGIN
    begin         
    SELECT key_value,dml_at,dml_by,dml_type,ins_at,ins_by,sender,sender_object,sender_object_id,
    sender_message,sender_response_code,sender_response_message,receiver_response_id,
    receiver_response,process_time
    INTO
    l_log_rec.key_value,l_log_rec.dml_at,l_log_rec.dml_by,l_log_rec.dml_type,l_log_rec.ins_at,l_log_rec.ins_by
    ,l_log_rec.sender,l_log_rec.sender_object,l_log_rec.sender_object_id,
    l_log_rec.sender_message,l_log_rec.sender_response_code,l_log_rec.sender_response_message,l_log_rec.receiver_response_id,
    l_log_rec.receiver_response,l_log_rec.process_time
    FROM
    dl_interface.log_sync_webservices
    where sender_object_id = p_id and dml_type = 'I' and sender_response_code = 200 and rownum =1;
    exception
              when no_data_found then
        RETURN l_result;  
    end;

    IF l_log_rec.sender_response_message is not null then
        l_log_sync_webservices_obj := JSON(l_log_rec.sender_response_message);
        l_lmsgRes_obj    := JSON(l_log_sync_webservices_obj.get('msgRes'));

        IF l_lmsgRes_obj.get('msgCode').get_string() = '0000' THEN
        
            l_result := l_log_sync_webservices_obj.get('pibicsPk').get_string();
        
        end if;
        
    end if;

    RETURN l_result;
  END AA_get_pibics_pk;
 
 FUNCTION AA_get_bio_pk (p_id in varchar2)
  RETURN VARCHAR2
  IS
    l_json_object         CLOB;
    l_log_sync_webservices_obj        JSON;
    l_lmsgRes_obj        JSON;
    --
    l_result  VARCHAR2(255);
    --
    l_log_rec dl_interface.log_sync_webservices%rowtype;

  BEGIN
    begin            
    SELECT key_value,dml_at,dml_by,dml_type,ins_at,ins_by,sender,sender_object,sender_object_id,
    sender_message,sender_response_code,sender_response_message,receiver_response_id,
    receiver_response,process_time
    INTO
    l_log_rec.key_value,l_log_rec.dml_at,l_log_rec.dml_by,l_log_rec.dml_type,l_log_rec.ins_at,l_log_rec.ins_by
    ,l_log_rec.sender,l_log_rec.sender_object,l_log_rec.sender_object_id,
    l_log_rec.sender_message,l_log_rec.sender_response_code,l_log_rec.sender_response_message,l_log_rec.receiver_response_id,
    l_log_rec.receiver_response,l_log_rec.process_time
    FROM
    dl_interface.log_sync_webservices
    where sender_response_message like '%"pibicsPk":"' || p_id || '"%' 
    and dml_type = 'I' and sender_response_code = 200 and rownum =1;
    exception
     when no_data_found then
        RETURN l_result;
    end;

    IF l_log_rec.sender_response_message is not null then
         l_result := l_log_rec.sender_object_id;
    end if;

    RETURN l_result;
  END AA_get_bio_pk;
  
  FUNCTION AA_get_pibics_inout_from_movement (p_id in varchar2, p_dml_type       IN VARCHAR2 DEFAULT 'I')
  RETURN CLOB
  IS
    l_scope   logger_logs.scope%type := c_scope_prefix || 'get_pibics_inout_from_movement';
    l_params  logger.tab_param;
    
    l_json_object         CLOB;
    l_movement_obj        JSON;
    l_terminal_obj        JSON;
    l_borderpost_obj      JSON;
    l_borderdocuments_obj      JSON;
    l_entryForm_obj      JSON;
    l_visas_obj      JSON;
    l_province_obj      JSON;
    l_movementImages_obj      JSON;
    l_collective_obj      JSON;
    l_collective_passports_obj      JSON_LIST;
    l_collective_passport_obj       PLJSON;
    l_borderdocimages_obj   JSON_LIST;
    l_borderdocimage_obj    JSON;
    l_residense_obj      JSON;
    --
    l_result  CLOB;
    --
    l_pibics_json                     JSON;
    l_pibics_header_json              JSON;
    l_pibics_record_json              JSON;
    l_pibics_mrz_json                 JSON;
    l_pibics_travel_info_json         JSON;
    l_pibics_travel_conveyance_json   JSON;
    l_pibics_travel_img_person_json   JSON;
    l_pibics_travel_img_pass_json     JSON;
    l_pibics_overstay_json            JSON;
    l_pibics_permit_info              JSON;
    l_pibics_resident_info            JSON;
    l_pibics_collective_passports     JSON_LIST;
    l_pibics_collective_passport_img  JSON;
    l_pibics_collective_passport      JSON;
    --
    --
    l_common_human_sexes                  JSON_OBJECT_T;
    l_tmp_passimage  BLOB;
    l_bd_img_cnt number(4);
    l_mb_rec dl_bordercontrol.movements_blob%rowtype;
    l_residence_rec pibicsdm2.crs_person%rowtype;

  BEGIN
  
    --logger.append_param(l_params, 'dbms_lob.substr(p_movement_json, 4000, 1)', dbms_lob.substr(p_movement_json, 4000, 1));
    logger.append_param(l_params, 'p_dml_type', p_dml_type);
    logger.log('GET PIBICS INOUT FORMAT FROM MOVEMENT: start', l_scope, null, l_params);
    
    l_json_object := dl_bordercontrol.pkg_json_export.AA_get_movements(p_id);
    l_movement_obj    := JSON(l_json_object);
    l_terminal_obj    := JSON(l_movement_obj.get('terminal'));
    l_borderpost_obj  := JSON(l_movement_obj.get('borderpost'));
    l_borderdocuments_obj  := JSON(l_movement_obj.get('borderdocuments'));
    l_entryForm_obj  := JSON(l_movement_obj.get('entryForm'));
    l_visas_obj  := JSON(l_movement_obj.get('visa'));
    l_province_obj  := JSON(l_entryForm_obj.get('province'));
    l_movementImages_obj  := JSON(l_movement_obj.get('movementImages'));
    --l_residense_obj := JSON(l_borderdocuments_obj.get('residence'));
    
--    select m.image into l_tmp_passimage from DL_BORDERCONTROL.BORDERDOCIMAGES m
--    where m.BRDDOCID= '7C1A505C723D2197E053010510ACC1C3' and SEQNO = 2;
    
    --dbms_output.Put_line(l_movementImages_obj.get('livePhoto').get_string());
    --
    -- headerInfo
    l_pibics_header_json := JSON();
    l_pibics_header_json.put('refNo'      , TO_CHAR(SYSDATE, 'YYYYMMDD'));
    l_pibics_header_json.put('dateTime'   , TO_CHAR(SYSDATE, c_pibics_date_format_timestamp) || c_database_timezone);
    l_pibics_header_json.put('userID'     , c_pibics_username);
    l_pibics_header_json.put('systemCode' , c_pibics_systemcode);
    l_pibics_header_json.put('module'     , 'INOUT');
    l_pibics_header_json.put('ipClient'   , l_terminal_obj.get('ipAddress').get_string());
    
    l_pibics_record_json := JSON();
    l_pibics_record_json.put('bioPk'      , p_id);
    l_pibics_record_json.put('deptSeqNo'  , nvl(dl_staging4pibics_intf.pkg_transcode_reverse.get_borderpost_seqno(l_borderpost_obj.get('id').get_string()), 115));
    l_pibics_record_json.put('typeData'   , 'BIO');

    IF p_dml_type = 'I' THEN
      l_pibics_record_json.put('createDate' , TO_CHAR(TO_DATE(l_movement_obj.get('createdAt').get_string(),'DD.MM.YYYY HH24:MI:SS'), c_pibics_date_format_unformat));
    ELSIF p_dml_type = 'U' THEN
      l_pibics_record_json.put('updateData', TO_CHAR(TO_DATE(l_movement_obj.get('lastModifiedAt').get_string(),'DD.MM.YYYY HH24:MI:SS'), c_pibics_date_format_unformat));
      l_pibics_record_json.put('pibicsPk'  , dl_staging4pibics_intf.pkg_transcode_reverse.get_movement_seqno (p_id));
    END IF;
    
     -- mrz
    l_pibics_mrz_json := JSON();
    --l_pibics_mrz_json.put('docType'       , l_borderdocuments_obj.get('documentType').get_string());
    l_pibics_mrz_json.put('docType'       , '1');
    l_pibics_mrz_json.put('docNumber'     , l_borderdocuments_obj.get('documentNumber').get_string());
    l_pibics_mrz_json.put('docExpireDate' , TO_CHAR(TO_DATE(l_borderdocuments_obj.get('expiryDate').get_string(),'DD.MM.YYYY HH24:MI:SS'),c_pibics_date_format_unformat_short));
    l_pibics_mrz_json.put('nationality'   , l_borderdocuments_obj.get('nationalityId').get_string());
    l_pibics_mrz_json.put('familyName'    , l_borderdocuments_obj.get('surname').get_string());
    l_pibics_mrz_json.put('givenName'     , l_borderdocuments_obj.get('givenName').get_string());
    l_pibics_mrz_json.put('middleName'    , l_borderdocuments_obj.get('middleName').get_string());
    l_pibics_mrz_json.put('birthDate'     , TO_CHAR(TO_DATE(l_borderdocuments_obj.get('dateOfBirthDate').get_string(),'DD.MM.YYYY HH24:MI:SS'),c_pibics_date_format_slashs));
    l_pibics_mrz_json.put('gender'        , CASE l_borderdocuments_obj.get('genderId').get_number() WHEN 1 THEN 'M' WHEN 2 THEN 'F' ELSE 'X' END);
    l_pibics_mrz_json.put('issuingCountry', l_borderdocuments_obj.get('issuingCountryId').get_string());
    
    -- travel event information
    l_pibics_travel_info_json := JSON();
    l_pibics_travel_info_json.put('inOutDate'     , TO_CHAR(TO_DATE(NVL(l_movement_obj.get('dateOfEntry').get_string(),l_movement_obj.get('movementDate').get_string()),'DD.MM.YYYY HH24:MI:SS'), c_pibics_date_format_unformat));
    l_pibics_travel_info_json.put('tm6Number'     , l_entryForm_obj.get('formNo').get_string());
    l_pibics_travel_info_json.put('cardType'      , CASE l_movement_obj.get('exitFlag').get_number() WHEN 0 THEN '1' WHEN 1 THEN '2' END);--since pibics does not like 0 we give it what it want (1) p_movement_json.movement.exitflg);
    l_pibics_travel_info_json.put('visaTypeSeqNo' , dl_staging4pibics_intf.pkg_transcode_reverse.get_visatype_seqno(LPAD(l_visas_obj.get('visaTypeId').get_string(),4,'0')));
    l_pibics_travel_info_json.put('visaExpDate'   , TO_CHAR(TO_DATE(l_visas_obj.get('expiryDate').get_string(),'DD.MM.YYYY HH24:MI:SS'), c_pibics_date_format_unformat_short));
    l_pibics_travel_info_json.put('passengerType' , l_movement_obj.get('personType').get_number());
    l_pibics_travel_info_json.put('remark'        , l_entryForm_obj.get('note').get_string());
    l_pibics_travel_info_json.put('initType'      , CASE WHEN l_borderdocuments_obj.get('mrzDg1').get_string() is null THEN 'N' ELSE 'Y' END);
    
     l_pibics_travel_conveyance_json := JSON();
    l_pibics_travel_conveyance_json.put('convSeqNo', '2');
    l_pibics_travel_conveyance_json.put('convName1', SUBSTR(l_movement_obj.get('scannedFlight').get_string(), 1, 2));
    l_pibics_travel_conveyance_json.put('convName2', SUBSTR(l_movement_obj.get('scannedFlight').get_string(), 3));
    l_pibics_travel_conveyance_json.put('convProvSeqNo', nvl(dl_staging4pibics_intf.pkg_transcode_reverse.get_province_seqno(l_province_obj.get('id').get_string()),1));
    l_pibics_travel_info_json.put('conveyanceInfo', l_pibics_travel_conveyance_json);
    
    IF p_dml_type = 'I'
    THEN
    
    l_pibics_travel_img_person_json := JSON();
--      l_pibics_travel_img_person_json.put('fileNameImgPerson' ,CASE WHEN l_movementImages_obj.get('livePhoto').get_string() IS NOT NULL THEN p_id || '_livePhoto.png' ELSE NULL END);
--      l_pibics_travel_img_person_json.put('binaryImgPerson'   ,CASE WHEN l_movementImages_obj.get('livePhoto').get_string() IS NOT NULL THEN l_movementImages_obj.get('livePhoto').get_string() ELSE NULL END);
--      l_pibics_travel_img_person_json.put('fileSizeImgPerson' ,CASE WHEN l_movementImages_obj.get('livePhoto').get_string() IS NOT NULL THEN dbms_lob.getlength(dl_bordercontrol.pkg_json_convert.convert_base64_clob_to_blob((l_movementImages_obj.get('livePhoto').get_string()))) ELSE NULL END);
      
            select
                    mb.live_photo
                into
                    l_mb_rec.live_photo
                from dl_bordercontrol.movements_blob mb
                where mb.mvmnt_id = p_id;
      l_pibics_travel_img_person_json.put('fileNameImgPerson' , p_id || '_livePhoto.png');
      l_pibics_travel_img_person_json.put( 'binaryImgPerson' , convert_image( l_mb_rec.live_photo) );
      l_pibics_travel_img_person_json.put('fileSizeImgPerson' ,dbms_lob.getlength(l_mb_rec.live_photo));
      
      
      l_pibics_travel_img_pass_json := JSON();
--        IF l_borderdocuments_obj.get('images') IS NOT NULL
--        THEN
--          l_borderdocimages_obj := JSON_LIST(l_borderdocuments_obj.get('images'));
--        ELSE
--          l_borderdocimages_obj := JSON_LIST();
--        END IF;
        
        
            select count(*)
            into l_bd_img_cnt
            from dl_bordercontrol.borderdocimages bi
            where bi.brddocid = '7C1A505C723D2197E053010510ACC1C3' and SEQNO = 2;
            
                if ( l_bd_img_cnt > 0) then

                for l_bi_rec in (select
                                    bi.image
                                from dl_bordercontrol.borderdocimages bi
                                where bi.brddocid = '7C1A505C723D2197E053010510ACC1C3' and SEQNO = 2
                                )
                loop
                   l_pibics_travel_img_pass_json.put('fileNameImgPassport' , p_id || '_passPhoto.png');
                   l_pibics_travel_img_pass_json.put('binaryImgPassport'   , convert_image( l_bi_rec.image ));
                   l_pibics_travel_img_pass_json.put('fileSizeImgPassport' , dbms_lob.getlength(l_bi_rec.image));
                end loop;
            end if;
        
--        IF l_borderdocimages_obj IS NOT NULL
--        THEN
--      FOR i IN 1 .. l_borderdocimages_obj.count()
--      LOOP
--            l_borderdocimage_obj := JSON(l_borderdocimages_obj.get(i));
--             IF l_borderdocimage_obj.get('seqno').get_number() = 2 THEN
--            l_pibics_travel_img_pass_json.put('fileNameImgPassport' , p_id || '_passPhoto.png');
--            --l_pibics_travel_img_pass_json.put('binaryImgPassport'   , convert_image(dl_bordercontrol.pkg_json_convert.convert_base64_clob_to_blob(l_borderdocimage_obj.get('image').get_string())));
--            l_pibics_travel_img_pass_json.put('fileSizeImgPassport' , dbms_lob.getlength(dl_bordercontrol.pkg_json_convert.convert_base64_clob_to_blob(l_borderdocimage_obj.get('image').get_string())));
--             END IF;
--       END LOOP;
--       END IF;
      
      l_pibics_travel_info_json.put('imgPerson'     , l_pibics_travel_img_person_json);
      l_pibics_travel_info_json.put('imgPass'       , l_pibics_travel_img_pass_json);
      
      -- overstay
      l_pibics_overstay_json := JSON();
      l_pibics_overstay_json.put('flagOverStay'       , 'N'); -- no equivalent
      l_pibics_overstay_json.put('findOverStayAmount' , '0'); -- no equivalent
      
      l_collective_passports_obj  := JSON_LIST(l_movement_obj.get('collectivePassports'));
        -- collective_passports
        IF l_collective_passports_obj IS NOT NULL
        THEN
          FOR i IN 1 .. l_collective_passports_obj.count()
          LOOP
            
            l_collective_passport_obj := PLJSON(l_collective_passports_obj.get(i));
           
          l_pibics_collective_passport_img := JSON();
          l_pibics_collective_passport_img.put('fileNameImgJoinPerson' , l_collective_passport_obj.get('id').get_string() || '_img.png');
          l_pibics_collective_passport_img.put('binaryImgJoinPerson'   , convert_image(dl_bordercontrol.pkg_json_convert.convert_base64_clob_to_blob(l_collective_passport_obj.get('image').get_string())));
          l_pibics_collective_passport_img.put('fileSizeImgJoinPerson' , dbms_lob.getlength(dl_bordercontrol.pkg_json_convert.convert_base64_clob_to_blob(l_collective_passport_obj.get('image').get_string())));

          IF l_collective_passport_obj.get('sexId').get_string() IS NOT NULL
          THEN
            l_common_human_sexes := JSON_OBJECT_T.parse(dl_common.pkg_json_export.get_human_sex(l_collective_passport_obj.get('sexId').get_string()));
          ELSE
            l_common_human_sexes := JSON_OBJECT_T();
          END IF;

          l_pibics_collective_passport := JSON();
          l_pibics_collective_passport.put('joinTM6'        , l_collective_passport_obj.get('tm6No').get_string());
          l_pibics_collective_passport.put('joinFamilyName' , l_collective_passport_obj.get('lastName').get_string());
          l_pibics_collective_passport.put('joinMiddleName' , l_collective_passport_obj.get('middleName').get_string());
          l_pibics_collective_passport.put('joinGivenName'  , l_collective_passport_obj.get('firstName').get_string());
          l_pibics_collective_passport.put('joinNationality', dl_staging4pibics_intf.pkg_transcode_reverse.get_country_seqno(l_collective_passport_obj.get('nationalityId').get_string()));
          l_pibics_collective_passport.put('joinGender'     , NVL(l_common_human_sexes.get_string('icao'), 'X'));
          l_pibics_collective_passport.put('joinBirthDate'  , TO_CHAR(TO_DATE(l_collective_passport_obj.get('dateOfBirth').get_string(),'DD.MM.YYYY HH24:MI:SS'), c_pibics_date_format_slashs));
          l_pibics_collective_passport.put('relationSeqNo'  , l_collective_passport_obj.get('relationId').get_string()); 
          l_pibics_collective_passport.put('imgJoinPerson'  , l_pibics_collective_passport_img);
          l_pibics_collective_passports.append(l_pibics_collective_passport.to_json_value);
           
           END LOOP;
        END IF;
        
     -- permit info
      l_pibics_permit_info := JSON();
      IF l_visas_obj.get('permitTypeId').get_string() IS NOT NULL
      THEN
      l_pibics_permit_info.put('permitTypeSeqNo', CASE WHEN l_visas_obj.get('permitTypeId').get_string() IS NOT NULL THEN dl_staging4pibics_intf.pkg_transcode_reverse.get_permittype_seqno(l_visas_obj.get('permitTypeId').get_string()) ELSE NULL END);
      l_pibics_permit_info.put('permitSeqNo'    , '1');
      l_pibics_permit_info.put('permitDate'     , CASE WHEN l_visas_obj.get('permitTypeId').get_string() IS NOT NULL THEN TO_CHAR(TO_DATE(l_visas_obj.get('permitExpiryDate').get_string(),'DD.MM.YYYY HH24:MI:SS'), c_pibics_date_format_unformat_short) ELSE TO_CHAR(TO_DATE(l_visas_obj.get('expiryDate').get_string(),'DD.MM.YYYY HH24:MI:SS'), c_pibics_date_format_unformat_short) END );

       l_pibics_json.put('chkPermitInfo'  , l_pibics_permit_info);
      
      END IF;
        
    l_pibics_resident_info := JSON();
    begin
    SELECT RESCERTTYPE_SEQNO, RCNO_PVCD, RCNO_RUNNINGNO, RCNO_YEAR
            , TFAMILYNM, TFIRSTNM, TMIDDLENM
            into 
            l_residence_rec.RESCERTTYPE_SEQNO,
            l_residence_rec.RCNO_PVCD,
            l_residence_rec.RCNO_RUNNINGNO,
            l_residence_rec.RCNO_YEAR,
            l_residence_rec.TFAMILYNM,
            l_residence_rec.TFIRSTNM,
            l_residence_rec.TMIDDLENM
            FROM PIBICSDM2.CRS_PERSON
            WHERE CRS_STS = 'A'
            AND BIRTH_DATE = TO_CHAR(TO_DATE(l_borderdocuments_obj.get('dateOfBirthDate').get_string(),'DD.MM.YYYY HH24:MI:SS'),c_pibics_date_format_slashs)
            AND NATION_SEQNO = l_borderdocuments_obj.get('nationalityId').get_string()
            AND EFAMILYNM = l_borderdocuments_obj.get('surname').get_string()
            AND EFIRSTNM =  l_borderdocuments_obj.get('givenName').get_string()
            AND EMIDDLENM = l_borderdocuments_obj.get('middleName').get_string();
        
            exception
              when no_data_found then
                l_residence_rec.RESCERTTYPE_SEQNO := null;
            end;
            
        if ( l_residence_rec.RESCERTTYPE_SEQNO is not null) then
        l_pibics_resident_info.put('citizenIDorResidentID', l_residence_rec.RESCERTTYPE_SEQNO || l_residence_rec.RCNO_PVCD || l_residence_rec.RCNO_RUNNINGNO || '/' || l_residence_rec.RCNO_YEAR);
        l_pibics_resident_info.put('thaiFamilyName'       , l_residence_rec.TFAMILYNM);
        l_pibics_resident_info.put('thaiGivenName'        , l_residence_rec.TFIRSTNM);
        l_pibics_resident_info.put('thaiMiddleName'       , l_residence_rec.TMIDDLENM);
        end if;
    
--    if l_residense_obj.get('id').get_string() IS NOT NULL THEN
--        l_pibics_resident_info.put('citizenIDorResidentID', l_residense_obj.get('resident_no').get_string());
--        l_pibics_resident_info.put('thaiFamilyName'       , l_residense_obj.get('last_name_thai').get_string());
--        l_pibics_resident_info.put('thaiGivenName'        , l_residense_obj.get('first_name_thai').get_string());
--        l_pibics_resident_info.put('thaiMiddleName'       , l_residense_obj.get('middle_name_thai').get_string());
--    end if;
    
    END IF;
    
        -- set result json
    l_pibics_json := JSON();
    l_pibics_json.put('headerInfo'     , l_pibics_header_json);
    l_pibics_json.put('recordInfo'     , l_pibics_record_json);
    l_pibics_json.put('mrzData'     , l_pibics_mrz_json);
    l_pibics_json.put('travelEventInfo'     , l_pibics_travel_info_json);
    
    
    IF p_dml_type = 'I'
    THEN
        l_pibics_json.put('overStayInfo'     , l_pibics_overstay_json);
    
      IF l_pibics_collective_passports is not null and l_pibics_collective_passports.count() > 0
      THEN
        l_pibics_json.put('joinPassport'   , l_pibics_collective_passports);
      END IF;
    
      IF l_pibics_resident_info.count() > 0
      THEN
        l_pibics_json.put('mfaResidentInfo', l_pibics_resident_info);
      END IF;
    END IF;
    

    dbms_lob.createtemporary( l_result, true );
    l_pibics_json.to_clob( l_result, false );
    
    --dbms_output.Put_line(l_result);

    logger.append_param(l_params, 'dbms_lob.substr(l_result, 4000, 1)', dbms_lob.substr(l_result, 4000, 1));
    logger.log('GET PIBICS INOUT FORMAT FROM MOVEMENT: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('GET PIBICS INOUT FORMAT FROM MOVEMENT: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END AA_get_pibics_inout_from_movement;
  
  FUNCTION AA_get_update_inout_from_pibics (p_date in Date)
  RETURN VARCHAR2
  IS
    l_result  VARCHAR2(255);
    l_bio_pk  VARCHAR2(255);
    l_borderpost  VARCHAR2(255);
    l_conveyance  VARCHAR2(255);
    --
    l_tminout_cnt number(4);
    l_tminout_rec pibicsdm2.tminout%rowtype;
    l_movement_rec dl_bordercontrol.movements%rowtype;

  BEGIN
  
    select count(*)
    into l_tminout_cnt
    from pibicsdm2.tminout m
    where trunc(m.UPDDTE) = p_date
    and m.CREATE_DATE <> m.UPDATE_DATE;
    --and TYPEDATA like '%BIO%';
            
    if ( l_tminout_cnt > 0) then

        for l_inout_rec in (select m.SEQNO, m.TM6NO, m.CARDTYPE, m.INOUTDTE, m.DEPT_SEQNO, m.DEPTCD, m.CONV_SEQNO, m.CONVCD, m.CONVREGNO,
        m.FLIGHTPREFIX, m.FLIGHTNUMBER,m.VISATYPE_SEQNO, m.VISATYPECD, m.VISAEXPDTE, m.PERMIT_SEQNO, m.PERMITCD
        , m.NEWPERMIT, m.REMARK, m.CREATE_DATE,m.UPDATE_DATE
        FROM pibicsdm2.tminout m
        where trunc(m.UPDDTE) = p_date and m.CREATE_DATE <> m.UPDATE_DATE)
        loop
        
            l_bio_pk := DL_INTERFACE.PKG_OBJECT_HANDLING.AA_GET_BIO_PK(l_inout_rec.SEQNO);
            
            if l_bio_pk is not null then
            
            SELECT m.MVMNTID,m.BRDDOCID,m.ENTRY_FORM,m.INS_BORDERPOST,m.VISA
            INTO
            l_movement_rec.MVMNTID,l_movement_rec.BRDDOCID,l_movement_rec.ENTRY_FORM,l_movement_rec.INS_BORDERPOST,l_movement_rec.VISA
            FROM dl_bordercontrol.movements m
            where m.MVMNTID = l_bio_pk and rownum =1;
            
            dbms_output.Put_line(l_bio_pk);
            
            if l_movement_rec.MVMNTID is not null then
            
                select key_value into l_borderpost from dl_staging4pibics_intf.trcd_borderpost WHERE SEQNO = l_inout_rec.DEPT_SEQNO;
                select key_value into l_conveyance from dl_staging4pibics_intf.trcd_conveyance WHERE SEQNO = l_inout_rec.CONV_SEQNO;
                
                --dbms_output.Put_line(l_borderpost);
                --dbms_output.Put_line(l_conveyance);
                --dbms_output.Put_line(l_inout_rec.VISATYPECD);
                if l_inout_rec.VISATYPECD != '0000' then
                update dl_bordercontrol.movements 
                set DATE_OF_ENTRY = l_inout_rec.INOUTDTE
                , INS_BORDERPOST = l_borderpost
                , TRNSPRTUNITID = TO_NUMBER(l_conveyance)
                , SCANNED_FLIGHT = l_inout_rec.CONVREGNO
                , VISA_TYPE = l_inout_rec.VISATYPECD
                , DML_AT = sysdate
                where MVMNTID = l_movement_rec.MVMNTID;
                end if;
            
            end if;
            
            if l_movement_rec.ENTRY_FORM is not null then
            
                update DL_BORDERCONTROL.ENTRY_FORMS set FORM_NO = l_inout_rec.TM6NO
                , NOTE = l_inout_rec.REMARK
                where KEY_VALUE = l_movement_rec.ENTRY_FORM;
            
            end if;
            
            if l_movement_rec.VISA is not null then
            
                if l_inout_rec.VISATYPECD != '0000' then
            
                update DL_BORDERCONTROL.VISAS set VISA_TYPE = l_inout_rec.VISATYPECD
                , EXPIRY_DATE = l_inout_rec.VISAEXPDTE
                , PERMIT_TYPE = l_inout_rec.PERMIT_SEQNO
                , PERMIT_EXPIRY_DATE = l_inout_rec.NEWPERMIT
                where KEY_VALUE = l_movement_rec.VISA;
                
                end if;
            
            end if;
            
            end if;
            
        end loop;
        
        Commit;
        
    end if;
        
    RETURN l_result;
    EXCEPTION
    WHEN OTHERS
    THEN
      Rollback;
      RAISE;
    
  END AA_get_update_inout_from_pibics;
   
  FUNCTION get_pibics_crew_from_crew (p_crew_json IN dl_bordercontrol.pkg_json_convert.t_movement_json_typ
                                     ,p_dml_type IN VARCHAR2 DEFAULT 'I')
  RETURN CLOB
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'get_pibics_crew_from_crew';
    l_params logger.tab_param;
    --
    l_result CLOB;
    --
    l_pibics_json                         JSON;
    --
    l_pibics_header_json                  JSON;
    l_pibics_record_info_json             JSON;
    l_pibics_travel_conveyance_json       JSON;
    l_pibics_travel_info_json             JSON;
    l_pibics_document_img_pass_json       JSON;
    l_pibics_document_json                JSON;
    l_pibics_person_photo_json            JSON;
    l_pibics_person_json                  JSON;
    l_pibics_visa_json                    JSON;
    l_pibics_tm5_json                     JSON;
    --
    l_blob                                BLOB;
    
    l_guard_seq number;
    l_tm2_seq number;
    l_tm5_rec dl_bordercontrol.mscs_tm5%rowtype;
    l_convregNo varchar2(50);

  BEGIN

    --logger.append_param(l_params, 'dbms_lob.substr(p_crew_json, 4000, 1)', dbms_lob.substr(p_crew_json, 4000, 1));
    logger.append_param(l_params, 'p_dml_type', p_dml_type);
    logger.log('GET PIBICS CREW FROM CREW: start', l_scope, null, l_params);

    -- headerInfo
    l_pibics_header_json := JSON();
    l_pibics_header_json.put('refNo'      , TO_CHAR(SYSDATE, 'YYYYMMDD'));
    l_pibics_header_json.put('dateTime'   , TO_CHAR(SYSDATE, c_pibics_date_format_timestamp) || c_database_timezone);
    --l_pibics_header_json.put('userID'     , nvl(LOWER(trim(p_crew_json.movement.ins_by)),c_pibics_username));
    
     IF LOWER(trim(p_crew_json.movement.ins_by)) = 'jaturong.su' THEN
    l_pibics_header_json.put('userID'     , 'Jaturong.su');
    ELSIF LOWER(trim(p_crew_json.movement.ins_by)) = 'akkharadet.su' THEN
    l_pibics_header_json.put('userID'     , 'Akkharadet.su');
    ELSE
    l_pibics_header_json.put('userID'     , nvl(LOWER(trim(p_crew_json.movement.ins_by)),c_pibics_username));
    END IF;
    
    l_pibics_header_json.put('systemCode' , c_pibics_systemcode);
    l_pibics_header_json.put('module'     , 'CRW');
    l_pibics_header_json.put('ipClient'   , p_crew_json.terminal.ipaddress);

    -- record
    l_pibics_record_info_json := JSON();
    l_pibics_record_info_json.put('bioPk'       , p_crew_json.movement.mvmntid);
    l_pibics_record_info_json.put('deptSeqNo'   , nvl(dl_staging4pibics_intf.pkg_transcode_reverse.get_borderpost_seqno(p_crew_json.borderpost.key_value), 194));
    --l_pibics_record_info_json.put('zoneSeqNo'   , '');
    --l_pibics_record_info_json.put('shiftSeqNo'  , '');
    l_pibics_record_info_json.put('saveUser'    , nvl(LOWER(trim(p_crew_json.movement.ins_by)),c_pibics_username));
    l_pibics_record_info_json.put('saveDate'    , TO_CHAR(p_crew_json.movement.ins_at, c_pibics_date_format_unformat));
    l_pibics_record_info_json.put('saveIpClient', p_crew_json.terminal.ipaddress);
    
    IF p_dml_type = 'U' THEN
      l_pibics_record_info_json.put('pibicsPk'  , DL_INTERFACE.PKG_OBJECT_HANDLING.AA_GET_PIBICS_PK(p_crew_json.movement.mvmntid));
    END IF;

    -- travel info
    l_pibics_travel_conveyance_json := JSON();
    l_pibics_travel_conveyance_json.put('convSeqNo', NVL(dl_staging4pibics_intf.pkg_transcode_reverse.get_conveyance_seqno(p_crew_json.movement.trnsprtunitid), 2));
    --l_pibics_travel_conveyance_json.put('convregNo', p_crew_json.movement.scanned_flight);

    l_pibics_travel_info_json := JSON();
    l_pibics_travel_info_json.put('inDate'          , TO_CHAR(NVL(p_crew_json.movement.date_of_entry, p_crew_json.movement.movement_dt), c_pibics_date_format_unformat));
    l_pibics_travel_info_json.put('cardType'        , CASE WHEN p_crew_json.movement.exitflg = 0 THEN 1 ELSE 2 END);
    
     BEGIN
        select PIBICSPK, CONVREGNO  into l_tm2_seq, l_convregNo from (
        select PIBICSPK, CONVREGNO  
        from DL_BORDERCONTROL.MSCS_TM2
        where FLIGHTNO = p_crew_json.movement.scanned_flight
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
        where CONVREGNO = p_crew_json.movement.scanned_flight
        and TRUNC(IODTE) = TRUNC(SYSDATE)
        and CARDTYPE = CASE WHEN p_crew_json.movement.exitflg = 0 THEN 1 ELSE 2 END
        order by iodte desc)
        where rownum =1;
            exception
              when no_data_found then
                l_tm2_seq := null;
        end;
        
            if ( l_tm2_seq is not null) then
            l_pibics_travel_info_json.put('tm2InOutSeqNo'   , l_tm2_seq); 
            l_pibics_travel_conveyance_json.put('convregNo', nvl(l_convregNo,p_crew_json.movement.scanned_flight));
            else
            
                begin
                    select TM2_SEQNO, CONVREGNO into l_tm2_seq, l_convregNo from (
                    select TM2_SEQNO, CONVREGNO
                    from pibicsdm2.v_tm2_prod
                    where CONVREGNO = p_crew_json.movement.scanned_flight
                    order by iodte desc)
                    where rownum =1;
                    exception
                    when no_data_found then
                        l_tm2_seq := null;
                end;
                
                if ( l_tm2_seq is not null) then
                    l_pibics_travel_info_json.put('tm2InOutSeqNo'   , l_tm2_seq); 
                    l_pibics_travel_conveyance_json.put('convregNo', nvl(l_convregNo,p_crew_json.movement.scanned_flight));
                else
                    l_pibics_travel_info_json.put('tm2InOutSeqNo'   , ''); 
                    l_pibics_travel_conveyance_json.put('convregNo', p_crew_json.movement.scanned_flight);
                end if;

             --l_pibics_travel_info_json.put('tm2InOutSeqNo'   , ''); 
             --l_pibics_travel_conveyance_json.put('convregNo', p_crew_json.movement.scanned_flight);
            
            end if;
        
    else
    l_pibics_travel_info_json.put('tm2InOutSeqNo'   , l_tm2_seq); 
    l_pibics_travel_conveyance_json.put('convregNo', nvl(l_convregNo,p_crew_json.movement.scanned_flight));
    end if;
        

    l_pibics_travel_info_json.put('inType'          , CASE WHEN p_crew_json.borderdocument.borderdocimages.COUNT = 0 THEN 'N' ELSE 'P' END);
    l_pibics_travel_info_json.put('conveyanceInfo'  , l_pibics_travel_conveyance_json);

    -- document
    l_pibics_document_img_pass_json := JSON();
    IF p_crew_json.borderdocument.borderdocimages IS NOT NULL
    THEN

      FOR i IN 0 .. p_crew_json.borderdocument.borderdocimages.COUNT - 1
      LOOP
        IF p_crew_json.borderdocument.borderdocimages(i).seqno = 2
        THEN
          l_pibics_document_img_pass_json.put('fileNameImgPassport' , p_crew_json.movement.mvmntid || '_passPhoto.png');
          l_pibics_document_img_pass_json.put('binaryImgPassport'   , convert_image(p_crew_json.borderdocument.borderdocimages(i).image));
          l_pibics_document_img_pass_json.put('fileSizeImgPassport' , dbms_lob.getlength(p_crew_json.borderdocument.borderdocimages(i).image));
        END IF;
      END LOOP;
    END IF;

    l_pibics_document_json := JSON();
    --l_pibics_document_json.put('docType'      , dl_staging4pibics_intf.pkg_transcode_reverse.get_traveldoctype_seqno(p_crew_json.borderdocument.borderdocument.docclass));
    l_pibics_document_json.put('docType'      , '0001');
    l_pibics_document_json.put('docNumber'    , p_crew_json.borderdocument.borderdocument.docno);
    l_pibics_document_json.put('docIssueDate' , TO_CHAR(p_crew_json.borderdocument.borderdocument.manual_issuing_date, c_pibics_date_format_unformat_short));
    l_pibics_document_json.put('docExpireDate', TO_CHAR(p_crew_json.borderdocument.borderdocument.expirydate, c_pibics_date_format_unformat_short));
    l_pibics_document_json.put('imgPass'      , l_pibics_document_img_pass_json);

    -- person
    l_pibics_person_photo_json := JSON();
    l_pibics_person_photo_json.put('fileNameImgPerson' , CASE WHEN p_crew_json.movement_blobs.live_photo IS NOT NULL THEN p_crew_json.movement.mvmntid || '_livePhoto.png' ELSE NULL END);
    l_pibics_person_photo_json.put('binaryImgPerson'  , convert_image(p_crew_json.movement_blobs.live_photo));
    l_pibics_person_photo_json.put('fileSizeImgPerson', dbms_lob.getlength(p_crew_json.movement_blobs.live_photo));

    l_pibics_person_json := JSON();
    l_pibics_person_json.put('tm6Number'      , p_crew_json.entry_form.entry_form.form_no);
    l_pibics_person_json.put('countSeqNo'     , dl_staging4pibics_intf.pkg_transcode_reverse.get_country_seqno(p_crew_json.borderdocument.borderdocument.nat));
    l_pibics_person_json.put('givenName'      , p_crew_json.borderdocument.borderdocument.givenname);
    l_pibics_person_json.put('familyName'     , p_crew_json.borderdocument.borderdocument.surname);
    l_pibics_person_json.put('middleName'     , p_crew_json.borderdocument.borderdocument.middlename);
    l_pibics_person_json.put('thaiGivenName'  , p_crew_json.borderdocument.thaipassport.tfirstnm);
    l_pibics_person_json.put('thaiFamilyName' , p_crew_json.borderdocument.thaipassport.tfamilynm);
    l_pibics_person_json.put('thaiMiddleName' , p_crew_json.borderdocument.thaipassport.tmiddlenm);
    l_pibics_person_json.put('birthDate'      , TO_CHAR(p_crew_json.borderdocument.borderdocument.calc_dob, c_pibics_date_format_slashs));
    l_pibics_person_json.put('gender'         , CASE p_crew_json.borderdocument.borderdocument.sex WHEN 1 THEN 'M' WHEN 2 THEN 'F' ELSE 'X' END);
    l_pibics_person_json.put('rankCrewSeqNo'  , ''); -- TODO
    l_pibics_person_json.put('imgPerson'      , l_pibics_person_photo_json);

    -- visa
    l_pibics_visa_json := JSON();
    l_pibics_visa_json.put('visaType'       , nvl(dl_staging4pibics_intf.pkg_transcode_reverse.get_visatype_seqno(p_crew_json.visa_type.key_value),2));
    l_pibics_visa_json.put('visaExpireDate' , TO_CHAR(p_crew_json.visa_data.visa.expiry_date, c_pibics_date_format_unformat_short));
    l_pibics_visa_json.put('remark'         , NVL(p_crew_json.visa_data.visa.cancel_note, p_crew_json.visa_data.visa.release_note));

    -- tm5
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
            where (1=1) and mvmntid = p_crew_json.movement.mvmntid
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

    -- generate result JSON
    l_pibics_json := JSON();
    l_pibics_json.put('headerInfo'      , l_pibics_header_json);
    l_pibics_json.put('recordInfo'      , l_pibics_record_info_json);
    l_pibics_json.put('travelEventInfo' , l_pibics_travel_info_json);
    l_pibics_json.put('documentData'    , l_pibics_document_json);
    l_pibics_json.put('personData'      , l_pibics_person_json);
    l_pibics_json.put('visaInfo'        , l_pibics_visa_json);
    
     IF l_tm5_rec.tm5_seqno is not null
        THEN
        l_pibics_json.put('tm5Info'         , l_pibics_tm5_json);
    end if;

    dbms_lob.createtemporary( l_result, true );
    l_pibics_json.to_clob( l_result );

    logger.append_param(l_params, 'dbms_lob.substr(l_result, 4000, 1)', dbms_lob.substr(l_result, 4000, 1));
    logger.log('GET PIBICS CREW FROM CREW: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('GET PIBICS CREW FROM CREW: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END get_pibics_crew_from_crew;

  /**
   * description
   * @param parameter param_desc
   * @return return_param return_param_value
   * @throws error error_desc
   */
  FUNCTION get_pibics_crew_from_crew_manual (p_crew_json IN dl_bordercontrol.pkg_json_convert.t_movement_json_typ
                                     ,p_dml_type IN VARCHAR2 DEFAULT 'I')
  RETURN CLOB
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'get_pibics_crew_from_crew';
    l_params logger.tab_param;
    --
    l_result CLOB;
    --
    l_pibics_json                         JSON;
    --
    l_pibics_header_json                  JSON;
    l_pibics_record_info_json             JSON;
    l_pibics_travel_conveyance_json       JSON;
    l_pibics_travel_info_json             JSON;
    l_pibics_document_img_pass_json       JSON;
    l_pibics_document_json                JSON;
    l_pibics_person_photo_json            JSON;
    l_pibics_person_json                  JSON;
    l_pibics_visa_json                    JSON;
    l_pibics_tm5_json                     JSON;
    --
    l_blob                                BLOB;
    
    l_guard_seq number;
    l_tm2_seq number;
    l_tm5_rec dl_bordercontrol.mscs_tm5%rowtype;
    l_convregNo varchar2(50);

  BEGIN

    --logger.append_param(l_params, 'dbms_lob.substr(p_crew_json, 4000, 1)', dbms_lob.substr(p_crew_json, 4000, 1));
    logger.append_param(l_params, 'p_dml_type', p_dml_type);
    logger.log('GET PIBICS CREW FROM CREW: start', l_scope, null, l_params);

    -- headerInfo
    l_pibics_header_json := JSON();
    l_pibics_header_json.put('refNo'      , TO_CHAR(SYSDATE, 'YYYYMMDD'));
    l_pibics_header_json.put('dateTime'   , TO_CHAR(SYSDATE, c_pibics_date_format_timestamp) || c_database_timezone);
    l_pibics_header_json.put('userID'     , nvl(LOWER(trim(p_crew_json.movement.ins_by)),c_pibics_username));
    --l_pibics_header_json.put('userID'     , 'akkarapat.p');
    l_pibics_header_json.put('systemCode' , c_pibics_systemcode);
    l_pibics_header_json.put('module'     , 'CRW');
    l_pibics_header_json.put('ipClient'   , p_crew_json.terminal.ipaddress);

    -- record
    l_pibics_record_info_json := JSON();
    l_pibics_record_info_json.put('bioPk'       , p_crew_json.movement.mvmntid);
    l_pibics_record_info_json.put('deptSeqNo'   , nvl(dl_staging4pibics_intf.pkg_transcode_reverse.get_borderpost_seqno(p_crew_json.borderpost.key_value), 194));
    --l_pibics_record_info_json.put('zoneSeqNo'   , '');
    --l_pibics_record_info_json.put('shiftSeqNo'  , '');
    l_pibics_record_info_json.put('saveUser'    , nvl(LOWER(trim(p_crew_json.movement.ins_by)),c_pibics_username));
    --l_pibics_record_info_json.put('saveUser'    , 'akkarapat.p');
    l_pibics_record_info_json.put('saveDate'    , TO_CHAR(p_crew_json.movement.ins_at, c_pibics_date_format_unformat));
    l_pibics_record_info_json.put('saveIpClient', p_crew_json.terminal.ipaddress);

    -- travel info
    l_pibics_travel_conveyance_json := JSON();
    l_pibics_travel_conveyance_json.put('convSeqNo', NVL(dl_staging4pibics_intf.pkg_transcode_reverse.get_conveyance_seqno(p_crew_json.movement.trnsprtunitid), 2));
    l_pibics_travel_conveyance_json.put('convregNo', 'RL7561');

    l_pibics_travel_info_json := JSON();
    l_pibics_travel_info_json.put('inDate'          , TO_CHAR(NVL(p_crew_json.movement.date_of_entry, p_crew_json.movement.movement_dt), c_pibics_date_format_unformat));
    l_pibics_travel_info_json.put('cardType'        , CASE WHEN p_crew_json.movement.exitflg = 0 THEN 1 ELSE 2 END);
    
    l_pibics_travel_info_json.put('tm2InOutSeqNo'   , '5810377'); 
        
    l_pibics_travel_info_json.put('inType'          , CASE WHEN p_crew_json.borderdocument.borderdocimages.COUNT = 0 THEN 'N' ELSE 'P' END);
    l_pibics_travel_info_json.put('conveyanceInfo'  , l_pibics_travel_conveyance_json);

    -- document
    l_pibics_document_img_pass_json := JSON();
    IF p_crew_json.borderdocument.borderdocimages IS NOT NULL
    THEN

      FOR i IN 0 .. p_crew_json.borderdocument.borderdocimages.COUNT - 1
      LOOP
        IF p_crew_json.borderdocument.borderdocimages(i).seqno = 2
        THEN
          l_pibics_document_img_pass_json.put('fileNameImgPassport' , p_crew_json.movement.mvmntid || '_passPhoto.png');
          l_pibics_document_img_pass_json.put('binaryImgPassport'   , convert_image(p_crew_json.borderdocument.borderdocimages(i).image));
          l_pibics_document_img_pass_json.put('fileSizeImgPassport' , dbms_lob.getlength(p_crew_json.borderdocument.borderdocimages(i).image));
        END IF;
      END LOOP;
    END IF;

    l_pibics_document_json := JSON();
    --l_pibics_document_json.put('docType'      , dl_staging4pibics_intf.pkg_transcode_reverse.get_traveldoctype_seqno(p_crew_json.borderdocument.borderdocument.docclass));
    l_pibics_document_json.put('docType'      , '0001');
    l_pibics_document_json.put('docNumber'    , p_crew_json.borderdocument.borderdocument.docno);
    l_pibics_document_json.put('docIssueDate' , TO_CHAR(p_crew_json.borderdocument.borderdocument.manual_issuing_date, c_pibics_date_format_unformat_short));
    l_pibics_document_json.put('docExpireDate', TO_CHAR(p_crew_json.borderdocument.borderdocument.expirydate, c_pibics_date_format_unformat_short));
    l_pibics_document_json.put('imgPass'      , l_pibics_document_img_pass_json);

    -- person
    l_pibics_person_photo_json := JSON();
    l_pibics_person_photo_json.put('fileNameImgPerson' , CASE WHEN p_crew_json.movement_blobs.live_photo IS NOT NULL THEN p_crew_json.movement.mvmntid || '_livePhoto.png' ELSE NULL END);
    l_pibics_person_photo_json.put('binaryImgPerson'  , convert_image(p_crew_json.movement_blobs.live_photo));
    l_pibics_person_photo_json.put('fileSizeImgPerson', dbms_lob.getlength(p_crew_json.movement_blobs.live_photo));

    l_pibics_person_json := JSON();
    l_pibics_person_json.put('tm6Number'      , p_crew_json.entry_form.entry_form.form_no);
    l_pibics_person_json.put('countSeqNo'     , dl_staging4pibics_intf.pkg_transcode_reverse.get_country_seqno(p_crew_json.borderdocument.borderdocument.nat));
    l_pibics_person_json.put('givenName'      , p_crew_json.borderdocument.borderdocument.givenname);
    l_pibics_person_json.put('familyName'     , p_crew_json.borderdocument.borderdocument.surname);
    l_pibics_person_json.put('middleName'     , p_crew_json.borderdocument.borderdocument.middlename);
    l_pibics_person_json.put('thaiGivenName'  , p_crew_json.borderdocument.thaipassport.tfirstnm);
    l_pibics_person_json.put('thaiFamilyName' , p_crew_json.borderdocument.thaipassport.tfamilynm);
    l_pibics_person_json.put('thaiMiddleName' , p_crew_json.borderdocument.thaipassport.tmiddlenm);
    l_pibics_person_json.put('birthDate'      , TO_CHAR(p_crew_json.borderdocument.borderdocument.calc_dob, c_pibics_date_format_slashs));
    l_pibics_person_json.put('gender'         , CASE p_crew_json.borderdocument.borderdocument.sex WHEN 1 THEN 'M' WHEN 2 THEN 'F' ELSE 'X' END);
    l_pibics_person_json.put('rankCrewSeqNo'  , ''); -- TODO
    l_pibics_person_json.put('imgPerson'      , l_pibics_person_photo_json);

    -- visa
    l_pibics_visa_json := JSON();
    l_pibics_visa_json.put('visaType'       , nvl(dl_staging4pibics_intf.pkg_transcode_reverse.get_visatype_seqno(p_crew_json.visa_type.key_value),2));
    l_pibics_visa_json.put('visaExpireDate' , TO_CHAR(p_crew_json.visa_data.visa.expiry_date, c_pibics_date_format_unformat_short));
    l_pibics_visa_json.put('remark'         , NVL(p_crew_json.visa_data.visa.cancel_note, p_crew_json.visa_data.visa.release_note));

    -- tm5
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
            where (1=1) and mvmntid = p_crew_json.movement.mvmntid
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

    -- generate result JSON
    l_pibics_json := JSON();
    l_pibics_json.put('headerInfo'      , l_pibics_header_json);
    l_pibics_json.put('recordInfo'      , l_pibics_record_info_json);
    l_pibics_json.put('travelEventInfo' , l_pibics_travel_info_json);
    l_pibics_json.put('documentData'    , l_pibics_document_json);
    l_pibics_json.put('personData'      , l_pibics_person_json);
    l_pibics_json.put('visaInfo'        , l_pibics_visa_json);
    
     IF l_tm5_rec.tm5_seqno is not null
        THEN
        l_pibics_json.put('tm5Info'         , l_pibics_tm5_json);
    end if;

    dbms_lob.createtemporary( l_result, true );
    l_pibics_json.to_clob( l_result );

    logger.append_param(l_params, 'dbms_lob.substr(l_result, 4000, 1)', dbms_lob.substr(l_result, 4000, 1));
    logger.log('GET PIBICS CREW FROM CREW: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('GET PIBICS CREW FROM CREW: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END get_pibics_crew_from_crew_manual;
   
  FUNCTION get_pibics_voa_from_voa (p_voa_json IN dl_bordercontrol.pkg_json_convert.t_visa_data_typ
                                   ,p_dml_type IN VARCHAR2 DEFAULT 'I')
  RETURN CLOB
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'get_pibics_voa_from_voa';
    l_params logger.tab_param;
    --
    l_result CLOB;
    --
    l_pibics_json JSON;
    --
    l_pibics_header_json            JSON;
    l_pibics_record_json            JSON;
    l_pibics_travel_event_json      JSON;
    l_pibics_travel_conveyance_json JSON;
    l_pibics_travel_contract_json   JSON;
    l_pibics_document_json          JSON;
    l_pibics_document_img_pass_json JSON;
    l_pibics_person_json            JSON_LIST;
    l_pibics_person_record_json     JSON;
    l_pibics_person_image_json      JSON;
    l_pibics_fee_json               JSON;
    l_pibics_permit_json            JSON;
    l_common_human_sexes            JSON_OBJECT_T;
    l_bordercontrol_terminal        JSON;
    l_tmp_json                      JSON;
    --
    l_tmp_clob                      CLOB;
    --
    l_borderdocument_rec            dl_bordercontrol.pkg_json_convert.t_borderdocument_data_typ;
    l_terminal_rec                  dl_bordercontrol.pkg_json_convert.t_terminals_typ;

  BEGIN

    --logger.append_param(l_params, 'dbms_lob.substr(p_voa_json, 4000, 1)', dbms_lob.substr(p_voa_json, 4000, 1));
    logger.append_param(l_params, 'p_dml_type', p_dml_type);
    logger.log('GET PIBICS VOA FROM VOA: start', l_scope, null, l_params);

    dbms_lob.createtemporary( l_tmp_clob, true );

    -- headerInfo
    l_pibics_header_json := JSON();
    l_pibics_header_json.put('refNo'      , TO_CHAR(SYSDATE, 'YYYYMMDD'));
    l_pibics_header_json.put('dateTime'   , TO_CHAR(SYSDATE, c_pibics_date_format_timestamp) || c_database_timezone);
    l_pibics_header_json.put('userID'     , c_pibics_username);
    l_pibics_header_json.put('systemCode' , c_pibics_systemcode);
    l_pibics_header_json.put('module'     , 'VOA');

    l_tmp_json := dl_bordercontrol.pkg_json_export.get_terminals(p_voa_json.visa.ins_terminal);
    l_tmp_json.to_clob(l_tmp_clob);
    l_terminal_rec := dl_bordercontrol.pkg_json_convert.extract_terminal_from_json(l_tmp_clob);

    l_pibics_header_json.put('ipClient'   , l_terminal_rec.ipaddress);

    -- recordInfo
    l_pibics_record_json := JSON();
    l_pibics_record_json.put('bioPk'        , p_voa_json.visa.key_value);
    l_pibics_record_json.put('deptSeqNo'    , p_voa_json.visa.ins_borderpost);
    l_pibics_record_json.put('saveUser'     , p_voa_json.visa.ins_by);
    l_pibics_record_json.put('saveDate'     , TO_CHAR(p_voa_json.visa.ins_at, c_pibics_date_format_unformat));
    l_pibics_record_json.put('saveIpClient' , l_terminal_rec.ipaddress);

    -- travelEventInfo
    l_pibics_travel_event_json := JSON();
    l_pibics_travel_event_json.put('inDate'     , p_voa_json.visa.ins_at, c_pibics_date_format_unformat_short);
    l_pibics_travel_event_json.put('fromCountry', p_voa_json.visa.from_country);
    l_pibics_travel_event_json.put('initType'   , CASE WHEN p_voa_json.person.key_value IS NULL THEN 'Y' ELSE 'N' END);

      l_pibics_travel_conveyance_json := JSON();
      l_pibics_travel_conveyance_json.put('convSeqNo', NVL(dl_staging4pibics_intf.pkg_transcode_reverse.get_conveyance_seqno(p_voa_json.visa.trans_vehicle), 2));
      l_pibics_travel_conveyance_json.put('convName1', SUBSTR(p_voa_json.visa.trans_number, 1, 2));
      l_pibics_travel_conveyance_json.put('convName2', SUBSTR(p_voa_json.visa.trans_number, 3));

    l_pibics_travel_event_json.put('conveyanceInfo', l_pibics_travel_conveyance_json);

      l_pibics_travel_contract_json := JSON();
      l_pibics_travel_contract_json.put('pvSeqNo' , p_voa_json.person.ta_adm_class_province);
      l_pibics_travel_contract_json.put('ampSeqNo', p_voa_json.person.ta_adm_class_district);
      l_pibics_travel_contract_json.put('tmbSeqNo', p_voa_json.person.ta_adm_class_subdistrict);
      l_pibics_travel_contract_json.put('perAdd'  , p_voa_json.person.permanent_address);
      l_pibics_travel_contract_json.put('thaiRef' , p_voa_json.person.contact_person);
      l_pibics_travel_contract_json.put('addr'    , p_voa_json.person.ta_city);
      l_pibics_travel_contract_json.put('road'    , p_voa_json.person.ta_street);
      --l_pibics_travel_contract_json.put('postCode', '');
      l_pibics_travel_contract_json.put('tel'     , p_voa_json.person.phone_number);

    l_pibics_travel_event_json.put('contractInfo', l_pibics_travel_contract_json);

    -- documentData
    l_tmp_json := dl_bordercontrol.pkg_json_export.get_borderdocuments(p_voa_json.visa.borderdocument);
    l_tmp_json.to_clob(l_tmp_clob);
    l_borderdocument_rec := dl_bordercontrol.pkg_json_convert.extract_borderdocument_from_json(l_tmp_clob);

    l_pibics_document_json := JSON();
    l_pibics_document_json.put('docNumber'    , l_borderdocument_rec.borderdocument.docno);
    l_pibics_document_json.put('docExpireDate', TO_CHAR(l_borderdocument_rec.borderdocument.expirydate, c_pibics_date_format_unformat_short));
    l_pibics_document_json.put('docPlace'     , l_borderdocument_rec.borderdocument.nat);

    CASE
      WHEN l_borderdocument_rec.borderdocument.manual_issuing_date IS NOT NULL
      THEN
        l_pibics_document_json.put('docIssueDate' , TO_CHAR(l_borderdocument_rec.borderdocument.manual_issuing_date, c_pibics_date_format_unformat_short));
      ELSE NULL;
    END CASE;

      IF l_borderdocument_rec.borderdocimages IS NOT NULL
      THEN

        l_pibics_document_img_pass_json := JSON();

        FOR i IN 0 .. l_borderdocument_rec.borderdocimages.COUNT - 1
        LOOP
          IF l_borderdocument_rec.borderdocimages(i).seqno = 2
          THEN
            l_pibics_document_img_pass_json.put('fileNameImgPassport' , l_borderdocument_rec.borderdocument.brddocid || '_pass.png');
            l_pibics_document_img_pass_json.put('binaryImgPassport'   , PLJSON(convert_image(l_borderdocument_rec.borderdocimages(i).image)));
            l_pibics_document_img_pass_json.put('fileSizeImgPassport' , dbms_lob.getlength(l_borderdocument_rec.borderdocimages(i).image));
          END IF;
        END LOOP;
      END IF;

    CASE
      WHEN l_pibics_document_img_pass_json IS NOT NULL
      THEN
        l_pibics_document_json.put('imgPass', l_pibics_document_img_pass_json);
      ELSE NULL;
    END CASE;

    -- permitInfo
    l_pibics_permit_json := JSON();
    l_pibics_permit_json.put('visaType'   , p_voa_json.visa.visa_type);
    l_pibics_permit_json.put('voaDate'    , to_char(p_voa_json.visa.issuing_date, c_pibics_date_format_unformat_short));
    l_pibics_permit_json.put('permitDate' , to_char(p_voa_json.receipt.permit_date, c_pibics_date_format_unformat_short));
    l_pibics_permit_json.put('approve'    , p_voa_json.visa.status);
    --l_pibics_permit_json.put('proveID'    , '');
    --l_pibics_permit_json.put('proveBy'    , '');
    l_pibics_permit_json.put('reson'      , p_voa_json.visa.release_note);
    l_pibics_permit_json.put('delRemark'  , p_voa_json.visa.cancel_note);
    l_pibics_permit_json.put('payStatus'  , p_voa_json.visa.payment_status);
    l_pibics_permit_json.put('printSlip'  , p_voa_json.visa.status_print_form);

    -- personData
    l_pibics_person_json := JSON_LIST();

      l_pibics_person_record_json := JSON();
      l_pibics_person_record_json.put('tm6Number'       , p_voa_json.person.tm6_no);
      l_pibics_person_record_json.put('nationality'     , p_voa_json.person.nationality);
      l_pibics_person_record_json.put('familyName'      , p_voa_json.person.last_name);
      l_pibics_person_record_json.put('givenName'       , p_voa_json.person.first_name);
      l_pibics_person_record_json.put('middleName'      , p_voa_json.person.middle_name);
      l_pibics_person_record_json.put('suffixName'      , p_voa_json.person.salutation);
      l_pibics_person_record_json.put('birthDate'       , TO_CHAR(p_voa_json.person.date_of_birth, c_pibics_date_format_slashs));

      IF p_voa_json.person.sex IS NOT NULL
      THEN
        l_common_human_sexes := JSON_OBJECT_T.parse(dl_common.pkg_json_export.get_human_sex(p_voa_json.person.sex));
      ELSE
        l_common_human_sexes := JSON_OBJECT_T();
      END IF;

      l_pibics_person_record_json.put('gender'          , NVL(l_common_human_sexes.get_string('icao'), 'X'));
      l_pibics_person_record_json.put('sts'             , 'A');
      l_pibics_person_record_json.put('relationPassJoin', p_voa_json.person.relation);

      IF p_voa_json.person.image IS NOT NULL
      THEN
          l_pibics_person_image_json := JSON();
          l_pibics_person_image_json.put('fileNameImgPerson', p_voa_json.person.key_value || '_person.png');
          l_pibics_person_image_json.put('binaryImgPerson'  , PLJSON(convert_image(p_voa_json.person.image)));
          l_pibics_person_image_json.put('fileSizeImgPerson', dbms_lob.getlength(p_voa_json.person.image));

        l_pibics_person_record_json.put('imgPerson', l_pibics_person_image_json);
      END IF;

      l_pibics_person_record_json.put('visaNo', p_voa_json.visa.visa_number);

        l_pibics_fee_json := JSON();
        l_pibics_fee_json.put('feeNo'         , p_voa_json.receipt.key_value);
        l_pibics_fee_json.put('feeSlipNo'     , p_voa_json.receipt.receipt_number);
        l_pibics_fee_json.put('feeSlipBookNo' , p_voa_json.receipt.booking_number);
        l_pibics_fee_json.put('prateSeqNo'    , '1');
        l_pibics_fee_json.put('feeSlipAmount' , to_char(p_voa_json.receipt.total_costs));

      l_pibics_person_record_json.put('fee', l_pibics_fee_json);

      l_pibics_person_record_json.put('occSeqNo', dl_staging4pibics_intf.pkg_transcode_reverse.get_occupation_seqno(p_voa_json.person.profession));

    l_pibics_person_json.append(l_pibics_person_record_json.to_json_value);

    l_pibics_json := JSON();
    l_pibics_json.put('headerInfo'      , l_pibics_header_json);
    l_pibics_json.put('recordInfo'      , l_pibics_record_json);
    l_pibics_json.put('travelEventInfo' , l_pibics_travel_event_json);
    l_pibics_json.put('documentData'    , l_pibics_document_json);
    l_pibics_json.put('personData'      , l_pibics_person_json);
    l_pibics_json.put('permitInfo'      , l_pibics_permit_json);

    dbms_lob.createtemporary( l_result, true );
    l_pibics_json.to_clob( l_result );

    logger.append_param(l_params, 'dbms_lob.substr(l_result, 4000, 1)', dbms_lob.substr(l_result, 4000, 1));
    logger.log('GET PIBICS VOA FROM VOA: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('GET PIBICS VOA FROM VOA: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END get_pibics_voa_from_voa;

  FUNCTION del_pibics_inout_from_movement (p_movement_json  IN dl_bordercontrol.pkg_json_convert.t_movement_json_typ)
  RETURN CLOB
  IS

    l_scope   logger_logs.scope%type := c_scope_prefix || 'del_pibics_inout_from_movement';
    l_params  logger.tab_param;
    --
    l_result  CLOB;
    --
    l_pibics_json                     JSON;
    l_pibics_header_json              JSON;
    l_pibics_record_json              JSON;
    l_pibics_records_json     JSON_LIST;
  BEGIN

    --logger.append_param(l_params, 'dbms_lob.substr(p_movement_json, 4000, 1)', dbms_lob.substr(p_movement_json, 4000, 1));
    logger.append_param(l_params, 'p_dml_type', 'U');
    logger.log('DEL PIBICS INOUT FORMAT FROM MOVEMENT: start', l_scope, null, l_params);

    --
    -- headerInfo
    l_pibics_header_json := JSON();
    l_pibics_header_json.put('refNo'      , TO_CHAR(SYSDATE, 'YYYYMMDD'));
    l_pibics_header_json.put('dateTime'   , TO_CHAR(SYSDATE, c_pibics_date_format_timestamp) || c_database_timezone);
    l_pibics_header_json.put('userID'     , nvl(LOWER(trim(p_movement_json.movement.ins_by)),c_pibics_username));
    l_pibics_header_json.put('systemCode' , c_pibics_systemcode);
    l_pibics_header_json.put('module'     , 'INOUT');
    l_pibics_header_json.put('ipClient'   , p_movement_json.terminal.ipaddress);

    -- record
    l_pibics_records_json := JSON_LIST();
    l_pibics_record_json := JSON();
    l_pibics_record_json.put('bioPk'      , p_movement_json.movement.mvmntid);
    l_pibics_record_json.put('pibicsPk'  , DL_INTERFACE.PKG_OBJECT_HANDLING.AA_GET_PIBICS_PK(p_movement_json.movement.mvmntid));
    l_pibics_record_json.put('createUser' , nvl(LOWER(trim(p_movement_json.movement.ins_by)),c_pibics_username));
    
    l_pibics_records_json.append(l_pibics_record_json.to_json_value);

    -- set result json
    l_pibics_json := JSON();
    l_pibics_json.put('headerInfo'     , l_pibics_header_json);
    l_pibics_json.put('recordInfo'     , l_pibics_records_json);
    --l_pibics_json.put('recordInfo'     , l_pibics_record_json);

    dbms_lob.createtemporary( l_result, true );
    l_pibics_json.to_clob( l_result, false );

    logger.append_param(l_params, 'dbms_lob.substr(l_result, 4000, 1)', dbms_lob.substr(l_result, 4000, 1));
    logger.log('DEL PIBICS INOUT FORMAT FROM MOVEMENT: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('DEL PIBICS INOUT FORMAT FROM MOVEMENT: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END del_pibics_inout_from_movement;
END;
/
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_OBJECT_HANDLING" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_OBJECT_HANDLING" TO "APPSUP";
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_OBJECT_HANDLING" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_OBJECT_HANDLING" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_OBJECT_HANDLING" TO "DL_BORDERCONTROL";
