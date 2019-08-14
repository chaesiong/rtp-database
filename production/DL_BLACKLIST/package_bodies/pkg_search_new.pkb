CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BLACKLIST"."PKG_SEARCH_NEW" is
  --
  /*
  --
  select cast(to_timestamp('2018-04-24T00:00:00.000Z'
                          ,'YYYY-MM-DD"T"HH24:MI:SS.FF3"Z"') as date)
    from dual;
  --
  */
  --
  -- Part1: Major-Version
  -- Part2: Minor-Version
  -- Part3:
  -- Part4: Patch-Version
  --
  -- !!! INCREMENT THIS VERSIONS STRING ON EACH CHANGE INSIDE THE PACKAGE !!!
  --
  c_package_id       constant simple_integer := -1; --PKG_CONSTS.C_PID$DEMO$REPORT4CENT;
  c_object_version   constant varchar2(19) := '1.0.0102';
  c_object_copyright constant varchar2(255 char) := 'Copyright: DERMALOG Identification Systems GmbH, Hamburg - Germany, 2013-' || to_char(sysdate
                                                                                                                                          ,'yyyy');
  --
  -- If NOT initialized then call Init_PACKAGE() in every proc/func where Init_PACKAGE must be run before normal processing of it can be go!!!
  -- For example: "if (not g_PACKAGE_Initialized) then Init_PACKAGE(); end if;"
  g_package_initialized  boolean := false;
  g_package_initializing boolean := false;
  --
  --
  c_char_ascii_1_to_31 constant varchar2(31) := chr(1) || chr(2) || chr(3) || chr(4) || chr(5)
                                               --
                                                || chr(6) || chr(7) || chr(8) || chr(9) || chr(10)
                                               --
                                                || chr(11) || chr(12) || chr(13) || chr(14) || chr(15)
                                               --
                                                || chr(16) || chr(17) || chr(18) || chr(19) || chr(20)
                                               --
                                                || chr(21) || chr(22) || chr(23) || chr(24) || chr(25)
                                               --
                                                || chr(26) || chr(27) || chr(28) || chr(29) || chr(30)
                                               --
                                                || chr(31);
  --
  -- LT_IDX: Indexname of lower(trim())-Index for table x
  -- ST_IDX: Indexname of soundex(trim())-Index for table x
  g_lt_idx4travel_docs varchar2(255 char) := 'TRAVEL_DOCS$IX90 TRAVEL_DOCS$IX95';
  g_st_idx4travel_docs varchar2(255 char) := 'TRAVEL_DOCS$IX91 TRAVEL_DOCS$IX95';
  g_lt_idx4identities  varchar2(255 char) := 'IDENTITIES$IX90';
  g_st_idx4identities  varchar2(255 char) := 'IDENTITIES$IX91';
  --g_lt_idx4thaipassport   varchar2(255 char) := 'THAIPASSPORT$IX90';
  --g_st_idx4thaipassport   varchar2(255 char) := 'THAIPASSPORT$IX91';
  --g_lt_idx4human_sexes    varchar2(255 char) := 'HUMAN_SEXES$IX90 HUMAN_SEXES$I18N$IX90';
  --g_st_idx4human_sexes    varchar2(255 char) := 'HUMAN_SEXES$IX91 HUMAN_SEXES$I18N$IX91';
  --g_lt_idx4icao_doc_codes varchar2(255 char) := 'ICAO_DOC_CODES$IX90 ICAO_DOC_CODES$I18N$IX90';
  --g_st_idx4icao_doc_codes varchar2(255 char) := 'ICAO_DOC_CODES$IX91 ICAO_DOC_CODES$I18N$IX91';
  --g_lt_idx4countries      varchar2(255 char) := 'COUNTRIES$IX90 COUNTRIES$I18N$IX90';
  --g_st_idx4countries      varchar2(255 char) := 'COUNTRIES$IX91 COUNTRIES$I18N$IX91';
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    18.04.2018  Prepare_QRY_Value:Copy of CABIS.PKG_BLACKLIST
  *******************************************************************************/
  --
  function prepare_qry_value(p_value in varchar2
                             --
                             ) return varchar2 is
    --
  begin
    --
    --
    if (not g_package_initialized)
    then
      init_package();
    end if;
    --
    --
    return replace(translate(p_value
                            ,' ' || c_char_ascii_1_to_31
                            ,' ')
                  ,''''
                  ,'''''');
    --
  end prepare_qry_value;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    18.04.2018  Check_QRY_Values4Search:Copy of CABIS.PKG_BLACKLIST
  * WWirns    19.04.2018  Check_QRY_Values4Search:Any changes depending on new attributes
  *******************************************************************************/
  --
  procedure check_qry_values4search(p_qry_surname                 in varchar2
                                   ,p_qry_middle_name             in varchar2
                                   ,p_qry_given_name              in varchar2
                                   ,p_qry_sex                     in varchar2
                                   ,p_qry_date_of_birth_f         in varchar2
                                   ,p_qry_date_of_birth_t         in varchar2
                                   ,p_qry_nationality             in varchar2
                                   ,p_qry_tdt_doc_number          in varchar2
                                   ,p_qry_tdt_date_of_expiry_f    in varchar2
                                   ,p_qry_tdt_date_of_expiry_t    in varchar2
                                   ,p_qry_tdt_issuing_country     in varchar2
                                   ,p_result_msg                  out nocopy varchar2
                                   ,p_result_date_of_birth_f      out nocopy date
                                   ,p_result_date_of_birth_t      out nocopy date
                                   ,p_result_tdt_date_of_expiry_f out nocopy date
                                   ,p_result_tdt_date_of_expiry_t out nocopy date
                                    --
                                    ) is
    --
    v_surname             identities.surname%type;
    v_middle_name         identities.middle_name%type;
    v_given_name          identities.given_name%type;
    v_sex                 dl_common.human_sexes.display_value%type;
    v_nationality         dl_common.countries.display_value%type;
    v_tdt_doc_number      travel_docs.doc_number%type;
    v_tdt_issuing_country dl_common.icao_doc_codes.display_value%type; --TRAVEL_DOCS.ISSUING_COUNTRY%type;
    v_sqlcode             number;
    v_sqlerrm             varchar2(32767);
    --
  begin
    --
    --
    if (not g_package_initialized)
    then
      init_package();
    end if;
    --
    --
    p_result_msg := null;
    --
    --
    begin
      v_surname := p_qry_surname;
    exception
      when value_error then
        p_result_msg := 'The text argument QRY_SURNAME is not useable, perhaps the text is too long!';
        return;
    end;
    --
    --
    begin
      v_middle_name := p_qry_middle_name;
    exception
      when value_error then
        p_result_msg := 'The text argument QRY_MIDDLE_NAME is not useable, perhaps the text is too long!';
        return;
    end;
    --
    --
    begin
      v_given_name := p_qry_given_name;
    exception
      when value_error then
        p_result_msg := 'The text argument QRY_GIVEN_NAME is not useable, perhaps the text is too long!';
        return;
    end;
    --
    --
    if (p_qry_sex is not null)
    then
      begin
        v_sex := p_qry_sex;
      exception
        when value_error then
          p_result_msg := 'The text argument QRY_SEX is not useable, perhaps the text is too long!';
          return;
      end;
    end if;
    --
    --
    if (p_qry_date_of_birth_f is not null)
    then
      begin
        p_result_date_of_birth_f := dl_common.pkg_util.to_date(substr(p_qry_date_of_birth_f
                                                                     ,1
                                                                     ,19)
                                                              ,'YYYY-MM-DD"T"HH24:MI:SS');
      exception
        when others then
          begin
            p_result_date_of_birth_f := dl_common.pkg_util.to_date(p_qry_date_of_birth_f
                                                                  ,'RRMMDD');
          exception
            when others then
              begin
                p_result_date_of_birth_f := dl_common.pkg_util.to_date(p_qry_date_of_birth_f
                                                                      ,'RRRRMMDD');
              exception
                when others then
                  begin
                    p_result_date_of_birth_f := dl_common.pkg_util.to_date(p_qry_date_of_birth_f
                                                                          ,'RRRR-MM-DD');
                  exception
                    when others then
                      p_result_msg := 'The date argument QRY_DATE_OF_BIRTH_F is an invalid date or it does not meet one of the following formats "RRMMDD", "RRRRMMDD", "RRRR-MM-DD" or "YYYY-MM-DD\"T\"HH24:MI:SS"!';
                      return;
                  end;
              end;
          end;
      end;
    end if;
    --
    --
    if (p_qry_date_of_birth_t is not null)
    then
      begin
        p_result_date_of_birth_t := dl_common.pkg_util.to_date(substr(p_qry_date_of_birth_t
                                                                     ,1
                                                                     ,19)
                                                              ,'YYYY-MM-DD"T"HH24:MI:SS');
      exception
        when others then
          begin
            p_result_date_of_birth_t := dl_common.pkg_util.to_date(p_qry_date_of_birth_t
                                                                  ,'RRMMDD');
          exception
            when others then
              begin
                p_result_date_of_birth_t := dl_common.pkg_util.to_date(p_qry_date_of_birth_t
                                                                      ,'RRRRMMDD');
              exception
                when others then
                  begin
                    p_result_date_of_birth_t := dl_common.pkg_util.to_date(p_qry_date_of_birth_t
                                                                          ,'RRRR-MM-DD');
                  exception
                    when others then
                      p_result_msg := 'The date argument QRY_DATE_OF_BIRTH_T is an invalid date or it does not meet one of the following formats "RRMMDD", "RRRRMMDD", "RRRR-MM-DD" or "YYYY-MM-DD\"T\"HH24:MI:SS"!';
                      return;
                  end;
              end;
          end;
      end;
    end if;
    --
    --
    begin
      v_nationality := p_qry_nationality;
    exception
      when value_error then
        p_result_msg := 'The text argument QRY_NATIONALITY is not useable, perhaps the text is too long!';
        return;
    end;
    --
    --
    --
    begin
      v_tdt_doc_number := p_qry_tdt_doc_number;
    exception
      when value_error then
        p_result_msg := 'The text argument QRY_TDT_DOC_NUMBER is not useable, perhaps the text is too long!';
        return;
    end;
    --
    --
    begin
      v_tdt_issuing_country := p_qry_tdt_issuing_country;
    exception
      when value_error then
        p_result_msg := 'The text argument QRY_TDT_ISSUING_COUNTRY is not useable, perhaps the text is too long!';
        return;
    end;
    --
    --
    if ((v_tdt_doc_number is not null or v_tdt_issuing_country is not null)
       --
       and (v_tdt_doc_number is null or v_tdt_issuing_country is null)
       --
       )
    then
      p_result_msg := 'Both text arguments TDT_DOC_NUMBER and TDT_ISSUING_COUNTRY must be specified!';
      return;
    end if;
    --
    --
    if (p_qry_tdt_date_of_expiry_f is not null)
    then
      if (v_tdt_doc_number is null)
      then
        p_result_msg := 'The date argument QRY_TDT_DATE_OF_EXPIRY_F can only be specified if the text argument QRY_TDT_DOC_NUMBER is also be specified!';
        return;
      end if;
      begin
        p_result_tdt_date_of_expiry_f := dl_common.pkg_util.to_date(substr(p_qry_tdt_date_of_expiry_f
                                                                          ,1
                                                                          ,19)
                                                                   ,'YYYY-MM-DD"T"HH24:MI:SS');
      exception
        when others then
          begin
            p_result_tdt_date_of_expiry_f := dl_common.pkg_util.to_date(p_qry_tdt_date_of_expiry_f
                                                                       ,'RRMMDD');
          exception
            when others then
              begin
                p_result_tdt_date_of_expiry_f := dl_common.pkg_util.to_date(p_qry_tdt_date_of_expiry_f
                                                                           ,'RRRRMMDD');
              exception
                when others then
                  begin
                    p_result_tdt_date_of_expiry_f := dl_common.pkg_util.to_date(p_qry_tdt_date_of_expiry_f
                                                                               ,'RRRR-MM-DD');
                  exception
                    when others then
                      p_result_msg := 'The date argument QRY_TDT_DATE_OF_EXPIRY_F is an invalid date or it does not meet one of the following formats "RRMMDD", "RRRRMMDD", "RRRR-MM-DD" or "YYYY-MM-DD\"T\"HH24:MI:SS"!';
                      return;
                  end;
              end;
          end;
      end;
    end if;
    --
    --
    if (p_qry_tdt_date_of_expiry_t is not null)
    then
      if (v_tdt_doc_number is null)
      then
        p_result_msg := 'The date argument QRY_TDT_DATE_OF_EXPIRY_T can only be specified if the text argument QRY_TDT_DOC_NUMBER is also be specified!';
        return;
      end if;
      begin
        p_result_tdt_date_of_expiry_t := dl_common.pkg_util.to_date(substr(p_qry_tdt_date_of_expiry_t
                                                                          ,1
                                                                          ,19)
                                                                   ,'YYYY-MM-DD"T"HH24:MI:SS');
      exception
        when others then
          begin
            p_result_tdt_date_of_expiry_t := dl_common.pkg_util.to_date(p_qry_tdt_date_of_expiry_t
                                                                       ,'RRMMDD');
          exception
            when others then
              begin
                p_result_tdt_date_of_expiry_t := dl_common.pkg_util.to_date(p_qry_tdt_date_of_expiry_t
                                                                           ,'RRRRMMDD');
              exception
                when others then
                  begin
                    p_result_tdt_date_of_expiry_t := dl_common.pkg_util.to_date(p_qry_tdt_date_of_expiry_t
                                                                               ,'RRRR-MM-DD');
                  exception
                    when others then
                      p_result_msg := 'The date argument QRY_TDT_DATE_OF_EXPIRY_T is an invalid date or it does not meet one of the following formats "RRMMDD", "RRRRMMDD", "RRRR-MM-DD" or "YYYY-MM-DD\"T\"HH24:MI:SS"!';
                      return;
                  end;
              end;
          end;
      end;
    end if;
    --
    --
    if ((v_sex is not null
       --
       or p_result_date_of_birth_f is not null
       --
       or v_nationality is not null
       --
       )
       --
       and not (v_surname is not null or v_middle_name is not null or v_given_name is not null)
       --
       )
    then
      p_result_msg := 'The text arguments QRY_SEX, QRY_DATE_OF_BIRTH or QRY_NATIONALITY can only be specified if one of the following text arguments QRY_SURNAME, QRY_MIDDLE_NAME or QRY_GIVEN_NAME is also be specified!';
      return;
    end if;
    --
  exception
    when others then
      dl_common.pkg_util.formaterrmsg(v_sqlcode
                                     ,v_sqlerrm);
      --
      --
      raise_application_error(v_sqlcode
                             ,v_sqlerrm);
      --
  end check_qry_values4search;
  --
  function check_qry_values4search(p_qry_surname              in varchar2
                                  ,p_qry_middle_name          in varchar2
                                  ,p_qry_given_name           in varchar2
                                  ,p_qry_sex                  in varchar2
                                  ,p_qry_date_of_birth_f      in varchar2
                                  ,p_qry_date_of_birth_t      in varchar2
                                  ,p_qry_nationality          in varchar2
                                  ,p_qry_tdt_doc_number       in varchar2
                                  ,p_qry_tdt_date_of_expiry_f in varchar2
                                  ,p_qry_tdt_date_of_expiry_t in varchar2
                                  ,p_qry_tdt_issuing_country  in varchar2
                                   --
                                   ) return varchar2 is
    --
    v_result_msg                  varchar2(32767 char);
    v_result_date_of_birth_f      date;
    v_result_date_of_birth_t      date;
    v_result_tdt_date_of_expiry_f date;
    v_result_tdt_date_of_expiry_t date;
    --
  begin
    --
    --
    check_qry_values4search(p_qry_surname
                           ,p_qry_middle_name
                           ,p_qry_given_name
                           ,p_qry_sex
                           ,p_qry_date_of_birth_f
                           ,p_qry_date_of_birth_t
                           ,p_qry_nationality
                           ,p_qry_tdt_doc_number
                           ,p_qry_tdt_date_of_expiry_f
                           ,p_qry_tdt_date_of_expiry_t
                           ,p_qry_tdt_issuing_country
                           ,v_result_msg
                           ,v_result_date_of_birth_f
                           ,v_result_date_of_birth_t
                           ,v_result_tdt_date_of_expiry_f
                           ,v_result_tdt_date_of_expiry_t
                            --
                            );
    --
    --
    return v_result_msg;
    --
  end check_qry_values4search;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    18.04.2018  To_Arguments4Search:Copy of CABIS.PKG_BLACKLIST
  * WWirns    19.04.2018  To_Arguments4Search:Any changes depending on new attributes
  * WWirns    04.05.2018  XX:Remove unneeded feature "Variance-Groups"
  *******************************************************************************/
  --
  procedure to_arguments4search(p_req_json                 in clob
                               ,p_qry_surname              out nocopy varchar2
                               ,p_qry_middle_name          out nocopy varchar2
                               ,p_qry_given_name           out nocopy varchar2
                               ,p_qry_sex                  out nocopy varchar2
                               ,p_qry_date_of_birth_f      out nocopy varchar2
                               ,p_qry_date_of_birth_t      out nocopy varchar2
                               ,p_qry_nationality          out nocopy varchar2
                               ,p_qry_tdt_doc_number       out nocopy varchar2
                               ,p_qry_tdt_date_of_expiry_f out nocopy varchar2
                               ,p_qry_tdt_date_of_expiry_t out nocopy varchar2
                               ,p_qry_tdt_issuing_country  out nocopy varchar2
                               ,p_res_max_rows             out nocopy pls_integer
                               ,p_res_mscore_algorithm     out nocopy varchar2
                               ,p_res_show_row_num         out nocopy pls_integer
                               ,p_res_show_row_cnt         out nocopy pls_integer
                               ,p_res_show_extended        out nocopy pls_integer
                               ,p_query_type4where         out nocopy varchar2
                               ,p_use_index_hints          out nocopy pls_integer
                                --
                                ) is
    --
  begin
    --
    --
    /*
    -- Example-JSON for Search-Request
    {
      "_surname_comment": "string :",
      "surname": "hage",
      "_middlename_comment": "string :",
      "middlename": "",
      "_firstname_comment": "string :",
      "firstname": "",
      "_sex_comment": "string :",
      "sex": "",
      "_dateOfBirth_comment": "string : date format in [ RRMMDD | RRRRMMDD | RRRR-MM-DD | YYYY-MM-DD\"T\"HH24:MI:SS ]",
      "dateOfBirth": "",
      "_dateOfBirthFrom_comment": "string : date format in [ RRMMDD | RRRRMMDD | RRRR-MM-DD | YYYY-MM-DD\"T\"HH24:MI:SS ]",
      "dateOfBirthFrom": "1965-05-14T00:00:00",
      "_dateOfBirthTo_comment": "string : date format in [ RRMMDD | RRRRMMDD | RRRR-MM-DD | YYYY-MM-DD\"T\"HH24:MI:SS ]",
      "dateOfBirthTo": "",
      "_nationality_comment": "string :",
      "nationality": "",
      "_passportNumber_comment": "string :",
      "passportNumber": "",
      "_resultMaxRows_comment": "number or null :",
      "resultMaxRows": null,
      "_resultMatchScoreAlgorithm_comment": "string : [ EDIT_DISTANCE | JARO_WINKLER ] on null [ EDIT_DISTANCE ]",
      "resultMatchScoreAlgorithm": "",
      "_resultShowRowNumber_comment": "number or null : [ 0 | 1 ] on null 0",
      "resultShowRowNumber": 0,
      "_resultShowRowCount_comment": "number or null : [ 0 | 1 ] on null 0",
      "resultShowRowCount": 0,
      "_resultShowExtended_comment": "number or null : [ 0 | 1 ] on null 0",
      "resultShowExtended": 0,
      "_queryType4Where_comment": "string : [ LOWER_TRIM | SOUNDEX_TRIM ] on null [ LOWER_TRIM ]",
      "queryType4Where": "",
      "_useIndexHints_comment": "number or null : [ 0 | 1 ] on null 0",
      "useIndexHints": 1
    }
    --
    */
    --
    --
    if (not g_package_initialized)
    then
      init_package();
    end if;
    --
    --
    if (p_req_json is json(strict))
    then
      null;
    elsif (p_req_json is json(lax))
    then
      null;
    else
      raise_application_error(-20000
                             ,'Argument p_Req_JSON[''' || dbms_lob.substr(p_req_json
                                                                         ,100
                                                                         ,1) || '...''] is not a valid JSON!');
    end if;
    --
    --
    select jt.x_surname
          ,jt.x_middle_name
          ,jt.x_given_name
          ,jt.x_sex
          ,nvl(jt.x_date_of_birth
              ,jt.x_date_of_birth_f)
          ,jt.x_date_of_birth_t
          ,jt.x_nationality
          ,jt.x_tdt_doc_number
          ,nvl(jt.x_tdt_date_of_expiry
              ,jt.x_tdt_date_of_expiry_f)
          ,jt.x_tdt_date_of_expiry_t
          ,jt.x_tdt_issuing_country
          ,jt.x_res_max_rows
          ,jt.x_res_mscore_algorithm
          ,jt.x_res_show_row_num
          ,jt.x_res_show_row_cnt
          ,jt.x_res_show_extended
          ,jt.x_query_type4where
          ,jt.x_use_index_hints
      into p_qry_surname
          ,p_qry_middle_name
          ,p_qry_given_name
          ,p_qry_sex
          ,p_qry_date_of_birth_f
          ,p_qry_date_of_birth_t
          ,p_qry_nationality
          ,p_qry_tdt_doc_number
          ,p_qry_tdt_date_of_expiry_f
          ,p_qry_tdt_date_of_expiry_t
          ,p_qry_tdt_issuing_country
          ,p_res_max_rows
          ,p_res_mscore_algorithm
          ,p_res_show_row_num
          ,p_res_show_row_cnt
          ,p_res_show_extended
          ,p_query_type4where
          ,p_use_index_hints
      from json_table(p_req_json format json
                     , '$'
                      --
                      --error on error
                      --null on error
                      --default '$NV$' on error
                      --
                       columns(x_surname varchar2(4000 char) path '$.surname'
                              ,x_middle_name varchar2(4000 char) path '$.middlename'
                              ,x_given_name varchar2(4000 char) path '$.firstname'
                              ,x_sex varchar2(4000 char) path '$.sex'
                              ,x_date_of_birth varchar2(4000 char) path '$.dateOfBirth'
                              ,x_date_of_birth_f varchar2(4000 char) path '$.dateOfBirthFrom'
                              ,x_date_of_birth_t varchar2(4000 char) path '$.dateOfBirthTo'
                              ,x_nationality varchar2(4000 char) path '$.nationality'
                              ,x_tdt_doc_number varchar2(4000 char) path '$.passportNumber'
                              ,x_tdt_date_of_expiry varchar2(4000 char) path '$.passportExpirydate'
                              ,x_tdt_date_of_expiry_f varchar2(4000 char) path '$.passportExpirydateFrom'
                              ,x_tdt_date_of_expiry_t varchar2(4000 char) path '$.passportExpirydateTo'
                              ,x_tdt_issuing_country varchar2(4000 char) path '$.passportIssuingCountry'
                              ,x_res_max_rows integer path '$.resultMaxRows'
                              ,x_res_mscore_algorithm varchar2(4000 char) path '$.resultMatchScoreAlgorithm'
                              ,x_res_show_row_num integer path '$.resultShowRowNumber'
                              ,x_res_show_row_cnt integer path '$.resultShowRowCount'
                              ,x_res_show_extended integer path '$.resultShowExtended'
                              ,x_query_type4where varchar2(4000 char) path '$.queryType4Where'
                              ,x_use_index_hints integer path '$.useIndexHints'
                               --
                               )
                      --
                      ) jt;
    --
  end to_arguments4search;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    18.04.2018  Where4SearchSimple:Copy of CABIS.PKG_BLACKLIST
  * WWirns    19.04.2018  Where4SearchSimple:Any changes depending on new attributes
  * WWirns    24.04.2018  Where4SearchSimple:Any changes depending on new SQL
  *******************************************************************************/
  --
  function where4searchsimple(p_part                       in pls_integer -- [0..1]
                             ,p_ppqry_surname              in varchar2
                             ,p_ppqry_middle_name          in varchar2
                             ,p_ppqry_given_name           in varchar2
                             ,p_ppqry_sex                  in varchar2
                             ,p_ppqry_date_of_birth_f      in date
                             ,p_ppqry_date_of_birth_t      in date
                             ,p_ppqry_nationality          in varchar2
                             ,p_ppqry_tdt_doc_number       in varchar2
                             ,p_ppqry_tdt_date_of_expiry_f in date
                             ,p_ppqry_tdt_date_of_expiry_t in date
                             ,p_ppqry_tdt_issuing_country  in varchar2
                             ,p_query_type4where           in varchar2
                             ,p_use_index_hints            in boolean
                              --
                              ) return clob is
    --
    v_result clob;
    --
    v_query_function varchar2(4000 char);
    --
    v_sqlcode number;
    v_sqlerrm varchar2(32767);
    --
  begin
    --
    -- !!! Dynamic used objects are statically referenced here by variable definitions or by procedure "Check_OBJECT_DEPENDENCE" !!!
    --
    --
    --
    if (not g_package_initialized)
    then
      init_package();
    end if;
    --
    --
    case p_query_type4where
      when 'LOWER_TRIM' then
        v_query_function := 'lower(trim';
      when 'SOUNDEX_TRIM' then
        v_query_function := 'soundex(trim';
      else
        raise_application_error(-20000
                               ,'Unknown p_Query_Type4Where[''' || p_query_type4where || ''']!');
    end case;
    --
    --
    if (p_ppqry_surname is null
       --
       and p_ppqry_middle_name is null
       --
       and p_ppqry_given_name is null
       --
       and p_ppqry_sex is null
       --
       and p_ppqry_date_of_birth_f is null
       --
       --and p_PPQRY_DATE_OF_BIRTH_T is null
       --
       and p_ppqry_nationality is null
       --
       and p_ppqry_tdt_doc_number is null
       --
       and p_ppqry_tdt_date_of_expiry_f is null
       --
       --and p_PPQRY_TDT_DATE_OF_EXPIRY_T is null
       --
       and p_ppqry_tdt_issuing_country is null
       --
       )
    then
      --
      --
      v_result := 'where 1 = 2';
      --
    else
      --
      --
      v_result := 'where 1 = 1';
      --
      --
      if (p_part = 0)
      then
        --
        --
        v_result := v_result || '
                       -- Begin:Where
                    and (';
        --
        --
        v_result := v_result || '
                        --
                        -- Begin:Match by demographic data
                         (';
        --
        --
        if (p_ppqry_surname is not null)
        then
          v_result := v_result || '
                         --
                         -- Begin:Attributes they can be queried alone, block exists allways
                          (1 = 2';
        else
          v_result := v_result || '
                         --
                         -- Begin:Attributes they can be queried alone, block exists allways
                          (1 = 1';
        end if;
        --
        --
        if (p_ppqry_surname is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t0.SURNAME)) = ' || v_query_function || '(''' || p_ppqry_surname || '''))';
          --
          if (p_ppqry_given_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.GIVEN_NAME)) is null or ' || v_query_function || '(t0.GIVEN_NAME)) = ' || v_query_function || '(''' || p_ppqry_given_name || ''')))';
          end if;
          --
          v_result := v_result || '
                          --
                          )';
        end if;
        --
        --
        if (p_ppqry_surname is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t4.SURNAME_THAI)) = ' || v_query_function || '(''' || p_ppqry_surname || '''))';
          --
          if (p_ppqry_middle_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t4.MIDDLENAME_THAI)) is null or ' || v_query_function || '(t4.MIDDLENAME_THAI)) = ' || v_query_function || '(''' || p_ppqry_middle_name || ''')))';
          end if;
          --
          if (p_ppqry_given_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t4.GIVENNAME_THAI)) is null or ' || v_query_function || '(t4.GIVENNAME_THAI)) = ' || v_query_function || '(''' || p_ppqry_given_name || ''')))';
          end if;
          --
          v_result := v_result || '
                          --
                          )';
        end if;
        --
        --
        v_result := v_result || '
                          --
                          )
                         -- End:Attributes they can be queried alone, block exists allways
                         --';
        --
        --
        if (p_ppqry_sex is not null
           --
           or p_ppqry_date_of_birth_f is not null
           --
           or p_ppqry_nationality is not null
           --
           )
        then
          --
          --
          v_result := v_result || '
                         --
                         -- Begin:Attributes they CANNOT be queried alone, block exists only if one of the attributes is queried
                          and (1 = 1';
          --
          --
          if (p_ppqry_sex is not null)
          then
            v_result := v_result || '
                          --
                          and (t0.SEX like decode(''' || p_ppqry_sex || ''',''1'',''M'',''2'',''F'',''0'',''X'',''' || p_ppqry_sex || ''')||''%''';
            --
            v_result := v_result || '
                          --
                          )';
          end if;
          --
          --
          if (p_ppqry_date_of_birth_f is not null)
          then
            if (p_ppqry_date_of_birth_t is not null)
            then
              v_result := v_result || '
                          --
                          and (t0.DATE_OF_BIRTH$VC between ''' || to_char(p_ppqry_date_of_birth_f
                                                                                                  ,'RRMMDD') || ''' and ''' || to_char(p_ppqry_date_of_birth_t
                                                                                                                                      ,'RRMMDD') || '''
                          --
                          or t0.DATE_OF_BIRTH between to_date(''' || to_char(p_ppqry_date_of_birth_f
                                                                                                     ,'RRRRMMDD') || '''
                                                                                           ,''RRRRMMDD'') and to_date(''' || to_char(p_ppqry_date_of_birth_t
                                                                                                                                                             ,'RRRRMMDD') || '''
                                                                                           ,''RRRRMMDD'')
                          --
                          )';
            else
              v_result := v_result || '
                          --
                          and (t0.DATE_OF_BIRTH$VC = ''' || to_char(p_ppqry_date_of_birth_f
                                                                                            ,'RRMMDD') || '''
                          --
                          or t0.DATE_OF_BIRTH = to_date(''' || to_char(p_ppqry_date_of_birth_f
                                                                                               ,'RRRRMMDD') || '''
                                                                                           ,''RRRRMMDD'')
                          --
                          )';
            end if;
          end if;
          --
          --
          if (p_ppqry_nationality is not null)
          then
            v_result := v_result || '
                          --
                          and (t0.NATIONALITY = ''' || p_ppqry_nationality || '''';
            --
            v_result := v_result || '
                          --
                          )';
          end if;
          --
          --
          v_result := v_result || '
                          --
                          )
                         -- End:Attributes they CANNOT be queried alone, block exists only if one of the attributes is queried';
          --
        end if;
        --
        --
        v_result := v_result || '
                         --
                         )
                        -- End:Match by demographic data';
        --
        --
        if (p_ppqry_tdt_doc_number is not null)
        then
          --
          --
          v_result := v_result || '
                        --
                        -- Begin:Match by travel document data, block exists only if DOC_NUMBER is queried
                         or (';
          --
          --
          v_result := v_result || '
                         --
                          ' || v_query_function || '(t0.DOC_NUMBER)) = ' || v_query_function || '(''' || p_ppqry_tdt_doc_number || '''))';
          --
          --
          v_result := v_result || '
                         --
                          and (t0.ISSUING_COUNTRY = ''' || p_ppqry_tdt_issuing_country || '''';
          --
          v_result := v_result || '
                          --
                          )';
          --
          --
          if (p_ppqry_tdt_date_of_expiry_f is not null)
          then
            if (p_ppqry_tdt_date_of_expiry_t is not null)
            then
              v_result := v_result || '
                         --
                          and (t0.DATE_OF_EXPIRY$VC between ''' || to_char(p_ppqry_tdt_date_of_expiry_f
                                                                                                   ,'RRMMDD') || ''' and ''' || to_char(p_ppqry_tdt_date_of_expiry_t
                                                                                                                                       ,'RRMMDD') || '''
                          --
                          or t0.DATE_OF_EXPIRY between to_date(''' || to_char(p_ppqry_tdt_date_of_expiry_f
                                                                                                      ,'RRRRMMDD') || '''
                                                                                           ,''RRRRMMDD'') and to_date(''' || to_char(p_ppqry_tdt_date_of_expiry_t
                                                                                                                                                             ,'RRRRMMDD') || '''
                                                                                           ,''RRRRMMDD'')
                          --
                          )';
            else
              v_result := v_result || '
                         --
                          and (t0.DATE_OF_EXPIRY$VC = ''' || to_char(p_ppqry_tdt_date_of_expiry_f
                                                                                             ,'RRMMDD') || '''
                          --
                          or t0.DATE_OF_EXPIRY = to_date(''' || to_char(p_ppqry_tdt_date_of_expiry_f
                                                                                                ,'RRRRMMDD') || '''
                                                                                           ,''RRRRMMDD'')
                          --
                          )';
            end if;
          end if;
          --
          --
          v_result := v_result || '
                         --
                         )
                        -- End:Match by travel document data, block exists only if DOC_NUMBER is queried';
          --
        end if;
        --
        --
        v_result := v_result || '
                        --
                        )
                 -- End:Where';
        --
      elsif (p_part = 1)
      then
        --
        --
        v_result := v_result || '
                    and not exists (select null
                           from DL_BLACKLIST.TRAVEL_DOCS e10
                          where e10.IDENTITY = t0.KEY_VALUE
                         --
                         )';
        --
        --
        v_result := v_result || '
                       --
                       -- Begin:Where
                    and (';
        --
        --
        if (p_ppqry_surname is not null)
        then
          v_result := v_result || '
                         --
                         -- Begin:Attributes they can be queried alone, block exists allways
                          (1 = 2';
        else
          v_result := v_result || '
                         --
                         -- Begin:Attributes they can be queried alone, block exists allways
                          (1 = 1';
        end if;
        --
        --
        if (p_ppqry_surname is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t0.SURNAME)) = ' || v_query_function || '(''' || p_ppqry_surname || '''))';
          --
          if (p_ppqry_middle_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.MIDDLE_NAME)) is null or ' || v_query_function || '(t0.MIDDLE_NAME)) = ' || v_query_function || '(''' || p_ppqry_middle_name || ''')))';
          end if;
          --
          if (p_ppqry_given_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.GIVEN_NAME)) is null or ' || v_query_function || '(t0.GIVEN_NAME)) = ' || v_query_function || '(''' || p_ppqry_given_name || ''')))';
          end if;
          --
          v_result := v_result || '
                          --
                          )';
        end if;
        --
        --
        if (p_ppqry_surname is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t0.SURNAME_THAI)) = ' || v_query_function || '(''' || p_ppqry_surname || '''))';
          --
          if (p_ppqry_middle_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.MIDDLENAME_THAI)) is null or ' || v_query_function || '(t0.MIDDLENAME_THAI)) = ' || v_query_function || '(''' || p_ppqry_middle_name || ''')))';
          end if;
          --
          if (p_ppqry_given_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.GIVENNAME_THAI)) is null or ' || v_query_function || '(t0.GIVENNAME_THAI)) = ' || v_query_function || '(''' || p_ppqry_given_name || ''')))';
          end if;
          --
          v_result := v_result || '
                          --
                          )';
        end if;
        --
        --
        v_result := v_result || '
                         --
                         )
                        -- End:Attributes they can be queried alone, block exists allways';
        --
        --
        if (p_ppqry_sex is not null
           --
           or p_ppqry_date_of_birth_f is not null
           --
           or p_ppqry_nationality is not null
           --
           )
        then
          --
          --
          v_result := v_result || '
                        --
                        -- Begin:Attributes they CANNOT be queried alone, block exists only if one of the attributes is queried
                         and (1 = 1';
          --
          --
          if (p_ppqry_sex is not null)
          then
            v_result := v_result || '
                         --
                         and (t0.SEX like decode(''' || p_ppqry_sex || ''',''1'',''M'',''2'',''F'',''0'',''X'',''' || p_ppqry_sex || ''')||''%''';
            --
            --
            v_result := v_result || '
                         --
                         )';
          end if;
          --
          --
          if (p_ppqry_date_of_birth_f is not null)
          then
            if (p_ppqry_date_of_birth_t is not null)
            then
              v_result := v_result || '
                         --
                         and (t0.DATE_OF_BIRTH between to_date(''' || to_char(p_ppqry_date_of_birth_f
                                                                                                      ,'RRRRMMDD') || '''
                                                                                          ,''RRRRMMDD'') and to_date(''' || to_char(p_ppqry_date_of_birth_t
                                                                                                                                                            ,'RRRRMMDD') || '''
                                                                                          ,''RRRRMMDD'')
                         --
                         )';
            else
              v_result := v_result || '
                         --
                         and (t0.DATE_OF_BIRTH = to_date(''' || to_char(p_ppqry_date_of_birth_f
                                                                                                ,'RRRRMMDD') || '''
                                                                                          ,''RRRRMMDD'')
                         --
                         )';
            end if;
          end if;
          --
          --
          if (p_ppqry_nationality is not null)
          then
            v_result := v_result || '
                         --
                         and (t0.NATIONALITY = ''' || p_ppqry_nationality || '''';
            --
            v_result := v_result || '
                         --
                         )';
          end if;
          --
          --
          v_result := v_result || '
                         --
                         )
                        -- End:Attributes they CANNOT be queried alone, block exists only if one of the attributes is queried';
          --
        end if;
        --
        --
        v_result := v_result || '
                        --
                        )
                 -- End:Where';
        --
      else
        raise_application_error(-20000
                               ,'Argument p_Part[' || trim(p_part) || '] must be in [0..1]!');
      end if;
      --
    end if;
    --
    --
    return v_result;
    --
  exception
    when others then
      dl_common.pkg_util.formaterrmsg(v_sqlcode
                                     ,v_sqlerrm);
      --
      --
      raise_application_error(v_sqlcode
                             ,v_sqlerrm);
      --
  end where4searchsimple;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    18.04.2018  Where4SearchCandidates:Copy of CABIS.PKG_BLACKLIST
  * WWirns    19.04.2018  Where4SearchCandidates:Any changes depending on new attributes
  * WWirns    25.04.2018  Where4SearchCandidates:Any changes depending on new SQL
  *******************************************************************************/
  --
  function where4searchcandidates(p_part                       in pls_integer -- [0..1]
                                 ,p_ppqry_surname              in varchar2
                                 ,p_ppqry_middle_name          in varchar2
                                 ,p_ppqry_given_name           in varchar2
                                 ,p_ppqry_sex                  in varchar2
                                 ,p_ppqry_date_of_birth_f      in date
                                 ,p_ppqry_date_of_birth_t      in date
                                 ,p_ppqry_nationality          in varchar2
                                 ,p_ppqry_tdt_doc_number       in varchar2
                                 ,p_ppqry_tdt_date_of_expiry_f in date
                                 ,p_ppqry_tdt_date_of_expiry_t in date
                                 ,p_ppqry_tdt_issuing_country  in varchar2
                                 ,p_query_type4where           in varchar2
                                 ,p_use_index_hints            in boolean
                                  --
                                  ) return clob is
    --
    v_result clob;
    --
    v_query_function varchar2(4000 char);
    --
    v_sqlcode number;
    v_sqlerrm varchar2(32767);
    --
  begin
    --
    -- !!! Dynamic used objects are statically referenced here by variable definitions or by procedure "Check_OBJECT_DEPENDENCE" !!!
    --
    --
    --
    if (not g_package_initialized)
    then
      init_package();
    end if;
    --
    --
    case p_query_type4where
      when 'LOWER_TRIM' then
        v_query_function := 'lower(trim';
      when 'SOUNDEX_TRIM' then
        v_query_function := 'soundex(trim';
      else
        raise_application_error(-20000
                               ,'Unknown p_Query_Type4Where[''' || p_query_type4where || ''']!');
    end case;
    --
    --
    if (p_ppqry_surname is null
       --
       and p_ppqry_middle_name is null
       --
       and p_ppqry_given_name is null
       --
       and p_ppqry_sex is null
       --
       and p_ppqry_date_of_birth_f is null
       --
       --and p_PPQRY_DATE_OF_BIRTH_T is null
       --
       and p_ppqry_nationality is null
       --
       and p_ppqry_tdt_doc_number is null
       --
       and p_ppqry_tdt_date_of_expiry_f is null
       --
       --and p_PPQRY_TDT_DATE_OF_EXPIRY_T is null
       --
       and p_ppqry_tdt_issuing_country is null
       --
       )
    then
      --
      --
      v_result := 'where 1 = 2';
      --
    else
      --
      -- On condition link "AND" => where 1 = 1
      -- On condition link "OR" => where 1 = 2
      v_result := 'where 1 = 1';
      --
      --
      if (p_part = 0)
      then
        --
        --
        v_result := v_result || '
                       -- Begin:Where
                    and (
                        --
                        -- Begin:Match by demographic data
                         (
                         --
                         -- Begin:Attributes they can be queried alone, block exists allways
                          (1 = 2';
        --
        --
        if (p_ppqry_surname is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t0.SURNAME)) like ' || v_query_function || '(''' || p_ppqry_surname || ''')) || ''%''';
          --
          if (p_ppqry_given_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.GIVEN_NAME)) is null or ' || v_query_function || '(t0.GIVEN_NAME)) like ' || v_query_function || '(''' || p_ppqry_given_name || ''')) || ''%'')';
          end if;
          --
          v_result := v_result || '
                          --
                          )';
        end if;
        --
        --
        if (p_ppqry_surname is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t4.SURNAME_THAI)) like ' || v_query_function || '(''' || p_ppqry_surname || ''')) || ''%''';
          --
          if (p_ppqry_middle_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t4.MIDDLENAME_THAI)) is null or ' || v_query_function || '(t4.MIDDLENAME_THAI)) like ' || v_query_function || '(''' || p_ppqry_middle_name || ''')) || ''%'')';
          end if;
          --
          if (p_ppqry_given_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t4.GIVENNAME_THAI)) is null or ' || v_query_function || '(t4.GIVENNAME_THAI)) like ' || v_query_function || '(''' || p_ppqry_given_name || ''')) || ''%'')';
          end if;
          --
          v_result := v_result || '
                          --
                          )';
        end if;
        --
        --
        v_result := v_result || '
                          --
                          )
                         -- End:Attributes they can be queried alone, block exists allways
                         --';
        --
        --
        if (p_ppqry_sex is not null
           --
           or p_ppqry_date_of_birth_f is not null
           --
           or p_ppqry_nationality is not null
           --
           )
        then
          --
          --
          v_result := v_result || '
                         --
                         -- Begin:Attributes they CANNOT be queried alone, block exists only if one of the attributes is queried
                          and (1 = 2';
          --
          --
          if (p_ppqry_sex is not null)
          then
            v_result := v_result || '
                          --
                          or (t0.SEX like decode(''' || p_ppqry_sex || ''',''1'',''M'',''2'',''F'',''0'',''X'',''' || p_ppqry_sex || ''')||''%''';
            --
            v_result := v_result || '
                          --
                          )';
          end if;
          --
          --
          if (p_ppqry_date_of_birth_f is not null)
          then
            if (p_ppqry_date_of_birth_t is not null)
            then
              v_result := v_result || '
                         --
                          or (t0.DATE_OF_BIRTH$VC between ''' || to_char(p_ppqry_date_of_birth_f
                                                                                                 ,'RRMMDD') || ''' and ''' || to_char(p_ppqry_date_of_birth_t
                                                                                                                                     ,'RRMMDD') || '''
                          --
                          or t0.DATE_OF_BIRTH between to_date(''' || to_char(p_ppqry_date_of_birth_f
                                                                                                     ,'RRRRMMDD') || '''
                                                                                           ,''RRRRMMDD'') and to_date(''' || to_char(p_ppqry_date_of_birth_t
                                                                                                                                                             ,'RRRRMMDD') || '''
                                                                                           ,''RRRRMMDD'')
                          --
                          )';
            else
              v_result := v_result || '
                          --
                          or (t0.DATE_OF_BIRTH$VC = ''' || to_char(p_ppqry_date_of_birth_f
                                                                                           ,'RRMMDD') || '''
                          --
                          or t0.DATE_OF_BIRTH = to_date(''' || to_char(p_ppqry_date_of_birth_f
                                                                                               ,'RRRRMMDD') || '''
                                                                ,''RRRRMMDD'')
                          --
                          )';
            end if;
          end if;
          --
          --
          if (p_ppqry_nationality is not null)
          then
            v_result := v_result || '
                          --
                          or (t0.NATIONALITY = ''' || p_ppqry_nationality || '''';
            --
            v_result := v_result || '
                          --
                          )';
          end if;
          --
          --
          v_result := v_result || '
                          --
                          )
                         -- End:Attributes they CANNOT be queried alone, block exists only if one of the attributes is queried';
          --
        end if;
        --
        --
        v_result := v_result || '
                         --
                         )
                        -- End:Match by demographic data
                        --';
        --
        --
        if (p_ppqry_tdt_doc_number is not null)
        then
          --
          --
          v_result := v_result || '
                        --
                        -- Begin:Match by travel document data, block exists only if DOC_NUMBER is queried
                         or (
                         --
                          ' || v_query_function || '(t0.DOC_NUMBER)) like ' || v_query_function || '(''' || p_ppqry_tdt_doc_number || ''')) || ''%''';
          --
          --
          v_result := v_result || '
                         --
                          and (t0.ISSUING_COUNTRY = ''' || p_ppqry_tdt_issuing_country || '''';
          --
          v_result := v_result || '
                          --
                          )';
          --
          --
          if (p_ppqry_tdt_date_of_expiry_f is not null)
          then
            if (p_ppqry_tdt_date_of_expiry_t is not null)
            then
              v_result := v_result || '
                         --
                          and (t0.DATE_OF_EXPIRY$VC between ''' || to_char(p_ppqry_tdt_date_of_expiry_f
                                                                                                   ,'RRMMDD') || ''' and ''' || to_char(p_ppqry_tdt_date_of_expiry_t
                                                                                                                                       ,'RRMMDD') || '''
                          --
                          or t0.DATE_OF_EXPIRY between to_date(''' || to_char(p_ppqry_tdt_date_of_expiry_f
                                                                                                      ,'RRRRMMDD') || '''
                                                                                           ,''RRRRMMDD'') and to_date(''' || to_char(p_ppqry_tdt_date_of_expiry_t
                                                                                                                                                             ,'RRRRMMDD') || '''
                                                                                           ,''RRRRMMDD'')
                          --
                          )';
            else
              v_result := v_result || '
                         --
                          and (t0.DATE_OF_EXPIRY$VC = ''' || to_char(p_ppqry_tdt_date_of_expiry_f
                                                                                             ,'RRMMDD') || '''
                          --
                          or t0.DATE_OF_EXPIRY = to_date(''' || to_char(p_ppqry_tdt_date_of_expiry_f
                                                                                                ,'RRRRMMDD') || '''
                                                                ,''RRRRMMDD'')
                          --
                          )';
            end if;
          end if;
          --
          --
          v_result := v_result || '
                         --
                         )
                        -- End:Match by travel document data, block exists only if DOC_NUMBER is queried
                        --';
        end if;
        --
        --
        v_result := v_result || '
                        --
                        )
                 -- End:Where';
        --
      elsif (p_part = 1)
      then
        --
        --
        v_result := v_result || '
                    and not exists (select null
                           from DL_BLACKLIST.TRAVEL_DOCS e10
                          where e10.IDENTITY = t0.KEY_VALUE
                         --
                         )';
        --
        --
        v_result := v_result || '
                       --
                       -- Begin:Where
                    and (';
        --
        --
        v_result := v_result || '
                        --
                        -- Begin:Attributes they can be queried alone, block exists allways
                         (1 = 2';
        --
        --
        if (p_ppqry_surname is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t0.SURNAME)) like ' || v_query_function || '(''' || p_ppqry_surname || ''')) || ''%''';
          --
          if (p_ppqry_middle_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.MIDDLE_NAME)) is null or ' || v_query_function || '(t0.MIDDLE_NAME)) like ' || v_query_function || '(''' || p_ppqry_middle_name || ''')) || ''%'')';
          end if;
          --
          if (p_ppqry_given_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.GIVEN_NAME)) is null or ' || v_query_function || '(t0.GIVEN_NAME)) like ' || v_query_function || '(''' || p_ppqry_given_name || ''')) || ''%'')';
          end if;
          --
          v_result := v_result || '
                          --
                          )';
        end if;
        --
        --
        if (p_ppqry_surname is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t0.SURNAME_THAI)) like ' || v_query_function || '(''' || p_ppqry_surname || ''')) || ''%''';
          --
          if (p_ppqry_middle_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.MIDDLENAME_THAI)) is null or ' || v_query_function || '(t0.MIDDLENAME_THAI)) like ' || v_query_function || '(''' || p_ppqry_middle_name || ''')) || ''%'')';
          end if;
          --
          if (p_ppqry_given_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.GIVENNAME_THAI)) is null or ' || v_query_function || '(t0.GIVENNAME_THAI)) like ' || v_query_function || '(''' || p_ppqry_given_name || ''')) || ''%'')';
          end if;
          --
          v_result := v_result || '
                          --
                          )';
        end if;
        --
        --
        v_result := v_result || '
                         --
                         )
                        -- End:Attributes they can be queried alone, block exists allways
                        --';
        --
        --
        if (p_ppqry_sex is not null
           --
           or p_ppqry_date_of_birth_f is not null
           --
           or p_ppqry_nationality is not null
           --
           )
        then
          --
          --
          v_result := v_result || '
                        --
                        -- Begin:Attributes they CANNOT be queried alone, block exists only if one of the attributes is queried
                         and (1 = 2';
          --
          --
          if (p_ppqry_sex is not null)
          then
            v_result := v_result || '
                         --
                         or (t0.SEX like decode(''' || p_ppqry_sex || ''',''1'',''M'',''2'',''F'',''0'',''X'',''' || p_ppqry_sex || ''')||''%''';
            --
            v_result := v_result || '
                         --
                         )';
          end if;
          --
          --
          if (p_ppqry_date_of_birth_f is not null)
          then
            if (p_ppqry_date_of_birth_t is not null)
            then
              v_result := v_result || '
                         --
                         or (t0.DATE_OF_BIRTH between to_date(''' || to_char(p_ppqry_date_of_birth_f
                                                                                                     ,'RRRRMMDD') || '''
                                                                                           ,''RRRRMMDD'') and to_date(''' || to_char(p_ppqry_date_of_birth_t
                                                                                                                                                             ,'RRRRMMDD') || '''
                                                                                           ,''RRRRMMDD'')
                          --
                          )';
            else
              v_result := v_result || '
                         --
                         or (t0.DATE_OF_BIRTH = to_date(''' || to_char(p_ppqry_date_of_birth_f
                                                                                               ,'RRRRMMDD') || '''
                                                            ,''RRRRMMDD'')
                         --
                         )';
            end if;
          end if;
          --
          --
          if (p_ppqry_nationality is not null)
          then
            v_result := v_result || '
                         --
                         or (t0.NATIONALITY = ''' || p_ppqry_nationality || '''';
            --
            v_result := v_result || '
                         --
                         )';
          end if;
          --
          --
          v_result := v_result || '
                         --
                         )
                        -- End:Attributes they CANNOT be queried alone, block exists only if one of the attributes is queried
                        --';
        end if;
        --
        --
        v_result := v_result || '
                        --
                        )
                 -- End:Where';
        --
      else
        raise_application_error(-20000
                               ,'Argument p_Part[' || trim(p_part) || '] must be in [0..1]!');
      end if;
      --
    end if;
    --
    --
    return v_result;
    --
  exception
    when others then
      dl_common.pkg_util.formaterrmsg(v_sqlcode
                                     ,v_sqlerrm);
      --
      --
      raise_application_error(v_sqlcode
                             ,v_sqlerrm);
      --
  end where4searchcandidates;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    18.04.2018  SQL4Search:Copy of CABIS.PKG_BLACKLIST
  * WWirns    19.04.2018  SQL4Search:Any changes depending on new attributes
  * WWirns    24.04.2018  SQL4Search:Any changes depending on new SQL
  * WWirns    04.05.2018  XX:Remove unneeded feature "Variance-Groups"
  *******************************************************************************/
  --
  function sql4search(p_search_type              in varchar2 -- [SIMPLE|CANDIDATES]
                     ,p_qry_surname              in varchar2
                     ,p_qry_middle_name          in varchar2
                     ,p_qry_given_name           in varchar2
                     ,p_qry_sex                  in varchar2
                     ,p_qry_date_of_birth_f      in varchar2
                     ,p_qry_date_of_birth_t      in varchar2
                     ,p_qry_nationality          in varchar2
                     ,p_qry_tdt_doc_number       in varchar2
                     ,p_qry_tdt_date_of_expiry_f in varchar2
                     ,p_qry_tdt_date_of_expiry_t in varchar2
                     ,p_qry_tdt_issuing_country  in varchar2
                     ,p_res_max_rows             in pls_integer default null
                     ,p_res_mscore_algorithm     in varchar2 default 'EDIT_DISTANCE' -- [EDIT_DISTANCE|JARO_WINKLER] on null 'EDIT_DISTANCE'
                     ,p_res_show_row_num         in pls_integer default 1 -- on null 1
                     ,p_res_show_row_cnt         in pls_integer default 1 -- on null 1
                     ,p_res_show_extended        in pls_integer default 0 -- on null 0
                     ,p_query_type4where         in varchar2 default 'LOWER_TRIM' -- [LOWER_TRIM|SOUNDEX_TRIM] on null 'LOWER_TRIM'
                     ,p_use_index_hints          in pls_integer default 0 -- on null 0
                      --
                      ) return clob is
    --
    v_result clob;
    --
    v_search_type              varchar2(30);
    v_qry_surname              identities.surname%type;
    v_qry_middle_name          identities.middle_name%type;
    v_qry_given_name           identities.given_name%type;
    v_qry_sex                  dl_common.human_sexes.display_value%type;
    v_qry_date_of_birth_f      date;
    v_qry_date_of_birth_t      date;
    v_qry_nationality          dl_common.countries.display_value%type;
    v_qry_tdt_doc_number       travel_docs.doc_number%type;
    v_qry_tdt_date_of_expiry_f date;
    v_qry_tdt_date_of_expiry_t date;
    v_qry_tdt_issuing_country  dl_common.icao_doc_codes.display_value%type; --TRAVEL_DOCS.ISSUING_COUNTRY%type;
    v_res_mscore_algorithm     varchar2(30);
    v_res_show_row_num         boolean;
    v_res_show_row_cnt         boolean;
    v_res_show_extended        boolean;
    v_query_type4where         varchar2(30);
    v_use_index_hints          boolean;
    --v_query_function           varchar2(4000 char);
    v_vc_tmp  varchar2(32767 char);
    v_sqlcode number;
    v_sqlerrm varchar2(32767);
    --
  begin
    --
    -- !!! Dynamic used objects are statically referenced here by variable definitions or by procedure "Check_OBJECT_DEPENDENCE" !!!
    --
    --
    --
    if (not g_package_initialized)
    then
      init_package();
    end if;
    --
    --
    if (upper(p_search_type) not in ('SIMPLE'
                                    ,'CANDIDATES'))
    then
      raise_application_error(-20000
                             ,'The argument p_Search_Type must be in list [SIMPLE|CANDIDATES]!');
    end if;
    --
    v_search_type := upper(p_search_type);
    --
    --
    if (nvl(upper(p_res_mscore_algorithm)
           ,'EDIT_DISTANCE') not in ('EDIT_DISTANCE'
                                     ,'JARO_WINKLER'))
    then
      raise_application_error(-20000
                             ,'The text argument RES_SCORE_ALGORITHM must be in list [EDIT_DISTANCE|JARO_WINKLER]!');
    end if;
    --
    v_res_mscore_algorithm := nvl(upper(p_res_mscore_algorithm)
                                 ,'EDIT_DISTANCE');
    --
    --
    if (nvl(p_res_show_row_num
           ,1) not in (0
                       ,1))
    then
      raise_application_error(-20000
                             ,'The number argument RES_SHOW_ROW_NUM must be in list [0|1]!');
    end if;
    --
    v_res_show_row_num := sys.diutil.int_to_bool(nvl(p_res_show_row_num
                                                    ,1));
    --
    --
    if (nvl(p_res_show_row_cnt
           ,1) not in (0
                       ,1))
    then
      raise_application_error(-20000
                             ,'The number argument RES_SHOW_ROW_CNT must be in list [0|1]!');
    end if;
    --
    v_res_show_row_cnt := sys.diutil.int_to_bool(nvl(p_res_show_row_cnt
                                                    ,1));
    --
    --
    if (nvl(p_res_show_extended
           ,0) not in (0
                       ,1))
    then
      raise_application_error(-20000
                             ,'The number argument RES_SHOW_EXTENDED must be in list [0|1]!');
    end if;
    --
    v_res_show_extended := sys.diutil.int_to_bool(nvl(p_res_show_extended
                                                     ,0));
    --
    --
    if (nvl(upper(p_query_type4where)
           ,'LOWER_TRIM') not in ('LOWER_TRIM'
                                  ,'SOUNDEX_TRIM'))
    then
      raise_application_error(-20000
                             ,'The argument p_Query_Type4Where must be in list [LOWER_TRIM|SOUNDEX_TRIM]!');
    end if;
    --
    v_query_type4where := nvl(upper(p_query_type4where)
                             ,'LOWER_TRIM');
    --
    --
    case v_query_type4where
      when 'LOWER_TRIM' then
        --v_query_function := 'lower(trim';
        null;
      when 'SOUNDEX_TRIM' then
        --v_query_function := 'soundex(trim';
        null;
      else
        raise_application_error(-20000
                               ,'Unknown v_Query_Type4Where[''' || v_query_type4where || ''']!');
    end case;
    --
    --
    v_use_index_hints := sys.diutil.int_to_bool(nvl(p_use_index_hints
                                                   ,0));
    --
    --
    v_qry_surname             := prepare_qry_value(p_qry_surname);
    v_qry_middle_name         := prepare_qry_value(p_qry_middle_name);
    v_qry_given_name          := prepare_qry_value(p_qry_given_name);
    v_qry_sex                 := prepare_qry_value(p_qry_sex);
    v_qry_nationality         := prepare_qry_value(p_qry_nationality);
    v_qry_tdt_doc_number      := prepare_qry_value(p_qry_tdt_doc_number);
    v_qry_tdt_issuing_country := prepare_qry_value(p_qry_tdt_issuing_country);
    --
    --
    check_qry_values4search(v_qry_surname
                           ,v_qry_middle_name
                           ,v_qry_given_name
                           ,v_qry_sex
                           ,p_qry_date_of_birth_f
                           ,p_qry_date_of_birth_t
                           ,v_qry_nationality
                           ,v_qry_tdt_doc_number
                           ,p_qry_tdt_date_of_expiry_f
                           ,p_qry_tdt_date_of_expiry_t
                           ,v_qry_tdt_issuing_country
                           ,v_vc_tmp
                           ,v_qry_date_of_birth_f
                           ,v_qry_date_of_birth_t
                           ,v_qry_tdt_date_of_expiry_f
                           ,v_qry_tdt_date_of_expiry_t
                            --
                            );
    --
    if (v_vc_tmp is not null)
    then
      raise_application_error(-20000
                             ,v_vc_tmp);
    end if;
    --
    --
    v_result := 'select';
    --
    if (v_use_index_hints)
    then
      if (p_res_max_rows is not null)
      then
        v_result := v_result || ' /*+ first_rows(' || trim(p_res_max_rows) || ') */';
      end if;
    end if;
    --
    if (v_res_show_extended)
    then
      v_result := v_result || ' DL_BLACKLIST.OT_BLT_SEARCH_RESULT_EXT(t20.ID';
    else
      v_result := v_result || ' DL_BLACKLIST.OT_BLT_SEARCH_RESULT(t20.ID';
    end if;
    --
    --
    v_result := v_result || '
                                            ,t20.SURNAME
                                            ,t20.SURNAME_THAI
                                            ,t20.MIDDLE_NAME
                                            ,t20.MIDDLE_NAME_THAI
                                            ,t20.GIVEN_NAME
                                            ,t20.GIVEN_NAME_THAI
                                            ,t20.SEX
                                            ,t20.SEX$DV
                                            ,t20.DATE_OF_BIRTH
                                            ,t20.NATIONALITY
                                            ,t20.NATIONALITY$DV
                                            ,t20.TDT_DOC_NUMBER
                                            ,t20.TDT_ISSUING_COUNTRY
                                            ,t20.TDT_ISSUING_COUNTRY$DV
                                            ,t20.TDT_DATE_OF_EXPIRY
                                            ,DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()';
    --
    --
    if (v_res_show_row_num)
    then
      v_result := v_result || '
                                            ,rownum';
    else
      v_result := v_result || '
                                            ,null';
    end if;
    --
    --
    if (v_res_show_row_cnt)
    then
      v_result := v_result || '
                                            ,count(*) over()';
    else
      v_result := v_result || '
                                            ,null';
    end if;
    --
    --
    if (v_res_show_extended)
    then
      --
      -- MSCORE: Match score
      v_result := v_result || '
                                            ,''' || v_qry_surname || '''
                                            ,t20.SURNAME$MSCORE
                                            ,t20.SURNAME_THAI$MSCORE
                                            ,''' || v_qry_middle_name || '''
                                            ,t20.MIDDLE_NAME$MSCORE
                                            ,t20.MIDDLE_NAME_THAI$MSCORE
                                            ,''' || v_qry_given_name || '''
                                            ,t20.GIVEN_NAME$MSCORE
                                            ,t20.GIVEN_NAME_THAI$MSCORE
                                            ,''' || v_qry_sex || '''
                                            ,t20.SEX$MSCORE
                                            ,t20.SEX$DV$MSCORE
                                            ,to_date(''' || to_char(v_qry_date_of_birth_f
                                                                                    ,'RRRRMMDD') || '''
                                                    ,''RRRRMMDD'')
                                            ,to_date(''' || to_char(v_qry_date_of_birth_t
                                                                                    ,'RRRRMMDD') || '''
                                                    ,''RRRRMMDD'')
                                            ,t20.DATE_OF_BIRTH$MSCORE
                                            ,''' || v_qry_nationality || '''
                                            ,t20.NATIONALITY$MSCORE
                                            ,t20.NATIONALITY$DV$MSCORE
                                            ,''' || v_qry_tdt_doc_number || '''
                                            ,t20.TDT_DOC_NUMBER$MSCORE
                                            ,''' || v_qry_tdt_issuing_country || '''
                                            ,t20.TDT_ISSUING_COUNTRY$MSCORE
                                            ,t20.TDT_ISSUING_COUNTRY$DV$MSCORE
                                            ,to_date(''' || to_char(v_qry_tdt_date_of_expiry_f
                                                                                    ,'RRRRMMDD') || '''
                                                    ,''RRRRMMDD'')
                                            ,to_date(''' || to_char(v_qry_tdt_date_of_expiry_t
                                                                                    ,'RRRRMMDD') || '''
                                                    ,''RRRRMMDD'')
                                            ,t20.TDT_DATE_OF_EXPIRY$MSCORE';
    end if;
    --
    --
    v_result := v_result || '
                                             --
                                             ) as BLT_SEARCH_RESULT';
    --
    --
    v_result := v_result || '
  from (
        --';
    --
    --
    v_result := v_result || '
        select t10.ID
               ,t10.SURNAME
               ,t10.SURNAME_THAI
               ,t10.MIDDLE_NAME
               ,t10.MIDDLE_NAME_THAI
               ,t10.GIVEN_NAME
               ,t10.GIVEN_NAME_THAI
               ,t10.SEX
               ,t10.SEX$DV
               ,t10.DATE_OF_BIRTH
               ,t10.NATIONALITY
               ,t10.NATIONALITY$DV
               ,t10.TDT_DOC_NUMBER
               ,t10.TDT_ISSUING_COUNTRY
               ,t10.TDT_ISSUING_COUNTRY$DV
               ,t10.TDT_DATE_OF_EXPIRY';
    --
    --
    -- MSCORE: Match score
    if (v_qry_surname is not null)
    then
      v_result := v_result || '
               ,t10.SURNAME$MSCORE
               ,t10.SURNAME_THAI$MSCORE';
    else
      v_result := v_result || '
               ,t10.SURNAME$MSCORE
               ,t10.SURNAME_THAI$MSCORE';
    end if;
    --
    --
    if (v_qry_middle_name is not null)
    then
      v_result := v_result || '
               ,t10.MIDDLE_NAME$MSCORE
               ,t10.MIDDLE_NAME_THAI$MSCORE';
    else
      v_result := v_result || '
               ,t10.MIDDLE_NAME$MSCORE
               ,t10.MIDDLE_NAME_THAI$MSCORE';
    end if;
    --
    --
    if (v_qry_given_name is not null)
    then
      v_result := v_result || '
               ,t10.GIVEN_NAME$MSCORE
               ,t10.GIVEN_NAME_THAI$MSCORE';
    else
      v_result := v_result || '
               ,t10.GIVEN_NAME$MSCORE
               ,t10.GIVEN_NAME_THAI$MSCORE';
    end if;
    --
    --
    if (v_qry_sex is not null)
    then
      v_result := v_result || '
               ,t10.SEX$MSCORE
               ,t10.SEX$DV$MSCORE';
    else
      v_result := v_result || '
               ,t10.SEX$MSCORE
               ,t10.SEX$DV$MSCORE';
    end if;
    --
    --
    if (v_qry_date_of_birth_f is not null)
    then
      v_result := v_result || '
               ,t10.DATE_OF_BIRTH$MSCORE';
    else
      v_result := v_result || '
               ,t10.DATE_OF_BIRTH$MSCORE';
    end if;
    --
    --
    if (v_qry_nationality is not null)
    then
      v_result := v_result || '
               ,t10.NATIONALITY$MSCORE
               ,t10.NATIONALITY$DV$MSCORE';
    else
      v_result := v_result || '
               ,t10.NATIONALITY$MSCORE
               ,t10.NATIONALITY$DV$MSCORE';
    end if;
    --
    --
    if (v_qry_tdt_doc_number is not null)
    then
      v_result := v_result || '
               ,t10.TDT_DOC_NUMBER$MSCORE';
    else
      v_result := v_result || '
               ,t10.TDT_DOC_NUMBER$MSCORE';
    end if;
    --
    --
    if (v_qry_tdt_issuing_country is not null)
    then
      v_result := v_result || '
               ,t10.TDT_ISSUING_COUNTRY$MSCORE
               ,t10.TDT_ISSUING_COUNTRY$DV$MSCORE';
    else
      v_result := v_result || '
               ,t10.TDT_ISSUING_COUNTRY$MSCORE
               ,t10.TDT_ISSUING_COUNTRY$DV$MSCORE';
    end if;
    --
    --
    if (v_qry_tdt_date_of_expiry_f is not null)
    then
      v_result := v_result || '
               ,t10.TDT_DATE_OF_EXPIRY$MSCORE';
    else
      v_result := v_result || '
               ,t10.TDT_DATE_OF_EXPIRY$MSCORE';
    end if;
    --
    --
    v_result := v_result || '
          from (
                 --';
    --
    --
    if (v_use_index_hints)
    then
      case v_query_type4where
        when 'LOWER_TRIM' then
          v_result := v_result || '
                 select /*+ leading(t0 t4) index(t0 ' || g_lt_idx4travel_docs || ') */ t4.KEY_VALUE as ID';
        when 'SOUNDEX_TRIM' then
          v_result := v_result || '
                 select /*+ leading(t0 t4) index(t0 ' || g_st_idx4travel_docs || ') */ t4.KEY_VALUE as ID';
        else
          raise_application_error(-20000
                                 ,'Unknown v_Query_Type4Where[''' || v_query_type4where || ''']!');
      end case;
    else
      v_result := v_result || '
                 select t4.KEY_VALUE as ID';
    end if;
    --
    --
    /*
    --,nvl(t3.DISPLAY_VALUE,t3.DISPLAY_VALUE$DLC) as SEX$DV
    --,nvl(t2.DISPLAY_VALUE,t2.DISPLAY_VALUE$DLC) as NATIONALITY$DV
    --,nvl(t1.DISPLAY_VALUE,t1.DISPLAY_VALUE$DLC) as TDT_ISSUING_COUNTRY$DV
    */
    --
    v_result := v_result || '
                        ,t0.SURNAME
                        ,t4.SURNAME_THAI
                        ,null as MIDDLE_NAME
                        ,t4.MIDDLENAME_THAI as MIDDLE_NAME_THAI
                        ,t0.GIVEN_NAME
                        ,t4.GIVENNAME_THAI as GIVEN_NAME_THAI
                        ,t0.SEX
                        ,null as SEX$DV
                        ,t0.DATE_OF_BIRTH
                        ,t0.NATIONALITY
                        ,null as NATIONALITY$DV
                        ,t0.DOC_NUMBER as TDT_DOC_NUMBER
                        ,t0.ISSUING_COUNTRY as TDT_ISSUING_COUNTRY
                        ,null as TDT_ISSUING_COUNTRY$DV
                        ,t0.DATE_OF_EXPIRY$VC as TDT_DATE_OF_EXPIRY';
    --
    --
    -- MSCORE: Match score
    if (v_qry_surname is not null)
    then
      v_result := v_result || '
                        ,case
                           when (lower(trim(''' || v_qry_surname || ''')) is null) then
                            0
                           else
                            UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.SURNAME))
                                                              ,lower(trim(''' || v_qry_surname || ''')))
                         end as SURNAME$MSCORE
                        ,case
                           when (lower(trim(''' || v_qry_surname || ''')) is null) then
                            0
                           else
                            UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t4.SURNAME_THAI))
                                                              ,lower(trim(''' || v_qry_surname || ''')))
                         end as SURNAME_THAI$MSCORE';
    else
      v_result := v_result || '
                        ,0 as SURNAME$MSCORE
                        ,0 as SURNAME_THAI$MSCORE';
    end if;
    --
    --
    if (v_qry_middle_name is not null)
    then
      v_result := v_result || '
                        ,0 as MIDDLE_NAME$MSCORE
                        ,case
                           when (lower(trim(''' || v_qry_middle_name || ''')) is null) then
                            0
                           else
                            UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t4.MIDDLENAME_THAI))
                                                              ,lower(trim(''' || v_qry_middle_name || ''')))
                         end as MIDDLE_NAME_THAI$MSCORE';
    else
      v_result := v_result || '
                        ,0 as MIDDLE_NAME$MSCORE
                        ,0 as MIDDLE_NAME_THAI$MSCORE';
    end if;
    --
    --
    if (v_qry_given_name is not null)
    then
      v_result := v_result || '
                        ,case
                           when (lower(trim(''' || v_qry_given_name || ''')) is null) then
                            0
                           else
                            UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.GIVEN_NAME))
                                                              ,lower(trim(''' || v_qry_given_name || ''')))
                         end as GIVEN_NAME$MSCORE
                        ,case
                           when (lower(trim(''' || v_qry_given_name || ''')) is null) then
                            0
                           else
                            UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t4.GIVENNAME_THAI))
                                                              ,lower(trim(''' || v_qry_given_name || ''')))
                         end as GIVEN_NAME_THAI$MSCORE';
    else
      v_result := v_result || '
                        ,0 as GIVEN_NAME$MSCORE
                        ,0 as GIVEN_NAME_THAI$MSCORE';
    end if;
    --
    --
    if (v_qry_sex is not null)
    then
      v_result := v_result || '
                        ,case
                           when (lower(trim(''' || v_qry_sex || ''')) is null) then
                            0
                           else
                            UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(t0.SEX
                                                              ,decode(''' || v_qry_sex || ''',''1'',''M'',''2'',''F'',''0'',''X'',''' || v_qry_sex || '''))
                         end as SEX$MSCORE
                        ,nvl(null
                            ,0) as SEX$DV$MSCORE';
    else
      v_result := v_result || '
                        ,0 as SEX$MSCORE
                        ,0 as SEX$DV$MSCORE';
    end if;
    --
    --
    if (v_qry_date_of_birth_f is not null)
    then
      if (v_qry_date_of_birth_t is not null)
      then
        v_result := v_result || '
                        ,case
                           when (t0.DATE_OF_BIRTH$VC between ''' || to_char(v_qry_date_of_birth_f
                                                                                              ,'RRMMDD') || ''' and ''' || to_char(v_qry_date_of_birth_t
                                                                                                                                  ,'RRRRMMDD') || '''
                                 --
                                 or t0.DATE_OF_BIRTH between to_date(''' || to_char(v_qry_date_of_birth_f
                                                                                                      ,'RRRRMMDD') || ''',''RRRRMMDD'')'
                   --
                    || ' and to_date(''' || to_char(v_qry_date_of_birth_t
                                                   ,'RRRRMMDD') || ''',''RRRRMMDD'')) then
                            100
                           else
                            0
                         end as DATE_OF_BIRTH$MSCORE';
      else
        v_result := v_result || '
                        ,case
                           when (t0.DATE_OF_BIRTH$VC = ''' || to_char(v_qry_date_of_birth_f
                                                                                        ,'RRMMDD') || '''
                                                             or t0.DATE_OF_BIRTH = to_date(''' || to_char(v_qry_date_of_birth_f
                                                                                                                            ,'RRRRMMDD') || '''
                                                                                               ,''RRRRMMDD'')) then
                            100
                           else
                            0
                         end as DATE_OF_BIRTH$MSCORE';
      end if;
    else
      v_result := v_result || '
                        ,0 as DATE_OF_BIRTH$MSCORE';
    end if;
    --
    --
    if (v_qry_nationality is not null)
    then
      v_result := v_result || '
                        ,case
                           when (lower(trim(''' || v_qry_nationality || ''')) is null) then
                            0
                           else
                            decode(t0.ISSUING_COUNTRY,''' || v_qry_nationality || ''',100,0)
                         end as NATIONALITY$MSCORE
                        ,nvl(null
                            ,0) as NATIONALITY$DV$MSCORE';
    else
      v_result := v_result || '
                        ,0 as NATIONALITY$MSCORE
                        ,0 as NATIONALITY$DV$MSCORE';
    end if;
    --
    --
    if (v_qry_tdt_doc_number is not null)
    then
      v_result := v_result || '
                        ,case
                           when (lower(trim(''' || v_qry_tdt_doc_number || ''')) is null) then
                            0
                           else
                            UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.DOC_NUMBER))
                                                              ,lower(trim(''' || v_qry_tdt_doc_number || ''')))
                         end as TDT_DOC_NUMBER$MSCORE';
    else
      v_result := v_result || '
                        ,0 as TDT_DOC_NUMBER$MSCORE';
    end if;
    --
    --
    if (v_qry_tdt_issuing_country is not null)
    then
      v_result := v_result || '
                        ,case
                           when (lower(trim(''' || v_qry_tdt_issuing_country || ''')) is null) then
                            0
                           else
                            decode(t0.ISSUING_COUNTRY,''' || v_qry_tdt_issuing_country || ''',100,0)
                         end as TDT_ISSUING_COUNTRY$MSCORE
                        ,nvl(null
                            ,0) as TDT_ISSUING_COUNTRY$DV$MSCORE';
    else
      v_result := v_result || '
                        ,0 as TDT_ISSUING_COUNTRY$MSCORE
                        ,0 as TDT_ISSUING_COUNTRY$DV$MSCORE';
    end if;
    --
    --
    if (v_qry_tdt_date_of_expiry_f is not null)
    then
      if (v_qry_tdt_date_of_expiry_t is not null)
      then
        v_result := v_result || '
                        ,case
                           when (t0.DATE_OF_EXPIRY$VC between ''' || to_char(v_qry_tdt_date_of_expiry_f
                                                                                               ,'RRRRMMDD') || ''' and ''' || to_char(v_qry_tdt_date_of_expiry_t
                                                                                                                                     ,'RRRRMMDD') || '''
                                 --
                                 or t0.DATE_OF_EXPIRY between to_date(''' || to_char(v_qry_tdt_date_of_expiry_f
                                                                                                       ,'RRRRMMDD') || ''',''RRRRMMDD'')'
                   --
                    || ' and to_date(''' || to_char(v_qry_tdt_date_of_expiry_t
                                                   ,'RRRRMMDD') || ''',''RRRRMMDD'')) then
                            100
                           else
                            0
                         end as TDT_DATE_OF_EXPIRY$MSCORE';
      else
        v_result := v_result || '
                        ,case
                           when (t0.DATE_OF_EXPIRY$VC = ''' || to_char(v_qry_tdt_date_of_expiry_f
                                                                                         ,'RRMMDD') || '''
                                                             or t0.DATE_OF_EXPIRY = to_date(''' || to_char(v_qry_tdt_date_of_expiry_f
                                                                                                                             ,'RRRRMMDD') || '''
                                                                                               ,''RRRRMMDD'')) then
                            100
                           else
                            0
                         end as TDT_DATE_OF_EXPIRY$MSCORE';
      end if;
    else
      v_result := v_result || '
                        ,0 as TDT_DATE_OF_EXPIRY$MSCORE';
    end if;
    --
    --
    /*
    --left join DL_COMMON.ICAO_DOC_CODES$LC t1                     on (t0.ISSUING_COUNTRY = t1.KEY_VALUE)
    --left join DL_COMMON.ICAO_DOC_CODES$LC t2                     on (t0.NATIONALITY = t2.KEY_VALUE)
    --left join DL_COMMON.HUMAN_SEXES$LC t3                     on (t0.SEX = t3.ICAO)
    */
    --
    v_result := v_result || '
                   from DL_BLACKLIST.TRAVEL_DOCS t0
                  inner join DL_BLACKLIST.IDENTITIES t4
                     on (t0.IDENTITY = t4.KEY_VALUE)';
    --
    --
    v_result := v_result || '
                  ';
    --
    case v_search_type
      when 'SIMPLE' then
        v_result := v_result || where4searchsimple(0
                                                  ,v_qry_surname
                                                  ,v_qry_middle_name
                                                  ,v_qry_given_name
                                                  ,v_qry_sex
                                                  ,v_qry_date_of_birth_f
                                                  ,v_qry_date_of_birth_t
                                                  ,v_qry_nationality
                                                  ,v_qry_tdt_doc_number
                                                  ,v_qry_tdt_date_of_expiry_f
                                                  ,v_qry_tdt_date_of_expiry_t
                                                  ,v_qry_tdt_issuing_country
                                                  ,v_query_type4where
                                                  ,v_use_index_hints
                                                   --
                                                   );
      when 'CANDIDATES' then
        v_result := v_result || where4searchcandidates(0
                                                      ,v_qry_surname
                                                      ,v_qry_middle_name
                                                      ,v_qry_given_name
                                                      ,v_qry_sex
                                                      ,v_qry_date_of_birth_f
                                                      ,v_qry_date_of_birth_t
                                                      ,v_qry_nationality
                                                      ,v_qry_tdt_doc_number
                                                      ,v_qry_tdt_date_of_expiry_f
                                                      ,v_qry_tdt_date_of_expiry_t
                                                      ,v_qry_tdt_issuing_country
                                                      ,v_query_type4where
                                                      ,v_use_index_hints
                                                       --
                                                       );
      else
        raise_application_error(-20000
                               ,'Unknown v_Search_Type[''' || v_search_type || ''']!');
    end case;
    --
    --
    --
    v_result := v_result || '
                 union all
                 --
                 -- Identities without any travel document';
    --
    --
    if (v_use_index_hints)
    then
      case v_query_type4where
        when 'LOWER_TRIM' then
          v_result := v_result || '
                 select /*+ index(t0 ' || g_lt_idx4identities || ') */ t0.KEY_VALUE as ID';
        when 'SOUNDEX_TRIM' then
          v_result := v_result || '
                 select /*+ index(t0 ' || g_st_idx4identities || ') */ t0.KEY_VALUE as ID';
        else
          raise_application_error(-20000
                                 ,'Unknown v_Query_Type4Where[''' || v_query_type4where || ''']!');
      end case;
    else
      v_result := v_result || '
                 select t0.KEY_VALUE as ID';
    end if;
    --
    --
    /*
    --,nvl(t3.DISPLAY_VALUE,t3.DISPLAY_VALUE$DLC) as SEX$DV
    --,nvl(t2.DISPLAY_VALUE ,t2.DISPLAY_VALUE$DLC) as NATIONALITY$DV
    */
    --
    v_result := v_result || '
                        ,t0.SURNAME
                        ,t0.SURNAME_THAI as SURNAME_THAI
                        ,null as MIDDLE_NAME
                        ,t0.MIDDLENAME_THAI as MIDDLE_NAME_THAI
                        ,t0.GIVEN_NAME
                        ,t0.GIVENNAME_THAI as GIVEN_NAME_THAI
                        ,t0.SEX
                        ,null as SEX$DV
                        ,t0.DATE_OF_BIRTH
                        ,t0.NATIONALITY
                        ,null as NATIONALITY$DV
                        ,null as TDT_DOC_NUMBER
                        ,null as TDT_ISSUING_COUNTRY
                        ,null as TDT_ISSUING_COUNTRY$DV
                        ,null as TDT_DATE_OF_EXPIRY';
    --
    --
    -- MSCORE: Match score
    --
    --
    if (v_qry_surname is not null)
    then
      v_result := v_result || '
                        ,case
                           when (lower(trim(''' || v_qry_surname || ''')) is null) then
                            0
                           else
                            UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.SURNAME))
                                                              ,lower(trim(''' || v_qry_surname || ''')))
                         end as SURNAME$MSCORE
                        ,case
                           when (lower(trim(''' || v_qry_surname || ''')) is null) then
                            0
                           else
                            UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.SURNAME_THAI))
                                                              ,lower(trim(''' || v_qry_surname || ''')))
                         end as SURNAME_THAI$MSCORE';
    else
      v_result := v_result || '
                        ,0 as SURNAME$MSCORE
                        ,0 as SURNAME_THAI$MSCORE';
    end if;
    --
    --
    if (v_qry_middle_name is not null)
    then
      v_result := v_result || '
                        ,case
                           when (lower(trim(''' || v_qry_middle_name || ''')) is null) then
                            0
                           else
                            UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.MIDDLE_NAME))
                                                              ,lower(trim(''' || v_qry_middle_name || ''')))
                         end as MIDDLE_NAME$MSCORE
                        ,case
                           when (lower(trim(''' || v_qry_middle_name || ''')) is null) then
                            0
                           else
                            UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.MIDDLENAME_THAI))
                                                              ,lower(trim(''' || v_qry_middle_name || ''')))
                         end as MIDDLE_NAME_THAI$MSCORE';
    else
      v_result := v_result || '
                        ,0 as MIDDLE_NAME$MSCORE
                        ,0 as MIDDLE_NAME_THAI$MSCORE';
    end if;
    --
    --
    if (v_qry_given_name is not null)
    then
      v_result := v_result || '
                        ,case
                           when (lower(trim(''' || v_qry_given_name || ''')) is null) then
                            0
                           else
                            UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.GIVEN_NAME))
                                                              ,lower(trim(''' || v_qry_given_name || ''')))
                         end as GIVEN_NAME$MSCORE
                        ,case
                           when (lower(trim(''' || v_qry_given_name || ''')) is null) then
                            0
                           else
                            UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.GIVENNAME_THAI))
                                                              ,lower(trim(''' || v_qry_given_name || ''')))
                         end as GIVEN_NAME_THAI$MSCORE';
    else
      v_result := v_result || '
                        ,0 as GIVEN_NAME$MSCORE
                        ,0 as GIVEN_NAME_THAI$MSCORE';
    end if;
    --
    --
    if (v_qry_sex is not null)
    then
      v_result := v_result || '
                        ,case
                           when (lower(trim(''' || v_qry_sex || ''')) is null) then
                            0
                           else
                            UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(t0.SEX
                                                              ,decode(''' || v_qry_sex || ''',''1'',''M'',''2'',''F'',''0'',''X'',''' || v_qry_sex || '''))
                         end as SEX$MSCORE
                        ,nvl(null
                            ,0) as SEX$DV$MSCORE';
    else
      v_result := v_result || '
                        ,0 as SEX$MSCORE
                        ,0 as SEX$DV$MSCORE';
    end if;
    --
    --
    if (v_qry_date_of_birth_f is not null)
    then
      if (v_qry_date_of_birth_t is not null)
      then
        v_result := v_result || '
                        ,case
                           when (t0.DATE_OF_BIRTH between to_date(''' || to_char(v_qry_date_of_birth_f
                                                                                                   ,'RRRRMMDD') || ''',''RRRRMMDD'')'
                   --
                    || ' and to_date(''' || to_char(v_qry_date_of_birth_t
                                                   ,'RRRRMMDD') || ''',''RRRRMMDD'')) then
                            100
                           else
                            0
                         end as DATE_OF_BIRTH$MSCORE';
      else
        v_result := v_result || '
                        ,case
                           when (t0.DATE_OF_BIRTH = to_date(''' || to_char(v_qry_date_of_birth_f
                                                                                             ,'RRRRMMDD') || '''
                                                            ,''RRRRMMDD'')) then
                            100
                           else
                            0
                         end as DATE_OF_BIRTH$MSCORE';
      end if;
    else
      v_result := v_result || '
                        ,0 as DATE_OF_BIRTH$MSCORE';
    end if;
    --
    --
    if (v_qry_nationality is not null)
    then
      v_result := v_result || '
                        ,case
                           when (lower(trim(''' || v_qry_nationality || ''')) is null) then
                            0
                           else
                            decode(t0.NATIONALITY,''' || v_qry_nationality || ''',100,0)
                         end as NATIONALITY$MSCORE
                        ,nvl(null
                            ,0) as NATIONALITY$DV$MSCORE';
    else
      v_result := v_result || '
                        ,0 as NATIONALITY$MSCORE
                        ,0 as NATIONALITY$DV$MSCORE';
    end if;

    --
    --
    v_result := v_result || '
                        ,0 as TDT_DOC_NUMBER$MSCORE
                        ,0 as TDT_ISSUING_COUNTRY$MSCORE
                        ,0 as TDT_ISSUING_COUNTRY$DV$MSCORE
                        ,0 as TDT_DATE_OF_EXPIRY$MSCORE';
    --
    --
    /*
    --left join DL_COMMON.COUNTRIES$LC t2                     on (t0.NATIONALITY = t2.KEY_VALUE)
    --left join DL_COMMON.HUMAN_SEXES$LC t3                     on (t0.SEX = t3.KEY_VALUE)
    */
    --
    v_result := v_result || '
                   from DL_BLACKLIST.IDENTITIES t0';
    --
    --
    v_result := v_result || '
         ';
    --
    case v_search_type
      when 'SIMPLE' then
        v_result := v_result || where4searchsimple(1
                                                  ,v_qry_surname
                                                  ,v_qry_middle_name
                                                  ,v_qry_given_name
                                                  ,v_qry_sex
                                                  ,v_qry_date_of_birth_f
                                                  ,v_qry_date_of_birth_t
                                                  ,v_qry_nationality
                                                  ,v_qry_tdt_doc_number
                                                  ,v_qry_tdt_date_of_expiry_f
                                                  ,v_qry_tdt_date_of_expiry_t
                                                  ,v_qry_tdt_issuing_country
                                                  ,v_query_type4where
                                                  ,v_use_index_hints
                                                   --
                                                   );
      when 'CANDIDATES' then
        v_result := v_result || where4searchcandidates(1
                                                      ,v_qry_surname
                                                      ,v_qry_middle_name
                                                      ,v_qry_given_name
                                                      ,v_qry_sex
                                                      ,v_qry_date_of_birth_f
                                                      ,v_qry_date_of_birth_t
                                                      ,v_qry_nationality
                                                      ,v_qry_tdt_doc_number
                                                      ,v_qry_tdt_date_of_expiry_f
                                                      ,v_qry_tdt_date_of_expiry_t
                                                      ,v_qry_tdt_issuing_country
                                                      ,v_query_type4where
                                                      ,v_use_index_hints
                                                       --
                                                       );
      else
        raise_application_error(-20000
                               ,'Unknown v_Search_Type[''' || v_search_type || ''']!');
    end case;
    --
    --
    v_result := v_result || '
                 --
                 ) t10';
    --
    -- Order by match score variance attribute priority
    v_vc_tmp := null;
    --
    if (v_qry_surname is not null)
    then
      v_vc_tmp := v_vc_tmp || '
                  ,SURNAME$MSCORE             desc nulls last
                  ,SURNAME_THAI$MSCORE        desc nulls last';
    end if;
    --
    if (v_qry_middle_name is not null)
    then
      v_vc_tmp := v_vc_tmp || '
                  ,MIDDLE_NAME$MSCORE         desc nulls last
                  ,MIDDLE_NAME_THAI$MSCORE    desc nulls last';
    end if;
    --
    if (v_qry_given_name is not null)
    then
      v_vc_tmp := v_vc_tmp || '
                  ,GIVEN_NAME$MSCORE          desc nulls last
                  ,GIVEN_NAME_THAI$MSCORE     desc nulls last';
    end if;
    --
    if (v_qry_sex is not null)
    then
      v_vc_tmp := v_vc_tmp || '
                  ,SEX$MSCORE                 desc nulls last';
    end if;
    --
    if (v_qry_date_of_birth_f is not null)
    then
      v_vc_tmp := v_vc_tmp || '
                  ,DATE_OF_BIRTH$MSCORE       desc nulls last';
    end if;
    --
    if (v_qry_nationality is not null)
    then
      v_vc_tmp := v_vc_tmp || '
                  ,NATIONALITY$MSCORE         desc nulls last';
    end if;
    --
    if (v_qry_tdt_doc_number is not null)
    then
      v_vc_tmp := v_vc_tmp || '
                  ,TDT_DOC_NUMBER$MSCORE      desc nulls last
                  ,TDT_ISSUING_COUNTRY$MSCORE desc nulls last
                  ,TDT_DATE_OF_EXPIRY$MSCORE  desc nulls last';
    end if;
    --
    if (v_vc_tmp is not null)
    then
      v_result := v_result || '
         order by '
                 --
                  || substr(v_vc_tmp
                           ,instr(v_vc_tmp
                                 ,','
                                 ,1
                                 ,1) + 1);
    end if;
    --
    --
    v_result := v_result || '
        --
        ) t20';
    --
    --
    if (p_res_max_rows is not null)
    then
      v_result := v_result || '
 where rownum <= ' || trim(p_res_max_rows);
    end if;
    --
    --
    return v_result;
    --
  exception
    when others then
      dl_common.pkg_util.formaterrmsg(v_sqlcode
                                     ,v_sqlerrm);
      --
      --
      raise_application_error(v_sqlcode
                             ,v_sqlerrm);
      --
  end sql4search;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    18.04.2018  SQL4SearchSimple:Copy of CABIS.PKG_BLACKLIST
  * WWirns    19.04.2018  SQL4SearchSimple:Any changes depending on new attributes
  * WWirns    04.05.2018  XX:Remove unneeded feature "Variance-Groups"
  *******************************************************************************/
  --
  function sql4searchsimple(p_qry_surname              in varchar2
                           ,p_qry_middle_name          in varchar2
                           ,p_qry_given_name           in varchar2
                           ,p_qry_sex                  in varchar2
                           ,p_qry_date_of_birth_f      in varchar2
                           ,p_qry_date_of_birth_t      in varchar2
                           ,p_qry_nationality          in varchar2
                           ,p_qry_tdt_doc_number       in varchar2
                           ,p_qry_tdt_date_of_expiry_f in varchar2
                           ,p_qry_tdt_date_of_expiry_t in varchar2
                           ,p_qry_tdt_issuing_country  in varchar2
                           ,p_res_max_rows             in pls_integer default null
                           ,p_res_mscore_algorithm     in varchar2 default 'EDIT_DISTANCE' -- [EDIT_DISTANCE|JARO_WINKLER] on null 'EDIT_DISTANCE'
                           ,p_res_show_row_num         in pls_integer default 1 -- on null 1
                           ,p_res_show_row_cnt         in pls_integer default 1 -- on null 1
                           ,p_res_show_extended        in pls_integer default 0 -- on null 0
                           ,p_query_type4where         in varchar2 default 'LOWER_TRIM' -- [LOWER_TRIM|SOUNDEX_TRIM] on null 'LOWER_TRIM'
                           ,p_use_index_hints          in pls_integer default 0 -- on null 0
                            --
                            ) return clob is
  begin
    return sql4search('Simple'
                     ,p_qry_surname
                     ,p_qry_middle_name
                     ,p_qry_given_name
                     ,p_qry_sex
                     ,p_qry_date_of_birth_f
                     ,p_qry_date_of_birth_t
                     ,p_qry_nationality
                     ,p_qry_tdt_doc_number
                     ,p_qry_tdt_date_of_expiry_f
                     ,p_qry_tdt_date_of_expiry_t
                     ,p_qry_tdt_issuing_country
                     ,p_res_max_rows
                     ,p_res_mscore_algorithm
                     ,p_res_show_row_num
                     ,p_res_show_row_cnt
                     ,p_res_show_extended
                     ,p_query_type4where
                     ,p_use_index_hints
                      --
                      );
  end sql4searchsimple;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   Dynamic variant
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    18.04.2018  SearchSimple:Copy of CABIS.PKG_BLACKLIST
  * WWirns    19.04.2018  SearchSimple:Any changes depending on new attributes
  * WWirns    25.04.2018  SearchSimple$DYN:Rename and any changes depending on new SQL
  * WWirns    04.05.2018  XX:Remove unneeded feature "Variance-Groups"
  *******************************************************************************/
  --
  function searchsimple$dyn(p_qry_surname              in varchar2
                           ,p_qry_middle_name          in varchar2
                           ,p_qry_given_name           in varchar2
                           ,p_qry_sex                  in varchar2
                           ,p_qry_date_of_birth_f      in varchar2
                           ,p_qry_date_of_birth_t      in varchar2
                           ,p_qry_nationality          in varchar2
                           ,p_qry_tdt_doc_number       in varchar2
                           ,p_qry_tdt_date_of_expiry_f in varchar2
                           ,p_qry_tdt_date_of_expiry_t in varchar2
                           ,p_qry_tdt_issuing_country  in varchar2
                           ,p_res_max_rows             in pls_integer default 1 -- on null 1
                           ,p_res_mscore_algorithm     in varchar2 default 'EDIT_DISTANCE' -- [EDIT_DISTANCE|JARO_WINKLER] on null 'EDIT_DISTANCE'
                           ,p_res_show_row_num         in pls_integer default 1 -- on null 1
                           ,p_res_show_row_cnt         in pls_integer default 1 -- on null 1
                           ,p_res_show_extended        in pls_integer default 0 -- on null 0
                           ,p_query_type4where         in varchar2 default 'LOWER_TRIM' -- [LOWER_TRIM|SOUNDEX_TRIM] on null 'LOWER_TRIM'
                           ,p_use_index_hints          in pls_integer default 0 -- on null 0
                            --
                            ) return ot_blt_search_result is
    --
    v_result ot_blt_search_result;
    --
    v_sql     clob;
    v_sqlcode number;
    v_sqlerrm varchar2(32767);
    --
  begin
    --
    -- !!! Dynamic used objects are statically referenced here by variable definitions or by procedure "Check_OBJECT_DEPENDENCE" !!!
    --
    --
    --
    if (not g_package_initialized)
    then
      init_package();
    end if;
    --
    --
    if (nvl(p_res_max_rows
           ,1) > 1)
    then
      raise_application_error(-20000
                             ,'The number argument p_RES_MAX_ROWS cannot be higher than 1, because this function returns only one row!');
    end if;
    --
    --
    v_sql := sql4searchsimple(p_qry_surname
                             ,p_qry_middle_name
                             ,p_qry_given_name
                             ,p_qry_sex
                             ,p_qry_date_of_birth_f
                             ,p_qry_date_of_birth_t
                             ,p_qry_nationality
                             ,p_qry_tdt_doc_number
                             ,p_qry_tdt_date_of_expiry_f
                             ,p_qry_tdt_date_of_expiry_t
                             ,p_qry_tdt_issuing_country
                             ,1 -- p_RES_MAX_ROWS
                             ,p_res_mscore_algorithm
                             ,p_res_show_row_num
                             ,p_res_show_row_cnt
                             ,p_res_show_extended
                             ,p_query_type4where
                             ,p_use_index_hints
                              --
                              );
    --
    --
    begin
      execute immediate v_sql
        into v_result;
    exception
      when no_data_found then
        v_result := null;
    end;
    --
    --
    return v_result;
    --
  exception
    when others then
      dl_common.pkg_util.formaterrmsg(v_sqlcode
                                     ,v_sqlerrm);
      --
      --
      raise_application_error(v_sqlcode
                             ,v_sqlerrm);
      --
  end searchsimple$dyn;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   Static variant
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    20.04.2018  SearchSimple$STA:Added
  *******************************************************************************/
  --
  function searchsimple$sta(p_qry_surname         in varchar2
                           ,p_qry_middle_name     in varchar2
                           ,p_qry_given_name      in varchar2
                           ,p_qry_sex             in varchar2
                           ,p_qry_date_of_birth_f in varchar2
                            --,p_QRY_DATE_OF_BIRTH_T      in varchar2
                           ,p_qry_nationality          in varchar2
                           ,p_qry_tdt_doc_number       in varchar2
                           ,p_qry_tdt_date_of_expiry_f in varchar2
                            --,p_QRY_TDT_DATE_OF_EXPIRY_T in varchar2
                           ,p_qry_tdt_issuing_country in varchar2
                           ,p_res_max_rows            in pls_integer default 1 -- on null 1
                            --,p_RES_MSCORE_ALGORITHM     in varchar2 default 'EDIT_DISTANCE' -- [EDIT_DISTANCE|JARO_WINKLER] on null 'EDIT_DISTANCE'
                            --,p_RES_SHOW_ROW_NUM         in pls_integer default 1 -- on null 1
                            --,p_RES_SHOW_ROW_CNT         in pls_integer default 1 -- on null 1
                            --,p_RES_SHOW_EXTENDED        in pls_integer default 0 -- on null 0
                            --,p_Query_Type4Where         in varchar2 default 'LOWER_TRIM' -- [LOWER_TRIM|SOUNDEX_TRIM] on null 'LOWER_TRIM'
                            --,p_Use_Index_Hints          in pls_integer default 0 -- on null 0
                            --
                            ) return ot_blt_search_result is
    --
    v_result ot_blt_search_result;
    --
    /* TODO:
    --
    select /*+ first_rows(1) * / DL_BLACKLIST.OT_BLT_SEARCH_RESULT_EXT(t20.ID
                                                ,t20.SURNAME
                                                ,t20.SURNAME_THAI
                                                ,t20.MIDDLE_NAME
                                                ,t20.MIDDLE_NAME_THAI
                                                ,t20.GIVEN_NAME
                                                ,t20.GIVEN_NAME_THAI
                                                ,t20.SEX
                                                ,t20.SEX$DV
                                                ,t20.DATE_OF_BIRTH
                                                ,t20.NATIONALITY
                                                ,t20.NATIONALITY$DV
                                                ,t20.TDT_DOC_NUMBER
                                                ,t20.TDT_ISSUING_COUNTRY
                                                ,t20.TDT_ISSUING_COUNTRY$DV
                                                ,t20.TDT_DATE_OF_EXPIRY
                                                ,DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                                                ,rownum
                                                ,count(*) over()
                                                ,'wirnsberger'
                                                ,t20.SURNAME$MSCORE
                                                ,t20.SURNAME_THAI$MSCORE
                                                ,''
                                                ,t20.MIDDLE_NAME$MSCORE
                                                ,t20.MIDDLE_NAME_THAI$MSCORE
                                                ,'william'
                                                ,t20.GIVEN_NAME$MSCORE
                                                ,t20.GIVEN_NAME_THAI$MSCORE
                                                ,'m�nnlich'
                                                ,t20.SEX$MSCORE
                                                ,t20.SEX$DV$MSCORE
                                                ,to_date('19650514'
                                                        ,'RRRRMMDD')
                                                ,to_date(''
                                                        ,'RRRRMMDD')
                                                ,t20.DATE_OF_BIRTH$MSCORE
                                                ,'austria'
                                                ,t20.NATIONALITY$MSCORE
                                                ,t20.NATIONALITY$DV$MSCORE
                                                ,'p123456'
                                                ,t20.TDT_DOC_NUMBER$MSCORE
                                                ,'AUT'
                                                ,t20.TDT_ISSUING_COUNTRY$MSCORE
                                                ,t20.TDT_ISSUING_COUNTRY$DV$MSCORE
                                                ,to_date('20180721'
                                                        ,'RRRRMMDD')
                                                ,to_date(''
                                                        ,'RRRRMMDD')
                                                ,t20.TDT_DATE_OF_EXPIRY$MSCORE
                                                 --
                                                 ) as BLT_SEARCH_RESULT
      from (
            --
            select t10.ID
                   ,t10.SURNAME
                   ,t10.SURNAME_THAI
                   ,t10.MIDDLE_NAME
                   ,t10.MIDDLE_NAME_THAI
                   ,t10.GIVEN_NAME
                   ,t10.GIVEN_NAME_THAI
                   ,t10.SEX
                   ,t10.SEX$DV
                   ,t10.DATE_OF_BIRTH
                   ,t10.NATIONALITY
                   ,t10.NATIONALITY$DV
                   ,t10.TDT_DOC_NUMBER
                   ,t10.TDT_ISSUING_COUNTRY
                   ,t10.TDT_ISSUING_COUNTRY$DV
                   ,t10.TDT_DATE_OF_EXPIRY
                   ,t10.SURNAME$MSCORE
                   ,t10.SURNAME_THAI$MSCORE
                   ,t10.MIDDLE_NAME$MSCORE
                   ,t10.MIDDLE_NAME_THAI$MSCORE
                   ,t10.GIVEN_NAME$MSCORE
                   ,t10.GIVEN_NAME_THAI$MSCORE
                   ,t10.SEX$MSCORE
                   ,t10.SEX$DV$MSCORE
                   ,t10.DATE_OF_BIRTH$MSCORE
                   ,t10.NATIONALITY$MSCORE
                   ,t10.NATIONALITY$DV$MSCORE
                   ,t10.TDT_DOC_NUMBER$MSCORE
                   ,t10.TDT_ISSUING_COUNTRY$MSCORE
                   ,t10.TDT_ISSUING_COUNTRY$DV$MSCORE
                   ,t10.TDT_DATE_OF_EXPIRY$MSCORE
              from (
                     --
                     select /*+ leading(t0 t5 t4) index(t0 TRAVEL_DOCS$IX90 TRAVEL_DOCS$IX95) index(t5 THAIPASSPORT$IX90) * / t4.KEY_VALUE as ID
                            ,t0.SURNAME
                            ,t5.TFAMILYNM as SURNAME_THAI
                            ,null as MIDDLE_NAME
                            ,t5.TMIDDLENM as MIDDLE_NAME_THAI
                            ,t0.GIVEN_NAME
                            ,t5.TFIRSTNM as GIVEN_NAME_THAI
                            ,t0.SEX
                            --,nvl(t3.DISPLAY_VALUE,t3.DISPLAY_VALUE$DLC) as SEX$DV
                            ,(select nvl(s12.DISPLAY_VALUE, s12.DISPLAY_VALUE$DLC) from DL_COMMON.HUMAN_SEXES$LC s12 where s12.ICAO = t0.SEX) as SEX$DV
                            ,t0.DATE_OF_BIRTH
                            ,t0.NATIONALITY
                            --,nvl(t2.DISPLAY_VALUE,t2.DISPLAY_VALUE$DLC) as NATIONALITY$DV
                            ,(select nvl(s11.DISPLAY_VALUE, s11.DISPLAY_VALUE$DLC) from DL_COMMON.ICAO_DOC_CODES$LC s11 where s11.KEY_VALUE = t0.NATIONALITY) as NATIONALITY$DV
                            ,t0.DOC_NUMBER as TDT_DOC_NUMBER
                            ,t0.ISSUING_COUNTRY as TDT_ISSUING_COUNTRY
                            --,nvl(t1.DISPLAY_VALUE,t1.DISPLAY_VALUE$DLC) as TDT_ISSUING_COUNTRY$DV
                            ,(select nvl(s10.DISPLAY_VALUE, s10.DISPLAY_VALUE$DLC) from DL_COMMON.ICAO_DOC_CODES$LC s10 where s10.KEY_VALUE = t0.ISSUING_COUNTRY) as TDT_ISSUING_COUNTRY$DV
                            ,t0.DATE_OF_EXPIRY$VC as TDT_DATE_OF_EXPIRY
                            ,case
                               when (lower(trim('wirnsberger')) is null) then
                                0
                               else
                                UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.SURNAME))
                                                                  ,lower(trim('wirnsberger')))
                             end as SURNAME$MSCORE
                            ,case
                               when (lower(trim('wirnsberger')) is null) then
                                0
                               else
                                UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t5.TFAMILYNM))
                                                                  ,lower(trim('wirnsberger')))
                             end as SURNAME_THAI$MSCORE
                            ,0 as MIDDLE_NAME$MSCORE
                            ,0 as MIDDLE_NAME_THAI$MSCORE
                            ,case
                               when (lower(trim('william')) is null) then
                                0
                               else
                                UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.GIVEN_NAME))
                                                                  ,lower(trim('william')))
                             end as GIVEN_NAME$MSCORE
                            ,case
                               when (lower(trim('william')) is null) then
                                0
                               else
                                UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t5.TFIRSTNM))
                                                                  ,lower(trim('william')))
                             end as GIVEN_NAME_THAI$MSCORE
                            ,case
                               when (lower(trim('m�nnlich')) is null) then
                                0
                               else
                                UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.SEX))
                                                                  ,lower(trim('m�nnlich')))
                             end as SEX$MSCORE
                            ,nvl((
                                 select /*+ index(s2 HUMAN_SEXES$IX90 HUMAN_SEXES$I18N$IX90) * / max(case
                                               when (lower(trim('m�nnlich')) is null) then
                                                0
                                               else
                                                UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(s2.DISPLAY_VALUE))
                                                                                  ,lower(trim('m�nnlich')))
                                             end)
                                   from DL_COMMON.HUMAN_SEXES#I18N s2
                                  where s2.ICAO = t0.SEX
                                    and lower(trim(s2.DISPLAY_VALUE)) = lower(trim('m�nnlich'))
                                 --
                                 )
                                ,0) as SEX$DV$MSCORE
                            ,case
                               when (t0.DATE_OF_BIRTH$VC = '650514'
                                                                 or t0.DATE_OF_BIRTH = to_date('19650514'
                                                                                                   ,'RRRRMMDD')) then
                                100
                               else
                                0
                             end as DATE_OF_BIRTH$MSCORE
                            ,case
                               when (lower(trim('austria')) is null) then
                                0
                               else
                                UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.NATIONALITY))
                                                                  ,lower(trim('austria')))
                             end as NATIONALITY$MSCORE
                            ,nvl((
                                 select /*+ index(s1 ICAO_DOC_CODES$IX90 ICAO_DOC_CODES$I18N$IX90) * / max(case
                                               when (lower(trim('austria')) is null) then
                                                0
                                               else
                                                UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(s1.DISPLAY_VALUE))
                                                                                  ,lower(trim('austria')))
                                             end)
                                   from DL_COMMON.ICAO_DOC_CODES#I18N s1
                                  where s1.KEY_VALUE = t0.NATIONALITY
                                    and lower(trim(s1.DISPLAY_VALUE)) = lower(trim('austria'))
                                 --
                                 )
                                ,0) as NATIONALITY$DV$MSCORE
                            ,case
                               when (lower(trim('p123456')) is null) then
                                0
                               else
                                UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.DOC_NUMBER))
                                                                  ,lower(trim('p123456')))
                             end as TDT_DOC_NUMBER$MSCORE
                            ,case
                               when (lower(trim('AUT')) is null) then
                                0
                               else
                                UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.ISSUING_COUNTRY))
                                                                  ,lower(trim('AUT')))
                             end as TDT_ISSUING_COUNTRY$MSCORE
                            ,nvl((
                                 select /*+ index(s0 ICAO_DOC_CODES$IX90 ICAO_DOC_CODES$I18N$IX90) * / max(case
                                               when (lower(trim('AUT')) is null) then
                                                0
                                               else
                                                UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(s0.DISPLAY_VALUE))
                                                                                  ,lower(trim('AUT')))
                                             end)
                                   from DL_COMMON.ICAO_DOC_CODES#I18N s0
                                  where s0.KEY_VALUE = t0.ISSUING_COUNTRY
                                    and lower(trim(s0.DISPLAY_VALUE)) = lower(trim('AUT'))
                                 --
                                 )
                                ,0) as TDT_ISSUING_COUNTRY$DV$MSCORE
                            ,case
                               when (t0.DATE_OF_EXPIRY$VC = '180721'
                                                                 or t0.DATE_OF_EXPIRY = to_date('20180721'
                                                                                                   ,'RRRRMMDD')) then
                                100
                               else
                                0
                             end as TDT_DATE_OF_EXPIRY$MSCORE
                       from DL_BLACKLIST.TRAVEL_DOCS t0
                      inner join DL_BLACKLIST.IDENTITIES t4
                         on (t0.IDENTITY = t4.KEY_VALUE)
                       left join DL_BORDERCONTROL.THAIPASSPORT t5
                         on (t0.EXTENDED_DATA_SOURCE = 'DL_BORDERCONTROL.THAIPASSPORT' and t0.EXTENDED_DATA_PK_0 = t5.KEY_VALUE)
                       --left join DL_COMMON.ICAO_DOC_CODES$LC t1                     on (t0.ISSUING_COUNTRY = t1.KEY_VALUE)
                       --left join DL_COMMON.ICAO_DOC_CODES$LC t2                     on (t0.NATIONALITY = t2.KEY_VALUE)
                       --left join DL_COMMON.HUMAN_SEXES$LC t3                     on (t0.SEX = t3.ICAO)
                      where 1 = 1
                           -- Begin:Where
                        and (
                            --
                            -- Begin:Match by demographic data
                             (
                             --
                             -- Begin:Attributes they can be queried alone, block exists allways
                              (1 = 1
                              --
                              and (lower(trim(t0.SURNAME)) = lower(trim('wirnsberger'))
                              --
                              or lower(trim(t5.TFAMILYNM)) = lower(trim('wirnsberger'))
                              --
                              )
                              --
                              and (lower(trim(t0.GIVEN_NAME)) = lower(trim('william'))
                              --
                              or lower(trim(t5.TFIRSTNM)) = lower(trim('william'))
                              --
                              )
                              --
                              )
                             -- End:Attributes they can be queried alone, block exists allways
                             --
                             --
                             -- Begin:Attributes they CANNOT be queried alone, block exists only if one of the attributes is queried
                              and (1 = 1
                              --
                              and (t0.SEX = 'm�nnlich'
                              --
                              or exists (select /*+ index(e0 HUMAN_SEXES$IX90 HUMAN_SEXES$I18N$IX90) * / null
                                                    from DL_COMMON.HUMAN_SEXES#I18N e0
                                                   where t0.SEX = e0.ICAO
                                                     and lower(trim(e0.DISPLAY_VALUE)) = lower(trim('m�nnlich'))
                                                  --
                                                  )
                              --
                              )
                              --
                              and (t0.DATE_OF_BIRTH$VC = '650514'
                              --
                              or t0.DATE_OF_BIRTH = to_date('19650514'
                                                                                               ,'RRRRMMDD')
                              --
                              )
                              --
                              and (t0.NATIONALITY = 'austria'
                              --
                              or exists (select /*+ index(e1 ICAO_DOC_CODES$IX90 ICAO_DOC_CODES$I18N$IX90) * / null
                                                    from DL_COMMON.ICAO_DOC_CODES#I18N e1
                                                   where t0.NATIONALITY = e1.KEY_VALUE
                                                     and lower(trim(e1.DISPLAY_VALUE)) = lower(trim('austria'))
                                                  --
                                                  )
                              --
                              )
                              --
                              )
                             -- End:Attributes they CANNOT be queried alone, block exists only if one of the attributes is queried
                             --
                             )
                            -- End:Match by demographic data
                            --
                            -- Begin:Match by travel document data, block exists only if DOC_NUMBER is queried
                             or (
                             --
                              lower(trim(t0.DOC_NUMBER)) = lower(trim('p123456'))
                             --
                              and (t0.ISSUING_COUNTRY = 'AUT'
                              --
                              or exists (select /*+ index(e2 ICAO_DOC_CODES$IX90 ICAO_DOC_CODES$I18N$IX90) * / null
                                           from DL_COMMON.ICAO_DOC_CODES#I18N e2
                                          where t0.ISSUING_COUNTRY = e2.KEY_VALUE
                                            and lower(trim(e2.DISPLAY_VALUE)) = lower(trim('AUT'))
                                        --
                                        )
                              --
                              )
                             --
                              and (t0.DATE_OF_EXPIRY$VC = '180721'
                              --
                              or t0.DATE_OF_EXPIRY = to_date('20180721'
                                                                                               ,'RRRRMMDD')
                              --
                              )
                             --
                             )
                            -- End:Match by travel document data, block exists only if DOC_NUMBER is queried
                            --
                            )
                     -- End:Where
                     union all
                     --
                     -- Identities without any travel document
                     select /*+ leading(t0 t5) index(t0 IDENTITIES$IX90) index(t5 THAIPASSPORT$IX90) * / t0.KEY_VALUE as ID
                            ,t0.SURNAME
                            ,t5.TFAMILYNM as SURNAME_THAI
                            ,null as MIDDLE_NAME
                            ,t5.TMIDDLENM as MIDDLE_NAME_THAI
                            ,t0.GIVEN_NAME
                            ,t5.TFIRSTNM as GIVEN_NAME_THAI
                            ,t0.SEX
                            --,nvl(t3.DISPLAY_VALUE,t3.DISPLAY_VALUE$DLC) as SEX$DV
                            ,(select nvl(s12.DISPLAY_VALUE, s12.DISPLAY_VALUE$DLC) from DL_COMMON.HUMAN_SEXES$LC s12 where s12.KEY_VALUE = t0.SEX) as SEX$DV
                            ,t0.DATE_OF_BIRTH
                            ,t0.NATIONALITY
                            --,nvl(t2.DISPLAY_VALUE ,t2.DISPLAY_VALUE$DLC) as NATIONALITY$DV
                            ,(select nvl(s11.DISPLAY_VALUE, s11.DISPLAY_VALUE$DLC) from DL_COMMON.COUNTRIES$LC s11 where s11.KEY_VALUE = t0.NATIONALITY) as NATIONALITY$DV
                            ,null as TDT_DOC_NUMBER
                            ,null as TDT_ISSUING_COUNTRY
                            ,null as TDT_ISSUING_COUNTRY$DV
                            ,null as TDT_DATE_OF_EXPIRY
                            ,case
                               when (lower(trim('wirnsberger')) is null) then
                                0
                               else
                                UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.SURNAME))
                                                                  ,lower(trim('wirnsberger')))
                             end as SURNAME$MSCORE
                            ,case
                               when (lower(trim('wirnsberger')) is null) then
                                0
                               else
                                UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t5.TFAMILYNM))
                                                                  ,lower(trim('wirnsberger')))
                             end as SURNAME_THAI$MSCORE
                            ,0 as MIDDLE_NAME$MSCORE
                            ,0 as MIDDLE_NAME_THAI$MSCORE
                            ,case
                               when (lower(trim('william')) is null) then
                                0
                               else
                                UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.GIVEN_NAME))
                                                                  ,lower(trim('william')))
                             end as GIVEN_NAME$MSCORE
                            ,case
                               when (lower(trim('william')) is null) then
                                0
                               else
                                UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t5.TFIRSTNM))
                                                                  ,lower(trim('william')))
                             end as GIVEN_NAME_THAI$MSCORE
                            ,case
                               when (lower(trim('m�nnlich')) is null) then
                                0
                               else
                                UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.SEX))
                                                                  ,lower(trim('m�nnlich')))
                             end as SEX$MSCORE
                            ,nvl((
                                 select /*+ index(s2 HUMAN_SEXES$IX90 HUMAN_SEXES$I18N$IX90) * / max(case
                                               when (lower(trim('m�nnlich')) is null) then
                                                0
                                               else
                                                UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(s2.DISPLAY_VALUE))
                                                                                  ,lower(trim('m�nnlich')))
                                             end)
                                   from DL_COMMON.HUMAN_SEXES#I18N s2
                                  where s2.KEY_VALUE = t0.SEX
                                    and lower(trim(s2.DISPLAY_VALUE)) = lower(trim('m�nnlich'))
                                 --
                                 )
                                ,0) as SEX$DV$MSCORE
                            ,case
                               when (t0.DATE_OF_BIRTH = to_date('19650514'
                                                                ,'RRRRMMDD')) then
                                100
                               else
                                0
                             end as DATE_OF_BIRTH$MSCORE
                            ,case
                               when (lower(trim('austria')) is null) then
                                0
                               else
                                UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.NATIONALITY))
                                                                  ,lower(trim('austria')))
                             end as NATIONALITY$MSCORE
                            ,nvl((
                                 select /*+ index(s1 COUNTRIES$IX90 COUNTRIES$I18N$IX90) * / max(case
                                               when (lower(trim('austria')) is null) then
                                                0
                                               else
                                                UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(s1.DISPLAY_VALUE))
                                                                                  ,lower(trim('austria')))
                                             end)
                                   from DL_COMMON.COUNTRIES#I18N s1
                                  where s1.KEY_VALUE = t0.NATIONALITY
                                    and lower(trim(s1.DISPLAY_VALUE)) = lower(trim('austria'))
                                 --
                                 )
                                ,0) as NATIONALITY$DV$MSCORE
                            ,0 as TDT_DOC_NUMBER$MSCORE
                            ,0 as TDT_ISSUING_COUNTRY$MSCORE
                            ,0 as TDT_ISSUING_COUNTRY$DV$MSCORE
                            ,0 as TDT_DATE_OF_EXPIRY$MSCORE
                       from DL_BLACKLIST.IDENTITIES t0
                       left join DL_BORDERCONTROL.THAIPASSPORT t5
                         on (t0.EXTENDED_DATA_SOURCE = 'DL_BORDERCONTROL.THAIPASSPORT' and t0.EXTENDED_DATA_PK_0 = t5.KEY_VALUE)
                       --left join DL_COMMON.COUNTRIES$LC t2                     on (t0.NATIONALITY = t2.KEY_VALUE)
                       --left join DL_COMMON.HUMAN_SEXES$LC t3                     on (t0.SEX = t3.KEY_VALUE)
             where 1 = 1
                        and not exists (select null
                               from DL_BLACKLIST.TRAVEL_DOCS e10
                              where e10.IDENTITY = t0.KEY_VALUE
                             --
                             )
                           --
                           -- Begin:Where
                        and (
                            --
                            -- Begin:Attributes they can be queried alone, block exists allways
                             (1 = 1
                             --
                             and (lower(trim(t0.SURNAME)) = lower(trim('wirnsberger'))
                             --
                             or lower(trim(t5.TFAMILYNM)) = lower(trim('wirnsberger'))
                             --
                             )
                             --
                             and (lower(trim(t0.GIVEN_NAME)) = lower(trim('william'))
                             --
                             or lower(trim(t5.TFIRSTNM)) = lower(trim('william'))
                             --
                             )
                             --
                             )
                            -- End:Attributes they can be queried alone, block exists allways
                            --
                            -- Begin:Attributes they CANNOT be queried alone, block exists only if one of the attributes is queried
                             and (1 = 1
                             --
                             and (t0.SEX = 'm�nnlich'
                             --
                             or exists (select /*+ index(e0 HUMAN_SEXES$IX90 HUMAN_SEXES$I18N$IX90) * / null
                                                   from DL_COMMON.HUMAN_SEXES#I18N e0
                                                  where t0.SEX = e0.KEY_VALUE
                                                    and lower(trim(e0.DISPLAY_VALUE)) = lower(trim('m�nnlich'))
                                                 --
                                                 )
                             --
                             )
                             --
                             and (t0.DATE_OF_BIRTH = to_date('19650514'
                                                                                              ,'RRRRMMDD')
                             --
                             )
                             --
                             and (t0.NATIONALITY = 'austria'
                             --
                             or exists (select /*+ index(e1 COUNTRIES$IX90 COUNTRIES$I18N$IX90) * / null
                                                   from DL_COMMON.COUNTRIES#I18N e1
                                                  where t0.NATIONALITY = e1.KEY_VALUE
                                                    and lower(trim(e1.DISPLAY_VALUE)) = lower(trim('austria'))
                                                 --
                                                 )
                             --
                             )
                             --
                             )
                            -- End:Attributes they CANNOT be queried alone, block exists only if one of the attributes is queried
                            --
                            )
                     -- End:Where
                     --
                     ) t10
             order by SURNAME$MSCORE             desc nulls last
                      ,SURNAME_THAI$MSCORE        desc nulls last
                      ,GIVEN_NAME$MSCORE          desc nulls last
                      ,GIVEN_NAME_THAI$MSCORE     desc nulls last
                      ,SEX$MSCORE                 desc nulls last
                      ,SEX$DV$MSCORE              desc nulls last
                      ,DATE_OF_BIRTH$MSCORE       desc nulls last
                      ,NATIONALITY$MSCORE         desc nulls last
                      ,NATIONALITY$DV$MSCORE      desc nulls last
                      ,TDT_DOC_NUMBER$MSCORE      desc nulls last
                      ,TDT_ISSUING_COUNTRY$MSCORE desc nulls last
                      ,TDT_ISSUING_COUNTRY$DV$MSCORE desc nulls last
                      ,TDT_DATE_OF_EXPIRY$MSCORE  desc nulls last
            --
            ) t20
     where rownum <= 1;
    --
    */
    --
    --
    cursor c0(cp_use_surname         in pls_integer
             ,cp_qry_surname         in varchar2
             ,cp_use_middle_name     in pls_integer
             ,cp_qry_middle_name     in varchar2
             ,cp_use_given_name      in pls_integer
             ,cp_qry_given_name      in varchar2
             ,cp_use_sex             in pls_integer
             ,cp_qry_sex             in varchar2
             ,cp_use_date_of_birth_f in pls_integer
             ,cp_qry_date_of_birth_f in varchar2
              --,cp_Use_DATE_OF_BIRTH_T      in pls_integer
              --,cp_QRY_DATE_OF_BIRTH_T      in varchar2
             ,cp_use_nationality          in pls_integer
             ,cp_qry_nationality          in varchar2
             ,cp_use_tdt_doc_number       in pls_integer
             ,cp_qry_tdt_doc_number       in varchar2
             ,cp_use_tdt_date_of_expiry_f in pls_integer
             ,cp_qry_tdt_date_of_expiry_f in varchar2
              --,cp_Use_TDT_DATE_OF_EXPIRY_T in pls_integer
              --,cp_QRY_TDT_DATE_OF_EXPIRY_T in varchar2
             ,cp_use_tdt_issuing_country in pls_integer
             ,cp_qry_tdt_issuing_country in varchar2
             ,cp_res_max_rows            in pls_integer -- default null
              --,cp_RES_MSCORE_ALGORITHM     in varchar2 -- default 'EDIT_DISTANCE' -- [EDIT_DISTANCE|JARO_WINKLER] on null 'EDIT_DISTANCE'
              --,cp_RES_SHOW_ROW_NUM         in pls_integer -- default 1 -- on null 1
              --,cp_RES_SHOW_ROW_CNT         in pls_integer -- default 1 -- on null 1
              --,cp_RES_SHOW_EXTENDED        in pls_integer -- default 0 -- on null 0
              --,cp_Query_Type4Where         in varchar2 -- default 'LOWER_TRIM' -- [LOWER_TRIM|SOUNDEX_TRIM] on null 'LOWER_TRIM'
              --,cp_Use_Index_Hints          in pls_integer -- default 0 -- on null 0
              --
              ) is
      select dl_blacklist.ot_blt_search_result_ext(t20.id
                                                  ,t20.surname
                                                  ,t20.surname_thai
                                                  ,t20.middle_name
                                                  ,t20.middle_name_thai
                                                  ,t20.given_name
                                                  ,t20.given_name_thai
                                                  ,t20.sex
                                                  ,t20.sex$dv
                                                  ,t20.date_of_birth
                                                  ,t20.nationality
                                                  ,t20.nationality$dv
                                                  ,t20.tdt_doc_number
                                                  ,t20.tdt_issuing_country
                                                  ,t20.tdt_issuing_country$dv
                                                  ,t20.tdt_date_of_expiry
                                                  ,dl_common.pkg_i18n.get_sess_data_locale()
                                                  ,rownum
                                                  ,count(*) over()
                                                  ,cp_qry_surname
                                                  ,t20.surname$mscore
                                                  ,t20.surname_thai$mscore
                                                  ,cp_qry_middle_name
                                                  ,t20.middle_name$mscore
                                                  ,t20.middle_name_thai$mscore
                                                  ,cp_qry_given_name
                                                  ,t20.given_name$mscore
                                                  ,t20.given_name_thai$mscore
                                                  ,cp_qry_sex
                                                  ,t20.sex$mscore
                                                  ,t20.sex$dv$mscore
                                                  ,to_date(cp_qry_date_of_birth_f
                                                          ,'RRRRMMDD')
                                                  ,to_date(null --cp_QRY_DATE_OF_BIRTH_T
                                                          ,'RRRRMMDD')
                                                  ,t20.date_of_birth$mscore
                                                  ,cp_qry_nationality
                                                  ,t20.nationality$mscore
                                                  ,t20.nationality$dv$mscore
                                                  ,cp_qry_tdt_doc_number
                                                  ,t20.tdt_doc_number$mscore
                                                  ,cp_qry_tdt_issuing_country
                                                  ,t20.tdt_issuing_country$mscore
                                                  ,t20.tdt_issuing_country$dv$mscore
                                                  ,to_date(cp_qry_tdt_date_of_expiry_f
                                                          ,'RRRRMMDD')
                                                  ,to_date(null --cp_QRY_TDT_DATE_OF_EXPIRY_T
                                                          ,'RRRRMMDD')
                                                  ,t20.tdt_date_of_expiry$mscore
                                                   --
                                                   ) as blt_search_result
        from (
              --
              select t10.id
                     ,t10.surname
                     ,t10.surname_thai
                     ,t10.middle_name
                     ,t10.middle_name_thai
                     ,t10.given_name
                     ,t10.given_name_thai
                     ,t10.sex
                     ,t10.sex$dv
                     ,t10.date_of_birth
                     ,t10.nationality
                     ,t10.nationality$dv
                     ,t10.tdt_doc_number
                     ,t10.tdt_issuing_country
                     ,t10.tdt_issuing_country$dv
                     ,t10.tdt_date_of_expiry
                     ,t10.surname$mscore
                     ,t10.surname_thai$mscore
                     ,t10.middle_name$mscore
                     ,t10.middle_name_thai$mscore
                     ,t10.given_name$mscore
                     ,t10.given_name_thai$mscore
                     ,t10.sex$mscore
                     ,t10.sex$dv$mscore
                     ,t10.date_of_birth$mscore
                     ,t10.nationality$mscore
                     ,t10.nationality$dv$mscore
                     ,t10.tdt_doc_number$mscore
                     ,t10.tdt_issuing_country$mscore
                     ,t10.tdt_issuing_country$dv$mscore
                     ,t10.tdt_date_of_expiry$mscore
                from (
                       --
                       -- /*+ index(t0 TRAVEL_DOCS$IX90) * /
                       select t4.key_value as id
                              ,t0.surname
                              ,t5.tfamilynm as surname_thai
                              ,null as middle_name
                              ,t5.tmiddlenm as middle_name_thai
                              ,t0.given_name
                              ,t5.tfirstnm as given_name_thai
                              ,t0.sex
                              ,nvl(t3.display_value
                                  ,t3.display_value$dlc) as sex$dv
                              ,t0.date_of_birth
                              ,t0.nationality
                              ,nvl(t2.display_value
                                  ,t2.display_value$dlc) as nationality$dv
                              ,t0.doc_number as tdt_doc_number
                              ,t0.issuing_country as tdt_issuing_country
                              ,nvl(t1.display_value
                                  ,t1.display_value$dlc) as tdt_issuing_country$dv
                              ,t0.date_of_expiry$vc as tdt_date_of_expiry
                              ,case
                                 when (lower(trim(cp_qry_surname)) is null) then
                                  0
                                 else
                                  utl_match.edit_distance_similarity(lower(trim(t0.surname))
                                                                    ,lower(trim(cp_qry_surname)))
                               end as surname$mscore
                              ,case
                                 when (lower(trim(cp_qry_surname)) is null) then
                                  0
                                 else
                                  utl_match.edit_distance_similarity(lower(trim(t5.tfamilynm))
                                                                    ,lower(trim(cp_qry_surname)))
                               end as surname_thai$mscore
                              ,0 as middle_name$mscore
                              ,case
                                 when (lower(trim(cp_qry_middle_name)) is null) then
                                  0
                                 else
                                  utl_match.edit_distance_similarity(lower(trim(t5.tmiddlenm))
                                                                    ,lower(trim(cp_qry_middle_name)))
                               end as middle_name_thai$mscore
                              ,case
                                 when (lower(trim(cp_qry_given_name)) is null) then
                                  0
                                 else
                                  utl_match.edit_distance_similarity(lower(trim(t0.given_name))
                                                                    ,lower(trim(cp_qry_given_name)))
                               end as given_name$mscore
                              ,case
                                 when (lower(trim(cp_qry_given_name)) is null) then
                                  0
                                 else
                                  utl_match.edit_distance_similarity(lower(trim(t5.tfirstnm))
                                                                    ,lower(trim(cp_qry_given_name)))
                               end as given_name_thai$mscore
                              ,case
                                 when (lower(trim(cp_qry_sex)) is null) then
                                  0
                                 else
                                  utl_match.edit_distance_similarity(lower(trim(t0.sex))
                                                                    ,lower(trim(cp_qry_sex)))
                               end as sex$mscore
                              ,nvl((
                                   --
                                   select max(case
                                                 when (lower(trim(cp_qry_sex)) is null) then
                                                  0
                                                 else
                                                  utl_match.edit_distance_similarity(lower(trim(s2.display_value))
                                                                                    ,lower(trim(cp_qry_sex)))
                                               end)
                                     from dl_common.human_sexes#i18n s2
                                    where s2.icao = t0.sex
                                      and lower(trim(s2.display_value)) = lower(trim(cp_qry_sex))
                                   --
                                   )
                                  ,0) as sex$dv$mscore
                              ,case
                                 when (t0.date_of_birth$vc = substr(cp_qry_date_of_birth_f
                                                                   ,3) or t0.date_of_birth = to_date(cp_qry_date_of_birth_f
                                                                                                     ,'RRRRMMDD')) then
                                  100
                                 else
                                  0
                               end as date_of_birth$mscore
                              ,case
                                 when (lower(trim(cp_qry_nationality)) is null) then
                                  0
                                 else
                                  utl_match.edit_distance_similarity(lower(trim(t0.nationality))
                                                                    ,lower(trim(cp_qry_nationality)))
                               end as nationality$mscore
                              ,nvl((
                                   --
                                   select max(case
                                                 when (lower(trim(cp_qry_nationality)) is null) then
                                                  0
                                                 else
                                                  utl_match.edit_distance_similarity(lower(trim(s1.display_value))
                                                                                    ,lower(trim(cp_qry_nationality)))
                                               end)
                                     from dl_common.icao_doc_codes#i18n s1
                                    where s1.key_value = t0.nationality
                                      and lower(trim(s1.display_value)) = lower(trim(cp_qry_nationality))
                                   --
                                   )
                                  ,0) as nationality$dv$mscore
                              ,case
                                 when (lower(trim(cp_qry_tdt_doc_number)) is null) then
                                  0
                                 else
                                  utl_match.edit_distance_similarity(lower(trim(t0.doc_number))
                                                                    ,lower(trim(cp_qry_tdt_doc_number)))
                               end as tdt_doc_number$mscore
                              ,case
                                 when (lower(trim(cp_qry_tdt_issuing_country)) is null) then
                                  0
                                 else
                                  utl_match.edit_distance_similarity(lower(trim(t0.issuing_country))
                                                                    ,lower(trim(cp_qry_tdt_issuing_country)))
                               end as tdt_issuing_country$mscore
                              ,nvl((
                                   --
                                   select max(case
                                                 when (lower(trim(cp_qry_tdt_issuing_country)) is null) then
                                                  0
                                                 else
                                                  utl_match.edit_distance_similarity(lower(trim(s0.display_value))
                                                                                    ,lower(trim(cp_qry_tdt_issuing_country)))
                                               end)
                                     from dl_common.icao_doc_codes#i18n s0
                                    where s0.key_value = t0.issuing_country
                                      and lower(trim(s0.display_value)) = lower(trim(cp_qry_tdt_issuing_country))
                                   --
                                   )
                                  ,0) as tdt_issuing_country$dv$mscore
                              ,case
                                 when (t0.date_of_expiry$vc = substr(cp_qry_tdt_date_of_expiry_f
                                                                    ,3) or t0.date_of_expiry = to_date(cp_qry_tdt_date_of_expiry_f
                                                                                                       ,'RRRRMMDD')) then
                                  100
                                 else
                                  0
                               end as tdt_date_of_expiry$mscore
                         from dl_blacklist.travel_docs t0
                        inner join dl_blacklist.identities t4
                           on (t0.identity = t4.key_value)
                         left join dl_common.icao_doc_codes$lc t1
                           on (t0.issuing_country = t1.key_value)
                         left join dl_common.icao_doc_codes$lc t2
                           on (t0.nationality = t2.key_value)
                         left join dl_common.human_sexes$lc t3
                           on (t0.sex = t3.icao)
                         left join dl_bordercontrol.thaipassport t5
                           on (t0.extended_data_source = 'DL_BORDERCONTROL.THAIPASSPORT' and t0.extended_data_pk_0 = t5.key_value)

                        where 1 = 1
                          and (
                              --
                              -- Match by demographic data
                               (
                               --
                                (0 = cp_use_surname or (lower(trim(t0.surname)) = lower(trim(cp_qry_surname))
                                --
                                or lower(trim(t5.tfamilynm)) = lower(trim(cp_qry_surname))
                                --
                                ))
                               --
                                and (0 = cp_use_middle_name or (t5.key_value is not null and ((lower(trim(t5.tmiddlenm)) = lower(trim(cp_qry_middle_name))))
                                --
                                ))
                               --
                                and (0 = cp_use_given_name or (lower(trim(t0.given_name)) = lower(trim(cp_qry_given_name))
                                --
                                or lower(trim(t5.tfirstnm)) = lower(trim(cp_qry_given_name))
                                --
                                ))
                               --
                                and (0 = cp_use_sex or (t0.sex = cp_qry_sex
                                --
                                -- /*+ index(e0 HUMAN_SEXES$IX90 HUMAN_SEXES$I18N$IX90) * /
                                or exists (select null
                                                                    from dl_common.human_sexes#i18n e0
                                                                   where t0.sex = e0.icao
                                                                     and lower(trim(e0.display_value)) = lower(trim(cp_qry_sex))
                                                                  --
                                                                  )

                                ))
                               --
                                and (0 = cp_use_date_of_birth_f or (t0.date_of_birth$vc = substr(cp_qry_date_of_birth_f
                                                                                                ,3)
                                --
                                or t0.date_of_birth = to_date(cp_qry_date_of_birth_f
                                                                                                 ,'RRRRMMDD')
                                --
                                ))
                               --
                                and (0 = cp_use_nationality or (t0.nationality = cp_qry_nationality
                                --
                                -- /*+ index(e1 ICAO_DOC_CODES$IX90 ICAO_DOC_CODES$I18N$IX90) * /
                                or exists (select null
                                                                            from dl_common.icao_doc_codes#i18n e1
                                                                           where t0.nationality = e1.key_value
                                                                             and lower(trim(e1.display_value)) = lower(trim(cp_qry_nationality))
                                                                          --
                                                                          )
                                --
                                ))
                               --
                               )
                              --
                              -- or match by travel document data
                               or (1 = cp_use_tdt_doc_number and (
                               --
                                (0 = cp_use_tdt_doc_number or lower(trim(t0.doc_number)) = lower(trim(cp_qry_tdt_doc_number)))
                               --
                                and (0 = cp_use_tdt_issuing_country or (t0.issuing_country = cp_qry_tdt_issuing_country
                                --
                                -- /*+ index(e2 ICAO_DOC_CODES$IX90 ICAO_DOC_CODES$I18N$IX90) * /
                                or exists (select null
                                                                                                                      from dl_common.icao_doc_codes#i18n e2
                                                                                                                     where t0.issuing_country = e2.key_value
                                                                                                                       and lower(trim(e2.display_value)) = lower(trim(cp_qry_tdt_issuing_country))
                                                                                                                    --
                                                                                                                    )
                                --
                                ))
                               --
                                and (0 = cp_use_tdt_date_of_expiry_f or (t0.date_of_expiry$vc = substr(cp_qry_tdt_date_of_expiry_f
                                                                                                                                        ,3)
                                --
                                or t0.date_of_expiry = to_date(cp_qry_tdt_date_of_expiry_f
                                                                                                                                         ,'RRRRMMDD')
                                --
                                ))
                               --
                               )
                               --
                               )
                              --
                              )
                       union all
                       --
                       -- Identities without any travel document
                       -- /*+ index(t0 IDENTITIES$IX90) * /
                       select t0.key_value as id
                              ,t0.surname
                              --,t5.tfamilynm as surname_thai
                              ,'' as surname_thai
                              ,null as middle_name
                              --,t5.tmiddlenm as middle_name_thai
                              ,'' as middle_name_thai
                              ,t0.given_name
                              --,t5.tfirstnm as given_name_thai
                              , '' as given_name_thai
                              ,t0.sex
                              ,nvl(t3.display_value
                                  ,t3.display_value$dlc) as sex$dv
                              ,t0.date_of_birth
                              ,t0.nationality
                              ,nvl(t2.display_value
                                  ,t2.display_value$dlc) as nationality$dv
                              ,null as tdt_doc_number
                              ,null as tdt_issuing_country
                              ,null as tdt_issuing_country$dv
                              ,null as tdt_date_of_expiry
                              ,case
                                 when (lower(trim(cp_qry_surname)) is null) then
                                  0
                                 else
                                  utl_match.edit_distance_similarity(lower(trim(t0.surname))
                                                                    ,lower(trim(cp_qry_surname)))
                               end as surname$mscore
                              ,case
                                 when (lower(trim(cp_qry_surname)) is null) then
                                  0
                                 else
--                                  utl_match.edit_distance_similarity(lower(trim(t5.tfamilynm))
--                                                                    ,lower(trim(cp_qry_surname)))
                                    utl_match.edit_distance_similarity(lower(trim(cp_qry_surname))
                                                                    ,lower(trim(cp_qry_surname)))
                               end as surname_thai$mscore
                              ,case
                                 when (lower(trim(cp_qry_middle_name)) is null) then
                                  0
                                 else
                                  utl_match.edit_distance_similarity(lower(trim(t0.middle_name))
                                                                    ,lower(trim(cp_qry_middle_name)))
                               end as middle_name$mscore
                              ,case
                                 when (lower(trim(cp_qry_middle_name)) is null) then
                                  0
                                 else
--                                  utl_match.edit_distance_similarity(lower(trim(t5.tmiddlenm))
--                                                                    ,lower(trim(cp_qry_middle_name)))
                                    utl_match.edit_distance_similarity(lower(trim(cp_qry_middle_name))
                                                                    ,lower(trim(cp_qry_middle_name)))
                               end as middle_name_thai$mscore
                              ,case
                                 when (lower(trim(cp_qry_given_name)) is null) then
                                  0
                                 else
                                  utl_match.edit_distance_similarity(lower(trim(t0.given_name))
                                                                    ,lower(trim(cp_qry_given_name)))
                               end as given_name$mscore
                              ,case
                                 when (lower(trim(cp_qry_given_name)) is null) then
                                  0
                                 else
--                                  utl_match.edit_distance_similarity(lower(trim(t5.tfirstnm))
--                                                                    ,lower(trim(cp_qry_given_name)))
                                     utl_match.edit_distance_similarity(lower(trim(cp_qry_given_name))
                                                                    ,lower(trim(cp_qry_given_name)))                               
                               end as given_name_thai$mscore
                              ,case
                                 when (lower(trim(cp_qry_sex)) is null) then
                                  0
                                 else
                                  utl_match.edit_distance_similarity(lower(trim(t0.sex))
                                                                    ,lower(trim(cp_qry_sex)))
                               end as sex$mscore
                              ,nvl((
                                   --
                                   select max(case
                                                 when (lower(trim(cp_qry_sex)) is null) then
                                                  0
                                                 else
                                                  utl_match.edit_distance_similarity(lower(trim(s2.display_value))
                                                                                    ,lower(trim(cp_qry_sex)))
                                               end)
                                     from dl_common.human_sexes#i18n s2
                                    where s2.key_value = t0.sex
                                      and lower(trim(s2.display_value)) = lower(trim(cp_qry_sex))
                                   --
                                   )
                                  ,0) as sex$dv$mscore
                              ,case
                                 when (t0.date_of_birth = to_date(cp_qry_date_of_birth_f
                                                                 ,'RRRRMMDD')) then
                                  100
                                 else
                                  0
                               end as date_of_birth$mscore
                              ,case
                                 when (lower(trim(cp_qry_nationality)) is null) then
                                  0
                                 else
                                  utl_match.edit_distance_similarity(lower(trim(t0.nationality))
                                                                    ,lower(trim(cp_qry_nationality)))
                               end as nationality$mscore
                              ,nvl((
                                   --
                                   select max(case
                                                 when (lower(trim(cp_qry_nationality)) is null) then
                                                  0
                                                 else
                                                  utl_match.edit_distance_similarity(lower(trim(s1.display_value))
                                                                                    ,lower(trim(cp_qry_nationality)))
                                               end)
                                     from dl_common.countries#i18n s1
                                    where s1.key_value = t0.nationality
                                      and lower(trim(s1.display_value)) = lower(trim(cp_qry_nationality))
                                   --
                                   )
                                  ,0) as nationality$dv$mscore
                              ,0 as tdt_doc_number$mscore
                              ,0 as tdt_issuing_country$mscore
                              ,0 as tdt_issuing_country$dv$mscore
                              ,0 as tdt_date_of_expiry$mscore
                         from dl_blacklist.identities t0
                         left join dl_common.countries$lc t2
                           on (t0.nationality = t2.key_value)
                         left join dl_common.human_sexes$lc t3
                           on (t0.sex = t3.key_value)
                         --left join dl_bordercontrol.thaipassport t5
                           --on (t0.extended_data_source = 'DL_BORDERCONTROL.THAIPASSPORT' and t0.extended_data_pk_0 = t5.key_value)
                        where 1 = 1
                          and not exists (select null
                                 from dl_blacklist.travel_docs e10
                                where e10.identity = t0.key_value
                               --
                               )
                          and (
                              --
                              -- Match by demographic data
                               (0 = cp_use_surname or (lower(trim(t0.surname)) = lower(trim(cp_qry_surname))
                               --
                               --or lower(trim(t5.tfamilynm)) = lower(trim(cp_qry_surname))
                               --
                               ))
                              --
                               and (0 = cp_use_middle_name or (lower(trim(t0.middle_name)) = lower(trim(cp_qry_middle_name))
                               --
                               --or lower(trim(t5.tmiddlenm)) = lower(trim(cp_qry_middle_name))
                               --
                               ))
                              --
                               and (0 = cp_use_given_name or (lower(trim(t0.given_name)) = lower(trim(cp_qry_given_name))
                               --
                               --or lower(trim(t5.tfirstnm)) = lower(trim(cp_qry_given_name))
                               --
                               ))
                              --
                               and (0 = cp_use_sex or (t0.sex = cp_qry_sex
                               --
                               -- /*+ index(e0 HUMAN_SEXES$IX90 HUMAN_SEXES$I18N$IX90) * /
                               or exists (select null
                                                                   from dl_common.human_sexes#i18n e0
                                                                  where t0.sex = e0.key_value
                                                                    and lower(trim(e0.display_value)) = lower(trim(cp_qry_sex))
                                                                 --
                                                                 )
                               --
                               ))
                              --
                               and (0 = cp_use_date_of_birth_f or (t0.date_of_birth = to_date(cp_qry_date_of_birth_f
                                                                                             ,'RRRRMMDD')
                               --
                               ))
                              --
                               and (0 = cp_use_nationality or (t0.nationality = cp_qry_nationality
                               --
                               -- /*+ index(e1 COUNTRIES$IX90 COUNTRIES$I18N$IX90) * /
                               or exists (select null
                                                                           from dl_common.countries#i18n e1
                                                                          where t0.nationality = e1.key_value
                                                                            and lower(trim(e1.display_value)) = lower(trim(cp_qry_nationality))
                                                                         --
                                                                         )
                               --
                               ))
                              --
                              )
                       --
                       ) t10
               order by surname$mscore             desc nulls last
                        ,surname_thai$mscore        desc nulls last
                        ,middle_name$mscore         desc nulls last
                        ,middle_name_thai$mscore    desc nulls last
                        ,given_name$mscore          desc nulls last
                        ,given_name_thai$mscore     desc nulls last
                        ,sex$mscore                 desc nulls last
                        ,sex$dv$mscore              desc nulls last
                        ,date_of_birth$mscore       desc nulls last
                        ,nationality$mscore         desc nulls last
                        ,nationality$dv$mscore      desc nulls last
                        ,tdt_doc_number$mscore      desc nulls last
                        ,tdt_issuing_country$mscore desc nulls last
                        ,tdt_issuing_country        desc nulls last
                        ,tdt_issuing_country$dv     desc nulls last
                        ,tdt_date_of_expiry$mscore  desc nulls last
              --
              ) t20
       where rownum <= cp_res_max_rows;
    --
    v_qry_surname              identities.surname%type;
    v_qry_middle_name          identities.middle_name%type;
    v_qry_given_name           identities.given_name%type;
    v_qry_sex                  dl_common.human_sexes.display_value%type;
    v_qry_date_of_birth_f      date;
    v_qry_date_of_birth_t      date;
    v_qry_nationality          dl_common.countries.display_value%type;
    v_qry_tdt_doc_number       travel_docs.doc_number%type;
    v_qry_tdt_date_of_expiry_f date;
    v_qry_tdt_date_of_expiry_t date;
    v_qry_tdt_issuing_country  dl_common.icao_doc_codes.display_value%type; --TRAVEL_DOCS.ISSUING_COUNTRY%type;
    --v_RES_MSCORE_ALGORITHM     varchar2(30);
    --v_RES_SHOW_ROW_NUM         boolean;
    --v_RES_SHOW_ROW_CNT         boolean;
    --v_RES_SHOW_EXTENDED        boolean;
    --v_Query_Type4Where         varchar2(30);
    --v_Use_Index_Hints          boolean;
    --v_Query_Function           varchar2(4000 char);
    v_vc_tmp  varchar2(32767 char);
    v_sqlcode number;
    v_sqlerrm varchar2(32767);
    --
  begin
    --
    -- !!! Dynamic used objects are statically referenced here by variable definitions or by procedure "Check_OBJECT_DEPENDENCE" !!!
    --
    --
    --
    if (not g_package_initialized)
    then
      init_package();
    end if;
    --
    --
    if (nvl(p_res_max_rows
           ,1) > 1)
    then
      raise_application_error(-20000
                             ,'The number argument p_RES_MAX_ROWS cannot be higher than 1, because this function returns only one row!');
    end if;
    --
    --
    /*
    if (nvl(upper(p_RES_MSCORE_ALGORITHM)
           ,'EDIT_DISTANCE') not in ('EDIT_DISTANCE'
                                     ,'JARO_WINKLER'))
    then
      Raise_application_error(-20000
                             ,'The text argument RES_SCORE_ALGORITHM must be in list [EDIT_DISTANCE|JARO_WINKLER]!');
    end if;
    --
    v_RES_MSCORE_ALGORITHM := nvl(upper(p_RES_MSCORE_ALGORITHM)
                                 ,'EDIT_DISTANCE');
    */
    --
    --
    /*
    if (nvl(p_RES_SHOW_ROW_NUM
           ,1) not in (0
                       ,1))
    then
      Raise_application_error(-20000
                             ,'The number argument RES_SHOW_ROW_NUM must be in list [0|1]!');
    end if;
    --
    v_RES_SHOW_ROW_NUM := sys.diutil.int_to_bool(nvl(p_RES_SHOW_ROW_NUM
                                                    ,1));
    --
    --
    if (nvl(p_RES_SHOW_ROW_CNT
           ,1) not in (0
                       ,1))
    then
      Raise_application_error(-20000
                             ,'The number argument RES_SHOW_ROW_CNT must be in list [0|1]!');
    end if;
    --
    v_RES_SHOW_ROW_CNT := sys.diutil.int_to_bool(nvl(p_RES_SHOW_ROW_CNT
                                                    ,1));
    --
    --
    if (nvl(p_RES_SHOW_EXTENDED
           ,0) not in (0
                       ,1))
    then
      Raise_application_error(-20000
                             ,'The number argument RES_SHOW_EXTENDED must be in list [0|1]!');
    end if;
    --
    v_RES_SHOW_EXTENDED := sys.diutil.int_to_bool(nvl(p_RES_SHOW_EXTENDED
                                                     ,0));
    --
    --
    if (nvl(upper(p_Query_Type4Where)
           ,'LOWER_TRIM') not in ('LOWER_TRIM'
                                  ,'SOUNDEX_TRIM'))
    then
      Raise_application_error(-20000
                             ,'The argument p_Query_Type4Where must be in list [LOWER_TRIM|SOUNDEX_TRIM]!');
    end if;
    --
    v_Query_Type4Where := nvl(upper(p_Query_Type4Where)
                             ,'LOWER_TRIM');
    --
    --
    case v_Query_Type4Where
      when 'LOWER_TRIM' then
        v_Query_Function := 'lower(trim';
      when 'SOUNDEX_TRIM' then
        v_Query_Function := 'soundex(trim';
      else
        Raise_application_error(-20000
                               ,'Unknown v_Query_Type4Where[''' || v_Query_Type4Where || ''']!');
    end case;
    --
    --
    v_Use_Index_Hints := sys.diutil.int_to_bool(nvl(p_Use_Index_Hints
                                                   ,0));
    */
    --
    --
    v_qry_surname             := prepare_qry_value(p_qry_surname);
    v_qry_middle_name         := prepare_qry_value(p_qry_middle_name);
    v_qry_given_name          := prepare_qry_value(p_qry_given_name);
    v_qry_sex                 := prepare_qry_value(p_qry_sex);
    v_qry_nationality         := prepare_qry_value(p_qry_nationality);
    v_qry_tdt_doc_number      := prepare_qry_value(p_qry_tdt_doc_number);
    v_qry_tdt_issuing_country := prepare_qry_value(p_qry_tdt_issuing_country);
    --
    --
    check_qry_values4search(v_qry_surname
                           ,v_qry_middle_name
                           ,v_qry_given_name
                           ,v_qry_sex
                           ,p_qry_date_of_birth_f
                           ,null --p_QRY_DATE_OF_BIRTH_T
                           ,v_qry_nationality
                           ,v_qry_tdt_doc_number
                           ,p_qry_tdt_date_of_expiry_f
                           ,null --p_QRY_TDT_DATE_OF_EXPIRY_T
                           ,v_qry_tdt_issuing_country
                           ,v_vc_tmp
                           ,v_qry_date_of_birth_f
                           ,v_qry_date_of_birth_t
                           ,v_qry_tdt_date_of_expiry_f
                           ,v_qry_tdt_date_of_expiry_t
                            --
                            );
    --
    if (v_vc_tmp is not null)
    then
      raise_application_error(-20000
                             ,v_vc_tmp);
    end if;
    --
    --
    if (v_qry_surname is null
       --
       and v_qry_middle_name is null
       --
       and v_qry_given_name is null
       --
       and v_qry_sex is null
       --
       and v_qry_date_of_birth_f is null
       --
       --and v_QRY_DATE_OF_BIRTH_T is null
       --
       and v_qry_nationality is null
       --
       and v_qry_tdt_doc_number is null
       --
       and v_qry_tdt_date_of_expiry_f is null
       --
       --and v_QRY_TDT_DATE_OF_EXPIRY_T is null
       --
       and v_qry_tdt_issuing_country is null
       --
       )
    then
      --
      v_result := null;
      --
    else
      --
      open c0(case when(v_qry_surname is null) then 0 else 1 end
             ,v_qry_surname
             ,case when(v_qry_middle_name is null) then 0 else 1 end
             ,v_qry_middle_name
             ,case when(v_qry_given_name is null) then 0 else 1 end
             ,v_qry_given_name
             ,case when(v_qry_sex is null) then 0 else 1 end
             ,v_qry_sex
             ,case when(v_qry_date_of_birth_f is null) then 0 else 1 end
             ,v_qry_date_of_birth_f
              --,case when(v_QRY_DATE_OF_BIRTH_T is null) then 0 else 1 end
              --,v_QRY_DATE_OF_BIRTH_T
             ,case when(v_qry_nationality is null) then 0 else 1 end
             ,v_qry_nationality
             ,case when(v_qry_tdt_doc_number is null) then 0 else 1 end
             ,v_qry_tdt_doc_number
             ,case when(v_qry_tdt_date_of_expiry_f is null) then 0 else 1 end
             ,v_qry_tdt_date_of_expiry_f
              --,case when(v_QRY_TDT_DATE_OF_EXPIRY_T is null) then 0 else 1 end
              --,v_QRY_TDT_DATE_OF_EXPIRY_T
             ,case when(v_qry_tdt_issuing_country is null) then 0 else 1 end
             ,v_qry_tdt_issuing_country
             ,nvl(p_res_max_rows
                 ,1)
              --,cp_RES_MSCORE_ALGORITHM
              --,cp_RES_SHOW_ROW_NUM
              --,cp_RES_SHOW_ROW_CNT
              --,cp_RES_SHOW_EXTENDED
              --,cp_Query_Type4Where
              --,cp_Use_Index_Hints
              --
              );
      begin
        --
        --
        fetch c0
          into v_result;
        --
        -- Finally
        close c0;
        --
      exception
        when others then
          dl_common.pkg_util.formaterrmsg(v_sqlcode
                                         ,v_sqlerrm);
          --
          -- Finally
          close c0;
          --
          raise_application_error(v_sqlcode
                                 ,v_sqlerrm);
          --
      end;
      --
    end if;
    --
    --
    return v_result;
    --
  exception
    when others then
      dl_common.pkg_util.formaterrmsg(v_sqlcode
                                     ,v_sqlerrm);
      --
      --
      raise_application_error(v_sqlcode
                             ,v_sqlerrm);
      --
  end searchsimple$sta;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    18.04.2018  SearchSimple:Copy of CABIS.PKG_BLACKLIST
  * WWirns    19.04.2018  SearchSimple:Any changes depending on new attributes
  * WWirns    25.04.2018  SearchSimple:Any changes depending on dynamic and static implementation
  * WWirns    04.05.2018  XX:Remove unneeded feature "Variance-Groups"
  *******************************************************************************/
  --
  function searchsimple(p_qry_surname              in varchar2
                       ,p_qry_middle_name          in varchar2
                       ,p_qry_given_name           in varchar2
                       ,p_qry_sex                  in varchar2
                       ,p_qry_date_of_birth_f      in varchar2
                       ,p_qry_date_of_birth_t      in varchar2
                       ,p_qry_nationality          in varchar2
                       ,p_qry_tdt_doc_number       in varchar2
                       ,p_qry_tdt_date_of_expiry_f in varchar2
                       ,p_qry_tdt_date_of_expiry_t in varchar2
                       ,p_qry_tdt_issuing_country  in varchar2
                       ,p_res_max_rows             in pls_integer default 1 -- on null 1
                       ,p_res_mscore_algorithm     in varchar2 default 'EDIT_DISTANCE' -- [EDIT_DISTANCE|JARO_WINKLER] on null 'EDIT_DISTANCE'
                       ,p_res_show_row_num         in pls_integer default 1 -- on null 1
                       ,p_res_show_row_cnt         in pls_integer default 1 -- on null 1
                       ,p_res_show_extended        in pls_integer default 0 -- on null 0
                       ,p_query_type4where         in varchar2 default 'LOWER_TRIM' -- [LOWER_TRIM|SOUNDEX_TRIM] on null 'LOWER_TRIM'
                       ,p_use_index_hints          in pls_integer default 0 -- on null 0
                       ,p_use_implementation       in varchar2 default 'DYNAMIC' -- [DYNAMIC|STATIC] on null 'DYNAMIC'
                        --
                        ) return ot_blt_search_result is
    --
  begin
    --
    --
    case nvl(upper(p_use_implementation)
        ,'DYNAMIC')
      when 'DYNAMIC' then
        --
        return searchsimple$dyn(p_qry_surname
                               ,p_qry_middle_name
                               ,p_qry_given_name
                               ,p_qry_sex
                               ,p_qry_date_of_birth_f
                               ,p_qry_date_of_birth_t
                               ,p_qry_nationality
                               ,p_qry_tdt_doc_number
                               ,p_qry_tdt_date_of_expiry_f
                               ,p_qry_tdt_date_of_expiry_t
                               ,p_qry_tdt_issuing_country
                               ,p_res_max_rows
                               ,p_res_mscore_algorithm
                               ,p_res_show_row_num
                               ,p_res_show_row_cnt
                               ,p_res_show_extended
                               ,p_query_type4where
                               ,p_use_index_hints
                                --
                                );
        --
      when 'STATIC' then
        --
        return searchsimple$sta(p_qry_surname
                               ,p_qry_middle_name
                               ,p_qry_given_name
                               ,p_qry_sex
                               ,p_qry_date_of_birth_f
                                --,p_QRY_DATE_OF_BIRTH_T
                               ,p_qry_nationality
                               ,p_qry_tdt_doc_number
                               ,p_qry_tdt_date_of_expiry_f
                                --,p_QRY_TDT_DATE_OF_EXPIRY_T
                               ,p_qry_tdt_issuing_country
                               ,p_res_max_rows
                                --,p_RES_MSCORE_ALGORITHM
                                --,p_RES_SHOW_ROW_NUM
                                --,p_RES_SHOW_ROW_CNT
                                --,p_RES_SHOW_EXTENDED
                                --,p_Query_Type4Where
                                --,p_Use_Index_Hints
                                --
                                );
        --
      else
        raise_application_error(-20000
                               ,'The argument Use_Implementation must be in list [DYNAMIC|STATIC]!');
    end case;
    --
  end searchsimple;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    18.04.2018  SearchSimple$JSON:Copy of CABIS.PKG_BLACKLIST
  * WWirns    19.04.2018  SearchSimple$JSON:Any changes depending on new attributes
  * WWirns    25.04.2018  SearchSimple$JSON:Any changes depending on new SQL
  * WWirns    04.05.2018  XX:Remove unneeded feature "Variance-Groups"
  *******************************************************************************/
  --
  function searchsimple$json(p_qry_surname              in varchar2
                            ,p_qry_middle_name          in varchar2
                            ,p_qry_given_name           in varchar2
                            ,p_qry_sex                  in varchar2
                            ,p_qry_date_of_birth_f      in varchar2
                            ,p_qry_date_of_birth_t      in varchar2
                            ,p_qry_nationality          in varchar2
                            ,p_qry_tdt_doc_number       in varchar2
                            ,p_qry_tdt_date_of_expiry_f in varchar2
                            ,p_qry_tdt_date_of_expiry_t in varchar2
                            ,p_qry_tdt_issuing_country  in varchar2
                            ,p_res_max_rows             in pls_integer default null
                            ,p_res_mscore_algorithm     in varchar2 default 'EDIT_DISTANCE' -- [EDIT_DISTANCE|JARO_WINKLER] on null 'EDIT_DISTANCE'
                            ,p_res_show_row_num         in pls_integer default 1 -- on null 1
                            ,p_res_show_row_cnt         in pls_integer default 1 -- on null 1
                            ,p_res_show_extended        in pls_integer default 0 -- on null 0
                            ,p_query_type4where         in varchar2 default 'LOWER_TRIM' -- [LOWER_TRIM|SOUNDEX_TRIM] on null 'LOWER_TRIM'
                            ,p_use_index_hints          in pls_integer default 0 -- on null 0
                             --
                             ) return clob is
    --
    v_result clob;
    --
  begin
    --
    --
    if (not g_package_initialized)
    then
      init_package();
    end if;
    --
    --
    if (nvl(p_res_show_extended
           ,0) != 0)
    then
      select json_arrayagg(case
                             when (t.blt_search_result is not null) then
                              json_object(key 'id' value t.blt_search_result.id
                                         ,key 'surname' value t.blt_search_result.surname
                                         ,key 'surnameThai' value t.blt_search_result.surname_thai
                                         ,key 'middlename' value t.blt_search_result.middle_name
                                         ,key 'middlenameThai' value t.blt_search_result.middle_name_thai
                                         ,key 'firstname' value t.blt_search_result.given_name
                                         ,key 'firstnameThai' value t.blt_search_result.given_name_thai
                                         ,key 'sexCode' value t.blt_search_result.sex
                                         ,key 'sex' value t.blt_search_result.sex$dv
                                         ,key 'dateOfBirth' value t.blt_search_result.date_of_birth
                                         ,key 'nationalityCode' value t.blt_search_result.nationality
                                         ,key 'nationality' value t.blt_search_result.nationality$dv
                                         ,key 'passportNumber' value t.blt_search_result.tdt_doc_number
                                         ,key 'passportIssuingCountryCode' value t.blt_search_result.tdt_issuing_country
                                         ,key 'passportIssuingCountry' value t.blt_search_result.tdt_issuing_country$dv
                                         ,key 'passportExpirydate' value t.blt_search_result.tdt_date_of_expiry
                                         ,key 'sessionLocale' value t.blt_search_result.locale
                                         ,key 'rowNumber' value t.blt_search_result.row_num
                                         ,key 'rowCount' value t.blt_search_result.row_cnt
                                         ,key 'surnameQueryValue' value t.blt_search_result.surname$qry
                                         ,key 'surnameMatchScore' value t.blt_search_result.surname$mscore
                                         ,key 'surnameThaiMatchScore' value t.blt_search_result.surname_thai$mscore
                                         ,key 'middlenameQueryValue' value t.blt_search_result.middle_name$qry
                                         ,key 'middlenameMatchScore' value t.blt_search_result.middle_name$mscore
                                         ,key 'middlenameThaiMatchScore' value t.blt_search_result.middle_name_thai$mscore
                                         ,key 'firstnameQueryValue' value t.blt_search_result.given_name$qry
                                         ,key 'firstnameMatchScore' value t.blt_search_result.given_name$mscore
                                         ,key 'firstnameThaiMatchScore' value t.blt_search_result.given_name_thai$mscore
                                         ,key 'sexQueryValue' value t.blt_search_result.sex$qry
                                         ,key 'sexCodeMatchScore' value t.blt_search_result.sex$mscore
                                         ,key 'sexMatchScore' value t.blt_search_result.sex$dv$mscore
                                         ,key 'dateOfBirthFromQueryValue' value t.blt_search_result.date_of_birth_f$qry
                                         ,key 'dateOfBirthToQueryValue' value t.blt_search_result.date_of_birth_t$qry
                                         ,key 'dateOfBirthMatchScore' value t.blt_search_result.date_of_birth$mscore
                                         ,key 'nationalityQueryValue' value t.blt_search_result.nationality$qry
                                         ,key 'nationalityCodeMatchScore' value t.blt_search_result.nationality$mscore
                                         ,key 'nationalityMatchScore' value t.blt_search_result.nationality$dv$mscore
                                         ,key 'passportNumberQueryValue' value t.blt_search_result.tdt_doc_number$qry
                                         ,key 'passportNumberMatchScore' value t.blt_search_result.tdt_doc_number$mscore
                                         ,key 'passportIssuingCountryQueryValue' value t.blt_search_result.tdt_issuing_country$qry
                                         ,key 'passportIssuingCountryCodeMatchScore' value t.blt_search_result.tdt_issuing_country$mscore
                                         ,key 'passportIssuingCountryMatchScore' value t.blt_search_result.tdt_issuing_country$dv$mscore
                                         ,key 'passportExpirydateFromQueryValue' value t.blt_search_result.tdt_date_of_expiry_f$qry
                                         ,key 'passportExpirydateToQueryValue' value t.blt_search_result.tdt_date_of_expiry_t$qry
                                         ,key 'passportExpirydateMatchScore' value t.blt_search_result.tdt_date_of_expiry$mscore
                                          --
                                          )
                             else
                              ''
                           end
                           --
                           format json
                           --
                           returning clob
                           --
                           ) as content
        into v_result
        from (
              --
              select treat(dl_blacklist.pkg_search.searchsimple(p_qry_surname
                                                                ,p_qry_middle_name
                                                                ,p_qry_given_name
                                                                ,p_qry_sex
                                                                ,p_qry_date_of_birth_f
                                                                ,p_qry_date_of_birth_t
                                                                ,p_qry_nationality
                                                                ,p_qry_tdt_doc_number
                                                                ,p_qry_tdt_date_of_expiry_f
                                                                ,p_qry_tdt_date_of_expiry_t
                                                                ,p_qry_tdt_issuing_country
                                                                ,p_res_max_rows
                                                                ,p_res_mscore_algorithm
                                                                ,p_res_show_row_num
                                                                ,p_res_show_row_cnt
                                                                ,p_res_show_extended
                                                                ,p_query_type4where
                                                                ,p_use_index_hints
                                                                 --
                                                                 ) as dl_blacklist.ot_blt_search_result_ext) as blt_search_result
                from dual
              --
              ) t;
    else
      select json_arrayagg(case
                             when (t.blt_search_result is not null) then
                              json_object(key 'id' value t.blt_search_result.id
                                         ,key 'surname' value t.blt_search_result.surname
                                         ,key 'surnameThai' value t.blt_search_result.surname_thai
                                         ,key 'middlename' value t.blt_search_result.middle_name
                                         ,key 'middlenameThai' value t.blt_search_result.middle_name_thai
                                         ,key 'firstname' value t.blt_search_result.given_name
                                         ,key 'firstnameThai' value t.blt_search_result.given_name_thai
                                         ,key 'sexCode' value t.blt_search_result.sex
                                         ,key 'sex' value t.blt_search_result.sex$dv
                                         ,key 'dateOfBirth' value t.blt_search_result.date_of_birth
                                         ,key 'nationalityCode' value t.blt_search_result.nationality
                                         ,key 'nationality' value t.blt_search_result.nationality$dv
                                         ,key 'passportNumber' value t.blt_search_result.tdt_doc_number
                                         ,key 'passportIssuingCountryCode' value t.blt_search_result.tdt_issuing_country
                                         ,key 'passportIssuingCountry' value t.blt_search_result.tdt_issuing_country$dv
                                         ,key 'passportExpirydate' value t.blt_search_result.tdt_date_of_expiry
                                         ,key 'sessionLocale' value t.blt_search_result.locale
                                         ,key 'rowNumber' value t.blt_search_result.row_num
                                         ,key 'rowCount' value t.blt_search_result.row_cnt
                                          --
                                          )
                             else
                              ''
                           end
                           --
                           format json
                           --
                           returning clob
                           --
                           ) as content
        into v_result
        from (
              --
              select dl_blacklist.pkg_search.searchsimple(p_qry_surname
                                                          ,p_qry_middle_name
                                                          ,p_qry_given_name
                                                          ,p_qry_sex
                                                          ,p_qry_date_of_birth_f
                                                          ,p_qry_date_of_birth_t
                                                          ,p_qry_nationality
                                                          ,p_qry_tdt_doc_number
                                                          ,p_qry_tdt_date_of_expiry_f
                                                          ,p_qry_tdt_date_of_expiry_t
                                                          ,p_qry_tdt_issuing_country
                                                          ,p_res_max_rows
                                                          ,p_res_mscore_algorithm
                                                          ,p_res_show_row_num
                                                          ,p_res_show_row_cnt
                                                          ,p_res_show_extended
                                                          ,p_query_type4where
                                                          ,p_use_index_hints
                                                           --
                                                           ) as blt_search_result
                from dual
              --
              ) t;
    end if;
    --
    --
    return v_result;
    --
  end searchsimple$json;
  --
  function searchsimple$json(p_req_json in clob
                             --
                             ) return clob is
    --
    v_qry_surname              varchar2(4000 char);
    v_qry_middle_name          varchar2(4000 char);
    v_qry_given_name           varchar2(4000 char);
    v_qry_sex                  varchar2(4000 char);
    v_qry_date_of_birth_f      varchar2(4000 char);
    v_qry_date_of_birth_t      varchar2(4000 char);
    v_qry_nationality          varchar2(4000 char);
    v_qry_tdt_doc_number       varchar2(4000 char);
    v_qry_tdt_date_of_expiry_f varchar2(4000 char);
    v_qry_tdt_date_of_expiry_t varchar2(4000 char);
    v_qry_tdt_issuing_country  varchar2(4000 char);
    v_res_max_rows             pls_integer;
    v_res_mscore_algorithm     varchar2(4000 char);
    v_res_show_row_num         pls_integer;
    v_res_show_row_cnt         pls_integer;
    v_res_show_extended        pls_integer;
    v_query_type4where         varchar2(4000 char);
    v_use_index_hints          pls_integer;
    --
  begin
    --
    --
    to_arguments4search(p_req_json
                       ,v_qry_surname
                       ,v_qry_middle_name
                       ,v_qry_given_name
                       ,v_qry_sex
                       ,v_qry_date_of_birth_f
                       ,v_qry_date_of_birth_t
                       ,v_qry_nationality
                       ,v_qry_tdt_doc_number
                       ,v_qry_tdt_date_of_expiry_f
                       ,v_qry_tdt_date_of_expiry_t
                       ,v_qry_tdt_issuing_country
                       ,v_res_max_rows
                       ,v_res_mscore_algorithm
                       ,v_res_show_row_num
                       ,v_res_show_row_cnt
                       ,v_res_show_extended
                       ,v_query_type4where
                       ,v_use_index_hints
                        --
                        );
    --
    --
    return searchsimple$json(v_qry_surname
                            ,v_qry_middle_name
                            ,v_qry_given_name
                            ,v_qry_sex
                            ,v_qry_date_of_birth_f
                            ,v_qry_date_of_birth_t
                            ,v_qry_nationality
                            ,v_qry_tdt_doc_number
                            ,v_qry_tdt_date_of_expiry_f
                            ,v_qry_tdt_date_of_expiry_t
                            ,v_qry_tdt_issuing_country
                            ,v_res_max_rows
                            ,v_res_mscore_algorithm
                            ,v_res_show_row_num
                            ,v_res_show_row_cnt
                            ,v_res_show_extended
                            ,v_query_type4where
                            ,v_use_index_hints
                             --
                             );
    --
  end searchsimple$json;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    18.04.2018  SQL4SearchCandidates:Copy of CABIS.PKG_BLACKLIST
  * WWirns    19.04.2018  SQL4SearchCandidates:Any changes depending on new attributes
  * WWirns    04.05.2018  XX:Remove unneeded feature "Variance-Groups"
  *******************************************************************************/
  --
  function sql4searchcandidates(p_qry_surname              in varchar2
                               ,p_qry_middle_name          in varchar2
                               ,p_qry_given_name           in varchar2
                               ,p_qry_sex                  in varchar2
                               ,p_qry_date_of_birth_f      in varchar2
                               ,p_qry_date_of_birth_t      in varchar2
                               ,p_qry_nationality          in varchar2
                               ,p_qry_tdt_doc_number       in varchar2
                               ,p_qry_tdt_date_of_expiry_f in varchar2
                               ,p_qry_tdt_date_of_expiry_t in varchar2
                               ,p_qry_tdt_issuing_country  in varchar2
                               ,p_res_max_rows             in pls_integer default null
                               ,p_res_mscore_algorithm     in varchar2 default 'EDIT_DISTANCE' -- [EDIT_DISTANCE|JARO_WINKLER] on null 'EDIT_DISTANCE'
                               ,p_res_show_row_num         in pls_integer default 1 -- on null 1
                               ,p_res_show_row_cnt         in pls_integer default 1 -- on null 1
                               ,p_res_show_extended        in pls_integer default 1 -- on null 1
                               ,p_query_type4where         in varchar2 default 'LOWER_TRIM' -- [LOWER_TRIM|SOUNDEX_TRIM] on null 'LOWER_TRIM'
                               ,p_use_index_hints          in pls_integer default 0 -- on null 0
                                --
                                ) return clob is
  begin
    return sql4search('Candidates'
                     ,p_qry_surname
                     ,p_qry_middle_name
                     ,p_qry_given_name
                     ,p_qry_sex
                     ,p_qry_date_of_birth_f
                     ,p_qry_date_of_birth_t
                     ,p_qry_nationality
                     ,p_qry_tdt_doc_number
                     ,p_qry_tdt_date_of_expiry_f
                     ,p_qry_tdt_date_of_expiry_t
                     ,p_qry_tdt_issuing_country
                     ,p_res_max_rows
                     ,p_res_mscore_algorithm
                     ,p_res_show_row_num
                     ,p_res_show_row_cnt
                     ,nvl(p_res_show_extended
                         ,1)
                     ,p_query_type4where
                     ,p_use_index_hints
                      --
                      );
  end sql4searchcandidates;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    18.04.2018  SearchCandidates$PL:Copy of CABIS.PKG_BLACKLIST
  * WWirns    19.04.2018  SearchCandidates$PL:Any changes depending on new attributes
  * WWirns    04.05.2018  XX:Remove unneeded feature "Variance-Groups"
  *******************************************************************************/
  --
  function searchcandidates$pl(p_qry_surname              in varchar2
                              ,p_qry_middle_name          in varchar2
                              ,p_qry_given_name           in varchar2
                              ,p_qry_sex                  in varchar2
                              ,p_qry_date_of_birth_f      in varchar2
                              ,p_qry_date_of_birth_t      in varchar2
                              ,p_qry_nationality          in varchar2
                              ,p_qry_tdt_doc_number       in varchar2
                              ,p_qry_tdt_date_of_expiry_f in varchar2
                              ,p_qry_tdt_date_of_expiry_t in varchar2
                              ,p_qry_tdt_issuing_country  in varchar2
                              ,p_res_max_rows             in pls_integer default null
                              ,p_res_mscore_algorithm     in varchar2 default 'EDIT_DISTANCE' -- [EDIT_DISTANCE|JARO_WINKLER] on null 'EDIT_DISTANCE'
                              ,p_res_show_row_num         in pls_integer default 1 -- on null 1
                              ,p_res_show_row_cnt         in pls_integer default 1 -- on null 1
                              ,p_res_show_extended        in pls_integer default 1 -- on null 1
                              ,p_query_type4where         in varchar2 default 'LOWER_TRIM' -- [LOWER_TRIM|SOUNDEX_TRIM] on null 'LOWER_TRIM'
                              ,p_use_index_hints          in pls_integer default 0 -- on null 0
                               --
                               ) return tt_blt_search_result
    pipelined is
    --
    v_c0      sys_refcursor;
    v_r0      ot_blt_search_result;
    v_sql     clob;
    v_sqlcode number;
    v_sqlerrm varchar2(32767);
    --
  begin
    --
    -- !!! Dynamic used objects are statically referenced here by variable definitions or by procedure "Check_OBJECT_DEPENDENCE" !!!
    --
    --
    --
    if (not g_package_initialized)
    then
      init_package();
    end if;
    --
    --
    v_sql := sql4searchcandidates(p_qry_surname
                                 ,p_qry_middle_name
                                 ,p_qry_given_name
                                 ,p_qry_sex
                                 ,p_qry_date_of_birth_f
                                 ,p_qry_date_of_birth_t
                                 ,p_qry_nationality
                                 ,p_qry_tdt_doc_number
                                 ,p_qry_tdt_date_of_expiry_f
                                 ,p_qry_tdt_date_of_expiry_t
                                 ,p_qry_tdt_issuing_country
                                 ,p_res_max_rows
                                 ,p_res_mscore_algorithm
                                 ,p_res_show_row_num
                                 ,p_res_show_row_cnt
                                 ,p_res_show_extended
                                 ,p_query_type4where
                                 ,p_use_index_hints
                                  --
                                  );
    --
    --
    open v_c0 for v_sql;
    begin
      --
      --
      loop
        fetch v_c0
          into v_r0;
        exit when v_c0%notfound;
        --
        --
        pipe row(v_r0);
        --
      end loop;
      --
      --
      close v_c0;
      --
    exception
      when no_data_needed then
        --
        -- O R A-06548: no more rows needed
        close v_c0;
        --
      when others then
        dl_common.pkg_util.formaterrmsg(v_sqlcode
                                       ,v_sqlerrm);
        --
        --
        close v_c0;
        --
        raise_application_error(v_sqlcode
                               ,v_sqlerrm);
        --
    end;
    --
    --
    return;
    --
  exception
    when others then
      dl_common.pkg_util.formaterrmsg(v_sqlcode
                                     ,v_sqlerrm);
      --
      --
      raise_application_error(v_sqlcode
                             ,v_sqlerrm);
      --
  end searchcandidates$pl;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    18.04.2018  SearchCandidates$JSON:Copy of CABIS.PKG_BLACKLIST
  * WWirns    19.04.2018  SearchCandidates$JSON:Any changes depending on new attributes
  * WWirns    25.04.2018  SearchCandidates$JSON:Any changes depending on new SQL
  * WWirns    04.05.2018  XX:Remove unneeded feature "Variance-Groups"
  * WWirns    07.09.2018  searchcandidates$json:Do not use "json_arrayagg", instead build an own JSON-Array
  *******************************************************************************/
  --
  function searchcandidates$json(p_qry_surname              in varchar2
                                ,p_qry_middle_name          in varchar2
                                ,p_qry_given_name           in varchar2
                                ,p_qry_sex                  in varchar2
                                ,p_qry_date_of_birth_f      in varchar2
                                ,p_qry_date_of_birth_t      in varchar2
                                ,p_qry_nationality          in varchar2
                                ,p_qry_tdt_doc_number       in varchar2
                                ,p_qry_tdt_date_of_expiry_f in varchar2
                                ,p_qry_tdt_date_of_expiry_t in varchar2
                                ,p_qry_tdt_issuing_country  in varchar2
                                ,p_res_max_rows             in pls_integer default null
                                ,p_res_mscore_algorithm     in varchar2 default 'EDIT_DISTANCE' -- [EDIT_DISTANCE|JARO_WINKLER] on null 'EDIT_DISTANCE'
                                ,p_res_show_row_num         in pls_integer default 1 -- on null 1
                                ,p_res_show_row_cnt         in pls_integer default 1 -- on null 1
                                ,p_res_show_extended        in pls_integer default 1 -- on null 1
                                ,p_query_type4where         in varchar2 default 'LOWER_TRIM' -- [LOWER_TRIM|SOUNDEX_TRIM] on null 'LOWER_TRIM'
                                ,p_use_index_hints          in pls_integer default 0 -- on null 0
                                 --
                                 ) return clob is
    --
    v_Result  clob;
    v_sqlcode number;
    v_sqlerrm varchar2(32767);
    --
  begin
    --
    --
    if (not g_package_initialized)
    then
      init_package();
    end if;
    --
    --
    DBMS_LOB.createtemporary(v_Result
                            ,true);
    --
    --
    if (nvl(p_res_show_extended
           ,1) != 0)
    then
      --
      --
      DBMS_LOB.append(v_Result
                     ,'[');
      --           
      for R0 in (
                 --               
                 select rownum as ROW_NUM
                        ,case
                           when (t.blt_search_result is not null) then
                            json_object(key 'id' value t.blt_search_result.id
                                       ,key 'surname' value t.blt_search_result.surname
                                       ,key 'surnameThai' value t.blt_search_result.surname_thai
                                       ,key 'middlename' value t.blt_search_result.middle_name
                                       ,key 'middlenameThai' value t.blt_search_result.middle_name_thai
                                       ,key 'firstname' value t.blt_search_result.given_name
                                       ,key 'firstnameThai' value t.blt_search_result.given_name_thai
                                       ,key 'sexCode' value t.blt_search_result.sex
                                       ,key 'sex' value t.blt_search_result.sex$dv
                                       ,key 'dateOfBirth' value t.blt_search_result.date_of_birth
                                       ,key 'nationalityCode' value t.blt_search_result.nationality
                                       ,key 'nationality' value t.blt_search_result.nationality$dv
                                       ,key 'passportNumber' value t.blt_search_result.tdt_doc_number
                                       ,key 'passportIssuingCountryCode' value t.blt_search_result.tdt_issuing_country
                                       ,key 'passportIssuingCountry' value t.blt_search_result.tdt_issuing_country$dv
                                       ,key 'passportExpirydate' value t.blt_search_result.tdt_date_of_expiry
                                       ,key 'sessionLocale' value t.blt_search_result.locale
                                       ,key 'rowNumber' value t.blt_search_result.row_num
                                       ,key 'rowCount' value t.blt_search_result.row_cnt
                                       ,key 'surnameQueryValue' value t.blt_search_result.surname$qry
                                       ,key 'surnameMatchScore' value t.blt_search_result.surname$mscore
                                       ,key 'surnameThaiMatchScore' value t.blt_search_result.surname_thai$mscore
                                       ,key 'middlenameQueryValue' value t.blt_search_result.middle_name$qry
                                       ,key 'middlenameMatchScore' value t.blt_search_result.middle_name$mscore
                                       ,key 'middlenameThaiMatchScore' value t.blt_search_result.middle_name_thai$mscore
                                       ,key 'firstnameQueryValue' value t.blt_search_result.given_name$qry
                                       ,key 'firstnameMatchScore' value t.blt_search_result.given_name$mscore
                                       ,key 'firstnameThaiMatchScore' value t.blt_search_result.given_name_thai$mscore
                                       ,key 'sexQueryValue' value t.blt_search_result.sex$qry
                                       ,key 'sexCodeMatchScore' value t.blt_search_result.sex$mscore
                                       ,key 'sexMatchScore' value t.blt_search_result.sex$dv$mscore
                                       ,key 'dateOfBirthFromQueryValue' value t.blt_search_result.date_of_birth_f$qry
                                       ,key 'dateOfBirthToQueryValue' value t.blt_search_result.date_of_birth_t$qry
                                       ,key 'dateOfBirthMatchScore' value t.blt_search_result.date_of_birth$mscore
                                       ,key 'nationalityQueryValue' value t.blt_search_result.nationality$qry
                                       ,key 'nationalityCodeMatchScore' value t.blt_search_result.nationality$mscore
                                       ,key 'nationalityMatchScore' value t.blt_search_result.nationality$dv$mscore
                                       ,key 'passportNumberQueryValue' value t.blt_search_result.tdt_doc_number$qry
                                       ,key 'passportNumberMatchScore' value t.blt_search_result.tdt_doc_number$mscore
                                       ,key 'passportIssuingCountryQueryValue' value t.blt_search_result.tdt_issuing_country$qry
                                       ,key 'passportIssuingCountryCodeMatchScore' value t.blt_search_result.tdt_issuing_country$mscore
                                       ,key 'passportIssuingCountryMatchScore' value t.blt_search_result.tdt_issuing_country$dv$mscore
                                       ,key 'passportExpirydateFromQueryValue' value t.blt_search_result.tdt_date_of_expiry_f$qry
                                       ,key 'passportExpirydateToQueryValue' value t.blt_search_result.tdt_date_of_expiry_t$qry
                                       ,key 'passportExpirydateMatchScore' value t.blt_search_result.tdt_date_of_expiry$mscore
                                        --
                                        )
                           else
                            ''
                         end as JSON_OBJ
                   from (
                          --
                          select treat(t.object_value as dl_blacklist.ot_blt_search_result_ext) as blt_search_result
                            from table(
                                        --
                                        dl_blacklist.pkg_search.searchcandidates$pl(p_qry_surname
                                                                                   ,p_qry_middle_name
                                                                                   ,p_qry_given_name
                                                                                   ,p_qry_sex
                                                                                   ,p_qry_date_of_birth_f
                                                                                   ,p_qry_date_of_birth_t
                                                                                   ,p_qry_nationality
                                                                                   ,p_qry_tdt_doc_number
                                                                                   ,p_qry_tdt_date_of_expiry_f
                                                                                   ,p_qry_tdt_date_of_expiry_t
                                                                                   ,p_qry_tdt_issuing_country
                                                                                   ,p_res_max_rows
                                                                                   ,p_res_mscore_algorithm
                                                                                   ,p_res_show_row_num
                                                                                   ,p_res_show_row_cnt
                                                                                   ,p_res_show_extended
                                                                                   ,p_query_type4where
                                                                                   ,p_use_index_hints
                                                                                    --
                                                                                    )
                                        --
                                        ) t
                           right join dual
                              on (1 = 1)
                          --
                          ) t
                 --
                 )
      loop
        --
        if (R0.JSON_OBJ is not null)
        then
          --
          if (R0.ROW_NUM > 1)
          then
            DBMS_LOB.append(v_Result
                           ,',');
          end if;
          --
          DBMS_LOB.append(v_Result
                         ,R0.JSON_OBJ);
          --
        end if;
        --
      end loop;
      --
      DBMS_LOB.append(v_Result
                     ,']');
      --
    else
      --
      --
      DBMS_LOB.append(v_Result
                     ,'[');
      --           
      for R0 in (
                 --               
                 select rownum as ROW_NUM
                        ,case
                           when (t.blt_search_result is not null) then
                            json_object(key 'id' value t.blt_search_result.id
                                       ,key 'surname' value t.blt_search_result.surname
                                       ,key 'surnameThai' value t.blt_search_result.surname_thai
                                       ,key 'middlename' value t.blt_search_result.middle_name
                                       ,key 'middlenameThai' value t.blt_search_result.middle_name_thai
                                       ,key 'firstname' value t.blt_search_result.given_name
                                       ,key 'firstnameThai' value t.blt_search_result.given_name_thai
                                       ,key 'sexCode' value t.blt_search_result.sex
                                       ,key 'sex' value t.blt_search_result.sex$dv
                                       ,key 'dateOfBirth' value t.blt_search_result.date_of_birth
                                       ,key 'nationalityCode' value t.blt_search_result.nationality
                                       ,key 'nationality' value t.blt_search_result.nationality$dv
                                       ,key 'passportNumber' value t.blt_search_result.tdt_doc_number
                                       ,key 'passportIssuingCountryCode' value t.blt_search_result.tdt_issuing_country
                                       ,key 'passportIssuingCountry' value t.blt_search_result.tdt_issuing_country$dv
                                       ,key 'passportExpirydate' value t.blt_search_result.tdt_date_of_expiry
                                       ,key 'sessionLocale' value t.blt_search_result.locale
                                       ,key 'rowNumber' value t.blt_search_result.row_num
                                       ,key 'rowCount' value t.blt_search_result.row_cnt
                                        --
                                        )
                           else
                            ''
                         end as JSON_OBJ
                   from (
                          --
                          select t.object_value as blt_search_result
                            from table(
                                        --
                                        dl_blacklist.pkg_search.searchcandidates$pl(p_qry_surname
                                                                                   ,p_qry_middle_name
                                                                                   ,p_qry_given_name
                                                                                   ,p_qry_sex
                                                                                   ,p_qry_date_of_birth_f
                                                                                   ,p_qry_date_of_birth_t
                                                                                   ,p_qry_nationality
                                                                                   ,p_qry_tdt_doc_number
                                                                                   ,p_qry_tdt_date_of_expiry_f
                                                                                   ,p_qry_tdt_date_of_expiry_t
                                                                                   ,p_qry_tdt_issuing_country
                                                                                   ,p_res_max_rows
                                                                                   ,p_res_mscore_algorithm
                                                                                   ,p_res_show_row_num
                                                                                   ,p_res_show_row_cnt
                                                                                   ,p_res_show_extended
                                                                                   ,p_query_type4where
                                                                                   ,p_use_index_hints
                                                                                    --
                                                                                    )
                                        --
                                        ) t
                           right join dual
                              on (1 = 1)
                          --
                          ) t
                 --
                 )
      loop
        --
        if (R0.JSON_OBJ is not null)
        then
          --
          if (R0.ROW_NUM > 1)
          then
            DBMS_LOB.append(v_Result
                           ,',');
          end if;
          --
          DBMS_LOB.append(v_Result
                         ,R0.JSON_OBJ);
          --
        end if;
        --
      end loop;
      --
      DBMS_LOB.append(v_Result
                     ,']');
      --
    end if;
    --
    --
    return v_Result;
    --
    --
  exception
    when others then
      dl_common.pkg_util.formaterrmsg(v_sqlcode
                                     ,v_sqlerrm);
      --
      --
      dl_common.pkg_util.FreeTempLOB(v_Result);
      --
      --
      raise_application_error(v_sqlcode
                             ,v_sqlerrm);
      --
  end searchcandidates$json;
  --
  function searchcandidates$json(p_req_json in clob
                                 --
                                 ) return clob is
    --
    v_qry_surname              varchar2(4000 char);
    v_qry_middle_name          varchar2(4000 char);
    v_qry_given_name           varchar2(4000 char);
    v_qry_sex                  varchar2(4000 char);
    v_qry_date_of_birth_f      varchar2(4000 char);
    v_qry_date_of_birth_t      varchar2(4000 char);
    v_qry_nationality          varchar2(4000 char);
    v_qry_tdt_doc_number       varchar2(4000 char);
    v_qry_tdt_date_of_expiry_f varchar2(4000 char);
    v_qry_tdt_date_of_expiry_t varchar2(4000 char);
    v_qry_tdt_issuing_country  varchar2(4000 char);
    v_res_max_rows             pls_integer;
    v_res_mscore_algorithm     varchar2(4000 char);
    v_res_show_row_num         pls_integer;
    v_res_show_row_cnt         pls_integer;
    v_res_show_extended        pls_integer;
    v_query_type4where         varchar2(4000 char);
    v_use_index_hints          pls_integer;
    --
  begin
    --
    --
    to_arguments4search(p_req_json
                       ,v_qry_surname
                       ,v_qry_middle_name
                       ,v_qry_given_name
                       ,v_qry_sex
                       ,v_qry_date_of_birth_f
                       ,v_qry_date_of_birth_t
                       ,v_qry_nationality
                       ,v_qry_tdt_doc_number
                       ,v_qry_tdt_date_of_expiry_f
                       ,v_qry_tdt_date_of_expiry_t
                       ,v_qry_tdt_issuing_country
                       ,v_res_max_rows
                       ,v_res_mscore_algorithm
                       ,v_res_show_row_num
                       ,v_res_show_row_cnt
                       ,v_res_show_extended
                       ,v_query_type4where
                       ,v_use_index_hints
                        --
                        );
    --
    --
    return searchcandidates$json(v_qry_surname
                                ,v_qry_middle_name
                                ,v_qry_given_name
                                ,v_qry_sex
                                ,v_qry_date_of_birth_f
                                ,v_qry_date_of_birth_t
                                ,v_qry_nationality
                                ,v_qry_tdt_doc_number
                                ,v_qry_tdt_date_of_expiry_f
                                ,v_qry_tdt_date_of_expiry_t
                                ,v_qry_tdt_issuing_country
                                ,v_res_max_rows
                                ,v_res_mscore_algorithm
                                ,v_res_show_row_num
                                ,v_res_show_row_cnt
                                ,v_res_show_extended
                                ,v_query_type4where
                                ,v_use_index_hints
                                 --
                                 );
    --
  end searchcandidates$json;
  --
  --
  -- *** Standard functions ***************************************************************************
  --
  --
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    13.01.2016  Init_PACKAGE:Added
  *******************************************************************************/
  --
  procedure init_package is
    --
  begin
    --
    -- !!! Attention with call of other packages, because their init routines could be call back !!!
    -- !!! Try to avoid call of other packages here in this init block in order to prevent endless loops !!!
    --
    --
    -- Initial-Block
    if (not g_package_initializing)
    then
      --
      g_package_initializing := true;
      g_package_initialized  := false;
      --
      --
      check_object_dependence();
      --
      --
      null;
      --
      --
      g_package_initialized  := true;
      g_package_initializing := false;
      --
    end if;
    --
    -- For example, below are calls into functions they itself calls me
    --
    null;
    --
  end init_package;
  --
  --
  --
  procedure check_object_dependence is
  begin
    -- WWirns: For example check ORACLE-Version
    -- or internal version via "Get_OBJECT_VERSION$VC()" of other package or object types
    -- or if column of table exists
    -- and so on...
    null;

    --
    -- TODO: !!! Check needed indexes !!!
    --

    --
    -- TODO: !!! Dynamic used objects from "SQL4GENERALAUDIT_REPORT" are here staticly referenced !!!
    --

    --
    -- TODO: !!! Dynamic used objects are statically referenced here by variable definitions or by procedure "Check_OBJECT_DEPENDENCE" !!!
    --

    /*
    if (false)
    then
      for R0 in (
                 --
                 select DEMOGRAPHIC.GENERALAUDIT_REPORT$OT()
                   from DEMOGRAPHIC.GENERALAUDIT ga
                  inner join DEMOGRAPHIC.GENERAL_AUDIT_LOGGING gal
                     on (1 = 2)
                   left join DEMOGRAPHIC.LOOKUP_ACTIONS la
                     on (ga.ACTIONNO = la.ACTIONNO)
                   left join demographic.LOOKUP_BANKS lb
                     on (ga.BANKNO = lb.LOOKUP_KEY)
                  where 1 = 2
                 --
                 )
      loop
        null;
      end loop;
    end if;
    */
    --
  end check_object_dependence;
  --
  --
  --
  function get_package_id return simple_integer is
  begin
    return c_package_id;
  end;
  --
  function get_object_name return varchar2 is
  begin
    return $$plsql_unit_owner || '.' || $$plsql_unit;
  end;
  --
  function get_object_copyright return varchar2 is
  begin
    return c_object_copyright;
  end;
  --
  function get_object_version$vc return varchar2 is
  begin
    return c_object_version;
  end;
  --
--
--
begin
  --
  init_package();
  --
end PKG_SEARCH_NEW;
/
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_SEARCH_NEW" TO "DERMALOG_PROXY";
