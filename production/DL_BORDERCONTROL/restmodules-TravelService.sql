
-- Generated by ORDS REST Data Services 18.4.0.r3541002
-- Schema: DL_BORDERCONTROL Date: removed for diff
--

BEGIN
  ORDS.ENABLE_SCHEMA(
      p_enabled             => TRUE,
      p_schema              => 'DL_BORDERCONTROL',
      p_url_mapping_type    => 'BASE_PATH',
      p_url_mapping_pattern => 'dl_bordercontrol',
      p_auto_rest_auth      => FALSE);

  ORDS.DEFINE_MODULE(
      p_module_name    => 'TravelService',
      p_base_path      => '/travel/',
      p_items_per_page => 0,
      p_status         => 'PUBLISHED',
      p_comments       => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'TravelService',
      p_pattern        => 'abis/faceimage/{MVMNT_ID}',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'TravelService',
      p_pattern        => 'abis/faceimage/{MVMNT_ID}',
      p_method         => 'GET',
      p_source_type    => 'resource/lob',
      p_items_per_page => 0,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         =>
'select ''image/jpeg''
     , live_photo
  from movements_blob
 where mvmnt_id = :MVMNT_ID');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'TravelService',
      p_pattern        => 'abis/fingerimage/{ABIS_ID}/{ISO_POSITION}',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'TravelService',
      p_pattern        => 'abis/fingerimage/{ABIS_ID}/{ISO_POSITION}',
      p_method         => 'GET',
      p_source_type    => 'resource/lob',
      p_items_per_page => 0,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         =>
'select ''image/wsq''
     , decode(
         :ISO_POSITION
       , 1, fingerprint_01
       , 2, fingerprint_02
       , 3, fingerprint_03
       , 4, fingerprint_04
       , 5, fingerprint_05
       , 6, fingerprint_06
       , 7, fingerprint_07
       , 8, fingerprint_08
       , 9, fingerprint_09
       , 10, fingerprint_10
       )
  from bio_identities
 where abis_id = :ABIS_ID
   and :ISO_POSITION >= 1
   and :ISO_POSITION <= 10');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'TravelService',
      p_pattern        => 'identity/byabisid/{ABIS_ID}',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'TravelService',
      p_pattern        => 'identity/byabisid/{ABIS_ID}',
      p_method         => 'GET',
      p_source_type    => 'json/query',
      p_items_per_page => 0,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         =>
'with searchparameters as (
  select :ABIS_ID abisid
    from dual
)
, travelidentity as (
  select identity
    from identities
    join borderdocuments on
         identities.brddocid = borderdocuments.brddocid
    join searchparameters on
         borderdocuments.afisid = searchparameters.abisid
)
, documents as (
  select brddocid
       , travelidentity.identity
    from identities
    join travelidentity on identities.identity = travelidentity.identity
)
, thaiinformation as (
  select citizenid
       , passportno
       , borderdocuments.brddocid
    from documents
    join borderdocuments on
         documents.brddocid = borderdocuments.brddocid
     and borderdocuments.issuectry = ''THA''
    join thaipassport on
         thaipassport.passportno = borderdocuments.docno
)
select borderdocuments.brddocid
     , movements.mvmntid
     , borderdocuments.docno passportno
     , thaiinformation.citizenid
     , case when borderdocuments.doctype like ''P%'' then ''Passport'' else null end documenttype
     , borderdocuments.docno documentno
     , movements.date_of_entry traveldate
     , borderdocuments.givenname firstname
     , borderdocuments.surname surname
     , decode(borderdocuments.sex, 1, ''M'', 2, ''F'', ''U'') sex
     , countries$lc.iso3166_a3 nationality
     , borderdocuments.issuectry nationality_icao
     , case when dob_partial is null or borderdocuments.dob_partial.isnull() != 0 then null else borderdocuments.dob_partial.getformatdata(''YYYY-MM-DD'') end birthdate -- pkg_common.parse_date(borderdocuments.dob, 1, 0, 0, 1) birthdate
     , afisid abisid
     , movements.exitflg is_departure
     , movements.scanned_flight transport
     , documents.identity
  from borderdocuments
  join documents on documents.brddocid = borderdocuments.brddocid
  join movements on
       borderdocuments.brddocid = movements.brddocid
  join dl_common.countries$lc on
       borderdocuments.issuectry = countries$lc.key_value
  left join thaiinformation on
       borderdocuments.brddocid = thaiinformation.brddocid
 where movements.is_finished = ''Y''');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'TravelService',
      p_pattern        => 'identity/bydocument/{NATIONALITY_ICAO}/{DOCNO}',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'TravelService',
      p_pattern        => 'identity/bydocument/{NATIONALITY_ICAO}/{DOCNO}',
      p_method         => 'GET',
      p_source_type    => 'json/query',
      p_items_per_page => 0,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         =>
'with searchparameters as (
  select :DOCNO documentno
       , :NATIONALITY_ICAO issuingcountry
    from dual
)
, travelidentity as (
  select identity
    from identities
    join borderdocuments on
         identities.brddocid = borderdocuments.brddocid
    join searchparameters on
         borderdocuments.docno = searchparameters.documentno
     and borderdocuments.issuectry = searchparameters.issuingcountry
)
, documents as (
  select brddocid
       , travelidentity.identity
    from identities
    join travelidentity on identities.identity = travelidentity.identity
)
, thaiinformation as (
  select citizenid
       , passportno
    from thaipassport
       , searchparameters
   where thaipassport.passportno = searchparameters.documentno
     and searchparameters.issuingcountry = ''THA''
)
select borderdocuments.brddocid
     , movements.mvmntid
     , borderdocuments.docno passportno
     , thaiinformation.citizenid
     , case when borderdocuments.doctype like ''P%'' then ''Passport'' else null end documenttype
     , borderdocuments.docno documentno
     , movements.date_of_entry traveldate
     , borderdocuments.givenname firstname
     , borderdocuments.surname surname
     , decode(borderdocuments.sex, 1, ''M'', 2, ''F'', ''U'') sex
     , countries$lc.iso3166_a3 nationality
     , borderdocuments.issuectry nationality_icao
     , case when dob_partial is null or borderdocuments.dob_partial.isnull() != 0 then null else borderdocuments.dob_partial.getformatdata(''YYYY-MM-DD'') end birthdate -- to_char(pkg_common.parse_date(borderdocuments.dob, 1, 0, 0, 1), ''YYYY-MM-DD'') || ''T00:00:00Z'' birthdate
--     , borderdocuments.dob birthdate
     , afisid abisid
     , movements.exitflg is_departure
     , movements.scanned_flight transport
     , documents.identity
  from borderdocuments
  join documents on documents.brddocid = borderdocuments.brddocid
  join movements on
       borderdocuments.brddocid = movements.brddocid
  join dl_common.countries$lc on
       borderdocuments.issuectry = countries$lc.key_value
  left join thaiinformation on
       borderdocuments.docno = thaiinformation.passportno
 where movements.is_finished = ''Y''');

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'TravelService',
      p_pattern        => 'identity/search',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'TravelService',
      p_pattern        => 'identity/search',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_items_per_page => 0,
      p_mimes_allowed  => 'application/json',
      p_comments       => NULL,
      p_source         =>
