CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_BMBS_APEX_UTIL" IS
/*******************************************************************************
 * This package provides several functions that are called from the apex application
 * 500 (BMBS)
 *
 * Author    Date         Description
 * --------  ----------   -------------------------------------------------------*
 * CHageman   14.09.2018  Added
 * M. Langer  29.11.2018  Bugfix THA20675-2100 at Line 207 "date_of_expiry = l_expiry_date" changed to "date_of_expiry = to_date(l_expiry_date, 'YYMMDD')"
 * M. Langer  12.01.2019  Bugfix THA20675-2348 see from line 311, comment out the follow lines because side effects occurs when get last- middle- and firstname from passport on page 17, now we spliting for malysian passports the lastname in last, first and middlename see THA20675-2348
 * MStephan   17.04.2019  Added bmbs_insert_travel_abis
 * MSCS       19.07.2019  Added Partial DOB capability
 *******************************************************************************/

   c_scope_prefix         CONSTANT VARCHAR2(31) := lower($$plsql_unit) || '.';
   g_commit_apex_session  BOOLEAN := FALSE;
   g_p17_tmp_nationality  VARCHAR2(250 CHAR);
   g_p17_tmp_expirydate   VARCHAR2(50 CHAR);

  /**
   * Calculates several information and set those information into the global variables array
   */
  PROCEDURE p17_calc_after_submit_passport
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'p17_calc_after_submit_passport';
    l_params logger.tab_param;
    --
    l_expiry_date   DATE;
    l_date_of_birth DATE;
    -- partial dob vars
    l_dob_partial       DL_BORDERCONTROL.CT_PARTIAL_DATE_TYPE;
    l_is_dob_partial    PLS_INTEGER := 0;
    --
    l_arrive_visa   NUMBER;
    l_arrive_tc     NUMBER;
    l_depart_visa   NUMBER;
    l_depart_tc     NUMBER;
    --
    l_dg_dateofbirth    VARCHAR2(10) := TRIM(v('DG_DATEOFBIRTH'));

  BEGIN

    logger.log('P17 - CALC AFTER SUBMIT PASSPORT: start', l_scope, null, l_params);

    -- set document class item
    if length(v('P17_DISPLAY_DOCTYPE')) > 0 and substr(upper(v('P17_DISPLAY_DOCTYPE')), 1, 1) = 'P' then
      apex_util.set_session_state('P17_DISPLAY_DOCCLASS', 1, g_commit_apex_session);
    end if;

    -- set if checks were okay
    IF (v('DG_CHECKRESULTDATEOFBIRTH') = 'true'    AND
        v('DG_CHECKRESULTDOCUMENTNUMBER') = 'true' AND
        v('DG_CHECKRESULTEXPIRATIONDATE') = 'true' AND
        v('DG_CHECKRESULTFINAL') = 'true')
    THEN
      apex_util.set_session_state('CHECK_CHECKSUMS_OK', '1', g_commit_apex_session);
    END IF;

    -- set date fields
    l_expiry_date := nvl(pkg_common.parse_date(v('DG_EXPIRATIONDATE'), 0, 1, 20, 1), pkg_common.parse_date(v('DG_EXPIRATIONDATE'), 1, 0, 0, 1));
    g_p17_tmp_expirydate := TO_CHAR(l_expiry_date, 'DDMMYYYYHH24MI');

    -- replaced by partial dob logic
    /*
    l_date_of_birth := pkg_common.parse_date(v('DG_DATEOFBIRTH'), 1, 0, 0, 1);
    */

    -- partial DOB
    -- init
    l_dob_partial := DL_BORDERCONTROL.CT_PARTIAL_DATE_TYPE(0, 0, 0);
    IF l_dg_dateofbirth IS NOT NULL THEN
        l_dob_partial := pkg_common.Get_Partial_Date(l_dg_dateofbirth, 1, 0, 0, 1);
        IF l_dob_partial.isValidDate() = 1 THEN
            l_date_of_birth := l_dob_partial.getDate();
        ELSE
            l_is_dob_partial := 1;
        END IF;
    END IF;

    g_p17_tmp_nationality := NVL(v('P17_NATIONALITY'), v('P17_NATIONALITY_ID'));

    logger.append_param(l_params, 'g_p17_tmp_expirydate', g_p17_tmp_expirydate);
    logger.append_param(l_params, 'g_p17_tmp_nationality', g_p17_tmp_nationality);
    logger.append_param(l_params, 'l_is_dob_partial', l_is_dob_partial);

    -- set several fields and information
    apex_util.set_session_state('P17_DOB_ABIS', CASE l_is_dob_partial WHEN 0 THEN TO_CHAR(l_date_of_birth, 'RRRR-MM-DD') ELSE l_dob_partial.getFormatData('YYYY-MM-DD') END, g_commit_apex_session);
    apex_util.set_session_state('P17_EXPIRATIONDATE_ABIS', TO_CHAR(l_expiry_date ,'RRRR-MM-DD'), g_commit_apex_session);
    apex_util.set_session_state('P17_SEND_IMAGE_ABIS', 'NULL', g_commit_apex_session);
    apex_util.set_session_state('P17_SEND_FINGER_ABIS', 'NULL', g_commit_apex_session);
    --MSCS--apex_util.set_session_state('P17_DISPLAY_DOB', CASE l_is_dob_partial WHEN 0 THEN TO_CHAR(l_date_of_birth, 'DD/MM/YYYY') ELSE l_dob_partial.getFormatData('DD/MM/YYYY') END, g_commit_apex_session);
    apex_util.set_session_state('P17_DISPLAY_DOB_TEXT', CASE l_is_dob_partial WHEN 0 THEN TO_CHAR(l_date_of_birth, 'DD/MM/YYYY') ELSE l_dob_partial.getFormatData('DD/MM/YYYY') END, g_commit_apex_session);
    apex_util.set_session_state('P17_DISPLAY_EXPIRYDATE', to_char(l_expiry_date, 'DD/MM/YYYY'), g_commit_apex_session);

    -- set pass detection notice
    apex_util.set_session_state('P17_PASS_DETECTED', 1, g_commit_apex_session);

    -- set some other calculation variables
    apex_util.set_session_state('P17_GENDER_ABIS', case v('P17_DISPLAY_GENDER') when 1 then 'M' when 2 then 'F' else 'O' end, g_commit_apex_session);
    apex_util.set_session_state('DG_EXPIRATIONDATE', to_char(l_expiry_date, 'YYMMDD'), g_commit_apex_session);
    apex_util.set_session_state('DG_DATEOFBIRTH', CASE l_is_dob_partial WHEN 0 THEN TO_CHAR(l_date_of_birth, 'YYMMDD') ELSE l_dob_partial.getFormatData('YYMMDD') END, g_commit_apex_session);

    -- search for several information
    /*
    if v('MOVEMENT_ENTRY_EXIT') = 1 then
      --DL_MOVEMENTHANDLING.Load_Visa_Data_On_Departure(v('P17_DISPLAY_DOCNUMBER'), v('AI_TRANSPORT_MODE'), g_p17_tmp_nationality, v('P17_DISPLAY_EXPIRYDATE'));
      --DL_MOVEMENTHANDLING.Load_Entry_Form_On_Departure(v('P17_DISPLAY_DOCNUMBER'), v('AI_TRANSPORT_MODE'), g_p17_tmp_nationality, v('P17_DISPLAY_EXPIRYDATE'));

      DL_MOVEMENTHANDLING.Load_Data_On_Departure
      (
          p_DOCNO       => v('P17_DISPLAY_DOCNUMBER')
          ,p_ISSUECTRY  => g_p17_tmp_nationality
          ,p_EXPIRYDATE => v('P17_DISPLAY_EXPIRYDATE')
          ,p_GENDER     => v('P17_DISPLAY_GENDER')
          ,p_DOB        => v('P17_DISPLAY_DOB')
          ,p_SURNAME    => v('P17_DISPLAY_LASTNAME')
          ,p_GIVENNAME  => v('P17_DISPLAY_FIRSTNAME')
          ,p_MIDDLENAME => v('P17_DISPLAY_MIDDLENAME')
      );
    end if;
    */

    -- set requirement for scanning travel card and visa depending on travel direction and document issuing country
    begin
      select need_visum, need_lc into l_arrive_visa, l_arrive_tc from country_management where coutry_code = NVL(v('DG_ISSUINGSTATECODE'), v('P17_NATIONALITY')) and direction = 0;
    exception when no_data_found then
      l_arrive_visa := 0; --to_number(pkg_common.get_parameter('DEFAULT_SCAN_VISA'));
      l_arrive_tc := 0; --to_number(pkg_common.get_parameter('DEFAULT_SCAN_TC'));
    end;
    begin
      select need_visum, need_lc into l_depart_visa, l_depart_tc from country_management where coutry_code = NVL(v('DG_ISSUINGSTATECODE'), v('P17_NATIONALITY')) and direction = 1;
    exception when no_data_found then
      l_depart_visa := 0; --to_number(pkg_common.get_parameter('DEFAULT_SCAN_VISA'));
      l_depart_tc := 0; --to_number(pkg_common.get_parameter('DEFAULT_SCAN_TC'));
    end;
    apex_util.set_session_state('P17_ARRIVAL_LC_NEEDED', l_arrive_tc, g_commit_apex_session);
    apex_util.set_session_state('P17_ARRIVAL_VISA_NEEDED', l_arrive_visa, g_commit_apex_session);
    apex_util.set_session_state('P17_DEPARTURE_LC_NEEDED', l_depart_tc, g_commit_apex_session);
    apex_util.set_session_state('P17_DEPARTURE_VISA_NEEDED', l_depart_visa, g_commit_apex_session);

    logger.log('P17 - CALC AFTER SUBMIT PASSPORT: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('P17 - CALC AFTER SUBMIT PASSPORT: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END p17_calc_after_submit_passport;


  PROCEDURE p17_create_document_after_submit_passport
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'p17_create_document_after_submit_passport';
    l_params logger.tab_param;
    --
    l_expiry_date DATE := TO_DATE(g_p17_tmp_expirydate, 'DDMMYYYYHH24MI');
    l_brddocid    dl_bordercontrol.borderdocuments.brddocid%TYPE;
    l_identity    dl_bordercontrol.identities.identity%TYPE;
    l_stateless   dl_bordercontrol.borderdocuments.nat%TYPE;

  BEGIN

    logger.log('CREATE BORDERDOCUMENT AFTER SUBMIT PASSPORT: start', l_scope, null, l_params);

    l_brddocid := PKG_BORDERDOCUMENTS.Create_Document(
                    P_DOCNO               => v('P17_DISPLAY_DOCNUMBER'),
                    P_DOCTYPE             => v('P17_DISPLAY_DOCTYPE'),
                    P_ISSUECTRY           => g_p17_tmp_nationality,
                    P_EXPIRYDATE          => l_expiry_date,
                    P_SURNAME             => v('P17_DISPLAY_LASTNAME'),
                    P_GIVENNAME           => v('P17_DISPLAY_FIRSTNAME'),
                    P_MIDDLENAME          => v('P17_DISPLAY_MIDDLENAME'),
                    P_SEX                 => v('P17_DISPLAY_GENDER'),
                    P_DOB                 => v('DG_DATEOFBIRTH'),
                    P_MRZDG1              => v('DG_MRZ'),
                    P_INS_TERMINAL        => v('AI_TERMINAL_ID'),
                    P_INS_BORDERPOST      => v('AI_BORDERPOST_ID'),
                    P_Img_VISUAL_FACE     => PKG_APEX_UTIL.COLL_Get_BLOB001('PASS_VISUAL_FACE'), -- several Collections are called (more performance possible?)
                    P_Img_ICAO_FACE       => PKG_APEX_UTIL.COLL_Get_BLOB001('PASS_ICAO_FACE'),
                    P_Img_VISUALPAGE      => PKG_APEX_UTIL.COLL_Get_BLOB001('PASS_VISUALPAGE'),
                    P_Img_UVPAGE          => null,
                    P_Img_IRPAGE          => null,
                    P_Img_DG3_0           => PKG_APEX_UTIL.COLL_Get_BLOB001('PASS_DG3_0'),
                    P_Img_DG3_1           => PKG_APEX_UTIL.COLL_Get_BLOB001('PASS_DG3_1'),
                    P_MANUAL_EXPIRY_DATE  => v('DG_SCANNED_EXPIRYDATE'),
                    P_MANUAL_ISSUING_DATE => v('P17_DATEOFISSUE'),
                    P_MANUAL_NATIONALITY  => g_p17_tmp_nationality,
                    P_MANUAL_PLACEOFBIRTH => v('P17_PLACEOFBIRTH'),
                    P_DOCCLASS            => v('P17_DISPLAY_DOCCLASS'),
                    X_IDENTITY            => l_identity
                  );

    update movements set BRDDOCID = l_brddocid where MVMNTID = v('P17_MVMNTID');
    apex_util.set_session_state('P17_BRDDOCID', l_brddocid, g_commit_apex_session);
    apex_util.set_session_state('P17_BRDDOC_IDENTITY', l_identity, g_commit_apex_session);

    logger.log('P17 - CREATE BORDERDOCUMENT AFTER SUBMIT PASSPORT: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('P17 - CREATE BORDERDOCUMENT AFTER SUBMIT PASSPORT: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END p17_create_document_after_submit_passport;

  /**
   * Checks information like extended stays or lost passports or blacklist entries
   * Actual the
   * @param parameter param_desc
   * @throws error error_desc
   */
  PROCEDURE p17_check_warning_information
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'p17_check_warning_information';
    l_params logger.tab_param;
    --
    l_expiry_date varchar2(6);
    --
    l_passport_isvoid                 VARCHAR2(250 CHAR);
    l_passport_isstolen               VARCHAR2(250 CHAR);
    l_passport_void_passport_remarks  VARCHAR2(250 CHAR);
    l_extendstay_until                VARCHAR2(250 CHAR);
    l_passport_iswatchlist            VARCHAR2(250 CHAR);

  BEGIN

    logger.log('CHECK WARNING INFORMATION: start', l_scope, null, l_params);

    l_expiry_date := to_char(nvl(pkg_common.tolerant_to_date(v('P17_MANUAL_EXPIRYDATE'), 'DD/MM/RRRR'), pkg_common.tolerant_to_date(v('P17_DISPLAY_EXPIRYDATE'), 'DD/MM/RRRR')), 'YYMMDD');

    select is_lost
          , is_stolen
          , remarks
    into  l_passport_isvoid
        , l_passport_isstolen
        , l_passport_void_passport_remarks
    from ( select 1 is_lost
                , 0 is_stolen
                , notice remarks
        --from x_void_passport
        from dl_blacklist.lost_passports_for_existence_check
       where doc_number = v('P17_DISPLAY_DOCNUMBER')
         and issuing_country = v('P17_NATIONALITY_ID')
         and (
               date_of_expiry = to_date(l_expiry_date, 'YYMMDD')
            or date_of_expiry is null
         )
       union all
        select 0, 0, null from dual
    )
    where rownum < 2;

    apex_util.set_session_state('P17_PASSPORT_ISVOID', l_passport_isvoid, g_commit_apex_session);
    apex_util.set_session_state('P17_PASSPORT_ISSTOLEN', l_passport_isstolen, g_commit_apex_session);
    apex_util.set_session_state('P17_VOID_PASSPORT_REMARKS', l_passport_void_passport_remarks, g_commit_apex_session);

    select max(extendstay_until)
    into l_extendstay_until
    from x_extendstay
    where docno = v('P17_DISPLAY_DOCNUMBER')
      and issuingcountry = v('P17_NATIONALITY_ID')
      and expirydate = l_expiry_date
    ;

    apex_util.set_session_state('P17_EXTENDSTAY_UNTIL', l_extendstay_until, g_commit_apex_session);

    select max(is_watchlist)
    into l_passport_iswatchlist
    from (select 1 is_watchlist
            from x_watchlist_passport
           where docnumber = v('P17_DISPLAY_DOCNUMBER')
             and issuingcountry = v('P17_NATIONALITY_ID')
             and (expirydate = l_expiry_date
              or  expirydate is null)
    );

    apex_util.set_session_state('P17_PASSPORT_ISWATCHLIST', l_passport_iswatchlist, g_commit_apex_session);

    logger.log('CHECK WARNING INFORMATION: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('CHECK WARNING INFORMATION: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END p17_check_warning_information;

  /**
   * Validates the demographic input information if a relevant field or item was changed
   *
   */
  PROCEDURE p17_validate_demographic_input
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'p17_validate_demographic_input';
    l_params logger.tab_param;
    --
    l_expirydate    DATE;
    l_extexpirydate DATE;
    l_dateofbirth   DATE;
    -- partial dob vars
    l_dob_partial       DL_BORDERCONTROL.CT_PARTIAL_DATE_TYPE;
    l_is_dob_partial    PLS_INTEGER := 0;
    --
    l_monthsremain          PLS_INTEGER;
    l_monthsremain_valid    VARCHAR2(50 CHAR);
    l_monthsremain_expired  PLS_INTEGER;
    --
    l_borderdocument_rec      borderdocuments%ROWTYPE;
    l_residence_rec           residence%ROWTYPE;
    l_movement_rec            movements%ROWTYPE;
    l_country_management_rec  country_management%ROWTYPE;
    --
    l_separator             varchar2(1) := unistr('\005C');
    --
    l_last_movement_info    dl_movementhandling.last_movement_info_rec_typ;
    --
    l_p17_display_dob_text  VARCHAR2(10) := TRIM(v('P17_DISPLAY_DOB_TEXT'));
    --

  BEGIN

    --submit
    -- P17_DISPLAY_EXPIRYDATE,P17_MANUAL_EXPIRYDATE,P17_DISPLAY_DOB_TEXT,P17_NATIONALITY,P17_DISPLAY_DOCNUMBER,P17_MVMNTID,P17_DISPLAY_DOCTYPE,P17_DISPLAY_DOCCLASS

    -- return
    -- P17_DISPLAY_DOCTYPE,P17_DISPLAY_LASTNAME,P17_DISPLAY_FIRSTNAME,P17_DISPLAY_MIDDLENAME,P17_DISPLAY_DOB_TEXT,P17_DISPLAY_GENDER,P17_DISPLAY_DOCCLASS,P17_MANUAL_EXPIRYDATE,P17_AGE_MANUEL
    -- P17_VALID,CHECK_ISPASSPORTEXPIRED,P17_DISPLAY_TEXT,P17_DISPLAY_MESSAGE_CAPTURE_RIGHT,P17_DISPLAY_MESSAGE_CAPTURE_LEFT,P17_DISPLAY_MESSAGE_CAPTURE_THUMBS,P17_HEALTHCHECK_COUNTRY
    -- P17_RESIDENT_TYPE,P17_RESIDENT_NUMBER,P17_LAST_NAME_RI,P17_FIRST_NAME_RI,P17_MIDDLE_NAME_RI,P17_LAST_DIRECTION,P17_LAST_STATELESS

    l_expirydate := COALESCE(pkg_common.parse_date(v('P17_DISPLAY_EXPIRYDATE'), 0, 1, 20, 1)
                            ,pkg_common.parse_date(v('P17_DISPLAY_EXPIRYDATE'), 1, 0, 0, 1)
                            ,pkg_common.tolerant_to_date(v('P17_DISPLAY_EXPIRYDATE'), 'DD/MM/YYYY'));

    l_extexpirydate := COALESCE(pkg_common.parse_date(v('P17_MANUAL_EXPIRYDATE'), 0, 1, 20, 1)
                               ,pkg_common.parse_date(v('P17_MANUAL_EXPIRYDATE'), 1, 0, 0, 1)
                               ,pkg_common.tolerant_to_date(v('P17_MANUAL_EXPIRYDATE'), 'DD/MM/YYYY'));

    -- partial DOB
    -- init
    l_dob_partial := DL_BORDERCONTROL.CT_PARTIAL_DATE_TYPE(0, 0, 0);
    IF l_p17_display_dob_text IS NOT NULL THEN
        l_dob_partial := pkg_common.Get_Partial_Date(l_p17_display_dob_text, 1, 0, 0, 1);
        IF l_dob_partial.isValidDate() = 1 THEN
            l_dateofbirth := l_dob_partial.getDate();
        ELSE
            l_is_dob_partial := 1;
        END IF;
    END IF;
    
    -- replaced by partial dob logic
    /*
    l_dateofbirth := COALESCE(pkg_common.parse_date(v('P17_DISPLAY_DOB'), 1, 0, 0, 1)
                             ,pkg_common.tolerant_to_date(v('P17_DISPLAY_DOB'), 'DD/MM/YYYY'));
    */

    l_borderdocument_rec := pkg_borderdocuments.get_document_rec(v('P17_DISPLAY_DOCNUMBER'), v('P17_NATIONALITY'), l_expirydate);

    -- check and get borderdocument information
    IF l_borderdocument_rec.docno IS NOT NULL
    THEN

      -- partial DOB
      IF l_dob_partial.isNull() = 1 AND l_borderdocument_rec.dob IS NOT NULL THEN
        l_dob_partial := pkg_common.Get_Partial_Date(l_borderdocument_rec.dob, 1, 0, 0, 1);
        IF l_dob_partial.isValidDate() = 1 THEN
            l_dateofbirth := l_dob_partial.getDate();
        ELSE
            l_is_dob_partial := 1;
        END IF;
      END IF;
      
      -- replaced by partial dob logic
      /*
      l_dateofbirth := NVL(l_dateofbirth, pkg_common.parse_date(l_borderdocument_rec.dob, 1, 0, 0, 1));
      */

      apex_util.set_session_state('P17_DISPLAY_DOCTYPE', l_borderdocument_rec.doctype, g_commit_apex_session);
      apex_util.set_session_state('P17_DISPLAY_LASTNAME', l_borderdocument_rec.surname, g_commit_apex_session);
      apex_util.set_session_state('P17_DISPLAY_FIRSTNAME', regexp_replace(l_borderdocument_rec.givenname, '^([^ ]+).*', '\1'), g_commit_apex_session);
      apex_util.set_session_state('P17_DISPLAY_MIDDLENAME', NVL(l_borderdocument_rec.middlename, CASE WHEN INSTR(TRIM(l_borderdocument_rec.givenname), ' ') > 0 THEN regexp_replace(l_borderdocument_rec.givenname, '^[^ ]+ (.+)', '\1') ELSE NULL END), g_commit_apex_session);
      --apex_util.set_session_state('P17_DISPLAY_DOB', CASE l_is_dob_partial WHEN 0 THEN TO_CHAR(l_dateofbirth, 'DD/MM/YYYY') ELSE l_dob_partial.getFormatData('DD/MM/YYYY') END, g_commit_apex_session);
      apex_util.set_session_state('P17_DISPLAY_DOB_TEXT', CASE l_is_dob_partial WHEN 0 THEN TO_CHAR(l_dateofbirth, 'DD/MM/YYYY') ELSE l_dob_partial.getFormatData('DD/MM/YYYY') END, g_commit_apex_session);
      apex_util.set_session_state('P17_DISPLAY_GENDER', l_borderdocument_rec.sex, g_commit_apex_session);
      apex_util.set_session_state('P17_MANUAL_EXPIRYDATE', l_borderdocument_rec.manual_expiry_date, g_commit_apex_session);

      IF length(l_borderdocument_rec.doctype) >= 1              AND
         upper(substr(l_borderdocument_rec.doctype, 1, 1)) = 'P'
      THEN
            apex_util.set_session_state('P17_DISPLAY_DOCCLASS', 1, g_commit_apex_session);
      END IF;

      IF l_borderdocument_rec.manual_expiry_date IS NOT NULL THEN
        l_extexpirydate := l_borderdocument_rec.manual_expiry_date;
      END IF;

      -- stateless
      IF l_borderdocument_rec.issuectry != l_borderdocument_rec.nat AND l_borderdocument_rec.nat LIKE 'XX%' THEN
        --apex_util.set_session_state('P17_STATELESS', l_borderdocument_rec.nat, g_commit_apex_session);
        apex_util.set_session_state('P17_LAST_STATELESS', l_borderdocument_rec.nat, g_commit_apex_session);
      END IF;

    ELSE
      apex_util.set_session_state('P17_MANUAL_EXPIRYDATE', NULL, g_commit_apex_session);
    END IF;

    -- partial DOB
    CASE l_is_dob_partial
        WHEN 0 THEN
            IF l_dateofbirth IS NOT NULL
            THEN
                apex_util.set_session_state('P17_AGE_MANUEL','Age ' || FLOOR( ( months_between( trunc( sysdate ), l_dateofbirth ) / 12) ) || '', g_commit_apex_session);
            END IF;
        ELSE
            apex_util.set_session_state('P17_AGE_MANUEL','Age ' || FLOOR( ( months_between( trunc( sysdate ), TO_DATE(l_dob_partial.getYear(), 'YYYY') ) / 12) ) || '', g_commit_apex_session);
    END CASE;

    -- replaced by partial dob logic
    /*
    -- check and calculate Age
    IF l_dateofbirth IS NOT NULL
    THEN
        apex_util.set_session_state('P17_AGE_MANUEL','Age ' || FLOOR( ( months_between( trunc( sysdate ), l_dateofbirth ) / 12) ) || '', g_commit_apex_session);
    END IF;
    */

    -- Calculate Expiry date from passport
    l_monthsremain := MONTHS_BETWEEN(nvl(l_extexpirydate, l_expirydate), trunc(sysdate));
    CASE
      WHEN l_monthsremain IS NULL THEN NULL;

      WHEN l_monthsremain >= 6
      THEN
        l_monthsremain_valid := ' ';
        l_monthsremain_expired := 0;

      WHEN l_monthsremain > 0
      THEN
        l_monthsremain_valid := '< ' || CEIL(l_monthsremain) || ' mon';
        l_monthsremain_expired := 0;

      ELSE
        l_monthsremain_valid := FLOOR(l_monthsremain) || ' mon';
        l_monthsremain_expired := 1;
    END CASE;

    apex_util.set_session_state('P17_VALID', l_monthsremain_valid, g_commit_apex_session);
    apex_util.set_session_state('CHECK_ISPASSPORTEXPIRED', l_monthsremain_expired, g_commit_apex_session);

    -- check resident information
    -- done separately via a custom event on the UI
    /*
    BEGIN

      SELECT *
        INTO l_residence_rec
        FROM residence
      WHERE document_no = v('P17_DISPLAY_DOCNUMBER')
        AND nationality = v('P17_NATIONALITY')
        AND expire_date = NVL(l_expirydate, l_extexpirydate);

      -- set items
      apex_util.set_session_state('P17_RESIDENT_TYPE', l_residence_rec.resident_type, g_commit_apex_session);
      apex_util.set_session_state('P17_RESIDENT_NUMBER', l_residence_rec.resident_no, g_commit_apex_session);
      apex_util.set_session_state('P17_LAST_NAME_RI', l_residence_rec.last_name_thai, g_commit_apex_session);
      apex_util.set_session_state('P17_FIRST_NAME_RI', l_residence_rec.first_name_thai, g_commit_apex_session);
      apex_util.set_session_state('P17_MIDDLE_NAME_RI', l_residence_rec.middle_name_thai, g_commit_apex_session);

    EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
        apex_util.set_session_state('P17_RESIDENT_TYPE', NULL, g_commit_apex_session);
        apex_util.set_session_state('P17_RESIDENT_NUMBER', NULL, g_commit_apex_session);
        apex_util.set_session_state('P17_LAST_NAME_RI', NULL, g_commit_apex_session);
        apex_util.set_session_state('P17_FIRST_NAME_RI', NULL, g_commit_apex_session);
        apex_util.set_session_state('P17_MIDDLE_NAME_RI', NULL, g_commit_apex_session);
    END;
    */

    ------ get exitflg from last movement
    ----BEGIN
    ----
    ----  /*
    ----  SELECT exitflg
    ----    INTO l_movement_rec.exitflg
    ----    FROM (SELECT exitflg
    ----            FROM movements
    ----          WHERE brddocid IN (select brddocid
    ----                               from identities
    ----                              where identity in (select identity
    ----                                                   from identities
    ----                                                  where brddocid in (select brddocid
    ----                                                                       from borderdocuments
    ----                                                                      where issuectry = v('P17_NATIONALITY')
    ----                                                                        and docno = v('P17_DISPLAY_DOCNUMBER')
    ----                                                                    )
    ----                                                 )
    ----                            )
    ----            AND (v('P17_MVMNTID') IS NULL OR mvmntid <> v('P17_MVMNTID'))
    ----            AND is_finished = 'Y'
    ----          ORDER BY date_of_entry DESC NULLS LAST)
    ----  WHERE ROWNUM = 1;
    ----  */
    ----
    ----    --logger.append_param(l_params, 'p_DOCNO', v('P17_DISPLAY_DOCNUMBER'));
    ----    --logger.append_param(l_params, 'p_ISSUECTRY', v('P17_NATIONALITY'));
    ----    --logger.append_param(l_params, 'p_EXPIRYDATE', NVL(l_expirydate, l_extexpirydate));
    ----    --logger.append_param(l_params, 'p_GENDER', v('P17_DISPLAY_GENDER'));
    ----    --logger.append_param(l_params, 'p_DOB', v('P17_DISPLAY_DOB'));
    ----    --logger.append_param(l_params, 'p_SURNAME', v('P17_DISPLAY_LASTNAME'));
    ----    --logger.append_param(l_params, 'p_GIVENNAME', v('P17_DISPLAY_FIRSTNAME'));
    ----    --logger.append_param(l_params, 'p_MIDDLENAME', v('P17_DISPLAY_MIDDLENAME'));
    ----
    ----
    ----    l_last_movement_info := dl_movementhandling.Get_Last_Movement_Info
    ----                            (
    ----                                p_DOCNO          => v('P17_DISPLAY_DOCNUMBER')
    ----                                ,p_ISSUECTRY     => v('P17_NATIONALITY')
    ----                                ,p_EXPIRYDATE    => NVL(l_expirydate, l_extexpirydate) -- cant use manual expiry
    ----                                ,p_GENDER        => v('P17_DISPLAY_GENDER')
    ----                                ,p_DOB           => v('P17_DISPLAY_DOB')
    ----                                ,p_SURNAME       => v('P17_DISPLAY_LASTNAME')
    ----                                ,p_GIVENNAME     => v('P17_DISPLAY_FIRSTNAME')
    ----                                ,p_MIDDLENAME    => v('P17_DISPLAY_MIDDLENAME')
    ----                                ,p_EXITFLG       => NULL
    ----                                ,p_NATIONALITY   => v('P17_STATELESS')
    ----                            );
    ----
    ----    --apex_util.set_session_state('P17_LAST_DIRECTION', l_movement_rec.exitflg, g_commit_apex_session);
    ----    apex_util.set_session_state('P17_LAST_DIRECTION', l_last_movement_info.direction, g_commit_apex_session);
    ----    apex_util.set_session_state('P17_LAST_MVMNT_SRC', l_last_movement_info.source, g_commit_apex_session);
    ----    apex_util.set_session_state('P17_LAST_MVMNT_SRC_SEC', l_last_movement_info.source_sec, g_commit_apex_session);
    ----    apex_util.set_session_state('P17_LAST_MVMNT_SRC_SEC_PK_VAL', l_last_movement_info.source_sec_pk_val, g_commit_apex_session);
    ----    apex_util.set_session_state('P17_LAST_MVMNT_TRAVEL_DATE', TO_CHAR(l_last_movement_info.travel_date, 'DD/MM/YYYY'), g_commit_apex_session);
    ----    apex_util.set_session_state('P17_LAST_MVMNT_DOCNO', l_last_movement_info.docno, g_commit_apex_session);
    ----    apex_util.set_session_state('P17_LAST_MVMNT_DOCNO_EXP_DATE', TO_CHAR(l_last_movement_info.docno_expiry_date, 'DD/MM/YYYY'), g_commit_apex_session);
    ----    apex_util.set_session_state('P17_LAST_MVMNT_VISA_TYPE', l_last_movement_info.visa_type, g_commit_apex_session);
    ----    apex_util.set_session_state('P17_LAST_MVMNT_VISA_EXP_DATE', TO_CHAR(l_last_movement_info.visa_expiry_date, 'DD/MM/YYYY'), g_commit_apex_session);
    ----
    ----EXCEPTION
    ----    WHEN NO_DATA_FOUND
    ----    THEN
    ----        apex_util.set_session_state('P17_LAST_DIRECTION', NULL, g_commit_apex_session);
    ----        apex_util.set_session_state('P17_LAST_MVMNT_SRC', NULL, g_commit_apex_session);
    ----        apex_util.set_session_state('P17_LAST_MVMNT_SRC_SEC', NULL, g_commit_apex_session);
    ----        apex_util.set_session_state('P17_LAST_MVMNT_SRC_SEC_PK_VAL', NULL, g_commit_apex_session);
    ----        apex_util.set_session_state('P17_LAST_MVMNT_TRAVEL_DATE', NULL, g_commit_apex_session);
    ----        apex_util.set_session_state('P17_LAST_MVMNT_DOCNO', NULL, g_commit_apex_session);
    ----        apex_util.set_session_state('P17_LAST_MVMNT_DOCNO_EXP_DATE', NULL, g_commit_apex_session);
    ----        apex_util.set_session_state('P17_LAST_MVMNT_VISA_TYPE', NULL, g_commit_apex_session);
    ----        apex_util.set_session_state('P17_LAST_MVMNT_VISA_EXP_DATE', NULL, g_commit_apex_session);
    ----END;

    -- get last movement information -- on UI thru a custom event
    -- p17_get_last_movement_info();

    -- check county_management information and get texts for displays
    BEGIN

      select replace( asciistr( nvl( message_done, pkg_common.get_parameter('MSG_DONE_' || decode(v('MOVEMENT_ENTRY_EXIT'), 0, 'ARRIVAL', 1, 'DEPARTURE', 'XXX') ) ) ), l_separator, '0x') AS display_text
            ,replace( asciistr( nvl( message_fingers_right, pkg_common.get_parameter('MSG_CAPTURE_RIGHT') ) ), l_separator, '0x') AS message_capture_right
            ,replace (asciistr( nvl( message_fingers_left, pkg_common.get_parameter('MSG_CAPTURE_LEFT') ) ), l_separator, '0x')  AS message_capture_left
            ,replace( asciistr( nvl( message_thumbs, pkg_common.get_parameter('MSG_CAPTURE_THUMBS') ) ), l_separator, '0x') AS message_capture_thumbs
            ,need_healthcheck
        into l_country_management_rec.message_done
            ,l_country_management_rec.message_fingers_right
            ,l_country_management_rec.message_fingers_left
            ,l_country_management_rec.message_thumbs
            ,l_country_management_rec.need_healthcheck
        from country_management
      where coutry_code = v('P17_NATIONALITY')
        and direction = v('MOVEMENT_ENTRY_EXIT');

      -- set session states
      apex_util.set_session_state('P17_DISPLAY_TEXT', l_country_management_rec.message_done, g_commit_apex_session);
      apex_util.set_session_state('P17_DISPLAY_MESSAGE_CAPTURE_RIGHT', l_country_management_rec.message_fingers_right, g_commit_apex_session);
      apex_util.set_session_state('P17_DISPLAY_MESSAGE_CAPTURE_LEFT', l_country_management_rec.message_fingers_left, g_commit_apex_session);
      apex_util.set_session_state('P17_DISPLAY_MESSAGE_CAPTURE_THUMBS', l_country_management_rec.message_thumbs, g_commit_apex_session);
      apex_util.set_session_state('P17_HEALTHCHECK_COUNTRY', l_country_management_rec.need_healthcheck, g_commit_apex_session);

    EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
        NULL;
    END;

    logger.log('P17 - VALIDATE DEMOGRAPHIC INPUT: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('P17 - VALIDATE DEMOGRAPHIC INPUT: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END p17_validate_demographic_input;

  /**
   * Uses abis ids to merge documents
   */
  PROCEDURE p17_merge_identities
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'p17_merge_identities';
    l_params logger.tab_param;
    --
    l_scanned_doc_id    varchar2(255) := v('P17_BRDDOCID');
    l_merge_brddocs_tab pkg_borderdocuments.t_borderdocuments_tab;
    l_brddoc_rec        borderdocuments%ROWTYPE;
    l_brddoc_identity   identities.identity%TYPE;

  BEGIN

    logger.log('P17 - Merge Identities: start', l_scope, null, l_params);

    -- select borderdocument that called the action
    SELECT *
      INTO l_brddoc_rec
      FROM borderdocuments
     WHERE brddocid = l_scanned_doc_id;

     --select identity for the borderdocument that called the action
     BEGIN
        SELECT identity
          INTO l_brddoc_identity
          FROM identities
        WHERE brddocid = l_scanned_doc_id;

      EXCEPTION
        WHEN NO_DATA_FOUND
        THEN
          l_brddoc_identity := pkg_identities.get_new_bio_id();

          INSERT INTO dl_bordercontrol.identities (identity,brddocid,source)
          VALUES (l_brddoc_identity,l_scanned_doc_id,'D');

          commit;
      END;

--    SELECT identity
--      INTO l_brddoc_identity
--      FROM identities
--     WHERE brddocid = l_scanned_doc_id;

    -- select borderdocuments that should also be changed
    /* -- improper index usage
    SELECT *
      BULK COLLECT INTO l_merge_brddocs_tab
      FROM borderdocuments
     WHERE afisid IN (SELECT c001
                        FROM apex_collections
                       WHERE collection_name = 'P17_MERGE_ABIS_IDS')
        OR brddocid IN (SELECT brddocid
                          FROM identities
                         WHERE identity = l_brddoc_identity);*/

    -- modified to use index
    SELECT *
        BULK COLLECT INTO l_merge_brddocs_tab
    FROM dl_bordercontrol.borderdocuments
    WHERE afisid IN
    (
        SELECT c001
        FROM apex_collections
        WHERE collection_name = 'P17_MERGE_ABIS_IDS'
    )
    UNION
    SELECT *
    FROM dl_bordercontrol.borderdocuments
    WHERE brddocid IN
    (
        SELECT i.brddocid
        FROM dl_bordercontrol.identities i
        WHERE identity = l_brddoc_identity
    );

    -- merge identities
    l_brddoc_identity := pkg_identities.merge_identities (p_borderdocuments_tab  => l_merge_brddocs_tab
                                                         ,p_merge_borderdocument => l_brddoc_rec);

    logger.append_param(l_params, 'number of changed brddocs (without called brddoc)', l_merge_brddocs_tab.COUNT);
    logger.append_param(l_params, 'l_brddoc_rec.expirydate', l_brddoc_rec.expirydate);
    logger.log('P17 - Merge Identities: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('P17 - Merge Identities: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END;

  /**
   * Get permit info: re-entry, extend stay or request for residence
   * Added by MSCS
   */
  PROCEDURE p17_get_permit_info
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'p17_get_permit_info';
    l_params logger.tab_param;
    --
    l_expirydate    DATE;
    l_extexpirydate DATE;
    l_dateofbirth   DATE;
    l_dateofbirth_char VARCHAR2(30);
    -- partial dob vars
    l_dob_partial       DL_BORDERCONTROL.CT_PARTIAL_DATE_TYPE;
    l_is_dob_partial    PLS_INTEGER := 0;
    --
    l_re_tm8_seqno  NUMBER;
    l_re_doctype    VARCHAR2(30);
    l_re_endpermit_date DATE;
    --
    l_ext_list_seqno    NUMBER;
    l_ext_permit_date   DATE;
    --
    l_rqs_person_seqno  NUMBER;
    l_rqs_permit_date   DATE;
    --
    l_endq_residence_no     VARCHAR2(30);
    l_endq_residence_type   NUMBER;
    l_endq_tfirstnm         VARCHAR2(180);
    l_endq_tfamilynm        VARCHAR2(180);
    l_endq_tmiddlenm        VARCHAR2(180);
    l_endq_controlbook_no   VARCHAR2(30);
    l_endq_endorsement_no   VARCHAR2(30);
    l_endq_rcissue_by       VARCHAR2(180);
    l_endq_edmexp_date      DATE;
    --
    l_chng_chngperson_seqno NUMBER;
    l_chng_visa_type        VARCHAR2(32);
    l_chng_visa_expdate     DATE;
    --

    l_re_exists     VARCHAR2(1);
    l_re_exp_date   DATE;

    l_ext_exists    VARCHAR2(1);
    l_ext_exp_date  DATE;

    l_rqs_exists    VARCHAR2(1);
    l_rqs_exp_date  DATE;

    l_endq_exists   VARCHAR2(1);
    l_endq_exp_date DATE;

    l_chng_exists   VARCHAR2(1);
    l_chng_exp_date DATE;

    l_disp_diag         VARCHAR2(30);
    l_permit_type       VARCHAR2(1);
    l_permit_exp_date   DATE;
    --
    l_movement_direction        NUMBER := NVL(v('MOVEMENT_ENTRY_EXIT'), 0);
    --
    l_last_mvmnt_direction      MOVEMENTS.EXITFLG%TYPE := v('P17_LAST_DIRECTION');
    l_last_mvmnt_docno          BORDERDOCUMENTS.DOCNO%TYPE := v('P17_LAST_MVMNT_DOCNO');
    l_last_mvmnt_docno_exp_date DATE := pkg_common.tolerant_to_date(v('P17_LAST_MVMNT_DOCNO_EXP_DATE'), 'DD/MM/YYYY');
    l_last_mvmnt_travel_date    DATE := pkg_common.tolerant_to_date(v('P17_LAST_MVMNT_TRAVEL_DATE'), 'DD/MM/YYYY');
    --
    l_is_different_passport     VARCHAR2(1) := 'N';
    --
    l_nation_seqno              NUMBER;
    --
    l_p17_display_dob_text      VARCHAR2(10) := TRIM(v('P17_DISPLAY_DOB_TEXT'));
    --
  BEGIN

    -- submit
    -- P17_DISPLAY_DOCNUMBER,P17_MANUAL_EXPIRYDATE,P17_DISPLAY_EXPIRYDATE,P17_NATIONALITY,P17_DISPLAY_DOB_TEXT,
    -- P17_DISPLAY_LASTNAME,P17_DISPLAY_FIRSTNAME,P17_DISPLAY_MIDDLENAME

    -- return
    -- P17_RE_TM8_SEQNO,P17_RE_DOCTYPE,P17_RE_ENDPERMIT_DATE,P17_EXT_LIST_SEQNO,P17_EXT_PERMIT_DATE,
    -- P17_IS_PERMIT_INFO,P17_PERMIT_TYPE,P17_PERMIT_EXPIRY,P17_RQS_PERSON_SEQNO,P17_RQS_PERMIT_DATE,
    -- P17_ENDQ_RESIDENCE_NO,P17_ENDQ_RESIDENCE_TYPE,P17_ENDQ_THAI_FIRSTNAME,P17_ENDQ_THAI_FAMILYNAME,
    -- P17_ENDQ_THAI_MIDDLENAME,P17_ENDQ_RESIDENCE_BOOK_NO,P17_ENDQ_ENDORSEMENT_NO,P17_ENDQ_ISSUE_PLACE,P17_ENDQ_EXPIRED_DATE,
    -- P17_CHNG_PERSON_SEQNO,P17_CHNG_EXPIRED_DATE,P17_CHNG_VISA_TYPE

    DL_COMMON.PKG_I18N.Alter_Sess_Data_Locale(p_LOCALE => 'en_US');

    l_expirydate := COALESCE(pkg_common.parse_date(v('P17_DISPLAY_EXPIRYDATE'), 0, 1, 20, 1)
                            ,pkg_common.parse_date(v('P17_DISPLAY_EXPIRYDATE'), 1, 0, 0, 1)
                            ,pkg_common.tolerant_to_date(v('P17_DISPLAY_EXPIRYDATE'), 'DD/MM/YYYY'));

    l_extexpirydate := COALESCE(pkg_common.parse_date(v('P17_MANUAL_EXPIRYDATE'), 0, 1, 20, 1)
                               ,pkg_common.parse_date(v('P17_MANUAL_EXPIRYDATE'), 1, 0, 0, 1)
                               ,pkg_common.tolerant_to_date(v('P17_MANUAL_EXPIRYDATE'), 'DD/MM/YYYY'));

    -- partial DOB
    -- init
    l_dob_partial := DL_BORDERCONTROL.CT_PARTIAL_DATE_TYPE(0, 0, 0);
    IF l_p17_display_dob_text IS NOT NULL THEN
        l_dob_partial := pkg_common.Get_Partial_Date(l_p17_display_dob_text, 1, 0, 0, 1);
        IF l_dob_partial.isValidDate() = 1 THEN
            l_dateofbirth := l_dob_partial.getDate();
        ELSE
            l_is_dob_partial := 1;
        END IF;
    END IF;
    
    l_dateofbirth_char := l_dob_partial.getFormatData('DD/MM/YYYY');
    
    -- replaced by partial dob logic
    /*
    l_dateofbirth := COALESCE(pkg_common.parse_date(v('P17_DISPLAY_DOB'), 1, 0, 0, 1)
                             ,pkg_common.tolerant_to_date(v('P17_DISPLAY_DOB'), 'DD/MM/YYYY'));

    l_dateofbirth_char := TO_CHAR(l_dateofbirth, 'DD/MM/YYYY');
    */

    -- check if the doc is different from the one used at the last arrival
    IF
        l_movement_direction = 1
        AND l_last_mvmnt_direction = 0
        AND l_last_mvmnt_docno IS NOT NULL
        AND NVL(l_last_mvmnt_docno, '~') != NVL(v('P17_DISPLAY_DOCNUMBER'), '~')
    THEN
        l_is_different_passport := 'Y';
    END IF;

    /* get params for pibics fetch starts */
    -- NAT might be different than ISSUECTRY in case of stateless
    -- use ISSUECTRY to get the last movement info from BIO
    -- use NAT to get the last movement info from PIBICS
    -- if NAT is null, use ISSUECTRY
    BEGIN
        SELECT pib.count_seqno
        INTO l_nation_seqno
        FROM dl_common.icao_doc_codes$lc icao, dl_bordercontrol.v_country pib
        WHERE icao.key_value = NVL(v('P17_STATELESS'), v('P17_NATIONALITY'))
        AND icao.is_active = 'Y'
        AND icao.notice$dlc = pib.countcd;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            l_nation_seqno := NULL;
    END;
    /* get params for pibics fetch ends */

    logger.append_param(l_params, 'P17_DISPLAY_EXPIRYDATE', l_expirydate);
    logger.append_param(l_params, 'P17_MANUAL_EXPIRYDATE', l_extexpirydate);
    logger.append_param(l_params, 'P17_DISPLAY_DOB', l_dateofbirth);
    logger.append_param(l_params, 'l_is_dob_partial', l_is_dob_partial);
    logger.append_param(l_params, 'P17_DISPLAY_DOB_TEXT', l_dateofbirth_char);
    logger.append_param(l_params, 'P17_DISPLAY_DOCNUMBER', v('P17_DISPLAY_DOCNUMBER'));
    logger.append_param(l_params, 'P17_NATIONALITY', v('P17_NATIONALITY'));
    logger.append_param(l_params, 'P17_STATELESS', v('P17_STATELESS'));
    logger.append_param(l_params, 'IS_DIFFERENT_PASSPORT', l_is_different_passport);
    logger.log('P17 - Get Permit Info: start', l_scope, null, l_params);

    -----------------------------------------
    -- resident/endorsement block start --
    -----------------------------------------

    BEGIN

    --    WITH t_endq AS
    --    (
    --        SELECT /*+ NO_PARALLEL */
    --            person.certofresidence_seqno
    --            , person.rcno_pvcd
    --            , person.rcno_runningno
    --            , person.rcno_year
    --            , person.rescerttype_seqno
    --            , person.tfirstnm
    --            , person.tfamilynm
    --            , person.tmiddlenm
    --            , cert.controlbook_no
    --            , tm13.tm13_seqno
    --            , tm13.tm13no
    --            , tm13.tm13year
    --            , tm13.rcissue_by
    --            , tm13.edmexp_date
    --            , ROW_NUMBER() OVER (PARTITION BY person.nation_seqno, person.birth_date ORDER BY person.certofresidence_seqno DESC, tm13.tm13_seqno DESC) RN
    --        FROM dl_bordercontrol.v_crs_person person
    --        LEFT JOIN dl_bordercontrol.v_crs_certofresidence cert
    --        ON person.certofresidence_seqno = cert.certofresidence_seqno
    --        LEFT JOIN dl_bordercontrol.v_ednq_tm13 tm13
    --        ON person.certofresidence_seqno = tm13.certofresidence_seqno
    --        /*(
    --            person.certofresidence_seqno = tm13.certofresidence_seqno
    --            AND
    --            (
    --                CASE
    --                    WHEN (l_movement_direction = 0) THEN 1 -- arrival
    --                    WHEN (l_movement_direction = 1 AND tm13.edmexp_date >= TRUNC(SYSDATE)) THEN 1 -- departure
    --                END
    --            ) = 1
    --        )*/
    --        WHERE
    --            person.crs_sts = 'A'
    --            --AND person.birth_date = TO_CHAR(l_dateofbirth, 'DD/MM/YYYY')
    --            AND
    --            (
    --                person.birth_date = l_dateofbirth_char
    --                OR
    --                person.birth_date = SUBSTR(l_dateofbirth_char, -4, 4)
    --                OR
    --                person.birth_date = SUBSTR(l_dateofbirth_char, -7, 7)
    --                OR
    --                person.birth_date = SUBSTR(l_dateofbirth_char, -8, 8)
    --                OR
    --                person.birth_date = '//' || SUBSTR(l_dateofbirth_char, -4, 4)
    --            )
    --            AND person.nation_seqno = l_nation_seqno
    --                /*(
    --                    SELECT pib.count_seqno
    --                    FROM dl_common.icao_doc_codes$lc icao, dl_bordercontrol.v_country pib
    --                    WHERE icao.key_value = v('P17_NATIONALITY')
    --                    AND icao.is_active = 'Y'
    --                    AND icao.notice$dlc = pib.countcd
    --                )*/
    --            AND
    --            (
    --                person.cpassportno = v('P17_DISPLAY_DOCNUMBER')
    --                OR
    --                (l_is_different_passport = 'Y' AND person.cpassportno = l_last_mvmnt_docno)
    --                OR
    --                person.opassportno = v('P17_DISPLAY_DOCNUMBER')
    --                OR
    --                (l_is_different_passport = 'Y' AND person.opassportno = l_last_mvmnt_docno)
    --                OR
    --                (
    --                    UPPER(TRIM(REGEXP_REPLACE(person.efamilynm, '\s{2,}', ' '))) = v('P17_DISPLAY_LASTNAME')
    --                    AND UPPER(TRIM(REGEXP_REPLACE(person.efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(person.emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(person.emiddlenm, '\s{2,}', ' '))), NULL) = v('P17_DISPLAY_FIRSTNAME') || NVL2(v('P17_DISPLAY_MIDDLENAME'), ' ' || v('P17_DISPLAY_MIDDLENAME'), NULL)
    --                )
    --            )
    --            --AND edmexp_date >= TRUNC(SYSDATE)
    --    )
    --    SELECT
    --        rcno_pvcd || TO_CHAR(rcno_runningno) || rcno_year -- Residence No
    --        , rescerttype_seqno -- Residence Type
    --        , tfirstnm
    --        , tfamilynm
    --        , tmiddlenm
    --        , controlbook_no
    --        , TO_CHAR(tm13no) || tm13year -- Endorsement No
    --        , rcissue_by
    --        , edmexp_date
    --        , 'Y'
    --        , edmexp_date
    --    INTO
    --        l_endq_residence_no --P17_ENDQ_RESIDENCE_NO
    --        , l_endq_residence_type --P17_ENDQ_RESIDENCE_TYPE
    --        , l_endq_tfirstnm --P17_ENDQ_THAI_FIRSTNAME
    --        , l_endq_tfamilynm --P17_ENDQ_THAI_FAMILYNAME
    --        , l_endq_tmiddlenm --P17_ENDQ_THAI_MIDDLENAME
    --        , l_endq_controlbook_no --P17_ENDQ_RESIDENCE_BOOK_NO
    --        , l_endq_endorsement_no --P17_ENDQ_ENDORSEMENT_NO
    --        , l_endq_rcissue_by --P17_ENDQ_ISSUE_PLACE
    --        , l_endq_edmexp_date --P17_ENDQ_EXPIRED_DATE
    --        , l_endq_exists
    --        , l_endq_exp_date
    --    FROM t_endq
    --    WHERE RN = 1;

        SELECT
            rcno_pvcd || TO_CHAR(rcno_runningno) || rcno_year -- Residence No
            , rescerttype_seqno -- Residence Type
            , tfirstnm
            , tfamilynm
            , tmiddlenm
            , controlbook_no
            , TO_CHAR(tm13no) || tm13year -- Endorsement No
            , rcissue_by
            , edmexp_date
            , 'Y'
            , edmexp_date
        INTO
            l_endq_residence_no --P17_ENDQ_RESIDENCE_NO
            , l_endq_residence_type --P17_ENDQ_RESIDENCE_TYPE
            , l_endq_tfirstnm --P17_ENDQ_THAI_FIRSTNAME
            , l_endq_tfamilynm --P17_ENDQ_THAI_FAMILYNAME
            , l_endq_tmiddlenm --P17_ENDQ_THAI_MIDDLENAME
            , l_endq_controlbook_no --P17_ENDQ_RESIDENCE_BOOK_NO
            , l_endq_endorsement_no --P17_ENDQ_ENDORSEMENT_NO
            , l_endq_rcissue_by --P17_ENDQ_ISSUE_PLACE
            , l_endq_edmexp_date --P17_ENDQ_EXPIRED_DATE
            , l_endq_exists
            , l_endq_exp_date
        FROM
        (
            SELECT /*+ NO_PARALLEL */
                person.certofresidence_seqno
                , person.rcno_pvcd
                , person.rcno_runningno
                , person.rcno_year
                , person.rescerttype_seqno
                , person.tfirstnm
                , person.tfamilynm
                , person.tmiddlenm
                , cert.controlbook_no
                , tm13.tm13_seqno
                , tm13.tm13no
                , tm13.tm13year
                , tm13.rcissue_by
                , tm13.edmexp_date
                --, ROW_NUMBER() OVER (PARTITION BY person.nation_seqno, person.birth_date ORDER BY person.certofresidence_seqno DESC, tm13.tm13_seqno DESC) RN
            FROM dl_bordercontrol.v_crs_person person
            LEFT JOIN dl_bordercontrol.v_crs_certofresidence cert
            ON person.certofresidence_seqno = cert.certofresidence_seqno
            LEFT JOIN dl_bordercontrol.v_ednq_tm13 tm13
            --ON person.certofresidence_seqno = tm13.certofresidence_seqno
            ON person.rcno_pvcd = tm13.rcno_pvcd
			AND person.rcno_runningno = tm13.rcno_runnungno
			AND person.rcno_year = tm13.rcno_year
			AND person.rescerttype_seqno = tm13.rescerttype_seqno
			AND tm13.tm13sts = 'A'
            /*(
                person.certofresidence_seqno = tm13.certofresidence_seqno
                AND
                (
                    CASE
                        WHEN (l_movement_direction = 0) THEN 1 -- arrival
                        WHEN (l_movement_direction = 1 AND tm13.edmexp_date >= TRUNC(SYSDATE)) THEN 1 -- departure
                    END
                ) = 1
            )*/
            WHERE
                person.crs_sts = 'A'
                --AND person.birth_date = TO_CHAR(l_dateofbirth, 'DD/MM/YYYY')
                AND
                (
                    person.birth_date = l_dateofbirth_char
                    OR
                    person.birth_date = SUBSTR(l_dateofbirth_char, -4, 4)
                    OR
                    person.birth_date = SUBSTR(l_dateofbirth_char, -7, 7)
                    OR
                    person.birth_date = SUBSTR(l_dateofbirth_char, -8, 8)
                    OR
                    person.birth_date = '//' || SUBSTR(l_dateofbirth_char, -4, 4)
                )
                AND person.nation_seqno = l_nation_seqno
                    /*(
                        SELECT pib.count_seqno
                        FROM dl_common.icao_doc_codes$lc icao, dl_bordercontrol.v_country pib
                        WHERE icao.key_value = v('P17_NATIONALITY')
                        AND icao.is_active = 'Y'
                        AND icao.notice$dlc = pib.countcd
                    )*/
                AND
                (
                    person.cpassportno = v('P17_DISPLAY_DOCNUMBER')
                    OR
                    (l_is_different_passport = 'Y' AND person.cpassportno = l_last_mvmnt_docno)
                    OR
                    person.opassportno = v('P17_DISPLAY_DOCNUMBER')
                    OR
                    (l_is_different_passport = 'Y' AND person.opassportno = l_last_mvmnt_docno)
                    OR
                    (
                        UPPER(TRIM(REGEXP_REPLACE(person.efamilynm, '\s{2,}', ' '))) = v('P17_DISPLAY_LASTNAME')
                        AND UPPER(TRIM(REGEXP_REPLACE(person.efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(person.emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(person.emiddlenm, '\s{2,}', ' '))), NULL) = v('P17_DISPLAY_FIRSTNAME') || NVL2(v('P17_DISPLAY_MIDDLENAME'), ' ' || v('P17_DISPLAY_MIDDLENAME'), NULL)
                    )
                )
                --AND edmexp_date >= TRUNC(SYSDATE)
            ORDER BY person.certofresidence_seqno DESC, tm13.tm13_seqno DESC
        ) t_endq
        WHERE ROWNUM = 1;

        logger.log('P17 - Get Permit Info: Endorsement Found', l_scope, null, l_params);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            l_endq_residence_no := NULL;
            l_endq_residence_type := NULL;
            l_endq_tfirstnm := NULL;
            l_endq_tfamilynm := NULL;
            l_endq_tmiddlenm := NULL;
            l_endq_controlbook_no := NULL;
            l_endq_endorsement_no := NULL;
            l_endq_rcissue_by := NULL;
            l_endq_edmexp_date := NULL;
            l_endq_exists := NULL;
            l_endq_exp_date := NULL;

    END;

    -- set session state for endorsement fields
    apex_util.set_session_state('P17_ENDQ_RESIDENCE_NO', l_endq_residence_no, g_commit_apex_session);
    apex_util.set_session_state('P17_ENDQ_RESIDENCE_TYPE', l_endq_residence_type, g_commit_apex_session);
    apex_util.set_session_state('P17_ENDQ_THAI_FIRSTNAME', l_endq_tfirstnm, g_commit_apex_session);
    apex_util.set_session_state('P17_ENDQ_THAI_FAMILYNAME', l_endq_tfamilynm, g_commit_apex_session);
    apex_util.set_session_state('P17_ENDQ_THAI_MIDDLENAME', l_endq_tmiddlenm, g_commit_apex_session);
    apex_util.set_session_state('P17_ENDQ_RESIDENCE_BOOK_NO', l_endq_controlbook_no, g_commit_apex_session);
    apex_util.set_session_state('P17_ENDQ_ENDORSEMENT_NO', l_endq_endorsement_no, g_commit_apex_session);
    apex_util.set_session_state('P17_ENDQ_ISSUE_PLACE', l_endq_rcissue_by, g_commit_apex_session);
    apex_util.set_session_state('P17_ENDQ_EXPIRED_DATE', TO_CHAR(l_endq_edmexp_date, 'DD/MM/YYYY'), g_commit_apex_session);

    -----------------------------------------
    -- resident/endorsement block end --
    -----------------------------------------

    -- if resident/endorsement exists, no need to check other permits
    IF l_endq_exists = 'Y' THEN
        GOTO lbl_p17_get_permit_info_end;
    END IF;

    -----------------------------------------
    -- request for residence block start --
    -----------------------------------------
    BEGIN

    --    WITH t_rqs AS
    --    (
    --        SELECT /*+ NO_PARALLEL */
    --            rqsperson_seqno
    --            , permit_date
    --            , ROW_NUMBER() OVER (PARTITION BY nation_seqno, birth_date ORDER BY rqsperson_seqno DESC) RN
    --        FROM
    --            dl_bordercontrol.v_rqs_person
    --        WHERE
    --            apprvsts = 'W'
    --            --AND cpassportno = v('P17_DISPLAY_DOCNUMBER')
    --            --AND ( cpassport_expdate is null or TRUNC(cpassport_expdate) = NVL(l_extexpirydate, l_expirydate) )
    --            AND nation_seqno = l_nation_seqno
    --                /*(
    --                    SELECT pib.count_seqno
    --                    FROM dl_common.icao_doc_codes$lc icao, dl_bordercontrol.v_country pib
    --                    WHERE icao.key_value = v('P17_NATIONALITY')
    --                    AND icao.is_active = 'Y'
    --                    AND icao.notice$dlc = pib.countcd
    --                )*/
    --            --AND birth_date = TO_CHAR(l_dateofbirth, 'DD/MM/YYYY')
    --            AND
    --            (
    --                birth_date = l_dateofbirth_char
    --                OR
    --                birth_date = SUBSTR(l_dateofbirth_char, -4, 4)
    --                OR
    --                birth_date = SUBSTR(l_dateofbirth_char, -7, 7)
    --                OR
    --                birth_date = SUBSTR(l_dateofbirth_char, -8, 8)
    --                OR
    --                birth_date = '//' || SUBSTR(l_dateofbirth_char, -4, 4)
    --            )
    --            AND
    --            (
    --                cpassportno = v('P17_DISPLAY_DOCNUMBER')
    --                OR
    --                (l_is_different_passport = 'Y' AND cpassportno = l_last_mvmnt_docno)
    --                OR
    --                opassportno = v('P17_DISPLAY_DOCNUMBER')
    --                OR
    --                (l_is_different_passport = 'Y' AND opassportno = l_last_mvmnt_docno)
    --                OR
    --                (
    --                    UPPER(TRIM(REGEXP_REPLACE(efamilynm, '\s{2,}', ' '))) = v('P17_DISPLAY_LASTNAME')
    --                    AND UPPER(TRIM(REGEXP_REPLACE(efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(emiddlenm, '\s{2,}', ' '))), NULL) = v('P17_DISPLAY_FIRSTNAME') || NVL2(v('P17_DISPLAY_MIDDLENAME'), ' ' || v('P17_DISPLAY_MIDDLENAME'), NULL)
    --                )
    --            )
    --            --AND permit_date >= TRUNC(SYSDATE)
    --    )
    --    SELECT
    --        rqsperson_seqno
    --        , permit_date
    --        , 'Y'
    --        , permit_date
    --    INTO
    --        l_rqs_person_seqno --:P17_RQS_PERSON_SEQNO
    --        , l_rqs_permit_date --:P17_RQS_PERMIT_DATE
    --        , l_rqs_exists
    --        , l_rqs_exp_date
    --    FROM t_rqs
    --    WHERE RN = 1;

        SELECT
            rqsperson_seqno
            , permit_date
            , 'Y'
            , permit_date
        INTO
            l_rqs_person_seqno --:P17_RQS_PERSON_SEQNO
            , l_rqs_permit_date --:P17_RQS_PERMIT_DATE
            , l_rqs_exists
            , l_rqs_exp_date
        FROM
        (
            SELECT /*+ NO_PARALLEL */
                rqsperson_seqno
                , permit_date
                --, ROW_NUMBER() OVER (PARTITION BY nation_seqno, birth_date ORDER BY rqsperson_seqno DESC) RN
            FROM
                dl_bordercontrol.v_rqs_person
            WHERE
                apprvsts = 'W'
                --AND cpassportno = v('P17_DISPLAY_DOCNUMBER')
                --AND ( cpassport_expdate is null or TRUNC(cpassport_expdate) = NVL(l_extexpirydate, l_expirydate) )
                AND nation_seqno = l_nation_seqno
                    /*(
                        SELECT pib.count_seqno
                        FROM dl_common.icao_doc_codes$lc icao, dl_bordercontrol.v_country pib
                        WHERE icao.key_value = v('P17_NATIONALITY')
                        AND icao.is_active = 'Y'
                        AND icao.notice$dlc = pib.countcd
                    )*/
                --AND birth_date = TO_CHAR(l_dateofbirth, 'DD/MM/YYYY')
                AND
                (
                    birth_date = l_dateofbirth_char
                    OR
                    birth_date = SUBSTR(l_dateofbirth_char, -4, 4)
                    OR
                    birth_date = SUBSTR(l_dateofbirth_char, -7, 7)
                    OR
                    birth_date = SUBSTR(l_dateofbirth_char, -8, 8)
                    OR
                    birth_date = '//' || SUBSTR(l_dateofbirth_char, -4, 4)
                )
                AND
                (
                    cpassportno = v('P17_DISPLAY_DOCNUMBER')
                    OR
                    (l_is_different_passport = 'Y' AND cpassportno = l_last_mvmnt_docno)
                    OR
                    opassportno = v('P17_DISPLAY_DOCNUMBER')
                    OR
                    (l_is_different_passport = 'Y' AND opassportno = l_last_mvmnt_docno)
                    OR
                    (
                        UPPER(TRIM(REGEXP_REPLACE(efamilynm, '\s{2,}', ' '))) = v('P17_DISPLAY_LASTNAME')
                        AND UPPER(TRIM(REGEXP_REPLACE(efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(emiddlenm, '\s{2,}', ' '))), NULL) = v('P17_DISPLAY_FIRSTNAME') || NVL2(v('P17_DISPLAY_MIDDLENAME'), ' ' || v('P17_DISPLAY_MIDDLENAME'), NULL)
                    )
                )
                --AND permit_date >= TRUNC(SYSDATE)
            ORDER BY rqsperson_seqno DESC
        ) t_rqs
        WHERE ROWNUM = 1;

        logger.log('P17 - Get Permit Info: Request for Residence Found', l_scope, null, l_params);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            l_rqs_person_seqno := NULL; --:P17_RQS_PERSON_SEQNO := NULL;
            l_rqs_permit_date := NULL; --:P17_RQS_PERMIT_DATE := NULL;
            l_rqs_exists := NULL;
            l_rqs_exp_date := NULL;

    END;

    -- set session state for request for residence fields
    apex_util.set_session_state('P17_RQS_PERSON_SEQNO', l_rqs_person_seqno, g_commit_apex_session);
    apex_util.set_session_state('P17_RQS_PERMIT_DATE', TO_CHAR(l_rqs_permit_date, 'DD/MM/YYYY'), g_commit_apex_session);

    -----------------------------------------
    -- request for residence block end --
    -----------------------------------------


    -----------------------------------------
    -- re-entry block start --
    -----------------------------------------
    BEGIN

    --    WITH t_tm8 AS
    --    (
    --        SELECT /*+ NO_PARALLEL INDEX(v_reps_tm8 REPS_TM8 REPS_TM8_COMPOSITE_IDX1) */
    --            endpermit_date
    --            , tm8_seqno
    --            , doctype
    --            , ROW_NUMBER() OVER (PARTITION BY NULL ORDER BY tm8_seqno DESC) RN
    --        FROM
    --            dl_bordercontrol.v_reps_tm8
    --            --dl_bordercontrol.xxtmp_reps_tm8
    --        WHERE
    --            -------
    --            (
    --                (
    --                    passportno = v('P17_DISPLAY_DOCNUMBER')
    --                    AND ( passportexp_date is null or TRUNC(passportexp_date) = NVL(l_expirydate, l_extexpirydate) )
    --                )
    --                OR
    --                (
    --                    l_is_different_passport = 'Y'
    --                    AND passportno = l_last_mvmnt_docno
    --                    AND ( passportexp_date is null or TRUNC(passportexp_date) = l_last_mvmnt_docno_exp_date )
    --                )
    --            )
    --            -------
    --            AND national_seqno = l_nation_seqno
    --                /*(
    --                    SELECT pib.count_seqno
    --                    FROM dl_common.icao_doc_codes$lc icao, dl_bordercontrol.v_country pib
    --                    WHERE icao.key_value = v('P17_NATIONALITY')
    --                    AND icao.is_active = 'Y'
    --                    AND icao.notice$dlc = pib.countcd
    --                )*/
    --            AND
    --            (
    --                birth_date IS NULL
    --                OR
    --                --birth_date = TO_CHAR(l_dateofbirth, 'DD/MM/YYYY')
    --                birth_date = l_dateofbirth_char
    --                OR
    --                birth_date = SUBSTR(l_dateofbirth_char, -4, 4)
    --                OR
    --                birth_date = SUBSTR(l_dateofbirth_char, -7, 7)
    --                OR
    --                birth_date = SUBSTR(l_dateofbirth_char, -8, 8)
    --                OR
    --                birth_date = '//' || SUBSTR(l_dateofbirth_char, -4, 4)
    --            )
    --            --AND endpermit_date >= TRUNC(SYSDATE)
    --    )
    --    SELECT
    --        tm8_seqno
    --        , DECODE(SUBSTR(doctype, 1, 1), 'S', 'Single', 'M', 'Multiple', SUBSTR(doctype, 1, 1)) --doctype
    --        , endpermit_date
    --        , 'Y'
    --        , endpermit_date
    --    INTO
    --        l_re_tm8_seqno --:P17_RE_TM8_SEQNO
    --        , l_re_doctype --:P17_RE_DOCTYPE
    --        , l_re_endpermit_date --:P17_RE_ENDPERMIT_DATE
    --        , l_re_exists
    --        , l_re_exp_date
    --    FROM t_tm8
    --    WHERE RN = 1;

        SELECT
            tm8_seqno
            , DECODE(SUBSTR(doctype, 1, 1), 'S', 'Single', 'M', 'Multiple', SUBSTR(doctype, 1, 1)) --doctype
            , endpermit_date
            , 'Y'
            , endpermit_date
        INTO
            l_re_tm8_seqno --:P17_RE_TM8_SEQNO
            , l_re_doctype --:P17_RE_DOCTYPE
            , l_re_endpermit_date --:P17_RE_ENDPERMIT_DATE
            , l_re_exists
            , l_re_exp_date
        FROM
        (
            SELECT /*+ NO_PARALLEL INDEX(v_reps_tm8 REPS_TM8 REPS_TM8_COMPOSITE_IDX1) */
                endpermit_date
                , tm8_seqno
                , doctype
                --, ROW_NUMBER() OVER (PARTITION BY NULL ORDER BY tm8_seqno DESC) RN
            FROM
                dl_bordercontrol.v_reps_tm8
                --dl_bordercontrol.xxtmp_reps_tm8
            WHERE
                -------
                (
                    (
                        passportno = v('P17_DISPLAY_DOCNUMBER')
                        AND ( passportexp_date is null or TRUNC(passportexp_date) = NVL(l_expirydate, l_extexpirydate) )
                    )
                    OR
                    (
                        l_is_different_passport = 'Y'
                        AND passportno = l_last_mvmnt_docno
                        AND ( passportexp_date is null or TRUNC(passportexp_date) = l_last_mvmnt_docno_exp_date )
                    )
                )
                -------
                AND national_seqno = l_nation_seqno
                    /*(
                        SELECT pib.count_seqno
                        FROM dl_common.icao_doc_codes$lc icao, dl_bordercontrol.v_country pib
                        WHERE icao.key_value = v('P17_NATIONALITY')
                        AND icao.is_active = 'Y'
                        AND icao.notice$dlc = pib.countcd
                    )*/
                AND
                (
                    birth_date IS NULL
                    OR
                    --birth_date = TO_CHAR(l_dateofbirth, 'DD/MM/YYYY')
                    birth_date = l_dateofbirth_char
                    OR
                    birth_date = SUBSTR(l_dateofbirth_char, -4, 4)
                    OR
                    birth_date = SUBSTR(l_dateofbirth_char, -7, 7)
                    OR
                    birth_date = SUBSTR(l_dateofbirth_char, -8, 8)
                    OR
                    birth_date = '//' || SUBSTR(l_dateofbirth_char, -4, 4)
                )
                --AND endpermit_date >= TRUNC(SYSDATE)
            ORDER BY tm8_seqno DESC
        ) t_tm8
        WHERE ROWNUM = 1;

        logger.log('P17 - Get Permit Info: Re-Entry Found', l_scope, null, l_params);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            l_re_tm8_seqno := NULL; --:P17_RE_TM8_SEQNO := NULL;
            l_re_doctype := NULL; --:P17_RE_DOCTYPE := NULL;
            l_re_endpermit_date := NULL; --:P17_RE_ENDPERMIT_DATE := NULL;
            l_re_exists := NULL;
            l_re_exp_date := NULL;

    END;

    -- set session state for re-entry fields
    apex_util.set_session_state('P17_RE_TM8_SEQNO', l_re_tm8_seqno, g_commit_apex_session);
    apex_util.set_session_state('P17_RE_DOCTYPE', l_re_doctype, g_commit_apex_session);
    apex_util.set_session_state('P17_RE_ENDPERMIT_DATE', TO_CHAR(l_re_endpermit_date, 'DD/MM/YYYY'), g_commit_apex_session);

    -----------------------------------------
    -- re-entry block end --
    -----------------------------------------


    -----------------------------------------
    -- extend stay block start --
    -----------------------------------------
    BEGIN

    --    WITH t_ext AS
    --    (
    --        SELECT /*+ NO_PARALLEL INDEX(v_ext_extensionlist EXT_EXTENSIONLIST EXTLIST_COMPOSITE_IDX1) */
    --            extlist_seqno
    --            , permit_date
    --            , ROW_NUMBER() OVER (PARTITION BY NULL ORDER BY extlist_seqno DESC) RN
    --        FROM
    --            dl_bordercontrol.v_ext_extensionlist
    --            --dl_bordercontrol.xxtmp_ext_extensionlist
    --        WHERE
    --            approve_sts = 'A'
    --            AND actflag = 'A'
    --            -------
    --            AND
    --            (
    --                (
    --                    passportno = v('P17_DISPLAY_DOCNUMBER')
    --                    AND ( passport_expdate is null or TRUNC(passport_expdate) = NVL(l_expirydate, l_extexpirydate) )
    --                )
    --                OR
    --                (
    --                    l_is_different_passport = 'Y'
    --                    AND passportno = l_last_mvmnt_docno
    --                    AND ( passport_expdate is null or TRUNC(passport_expdate) = l_last_mvmnt_docno_exp_date )
    --                )
    --            )
    --            -------
    --            AND nation_seqno = l_nation_seqno
    --                /*(
    --                    SELECT pib.count_seqno
    --                    FROM dl_common.icao_doc_codes$lc icao, dl_bordercontrol.v_country pib
    --                    WHERE icao.key_value = v('P17_NATIONALITY')
    --                    AND icao.is_active = 'Y'
    --                    AND icao.notice$dlc = pib.countcd
    --                )*/
    --            AND
    --            (
    --                birth_date IS NULL
    --                OR
    --                --birth_date = TO_CHAR(l_dateofbirth, 'DD/MM/YYYY')
    --                birth_date = l_dateofbirth_char
    --                OR
    --                birth_date = SUBSTR(l_dateofbirth_char, -4, 4)
    --                OR
    --                birth_date = SUBSTR(l_dateofbirth_char, -7, 7)
    --                OR
    --                birth_date = SUBSTR(l_dateofbirth_char, -8, 8)
    --                OR
    --                birth_date = '//' || SUBSTR(l_dateofbirth_char, -4, 4)
    --            )
    --            --AND permit_date >= TRUNC(SYSDATE)
    --            AND
    --                CASE
    --                    WHEN in_date IS NULL THEN 1
    --                    WHEN l_last_mvmnt_travel_date IS NULL THEN 1
    --                    WHEN TO_CHAR(in_date, 'DD/MM/YYYY') = TO_CHAR(l_last_mvmnt_travel_date, 'DD/MM/YYYY') THEN 1
    --                    ELSE 0
    --                END = 1
    --    )
    --    SELECT
    --        extlist_seqno
    --        , permit_date
    --        , 'Y'
    --        , permit_date
    --    INTO
    --        l_ext_list_seqno --:P17_EXT_LIST_SEQNO
    --        , l_ext_permit_date --:P17_EXT_PERMIT_DATE
    --        , l_ext_exists
    --        , l_ext_exp_date
    --    FROM t_ext
    --    WHERE RN = 1;

        SELECT
            extlist_seqno
            , permit_date
            , 'Y'
            , permit_date
        INTO
            l_ext_list_seqno --:P17_EXT_LIST_SEQNO
            , l_ext_permit_date --:P17_EXT_PERMIT_DATE
            , l_ext_exists
            , l_ext_exp_date
        FROM
        (
            SELECT /*+ NO_PARALLEL INDEX(v_ext_extensionlist EXT_EXTENSIONLIST EXTLIST_COMPOSITE_IDX1) */
                extlist_seqno
                , permit_date
                --, ROW_NUMBER() OVER (PARTITION BY NULL ORDER BY extlist_seqno DESC) RN
            FROM
                dl_bordercontrol.v_ext_extensionlist
                --dl_bordercontrol.xxtmp_ext_extensionlist
            WHERE
                approve_sts = 'A'
                AND actflag = 'A'
                -------
                AND
                (
                    (
                        passportno = v('P17_DISPLAY_DOCNUMBER')
                        AND ( passport_expdate is null or TRUNC(passport_expdate) = NVL(l_expirydate, l_extexpirydate) )
                    )
                    OR
                    (
                        l_is_different_passport = 'Y'
                        AND passportno = l_last_mvmnt_docno
                        AND ( passport_expdate is null or TRUNC(passport_expdate) = l_last_mvmnt_docno_exp_date )
                    )
                )
                -------
                AND nation_seqno = l_nation_seqno
                    /*(
                        SELECT pib.count_seqno
                        FROM dl_common.icao_doc_codes$lc icao, dl_bordercontrol.v_country pib
                        WHERE icao.key_value = v('P17_NATIONALITY')
                        AND icao.is_active = 'Y'
                        AND icao.notice$dlc = pib.countcd
                    )*/
                AND
                (
                    birth_date IS NULL
                    OR
                    --birth_date = TO_CHAR(l_dateofbirth, 'DD/MM/YYYY')
                    birth_date = l_dateofbirth_char
                    OR
                    birth_date = SUBSTR(l_dateofbirth_char, -4, 4)
                    OR
                    birth_date = SUBSTR(l_dateofbirth_char, -7, 7)
                    OR
                    birth_date = SUBSTR(l_dateofbirth_char, -8, 8)
                    OR
                    birth_date = '//' || SUBSTR(l_dateofbirth_char, -4, 4)
                )
                --AND permit_date >= TRUNC(SYSDATE)
                AND
                    CASE
                        WHEN in_date IS NULL THEN 1
                        WHEN l_last_mvmnt_travel_date IS NULL THEN 1
                        WHEN TO_CHAR(in_date, 'DD/MM/YYYY') = TO_CHAR(l_last_mvmnt_travel_date, 'DD/MM/YYYY') THEN 1
                        ELSE 0
                    END = 1
            ORDER BY extlist_seqno DESC
        ) t_ext
        WHERE ROWNUM = 1;

        logger.log('P17 - Get Permit Info: Extend Stay Found', l_scope, null, l_params);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            l_ext_list_seqno := NULL; --:P17_EXT_LIST_SEQNO := NULL;
            l_ext_permit_date := NULL; --:P17_EXT_PERMIT_DATE := NULL;
            l_ext_exists := NULL;
            l_ext_exp_date := NULL;

    END;

    -- set session state for extend stay fields
    apex_util.set_session_state('P17_EXT_LIST_SEQNO', l_ext_list_seqno, g_commit_apex_session);
    apex_util.set_session_state('P17_EXT_PERMIT_DATE', TO_CHAR(l_ext_permit_date, 'DD/MM/YYYY'), g_commit_apex_session);

    -----------------------------------------
    -- extend stay block end --
    -----------------------------------------


    -----------------------------------------
    -- change visa block start --
    -----------------------------------------
    BEGIN

        -- only for departure
        IF l_movement_direction = 1 THEN

        --    WITH t_chng AS
        --    (
        --        SELECT /*+ NO_PARALLEL */
        --            cv.visaaft_seqno AS VISATYPE_SEQNO --cp.visatype_seqno
        --            , cp.visa_expdate
        --            , cp.chngperson_seqno
        --            , ROW_NUMBER() OVER (PARTITION BY NULL ORDER BY cp.chngperson_seqno, cv.changevisa_seqno DESC) RN
        --        FROM
        --            dl_bordercontrol.v_chng_person cp,
        --            dl_bordercontrol.v_chng_changevisalist cl,
        --            dl_bordercontrol.v_chng_changevisa cv
        --        WHERE
        --            cp.status = 1
        --            AND cp.actflag = 'Y'
        --            -------
        --            AND
        --            (
        --                (
        --                    cp.passportno = v('P17_DISPLAY_DOCNUMBER')
        --                    AND ( cp.passport_expdate is null or TRUNC(cp.passport_expdate) = NVL(l_expirydate, l_extexpirydate) )
        --                )
        --                OR
        --                (
        --                    l_is_different_passport = 'Y'
        --                    AND cp.passportno = l_last_mvmnt_docno
        --                    AND ( cp.passport_expdate is null or TRUNC(cp.passport_expdate) = l_last_mvmnt_docno_exp_date )
        --                )
        --            )
        --            -------
        --            AND cp.nation_seqno = l_nation_seqno
        --                /*(
        --                    SELECT pib.count_seqno
        --                    FROM dl_common.icao_doc_codes$lc icao, dl_bordercontrol.v_country pib
        --                    WHERE icao.key_value = v('P17_NATIONALITY')
        --                    AND icao.is_active = 'Y'
        --                    AND icao.notice$dlc = pib.countcd
        --                )*/
        --            --AND cp.visa_expdate >= TRUNC(SYSDATE)
        --            AND cl.chngperson_seqno = cp.chngperson_seqno
        --            AND cv.changevisa_seqno = cl.changevisa_seqno
        --    )
        --    SELECT
        --        chngperson_seqno
        --        , (SELECT key_value FROM dl_common.visa_types WHERE is_active = 'Y' AND notice = TO_CHAR(t_chng.visatype_seqno))
        --        , visa_expdate
        --        , 'Y'
        --        , visa_expdate
        --    INTO
        --        l_chng_chngperson_seqno --:P17_CHNG_PERSON_SEQNO
        --        , l_chng_visa_type --:P17_CHNG_VISA_TYPE
        --        , l_chng_visa_expdate --:P17_CHNG_EXPIRED_DATE
        --        , l_chng_exists
        --        , l_chng_exp_date
        --    FROM t_chng
        --    WHERE RN = 1;

            SELECT
                chngperson_seqno
                , (SELECT key_value FROM dl_common.visa_types WHERE is_active = 'Y' AND notice = TO_CHAR(t_chng.visatype_seqno))
                , visa_expdate
                , 'Y'
                , visa_expdate
            INTO
                l_chng_chngperson_seqno --:P17_CHNG_PERSON_SEQNO
                , l_chng_visa_type --:P17_CHNG_VISA_TYPE
                , l_chng_visa_expdate --:P17_CHNG_EXPIRED_DATE
                , l_chng_exists
                , l_chng_exp_date
            FROM
            (
                SELECT /*+ NO_PARALLEL */
                    cv.visaaft_seqno AS VISATYPE_SEQNO --cp.visatype_seqno
                    , cp.visa_expdate
                    , cp.chngperson_seqno
                    --, ROW_NUMBER() OVER (PARTITION BY NULL ORDER BY cp.chngperson_seqno, cv.changevisa_seqno DESC) RN
                FROM
                    dl_bordercontrol.v_chng_person cp,
                    dl_bordercontrol.v_chng_changevisalist cl,
                    dl_bordercontrol.v_chng_changevisa cv
                WHERE
                    cp.status = 1
                    AND cp.actflag = 'Y'
                    -------
                    AND
                    (
                        (
                            cp.passportno = v('P17_DISPLAY_DOCNUMBER')
                            AND ( cp.passport_expdate is null or TRUNC(cp.passport_expdate) = NVL(l_expirydate, l_extexpirydate) )
                        )
                        OR
                        (
                            l_is_different_passport = 'Y'
                            AND cp.passportno = l_last_mvmnt_docno
                            AND ( cp.passport_expdate is null or TRUNC(cp.passport_expdate) = l_last_mvmnt_docno_exp_date )
                        )
                    )
                    -------
                    AND cp.nation_seqno = l_nation_seqno
                        /*(
                            SELECT pib.count_seqno
                            FROM dl_common.icao_doc_codes$lc icao, dl_bordercontrol.v_country pib
                            WHERE icao.key_value = v('P17_NATIONALITY')
                            AND icao.is_active = 'Y'
                            AND icao.notice$dlc = pib.countcd
                        )*/
                    --AND cp.visa_expdate >= TRUNC(SYSDATE)
                    AND cl.chngperson_seqno = cp.chngperson_seqno
                    AND cv.changevisa_seqno = cl.changevisa_seqno
                ORDER BY cp.chngperson_seqno, cv.changevisa_seqno DESC
            ) t_chng
            WHERE ROWNUM = 1;

            logger.log('P17 - Get Permit Info: Change Visa Found', l_scope, null, l_params);

        ELSE
            l_chng_chngperson_seqno := NULL;
            l_chng_visa_type := NULL;
            l_chng_visa_expdate := NULL;
            l_chng_exists := NULL;
            l_chng_exp_date := NULL;
        END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            l_chng_chngperson_seqno := NULL; --:P17_CHNG_PERSON_SEQNO := NULL;
            l_chng_visa_type := NULL; --:P17_CHNG_VISA_TYPE
            l_chng_visa_expdate := NULL; --:P17_CHNG_EXPIRED_DATE := NULL;
            l_chng_exists := NULL;
            l_chng_exp_date := NULL;

    END;

    -- set session states
    apex_util.set_session_state('P17_CHNG_PERSON_SEQNO', l_chng_chngperson_seqno, g_commit_apex_session);
    apex_util.set_session_state('P17_CHNG_EXPIRED_DATE', TO_CHAR(l_chng_visa_expdate, 'DD/MM/YYYY'), g_commit_apex_session);
    apex_util.set_session_state('P17_CHNG_VISA_TYPE', l_chng_visa_type, g_commit_apex_session);
    /*
    IF l_chng_visa_type IS NOT NULL THEN
        apex_util.set_session_state('P17_CHNG_VISA_TYPE', l_chng_visa_type, g_commit_apex_session);
        apex_util.set_session_state('P17_VISUM_5', l_chng_visa_expdate, g_commit_apex_session);
    END IF;
    */

    -----------------------------------------
    -- change visa block end --
    -----------------------------------------

    /*
    priority:
    Arrival
    1. Request Residence
    2. Re-Entry
    3. Extend Stay
    Departure
    1. Request Residence
    2. Extend Stay
    3. Re-Entry
    */
    <<lbl_p17_get_permit_info_end>>
    BEGIN
        SELECT diag_type, permit_type, exp_date
        INTO l_disp_diag, l_permit_type, l_permit_exp_date
        FROM
        (
            SELECT *
            FROM
            (
                SELECT l_endq_exists DOES_EXIST, 'REG_ENDORSEMENT' DIAG_TYPE, '3' PERMIT_TYPE, l_endq_exp_date EXP_DATE, 0 priority_order FROM DUAL
                UNION ALL
                SELECT l_rqs_exists DOES_EXIST, 'REG_REQ4RESIDENCE' DIAG_TYPE, '4' PERMIT_TYPE, l_rqs_exp_date EXP_DATE, 1 priority_order FROM DUAL
                UNION ALL
                SELECT l_ext_exists DOES_EXIST, CASE WHEN l_re_exists = 'Y' AND TRUNC(l_re_exp_date) = TRUNC(l_ext_exp_date) THEN 'REG_REENTRY,REG_EXTENDSTAY' ELSE 'REG_EXTENDSTAY' END DIAG_TYPE, '1' PERMIT_TYPE, l_ext_exp_date EXP_DATE, DECODE(l_movement_direction, 0, 3, 2) priority_order FROM DUAL
                UNION ALL
                SELECT l_re_exists DOES_EXIST, CASE WHEN l_ext_exists = 'Y' AND TRUNC(l_ext_exp_date) = TRUNC(l_re_exp_date) THEN 'REG_REENTRY,REG_EXTENDSTAY' ELSE 'REG_REENTRY' END DIAG_TYPE, '2' PERMIT_TYPE, l_re_exp_date EXP_DATE, DECODE(l_movement_direction, 0, 2, 3) priority_order FROM DUAL
                UNION ALL
                SELECT l_chng_exists DOES_EXIST, 'REG_CHANGEVISA' DIAG_TYPE, '5' PERMIT_TYPE, l_chng_exp_date EXP_DATE, 4 priority_order FROM DUAL
            )
            WHERE does_exist IS NOT NULL
            ORDER BY exp_date DESC, priority_order
        )
        WHERE ROWNUM = 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            l_disp_diag := NULL;
            l_permit_type := NULL;
            l_permit_exp_date := NULL;
    END;

    --:P17_IS_PERMIT_INFO := l_disp_diag;
    apex_util.set_session_state('P17_IS_PERMIT_INFO', l_disp_diag, g_commit_apex_session);

    IF l_disp_diag IS NOT NULL THEN
        apex_util.set_session_state('P17_PERMIT_TYPE', l_permit_type, g_commit_apex_session);

        -- set permit expiry date with exception in case of change visa
        -- in case of change visa, allow new departure visa on screen
        IF l_disp_diag != 'REG_CHANGEVISA' THEN
            apex_util.set_session_state('P17_PERMIT_EXPIRY', TO_CHAR(l_permit_exp_date, 'DD/MM/YYYY'), g_commit_apex_session);
        END IF;

        -- for departure and resident/endorsement, only show valid permit with expiry date more than sysdate
        IF l_disp_diag = 'REG_ENDORSEMENT' AND NVL(l_permit_exp_date, SYSDATE - 1) < SYSDATE AND l_movement_direction = 1 THEN
            apex_util.set_session_state('P17_IS_PERMIT_INFO', NULL, g_commit_apex_session);
            apex_util.set_session_state('P17_PERMIT_TYPE', NULL, g_commit_apex_session);
            apex_util.set_session_state('P17_PERMIT_EXPIRY', NULL, g_commit_apex_session);
        END IF;
    ELSE
        apex_util.set_session_state('P17_IS_PERMIT_INFO', NULL, g_commit_apex_session);
        apex_util.set_session_state('P17_PERMIT_TYPE', NULL, g_commit_apex_session);
        apex_util.set_session_state('P17_PERMIT_EXPIRY', NULL, g_commit_apex_session);
    END IF;

    logger.log('P17 - Get Permit Info: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('P17 - Get Permit Info: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END p17_get_permit_info;

  /**
   * Get Overstay info
   * Added by MSCS
   */
  PROCEDURE p17_get_overstay_info
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'p17_get_overstay_info';
    l_params logger.tab_param;
    --
    l_expirydate    DATE;
    l_extexpirydate DATE;
    --l_dateofbirth   DATE; -- NOT IN USE _ DISABLED FUNCTIONALITY
    -- partial dob vars
    --l_dob_partial       DL_BORDERCONTROL.CT_PARTIAL_DATE_TYPE;
    --l_is_dob_partial    PLS_INTEGER := 0;
    --
    l_min_age_threshold NUMBER := 15;
    l_age               NUMBER := l_min_age_threshold;
    --
    l_vos_in_date        DATE;
    l_vos_visa_expdate   DATE;
    l_vos_ext_date       DATE;
    l_vos_permit_date    DATE;
    l_vos_extovs_date    DATE;
    l_vos_processdte     DATE;
    l_vos_extovs_seqno   NUMBER;
    l_vos_visatype       VARCHAR2(32);
    l_vos_exists         VARCHAR2(1) := 'N';
    --
    l_movement_direction    NUMBER := NVL(v('MOVEMENT_ENTRY_EXIT'), 0);
    --
    l_disp_visa_exp_date      DATE := pkg_common.tolerant_to_date(v('P17_VISUM_5'), 'DD/MM/YYYY');
    l_disp_permit_exp_date    DATE := pkg_common.tolerant_to_date(v('P17_PERMIT_EXPIRY'), 'DD/MM/YYYY');
    --
    l_src               VARCHAR2(32);
    l_src_exp_date      DATE;
    --
    l_last_mvmnt_direction      MOVEMENTS.EXITFLG%TYPE := v('P17_LAST_DIRECTION');
    l_last_mvmnt_docno          BORDERDOCUMENTS.DOCNO%TYPE := v('P17_LAST_MVMNT_DOCNO');
    l_last_mvmnt_docno_exp_date DATE := pkg_common.tolerant_to_date(v('P17_LAST_MVMNT_DOCNO_EXP_DATE'), 'DD/MM/YYYY');
    l_last_mvmnt_src            VARCHAR2(100) := v('P17_LAST_MVMNT_SRC');
    l_last_mvmnt_src_sec        VARCHAR2(100) := v('P17_LAST_MVMNT_SRC_SEC');
    l_last_mvmnt_src_sec_pk_val VARCHAR2(100) := v('P17_LAST_MVMNT_SRC_SEC_PK_VAL');
    l_last_mvmnt_visa_type      VARCHAR2(32) := v('P17_LAST_MVMNT_VISA_TYPE');
    l_last_mvmnt_travel_date    DATE := pkg_common.tolerant_to_date(v('P17_LAST_MVMNT_TRAVEL_DATE'), 'DD/MM/YYYY');
    --
    l_is_different_passport     VARCHAR2(1) := 'N';
    --
    l_nation_seqno              NUMBER;
    --

  BEGIN

    -- submit
    -- P17_DISPLAY_DOCNUMBER,P17_MANUAL_EXPIRYDATE,P17_DISPLAY_EXPIRYDATE,P17_NATIONALITY,P17_DISPLAY_DOB_TEXT

    -- return
    -- P17_OVERSTAY_INFO_TRAVEL_DATE,P17_OVERSTAY_INFO_TODAY,P17_OVERSTAY_INFO_EXPIRY_DATE,P17_OVERSTAY_INFO_DAYS,
    -- P17_OVERSTAY_VISA_TYPE

    DL_COMMON.PKG_I18N.Alter_Sess_Data_Locale(p_LOCALE => 'en_US');

    IF l_movement_direction = 0 THEN
        RETURN;
    END IF;

    l_expirydate := COALESCE(pkg_common.parse_date(v('P17_DISPLAY_EXPIRYDATE'), 0, 1, 20, 1)
                            ,pkg_common.parse_date(v('P17_DISPLAY_EXPIRYDATE'), 1, 0, 0, 1)
                            ,pkg_common.tolerant_to_date(v('P17_DISPLAY_EXPIRYDATE'), 'DD/MM/YYYY'));

    l_extexpirydate := COALESCE(pkg_common.parse_date(v('P17_MANUAL_EXPIRYDATE'), 0, 1, 20, 1)
                               ,pkg_common.parse_date(v('P17_MANUAL_EXPIRYDATE'), 1, 0, 0, 1)
                               ,pkg_common.tolerant_to_date(v('P17_MANUAL_EXPIRYDATE'), 'DD/MM/YYYY'));

    /* -- NOT IN USE
    -- partial DOB
    l_dob_partial := pkg_common.Get_Partial_Date(v('P17_DISPLAY_DOB_TEXT'), 1, 0, 0, 1);
    IF l_dob_partial.isValidDate() = 1 THEN
        l_dateofbirth := l_dob_partial.getDate();
    ELSE
        l_is_dob_partial := 1;
    END IF;
    */
    
    -- replaced by partial dob logic
    /*
    l_dateofbirth := COALESCE(pkg_common.parse_date(v('P17_DISPLAY_DOB'), 1, 0, 0, 1)
                             ,pkg_common.tolerant_to_date(v('P17_DISPLAY_DOB'), 'DD/MM/YYYY'));
    */
    
    -- dont check overstay for age less than l_min_age_threshold
    -- disabled
    /*
    IF l_dateofbirth IS NOT NULL THEN
        l_age := TRUNC((TO_NUMBER(TO_CHAR(SYSDATE, 'YYYYMMDD')) - TO_NUMBER(TO_CHAR(l_dateofbirth, 'YYYYMMDD'))) / 10000);
    END IF;
    
    IF NVL(l_age, l_min_age_threshold) < l_min_age_threshold THEN
        logger.log('P17 - Get Overstay Info: Age < ' || TO_CHAR(l_min_age_threshold), l_scope, null, l_params);
        RETURN;
    END IF;
    */

    -- check if the doc is different from the one used at the last arrival
    IF
        l_movement_direction = 1
        AND l_last_mvmnt_direction = 0
        AND l_last_mvmnt_docno IS NOT NULL
        AND NVL(l_last_mvmnt_docno, '~') != NVL(v('P17_DISPLAY_DOCNUMBER'), '~')
    THEN
        l_is_different_passport := 'Y';
    END IF;

    /* get params for pibics fetch starts */
    -- NAT might be different than ISSUECTRY in case of stateless
    -- use ISSUECTRY to get the last movement info from BIO
    -- use NAT to get the last movement info from PIBICS
    -- if NAT is null, use ISSUECTRY
    BEGIN
        SELECT pib.count_seqno
        INTO l_nation_seqno
        FROM dl_common.icao_doc_codes$lc icao, dl_bordercontrol.v_country pib
        WHERE icao.key_value = NVL(v('P17_STATELESS'), v('P17_NATIONALITY'))
        AND icao.is_active = 'Y'
        AND icao.notice$dlc = pib.countcd;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            l_nation_seqno := NULL;
    END;
    /* get params for pibics fetch ends */

    logger.append_param(l_params, 'P17_DISPLAY_EXPIRYDATE', l_expirydate);
    logger.append_param(l_params, 'P17_MANUAL_EXPIRYDATE', l_extexpirydate);
    /*logger.append_param(l_params, 'P17_DISPLAY_DOB', l_dateofbirth);
    logger.append_param(l_params, 'l_is_dob_partial', l_is_dob_partial);
    logger.append_param(l_params, 'P17_DISPLAY_DOB_TEXT', l_dob_partial.getFormatData('DD/MM/YYYY'));*/
    logger.append_param(l_params, 'P17_DISPLAY_DOCNUMBER', v('P17_DISPLAY_DOCNUMBER'));
    logger.append_param(l_params, 'P17_NATIONALITY', v('P17_NATIONALITY'));
    logger.append_param(l_params, 'P17_STATELESS', v('P17_STATELESS'));
    logger.append_param(l_params, 'IS_DIFFERENT_PASSPORT', l_is_different_passport);
    logger.log('P17 - Get Overstay Info: start', l_scope, null, l_params);

    /* overstay block start */
    BEGIN

    --    WITH t_overstay AS
    --    (
    --        SELECT /*+ NO_PARALLEL */
    --            in_date
    --            , visa_expdate
    --            , ext_date
    --            , permit_date
    --            , extovs_date
    --            , processdte
    --            , extovs_seqno
    --            , visatype_seqno
    --            , ROW_NUMBER() OVER (PARTITION BY NULL ORDER BY extovs_seqno DESC) RN
    --        FROM
    --            dl_bordercontrol.v_processot v
    --        WHERE
    --            approve_sts = 'A'
    --            AND TRUNC(CAST(extovs_date AS DATE)) <= TRUNC(SYSDATE)
    --            AND nation_seqno = l_nation_seqno
    --                    /*(
    --                        SELECT pib.count_seqno
    --                        FROM dl_common.icao_doc_codes$lc icao, dl_bordercontrol.v_country pib
    --                        WHERE icao.key_value = v('P17_NATIONALITY')
    --                        AND icao.is_active = 'Y'
    --                        AND icao.notice$dlc = pib.countcd
    --                    )*/
    --            AND
    --            (
    --                (
    --                    opassportno = v('P17_DISPLAY_DOCNUMBER')
    --                    AND ( opassport_expdate is null or TRUNC(opassport_expdate) = NVL(l_expirydate, l_extexpirydate) )
    --                )
    --                OR
    --                (
    --                    l_is_different_passport = 'Y'
    --                    AND opassportno = l_last_mvmnt_docno
    --                    AND ( opassport_expdate is null or TRUNC(opassport_expdate) = l_last_mvmnt_docno_exp_date )
    --                )
    --                OR
    --                (
    --                    cpassportno = v('P17_DISPLAY_DOCNUMBER')
    --                    AND ( cpassport_expdate is null or TRUNC(cpassport_expdate) = NVL(l_expirydate, l_extexpirydate) )
    --                )
    --                OR
    --                (
    --                    l_is_different_passport = 'Y'
    --                    AND cpassportno = l_last_mvmnt_docno
    --                    AND ( cpassport_expdate is null or TRUNC(cpassport_expdate) = l_last_mvmnt_docno_exp_date )
    --                )
    --            )
    --            AND NOT EXISTS
    --            (
    --                SELECT NULL
    --                FROM dl_bordercontrol.v_delprocessot
    --                WHERE extovs_seqno = v.extovs_seqno
    --            )
    --    )
    --    SELECT
    --        TRUNC(in_date)
    --        , visa_expdate
    --        , ext_date
    --        , permit_date
    --        , TRUNC(CAST(extovs_date AS DATE)) EXTOVS_DATE
    --        , TRUNC(CAST(processdte AS DATE)) PROCESSDTE
    --        , extovs_seqno
    --        , (SELECT key_value FROM dl_common.visa_types WHERE is_active = 'Y' AND notice = TO_CHAR(t_overstay.visatype_seqno))
    --        , 'Y'
    --    INTO
    --        l_vos_in_date --:P17_RE_TM8_SEQNO
    --        , l_vos_visa_expdate --:P17_RE_DOCTYPE
    --        , l_vos_ext_date
    --        , l_vos_permit_date --:P17_RE_ENDPERMIT_DATE
    --        , l_vos_extovs_date
    --        , l_vos_processdte
    --        , l_vos_extovs_seqno
    --        , l_vos_visatype
    --        , l_vos_exists
    --    FROM t_overstay
    --    WHERE RN = 1;

        SELECT
            TRUNC(in_date)
            , visa_expdate
            , ext_date
            , permit_date
            , TRUNC(CAST(extovs_date AS DATE)) EXTOVS_DATE
            , TRUNC(CAST(processdte AS DATE)) PROCESSDTE
            , extovs_seqno
            , (SELECT key_value FROM dl_common.visa_types WHERE is_active = 'Y' AND notice = TO_CHAR(t_overstay.visatype_seqno))
            , 'Y'
        INTO
            l_vos_in_date --:P17_RE_TM8_SEQNO
            , l_vos_visa_expdate --:P17_RE_DOCTYPE
            , l_vos_ext_date
            , l_vos_permit_date --:P17_RE_ENDPERMIT_DATE
            , l_vos_extovs_date
            , l_vos_processdte
            , l_vos_extovs_seqno
            , l_vos_visatype
            , l_vos_exists
        FROM
        (
            SELECT /*+ NO_PARALLEL */
                in_date
                , visa_expdate
                , ext_date
                , permit_date
                , extovs_date
                , processdte
                , extovs_seqno
                , visatype_seqno
                --, ROW_NUMBER() OVER (PARTITION BY NULL ORDER BY extovs_seqno DESC) RN
            FROM
                dl_bordercontrol.v_processot v
            WHERE
                approve_sts = 'A'
                AND TRUNC(CAST(extovs_date AS DATE)) <= TRUNC(SYSDATE)
                AND nation_seqno = l_nation_seqno
                        /*(
                            SELECT pib.count_seqno
                            FROM dl_common.icao_doc_codes$lc icao, dl_bordercontrol.v_country pib
                            WHERE icao.key_value = v('P17_NATIONALITY')
                            AND icao.is_active = 'Y'
                            AND icao.notice$dlc = pib.countcd
                        )*/
                AND
                (
                    (
                        opassportno = v('P17_DISPLAY_DOCNUMBER')
                        AND ( opassport_expdate is null or TRUNC(opassport_expdate) = NVL(l_expirydate, l_extexpirydate) )
                    )
                    OR
                    (
                        l_is_different_passport = 'Y'
                        AND opassportno = l_last_mvmnt_docno
                        AND ( opassport_expdate is null or TRUNC(opassport_expdate) = l_last_mvmnt_docno_exp_date )
                    )
                    OR
                    (
                        cpassportno = v('P17_DISPLAY_DOCNUMBER')
                        AND ( cpassport_expdate is null or TRUNC(cpassport_expdate) = NVL(l_expirydate, l_extexpirydate) )
                    )
                    OR
                    (
                        l_is_different_passport = 'Y'
                        AND cpassportno = l_last_mvmnt_docno
                        AND ( cpassport_expdate is null or TRUNC(cpassport_expdate) = l_last_mvmnt_docno_exp_date )
                    )
                )
                AND NOT EXISTS
                (
                    SELECT NULL
                    FROM dl_bordercontrol.v_delprocessot
                    WHERE extovs_seqno = v.extovs_seqno
                )
            ORDER BY extovs_seqno DESC
        ) t_overstay
        WHERE ROWNUM = 1;

        logger.log('P17 - Get Overstay Info: Overstay Found in PROCESSOT', l_scope, null, l_params);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            l_vos_in_date := NULL; --:P17_RE_TM8_SEQNO := NULL;
            l_vos_visa_expdate := NULL; --:P17_RE_DOCTYPE := NULL;
            l_vos_ext_date := NULL; --:P17_RE_ENDPERMIT_DATE := NULL;
            l_vos_permit_date := NULL;
            l_vos_extovs_date := NULL;
            l_vos_processdte := NULL;
            l_vos_extovs_seqno := NULL;
            l_vos_visatype := NULL;
            l_vos_exists := NULL;

    END;
    /* overstay block end */

    IF NOT
    (
        NVL(l_vos_permit_date, SYSDATE - 1) >= SYSDATE
        OR
        NVL(l_disp_visa_exp_date, SYSDATE - 1) >= SYSDATE
        OR
        NVL(l_disp_permit_exp_date, SYSDATE - 1) >= SYSDATE
    )
    THEN
        BEGIN
            SELECT SRC, exp_date
            INTO l_src, l_src_exp_date
            FROM
            (
                SELECT *
                FROM
                (
                    SELECT l_vos_exists DOES_EXIST, 'PROCESSOT' SRC, l_vos_permit_date EXP_DATE FROM DUAL
                    UNION ALL
                    SELECT NVL2(l_disp_permit_exp_date, 'Y', NULL) DOES_EXIST, 'PERMIT' SRC, l_disp_permit_exp_date EXP_DATE FROM DUAL
                    UNION ALL
                    SELECT NVL2(l_disp_visa_exp_date, 'Y', NULL) DOES_EXIST, 'VISA' SRC, l_disp_visa_exp_date EXP_DATE FROM DUAL
                )
                WHERE does_exist IS NOT NULL
                ORDER BY exp_date DESC
            )
            WHERE ROWNUM = 1;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                l_src := NULL;
                l_src_exp_date := NULL;
        END;

        IF l_src IN ('PERMIT', 'VISA') THEN
            l_vos_visatype := l_last_mvmnt_visa_type; --v('P17_VISUM');
            l_vos_permit_date := l_src_exp_date;

            -- l_vos_in_date
            l_vos_in_date := l_last_mvmnt_travel_date;
            /*
            CASE l_last_mvmnt_src
                WHEN 'BIO' THEN
                    --
                    select movement_dt
                    into l_vos_in_date
                    from dl_bordercontrol.movements
                    where mvmntid = l_last_mvmnt_src_sec_pk_val;
                    --
                WHEN 'PIBICS' THEN
                    CASE l_last_mvmnt_src_sec
                        WHEN 'TMINOUT_MA' THEN
                            --
                            select inoutdte
                            into l_vos_in_date
                            from dl_bordercontrol.v_tminout_ma
                            where seqno = l_last_mvmnt_src_sec_pk_val;
                            --
                        WHEN 'TMINOUT' THEN
                            --
                            select inoutdte
                            into l_vos_in_date
                            from dl_bordercontrol.v_tminout
                            where seqno = l_last_mvmnt_src_sec_pk_val;
                            --
                        WHEN 'TMMAIN_IN' THEN
                            --
                            select indte
                            into l_vos_in_date
                            from dl_bordercontrol.v_tmmain
                            where tmrunno = l_last_mvmnt_src_sec_pk_val;
                            --
                        ELSE
                            l_vos_in_date := NULL;
                    END CASE;
                ELSE
                    l_vos_in_date := NULL;
            END CASE;
            */
        END IF;

        -- set session states
        apex_util.set_session_state('P17_OVERSTAY_INFO_TRAVEL_DATE', TO_CHAR(l_vos_in_date, 'DD/MM/YYYY'), g_commit_apex_session); -- Arrival Date
        apex_util.set_session_state('P17_OVERSTAY_INFO_TODAY', TO_CHAR(TRUNC(SYSDATE), 'DD/MM/YYYY'), g_commit_apex_session); -- Current Date
        apex_util.set_session_state('P17_OVERSTAY_VISA_TYPE', l_vos_visatype, g_commit_apex_session); -- Visa Type
        apex_util.set_session_state('P17_OVERSTAY_INFO_EXPIRY_DATE', TO_CHAR(l_vos_permit_date, 'DD/MM/YYYY'), g_commit_apex_session); -- Visa Expiry Date
        apex_util.set_session_state('P17_OVERSTAY_INFO_DAYS', TO_CHAR(TRUNC(SYSDATE) - l_vos_permit_date), g_commit_apex_session); -- Overstay Days

        -- log
        logger.append_param(l_params, 'P17_OVERSTAY_INFO_TRAVEL_DATE', TO_CHAR(l_vos_in_date, 'DD/MM/YYYY'));
        logger.append_param(l_params, 'P17_OVERSTAY_INFO_TODAY', TO_CHAR(TRUNC(SYSDATE), 'DD/MM/YYYY'));
        logger.append_param(l_params, 'P17_OVERSTAY_VISA_TYPE', l_vos_visatype);
        logger.append_param(l_params, 'P17_OVERSTAY_INFO_EXPIRY_DATE', TO_CHAR(l_vos_permit_date, 'DD/MM/YYYY'));
        logger.append_param(l_params, 'P17_OVERSTAY_INFO_DAYS', TO_CHAR(TRUNC(SYSDATE) - l_vos_permit_date));
        logger.log('P17 - Get Overstay Info: Overstay SRC: ' || l_src, l_scope, null, l_params);
    ELSE
        -- set session states
        apex_util.set_session_state('P17_OVERSTAY_INFO_TRAVEL_DATE', NULL, g_commit_apex_session); -- Arrival Date
        apex_util.set_session_state('P17_OVERSTAY_INFO_TODAY', NULL, g_commit_apex_session); -- Current Date
        apex_util.set_session_state('P17_OVERSTAY_VISA_TYPE', NULL, g_commit_apex_session); -- Visa Type
        apex_util.set_session_state('P17_OVERSTAY_INFO_EXPIRY_DATE', NULL, g_commit_apex_session); -- Visa Expiry Date
        apex_util.set_session_state('P17_OVERSTAY_INFO_DAYS', NULL, g_commit_apex_session); -- Overstay Days
    END IF;

    logger.log('P17 - Get Overstay Info: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('P17 - Get Overstay Info: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END p17_get_overstay_info;

  /**
   * Get Last Movement info
   * Added by MSCS
   */
  PROCEDURE p17_get_last_movement_info (p_load_data_on_departure in varchar2 default 'N')
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'p17_get_last_movement_info';
    l_params logger.tab_param;
    --
    l_expirydate    DATE;
    l_extexpirydate DATE;
    --
    l_last_movement_info    dl_movementhandling.last_movement_info_rec_typ;
    --
  BEGIN

    -- submit
    -- P17_DISPLAY_DOCNUMBER,P17_NATIONALITY,P17_DISPLAY_EXPIRYDATE,P17_MANUAL_EXPIRYDATE,P17_DISPLAY_GENDER,P17_DISPLAY_DOB_TEXT,
    -- P17_DISPLAY_LASTNAME,P17_DISPLAY_FIRSTNAME,P17_DISPLAY_MIDDLENAME,P17_STATELESS,P17_CHECK_PIBICS_CONN

    -- return
    -- P17_LAST_DIRECTION,P17_LAST_MVMNT_SRC,P17_LAST_MVMNT_SRC_SEC,P17_LAST_MVMNT_SRC_SEC_PK_VAL,P17_LAST_MVMNT_TRAVEL_DATE,
    -- P17_LAST_MVMNT_DOCNO,P17_LAST_MVMNT_DOCNO_EXP_DATE,P17_LAST_MVMNT_VISA_TYPE,P17_LAST_MVMNT_VISA_EXP_DATE,
    -- P17_VISUM_1,P17_VISA_TYPE_ID,P17_VISUM,P17_VISUM_4,P17_VISUM_5,P17_PERMIT_TYPE,P17_PERMIT_EXPIRY,P17_TRAVELCARD_NO,P17_PROVINCE,P17_TMP_AMPUR,P17_TMP_TAMBON,P17_LC_ADDRESS

    DL_COMMON.PKG_I18N.Alter_Sess_Data_Locale(p_LOCALE => 'en_US');

    l_expirydate := COALESCE(pkg_common.parse_date(v('P17_DISPLAY_EXPIRYDATE'), 0, 1, 20, 1)
                            ,pkg_common.parse_date(v('P17_DISPLAY_EXPIRYDATE'), 1, 0, 0, 1)
                            ,pkg_common.tolerant_to_date(v('P17_DISPLAY_EXPIRYDATE'), 'DD/MM/YYYY'));

    l_extexpirydate := COALESCE(pkg_common.parse_date(v('P17_MANUAL_EXPIRYDATE'), 0, 1, 20, 1)
                               ,pkg_common.parse_date(v('P17_MANUAL_EXPIRYDATE'), 1, 0, 0, 1)
                               ,pkg_common.tolerant_to_date(v('P17_MANUAL_EXPIRYDATE'), 'DD/MM/YYYY'));

    logger.append_param(l_params, 'p_load_data_on_departure', p_load_data_on_departure);
    logger.append_param(l_params, 'P17_DISPLAY_DOCNUMBER', v('P17_DISPLAY_DOCNUMBER'));
    logger.append_param(l_params, 'P17_NATIONALITY', v('P17_NATIONALITY'));
    logger.append_param(l_params, 'P17_DISPLAY_EXPIRYDATE', l_expirydate);
    logger.append_param(l_params, 'P17_MANUAL_EXPIRYDATE', l_extexpirydate);
    logger.append_param(l_params, 'P17_DISPLAY_GENDER', v('P17_DISPLAY_GENDER'));
    logger.append_param(l_params, 'P17_DISPLAY_DOB', v('P17_DISPLAY_DOB'));
    logger.append_param(l_params, 'P17_DISPLAY_DOB_TEXT', v('P17_DISPLAY_DOB_TEXT'));
    logger.append_param(l_params, 'P17_DISPLAY_LASTNAME', v('P17_DISPLAY_LASTNAME'));
    logger.append_param(l_params, 'P17_DISPLAY_FIRSTNAME', v('P17_DISPLAY_FIRSTNAME'));
    logger.append_param(l_params, 'P17_DISPLAY_MIDDLENAME', v('P17_DISPLAY_MIDDLENAME'));
    logger.append_param(l_params, 'P17_STATELESS', v('P17_STATELESS'));
    logger.append_param(l_params, 'P17_CHECK_PIBICS_CONN', v('P17_CHECK_PIBICS_CONN'));

    logger.log('P17 - GET LAST MOVEMENT INFO: start', l_scope, null, l_params);

    l_last_movement_info := dl_movementhandling.Get_Last_Movement_Info
                            (
                                p_DOCNO            => v('P17_DISPLAY_DOCNUMBER')
                                ,p_ISSUECTRY       => v('P17_NATIONALITY')
                                ,p_EXPIRYDATE      => NVL(l_expirydate, l_extexpirydate) -- cant use manual expiry
                                ,p_GENDER          => v('P17_DISPLAY_GENDER')
                                ,p_DOB             => v('P17_DISPLAY_DOB_TEXT') --v('P17_DISPLAY_DOB')
                                ,p_SURNAME         => v('P17_DISPLAY_LASTNAME')
                                ,p_GIVENNAME       => v('P17_DISPLAY_FIRSTNAME')
                                ,p_MIDDLENAME      => v('P17_DISPLAY_MIDDLENAME')
                                ,p_EXITFLG         => NULL
                                ,p_NATIONALITY     => v('P17_STATELESS')
                                ,p_PIBICS_PRD_CONN => 1 --v('P17_CHECK_PIBICS_CONN')
                            );

    logger.append_param(l_params, 'last_movement_source', l_last_movement_info.source);
    logger.append_param(l_params, 'last_movement_direction', l_last_movement_info.direction);

    -- set last movement fields
    apex_util.set_session_state('P17_LAST_DIRECTION', l_last_movement_info.direction, g_commit_apex_session);
    apex_util.set_session_state('P17_LAST_MVMNT_SRC', l_last_movement_info.source, g_commit_apex_session);
    apex_util.set_session_state('P17_LAST_MVMNT_SRC_SEC', l_last_movement_info.source_sec, g_commit_apex_session);
    apex_util.set_session_state('P17_LAST_MVMNT_SRC_SEC_PK_VAL', l_last_movement_info.source_sec_pk_val, g_commit_apex_session);
    apex_util.set_session_state('P17_LAST_MVMNT_TRAVEL_DATE', TO_CHAR(l_last_movement_info.travel_date, 'DD/MM/YYYY'), g_commit_apex_session);
    apex_util.set_session_state('P17_LAST_MVMNT_DOCNO', l_last_movement_info.docno, g_commit_apex_session);
    apex_util.set_session_state('P17_LAST_MVMNT_DOCNO_EXP_DATE', TO_CHAR(l_last_movement_info.docno_expiry_date, 'DD/MM/YYYY'), g_commit_apex_session);
    apex_util.set_session_state('P17_LAST_MVMNT_VISA_TYPE', l_last_movement_info.visa_type, g_commit_apex_session);
    apex_util.set_session_state('P17_LAST_MVMNT_VISA_EXP_DATE', TO_CHAR(l_last_movement_info.visa_expiry_date, 'DD/MM/YYYY'), g_commit_apex_session);

    -- if last arrival visa/form data is requested
    -- continue if last movement was an arrival
    IF NVL(p_load_data_on_departure, 'N') = 'Y' /*AND l_last_movement_info.direction = 0*/ THEN

        -- set APEX Items
        IF NVL(v('P17_NATIONALITY'), '~') != 'THA' THEN
            -- set APEX Items for VISA fields
            apex_util.set_session_state('P17_VISUM_1' -- Visa Number
                                        ,l_last_movement_info.visa_number, g_commit_apex_session);
            apex_util.set_session_state('P17_VISA_TYPE_ID' -- Visa Type (Code field)
                                        ,SUBSTR(l_last_movement_info.visa_type, -2, 2), g_commit_apex_session);
            apex_util.set_session_state('P17_VISUM' -- Visa Type (Select List)
                                        ,l_last_movement_info.visa_type, g_commit_apex_session);
                                        --,v_visa_type_display);
            apex_util.set_session_state('P17_VISUM_4' -- Length of stay (short field)
                                        ,null, g_commit_apex_session);
            apex_util.set_session_state('P17_VISUM_5' -- Date of Expiry
                                        ,TO_CHAR(l_last_movement_info.visa_expiry_date, 'DD/MM/YYYY'), g_commit_apex_session);

            IF l_last_movement_info.source = 'BIO' THEN
                --IF apex_util.get_session_state('P17_PERMIT_TYPE') IS NULL THEN
                    apex_util.set_session_state('P17_PERMIT_TYPE' -- Permit type (Select List)
                                                ,l_last_movement_info.permit_type, g_commit_apex_session);
                --END IF;
                --IF apex_util.get_session_state('P17_PERMIT_EXPIRY') IS NULL THEN
                    apex_util.set_session_state('P17_PERMIT_EXPIRY' -- Permit Expiry Date
                                                ,TO_CHAR(l_last_movement_info.permit_expiry_date, 'DD/MM/YYYY'), g_commit_apex_session);
                --END IF;
            END IF;

            -- set APEX Items for ENTRY FORM fields
            apex_util.set_session_state('P17_TRAVELCARD_NO'
                                    ,CASE
                                        WHEN l_last_movement_info.visa_type = '0023' AND l_last_movement_info.entry_form_no = '0000000' THEN 'XX00000'
                                        ELSE l_last_movement_info.entry_form_no
                                     END
                                    , g_commit_apex_session);

            apex_util.set_session_state('P17_PROVINCE'
                                    ,NVL(l_last_movement_info.province, v('AI_BORDERPOST_PROVINCE_ID')), g_commit_apex_session);

            apex_util.set_session_state('P17_TMP_AMPUR'
                                    ,l_last_movement_info.district, g_commit_apex_session);

            apex_util.set_session_state('P17_TMP_TAMBON'
                                    ,l_last_movement_info.subdistrict, g_commit_apex_session);

            apex_util.set_session_state('P17_LC_ADDRESS'
                                    ,l_last_movement_info.address, g_commit_apex_session);

            -- update VISA_IMAGE/LANDINGCARD_IMAGE collection
            IF l_last_movement_info.source = 'BIO' THEN
                APEX_COLLECTION.UPDATE_MEMBER
                (
                    p_collection_name => 'VISA_IMAGE',
                    p_seq  => 1,
                    p_blob001 => l_last_movement_info.visa_image
                );

                APEX_COLLECTION.UPDATE_MEMBER
                (
                    p_collection_name => 'LANDINGCARD_IMAGE',
                    p_seq  => 1,
                    p_blob001 => l_last_movement_info.entry_form_image
                );
            END IF;
            --
        END IF;
        --

    END IF;

    logger.log('P17 - GET LAST MOVEMENT INFO: done', l_scope, null, l_params);

  EXCEPTION
    WHEN OTHERS
    THEN
      apex_util.set_session_state('P17_LAST_DIRECTION', NULL, g_commit_apex_session);
      apex_util.set_session_state('P17_LAST_MVMNT_SRC', NULL, g_commit_apex_session);
      apex_util.set_session_state('P17_LAST_MVMNT_SRC_SEC', NULL, g_commit_apex_session);
      apex_util.set_session_state('P17_LAST_MVMNT_SRC_SEC_PK_VAL', NULL, g_commit_apex_session);
      apex_util.set_session_state('P17_LAST_MVMNT_TRAVEL_DATE', NULL, g_commit_apex_session);
      apex_util.set_session_state('P17_LAST_MVMNT_DOCNO', NULL, g_commit_apex_session);
      apex_util.set_session_state('P17_LAST_MVMNT_DOCNO_EXP_DATE', NULL, g_commit_apex_session);
      apex_util.set_session_state('P17_LAST_MVMNT_VISA_TYPE', NULL, g_commit_apex_session);
      apex_util.set_session_state('P17_LAST_MVMNT_VISA_EXP_DATE', NULL, g_commit_apex_session);

      IF NVL(p_load_data_on_departure, 'N') = 'Y' THEN
        -- set APEX Items for VISA fields
        apex_util.set_session_state('P17_VISUM_1' -- Visa Number
                                    ,null, g_commit_apex_session);
        apex_util.set_session_state('P17_VISA_TYPE_ID' -- Visa Type (Code field)
                                    ,null, g_commit_apex_session);
        apex_util.set_session_state('P17_VISUM' -- Visa Type (Select List)
                                    ,null, g_commit_apex_session);
        apex_util.set_session_state('P17_VISUM_4' -- Length of stay (short field)
                                    ,null, g_commit_apex_session);
        /*apex_util.set_session_state('P17_VISUM_6' -- Length of stay (long field)
                                    ,null, g_commit_apex_session);*/
        apex_util.set_session_state('P17_VISUM_5' -- Date of Expiry
                                    ,null, g_commit_apex_session);
        /*apex_util.set_session_state('P17_PERMIT_TYPE' -- Permit type (Select List)
                                    ,null, g_commit_apex_session);
        apex_util.set_session_state('P17_PERMIT_EXPIRY' -- Permit Expiry Date
                                    ,null, g_commit_apex_session);*/

        -- set APEX Items for ENTRY FORM fields
        apex_util.set_session_state('P17_TRAVELCARD_NO_DISPLAY'
                                    ,null, g_commit_apex_session);
        apex_util.set_session_state('P17_TRAVELCARD_NO'
                                    ,null, g_commit_apex_session);
        apex_util.set_session_state('P17_PROVINCE'
                                    ,v('AI_BORDERPOST_PROVINCE_ID'), g_commit_apex_session);
        apex_util.set_session_state('P17_TMP_AMPUR'
                                    ,null, g_commit_apex_session);
        apex_util.set_session_state('P17_TMP_TAMBON'
                                    ,null, g_commit_apex_session);
        apex_util.set_session_state('P17_LC_ADDRESS'
                                    ,null, g_commit_apex_session);
        /*apex_util.set_session_state('P17_LC_ADD_INFO'
                                    ,null, g_commit_apex_session);*/
      END IF;

      logger.log_error('P17 - GET LAST MOVEMENT INFO: unhandled exeption', l_scope, null, l_params);
      -- RAISE; -- no need to raise here

  END p17_get_last_movement_info;

  /**
   * Get travel history sql: P17
   * Added by MSCS
   */
  FUNCTION p17_get_travel_history_sql
  (
    p_identity              IN VARCHAR2 DEFAULT NULL
    , p_docno               IN VARCHAR2 DEFAULT NULL
    , p_nationality         IN VARCHAR2 DEFAULT NULL
    , p_stateless           IN VARCHAR2 DEFAULT NULL
    , p_sex                 IN NUMBER   DEFAULT NULL
    , p_dob                 IN VARCHAR2 DEFAULT NULL
    , p_surname             IN VARCHAR2 DEFAULT NULL
    , p_givenname           IN VARCHAR2 DEFAULT NULL
    , p_middlename          IN VARCHAR2 DEFAULT NULL
    , p_rows                IN NUMBER   DEFAULT 1000
    , p_pibics_prd_conn     IN NUMBER   DEFAULT 0
    , p_dr                  IN VARCHAR2 DEFAULT 'Y'
  ) RETURN CLOB
  IS
    l_scope logger_logs.scope%type := c_scope_prefix || 'p17_get_travel_history_sql';
    l_params logger.tab_param;
    --
    l_query                 CLOB; --VARCHAR2(32000) := NULL;
    --
    -- pibics prod
    l_pp_query              VARCHAR2(32000) := NULL;
    --
    l_null_query            CLOB; --VARCHAR2(4000) := NULL;
    --
  BEGIN

    --DL_COMMON.PKG_I18N.Alter_Sess_Data_Locale(p_LOCALE => 'en_US');

    l_null_query := q'[ SELECT
                            NULL AS LINK
                            , NULL AS USERTYPE
                            , NULL AS DIRECTION
                            , NULL AS DOCNUMBER
                            , NULL AS TRAVELDATE
                            , NULL AS SOURCE_SYSTEM
                            , NULL AS VISA_TYPE
                            , NULL AS MVMNTID
                            , NULL AS BORDERPOST
                            , NULL AS VEHICLETYPE
                            , NULL AS DATA_SOURCE
                            , NULL AS DATA_SOURCE_SEC
                            , NULL AS DATA_SOURCE_SEC_PK_VAL
                        FROM DUAL
                        WHERE 1 = 2
                        ]';

    -- param check
    IF TRIM(p_docno) IS NULL THEN
        RETURN l_null_query;
    END IF;

    -- PIBICS PRD DATA
    IF p_pibics_prd_conn = 1 THEN

        l_pp_query :=
q'[
UNION ALL
-- PIBICS PRD tminout_ma start --
SELECT /*+ NO_PARALLEL */
    '<span class="fa fa-search table-link-icon fa-1-5x" aria-hidden="true"></span' AS LINK
    , '<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>' AS USERTYPE
    , DECODE (v.cardtype, 2, '<span class="fa fa-arrow-left my_red fa-1-5x cl-bold" aria-hidden="true" title="Departure"></span>', 1, '<span class="fa fa-arrow-right my_blue fa-1-5x cl-bold" aria-hidden="true" title="Arrival"></span>') AS DIRECTION
    , v.tdtno AS DOCNUMBER
    , v.inoutdte AS TRAVELDATE
    , DECODE(v.typedata, 'ATC', 'ATC', 'PIBICS') AS SOURCE_SYSTEM
    , (
        SELECT SUBSTR(display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '' END
        FROM dl_bordercontrol.visa_name
        WHERE key_value = v.visatypecd
      ) AS VISA_TYPE
    , NULL AS MVMNTID
    , (
        SELECT
            CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = 'th_TH'
            THEN
              CASE
              WHEN NVL(LENGTH(NVL(depttnm, deptenm)), 0) <= tr.len
              THEN NVL(depttnm, deptenm)
              ELSE SUBSTR(NVL(depttnm, deptenm), 1, tr.len) || tr.dots
              END
            ELSE
              CASE
              WHEN NVL(LENGTH(NVL(deptenm, depttnm)), 0) <= tr.len
              THEN NVL(deptenm, depttnm)
              ELSE substr(NVL(deptenm, depttnm), 1, tr.len) || tr.dots
              END
            END BORDERPOST
        FROM dl_bordercontrol.v_department
        WHERE dept_seqno = v.dept_seqno
       ) AS BORDERPOST
    , NVL(TRIM(v.flightprefix || v.flightnumber), v.convregno) AS VEHICLETYPE
    , 'PIBICS' AS DATA_SOURCE
    , 'TMINOUT_MA_PRD' AS DATA_SOURCE_SEC
    , v.seqno AS DATA_SOURCE_SEC_PK_VAL
FROM dl_bordercontrol.v_tminout_ma_1hr_prod v, trimming tr
WHERE v.nationcd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(']' || p_stateless || q'[', ']' || p_nationality || q'[')) --
AND v.sex = DECODE(']' || p_sex || q'[', 1, 'M', 2, 'F', sex)
--AND v.birthdte = ']' || p_dob || q'['
AND (v.birthdte = ']' || p_dob || q'[' OR v.birthdte = SUBSTR(']' || p_dob || q'[', -4, 4) OR v.birthdte = SUBSTR(']' || p_dob || q'[', -7, 7) OR v.birthdte = SUBSTR(']' || p_dob || q'[', -8, 8) OR v.birthdte = '//' || SUBSTR(']' || p_dob || q'[', -4, 4))
AND
(
    v.tdtno = ']' || p_docno || q'['
    OR
    (
        UPPER(TRIM(REGEXP_REPLACE(v.efamilynm, '\s{2,}', ' '))) = ']' || p_surname || q'['
        AND UPPER(TRIM(REGEXP_REPLACE(v.efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(v.emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(v.emiddlenm, '\s{2,}', ' '))), NULL) = ']' || p_givenname || q'[' || NVL2(']' || p_middlename || q'[', ' ' || ']' || p_middlename || q'[', NULL)
    )
)
AND 
(
    v.typedata IN ('BIO-PHB', 'BIO-RETH')
    OR
    NVL(v.typedata, '~') NOT LIKE 'BIO%'
)
-- PIBICS PRD tminout_ma end --
UNION ALL
-- PIBICS PRD tminout start --
SELECT /*+ NO_PARALLEL */
    '<span class="fa fa-search table-link-icon fa-1-5x" aria-hidden="true"></span' AS LINK
    , '<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>' AS USERTYPE
    , DECODE (v.cardtype, 2, '<span class="fa fa-arrow-left my_red fa-1-5x cl-bold" aria-hidden="true" title="Departure"></span>', 1, '<span class="fa fa-arrow-right my_blue fa-1-5x cl-bold" aria-hidden="true" title="Arrival"></span>') AS DIRECTION
    , v.tdtno AS DOCNUMBER
    , v.inoutdte AS TRAVELDATE
    , DECODE(v.typedata, 'ATC', 'ATC', 'PIBICS') AS SOURCE_SYSTEM
    , (
        SELECT SUBSTR(display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '' END
        FROM dl_bordercontrol.visa_name
        WHERE key_value = v.visatypecd
      ) AS VISA_TYPE
    , NULL AS MVMNTID
    , (
        SELECT
            CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = 'th_TH'
            THEN
              CASE
              WHEN NVL(LENGTH(NVL(depttnm, deptenm)), 0) <= tr.len
              THEN NVL(depttnm, deptenm)
              ELSE SUBSTR(NVL(depttnm, deptenm), 1, tr.len) || tr.dots
              END
            ELSE
              CASE
              WHEN NVL(LENGTH(NVL(deptenm, depttnm)), 0) <= tr.len
              THEN NVL(deptenm, depttnm)
              ELSE SUBSTR(NVL(deptenm, depttnm), 1, tr.len) || tr.dots
              END
            END BORDERPOST
       FROM dl_bordercontrol.v_department
       WHERE dept_seqno = v.dept_seqno
      ) AS BORDERPOST
    , NVL(TRIM(v.flightprefix || v.flightnumber), v.convregno) AS VEHICLETYPE
    , 'PIBICS' AS DATA_SOURCE
    , 'TMINOUT_PRD' AS DATA_SOURCE_SEC
    , v.seqno AS DATA_SOURCE_SEC_PK_VAL
FROM dl_bordercontrol.v_tminout_1hr_prod v, trimming tr
WHERE v.nationcd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(']' || p_stateless || q'[', ']' || p_nationality || q'[')) --
AND v.sex = DECODE(']' || p_sex || q'[', 1, 'M', 2, 'F', sex)
--AND v.birthdte = ']' || p_dob || q'['
AND (v.birthdte = ']' || p_dob || q'[' OR v.birthdte = SUBSTR(']' || p_dob || q'[', -4, 4) OR v.birthdte = SUBSTR(']' || p_dob || q'[', -7, 7) OR v.birthdte = SUBSTR(']' || p_dob || q'[', -8, 8) OR v.birthdte = '//' || SUBSTR(']' || p_dob || q'[', -4, 4))
AND
(
    v.tdtno = ']' || p_docno || q'['
    OR
    (
        UPPER(TRIM(REGEXP_REPLACE(v.efamilynm, '\s{2,}', ' '))) = ']' || p_surname || q'['
        AND UPPER(TRIM(REGEXP_REPLACE(v.efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(v.emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(v.emiddlenm, '\s{2,}', ' '))), NULL) = ']' || p_givenname || q'[' || NVL2(']' || p_middlename || q'[', ' ' || ']' || p_middlename || q'[', NULL)
    )
)
AND 
(
    v.typedata IN ('BIO-PHB', 'BIO-RETH')
    OR
    NVL(v.typedata, '~') NOT LIKE 'BIO%'
)
-- PIBICS PRD tminout end --
UNION ALL
-- PIBICS PRD tmmain IN start --
SELECT /*+ NO_PARALLEL */
    '<span class="fa fa-search table-link-icon fa-1-5x" aria-hidden="true"></span' AS LINK
    , '<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>' AS USERTYPE
    , '<span class="fa fa-arrow-right my_blue fa-1-5x cl-bold" aria-hidden="true" title="Arrival"></span>' AS DIRECTION
    , v.intdtno AS DOCNUMBER
    , v.indte AS TRAVELDATE
    , DECODE(v.typedata, 'ATC', 'ATC', 'PIBICS') AS SOURCE_SYSTEM
    , (
        SELECT SUBSTR(display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '' END
        FROM dl_bordercontrol.visa_name
        WHERE key_value = v.INVISATYPECD
      ) AS VISA_TYPE
    , NULL AS MVMNTID
    , (
        SELECT
            CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = 'th_TH'
            THEN
              CASE
              WHEN NVL(LENGTH(NVL(depttnm, deptenm)), 0) <= tr.len
              THEN NVL(depttnm, deptenm)
              ELSE SUBSTR(NVL(depttnm, deptenm), 1, tr.len) || tr.dots
              END
            ELSE
              CASE
              WHEN NVL(LENGTH(NVL(deptenm, depttnm)), 0) <= tr.len
              THEN NVL(deptenm, depttnm)
              ELSE SUBSTR(NVL(deptenm, depttnm), 1, tr.len) || tr.dots
              END
            END BORDERPOST
        FROM dl_bordercontrol.v_department
        WHERE dept_seqno = v.indept_seqno
       ) AS BORDERPOST
    , NVL(TRIM(v.inflightprefix || v.inflightnumber), v.inconvregno) AS VEHICLETYPE
    , 'PIBICS' AS DATA_SOURCE
    , 'TMMAIN_IN_PRD' AS DATA_SOURCE_SEC
    , v.tmrunno AS DATA_SOURCE_SEC_PK_VAL
FROM dl_bordercontrol.v_tmmain_in_1hr_prod v, trimming tr
WHERE v.indte IS NOT NULL
AND v.nationcd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(']' || p_stateless || q'[', ']' || p_nationality || q'[')) --
AND v.sex = DECODE(']' || p_sex || q'[', 1, 'M', 2, 'F', sex)
--AND v.birthdte = ']' || p_dob || q'['
AND (v.birthdte = ']' || p_dob || q'[' OR v.birthdte = SUBSTR(']' || p_dob || q'[', -4, 4) OR v.birthdte = SUBSTR(']' || p_dob || q'[', -7, 7) OR v.birthdte = SUBSTR(']' || p_dob || q'[', -8, 8) OR v.birthdte = '//' || SUBSTR(']' || p_dob || q'[', -4, 4))
AND
(
    v.intdtno = ']' || p_docno || q'['
    OR
    (
        UPPER(TRIM(REGEXP_REPLACE(v.efamilynm, '\s{2,}', ' '))) = ']' || p_surname || q'['
        AND UPPER(TRIM(REGEXP_REPLACE(v.efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(v.emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(v.emiddlenm, '\s{2,}', ' '))), NULL) = ']' || p_givenname || q'[' || NVL2(']' || p_middlename || q'[', ' ' || ']' || p_middlename || q'[', NULL)
    )
)
AND 
(
    v.typedata IN ('BIO-PHB', 'BIO-RETH')
    OR
    NVL(v.typedata, '~') NOT LIKE 'BIO%'
)
-- PIBICS PRD tmmain IN end --
UNION ALL
-- PIBICS PRD tmmain OUT start --
SELECT /*+ NO_PARALLEL */
    '<span class="fa fa-search table-link-icon fa-1-5x" aria-hidden="true"></span' AS LINK
    , '<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>' AS USERTYPE
    , '<span class="fa fa-arrow-left my_red fa-1-5x cl-bold" aria-hidden="true" title="Departure"></span>' AS DIRECTION
    , v.outtdtno AS DOCNUMBER
    , v.outdte AS TRAVELDATE
    , DECODE(v.typedata, 'ATC', 'ATC', 'PIBICS') AS SOURCE_SYSTEM
    , (
        SELECT SUBSTR(display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '' END
        FROM dl_bordercontrol.visa_name
        WHERE key_value = v.OUTVISATYPECD
      ) AS VISA_TYPE
    , NULL AS MVMNTID
    , (
        SELECT
            CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = 'th_TH'
            THEN
              CASE
              WHEN NVL(LENGTH(NVL(depttnm, deptenm)), 0) <= tr.len
              THEN NVL(depttnm, deptenm)
              ELSE SUBSTR(NVL(depttnm, deptenm), 1, tr.len)||tr.dots
              END
            ELSE
              CASE
              WHEN NVL(LENGTH(NVL(deptenm, depttnm)), 0) <= tr.len
              THEN NVL(deptenm, depttnm)
              ELSE SUBSTR(NVL(deptenm, depttnm), 1, tr.len)||tr.dots
              END
            END BORDERPOST
        FROM dl_bordercontrol.v_department
        WHERE dept_seqno = v.outdept_seqno) AS BORDERPOST
    , NVL(TRIM(v.outflightprefix || v.outflightnumber), v.outconvregno) AS VEHICLETYPE
    , 'PIBICS' AS DATA_SOURCE
    , 'TMMAIN_OUT_PRD' AS DATA_SOURCE_SEC
    , v.tmrunno AS DATA_SOURCE_SEC_PK_VAL
FROM dl_bordercontrol.v_tmmain_out_1hr_prod v, trimming tr
WHERE v.outdte IS NOT NULL
AND v.nationcd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(']' || p_stateless || q'[', ']' || p_nationality || q'[')) --
AND v.sex = DECODE(']' || p_sex || q'[', 1, 'M', 2, 'F', sex)
--AND v.birthdte = ']' || p_dob || q'['
AND (v.birthdte = ']' || p_dob || q'[' OR v.birthdte = SUBSTR(']' || p_dob || q'[', -4, 4) OR v.birthdte = SUBSTR(']' || p_dob || q'[', -7, 7) OR v.birthdte = SUBSTR(']' || p_dob || q'[', -8, 8) OR v.birthdte = '//' || SUBSTR(']' || p_dob || q'[', -4, 4))
AND
(
    v.outtdtno = ']' || p_docno || q'['
    OR
    (
        UPPER(TRIM(REGEXP_REPLACE(v.efamilynm, '\s{2,}', ' '))) = ']' || p_surname || q'['
        AND UPPER(TRIM(REGEXP_REPLACE(v.efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(v.emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(v.emiddlenm, '\s{2,}', ' '))), NULL) = ']' || p_givenname || q'[' || NVL2(']' || p_middlename || q'[', ' ' || ']' || p_middlename || q'[', NULL)
    )
)
AND 
(
    v.typedata IN ('BIO-PHB', 'BIO-RETH')
    OR
    NVL(v.typedata, '~') NOT LIKE 'BIO%'
)
-- PIBICS PRD tmmain OUT end --
]';

    END IF;

    -- MAIN
    l_query :=
q'[
with trimming as (
    select 30 len, '&#x2026;' dots from dual
)
select /*+ NO_PARALLEL */ * from
(
-- BIO start --
SELECT /*+ NO_PARALLEL */
    CASE
      WHEN LENGTH((SELECT note FROM dl_bordercontrol.entry_forms WHERE key_value = m.entry_form)) > 0
        THEN '<span class="fa fa-search my_yellow table-link-icon fa-1-5x" aria-hidden="true"></span>'
      ELSE '<span class="fa fa-search table-link-icon fa-1-5x" aria-hidden="true"></span'
    END AS LINK
    , DECODE(m.person_type, 2, '<span class="fa fa-crew black fa-1-5x" aria-hidden="true" title="Crew"></span>', '<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>') AS USERTYPE
    , DECODE (m.exitflg, 1, '<span class="fa fa-arrow-left my_red fa-1-5x cl-bold" aria-hidden="true" title="Departure"></span>', 0, '<span class="fa fa-arrow-right my_blue fa-1-5x cl-bold" aria-hidden="true" title="Arrival"></span>') AS DIRECTION
    , (SELECT docno FROM dl_bordercontrol.borderdocuments WHERE brddocid = m.brddocid) AS DOCNUMBER
    , m.date_of_entry AS TRAVELDATE
    , DECODE(NVL(m.source_system, -999), 1, 'BIO', 2, 'PIB', 3, 'ATC', 4, 'OFF', -999, 'N/A', '' || m.source_system) AS SOURCE_SYSTEM
    , (
         SELECT SUBSTR(display_value, 1, tr.len) || CASE WHEN LENGTH(display_value) > tr.len THEN tr.dots else '' END
         FROM visa_name
         WHERE key_value = m.visa_type
       ) VISA_TYPE
    , m.mvmntid
    , (
         SELECT
         CASE
           WHEN NVL(LENGTH(name), 0) <= tr.len THEN name
           ELSE SUBSTR(name,1,tr.len)||tr.dots
         END AS BORDERPOST
         FROM dl_bordercontrol.borderposts
         WHERE key_value = m.ins_borderpost
       ) AS BORDERPOST
    , CASE
        WHEN NVL(LENGTH(m.scanned_flight), 0) <= tr.len THEN m.scanned_flight
        ELSE SUBSTR(m.scanned_flight, 1, tr.len) || tr.dots
      END AS VEHICLETYPE
    , 'BIO' AS DATA_SOURCE
    , 'BIO' AS DATA_SOURCE_SEC
    , MVMNTID AS DATA_SOURCE_SEC_PK_VAL
FROM dl_bordercontrol.movements m, trimming tr
WHERE m.brddocid IN
(
    SELECT bd.brddocid
    FROM dl_bordercontrol.borderdocuments bd, dl_bordercontrol.identities i
    WHERE bd.brddocid = i.brddocid
    AND
    (
        (
            ']' || p_identity || q'[' IS NULL
            AND bd.docno      = ']' || p_docno || q'['
            AND bd.issuectry  = ']' || p_nationality || q'['
        )
        OR
        (
            ']' || p_identity || q'[' IS NOT NULL
            AND i.identity   = ']' || p_identity || q'['
        )
    )
)
AND m.is_finished = 'Y'
-- BIO end --
UNION ALL
-- PIBICS tminout_ma start --
SELECT /*+ NO_PARALLEL INDEX(v tminout_ma TMINOUT_MA_COMPOSITE_IDX2) */
    '<span class="fa fa-search table-link-icon fa-1-5x" aria-hidden="true"></span' AS LINK
    , '<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>' AS USERTYPE
    , DECODE (v.cardtype, 2, '<span class="fa fa-arrow-left my_red fa-1-5x cl-bold" aria-hidden="true" title="Departure"></span>', 1, '<span class="fa fa-arrow-right my_blue fa-1-5x cl-bold" aria-hidden="true" title="Arrival"></span>') AS DIRECTION
    , v.tdtno AS DOCNUMBER
    , v.inoutdte AS TRAVELDATE
    , DECODE(v.typedata, 'ATC', 'ATC', 'PIBICS') AS SOURCE_SYSTEM
    , (
        SELECT SUBSTR(display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '' END
        FROM dl_bordercontrol.visa_name
        WHERE key_value = v.visatypecd
      ) AS VISA_TYPE
    , NULL AS MVMNTID
    , (
        SELECT
            CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = 'th_TH'
            THEN
              CASE
              WHEN NVL(LENGTH(NVL(depttnm, deptenm)), 0) <= tr.len
              THEN NVL(depttnm, deptenm)
              ELSE SUBSTR(NVL(depttnm, deptenm), 1, tr.len) || tr.dots
              END
            ELSE
              CASE
              WHEN NVL(LENGTH(NVL(deptenm, depttnm)), 0) <= tr.len
              THEN NVL(deptenm, depttnm)
              ELSE substr(NVL(deptenm, depttnm), 1, tr.len) || tr.dots
              END
            END BORDERPOST
        FROM dl_bordercontrol.v_department
        WHERE dept_seqno = v.dept_seqno
       ) AS BORDERPOST
    , NVL(TRIM(v.flightprefix || v.flightnumber), v.convregno) AS VEHICLETYPE
    , 'PIBICS' AS DATA_SOURCE
    , 'TMINOUT_MA' AS DATA_SOURCE_SEC
    , v.seqno AS DATA_SOURCE_SEC_PK_VAL
FROM dl_bordercontrol.v_tminout_ma v, trimming tr
WHERE v.nationcd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(']' || p_stateless || q'[', ']' || p_nationality || q'[')) --
AND v.sex = DECODE(']' || p_sex || q'[', 1, 'M', 2, 'F', sex)
--AND v.birthdte = ']' || p_dob || q'['
AND (v.birthdte = ']' || p_dob || q'[' OR v.birthdte = SUBSTR(']' || p_dob || q'[', -4, 4) OR v.birthdte = SUBSTR(']' || p_dob || q'[', -7, 7) OR v.birthdte = SUBSTR(']' || p_dob || q'[', -8, 8) OR v.birthdte = '//' || SUBSTR(']' || p_dob || q'[', -4, 4))
AND
(
    v.tdtno = ']' || p_docno || q'['
    OR
    (
        UPPER(TRIM(REGEXP_REPLACE(v.efamilynm, '\s{2,}', ' '))) = ']' || p_surname || q'['
        AND UPPER(TRIM(REGEXP_REPLACE(v.efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(v.emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(v.emiddlenm, '\s{2,}', ' '))), NULL) = ']' || p_givenname || q'[' || NVL2(']' || p_middlename || q'[', ' ' || ']' || p_middlename || q'[', NULL)
    )
)
AND 
(
    v.typedata IN ('BIO-PHB', 'BIO-RETH')
    OR
    NVL(v.typedata, '~') NOT LIKE 'BIO%'
)
-- PIBICS tminout_ma end --
UNION ALL
-- PIBICS tminout start --
SELECT /*+ NO_PARALLEL INDEX(v tminout TMINOUT_COMPOSITE_IDX2) */
    '<span class="fa fa-search table-link-icon fa-1-5x" aria-hidden="true"></span' AS LINK
    , '<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>' AS USERTYPE
    , DECODE (v.cardtype, 2, '<span class="fa fa-arrow-left my_red fa-1-5x cl-bold" aria-hidden="true" title="Departure"></span>', 1, '<span class="fa fa-arrow-right my_blue fa-1-5x cl-bold" aria-hidden="true" title="Arrival"></span>') AS DIRECTION
    , v.tdtno AS DOCNUMBER
    , v.inoutdte AS TRAVELDATE
    , DECODE(v.typedata, 'ATC', 'ATC', 'PIBICS') AS SOURCE_SYSTEM
    , (
        SELECT SUBSTR(display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '' END
        FROM dl_bordercontrol.visa_name
        WHERE key_value = v.visatypecd
      ) AS VISA_TYPE
    , NULL AS MVMNTID
    , (
        SELECT
            CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = 'th_TH'
            THEN
              CASE
              WHEN NVL(LENGTH(NVL(depttnm, deptenm)), 0) <= tr.len
              THEN NVL(depttnm, deptenm)
              ELSE SUBSTR(NVL(depttnm, deptenm), 1, tr.len) || tr.dots
              END
            ELSE
              CASE
              WHEN NVL(LENGTH(NVL(deptenm, depttnm)), 0) <= tr.len
              THEN NVL(deptenm, depttnm)
              ELSE SUBSTR(NVL(deptenm, depttnm), 1, tr.len) || tr.dots
              END
            END BORDERPOST
       FROM dl_bordercontrol.v_department
       WHERE dept_seqno = v.dept_seqno
      ) AS BORDERPOST
    , NVL(TRIM(v.flightprefix || v.flightnumber), v.convregno) AS VEHICLETYPE
    , 'PIBICS' AS DATA_SOURCE
    , 'TMINOUT' AS DATA_SOURCE_SEC
    , v.seqno AS DATA_SOURCE_SEC_PK_VAL
FROM dl_bordercontrol.v_tminout v, trimming tr
WHERE v.nationcd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(']' || p_stateless || q'[', ']' || p_nationality || q'[')) --
AND v.sex = DECODE(']' || p_sex || q'[', 1, 'M', 2, 'F', sex)
--AND v.birthdte = ']' || p_dob || q'['
AND (v.birthdte = ']' || p_dob || q'[' OR v.birthdte = SUBSTR(']' || p_dob || q'[', -4, 4) OR v.birthdte = SUBSTR(']' || p_dob || q'[', -7, 7) OR v.birthdte = SUBSTR(']' || p_dob || q'[', -8, 8) OR v.birthdte = '//' || SUBSTR(']' || p_dob || q'[', -4, 4))
AND
(
    v.tdtno = ']' || p_docno || q'['
    OR
    (
        UPPER(TRIM(REGEXP_REPLACE(v.efamilynm, '\s{2,}', ' '))) = ']' || p_surname || q'['
        AND UPPER(TRIM(REGEXP_REPLACE(v.efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(v.emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(v.emiddlenm, '\s{2,}', ' '))), NULL) = ']' || p_givenname || q'[' || NVL2(']' || p_middlename || q'[', ' ' || ']' || p_middlename || q'[', NULL)
    )
)
AND 
(
    v.typedata IN ('BIO-PHB', 'BIO-RETH')
    OR
    NVL(v.typedata, '~') NOT LIKE 'BIO%'
)
-- PIBICS tminout end --
UNION ALL
-- PIBICS tmmain IN start --
SELECT /*+ NO_PARALLEL INDEX(v tmmain TMMAIN_COMPOSITE_IDX1) */
    '<span class="fa fa-search table-link-icon fa-1-5x" aria-hidden="true"></span' AS LINK
    , '<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>' AS USERTYPE
    , '<span class="fa fa-arrow-right my_blue fa-1-5x cl-bold" aria-hidden="true" title="Arrival"></span>' AS DIRECTION
    , v.intdtno AS DOCNUMBER
    , v.indte AS TRAVELDATE
    , DECODE(v.typedata, 'ATC', 'ATC', 'PIBICS') AS SOURCE_SYSTEM
    , (
        SELECT SUBSTR(display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '' END
        FROM dl_bordercontrol.visa_name
        WHERE key_value = v.INVISATYPECD
      ) AS VISA_TYPE
    , NULL AS MVMNTID
    , (
        SELECT
            CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = 'th_TH'
            THEN
              CASE
              WHEN NVL(LENGTH(NVL(depttnm, deptenm)), 0) <= tr.len
              THEN NVL(depttnm, deptenm)
              ELSE SUBSTR(NVL(depttnm, deptenm), 1, tr.len) || tr.dots
              END
            ELSE
              CASE
              WHEN NVL(LENGTH(NVL(deptenm, depttnm)), 0) <= tr.len
              THEN NVL(deptenm, depttnm)
              ELSE SUBSTR(NVL(deptenm, depttnm), 1, tr.len) || tr.dots
              END
            END BORDERPOST
        FROM dl_bordercontrol.v_department
        WHERE dept_seqno = v.indept_seqno
       ) AS BORDERPOST
    , NVL(TRIM(v.inflightprefix || v.inflightnumber), v.inconvregno) AS VEHICLETYPE
    , 'PIBICS' AS DATA_SOURCE
    , 'TMMAIN_IN' AS DATA_SOURCE_SEC
    , v.tmrunno AS DATA_SOURCE_SEC_PK_VAL
FROM dl_bordercontrol.v_tmmain v, trimming tr
WHERE v.indte IS NOT NULL
AND v.nationcd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(']' || p_stateless || q'[', ']' || p_nationality || q'[')) --
AND v.sex = DECODE(']' || p_sex || q'[', 1, 'M', 2, 'F', sex)
--AND v.birthdte = ']' || p_dob || q'['
AND (v.birthdte = ']' || p_dob || q'[' OR v.birthdte = SUBSTR(']' || p_dob || q'[', -4, 4) OR v.birthdte = SUBSTR(']' || p_dob || q'[', -7, 7) OR v.birthdte = SUBSTR(']' || p_dob || q'[', -8, 8) OR v.birthdte = '//' || SUBSTR(']' || p_dob || q'[', -4, 4))
AND
(
    v.intdtno = ']' || p_docno || q'['
    OR
    (
        UPPER(TRIM(REGEXP_REPLACE(v.efamilynm, '\s{2,}', ' '))) = ']' || p_surname || q'['
        AND UPPER(TRIM(REGEXP_REPLACE(v.efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(v.emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(v.emiddlenm, '\s{2,}', ' '))), NULL) = ']' || p_givenname || q'[' || NVL2(']' || p_middlename || q'[', ' ' || ']' || p_middlename || q'[', NULL)
    )
)
AND 
(
    v.typedata IN ('BIO-PHB', 'BIO-RETH')
    OR
    NVL(v.typedata, '~') NOT LIKE 'BIO%'
)
-- PIBICS tmmain IN end --
UNION ALL
-- PIBICS tmmain OUT start --
SELECT /*+ NO_PARALLEL INDEX(v tmmain TMMAIN_COMPOSITE_IDX1) */
    '<span class="fa fa-search table-link-icon fa-1-5x" aria-hidden="true"></span' AS LINK
    , '<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>' AS USERTYPE
    , '<span class="fa fa-arrow-left my_red fa-1-5x cl-bold" aria-hidden="true" title="Departure"></span>' AS DIRECTION
    , v.outtdtno AS DOCNUMBER
    , v.outdte AS TRAVELDATE
    , DECODE(v.typedata, 'ATC', 'ATC', 'PIBICS') AS SOURCE_SYSTEM
    , (
        SELECT SUBSTR(display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '' END
        FROM dl_bordercontrol.visa_name
        WHERE key_value = v.OUTVISATYPECD
      ) AS VISA_TYPE
    , NULL AS MVMNTID
    , (
        SELECT
            CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = 'th_TH'
            THEN
              CASE
              WHEN NVL(LENGTH(NVL(depttnm, deptenm)), 0) <= tr.len
              THEN NVL(depttnm, deptenm)
              ELSE SUBSTR(NVL(depttnm, deptenm), 1, tr.len)||tr.dots
              END
            ELSE
              CASE
              WHEN NVL(LENGTH(NVL(deptenm, depttnm)), 0) <= tr.len
              THEN NVL(deptenm, depttnm)
              ELSE SUBSTR(NVL(deptenm, depttnm), 1, tr.len)||tr.dots
              END
            END BORDERPOST
        FROM dl_bordercontrol.v_department
        WHERE dept_seqno = v.outdept_seqno) AS BORDERPOST
    , NVL(TRIM(v.outflightprefix || v.outflightnumber), v.outconvregno) AS VEHICLETYPE
    , 'PIBICS' AS DATA_SOURCE
    , 'TMMAIN_OUT' AS DATA_SOURCE_SEC
    , v.tmrunno AS DATA_SOURCE_SEC_PK_VAL
FROM dl_bordercontrol.v_tmmain v, trimming tr
WHERE v.outdte IS NOT NULL
AND v.nationcd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(']' || p_stateless || q'[', ']' || p_nationality || q'[')) --
AND v.sex = DECODE(']' || p_sex || q'[', 1, 'M', 2, 'F', sex)
--AND v.birthdte = ']' || p_dob || q'['
AND (v.birthdte = ']' || p_dob || q'[' OR v.birthdte = SUBSTR(']' || p_dob || q'[', -4, 4) OR v.birthdte = SUBSTR(']' || p_dob || q'[', -7, 7) OR v.birthdte = SUBSTR(']' || p_dob || q'[', -8, 8) OR v.birthdte = '//' || SUBSTR(']' || p_dob || q'[', -4, 4))
AND
(
    v.outtdtno = ']' || p_docno || q'['
    OR
    (
        UPPER(TRIM(REGEXP_REPLACE(v.efamilynm, '\s{2,}', ' '))) = ']' || p_surname || q'['
        AND UPPER(TRIM(REGEXP_REPLACE(v.efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(v.emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(v.emiddlenm, '\s{2,}', ' '))), NULL) = ']' || p_givenname || q'[' || NVL2(']' || p_middlename || q'[', ' ' || ']' || p_middlename || q'[', NULL)
    )
)
AND 
(
    v.typedata IN ('BIO-PHB', 'BIO-RETH')
    OR
    NVL(v.typedata, '~') NOT LIKE 'BIO%'
)
-- PIBICS tmmain OUT end --
]'
|| l_pp_query
|| q'[
)
ORDER BY traveldate DESC
]';


    RETURN l_query;

  EXCEPTION
    WHEN OTHERS THEN
        logger.log_error('P17 - p17get_travel_history_sql: unhandled exeption', l_scope, null, l_params);
        RETURN l_null_query;

  END p17_get_travel_history_sql;


  /**
   * Get travel history sql
   * Added by MSCS
   */
  FUNCTION p8001_get_travel_history_sql
  (
    p_borderpost            IN VARCHAR2 DEFAULT NULL
    , p_scope               IN NUMBER   DEFAULT 0
    , p_direction           IN NUMBER   DEFAULT NULL
    , p_source              IN VARCHAR2 DEFAULT NULL
    , p_nationality         IN VARCHAR2 DEFAULT NULL
    , p_dob                 IN VARCHAR2 DEFAULT NULL
    , p_sex                 IN NUMBER   DEFAULT NULL
    , p_docno               IN VARCHAR2 DEFAULT NULL
    , p_tm6                 IN VARCHAR2 DEFAULT NULL
    , p_vehicle_no          IN VARCHAR2 DEFAULT NULL
    , p_travel_date_from    IN VARCHAR2 DEFAULT NULL
    , p_travel_date_to      IN VARCHAR2 DEFAULT NULL
    , p_givenname           IN VARCHAR2 DEFAULT NULL
    , p_middlename          IN VARCHAR2 DEFAULT NULL
    , p_surname             IN VARCHAR2 DEFAULT NULL
    , p_givenname_th        IN VARCHAR2 DEFAULT NULL
    , p_middlename_th       IN VARCHAR2 DEFAULT NULL
    , p_surname_th          IN VARCHAR2 DEFAULT NULL
    , p_dept_1              IN VARCHAR2 DEFAULT NULL
    , p_dept_2              IN VARCHAR2 DEFAULT NULL
    , p_dept_3              IN VARCHAR2 DEFAULT NULL
    , p_citizenid           IN VARCHAR2 DEFAULT NULL
    , p_created_by          IN VARCHAR2 DEFAULT NULL
    , p_rows                IN NUMBER   DEFAULT 1000
    , p_pibics_prd_conn     IN NUMBER   DEFAULT 0
    --, p_dr                  IN VARCHAR2 DEFAULT 'Y'
  ) RETURN CLOB
  IS
    l_scope logger_logs.scope%type := c_scope_prefix || 'p8001_get_travel_history_sql';
    l_params logger.tab_param;
    --
    l_nationality           borderdocuments.issuectry%TYPE := p_nationality;
    --
    l_query                 CLOB; --VARCHAR2(20000) := NULL;
    --l_from                VARCHAR2(4000) := NULL;
    l_where_bio             VARCHAR2(4000) := NULL;
    l_where_bio_inner       VARCHAR2(4000) := NULL;
    l_where_tminout_ma      VARCHAR2(4000) := NULL;
    l_where_tminout         VARCHAR2(4000) := NULL;
    l_where_tmmain_in       VARCHAR2(4000) := NULL;
    l_where_tmmain_out      VARCHAR2(4000) := NULL;
    l_where_outer           VARCHAR2(4000) := NULL;
    l_where_inner_row_limit VARCHAR2(500) := NULL;
    l_where_outer_row_limit VARCHAR2(500) := NULL;
    l_index_tminout_ma      VARCHAR2(500) := NULL;
    l_index_tminout         VARCHAR2(500) := NULL;
    l_index_tmmain_in       VARCHAR2(500) := NULL;
    l_index_tmmain_out      VARCHAR2(500) := NULL;
    --
    --l_ain                 BOOLEAN := FALSE;
    l_nationcd              VARCHAR2(32) := NULL;
    l_source                VARCHAR2(50) := p_source;
    --
    -- pibics prod
    l_pp_query              VARCHAR2(32000) := NULL;
    --
  BEGIN

    DL_COMMON.PKG_I18N.Alter_Sess_Data_Locale(p_LOCALE => 'en_US');

    -- p_dr
    /*
    IF p_dr IS NOT NULL THEN
        l_where_bio := l_where_bio || q'[ AND CASE WHEN REGEXP_LIKE(:REQUEST, '(CSV|HTMLD|PDF)$') THEN 'Y' ELSE ']' || p_dr || q'[' END = 'Y' ]';
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND CASE WHEN REGEXP_LIKE(:REQUEST, '(CSV|HTMLD|PDF)$') THEN 'Y' ELSE ']' || p_dr || q'[' END = 'Y' ]';
        l_where_tminout := l_where_tminout || q'[ AND CASE WHEN REGEXP_LIKE(:REQUEST, '(CSV|HTMLD|PDF)$') THEN 'Y' ELSE ']' || p_dr || q'[' END = 'Y' ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND CASE WHEN REGEXP_LIKE(:REQUEST, '(CSV|HTMLD|PDF)$') THEN 'Y' ELSE ']' || p_dr || q'[' END = 'Y' ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND CASE WHEN REGEXP_LIKE(:REQUEST, '(CSV|HTMLD|PDF)$') THEN 'Y' ELSE ']' || p_dr || q'[' END = 'Y' ]';
        l_where_outer := l_where_outer || q'[ AND CASE WHEN REGEXP_LIKE(:REQUEST, '(CSV|HTMLD|PDF)$') THEN 'Y' ELSE ']' || p_dr || q'[' END = 'Y' ]';
    END IF;
    */

    -- p_borderpost
    IF NVL(p_borderpost, 'ALL') != 'ALL' THEN
        l_where_bio := l_where_bio || q'[ AND m.ins_borderpost = ']' || p_borderpost || q'[' ]';
        --l_where_tminout_ma := l_where_tminout_ma || q'[ AND m.ins_borderpost = ']' || p_borderpost || q'[']';
        --l_where_tminout := l_where_tminout || q'[ AND m.ins_borderpost = ']' || p_borderpost || q'[' ]';
        --l_where_tmmain_in := l_where_tmmain_in || q'[ AND m.ins_borderpost = ']' || p_borderpost || q'[' ]';
        --l_where_tmmain_out := l_where_tmmain_out || q'[ AND m.ins_borderpost = ']' || p_borderpost || q'[' ]';
    END IF;

    -- p_scope - 0;today; 1:historical;
    IF p_scope = 0 THEN
        l_where_bio := l_where_bio || q'[ AND TO_CHAR(m.date_of_entry, 'dd/mm/yyyy') = TO_CHAR(SYSDATE, 'dd/mm/yyyy') ]';
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND TO_CHAR(v.inoutdte, 'yyyymmdd') = TO_CHAR(SYSDATE, 'yyyymmdd') ]';
        l_where_tminout := l_where_tminout || q'[ AND TO_CHAR(v.inoutdte, 'yyyymmdd') = TO_CHAR(SYSDATE, 'yyyymmdd') ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND TO_CHAR(v.indte, 'yyyymmdd') = TO_CHAR(SYSDATE, 'yyyymmdd') ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND TO_CHAR(v.outdte, 'yyyymmdd') = TO_CHAR(SYSDATE, 'yyyymmdd') ]';

        l_index_tminout_ma := l_index_tminout_ma || q'[ INDEX(v TMINOUT_MA TMINOUT_RPTINOUTDTE_IDX) ]';
        l_index_tminout := l_index_tminout || q'[ INDEX(v TMINOUT TM_INOUTDTE_IDX1) ]';
        l_index_tmmain_in := l_index_tmmain_in || q'[ INDEX(v TMMAIN TMMAIN_RPT_INDTE_IDX) ]';
        l_index_tmmain_out := l_index_tmmain_out || q'[ INDEX(v TMMAIN TMMAIN_RPT_OUTDTE_IDX) ]';
    END IF;

    -- p_direction
    IF p_direction IS NOT NULL THEN
        l_where_bio := l_where_bio || q'[ AND m.exitflg = ]' || p_direction || q'[ ]';
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND v.cardtype = DECODE(]' || p_direction || q'[, 0, '1', 1, '2') ]';
        l_where_tminout := l_where_tminout || q'[ AND v.cardtype = DECODE(]' || p_direction || q'[, 0, '1', 1, '2') ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND ]' || p_direction || q'[ = 0 ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND ]' || p_direction || q'[ = 1 ]';
    END IF;

    -- p_citizenid
    IF p_citizenid IS NOT NULL THEN
        l_where_bio_inner := l_where_bio_inner || q'[ AND bd.docno IN (SELECT th.passportno FROM dl_bordercontrol.v_thaipassport th WHERE th.citizenid = ']' || p_citizenid || q'[' AND th.passportno IS NOT NULL) ]';
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND v.tdtno IN (SELECT th.passportno FROM dl_bordercontrol.v_thaipassport th WHERE th.citizenid = ']' || p_citizenid || q'[' AND th.passportno IS NOT NULL) ]';
        l_where_tminout := l_where_tminout || q'[ AND v.tdtno IN (SELECT th.passportno FROM dl_bordercontrol.v_thaipassport th WHERE th.citizenid = ']' || p_citizenid || q'[' AND th.passportno IS NOT NULL) ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND v.intdtno IN (SELECT th.passportno FROM dl_bordercontrol.v_thaipassport th WHERE th.citizenid = ']' || p_citizenid || q'[' AND th.passportno IS NOT NULL) ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND v.outtdtno IN (SELECT th.passportno FROM dl_bordercontrol.v_thaipassport th WHERE th.citizenid = ']' || p_citizenid || q'[' AND th.passportno IS NOT NULL) ]';

        IF l_nationality IS NULL THEN
            l_nationality := 'THA';
        END IF;
    END IF;

    -- p_nationality (l_nationality)
    IF l_nationality IS NOT NULL THEN
        BEGIN
            SELECT icao.notice$dlc
            INTO l_nationcd
            FROM dl_common.icao_doc_codes$lc icao
            WHERE icao.key_value = l_nationality
            AND icao.is_active = 'Y'
            AND icao.notice$dlc IS NOT NULL;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                l_nationcd := NULL;
        END;

        l_where_bio_inner := l_where_bio_inner || q'[ AND bd.nat = ']' || l_nationality || q'[' ]';
        IF l_nationcd IS NOT NULL THEN
            l_where_tminout_ma := l_where_tminout_ma || q'[ AND v.nationcd = ']' || l_nationcd || q'[' ]';
            l_where_tminout := l_where_tminout || q'[ AND v.nationcd = ']' || l_nationcd || q'[' ]';
            l_where_tmmain_in := l_where_tmmain_in || q'[ AND v.nationcd = ']' || l_nationcd || q'[' ]';
            l_where_tmmain_out := l_where_tmmain_out || q'[ AND v.nationcd = ']' || l_nationcd || q'[' ]';
        END IF;
    END IF;

    -- p_dob
    IF p_dob IS NOT NULL THEN
        l_where_bio_inner := l_where_bio_inner || q'[ AND bd.dob = ']' || SUBSTR(p_dob, 9, 2) || SUBSTR(p_dob, 4, 2) || SUBSTR(p_dob, 1, 2) || q'[' ]';
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND v.birthdte = ']' || p_dob || q'[' ]';
        l_where_tminout := l_where_tminout || q'[ AND v.birthdte = ']' || p_dob || q'[' ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND v.birthdte = ']' || p_dob || q'[' ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND v.birthdte = ']' || p_dob || q'[' ]';
    END IF;

    -- p_sex
    IF p_sex IS NOT NULL THEN
        l_where_bio_inner := l_where_bio_inner || q'[ AND bd.sex = ]' || p_sex || q'[ ]';
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND v.sex = DECODE(]' || p_sex || q'[, 1, 'M', 2, 'F', v.sex) ]';
        l_where_tminout := l_where_tminout || q'[ AND v.sex = DECODE(]' || p_sex || q'[, 1, 'M', 2, 'F', v.sex) ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND v.sex = DECODE(]' || p_sex || q'[, 1, 'M', 2, 'F', v.sex) ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND v.sex = DECODE(]' || p_sex || q'[, 1, 'M', 2, 'F', v.sex) ]';
    END IF;

    -- p_docno
    IF p_docno IS NOT NULL THEN
        l_where_bio_inner := l_where_bio_inner || q'[ AND bd.docno = UPPER(']' || p_docno || q'[') ]';
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND v.tdtno = UPPER(']' || p_docno || q'[') ]';
        l_where_tminout := l_where_tminout || q'[ AND v.tdtno = UPPER(']' || p_docno || q'[') ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND v.intdtno = UPPER(']' || p_docno || q'[') ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND v.outtdtno = UPPER(']' || p_docno || q'[') ]';
    END IF;

    -- p_tm6
    IF p_tm6 IS NOT NULL THEN
        l_where_bio := l_where_bio || q'[ AND e.form_no = UPPER(']' || p_tm6 || q'[') ]';
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND v.tm6no = UPPER(']' || p_tm6 || q'[') ]';
        l_where_tminout := l_where_tminout || q'[ AND v.tm6no = UPPER(']' || p_tm6 || q'[') ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND v.intm6no = UPPER(']' || p_tm6 || q'[') ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND v.outtm6no = UPPER(']' || p_tm6 || q'[') ]';
    END IF;

    -- p_vehicle_no
    IF p_vehicle_no IS NOT NULL THEN
        l_where_bio := l_where_bio || q'[ AND m.scanned_flight = UPPER(']' || p_vehicle_no || q'[') ]';
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND v.flightprefix || v.flightnumber = UPPER(']' || p_vehicle_no || q'[') ]';
        l_where_tminout := l_where_tminout || q'[ AND v.flightprefix || v.flightnumber = UPPER(']' || p_vehicle_no || q'[') ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND v.inflightprefix || v.inflightnumber = UPPER(']' || p_vehicle_no || q'[') ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND v.outflightprefix || v.outflightnumber = UPPER(']' || p_vehicle_no || q'[') ]';
    END IF;

    -- p_travel_date_from
    IF p_travel_date_from IS NOT NULL AND p_scope = 1 THEN
        l_where_bio := l_where_bio || q'[ AND m.date_of_entry >= TO_DATE(']' || p_travel_date_from || q'[', 'DD/MM/YYYY HH24:MI') ]';
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND v.inoutdte >= TO_DATE(']' || p_travel_date_from || q'[', 'DD/MM/YYYY HH24:MI') ]';
        l_where_tminout := l_where_tminout || q'[ AND v.inoutdte >= TO_DATE(']' || p_travel_date_from || q'[', 'DD/MM/YYYY HH24:MI') ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND v.indte >= TO_DATE(']' || p_travel_date_from || q'[', 'DD/MM/YYYY HH24:MI') ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND v.outdte >= TO_DATE(']' || p_travel_date_from || q'[', 'DD/MM/YYYY HH24:MI') ]';
    END IF;

    -- p_travel_date_to
    IF p_travel_date_to IS NOT NULL AND p_scope = 1 THEN
        l_where_bio := l_where_bio || q'[ AND m.date_of_entry <= TO_DATE(']' || p_travel_date_to || q'[', 'DD/MM/YYYY HH24:MI') ]';
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND v.inoutdte <= TO_DATE(']' || p_travel_date_to || q'[', 'DD/MM/YYYY HH24:MI') ]';
        l_where_tminout := l_where_tminout || q'[ AND v.inoutdte <= TO_DATE(']' || p_travel_date_to || q'[', 'DD/MM/YYYY HH24:MI') ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND v.indte <= TO_DATE(']' || p_travel_date_to || q'[', 'DD/MM/YYYY HH24:MI') ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND v.outdte <= TO_DATE(']' || p_travel_date_to || q'[', 'DD/MM/YYYY HH24:MI') ]';
    END IF;

    -- p_givenname
    IF p_givenname IS NOT NULL THEN
        l_where_bio_inner := l_where_bio_inner || q'[ AND bd.givenname LIKE UPPER(TRIM(']' || p_givenname || q'[')) || '%' ]';
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND v.efirstnm LIKE UPPER(TRIM(']' || p_givenname || q'[')) || '%' ]';
        l_where_tminout := l_where_tminout || q'[ AND v.efirstnm LIKE UPPER(TRIM(']' || p_givenname || q'[')) || '%' ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND v.efirstnm LIKE UPPER(TRIM(']' || p_givenname || q'[')) || '%' ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND v.efirstnm LIKE UPPER(TRIM(']' || p_givenname || q'[')) || '%' ]';
    END IF;

    -- p_middlename
    IF p_middlename IS NOT NULL THEN
        l_where_bio_inner := l_where_bio_inner || q'[ AND bd.middlename LIKE UPPER(TRIM(']' || p_middlename || q'[')) || '%' ]';
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND v.emiddlenm LIKE UPPER(TRIM(']' || p_middlename || q'[')) || '%' ]';
        l_where_tminout := l_where_tminout || q'[ AND v.emiddlenm LIKE UPPER(TRIM(']' || p_middlename || q'[')) || '%' ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND v.emiddlenm LIKE UPPER(TRIM(']' || p_middlename || q'[')) || '%' ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND v.emiddlenm LIKE UPPER(TRIM(']' || p_middlename || q'[')) || '%' ]';
    END IF;

    -- p_surname
    IF p_surname IS NOT NULL THEN
        l_where_bio_inner := l_where_bio_inner || q'[ AND bd.surname LIKE UPPER(TRIM(']' || p_surname || q'[')) || '%' ]';
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND v.efamilynm LIKE UPPER(TRIM(']' || p_surname || q'[')) || '%' ]';
        l_where_tminout := l_where_tminout || q'[ AND v.efamilynm LIKE UPPER(TRIM(']' || p_surname || q'[')) || '%' ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND v.efamilynm LIKE UPPER(TRIM(']' || p_surname || q'[')) || '%' ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND v.efamilynm LIKE UPPER(TRIM(']' || p_surname || q'[')) || '%' ]';
    END IF;

    -- p_givenname_th
    IF p_givenname_th IS NOT NULL THEN
        l_where_bio_inner := l_where_bio_inner || q'[ AND bd.givenname_thai LIKE UPPER(TRIM(']' || p_givenname_th || q'[')) || '%' ]';
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND v.tfirstnm LIKE UPPER(TRIM(']' || p_givenname_th || q'[')) || '%' ]';
        l_where_tminout := l_where_tminout || q'[ AND v.tfirstnm LIKE UPPER(TRIM(']' || p_givenname_th || q'[')) || '%' ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND v.tfirstnm LIKE UPPER(TRIM(']' || p_givenname_th || q'[')) || '%' ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND v.tfirstnm LIKE UPPER(TRIM(']' || p_givenname_th || q'[')) || '%' ]';
    END IF;

    -- p_middlename_th
    IF p_middlename_th IS NOT NULL THEN
        l_where_bio_inner := l_where_bio_inner || q'[ AND bd.middlename_thai LIKE UPPER(TRIM(']' || p_middlename_th || q'[')) || '%' ]';
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND v.tmiddlenm LIKE UPPER(TRIM(']' || p_middlename_th || q'[')) || '%' ]';
        l_where_tminout := l_where_tminout || q'[ AND v.tmiddlenm LIKE UPPER(TRIM(']' || p_middlename_th || q'[')) || '%' ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND v.tmiddlenm LIKE UPPER(TRIM(']' || p_middlename_th || q'[')) || '%' ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND v.tmiddlenm LIKE UPPER(TRIM(']' || p_middlename_th || q'[')) || '%' ]';
    END IF;

    -- p_surname_th
    IF p_surname_th IS NOT NULL THEN
        l_where_bio_inner := l_where_bio_inner || q'[ AND bd.surname_thai LIKE UPPER(TRIM(']' || p_surname_th || q'[')) || '%' ]';
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND v.tfamilynm LIKE UPPER(TRIM(']' || p_surname_th || q'[')) || '%' ]';
        l_where_tminout := l_where_tminout || q'[ AND v.tfamilynm LIKE UPPER(TRIM(']' || p_surname_th || q'[')) || '%' ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND v.tfamilynm LIKE UPPER(TRIM(']' || p_surname_th || q'[')) || '%' ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND v.tfamilynm LIKE UPPER(TRIM(']' || p_surname_th || q'[')) || '%' ]';
    END IF;

    -- p_dept_1
    IF p_dept_1 IS NOT NULL THEN
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND dept.deptcd = ']' || p_dept_1 || q'[' AND dept.deptlevel = '1' ]';
        l_where_tminout := l_where_tminout || q'[ AND dept.deptcd = ']' || p_dept_1 || q'[' AND dept.deptlevel = '1' ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND dept.deptcd = ']' || p_dept_1 || q'[' AND dept.deptlevel = '1' ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND dept.deptcd = ']' || p_dept_1 || q'[' AND dept.deptlevel = '1' ]';
    END IF;

    -- p_dept_2
    IF p_dept_2 IS NOT NULL THEN
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND dept.deptcd = ']' || p_dept_2 || q'[' AND dept.deptlevel = '2' ]';
        l_where_tminout := l_where_tminout || q'[ AND dept.deptcd = ']' || p_dept_2 || q'[' AND dept.deptlevel = '2' ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND dept.deptcd = ']' || p_dept_2 || q'[' AND dept.deptlevel = '2' ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND dept.deptcd = ']' || p_dept_2 || q'[' AND dept.deptlevel = '2' ]';
    END IF;

    -- p_dept_3
    IF p_dept_3 IS NOT NULL THEN
        l_where_tminout_ma := l_where_tminout_ma || q'[ AND dept.deptcd = ']' || p_dept_3 || q'[' AND dept.deptlevel = '3' ]';
        l_where_tminout := l_where_tminout || q'[ AND dept.deptcd = ']' || p_dept_3 || q'[' AND dept.deptlevel = '3' ]';
        l_where_tmmain_in := l_where_tmmain_in || q'[ AND dept.deptcd = ']' || p_dept_3 || q'[' AND dept.deptlevel = '3' ]';
        l_where_tmmain_out := l_where_tmmain_out || q'[ AND dept.deptcd = ']' || p_dept_3 || q'[' AND dept.deptlevel = '3' ]';
    END IF;

    -- p_rows
    IF p_rows IS NOT NULL THEN
        --l_where_inner_row_limit := l_where_inner_row_limit || q'[ AND ROWNUM <= ]' || p_rows || q'[ ]';
        l_where_outer_row_limit := l_where_outer_row_limit || q'[ AND ROWNUM <= ]' || p_rows || q'[ ]';
    END IF;
    
    -- p_created_by
    IF TRIM(p_created_by) IS NOT NULL THEN
        l_source := 'BIO'; -- overwrite source to BIO
        l_where_bio := l_where_bio || q'[ AND m.ins_by LIKE ']' || UPPER(TRIM(p_created_by)) || q'[ %' ]';
    END IF;

    -- l_source (p_source): ALL;BIO;PIBICS;ATC;OFF
    IF NVL(l_source, 'ALL') != 'ALL' THEN
        IF l_source IN ('BIO', 'OFF') THEN
            l_where_tminout_ma := l_where_tminout_ma || q'[ AND 1 = 2 ]';
            l_where_tminout := l_where_tminout || q'[ AND 1 = 2 ]';
            l_where_tmmain_in := l_where_tmmain_in || q'[ AND 1 = 2 ]';
            l_where_tmmain_out := l_where_tmmain_out || q'[ AND 1 = 2 ]';
        ELSIF l_source IN ('PIBICS', 'ATC') THEN
            l_where_bio := l_where_bio || q'[ AND 1 = 2 ]';

            IF l_source = 'ATC' THEN
                l_where_tminout_ma := l_where_tminout_ma || q'[ AND v.typedata = 'ATC' ]';
                l_where_tminout := l_where_tminout || q'[ AND v.typedata = 'ATC' ]';
                l_where_tmmain_in := l_where_tmmain_in || q'[ AND v.typedata = 'ATC' ]';
                l_where_tmmain_out := l_where_tmmain_out || q'[ AND v.typedata = 'ATC' ]';
            END IF;
        END IF;

        l_where_outer := l_where_outer || q'[ AND source_system = ']' || l_source || q'[' ]';
    END IF;

    -- PIBICS PRD DATA
    IF p_pibics_prd_conn = 1 THEN
        l_pp_query :=
q'[
  UNION ALL
  -- PIBICS PRD tminout_ma start --
  SELECT /*+ NO_PARALLEL ]' || l_index_tminout_ma || q'[ */
      'PIBICS' AS DATA_SOURCE
      ,'TMINOUT_MA_PRD' AS DATA_SOURCE_SEC
      ,v.seqno AS DATA_SOURCE_SEC_PK_VAL
      ,NULL MVMNTID
      ,DECODE(v.cardtype, 1, 0, 2, 1, v.cardtype) AS DIRECTION
      ,NULL AS IMAGE_EXISTS
      ,DECODE(v.visatypecd, '0023', 2, 1) AS PERSON_TYPE
      ,v.tdtno AS DOCUMENT_NUMBER
      ,v.tm6no AS TM6_NUMBER
      ,v.efirstnm AS GIVENNAME_EN
      ,v.emiddlenm AS MIDDLENAME_EN
      ,v.efamilynm AS SURNAME_EN
      ,v.tfirstnm AS GIVENNAME_TH
      ,v.tmiddlenm AS MIDDLENAME_TH
      ,v.tfamilynm AS SURNAME_TH
      --,icao.key_value AS NATIONALITY
      ,(SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = v.nationcd AND is_active = 'Y' AND ROWNUM = 1) AS NATIONALITY
      ,v.birthdte AS DOB
      --,DECODE(v.sex, 'M', 1, 'F', 2, v.sex) AS SEX
      ,v.sex AS SEX
      ,v.visatypecd AS VISA_TYPE
      ,NVL(TRIM(v.flightprefix || v.flightnumber), v.convregno) AS VEHICLE_NO
      ,v.inoutdte AS TRAVEL_DATE
      ,CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = 'th_TH' THEN NVL(dept.depttnm, dept.deptenm) ELSE NVL(dept.deptenm, dept.depttnm) END AS BORDERPOST
      ,DECODE(v.typedata, 'ATC', 'ATC', 'PIBICS') AS SOURCE_SYSTEM
      ,UPPER(v.creusr) AS CREATED_BY
  FROM dl_bordercontrol.v_tminout_ma_1hr_prod v
  --INNER JOIN dl_common.icao_doc_codes$lc icao ON v.nationcd = icao.notice$dlc
  INNER JOIN dl_bordercontrol.v_department dept ON v.dept_seqno = dept.dept_seqno
  WHERE 1 = 1
  AND 
  (
    v.typedata IN ('BIO-PHB', 'BIO-RETH')
    OR
    NVL(v.typedata, '~') NOT LIKE 'BIO%'
  )
  ]'
  || l_where_tminout_ma
  || l_where_inner_row_limit
  || q'[
  -- PIBICS PRD tminout_ma end --
  UNION ALL
  -- PIBICS PRD tminout start --
  SELECT /*+ NO_PARALLEL ]' || l_index_tminout || q'[ */
      'PIBICS' AS DATA_SOURCE
      ,'TMINOUT_PRD' AS DATA_SOURCE_SEC
      ,v.seqno AS DATA_SOURCE_SEC_PK_VAL
      ,NULL MVMNTID
      ,DECODE(v.cardtype, 1, 0, 2, 1, v.cardtype) AS DIRECTION
      ,NULL AS IMAGE_EXISTS
      ,DECODE(v.visatypecd, '0023', 2, 1) AS PERSON_TYPE
      ,v.tdtno AS DOCUMENT_NUMBER
      ,v.tm6no AS TM6_NUMBER
      ,v.efirstnm AS GIVENNAME_EN
      ,v.emiddlenm AS MIDDLENAME_EN
      ,v.efamilynm AS SURNAME_EN
      ,v.tfirstnm AS GIVENNAME_TH
      ,v.tmiddlenm AS MIDDLENAME_TH
      ,v.tfamilynm AS SURNAME_TH
      --,icao.key_value AS NATIONALITY
      ,(SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = v.nationcd AND is_active = 'Y' AND ROWNUM = 1) AS NATIONALITY
      ,v.birthdte AS DOB
      --,DECODE(v.sex, 'M', 1, 'F', 2, v.sex) AS SEX
      ,v.sex AS SEX
      ,v.visatypecd AS VISA_TYPE
      ,NVL(TRIM(v.flightprefix || v.flightnumber), v.convregno) AS VEHICLE_NO
      ,v.inoutdte AS TRAVEL_DATE
      ,CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = 'th_TH' THEN NVL(dept.depttnm, dept.deptenm) ELSE NVL(dept.deptenm, dept.depttnm) END AS BORDERPOST
      ,DECODE(v.typedata, 'ATC', 'ATC', 'PIBICS') AS SOURCE_SYSTEM
      ,UPPER(v.creusr) AS CREATED_BY
  FROM dl_bordercontrol.v_tminout_1hr_prod v
  --INNER JOIN dl_common.icao_doc_codes$lc icao ON v.nationcd = icao.notice$dlc
  INNER JOIN dl_bordercontrol.v_department dept ON v.dept_seqno = dept.dept_seqno
  WHERE 1 = 1
  AND 
  (
    v.typedata IN ('BIO-PHB', 'BIO-RETH')
    OR
    NVL(v.typedata, '~') NOT LIKE 'BIO%'
  )
  ]'
  || l_where_tminout
  || l_where_inner_row_limit
  || q'[
  -- PIBICS PRD tminout end --
  UNION ALL
  -- PIBICS PRD tmmain IN start --
  SELECT /*+ NO_PARALLEL ]' || l_index_tmmain_in || q'[ */
      'PIBICS' AS DATA_SOURCE
      ,'TMMAIN_IN_PRD' AS DATA_SOURCE_SEC
      ,v.tmrunno AS DATA_SOURCE_SEC_PK_VAL
      ,NULL MVMNTID
      ,0 AS DIRECTION
      ,NULL AS IMAGE_EXISTS
      ,DECODE(v.invisatypecd, '0023', 2, 1) AS PERSON_TYPE
      ,v.intdtno AS DOCUMENT_NUMBER
      ,v.intm6no AS TM6_NUMBER
      ,v.efirstnm AS GIVENNAME_EN
      ,v.emiddlenm AS MIDDLENAME_EN
      ,v.efamilynm AS SURNAME_EN
      ,v.tfirstnm AS GIVENNAME_TH
      ,v.tmiddlenm AS MIDDLENAME_TH
      ,v.tfamilynm AS SURNAME_TH
      --,icao.key_value AS NATIONALITY
      ,(SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = v.nationcd AND is_active = 'Y' AND ROWNUM = 1) AS NATIONALITY
      ,v.birthdte AS DOB
      --,DECODE(v.sex, 'M', 1, 'F', 2, v.sex) AS SEX
      ,v.sex AS SEX
      ,v.invisatypecd AS VISA_TYPE
      ,NVL(TRIM(v.inflightprefix || v.inflightnumber), v.inconvregno) AS VEHICLE_NO
      ,v.indte AS TRAVEL_DATE
      ,CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = 'th_TH' THEN NVL(dept.depttnm, dept.deptenm) ELSE NVL(dept.deptenm, dept.depttnm) END AS BORDERPOST
      ,DECODE(v.typedata, 'ATC', 'ATC', 'PIBICS') AS SOURCE_SYSTEM
      ,UPPER(v.increusr) AS CREATED_BY
  FROM dl_bordercontrol.v_tmmain_in_1hr_prod v
  --INNER JOIN dl_common.icao_doc_codes$lc icao ON v.nationcd = icao.notice$dlc
  INNER JOIN dl_bordercontrol.v_department dept ON v.indept_seqno = dept.dept_seqno
  WHERE 1 = 1
  AND v.indte IS NOT NULL
  AND 
  (
    v.typedata IN ('BIO-PHB', 'BIO-RETH')
    OR
    NVL(v.typedata, '~') NOT LIKE 'BIO%'
  )
  ]'
  || l_where_tmmain_in
  || l_where_inner_row_limit
  || q'[
  -- PIBICS PRD tmmain IN end --
  UNION ALL
  -- PIBICS PRD tmmain OUT start --
  SELECT /*+ NO_PARALLEL ]' || l_index_tmmain_out || q'[ */
      'PIBICS' AS DATA_SOURCE
      ,'TMMAIN_OUT_PRD' AS DATA_SOURCE_SEC
      ,v.tmrunno AS DATA_SOURCE_SEC_PK_VAL
      ,NULL MVMNTID
      ,1 AS DIRECTION
      ,NULL AS IMAGE_EXISTS
      ,DECODE(v.outvisatypecd, '0023', 2, 1) AS PERSON_TYPE
      ,v.outtdtno AS DOCUMENT_NUMBER
      ,v.outtm6no AS TM6_NUMBER
      ,v.efirstnm AS GIVENNAME_EN
      ,v.emiddlenm AS MIDDLENAME_EN
      ,v.efamilynm AS SURNAME_EN
      ,v.tfirstnm AS GIVENNAME_TH
      ,v.tmiddlenm AS MIDDLENAME_TH
      ,v.tfamilynm AS SURNAME_TH
      --,icao.key_value AS NATIONALITY
      ,(SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = v.nationcd AND is_active = 'Y' AND ROWNUM = 1) AS NATIONALITY
      ,v.birthdte AS DOB
      --,DECODE(v.sex, 'M', 1, 'F', 2, v.sex) AS SEX
      ,v.sex AS SEX
      ,v.outvisatypecd AS VISA_TYPE
      ,NVL(TRIM(v.outflightprefix || v.outflightnumber), v.outconvregno) AS VEHICLE_NO
      ,v.outdte AS TRAVEL_DATE
      ,CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = 'th_TH' THEN NVL(dept.depttnm, dept.deptenm) ELSE NVL(dept.deptenm, dept.depttnm) END AS BORDERPOST
      ,DECODE(v.typedata, 'ATC', 'ATC', 'PIBICS') AS SOURCE_SYSTEM
      ,UPPER(v.outcreusr) AS CREATED_BY
  FROM dl_bordercontrol.v_tmmain_out_1hr_prod v
  --INNER JOIN dl_common.icao_doc_codes$lc icao ON v.nationcd = icao.notice$dlc
  INNER JOIN dl_bordercontrol.v_department dept ON v.outdept_seqno = dept.dept_seqno
  WHERE 1 = 1
  AND v.outdte IS NOT NULL
  AND 
  (
    v.typedata IN ('BIO-PHB', 'BIO-RETH')
    OR
    NVL(v.typedata, '~') NOT LIKE 'BIO%'
  )
  ]'
  || l_where_tmmain_out
  || l_where_inner_row_limit
  || q'[
  -- PIBICS PRD tmmain OUT end --
]';
    END IF;

    -- ]' || p_pibics_prd_conn || '-' || v('P8001_CHECK_PIBICS_CONN') || q'[

    l_query :=
q'[
  SELECT *
  FROM
  (
    SELECT /*+ NO_PARALLEL */
        data_source
        ,data_source_sec
        ,data_source_sec_pk_val
        ,mvmntid
        ,direction
        ,image_exists
        ,person_type
        ,document_number
        ,tm6_number
        ,givenname_en
        ,middlename_en
        ,surname_en
        ,givenname_th
        ,middlename_th
        ,surname_th
        ,nationality
        ,dob
        ,sex
        ,visa_type
        ,vehicle_no
        --,travel_date
        ,TO_CHAR(travel_date, 'DD/MM/YYYY HH24:MI:SS') TRAVEL_DATE
        ,borderpost
        ,source_system
        ,created_by
    FROM
    (
        -- BIO start --
        SELECT
            'BIO' AS DATA_SOURCE
            ,'BIO' AS DATA_SOURCE_SEC
            ,m.mvmntid AS DATA_SOURCE_SEC_PK_VAL
            ,m.mvmntid
            ,m.exitflg AS DIRECTION
            ,CASE WHEN dbms_lob.getlength(mb.live_photo) > 0 THEN 'Y' ELSE NULL END AS IMAGE_EXISTS
            ,m.person_type
            ,b.docno AS DOCUMENT_NUMBER
            ,e.form_no AS TM6_NUMBER
            ,b.givenname AS GIVENNAME_EN
            ,b.middlename AS MIDDLENAME_EN
            ,b.surname AS SURNAME_EN
            ,b.givenname_thai AS GIVENNAME_TH
            ,b.middlename_thai AS MIDDLENAME_TH
            ,b.surname_thai AS SURNAME_TH
            ,b.nat AS NATIONALITY
            ,b.dob_partial.getFormatData('DD/MM/YYYY') AS DOB
            --,b.sex
            ,DECODE(b.sex, 1, 'M', 2, 'F', 'X') AS SEX
            ,m.visa_type
            ,m.scanned_flight AS VEHICLE_NO
            ,CAST(m.date_of_entry AS DATE) AS TRAVEL_DATE
            ,m.ins_borderpost AS BORDERPOST
            ,DECODE(NVL(m.source_system, -999), 1, 'BIO', 2, 'PIBICS', 3, 'ATC', 4, 'OFF', -999, 'N/A', '' || m.source_system) AS SOURCE_SYSTEM
            ,TRIM(SUBSTR(m.ins_by, 1, INSTR(m.ins_by, ' ') - 1)) AS CREATED_BY
        FROM dl_bordercontrol.movements m
        INNER JOIN dl_bordercontrol.borderdocuments b ON b.brddocid = m.brddocid
        LEFT JOIN dl_bordercontrol.entry_forms e ON m.entry_form = e.key_value
        LEFT JOIN dl_bordercontrol.movements_blob mb ON m.mvmntid = mb.mvmnt_id
        WHERE 1 = 1
        AND m.is_finished = 'Y'
        ]'
        || l_where_bio
        || CASE WHEN l_where_bio_inner IS NOT NULL THEN
        q'[
        AND b.brddocid IN
        (
            SELECT i2.brddocid
            FROM dl_bordercontrol.identities i2
            WHERE i2.identity in
            (
                SELECT i1.identity
                FROM dl_bordercontrol.identities i1
                WHERE i1.brddocid IN
                (
                    SELECT bd.brddocid
                    FROM dl_bordercontrol.borderdocuments bd
                    WHERE 1 = 1
                    ]'
                    || l_where_bio_inner
                    || q'[
                )
            )
        )
        ]'
        END
        || 
        q'[
        -- BIO end --
        UNION ALL
        -- PIBICS tminout_ma start --
        SELECT /*+ NO_PARALLEL ]' || l_index_tminout_ma || q'[ */
            'PIBICS' AS DATA_SOURCE
            ,'TMINOUT_MA' AS DATA_SOURCE_SEC
            ,v.seqno AS DATA_SOURCE_SEC_PK_VAL
            ,NULL MVMNTID
            ,DECODE(v.cardtype, 1, 0, 2, 1, v.cardtype) AS DIRECTION
            ,NULL AS IMAGE_EXISTS
            ,DECODE(v.visatypecd, '0023', 2, 1) AS PERSON_TYPE
            ,v.tdtno AS DOCUMENT_NUMBER
            ,v.tm6no AS TM6_NUMBER
            ,v.efirstnm AS GIVENNAME_EN
            ,v.emiddlenm AS MIDDLENAME_EN
            ,v.efamilynm AS SURNAME_EN
            ,v.tfirstnm AS GIVENNAME_TH
            ,v.tmiddlenm AS MIDDLENAME_TH
            ,v.tfamilynm AS SURNAME_TH
            --,icao.key_value AS NATIONALITY
            ,(SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = v.nationcd AND is_active = 'Y' AND ROWNUM = 1) AS NATIONALITY
            ,v.birthdte AS DOB
            --,DECODE(v.sex, 'M', 1, 'F', 2, v.sex) AS SEX
            ,v.sex AS SEX
            ,v.visatypecd AS VISA_TYPE
            ,NVL(TRIM(v.flightprefix || v.flightnumber), v.convregno) AS VEHICLE_NO
            ,v.inoutdte AS TRAVEL_DATE
            ,CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = 'th_TH' THEN NVL(dept.depttnm, dept.deptenm) ELSE NVL(dept.deptenm, dept.depttnm) END AS BORDERPOST
            ,DECODE(v.typedata, 'ATC', 'ATC', 'PIBICS') AS SOURCE_SYSTEM
            ,UPPER(v.creusr) AS CREATED_BY
        FROM dl_bordercontrol.v_tminout_ma v
        --INNER JOIN dl_common.icao_doc_codes$lc icao ON v.nationcd = icao.notice$dlc
        INNER JOIN dl_bordercontrol.v_department dept ON v.dept_seqno = dept.dept_seqno
        WHERE 1 = 1
        AND 
        (
            v.typedata IN ('BIO-PHB', 'BIO-RETH')
            OR
            NVL(v.typedata, '~') NOT LIKE 'BIO%'
        )
        ]'
        || l_where_tminout_ma
        || l_where_inner_row_limit
        || q'[
        -- PIBICS tminout_ma end --
        UNION ALL
        -- PIBICS tminout start --
        SELECT /*+ NO_PARALLEL ]' || l_index_tminout || q'[ */
            'PIBICS' AS DATA_SOURCE
            ,'TMINOUT' AS DATA_SOURCE_SEC
            ,v.seqno AS DATA_SOURCE_SEC_PK_VAL
            ,NULL MVMNTID
            ,DECODE(v.cardtype, 1, 0, 2, 1, v.cardtype) AS DIRECTION
            ,NULL AS IMAGE_EXISTS
            ,DECODE(v.visatypecd, '0023', 2, 1) AS PERSON_TYPE
            ,v.tdtno AS DOCUMENT_NUMBER
            ,v.tm6no AS TM6_NUMBER
            ,v.efirstnm AS GIVENNAME_EN
            ,v.emiddlenm AS MIDDLENAME_EN
            ,v.efamilynm AS SURNAME_EN
            ,v.tfirstnm AS GIVENNAME_TH
            ,v.tmiddlenm AS MIDDLENAME_TH
            ,v.tfamilynm AS SURNAME_TH
            --,icao.key_value AS NATIONALITY
            ,(SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = v.nationcd AND is_active = 'Y' AND ROWNUM = 1) AS NATIONALITY
            ,v.birthdte AS DOB
            --,DECODE(v.sex, 'M', 1, 'F', 2, v.sex) AS SEX
            ,v.sex AS SEX
            ,v.visatypecd AS VISA_TYPE
            ,NVL(TRIM(v.flightprefix || v.flightnumber), v.convregno) AS VEHICLE_NO
            ,v.inoutdte AS TRAVEL_DATE
            ,CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = 'th_TH' THEN NVL(dept.depttnm, dept.deptenm) ELSE NVL(dept.deptenm, dept.depttnm) END AS BORDERPOST
            ,DECODE(v.typedata, 'ATC', 'ATC', 'PIBICS') AS SOURCE_SYSTEM
            ,UPPER(v.creusr) AS CREATED_BY
        FROM dl_bordercontrol.v_tminout v
        --INNER JOIN dl_common.icao_doc_codes$lc icao ON v.nationcd = icao.notice$dlc
        INNER JOIN dl_bordercontrol.v_department dept ON v.dept_seqno = dept.dept_seqno
        WHERE 1 = 1
        AND 
        (
            v.typedata IN ('BIO-PHB', 'BIO-RETH')
            OR
            NVL(v.typedata, '~') NOT LIKE 'BIO%'
        )
        ]'
        || l_where_tminout
        || l_where_inner_row_limit
        || q'[
        -- PIBICS tminout end --
        UNION ALL
        -- PIBICS tmmain IN start --
        SELECT /*+ NO_PARALLEL ]' || l_index_tmmain_in || q'[ */
            'PIBICS' AS DATA_SOURCE
            ,'TMMAIN_IN' AS DATA_SOURCE_SEC
            ,v.tmrunno AS DATA_SOURCE_SEC_PK_VAL
            ,NULL MVMNTID
            ,0 AS DIRECTION
            ,NULL AS IMAGE_EXISTS
            ,DECODE(v.invisatypecd, '0023', 2, 1) AS PERSON_TYPE
            ,v.intdtno AS DOCUMENT_NUMBER
            ,v.intm6no AS TM6_NUMBER
            ,v.efirstnm AS GIVENNAME_EN
            ,v.emiddlenm AS MIDDLENAME_EN
            ,v.efamilynm AS SURNAME_EN
            ,v.tfirstnm AS GIVENNAME_TH
            ,v.tmiddlenm AS MIDDLENAME_TH
            ,v.tfamilynm AS SURNAME_TH
            --,icao.key_value AS NATIONALITY
            ,(SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = v.nationcd AND is_active = 'Y' AND ROWNUM = 1) AS NATIONALITY
            ,v.birthdte AS DOB
            --,DECODE(v.sex, 'M', 1, 'F', 2, v.sex) AS SEX
            ,v.sex AS SEX
            ,v.invisatypecd AS VISA_TYPE
            ,NVL(TRIM(v.inflightprefix || v.inflightnumber), v.inconvregno) AS VEHICLE_NO
            ,v.indte AS TRAVEL_DATE
            ,CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = 'th_TH' THEN NVL(dept.depttnm, dept.deptenm) ELSE NVL(dept.deptenm, dept.depttnm) END AS BORDERPOST
            ,DECODE(v.typedata, 'ATC', 'ATC', 'PIBICS') AS SOURCE_SYSTEM
            ,UPPER(v.increusr) AS CREATED_BY
        FROM dl_bordercontrol.v_tmmain v
        --INNER JOIN dl_common.icao_doc_codes$lc icao ON v.nationcd = icao.notice$dlc
        INNER JOIN dl_bordercontrol.v_department dept ON v.indept_seqno = dept.dept_seqno
        WHERE 1 = 1
        AND v.indte IS NOT NULL
        AND 
        (
            v.typedata IN ('BIO-PHB', 'BIO-RETH')
            OR
            NVL(v.typedata, '~') NOT LIKE 'BIO%'
        )
        ]'
        || l_where_tmmain_in
        || l_where_inner_row_limit
        || q'[
        -- PIBICS tmmain IN end --
        UNION ALL
        -- PIBICS tmmain OUT start --
        SELECT /*+ NO_PARALLEL ]' || l_index_tmmain_out || q'[ */
            'PIBICS' AS DATA_SOURCE
            ,'TMMAIN_OUT' AS DATA_SOURCE_SEC
            ,v.tmrunno AS DATA_SOURCE_SEC_PK_VAL
            ,NULL MVMNTID
            ,1 AS DIRECTION
            ,NULL AS IMAGE_EXISTS
            ,DECODE(v.outvisatypecd, '0023', 2, 1) AS PERSON_TYPE
            ,v.outtdtno AS DOCUMENT_NUMBER
            ,v.outtm6no AS TM6_NUMBER
            ,v.efirstnm AS GIVENNAME_EN
            ,v.emiddlenm AS MIDDLENAME_EN
            ,v.efamilynm AS SURNAME_EN
            ,v.tfirstnm AS GIVENNAME_TH
            ,v.tmiddlenm AS MIDDLENAME_TH
            ,v.tfamilynm AS SURNAME_TH
            --,icao.key_value AS NATIONALITY
            ,(SELECT key_value FROM dl_common.icao_doc_codes$lc WHERE notice$dlc = v.nationcd AND is_active = 'Y' AND ROWNUM = 1) AS NATIONALITY
            ,v.birthdte AS DOB
            --,DECODE(v.sex, 'M', 1, 'F', 2, v.sex) AS SEX
            ,v.sex AS SEX
            ,v.outvisatypecd AS VISA_TYPE
            ,NVL(TRIM(v.outflightprefix || v.outflightnumber), v.outconvregno) AS VEHICLE_NO
            ,v.outdte AS TRAVEL_DATE
            ,CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = 'th_TH' THEN NVL(dept.depttnm, dept.deptenm) ELSE NVL(dept.deptenm, dept.depttnm) END AS BORDERPOST
            ,DECODE(v.typedata, 'ATC', 'ATC', 'PIBICS') AS SOURCE_SYSTEM
            ,UPPER(v.outcreusr) AS CREATED_BY
        FROM dl_bordercontrol.v_tmmain v
        --INNER JOIN dl_common.icao_doc_codes$lc icao ON v.nationcd = icao.notice$dlc
        INNER JOIN dl_bordercontrol.v_department dept ON v.outdept_seqno = dept.dept_seqno
        WHERE 1 = 1
        AND v.outdte IS NOT NULL
        AND 
        (
            v.typedata IN ('BIO-PHB', 'BIO-RETH')
            OR
            NVL(v.typedata, '~') NOT LIKE 'BIO%'
        )
        ]'
        || l_where_tmmain_out
        || l_where_inner_row_limit
        || q'[
        -- PIBICS tmmain OUT end --
        ]'
        || l_pp_query
        || q'[
    )
    WHERE 1 = 1
    ]'
    || l_where_outer
    || q'[
    ORDER BY travel_date DESC
  )
  WHERE 1 = 1
  ]'
  || l_where_outer_row_limit
  || q'[
]';


    RETURN l_query;

  /*EXCEPTION
    WHEN OTHERS THEN
        RETURN 'SELECT ' || SQLCODE || '-' || SQLERRM || ' AS ERROR_DETAILS FROM DUAL ';*/
  END p8001_get_travel_history_sql;

  /**
   * Get travel history data in a collection
   * Added by MSCS
   */
  FUNCTION p8001_get_coll_travel_history
  (
    p_coll_name			    IN VARCHAR2
    , p_borderpost          IN VARCHAR2 DEFAULT NULL
    , p_scope               IN NUMBER   DEFAULT 0
    , p_direction           IN NUMBER   DEFAULT NULL
    , p_source              IN VARCHAR2 DEFAULT NULL
    , p_nationality         IN VARCHAR2 DEFAULT NULL
    , p_dob                 IN VARCHAR2 DEFAULT NULL
    , p_sex                 IN NUMBER   DEFAULT NULL
    , p_docno               IN VARCHAR2 DEFAULT NULL
    , p_tm6                 IN VARCHAR2 DEFAULT NULL
    , p_vehicle_no          IN VARCHAR2 DEFAULT NULL
    , p_travel_date_from    IN VARCHAR2 DEFAULT NULL
    , p_travel_date_to      IN VARCHAR2 DEFAULT NULL
    , p_givenname           IN VARCHAR2 DEFAULT NULL
    , p_middlename          IN VARCHAR2 DEFAULT NULL
    , p_surname             IN VARCHAR2 DEFAULT NULL
    , p_givenname_th        IN VARCHAR2 DEFAULT NULL
    , p_middlename_th       IN VARCHAR2 DEFAULT NULL
    , p_surname_th          IN VARCHAR2 DEFAULT NULL
    , p_dept_1              IN VARCHAR2 DEFAULT NULL
    , p_dept_2              IN VARCHAR2 DEFAULT NULL
    , p_dept_3              IN VARCHAR2 DEFAULT NULL
    , p_citizenid           IN VARCHAR2 DEFAULT NULL
    , p_created_by          IN VARCHAR2 DEFAULT NULL
    , p_rows                IN NUMBER   DEFAULT 1000
    , p_pibics_prd_conn     IN NUMBER   DEFAULT 0
    --, p_dr                  IN VARCHAR2 DEFAULT 'Y'
  ) RETURN NUMBER
  IS
    l_query				CLOB := NULL;
  BEGIN

    IF p_coll_name IS NULL THEN
        RETURN -10;
    END IF;

    IF ( APEX_COLLECTION.COLLECTION_EXISTS(p_collection_name => p_coll_name) ) THEN
        APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => p_coll_name);
    END IF;

    l_query := p8001_get_travel_history_sql
                (
                    p_borderpost            => p_borderpost
                    , p_scope               => p_scope
                    , p_direction           => p_direction
                    , p_source              => p_source
                    , p_nationality         => p_nationality
                    , p_dob                 => p_dob
                    , p_sex                 => p_sex
                    , p_docno               => p_docno
                    , p_tm6                 => p_tm6
                    , p_vehicle_no          => p_vehicle_no
                    , p_travel_date_from    => p_travel_date_from
                    , p_travel_date_to      => p_travel_date_to
                    , p_givenname           => p_givenname
                    , p_middlename          => p_middlename
                    , p_surname             => p_surname
                    , p_givenname_th        => p_givenname_th
                    , p_middlename_th       => p_middlename_th
                    , p_surname_th          => p_surname_th
                    , p_dept_1              => p_dept_1
                    , p_dept_2              => p_dept_2
                    , p_dept_3              => p_dept_3
                    , p_citizenid           => p_citizenid
                    , p_created_by          => p_created_by
                    , p_rows                => p_rows
                    , p_pibics_prd_conn     => p_pibics_prd_conn
                    --, p_dr                  => p_dr
                );

    APEX_COLLECTION.CREATE_COLLECTION_FROM_QUERY(
        p_collection_name => p_coll_name,
        p_query => l_query
    );

    -- complete transaction for dblink
    --IF p_pibics_prd_conn = 1 THEN
        COMMIT;
    --END IF;

    RETURN 1;

  /*EXCEPTION
    WHEN OTHERS THEN
        RETURN -99;*/

  END p8001_get_coll_travel_history;

  function bmbs_insert_travel_abis_document(p_brddocid in varchar2) return number as
    l_scope logger_logs.scope%TYPE := c_scope_prefix || 'bmbs_insert_travel_abis';
    l_params logger.tab_param;
    --
    l_brddocid      dl_bordercontrol.borderdocuments.brddocid%TYPE;
    l_docno         dl_bordercontrol.borderdocuments.docno%TYPE;
    l_issue_country dl_bordercontrol.borderdocuments.issuectry%TYPE;
    l_expiry        dl_bordercontrol.borderdocuments.expirydate%TYPE;
    --
    l_face    blob;
    l_fp01    blob;
    l_fp02    blob;
    l_fp03    blob;
    l_fp04    blob;
    l_fp05    blob;
    l_fp06    blob;
    l_fp07    blob;
    l_fp08    blob;
    l_fp09    blob;
    l_fp10    blob;
    --
    l_abis_id number := null;
    l_error   clob;
  begin
    select max(brddocid)
      into l_brddocid
      from dl_bordercontrol.borderdocuments
     where brddocid = p_brddocid;

    if l_brddocid is not null then
      select max(brddocid)
        into l_brddocid
        from dl_bordercontrol.borderdocuments
       where brddocid = p_brddocid
         and afisid is null;
      if l_brddocid is not null then
        select docno
            , issuectry
            , expirydate
          into l_docno
            , l_issue_country
            , l_expiry
          from borderdocuments
        where brddocid = p_brddocid;

        l_fp01 := DL_BORDERCONTROL.DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(l_docno, l_expiry, l_issue_country, 'WSQ_RT');
        l_fp02 := DL_BORDERCONTROL.DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(l_docno, l_expiry, l_issue_country, 'WSQ_RI');
        l_fp03 := DL_BORDERCONTROL.DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(l_docno, l_expiry, l_issue_country, 'WSQ_RM');
        l_fp04 := DL_BORDERCONTROL.DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(l_docno, l_expiry, l_issue_country, 'WSQ_RR');
        l_fp05 := DL_BORDERCONTROL.DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(l_docno, l_expiry, l_issue_country, 'WSQ_RL');
        l_fp06 := DL_BORDERCONTROL.DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(l_docno, l_expiry, l_issue_country, 'WSQ_LT');
        l_fp07 := DL_BORDERCONTROL.DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(l_docno, l_expiry, l_issue_country, 'WSQ_LI');
        l_fp08 := DL_BORDERCONTROL.DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(l_docno, l_expiry, l_issue_country, 'WSQ_LM');
        l_fp09 := DL_BORDERCONTROL.DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(l_docno, l_expiry, l_issue_country, 'WSQ_LR');
        l_fp10 := DL_BORDERCONTROL.DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(l_docno, l_expiry, l_issue_country, 'WSQ_LL');
        l_face := DL_BORDERCONTROL.DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(l_docno, l_expiry, l_issue_country, 'LIVE_PHOTO');

        l_abis_id := pkg_abis_util.abis_insert_images(l_face
                                                    , l_fp01
                                                    , l_fp02
                                                    , l_fp03
                                                    , l_fp04
                                                    , l_fp05
                                                    , l_fp06
                                                    , l_fp07
                                                    , l_fp08
                                                    , l_fp09
                                                    , l_fp10
                                                    , l_error);

        if l_abis_id is null then
          --insert into dl_bordercontrol.travel_abis_insert_error (movement_id, error_message) values (p_mvmntid, l_error);
          logger.append_param(l_params, 'l_error', l_error);
          logger.log('bmbs_insert_travel_abis', l_scope, null, l_params);
          null;
        else
          update borderdocuments
             set afisid = l_abis_id
           where brddocid = p_brddocid;

           -- additionally insert bio-data into table BIO_IDENTITIES
           insert into bio_identities (
                                         abis_id, face_photo, fingerprint_01, fingerprint_02, fingerprint_03, fingerprint_04
                                         , fingerprint_05, fingerprint_06, fingerprint_07, fingerprint_08, fingerprint_09, fingerprint_10)
                               values (
                                         l_abis_id, l_face, l_fp01, l_fp02, l_fp03, l_fp04
                                         , l_fp05, l_fp06, l_fp07, l_fp08, l_fp09, l_fp10
                                       );
           if sql%rowcount > 0 then
               logger.log('BmBS - Biometry inserted into table BIO_IDENTITIES', l_scope, null, l_params);
               --l_res := l_doc_abis_id;
           end if;
        end if;

        -- return l_abis_id;
      else
        logger.log('bmbs_insert_travel_abis - document already has biometry!');
      end if;
    else
      logger.log('bmbs_insert_travel_abis - document not found!');
    end if;

    return l_abis_id;
  end;

  FUNCTION bmbs_insert_travel_abis_movement(
      p_mvmntid in varchar2
  ) return number as
    l_scope logger_logs.scope%type := c_scope_prefix || 'bmbs_insert_travel_abis';
    l_params logger.tab_param;
  ----------
    l_res number := null; -- result ABIS ID
    l_has_biometry boolean := false;
    l_doc_abis_id number;
    l_doc_exists number := 0;
    l_brddocid dl_bordercontrol.borderdocuments.brddocid%TYPE;
  ----------
    l_face    blob;
    l_fp01    blob;
    l_fp02    blob;
    l_fp03    blob;
    l_fp04    blob;
    l_fp05    blob;
    l_fp06    blob;
    l_fp07    blob;
    l_fp08    blob;
    l_fp09    blob;
    l_fp10    blob;
    --
    l_abis_id number;
    l_error   clob;
  BEGIN
    select nvl(LIVE_PHOTO, null)
         , nvl(WSQ_RT, null)
         , nvl(WSQ_RI, null)
         , nvl(WSQ_RM, null)
         , nvl(WSQ_RR, null)
         , nvl(WSQ_RL, null)
         , nvl(WSQ_LT, null)
         , nvl(WSQ_LI, null)
         , nvl(WSQ_LM, null)
         , nvl(WSQ_LR, null)
         , nvl(WSQ_LL, null)
      into l_face
         , l_fp01
         , l_fp02
         , l_fp03
         , l_fp04
         , l_fp05
         , l_fp06
         , l_fp07
         , l_fp08
         , l_fp09
         , l_fp10
      from movements_blob
    where mvmnt_id = p_mvmntid;

    l_has_biometry := l_has_biometry or (l_face is not null);

    l_has_biometry := l_has_biometry or (l_fp01 is not null);
    l_has_biometry := l_has_biometry or (l_fp02 is not null);
    l_has_biometry := l_has_biometry or (l_fp03 is not null);
    l_has_biometry := l_has_biometry or (l_fp04 is not null);
    l_has_biometry := l_has_biometry or (l_fp05 is not null);
    l_has_biometry := l_has_biometry or (l_fp06 is not null);
    l_has_biometry := l_has_biometry or (l_fp07 is not null);
    l_has_biometry := l_has_biometry or (l_fp08 is not null);
    l_has_biometry := l_has_biometry or (l_fp09 is not null);
    l_has_biometry := l_has_biometry or (l_fp10 is not null);

    if not l_has_biometry then
      logger.log('BmBS - Insert biometry into travel ABIS - No biometry present!', l_scope, null, l_params);
    else
      select max(bd.brddocid), max(1) into l_brddocid, l_doc_exists from dl_bordercontrol.movements m join dl_bordercontrol.borderdocuments bd on bd.brddocid = m.brddocid where mvmntid = p_mvmntid and bd.afisid is null;
      if l_doc_exists > 0 then
        l_doc_abis_id := pkg_abis_util.abis_insert_images( l_face, l_fp01, l_fp02, l_fp03, l_fp04, l_fp05, l_fp06, l_fp07, l_fp08, l_fp09, l_fp10, l_error);
        if l_doc_abis_id > 0 then

            -- Add Logging Parameters
            logger.append_param(l_params, 'l_doc_abis_id', l_doc_abis_id);
            logger.append_param(l_params, 'p_brddoc_id', l_brddocid);
            logger.log('BmBS - Insert biometry into travel ABIS - Added ABIS ID to Document', l_scope, null, l_params);

            -- if ABIS_ID is not null then update border doc record into table BORDERDOCUMENTS
            update borderdocuments set afisid = l_doc_abis_id where brddocid = l_brddocid;
            if sql%rowcount > 0 then
                logger.log('BmBS - ABIS_ID (AFISID) in Table BORDERDOCUMENTS updated', l_scope, null, l_params);
            end if;


            -- additionally insert bio-data into table BIO_IDENTITIES
            insert into bio_identities (
                                          abis_id, face_photo, fingerprint_01, fingerprint_02, fingerprint_03, fingerprint_04
                                          , fingerprint_05, fingerprint_06, fingerprint_07, fingerprint_08, fingerprint_09, fingerprint_10)
                                values (
                                          l_doc_abis_id, l_face, l_fp01, l_fp02, l_fp03, l_fp04
                                          , l_fp05, l_fp06, l_fp07, l_fp08, l_fp09, l_fp10
                                        );
            if sql%rowcount > 0 then
                logger.log('BmBS - Biometry inserted into table BIO_IDENTITIES', l_scope, null, l_params);
                l_res := l_doc_abis_id;
            end if;

        else
            logger.log('BmBS - Insert biometry into travel ABIS - ABIS did not return insert ABIS ID', l_scope, null, l_params);
            insert into travel_abis_insert_error (movement_id, error_message) values (p_mvmntid, l_error);
        end if;
      end if;
    end if;
    return l_res;
  END;

  PROCEDURE p17_update_calc_mrz
  IS
  BEGIN
    PKG_BORDERDOCUMENTS.Update_CALC_MRZ (p_BRDDOCID    => v('P17_BRDDOCID')
                                        ,p_CALC_MRZDG1 => v('P17_MRZ_CORRECTION'));
  END;


END;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_BMBS_APEX_UTIL" TO "DERMALOG_PROXY";
