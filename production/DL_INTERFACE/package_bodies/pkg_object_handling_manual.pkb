CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_INTERFACE"."PKG_OBJECT_HANDLING_MANUAL" IS

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
    l_pibics_header_json.put('userID'     , nvl(trim(p_crew_json.movement.ins_by),c_pibics_username));
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

END;
/