'declare
    l_values         APEX_JSON.T_VALUES;
    l_source_blob    blob := :body;
    l_source_clob    clob;
    --
    l_dstoff    integer := 1;
    l_srcoff    integer := 1;
    l_lngctx    integer := 0;
    l_warning   integer;
    --
    l_identity_id varchar2(32);
    l_limit_record varchar2(32);
    --
    l_response_message  varchar2(4000);
    l_cursor    sys_refcursor;
    --
begin

    -- Init and parse
    begin
        dbms_lob.createtemporary(l_source_clob, true);

        dbms_lob.converttoclob(dest_lob     => l_source_clob
                              ,src_blob     => l_source_blob
                              ,amount       => dbms_lob.lobmaxsize
                              ,dest_offset  => l_dstoff
                              ,src_offset   => l_srcoff
                              ,blob_csid    => nls_charset_id(''AL32UTF8'')
                              ,lang_context => l_lngctx
                              ,warning      => l_warning);
        apex_json.parse(p_values => l_values
                       ,p_source => l_source_clob);

        l_identity_id := apex_json.get_varchar2(p_values => l_values, p_path => ''identityID'');
        l_limit_record := apex_json.get_varchar2(p_values => l_values, p_path => ''LimitRecord'');

    -- Check all mandatory fields; if not filled exit with code 400 and msg
    if l_identity_id is null
    then
        :status := 400;
        l_response_message := ''Search cannot be executed; Field is missing: '';

        case when l_identity_id is null then l_response_message := l_response_message || ''identityID, ''; else null; end case;

        l_response_message := substr(l_response_message, 1, length(l_response_message) - 2) || ''. Please provide and then try again.'';

        :msg    := l_response_message;
        :result := null;

        return;
    end if;

     -- Check limit_record fields; if not filled then max
    if l_limit_record is null
    then
        l_limit_record := ''999999999999'';
    else
        if TO_NUMBER(l_limit_record DEFAULT 0 ON CONVERSION ERROR) = 0
        then
            :status := 400;
            l_response_message := ''Search cannot be executed; Field LimitRecord is not a number! Please provide and then try again.'';

            :msg    := l_response_message;
            :result := null;

            return;
        end if;
    end if;

    -- exception handling; fail json parse or check madatory
    exception when others
    then
        :status := 400;
        :msg    := ''Body could not be parsed. Check your json'';
        :result := null;
        return;
    end;

    -- check if other identities can be found
    begin
        open l_cursor for
            with travelidentity as (
            select identity, docno, issuectry
                from identities
                join borderdocuments on
                    identities.brddocid = borderdocuments.brddocid
                where identities.identity = l_identity_id
            )
            , documents as (
            select brddocid
                , travelidentity.identity
                from identities
                join travelidentity on identities.identity = travelidentity.identity
            )
            , thaiinformation as (
            select citizenid
                , passportno
                from thaipassport
                join travelidentity on travelidentity.docno = thaipassport.passportno and travelidentity.issuectry = ''THA''
            )
            select distinct borderdocuments.brddocid
                , movements.mvmntid
                , borderdocuments.docno passportno
                , thaiinformation.citizenid
                , case when borderdocuments.doctype like ''P%'' then ''Passport'' else null end documenttype
                , borderdocuments.docno documentno
                , movements.date_of_entry traveldate
                , borderdocuments.givenname firstname
                , borderdocuments.middlename middlename
                , borderdocuments.surname surname
                , decode(borderdocuments.sex, 1, ''M'', 2, ''F'', ''U'') sex
                , countries$lc.iso3166_a3 nationality
                , borderdocuments.issuectry nationality_icao
                , to_char(pkg_common.parse_date(borderdocuments.dob, 1, 0, 0, 1), ''YYYY-MM-DD'') || ''T00:00:00Z'' birthdate
            --     , borderdocuments.dob birthdate
                , afisid abisid
                , movements.exitflg is_departure
                , movements.scanned_flight transport
                , documents.identity
                , (select name from dl_bordercontrol.borderposts where key_value = movements.ins_borderpost) as borderpost
            from borderdocuments
            join documents on documents.brddocid = borderdocuments.brddocid
            join movements on
                borderdocuments.brddocid = movements.brddocid
            join dl_common.countries$lc on
                borderdocuments.issuectry = countries$lc.key_value
            left join thaiinformation on
                borderdocuments.docno = thaiinformation.passportno
            where movements.is_finished = ''Y''
            order by movements.date_of_entry desc
            FETCH FIRST l_limit_record ROWS ONLY;

        -- exception handling; no data found and others
        exception
        when no_data_found then
            :status := 204;
            :msg    := ''No matching movements found.'';
            :result := null;
            return;
        when others then
            :status := 500;
            :msg    := sqlerrm;
            :result := null;

    end;

    -- set result and status code
    :status := 200;
    :msg    := ''Success'';
    :result := l_cursor;

end;');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'TravelService',
      p_pattern            => 'identity/search',
      p_method             => 'POST',
      p_name               => 'items',
      p_bind_variable_name => 'result',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'RESULTSET',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'TravelService',
      p_pattern            => 'identity/search',
      p_method             => 'POST',
      p_name               => 'message',
      p_bind_variable_name => 'msg',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'TravelService',
      p_pattern            => 'identity/search',
      p_method             => 'POST',
      p_name               => 'X-APEX-STATUS-CODE',
      p_bind_variable_name => 'status',
      p_source_type        => 'HEADER',
      p_param_type         => 'INT',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'TravelService',
      p_pattern        => 'movementhistory/search',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);

  ORDS.DEFINE_HANDLER(
      p_module_name    => 'TravelService',
      p_pattern        => 'movementhistory/search',
      p_method         => 'POST',
      p_source_type    => 'plsql/block',
      p_items_per_page => 0,
      p_mimes_allowed  => 'application/json',
      p_comments       => NULL,
      p_source         =>
'declare
    l_values         APEX_JSON.T_VALUES;
    l_source_blob    blob := :body;
    l_source_clob    clob;
    --
    l_dstoff    integer := 1;
    l_srcoff    integer := 1;
    l_lngctx    integer := 0;
    l_warning   integer;
    --
    l_nationality       varchar2(10);
    l_issuing_country   varchar2(50);
    l_passport_no       varchar2(20);
    l_expiry_date       varchar2(10);
    l_firstname         varchar2(100);
    l_lastname          varchar2(100);
    l_middlename        varchar2(100);
    l_birth_date        varchar2(10);
    l_sex               number;
    l_borderpost        varchar2(100);
    l_travel_from       varchar2(16);
    l_travel_until      varchar2(16);
    l_flight_no         varchar2(20);
    l_direction         number;
    l_age_from          number;
    l_age_until         number;
    l_abis_id           number;
    l_limit_record      number;
    --
    l_response_message  varchar2(4000);
    l_cursor    sys_refcursor;
    --
begin

    -- Init and parse
    begin
        dbms_lob.createtemporary(l_source_clob, true);

        dbms_lob.converttoclob(dest_lob     => l_source_clob
                              ,src_blob     => l_source_blob
                              ,amount       => dbms_lob.lobmaxsize
                              ,dest_offset  => l_dstoff
                              ,src_offset   => l_srcoff
                              ,blob_csid    => nls_charset_id(''AL32UTF8'')
                              ,lang_context => l_lngctx
                              ,warning      => l_warning);
        apex_json.parse(p_values => l_values
                       ,p_source => l_source_clob);

        l_nationality       := apex_json.get_varchar2(p_values => l_values, p_path => ''Demographic.Nationality'');
        l_issuing_country   := apex_json.get_varchar2(p_values => l_values, p_path => ''Demographic.PassportIssuingCountry'');
        l_passport_no       := apex_json.get_varchar2(p_values => l_values, p_path => ''Demographic.PassportNo'');
        l_expiry_date       := apex_json.get_varchar2(p_values => l_values, p_path => ''Demographic.ExpireDate'');
        l_firstname         := apex_json.get_varchar2(p_values => l_values, p_path => ''Demographic.FirstName'');
        l_lastname          := apex_json.get_varchar2(p_values => l_values, p_path => ''Demographic.SurName'');
        l_middlename        := apex_json.get_varchar2(p_values => l_values, p_path => ''Demographic.MiddleName'');
        l_birth_date        := apex_json.get_varchar2(p_values => l_values, p_path => ''Demographic.BirthDate'');
        l_sex               := case apex_json.get_varchar2(p_values => l_values, p_path => ''Demographic.Sex'') when ''M'' then 1 when ''F'' then 2 else null end;
        l_borderpost        := apex_json.get_varchar2(p_values => l_values, p_path => ''Borderpost'');
        l_travel_from       := apex_json.get_varchar2(p_values => l_values, p_path => ''TravelDateFrom'');
        l_travel_until      := apex_json.get_varchar2(p_values => l_values, p_path => ''TravelDateTo'');
        l_direction         := case apex_json.get_varchar2(p_values => l_values, p_path => ''Direction'') when ''Arrival'' then 0 when ''Departure'' then 1 else null end;
        l_flight_no         := apex_json.get_varchar2(p_values => l_values, p_path => ''KIFlight'');
        l_age_from          := apex_json.get_number(p_values => l_values, p_path => ''KIAgeFrom'');
        l_age_until         := apex_json.get_number(p_values => l_values, p_path => ''KIAgeTo'');
        l_abis_id           := apex_json.get_number(p_values => l_values, p_path => ''ABISid'');
        l_limit_record      := apex_json.get_number(p_values => l_values, p_path => ''LimitRecord'');

        if l_limit_record is null
        then l_limit_record := 999999999999;
        end if;

    -- Check all mandatory fields; if not filled exit with code 400 and msg
--    if l_nationality    is null or
--       l_firstname      is null or
--       l_lastname       is null or
--       l_birth_date     is null or
--       l_sex            is null
--    then
--        :status := 400;
--        l_response_message := ''Search cannot be executed; Fields are missing: '';
--
--        case when l_nationality is null then l_response_message := l_response_message || ''Nationality, '';   else null; end case;
--        case when l_firstname   is null then l_response_message := l_response_message || ''FirstName, '';     else null; end case;
--        case when l_lastname    is null then l_response_message := l_response_message || ''SurName, '';       else null; end case;
--        case when l_birth_date  is null then l_response_message := l_response_message || ''BirthDate, '';     else null; end case;
--        case when l_sex         is null then l_response_message := l_response_message || ''Sex, '';           else null; end case;
--
--        l_response_message := substr(l_response_message, 1, length(l_response_message) - 2) || ''. Please provide and then try again.'';
--
--        :msg    := l_response_message;
--        :result := null;
--
--        return;
--
--    end if;

    -- exception handling; fail json parse or check madatory
    exception when others
    then
        :status := 400;
        :msg    := ''Body could not be parsed. Check your json'';
        :result := null;
        return;
    end;

    begin
        open l_cursor for
            select borderdocuments.brddocid
                , movements.mvmntid
                , borderdocuments.docno passportno
                , (select citizenid from thaipassport where passportno = borderdocuments.brddocid) as citizenid
                , case when borderdocuments.doctype like ''P%'' then ''Passport'' else null end documenttype
                , borderdocuments.docno documentno
                , movements.date_of_entry traveldate
                , borderdocuments.givenname firstname
                , borderdocuments.middlename middlename
                , borderdocuments.surname surname
                , decode(borderdocuments.sex, 1, ''M'', 2, ''F'', ''U'') sex
                , countries$lc.iso3166_a3 nationality
                , borderdocuments.issuectry nationality_icao
                , to_char(pkg_common.parse_date(borderdocuments.dob, 1, 0, 0, 1), ''YYYY-MM-DD'') || ''T00:00:00Z'' birthdate
                , afisid abisid
                , movements.exitflg is_departure
                , movements.scanned_flight transport
                , (select identity from identities where brddocid = borderdocuments.brddocid) as identity
                , borderposts.name as borderpost
            from borderdocuments
            join movements on borderdocuments.brddocid = movements.brddocid
            join dl_common.countries$lc on borderdocuments.issuectry = countries$lc.key_value
       left join borderposts on borderposts.key_value = movements.ins_borderpost
            where (l_nationality      is null or (borderdocuments.nat         = l_nationality))
              and (l_issuing_country  is null or (borderdocuments.issuectry   = l_issuing_country))
              and (l_passport_no      is null or (borderdocuments.docno       = l_passport_no))
              and (l_expiry_date      is null or (to_char(borderdocuments.expirydate, ''yyyy-mm-dd'') = l_expiry_date))
              and ((l_firstname       is null or (lower(borderdocuments.givenname)  = lower(l_firstname)))  or (l_firstname  is null or (lower(borderdocuments.givenname_thai)  = lower(l_firstname))))
              and ((l_lastname        is null or (lower(borderdocuments.surname)    = lower(l_lastname)))   or (l_lastname   is null or (lower(borderdocuments.surname_thai)    = lower(l_lastname))))
              and ((l_middlename      is null or (lower(borderdocuments.middlename) = lower(l_middlename))) or (l_middlename is null or (lower(borderdocuments.middlename_thai) = lower(l_middlename))))
              and (l_birth_date       is null or (to_char(borderdocuments.calc_dob, ''yyyy-mm-dd'') = l_birth_date))
              and (l_sex              is null or (borderdocuments.sex         = l_sex))
              and (l_age_from         is null or (trunc(months_between(sysdate,borderdocuments.calc_dob)/12) >= l_age_from))
              and (l_age_until        is null or (trunc(months_between(sysdate,borderdocuments.calc_dob)/12) <= l_age_until))
              and (l_abis_id          is null or (borderdocuments.afisid      = l_abis_id))
              and movements.mvmntid = (select movements.mvmntid
                                         from movements
                                    left join borderposts on borderposts.key_value = movements.ins_borderpost
                                        where movements.is_finished = ''Y''
                                          and movements.brddocid = borderdocuments.brddocid
                                          and (l_travel_from      is null or (movements.date_of_entry >= to_date(l_travel_from, ''YYYY-MM-DD HH24:MI'')))
                                          and (l_travel_until     is null or (movements.date_of_entry <= to_date(l_travel_until, ''YYYY-MM-DD HH24:MI'')))
                                          and (l_direction        is null or (movements.exitflg = l_direction))
                                          and (l_flight_no        is null or (movements.scanned_flight = l_flight_no))
                                          and (l_borderpost       is null or (borderposts.name  = l_borderpost))
                                        order by movements.date_of_entry desc
                                        fetch first 1 rows only)
            order by movements.movement_dt
            fetch first l_limit_record rows only;

        -- exception handling; no data found and others
        exception
        when no_data_found then
            :status := 204;
            :msg    := ''No matching identities found.'';
            :result := null;
            return;
        when others then
            :status := 500;
            :msg    := sqlerrm;
            :result := null;

    end;

    -- set result and status code
    :status := 200;
    :msg    := ''Success'';
    :result := l_cursor;

end;');

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'TravelService',
      p_pattern            => 'movementhistory/search',
      p_method             => 'POST',
      p_name               => 'items',
      p_bind_variable_name => 'result',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'RESULTSET',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'TravelService',
      p_pattern            => 'movementhistory/search',
      p_method             => 'POST',
      p_name               => 'message',
      p_bind_variable_name => 'msg',
      p_source_type        => 'RESPONSE',
      p_param_type         => 'STRING',
      p_access_method      => 'OUT',
      p_comments           => NULL);

  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'TravelService',
      p_pattern            => 'movementhistory/search',
      p_method             => 'POST',
      p_name               => 'X-APEX-STATUS-CODE',
      p_bind_variable_name => 'status',
      p_source_type        => 'HEADER',
      p_param_type         => 'INT',
      p_access_method      => 'OUT',
      p_comments           => NULL);



COMMIT;

END;


/
timing for: TIMER_REST_EXPORT
Elapsed: 00:00:00.15
