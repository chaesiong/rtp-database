CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BLACKLIST"."PKG_SEARCH" is
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
  c_object_version   constant varchar2(19) := '1.3.0001';
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
  * MTheis    04.02.2019  Change DATE_OF_BIRTH search with Data Type CT_DATE_OF_BIRTH_PARTIAL
  * MTheis    05.03.2019  Matching Change for Names ind Identities and Travel_Docs
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
                                   ,p_result_date_of_birth_f      out nocopy DL_BLACKLIST.CT_PARTIAL_DATE
                                   ,p_result_date_of_birth_t      out nocopy DL_BLACKLIST.CT_PARTIAL_DATE
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
    v_result_date_of_birth_f date;
    v_result_date_of_birth_t date;
    v_date_of_birth_f  varchar2(30);
    v_date_of_birth_t  varchar2(30);

    --
  begin
    --

    -- Initialize CT_PARTIAL_DATE
   p_result_date_of_birth_f :=  DL_BLACKLIST.CT_PARTIAL_DATE(0,0,0);
   p_result_date_of_birth_t :=  DL_BLACKLIST.CT_PARTIAL_DATE(0,0,0);

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

        v_result_date_of_birth_f := dl_common.pkg_util.to_date(substr(p_qry_date_of_birth_f
                                                                     ,1
                                                                     ,19)
                                                              ,'YYYY-MM-DD"T"HH24:MI:SS');
        p_result_date_of_birth_f := CT_PARTIAL_DATE(extract(day from v_result_date_of_birth_f), extract(month from v_result_date_of_birth_f), extract(year from v_result_date_of_birth_f));

      exception
        when others then
          begin
            v_result_date_of_birth_f := dl_common.pkg_util.to_date(p_qry_date_of_birth_f
                                                                  ,'RRMMDD');
            p_result_date_of_birth_f := CT_PARTIAL_DATE(extract(day from v_result_date_of_birth_f), extract(month from v_result_date_of_birth_f), extract(year from v_result_date_of_birth_f));
          exception
            when others then
              begin
                v_result_date_of_birth_f := dl_common.pkg_util.to_date(p_qry_date_of_birth_f
                                                                      ,'RRRRMMDD');
                p_result_date_of_birth_f := CT_PARTIAL_DATE(extract(day from v_result_date_of_birth_f), extract(month from v_result_date_of_birth_f), extract(year from v_result_date_of_birth_f));
              exception
                when others then
                  begin
                    v_result_date_of_birth_f := dl_common.pkg_util.to_date(p_qry_date_of_birth_f
                                                                          ,'RRRR-MM-DD');
                    p_result_date_of_birth_f := CT_PARTIAL_DATE(extract(day from v_result_date_of_birth_f), extract(month from v_result_date_of_birth_f), extract(year from v_result_date_of_birth_f));
                  exception
                    when others then
                     begin
                        -- 1. << and XX convert to 00 - 2. delete others then digits
                        v_date_of_birth_f := regexp_replace(regexp_replace(p_qry_date_of_birth_f,'(<<)|(XX)', '00') ,'[^[:digit:]]+', '');
                        -- Fill datatype
                        p_result_date_of_birth_f := CT_PARTIAL_DATE( to_number(substr(v_date_of_birth_f, 7, 2),'00'), to_number(substr(v_date_of_birth_f, 5, 2),'00'), to_number(substr(v_date_of_birth_f, 1, 4),'0000'));
                     exception
                        when others then
                            p_result_msg := 'The date argument QRY_DATE_OF_BIRTH_F is an invalid CT_PARTIAL_DATE - Try "RRRRMMDD" in which "RRRR" can be 0 and "MM" or "DD" can be 0 or "<<" or "XX"!';
                     return;
                     end;
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
        v_result_date_of_birth_t := dl_common.pkg_util.to_date(substr(p_qry_date_of_birth_t
                                                                     ,1
                                                                     ,19)
                                                              ,'YYYY-MM-DD"T"HH24:MI:SS');
        p_result_date_of_birth_t := CT_PARTIAL_DATE(extract(day from v_result_date_of_birth_t), extract(month from v_result_date_of_birth_t), extract(year from v_result_date_of_birth_t));
      exception
        when others then
          begin
            v_result_date_of_birth_t := dl_common.pkg_util.to_date(p_qry_date_of_birth_t
                                                                  ,'RRMMDD');
            p_result_date_of_birth_t := CT_PARTIAL_DATE(extract(day from v_result_date_of_birth_t), extract(month from v_result_date_of_birth_t), extract(year from v_result_date_of_birth_t));
          exception
            when others then
              begin
                v_result_date_of_birth_t := dl_common.pkg_util.to_date(p_qry_date_of_birth_t
                                                                      ,'RRRRMMDD');
                p_result_date_of_birth_t := CT_PARTIAL_DATE(extract(day from v_result_date_of_birth_t), extract(month from v_result_date_of_birth_t), extract(year from v_result_date_of_birth_t));
              exception
                when others then
                  begin
                    v_result_date_of_birth_t := dl_common.pkg_util.to_date(p_qry_date_of_birth_t
                                                                          ,'RRRR-MM-DD');
                    p_result_date_of_birth_t := CT_PARTIAL_DATE(extract(day from v_result_date_of_birth_t), extract(month from v_result_date_of_birth_t), extract(year from v_result_date_of_birth_t));
                  exception
                    when others then
                      begin
                        -- 1. << and XX convert to 00 - 2. delete others then digits
                        v_date_of_birth_t := regexp_replace(regexp_replace(p_qry_date_of_birth_t,'(<<)|(XX)', '00') ,'[^[:digit:]]+', '');
                        -- Fill datatype
                        p_result_date_of_birth_t := CT_PARTIAL_DATE( to_number(substr(v_date_of_birth_t, 7, 2),'00'), to_number(substr(v_date_of_birth_t, 5, 2),'00'), to_number(substr(v_date_of_birth_t, 1, 4),'0000'));
                      exception
                        when others then
                            p_result_msg := 'The date argument QRY_DATE_OF_BIRTH_T is an invalid CT_PARTIAL_DATE - Try "RRRRMMDD" in which "RRRR" can be 0 and "MM" or "DD" can be 0 or "<<" or "XX"!';
                        return;
                      end;
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
     if ( v_nationality is null
       --
       )
       --
       and not (v_surname is not null or v_middle_name is not null or v_given_name is not null)
       --

    then
      p_result_msg := 'The text arguments QRY_NATIONALITY must be specified if one of the following text arguments QRY_SURNAME, QRY_MIDDLE_NAME or QRY_GIVEN_NAME is also be specified!';
      return;
    end if;


    --
    if (v_nationality is null)
       --
    then
      p_result_msg := 'The text argument QRY_NATIONALITY must be specified!';
      return;
    end if;
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
    v_result_date_of_birth_f      DL_BLACKLIST.CT_PARTIAL_DATE := DL_BLACKLIST.CT_PARTIAL_DATE(0,0,0);
    v_result_date_of_birth_t      DL_BLACKLIST.CT_PARTIAL_DATE := DL_BLACKLIST.CT_PARTIAL_DATE(0,0,0);
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
  * WWirns    11.12.2018  XX:Remove the usage of the table THAIPASSPORT and use instead the *_THAI-Columns of the table INDENTITIES
  * WWirns    11.12.2018  XX:Remove the queries against any DL_COMMON-Subtables for multilanguage- and displayvalue-support and use only KEY-Value comparsion
  * WWirns    11.12.2018  XX:Change most of the where condition statements
  * WWirns    11.12.2018  XX:Inculde decodation for SEX-Queryvalue because the query values could also be numeric values
  *******************************************************************************/
  --
  function where4searchsimple(p_part                       in pls_integer -- [0..1]
                             ,p_ppqry_surname              in varchar2
                             ,p_ppqry_middle_name          in varchar2
                             ,p_ppqry_given_name           in varchar2
                             ,p_ppqry_sex                  in varchar2
                             ,p_ppqry_date_of_birth_f      in DL_BLACKLIST.CT_PARTIAL_DATE
                             ,p_ppqry_date_of_birth_t      in DL_BLACKLIST.CT_PARTIAL_DATE
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
       and p_ppqry_date_of_birth_f.isNull() = 0 -- is not null
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
          if (p_ppqry_date_of_birth_f.isNull() = 0) -- is not null
          then
            if (p_ppqry_date_of_birth_t.isNull() = 0) -- is not null
            then
              v_result := v_result || '
                          --
                          or (t0.DATE_OF_BIRTH_PARTIAL.getYear() between ''' || p_ppqry_date_of_birth_f.getYear() || ''' and ''' || p_ppqry_date_of_birth_t.getYear() || '''
                          --
                          or t0.DATE_OF_BIRTH_PARTIAL.getMonth() between ''' || p_ppqry_date_of_birth_f.getYear() || ''' and ''' || p_ppqry_date_of_birth_t.getMonth() || '''
                          --
                          or t0.DATE_OF_BIRTH_PARTIAL.getDay() between ''' || p_ppqry_date_of_birth_f.getYear() || ''' and ''' || p_ppqry_date_of_birth_t.getDay() || '''
                          )';
            else
                  v_result := v_result || '
                              --
                              or (t0.DATE_OF_BIRTH_PARTIAL.getDay() = ''' || p_ppqry_date_of_birth_f.getDay() || '''
                              or t0.DATE_OF_BIRTH_PARTIAL.getMonth() = ''' || p_ppqry_date_of_birth_f.getMonth() || '''
                              or t0.DATE_OF_BIRTH_PARTIAL.getYear() = ''' || p_ppqry_date_of_birth_f.getYear() || '''
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
           or p_ppqry_date_of_birth_f.isNull() = 0 -- is not null
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
          if (p_ppqry_date_of_birth_f.isNull() = 0) -- is not null
          then
            if (p_ppqry_date_of_birth_t.isNull() = 0) -- is not null
            then
              v_result := v_result || '
                          --
                          or (t0.DATE_OF_BIRTH_PARTIAL.getYear() between ''' || p_ppqry_date_of_birth_f.getYear() || ''' and ''' || p_ppqry_date_of_birth_t.getYear() || '''
                          --
                          or t0.DATE_OF_BIRTH_PARTIAL.getMonth() between ''' || p_ppqry_date_of_birth_f.getYear() || ''' and ''' || p_ppqry_date_of_birth_t.getMonth() || '''
                          --
                          or t0.DATE_OF_BIRTH_PARTIAL.getDay() between ''' || p_ppqry_date_of_birth_f.getYear() || ''' and ''' || p_ppqry_date_of_birth_t.getDay() || '''
                          )';
            else
                  v_result := v_result || '
                              --
                              or (t0.DATE_OF_BIRTH_PARTIAL.getDay() = ''' || p_ppqry_date_of_birth_f.getDay() || '''
                              or t0.DATE_OF_BIRTH_PARTIAL.getMonth() = ''' || p_ppqry_date_of_birth_f.getMonth() || '''
                              or t0.DATE_OF_BIRTH_PARTIAL.getYear() = ''' || p_ppqry_date_of_birth_f.getYear() || '''
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
  * WWirns    11.12.2018  XX:Remove the usage of the table THAIPASSPORT and use instead the *_THAI-Columns of the table INDENTITIES
  * WWirns    11.12.2018  XX:Remove the queries against any DL_COMMON-Subtables for multilanguage- and displayvalue-support and use only KEY-Value comparsion
  * WWirns    11.12.2018  XX:Change most of the where condition statements
  * WWirns    11.12.2018  XX:Inculde decodation for SEX-Queryvalue because the query values could also be numeric values
  * WWirns    11.01.2019  XX:Rotate Surname-/Middlename-/Givenname-Paramters
  * WWirns    11.01.2019  XX:Briefing from Jaroslaw:Do not rotate query parameters for *_THAI-Columns
  * WWirns    21.01.2019  XX:Briefing from Jaroslaw:Do not use *_THAI-Columns for querying
  * WWirns    21.01.2019  XX:Cut Surname-/Middlename-/Givenname-Paramters to the maximum content length inside the query-column for each row
  *******************************************************************************/
  --
  function where4searchcandidates(p_part                       in pls_integer -- [0..1]
                                 ,p_ppqry_surname              in varchar2
                                 ,p_ppqry_middle_name          in varchar2
                                 ,p_ppqry_given_name           in varchar2
                                 ,p_ppqry_sex                  in varchar2
                                 ,p_ppqry_date_of_birth_f      in DL_BLACKLIST.CT_PARTIAL_DATE
                                 ,p_ppqry_date_of_birth_t      in DL_BLACKLIST.CT_PARTIAL_DATE
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
        -- Query parameter normal S|G
        if (p_ppqry_surname is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t0.SURNAME)) like ' || v_query_function || '(substr(''' || p_ppqry_surname || ''',1,length(trim(t0.SURNAME))))) || ''%''';
          --
          if (p_ppqry_given_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.GIVEN_NAME)) is null or ' || v_query_function || '(t0.GIVEN_NAME)) like ' || v_query_function || '(substr(''' || p_ppqry_given_name || ''',1,length(trim(t0.GIVEN_NAME))))) || ''%'')';
          end if;
          --
          v_result := v_result || '
                          --
                          )';
        end if;
        --
        -- Query parameter change S|M
        if (p_ppqry_surname is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t0.SURNAME)) like ' || v_query_function || '(substr(''' || p_ppqry_surname || ''',1,length(trim(t0.SURNAME))))) || ''%''';
          --
          if (p_ppqry_middle_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.GIVEN_NAME)) is null or ' || v_query_function || '(t0.GIVEN_NAME)) like ' || v_query_function || '(substr(''' || p_ppqry_middle_name || ''',1,length(trim(t0.GIVEN_NAME))))) || ''%'')';
          end if;
          --
          v_result := v_result || '
                          --
                          )';
        end if;
        --
        -- Query parameter change M|G
        if (p_ppqry_middle_name is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t0.SURNAME)) like ' || v_query_function || '(substr(''' || p_ppqry_middle_name || ''',1,length(trim(t0.SURNAME))))) || ''%''';
          --
          if (p_ppqry_given_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.GIVEN_NAME)) is null or ' || v_query_function || '(t0.GIVEN_NAME)) like ' || v_query_function || '(substr(''' || p_ppqry_given_name || ''',1,length(trim(t0.GIVEN_NAME))))) || ''%'')';
          end if;
          --
          v_result := v_result || '
                          --
                          )';
        end if;
        --
        -- Query parameter change M|S
        if (p_ppqry_middle_name is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t0.SURNAME)) like ' || v_query_function || '(substr(''' || p_ppqry_middle_name || ''',1,length(trim(t0.SURNAME))))) || ''%''';
          --
          if (p_ppqry_surname is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.GIVEN_NAME)) is null or ' || v_query_function || '(t0.GIVEN_NAME)) like ' || v_query_function || '(substr(''' || p_ppqry_surname || ''',1,length(trim(t0.GIVEN_NAME))))) || ''%'')';
          end if;
          --
          v_result := v_result || '
                          --
                          )';
        end if;
        --
        -- Query parameter change G|S
        if (p_ppqry_given_name is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t0.SURNAME)) like ' || v_query_function || '(substr(''' || p_ppqry_given_name || ''',1,length(trim(t0.SURNAME))))) || ''%''';
          --
          if (p_ppqry_surname is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.GIVEN_NAME)) is null or ' || v_query_function || '(t0.GIVEN_NAME)) like ' || v_query_function || '(substr(''' || p_ppqry_surname || ''',1,length(trim(t0.GIVEN_NAME))))) || ''%'')';
          end if;
          --
          v_result := v_result || '
                          --
                          )';
        end if;
        --
        -- Query parameter change G|M
        if (p_ppqry_given_name is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t0.SURNAME)) like ' || v_query_function || '(substr(''' || p_ppqry_given_name || ''',1,length(trim(t0.SURNAME))))) || ''%''';
          --
          if (p_ppqry_middle_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.GIVEN_NAME)) is null or ' || v_query_function || '(t0.GIVEN_NAME)) like ' || v_query_function || '(substr(''' || p_ppqry_middle_name || ''',1,length(trim(t0.GIVEN_NAME))))) || ''%'')';
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
           or p_ppqry_date_of_birth_f.isNull() = 0 -- is not null
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
          if (p_ppqry_date_of_birth_f.isNull() = 0) -- is not null
          then
            if (p_ppqry_date_of_birth_t.isNull() = 0) -- is not null
            then
              v_result := v_result || '
                          --
                          or (t0.DATE_OF_BIRTH_PARTIAL.getYear() between ''' || p_ppqry_date_of_birth_f.getYear() || ''' and ''' || p_ppqry_date_of_birth_t.getYear() || '''
                          --
                          or t0.DATE_OF_BIRTH_PARTIAL.getMonth() between ''' || p_ppqry_date_of_birth_f.getYear() || ''' and ''' || p_ppqry_date_of_birth_t.getMonth() || '''
                          --
                          or t0.DATE_OF_BIRTH_PARTIAL.getDay() between ''' || p_ppqry_date_of_birth_f.getYear() || ''' and ''' || p_ppqry_date_of_birth_t.getDay() || '''
                          )';
            else
                  v_result := v_result || '
                              --
                              or (t0.DATE_OF_BIRTH_PARTIAL.getDay() = ''' || p_ppqry_date_of_birth_f.getDay() || '''
                              or t0.DATE_OF_BIRTH_PARTIAL.getMonth() = ''' || p_ppqry_date_of_birth_f.getMonth() || '''
                              or t0.DATE_OF_BIRTH_PARTIAL.getYear() = ''' || p_ppqry_date_of_birth_f.getYear() || '''
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
        -- Query parameter normal S|M|G
        if (p_ppqry_surname is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t0.SURNAME)) like ' || v_query_function || '(substr(''' || p_ppqry_surname || ''',1,length(trim(t0.SURNAME))))) || ''%''';
          --
          if (p_ppqry_middle_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.MIDDLE_NAME)) is null or ' || v_query_function || '(t0.MIDDLE_NAME)) like ' || v_query_function || '(substr(''' || p_ppqry_middle_name || ''',1,length(trim(t0.MIDDLE_NAME))))) || ''%'')';
          end if;
          --
          if (p_ppqry_given_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.GIVEN_NAME)) is null or ' || v_query_function || '(t0.GIVEN_NAME)) like ' || v_query_function || '(substr(''' || p_ppqry_given_name || ''',1,length(trim(t0.GIVEN_NAME))))) || ''%'')';
          end if;
          --
          v_result := v_result || '
                          --
                          )';
        end if;
        --
        -- Query parameter change S|G|M
        if (p_ppqry_surname is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t0.SURNAME)) like ' || v_query_function || '(substr(''' || p_ppqry_surname || ''',1,length(trim(t0.SURNAME))))) || ''%''';
          --
          if (p_ppqry_given_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.MIDDLE_NAME)) is null or ' || v_query_function || '(t0.MIDDLE_NAME)) like ' || v_query_function || '(substr(''' || p_ppqry_given_name || ''',1,length(trim(t0.MIDDLE_NAME))))) || ''%'')';
          end if;
          --
          if (p_ppqry_middle_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.GIVEN_NAME)) is null or ' || v_query_function || '(t0.GIVEN_NAME)) like ' || v_query_function || '(substr(''' || p_ppqry_middle_name || ''',1,length(trim(t0.GIVEN_NAME))))) || ''%'')';
          end if;
          --
          v_result := v_result || '
                          --
                          )';
        end if;
        --
        -- Query parameter change M|G|S
        if (p_ppqry_middle_name is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t0.SURNAME)) like ' || v_query_function || '(substr(''' || p_ppqry_middle_name || ''',1,length(trim(t0.SURNAME))))) || ''%''';
          --
          if (p_ppqry_given_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.MIDDLE_NAME)) is null or ' || v_query_function || '(t0.MIDDLE_NAME)) like ' || v_query_function || '(substr(''' || p_ppqry_given_name || ''',1,length(trim(t0.MIDDLE_NAME))))) || ''%'')';
          end if;
          --
          if (p_ppqry_surname is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.GIVEN_NAME)) is null or ' || v_query_function || '(t0.GIVEN_NAME)) like ' || v_query_function || '(substr(''' || p_ppqry_surname || ''',1,length(trim(t0.GIVEN_NAME))))) || ''%'')';
          end if;
          --
          v_result := v_result || '
                          --
                          )';
        end if;
        --
        -- Query parameter change M|S|G
        if (p_ppqry_middle_name is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t0.SURNAME)) like ' || v_query_function || '(substr(''' || p_ppqry_middle_name || ''',1,length(trim(t0.SURNAME))))) || ''%''';
          --
          if (p_ppqry_surname is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.MIDDLE_NAME)) is null or ' || v_query_function || '(t0.MIDDLE_NAME)) like ' || v_query_function || '(substr(''' || p_ppqry_surname || ''',1,length(trim(t0.MIDDLE_NAME))))) || ''%'')';
          end if;
          --
          if (p_ppqry_given_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.GIVEN_NAME)) is null or ' || v_query_function || '(t0.GIVEN_NAME)) like ' || v_query_function || '(substr(''' || p_ppqry_given_name || ''',1,length(trim(t0.GIVEN_NAME))))) || ''%'')';
          end if;
          --
          v_result := v_result || '
                          --
                          )';
        end if;
        --
        -- Query parameter change G|S|M
        if (p_ppqry_given_name is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t0.SURNAME)) like ' || v_query_function || '(substr(''' || p_ppqry_given_name || ''',1,length(trim(t0.SURNAME))))) || ''%''';
          --
          if (p_ppqry_surname is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.MIDDLE_NAME)) is null or ' || v_query_function || '(t0.MIDDLE_NAME)) like ' || v_query_function || '(substr(''' || p_ppqry_surname || ''',1,length(trim(t0.MIDDLE_NAME))))) || ''%'')';
          end if;
          --
          if (p_ppqry_middle_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.GIVEN_NAME)) is null or ' || v_query_function || '(t0.GIVEN_NAME)) like ' || v_query_function || '(substr(''' || p_ppqry_middle_name || ''',1,length(trim(t0.GIVEN_NAME))))) || ''%'')';
          end if;
          --
          v_result := v_result || '
                          --
                          )';
        end if;
        --
        -- Query parameter change G|M|S
        if (p_ppqry_given_name is not null)
        then
          v_result := v_result || '
                          --
                          or (' || v_query_function || '(t0.SURNAME)) like ' || v_query_function || '(substr(''' || p_ppqry_given_name || ''',1,length(trim(t0.SURNAME))))) || ''%''';
          --
          if (p_ppqry_middle_name is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.MIDDLE_NAME)) is null or ' || v_query_function || '(t0.MIDDLE_NAME)) like ' || v_query_function || '(substr(''' || p_ppqry_middle_name || ''',1,length(trim(t0.MIDDLE_NAME))))) || ''%'')';
          end if;
          --
          if (p_ppqry_surname is not null)
          then
            v_result := v_result || '
                          --
                          and (' || v_query_function || '(t0.GIVEN_NAME)) is null or ' || v_query_function || '(t0.GIVEN_NAME)) like ' || v_query_function || '(substr(''' || p_ppqry_surname || ''',1,length(trim(t0.GIVEN_NAME))))) || ''%'')';
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
           or p_ppqry_date_of_birth_f.isNull() = 0 -- is not null
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
          if (p_ppqry_date_of_birth_f.isNull() = 0) -- is not null
          then
            if (p_ppqry_date_of_birth_t.isNull() = 0) -- is not null
            then
              v_result := v_result || '
                          --
                          or (t0.DATE_OF_BIRTH_PARTIAL.getYear() between ''' || p_ppqry_date_of_birth_f.getYear() || ''' and ''' || p_ppqry_date_of_birth_t.getYear() || '''
                          --
                          or t0.DATE_OF_BIRTH_PARTIAL.getMonth() between ''' || p_ppqry_date_of_birth_f.getYear() || ''' and ''' || p_ppqry_date_of_birth_t.getMonth() || '''
                          --
                          or t0.DATE_OF_BIRTH_PARTIAL.getDay() between ''' || p_ppqry_date_of_birth_f.getYear() || ''' and ''' || p_ppqry_date_of_birth_t.getDay() || '''
                          )';
            else
                  v_result := v_result || '
                              --
                              or (t0.DATE_OF_BIRTH_PARTIAL.getDay() = ''' || p_ppqry_date_of_birth_f.getDay() || '''
                              or t0.DATE_OF_BIRTH_PARTIAL.getMonth() = ''' || p_ppqry_date_of_birth_f.getMonth() || '''
                              or t0.DATE_OF_BIRTH_PARTIAL.getYear() = ''' || p_ppqry_date_of_birth_f.getYear() || '''
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
  * WWirns    11.12.2018  XX:Remove the usage of the table THAIPASSPORT and use instead the *_THAI-Columns of the table INDENTITIES
  * WWirns    11.12.2018  XX:Remove the queries against any DL_COMMON-Subtables for multilanguage- and displayvalue-support and use only KEY-Value comparsion
  * WWirns    11.12.2018  XX:Change most of the where condition statements
  * WWirns    11.12.2018  XX:Inculde decodation for SEX-Queryvalue because the query values could also be numeric values
  * WWirns    11.01.2019  XX:Remove unneeded IS-NULL case statements inside the resulting SQL
  * WWirns    11.01.2019  XX:Rotate Surname-/Middlename-/Givenname-Paramters
  * WWirns    11.01.2019  XX:Do "order by" only if parameter p_res_max_rows is set
  * WWirns    21.01.2019  XX:Correct output for MIDDLE_NAME-Columns
  * WWirns    21.01.2019  XX:Briefing from Jaroslaw:Do not use *_THAI-Columns for querying
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
    v_qry_date_of_birth_f      DL_BLACKLIST.CT_PARTIAL_DATE := DL_BLACKLIST.CT_PARTIAL_DATE(0,0,0);
    v_qry_date_of_birth_t      DL_BLACKLIST.CT_PARTIAL_DATE := DL_BLACKLIST.CT_PARTIAL_DATE(0,0,0);
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

  v_qry_date_of_birth_f	:=	DL_BLACKLIST.CT_PARTIAL_DATE(0,0,0);
  v_qry_date_of_birth_t :=  DL_BLACKLIST.CT_PARTIAL_DATE(0,0,0);
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
                                            ,t20.DATE_OF_BIRTH_PARTIAL
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
                                            ,DL_BLACKLIST.CT_PARTIAL_DATE(0,0,0)
                                            ,DL_BLACKLIST.CT_PARTIAL_DATE(0,0,0)
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
               ,t10.DATE_OF_BIRTH_PARTIAL
               ,t10.NATIONALITY
               ,t10.NATIONALITY$DV
               ,t10.TDT_DOC_NUMBER
               ,t10.TDT_ISSUING_COUNTRY
               ,t10.TDT_ISSUING_COUNTRY$DV
               ,t10.TDT_DATE_OF_EXPIRY';
    --
    --
    -- MSCORE: Match score
    v_result := v_result || '
               ,greatest(t10.SURNAME$MSCORE4SN,t10.SURNAME$MSCORE4MN,t10.SURNAME$MSCORE4GN) as SURNAME$MSCORE
               ,t10.SURNAME_THAI$MSCORE';
    --
    --
    v_result := v_result || '
               ,greatest(t10.MIDDLE_NAME$MSCORE4MN,t10.MIDDLE_NAME$MSCORE4GN,t10.MIDDLE_NAME$MSCORE4SN) as MIDDLE_NAME$MSCORE
               ,t10.MIDDLE_NAME_THAI$MSCORE';
    --
    --
    v_result := v_result || '
               ,greatest(t10.GIVEN_NAME$MSCORE4GN,t10.GIVEN_NAME$MSCORE4SN,t10.GIVEN_NAME$MSCORE4MN) as GIVEN_NAME$MSCORE
               ,t10.GIVEN_NAME_THAI$MSCORE';
    --
    --
    v_result := v_result || '
               ,t10.SEX$MSCORE
               ,t10.SEX$DV$MSCORE';
    --
    --
    v_result := v_result || '
               ,t10.DATE_OF_BIRTH$MSCORE';
    --
    --
    v_result := v_result || '
               ,t10.NATIONALITY$MSCORE
               ,t10.NATIONALITY$DV$MSCORE';
    --
    --
    v_result := v_result || '
               ,t10.TDT_DOC_NUMBER$MSCORE';
    --
    --
    v_result := v_result || '
               ,t10.TDT_ISSUING_COUNTRY$MSCORE
               ,t10.TDT_ISSUING_COUNTRY$DV$MSCORE';
    --
    --
    v_result := v_result || '
               ,t10.TDT_DATE_OF_EXPIRY$MSCORE';
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
                 select /*+ index(t0 ' || g_lt_idx4travel_docs || ') */ t0.IDENTITY as ID';
        when 'SOUNDEX_TRIM' then
          v_result := v_result || '
                 select /*+ index(t0 ' || g_st_idx4travel_docs || ') */ t0.IDENTITY as ID';
        else
          raise_application_error(-20000
                                 ,'Unknown v_Query_Type4Where[''' || v_query_type4where || ''']!');
      end case;
    else
      v_result := v_result || '
                 select t0.IDENTITY as ID';
    end if;
    --
    --
    v_result := v_result || '
                        ,t0.SURNAME
                        ,null as SURNAME_THAI
                        ,null as MIDDLE_NAME
                        ,null as MIDDLE_NAME_THAI
                        ,t0.GIVEN_NAME
                        ,null as GIVEN_NAME_THAI
                        ,t0.SEX
                        ,null as SEX$DV
                        ,t0.DATE_OF_BIRTH_PARTIAL
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
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.SURNAME))
                                                           ,lower(trim(''' || v_qry_surname || '''))) as SURNAME$MSCORE4SN
                        ,0 as MIDDLE_NAME$MSCORE4SN
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.GIVEN_NAME))
                                                           ,lower(trim(''' || v_qry_surname || '''))) as GIVEN_NAME$MSCORE4SN
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(null))
                                                           ,lower(trim(''' || v_qry_surname || '''))) as SURNAME_THAI$MSCORE';
    else
      v_result := v_result || '
                        ,0 as SURNAME$MSCORE4SN
                        ,0 as MIDDLE_NAME$MSCORE4SN
                        ,0 as GIVEN_NAME$MSCORE4SN
                        ,0 as SURNAME_THAI$MSCORE';
    end if;
    --
    --
    if (v_qry_middle_name is not null)
    then
      v_result := v_result || '
                        ,0 as MIDDLE_NAME$MSCORE4MN
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.GIVEN_NAME))
                                                           ,lower(trim(''' || v_qry_middle_name || '''))) as GIVEN_NAME$MSCORE4MN
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.SURNAME))
                                                           ,lower(trim(''' || v_qry_middle_name || '''))) as SURNAME$MSCORE4MN
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(null))
                                                           ,lower(trim(''' || v_qry_middle_name || '''))) as MIDDLE_NAME_THAI$MSCORE';
    else
      v_result := v_result || '
                        ,0 as MIDDLE_NAME$MSCORE4MN
                        ,0 as GIVEN_NAME$MSCORE4MN
                        ,0 as SURNAME$MSCORE4MN
                        ,0 as MIDDLE_NAME_THAI$MSCORE';
    end if;
    --
    --
    if (v_qry_given_name is not null)
    then
      v_result := v_result || '
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.GIVEN_NAME))
                                                           ,lower(trim(''' || v_qry_given_name || '''))) as GIVEN_NAME$MSCORE4GN
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.SURNAME))
                                                           ,lower(trim(''' || v_qry_given_name || '''))) as SURNAME$MSCORE4GN
                        ,0 as MIDDLE_NAME$MSCORE4GN
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(null))
                                                           ,lower(trim(''' || v_qry_given_name || '''))) as GIVEN_NAME_THAI$MSCORE';
    else
      v_result := v_result || '
                        ,0 as GIVEN_NAME$MSCORE4GN
                        ,0 as SURNAME$MSCORE4GN
                        ,0 as MIDDLE_NAME$MSCORE4GN
                        ,0 as GIVEN_NAME_THAI$MSCORE';
    end if;
    --
    --
    if (v_qry_sex is not null)
    then
      v_result := v_result || '
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(t0.SEX
                                                           ,decode(''' || v_qry_sex || ''',''1'',''M'',''2'',''F'',''0'',''X'',''' || v_qry_sex || ''')) as SEX$MSCORE
                        ,nvl(null
                            ,0) as SEX$DV$MSCORE';
    else
      v_result := v_result || '
                        ,0 as SEX$MSCORE
                        ,0 as SEX$DV$MSCORE';
    end if;
    --
    --
    if v_qry_date_of_birth_f.isNull() = 0 -- is not null
    then
      if v_qry_date_of_birth_t.isNull() = 0 -- is not null
      then
        v_result := v_result || '
                        ,case
                          when (t0.DATE_OF_BIRTH_PARTIAL.getYear() between ''' || v_qry_date_of_birth_f.getYear() || ''' and ''' || v_qry_date_of_birth_t.getYear() || '''
                          --
                          or t0.DATE_OF_BIRTH_PARTIAL.getMonth() between ''' || v_qry_date_of_birth_f.getYear() || ''' and ''' || v_qry_date_of_birth_t.getMonth() || '''
                          --
                          or t0.DATE_OF_BIRTH_PARTIAL.getDay() between ''' || v_qry_date_of_birth_f.getYear() || ''' and ''' || v_qry_date_of_birth_t.getDay() || ''' ) then
                            100
                           else
                            0
                         end as DATE_OF_BIRTH$MSCORE';

      else
        v_result := v_result || '
                        ,case
                           when (t0.DATE_OF_BIRTH_PARTIAL.getDay() = ''' || v_qry_date_of_birth_f.getDay() || '''
                              or t0.DATE_OF_BIRTH_PARTIAL.getMonth() = ''' || v_qry_date_of_birth_f.getMonth() || '''
                              or t0.DATE_OF_BIRTH_PARTIAL.getYear() = ''' || v_qry_date_of_birth_f.getYear() || ''') then
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
                        ,decode(t0.ISSUING_COUNTRY,''' || v_qry_nationality || ''',100,0) as NATIONALITY$MSCORE
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
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.DOC_NUMBER))
                                                           ,lower(trim(''' || v_qry_tdt_doc_number || '''))) as TDT_DOC_NUMBER$MSCORE';
    else
      v_result := v_result || '
                        ,0 as TDT_DOC_NUMBER$MSCORE';
    end if;
    --
    --
    if (v_qry_tdt_issuing_country is not null)
    then
      v_result := v_result || '
                        ,decode(t0.ISSUING_COUNTRY,''' || v_qry_tdt_issuing_country || ''',100,0) as TDT_ISSUING_COUNTRY$MSCORE
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
    v_result := v_result || '
                   from DL_BLACKLIST.TRAVEL_DOCS t0';
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
    v_result := v_result || '
                        ,t0.SURNAME
                        ,t0.SURNAME_THAI as SURNAME_THAI
                        ,t0.MIDDLE_NAME
                        ,t0.MIDDLENAME_THAI as MIDDLE_NAME_THAI
                        ,t0.GIVEN_NAME
                        ,t0.GIVENNAME_THAI as GIVEN_NAME_THAI
                        ,t0.SEX
                        ,null as SEX$DV
                        ,t0.DATE_OF_BIRTH_PARTIAL
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
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.SURNAME))
                                                           ,lower(trim(''' || v_qry_surname || '''))) as SURNAME$MSCORE4SN
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.MIDDLE_NAME))
                                                           ,lower(trim(''' || v_qry_surname || '''))) as MIDDLE_NAME$MSCORE4SN
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.GIVEN_NAME))
                                                           ,lower(trim(''' || v_qry_surname || '''))) as GIVEN_NAME$MSCORE4SN
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.SURNAME_THAI))
                                                           ,lower(trim(''' || v_qry_surname || '''))) as SURNAME_THAI$MSCORE';
    else
      v_result := v_result || '
                        ,0 as SURNAME$MSCORE4SN
                        ,0 as MIDDLE_NAME$MSCORE4SN
                        ,0 as GIVEN_NAME$MSCORE4SN
                        ,0 as SURNAME_THAI$MSCORE';
    end if;
    --
    --
    if (v_qry_middle_name is not null)
    then
      v_result := v_result || '
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.MIDDLE_NAME))
                                                           ,lower(trim(''' || v_qry_middle_name || '''))) as MIDDLE_NAME$MSCORE4MN
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.GIVEN_NAME))
                                                           ,lower(trim(''' || v_qry_middle_name || '''))) as GIVEN_NAME$MSCORE4MN
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.SURNAME))
                                                           ,lower(trim(''' || v_qry_middle_name || '''))) as SURNAME$MSCORE4MN
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.MIDDLENAME_THAI))
                                                           ,lower(trim(''' || v_qry_middle_name || '''))) as MIDDLE_NAME_THAI$MSCORE';
    else
      v_result := v_result || '
                        ,0 as MIDDLE_NAME$MSCORE4MN
                        ,0 as GIVEN_NAME$MSCORE4MN
                        ,0 as SURNAME$MSCORE4MN
                        ,0 as MIDDLE_NAME_THAI$MSCORE';
    end if;
    --
    --
    if (v_qry_given_name is not null)
    then
      v_result := v_result || '
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.GIVEN_NAME))
                                                           ,lower(trim(''' || v_qry_given_name || '''))) as GIVEN_NAME$MSCORE4GN
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.SURNAME))
                                                           ,lower(trim(''' || v_qry_given_name || '''))) as SURNAME$MSCORE4GN
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.MIDDLE_NAME))
                                                           ,lower(trim(''' || v_qry_given_name || '''))) as MIDDLE_NAME$MSCORE4GN
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(lower(trim(t0.GIVENNAME_THAI))
                                                           ,lower(trim(''' || v_qry_given_name || '''))) as GIVEN_NAME_THAI$MSCORE';
    else
      v_result := v_result || '
                        ,0 as GIVEN_NAME$MSCORE4GN
                        ,0 as SURNAME$MSCORE4GN
                        ,0 as MIDDLE_NAME$MSCORE4GN
                        ,0 as GIVEN_NAME_THAI$MSCORE';
    end if;
    --
    --
    if (v_qry_sex is not null)
    then
      v_result := v_result || '
                        ,UTL_MATCH.' || v_res_mscore_algorithm || '_SIMILARITY(t0.SEX
                                                           ,decode(''' || v_qry_sex || ''',''1'',''M'',''2'',''F'',''0'',''X'',''' || v_qry_sex || ''')) as SEX$MSCORE
                        ,nvl(null
                            ,0) as SEX$DV$MSCORE';
    else
      v_result := v_result || '
                        ,0 as SEX$MSCORE
                        ,0 as SEX$DV$MSCORE';
    end if;
    --
    --
    if v_qry_date_of_birth_f.isNull() = 0 -- is not null
    then
      if v_qry_date_of_birth_t.isNull() = 0 -- is not null
      then
        v_result := v_result || '
                        ,case
                           when (t0.DATE_OF_BIRTH_PARTIAL.getYear() between ''' || v_qry_date_of_birth_f.getYear() || ''' and ''' || v_qry_date_of_birth_t.getYear() || '''
                          --
                          or t0.DATE_OF_BIRTH_PARTIAL.getMonth() between ''' || v_qry_date_of_birth_f.getYear() || ''' and ''' || v_qry_date_of_birth_t.getMonth() || '''
                          --
                          or t0.DATE_OF_BIRTH_PARTIAL.getDay() between ''' || v_qry_date_of_birth_f.getYear() || ''' and ''' || v_qry_date_of_birth_t.getDay() || ''' ) then
                            100
                           else
                            0
                         end as DATE_OF_BIRTH$MSCORE';
      else
        v_result := v_result || '
                        ,case
                           when (t0.DATE_OF_BIRTH_PARTIAL.getDay() = ''' || v_qry_date_of_birth_f.getDay() || '''
                              or t0.DATE_OF_BIRTH_PARTIAL.getMonth() = ''' || v_qry_date_of_birth_f.getMonth() || '''
                              or t0.DATE_OF_BIRTH_PARTIAL.getYear() = ''' || v_qry_date_of_birth_f.getYear() || ''') then
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
                        ,decode(t0.NATIONALITY,''' || v_qry_nationality || ''',100,0) as NATIONALITY$MSCORE
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
    if (p_res_max_rows is not null)
    then
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
       /* return searchsimple$sta(p_qry_surname
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
        */
        NULL;
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
                                         ,key 'dateOfBirth' value t.blt_search_result.date_of_birth.getFormatData('YYYY-MM-DD')
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
                                         ,key 'dateOfBirthFromQueryValue' value t.blt_search_result.date_of_birth_f$qry.getFormatData('YYYY-MM-DD')
                                         ,key 'dateOfBirthToQueryValue' value t.blt_search_result.date_of_birth_t$qry.getFormatData('YYYY-MM-DD')
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
                                         ,key 'dateOfBirth' value t.blt_search_result.date_of_birth.getFormatData('YYYY-MM-DD')
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
    v_qry_date_of_birth_f      DL_BLACKLIST.CT_PARTIAL_DATE ;
    v_qry_date_of_birth_t      DL_BLACKLIST.CT_PARTIAL_DATE ;
    v_qry_tdt_date_of_expiry_f date;
    v_qry_tdt_date_of_expiry_t date;
    v_vc_tmp                   varchar2(32767 char);
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
    for R0 in (select DL_BLACKLIST.OT_BLT_SEARCH_RESULT_EXT(t20.ID
                                                           ,t20.SURNAME
                                                           ,t20.SURNAME_THAI
                                                           ,t20.MIDDLE_NAME
                                                           ,t20.MIDDLE_NAME_THAI
                                                           ,t20.GIVEN_NAME
                                                           ,t20.GIVEN_NAME_THAI
                                                           ,t20.SEX
                                                           ,t20.SEX$DV
                                                           ,t20.DATE_OF_BIRTH_PARTIAL
                                                           ,t20.NATIONALITY
                                                           ,t20.NATIONALITY$DV
                                                           ,t20.TDT_DOC_NUMBER
                                                           ,t20.TDT_ISSUING_COUNTRY
                                                           ,t20.TDT_ISSUING_COUNTRY$DV
                                                           ,t20.TDT_DATE_OF_EXPIRY
                                                           ,DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                                                           ,rownum
                                                           ,count(*) over()
                                                           ,p_qry_surname
                                                           ,t20.SURNAME$MSCORE
                                                           ,t20.SURNAME_THAI$MSCORE
                                                           ,p_qry_middle_name
                                                           ,t20.MIDDLE_NAME$MSCORE
                                                           ,t20.MIDDLE_NAME_THAI$MSCORE
                                                           ,p_qry_given_name
                                                           ,t20.GIVEN_NAME$MSCORE
                                                           ,t20.GIVEN_NAME_THAI$MSCORE
                                                           ,p_qry_sex
                                                           ,t20.SEX$MSCORE
                                                           ,t20.SEX$DV$MSCORE
                                                           ,v_qry_date_of_birth_f
                                                           ,v_qry_date_of_birth_t
                                                           ,t20.DATE_OF_BIRTH$MSCORE
                                                           ,p_qry_nationality
                                                           ,t20.NATIONALITY$MSCORE
                                                           ,t20.NATIONALITY$DV$MSCORE
                                                           ,p_qry_tdt_doc_number
                                                           ,t20.TDT_DOC_NUMBER$MSCORE
                                                           ,p_qry_tdt_issuing_country
                                                           ,t20.TDT_ISSUING_COUNTRY$MSCORE
                                                           ,t20.TDT_ISSUING_COUNTRY$DV$MSCORE
                                                           ,to_date(to_char(v_qry_tdt_date_of_expiry_f
                                                                           ,'RRRRMMDD')
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
                              ,t10.DATE_OF_BIRTH_PARTIAL
                              ,t10.NATIONALITY
                              ,t10.NATIONALITY$DV
                              ,t10.TDT_DOC_NUMBER
                              ,t10.TDT_ISSUING_COUNTRY
                              ,t10.TDT_ISSUING_COUNTRY$DV
                              ,t10.TDT_DATE_OF_EXPIRY
                              ,greatest(t10.SURNAME$MSCORE4SN
                                       ,t10.SURNAME$MSCORE4MN
                                       ,t10.SURNAME$MSCORE4GN) as SURNAME$MSCORE
                              ,t10.SURNAME_THAI$MSCORE
                              ,greatest(t10.MIDDLE_NAME$MSCORE4MN
                                       ,t10.MIDDLE_NAME$MSCORE4GN
                                       ,t10.MIDDLE_NAME$MSCORE4SN) as MIDDLE_NAME$MSCORE
                              ,t10.MIDDLE_NAME_THAI$MSCORE
                              ,greatest(t10.GIVEN_NAME$MSCORE4GN
                                       ,t10.GIVEN_NAME$MSCORE4SN
                                       ,t10.GIVEN_NAME$MSCORE4MN) as GIVEN_NAME$MSCORE
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
                                 -- Travel documents
                                 select t0.IDENTITY as ID
                                        ,t0.SURNAME
                                        ,null as SURNAME_THAI
                                        ,null as MIDDLE_NAME
                                        ,null as MIDDLE_NAME_THAI
                                        ,t0.GIVEN_NAME
                                        ,null as GIVEN_NAME_THAI
                                        ,t0.SEX
                                        ,null as SEX$DV
                                        ,t0.DATE_OF_BIRTH_PARTIAL
                                        ,t0.NATIONALITY
                                        ,null as NATIONALITY$DV
                                        ,t0.DOC_NUMBER as TDT_DOC_NUMBER
                                        ,t0.ISSUING_COUNTRY as TDT_ISSUING_COUNTRY
                                        ,null as TDT_ISSUING_COUNTRY$DV
                                        ,t0.DATE_OF_EXPIRY$VC as TDT_DATE_OF_EXPIRY
                                        ,UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.SURNAME))
                                                                           ,lower(trim(p_qry_surname))) as SURNAME$MSCORE4SN
                                        ,UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.MIDDLE_NAME))
                                                                           ,lower(trim(p_qry_surname))) as MIDDLE_NAME$MSCORE4SN
                                        ,UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.GIVEN_NAME))
                                                                           ,lower(trim(p_qry_surname))) as GIVEN_NAME$MSCORE4SN
                                        ,0 as SURNAME_THAI$MSCORE
                                        ,UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.MIDDLE_NAME))
                                                                          ,lower(trim(p_qry_middle_name))) as MIDDLE_NAME$MSCORE4MN
                                        ,UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.GIVEN_NAME))
                                                                           ,lower(trim(p_qry_middle_name))) as GIVEN_NAME$MSCORE4MN
                                        ,UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.SURNAME))
                                                                           ,lower(trim(p_qry_middle_name))) as SURNAME$MSCORE4MN
                                        ,0 as MIDDLE_NAME_THAI$MSCORE
                                        ,UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.GIVEN_NAME))
                                                                           ,lower(trim(p_qry_given_name))) as GIVEN_NAME$MSCORE4GN
                                        ,UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.SURNAME))
                                                                           ,lower(trim(p_qry_given_name))) as SURNAME$MSCORE4GN
                                        ,UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.MIDDLE_NAME))
                                                                           ,lower(trim(p_qry_given_name))) as MIDDLE_NAME$MSCORE4GN
                                        ,0 as GIVEN_NAME_THAI$MSCORE
                                        ,decode(t0.SEX
                                               ,decode(p_qry_sex
                                                      ,'1'
                                                      ,'M'
                                                      ,'2'
                                                      ,'F'
                                                      ,'0'
                                                      ,'X'
                                                      ,p_qry_sex)
                                               ,100
                                               ,0) as SEX$MSCORE
                                        ,nvl(null
                                            ,0) as SEX$DV$MSCORE
                                        ,case
                                           when (t0.DATE_OF_BIRTH_PARTIAL.getDay() = v_qry_date_of_birth_f.getDay()
                                              or t0.DATE_OF_BIRTH_PARTIAL.getMonth() = v_qry_date_of_birth_f.getMonth()
                                              or t0.DATE_OF_BIRTH_PARTIAL.getYear() = v_qry_date_of_birth_f.getYear()) then
                                            100
                                           else
                                            0
                                         end as DATE_OF_BIRTH$MSCORE
                                        ,decode(t0.NATIONALITY
                                               ,p_qry_nationality
                                               ,100
                                               ,0) as NATIONALITY$MSCORE
                                        ,nvl(null
                                            ,0) as NATIONALITY$DV$MSCORE
                                        ,decode(t0.DOC_NUMBER
                                               ,p_qry_tdt_doc_number
                                               ,100
                                               ,0) as TDT_DOC_NUMBER$MSCORE
                                        ,decode(t0.ISSUING_COUNTRY
                                               ,p_qry_tdt_issuing_country
                                               ,100
                                               ,0) as TDT_ISSUING_COUNTRY$MSCORE
                                        ,nvl(null
                                            ,0) as TDT_ISSUING_COUNTRY$DV$MSCORE
                                        ,case
                                           when (t0.DATE_OF_EXPIRY$VC = to_char(v_qry_tdt_date_of_expiry_f
                                                                               ,'RRMMDD') or trunc(t0.DATE_OF_EXPIRY) = to_date(to_char(v_qry_tdt_date_of_expiry_f
                                                                                                                                        ,'RRRRMMDD')
                                                                                                                                ,'RRRRMMDD')) then
                                            100
                                           else
                                            0
                                         end as TDT_DATE_OF_EXPIRY$MSCORE
                                   from DL_BLACKLIST.TRAVEL_DOCS t0
                                   where (
                                         t0.NATIONALITY = p_qry_nationality
                                         --
                                         and
                                         (

                                           ((p_qry_surname is not null and lower(trim(t0.SURNAME)) like lower(trim(substr(p_qry_surname
                                                                                                ,1
                                                                                                ,length(trim(t0.SURNAME))))) || '%')
                                                --
                                               or (p_qry_middle_name is not null and lower(trim(t0.SURNAME)) like lower(trim(substr(p_qry_middle_name
                                                                                              ,1
                                                                                               ,length(trim(t0.SURNAME))))) || '%')
                                               --
                                               or (p_qry_given_name is not null and lower(trim(t0.SURNAME)) like lower(trim(substr(p_qry_given_name
                                                                                               ,1
                                                                                               ,length(trim(t0.SURNAME))))) || '%')
                                               --
                                             )
                                              --
                                               or

                                             (
                                                (p_qry_surname is not null and lower(trim(t0.MIDDLE_NAME)) like lower(trim(substr(p_qry_surname
                                                                                          ,1
                                                                                          ,length(trim(t0.MIDDLE_NAME))))) || '%')
                                                --
                                                or (p_qry_middle_name is not null and lower(trim(t0.MIDDLE_NAME)) like lower(trim(substr(p_qry_middle_name
                                                                                         ,1
                                                                                         ,length(trim(t0.MIDDLE_NAME))))) || '%')
                                                --
                                                or (p_qry_given_name is not null and lower(trim(t0.MIDDLE_NAME)) like lower(trim(substr(p_qry_given_name
                                                                                         ,1
                                                                                         ,length(trim(t0.MIDDLE_NAME))))) || '%')
                                                --
                                            )
                                            --
                                            or

                                            (
                                                (p_qry_surname is not null and lower(trim(t0.GIVEN_NAME)) like lower(trim(substr(p_qry_surname
                                                                                            ,1
                                                                                            ,length(trim(t0.GIVEN_NAME))))) || '%')
                                                --
                                                or (p_qry_middle_name is not null and lower(trim(t0.GIVEN_NAME)) like lower(trim(substr(p_qry_middle_name
                                                                                           ,1
                                                                                          ,length(trim(t0.GIVEN_NAME))))) || '%')
                                                --
                                                or  (p_qry_given_name is not null and lower(trim(t0.GIVEN_NAME)) like lower(trim(substr(p_qry_given_name
                                                                                           ,1
                                                                                           ,length(trim(t0.GIVEN_NAME))))) || '%')
                                               --
                                            )
                                         )
                                         )
                                         -- End:Match by demographic data
                                         --
                                         -- Begin:Match by travel document data, block exists only if DOC_NUMBER is queried
                                         --
                                         or
                                         (
                                          --
                                           lower(trim(t0.DOC_NUMBER)) = lower(trim(p_qry_tdt_doc_number))
                                          --
                                           and t0.ISSUING_COUNTRY = p_qry_tdt_issuing_country
                                          --
                                         )
                                 -- End:Match by travel document data, block exists only if DOC_NUMBER is queried
                                 --
                                 union all
                                 --
                                 -- Identities
                                 select t0.KEY_VALUE as ID
                                        ,t0.SURNAME
                                        ,t0.SURNAME_THAI as SURNAME_THAI
                                        ,t0.MIDDLE_NAME
                                        ,t0.MIDDLENAME_THAI as MIDDLE_NAME_THAI
                                        ,t0.GIVEN_NAME
                                        ,t0.GIVENNAME_THAI as GIVEN_NAME_THAI
                                        ,t0.SEX
                                        ,null as SEX$DV
                                        ,t0.DATE_OF_BIRTH_PARTIAL
                                        ,t0.NATIONALITY
                                        ,null as NATIONALITY$DV
                                        ,null as TDT_DOC_NUMBER
                                        ,null as TDT_ISSUING_COUNTRY
                                        ,null as TDT_ISSUING_COUNTRY$DV
                                        ,null as TDT_DATE_OF_EXPIRY
                                        ,UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.SURNAME))
                                                                           ,lower(trim(p_qry_surname))) as SURNAME$MSCORE4SN
                                        ,UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.MIDDLE_NAME))
                                                                           ,lower(trim(p_qry_surname))) as MIDDLE_NAME$MSCORE4SN
                                        ,UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.GIVEN_NAME))
                                                                           ,lower(trim(p_qry_surname))) as GIVEN_NAME$MSCORE4SN
                                        ,0 as SURNAME_THAI$MSCORE
                                        ,UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.MIDDLE_NAME))
                                                                           ,lower(trim(p_qry_middle_name))) as MIDDLE_NAME$MSCORE4MN
                                        ,UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.GIVEN_NAME))
                                                                           ,lower(trim(p_qry_middle_name))) as GIVEN_NAME$MSCORE4MN
                                        ,UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.SURNAME))
                                                                           ,lower(trim(p_qry_middle_name))) as SURNAME$MSCORE4MN
                                        ,0 as MIDDLE_NAME_THAI$MSCORE
                                        ,UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.GIVEN_NAME))
                                                                           ,lower(trim(p_qry_given_name))) as GIVEN_NAME$MSCORE4GN
                                        ,UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.SURNAME))
                                                                           ,lower(trim(p_qry_given_name))) as SURNAME$MSCORE4GN
                                        ,UTL_MATCH.EDIT_DISTANCE_SIMILARITY(lower(trim(t0.MIDDLE_NAME))
                                                                           ,lower(trim(p_qry_given_name))) as MIDDLE_NAME$MSCORE4GN
                                        ,0 as GIVEN_NAME_THAI$MSCORE
                                        ,decode(t0.SEX
                                               ,decode(p_qry_sex
                                                      ,'1'
                                                      ,'M'
                                                      ,'2'
                                                      ,'F'
                                                      ,'0'
                                                      ,'X'
                                                      ,p_qry_sex)
                                               ,100
                                               ,0) as SEX$MSCORE
                                        ,nvl(null
                                            ,0) as SEX$DV$MSCORE
                                        ,case
                                           when (t0.DATE_OF_BIRTH_PARTIAL.getDay() = v_qry_date_of_birth_f.getDay()
                                              or t0.DATE_OF_BIRTH_PARTIAL.getMonth() = v_qry_date_of_birth_f.getMonth()
                                              or t0.DATE_OF_BIRTH_PARTIAL.getYear() = v_qry_date_of_birth_f.getYear()) then
                                            100
                                           else
                                            0
                                         end as DATE_OF_BIRTH$MSCORE
                                               ,decode(t0.NATIONALITY
                                               ,p_qry_nationality
                                               ,100
                                               ,0) as NATIONALITY$MSCORE
                                        ,nvl(null
                                            ,0) as NATIONALITY$DV$MSCORE
                                        ,0 as TDT_DOC_NUMBER$MSCORE
                                        ,0 as TDT_ISSUING_COUNTRY$MSCORE
                                        ,0 as TDT_ISSUING_COUNTRY$DV$MSCORE
                                        ,0 as TDT_DATE_OF_EXPIRY$MSCORE
                                   from DL_BLACKLIST.IDENTITIES t0
                                   where (
                                         t0.NATIONALITY = p_qry_nationality
                                         --
                                         and
                                         (

                                           ((p_qry_surname is not null and lower(trim(t0.SURNAME)) like lower(trim(substr(p_qry_surname
                                                                                                ,1
                                                                                                ,length(trim(t0.SURNAME))))) || '%')
                                                --
                                               or (p_qry_middle_name is not null and lower(trim(t0.SURNAME)) like lower(trim(substr(p_qry_middle_name
                                                                                              ,1
                                                                                               ,length(trim(t0.SURNAME))))) || '%')
                                               --
                                               or (p_qry_given_name is not null and lower(trim(t0.SURNAME)) like lower(trim(substr(p_qry_given_name
                                                                                               ,1
                                                                                               ,length(trim(t0.SURNAME))))) || '%')
                                               --
                                             )
                                              --
                                               or

                                             (
                                                (p_qry_surname is not null and lower(trim(t0.MIDDLE_NAME)) like lower(trim(substr(p_qry_surname
                                                                                          ,1
                                                                                          ,length(trim(t0.MIDDLE_NAME))))) || '%')
                                                --
                                                or (p_qry_middle_name is not null and lower(trim(t0.MIDDLE_NAME)) like lower(trim(substr(p_qry_middle_name
                                                                                         ,1
                                                                                         ,length(trim(t0.MIDDLE_NAME))))) || '%')
                                                --
                                                or (p_qry_given_name is not null and lower(trim(t0.MIDDLE_NAME)) like lower(trim(substr(p_qry_given_name
                                                                                         ,1
                                                                                         ,length(trim(t0.MIDDLE_NAME))))) || '%')
                                                --
                                            )
                                            --
                                            or

                                            (
                                                (p_qry_surname is not null and lower(trim(t0.GIVEN_NAME)) like lower(trim(substr(p_qry_surname
                                                                                            ,1
                                                                                            ,length(trim(t0.GIVEN_NAME))))) || '%')
                                                --
                                                or (p_qry_middle_name is not null and lower(trim(t0.GIVEN_NAME)) like lower(trim(substr(p_qry_middle_name
                                                                                           ,1
                                                                                          ,length(trim(t0.GIVEN_NAME))))) || '%')
                                                --
                                                or  (p_qry_given_name is not null and lower(trim(t0.GIVEN_NAME)) like lower(trim(substr(p_qry_given_name
                                                                                           ,1
                                                                                           ,length(trim(t0.GIVEN_NAME))))) || '%')
                                               --
                                            )
                                         )
                                         )
                                ) t10
                        order by SURNAME$MSCORE + MIDDLE_NAME$MSCORE + GIVEN_NAME$MSCORE + SEX$MSCORE + DATE_OF_BIRTH$MSCORE + NATIONALITY$MSCORE + TDT_DOC_NUMBER$MSCORE + TDT_ISSUING_COUNTRY$MSCORE + TDT_DATE_OF_EXPIRY$MSCORE desc nulls last
                       --
                       ) t20
                where rownum <= nvl(p_res_max_rows
                                   ,10000))
    loop
      pipe row(R0.BLT_SEARCH_RESULT);
    end loop;
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
  * WWirns    18.04.2018  SearchCandidates$JSONCopy of CABIS.PKG_BLACKLIST
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
                                       ,key 'dateOfBirth' value t.blt_search_result.date_of_birth.getFormatData('YYYY-MM-DD')
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
                                       ,key 'dateOfBirthFromQueryValue' value t.blt_search_result.date_of_birth_f$qry.getFormatData('YYYY-MM-DD')
                                       ,key 'dateOfBirthToQueryValue' value t.blt_search_result.date_of_birth_t$qry.getFormatData('YYYY-MM-DD')
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
                                       ,key 'dateOfBirth' value t.blt_search_result.date_of_birth.getFormatData('YYYY-MM-DD')
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
  * MSCS      14.02.2019  SearchBLDemographic$pl created
  *******************************************************************************/
  --
  function SearchBLDemographic$pl(p_MVMNTID       in varchar2
                                 ,p_NATIONALITY   in varchar2
                                 ,p_DOCNO         in varchar2
                                 ,p_ID_CARD       in varchar2
                                 ,p_DOB           in varchar2
                                 ,p_SEX           in varchar2
                                 ,p_GIVENNAME     in varchar2
                                 ,p_MIDDLENAME    in varchar2
                                 ,p_SURNAME       in varchar2
                                 ,p_GIVENNAME_TH  in varchar2 default null
                                 ,p_MIDDLENAME_TH in varchar2 default null
                                 ,p_SURNAME_TH    in varchar2 default null
                                 ,p_PIBICSPRDCONN in varchar2 default null
                                  --
                                 ) return tt_blt_search_result
    pipelined is
    --
    v_nationcd      varchar2(32 char);
    v_wlcd          DL_BLACKLIST.TT_VARCHAR2 := DL_BLACKLIST.TT_VARCHAR2(); -- watchlist code
    --
    v_c0            sys_refcursor;
    v_r0            ot_blt_search_result;
    v_sql           clob;
    v_sqlcode       number;
    v_sqlerrm       varchar2(32767);
    --
    v_count_biowl number;
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
    -- get pibics nationcd
    -- p_NATIONALITY: THA; v_nationcd: T03;
    begin
        select countcd 
        into v_nationcd 
        from pibicsdm2.country 
        where abbcount = p_NATIONALITY 
        and actflag = 'Y';
    exception
        when no_data_found then
            begin
                -- for cases like GERMANY:DEU(PIB):D(ICAO)
                select notice$dlc
                into v_nationcd 
                from dl_common.icao_doc_codes$lc 
                where key_value = p_NATIONALITY
                and is_active = 'Y' 
                and notice$dlc is not null;
            exception
                when no_data_found then
                    v_nationcd := p_NATIONALITY;
            end;
    end;
    --
    --
    -- try pibics watchlist
    pibicsdm2.p_chk_blacklist
    (
        P_MOVEMENTID    => p_MVMNTID,
        P_NATIONCD      => v_nationcd,
        P_PASSNO        => p_DOCNO,
        P_IDCard        => p_ID_CARD,
        P_BIRTHDTE      => p_DOB, --TO_CHAR(TO_DATE(p_DOB, 'YYYY-MM-DD'), 'DD/MM/YYYY'),
        P_SEX           => p_SEX,
        P_EFIRSTNM      => p_GIVENNAME,
        P_EMIDDLENMN    => p_MIDDLENAME,
        P_EFAMILYNM     => p_SURNAME,
        P_TFIRSTNM      => p_GIVENNAME_TH,
        P_TMIDDLENMN    => p_MIDDLENAME_TH,
        P_TFAMILYNM     => p_SURNAME_TH,
        P_PIBICSPRDCONN => TO_NUMBER(NVL(TRIM(P_PIBICSPRDCONN), 0)),
        P_WLCD          => v_wlcd
    );
    --
    --
    if v_wlcd is not null and v_wlcd.COUNT > 0 then
    
        for i in (select COLUMN_VALUE AS WLCD from TABLE(v_wlcd) where COLUMN_VALUE is not null) loop
            select count(*) into v_count_biowl from DL_BLACKLIST.BLACKLIST_CASES where CASE_NUMBER = i.WLCD;
            if v_count_biowl = 0 then
                begin
                    DL_STAGING4PIBICS_INTF.KEEP_CURRENT_BY_WLCD(P_WLCD => i.WLCD);
                end;
            end if;
        end loop;
        --
        /*
        example query:
        
        select 
            DL_BLACKLIST.OT_BLT_SEARCH_RESULT_EXT
            (
                b.IDENTITY                                  -- ID
                ,c.SURNAME                                  -- SURNAME
                ,c.SURNAME_THAI                             -- SURNAME_THAI
                ,c.MIDDLE_NAME                              -- MIDDLE_NAME
                ,c.MIDDLENAME_THAI                          -- MIDDLE_NAME_THAI
                ,c.GIVEN_NAME                               -- GIVEN_NAME
                ,c.GIVENNAME_THAI                           -- GIVEN_NAME_THAI
                ,c.SEX                                      -- SEX
                ,c.SEX                                      -- SEX$DV
                --,c.DATE_OF_BIRTH                            -- DATE_OF_BIRTH
                ,c.DATE_OF_BIRTH_PARTIAL                    -- DATE_OF_BIRTH
                ,c.NATIONALITY                              -- NATIONALITY
                ,c.NATIONALITY                              -- NATIONALITY$DV
                ,d.DOC_NUMBER                               -- TDT_DOC_NUMBER
                ,d.ISSUING_COUNTRY                          -- TDT_ISSUING_COUNTRY
                ,d.ISSUING_COUNTRY                          -- TDT_ISSUING_COUNTRY$DV
                ,d.DATE_OF_EXPIRY                           -- TDT_DATE_OF_EXPIRY
                ,DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()  -- LOCALE
                ,rownum                                     -- ROW_NUM
                ,count(*) over()                            -- ROW_CNT
                ,c.SURNAME                                  -- SURNAME$QRY
                ,100                                        -- SURNAME$MSCORE
                ,100                                        -- SURNAME_THAI$MSCORE
                ,c.MIDDLE_NAME                              -- MIDDLE_NAME$QRY
                ,100                                        -- MIDDLE_NAME$MSCORE
                ,100                                        -- MIDDLE_NAME_THAI$MSCORE
                ,c.GIVEN_NAME                               -- GIVEN_NAME$QRY
                ,100                                        -- GIVEN_NAME$MSCORE
                ,100                                        -- GIVEN_NAME_THAI$MSCORE
                ,c.SEX                                      -- SEX$QRY
                ,100                                        -- SEX$MSCORE
                ,100                                        -- SEX$DV$MSCORE
                --,d.DATE_OF_BIRTH                            -- DATE_OF_BIRTH_F$QRY
                ,d.DATE_OF_BIRTH_PARTIAL                    -- DATE_OF_BIRTH_F$QRY
                --,d.DATE_OF_BIRTH                            -- DATE_OF_BIRTH_T$QRY
                ,d.DATE_OF_BIRTH_PARTIAL                    -- DATE_OF_BIRTH_T$QRY
                ,100                                        -- DATE_OF_BIRTH$MSCORE
                ,d.NATIONALITY                              -- NATIONALITY$QRY
                ,100                                        -- NATIONALITY$MSCORE
                ,100                                        -- NATIONALITY$DV$MSCORE
                ,d.DOC_NUMBER                               -- TDT_DOC_NUMBER$QRY
                ,100                                        -- TDT_DOC_NUMBER$MSCORE
                ,d.ISSUING_COUNTRY                          -- TDT_ISSUING_COUNTRY$QRY
                ,100                                        -- TDT_ISSUING_COUNTRY$MSCORE
                ,100                                        -- TDT_ISSUING_COUNTRY$DV$MSCORE
                ,d.DATE_OF_EXPIRY                           -- TDT_DATE_OF_EXPIRY_F$QRY
                ,d.DATE_OF_EXPIRY                           -- TDT_DATE_OF_EXPIRY_T$QRY
                ,100                                        -- TDT_DATE_OF_EXPIRY$MSCORE
            ) 
        from DL_BLACKLIST.BLACKLIST_CASES a
        inner join DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES b on a.ID = b.BLACKLIST_CASE
        inner join DL_BLACKLIST.IDENTITIES c on b.IDENTITY = c.KEY_VALUE
        left join DL_BLACKLIST.TRAVEL_DOCS d on b.IDENTITY = d.IDENTITY
        where a.is_active = 'Y' 
        and a.CASE_NUMBER = '103829'
        */
        --
        --
        -- create search sql
        -- dynamic for any possible future enhancements. use bulk collect for static.
        --v_sql :=    q'[
        --                select 
        --                    DL_BLACKLIST.OT_BLT_SEARCH_RESULT_EXT
        --                    (
        --                        b.IDENTITY
        --                        ,c.SURNAME
        --                        ,c.SURNAME_THAI
        --                        ,c.MIDDLE_NAME
        --                        ,c.MIDDLENAME_THAI
        --                        ,c.GIVEN_NAME
        --                        ,c.GIVENNAME_THAI
        --                        ,c.SEX
        --                        ,c.SEX
        --                        --,c.DATE_OF_BIRTH
        --                        ,c.DATE_OF_BIRTH_PARTIAL
        --                        ,c.NATIONALITY
        --                        ,c.NATIONALITY
        --                        ,d.DOC_NUMBER
        --                        ,d.ISSUING_COUNTRY
        --                        ,d.ISSUING_COUNTRY
        --                        ,d.DATE_OF_EXPIRY
        --                        ,DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
        --                        ,rownum
        --                        ,count(*) over()
        --                        ,c.SURNAME
        --                        ,60 
        --                        ,100 
        --                        ,c.MIDDLE_NAME
        --                        ,100 
        --                        ,100 
        --                        ,c.GIVEN_NAME
        --                        ,100 
        --                        ,100 
        --                        ,c.SEX
        --                        ,100 
        --                        ,100 
        --                        --,d.DATE_OF_BIRTH
        --                        ,d.DATE_OF_BIRTH_PARTIAL
        --                        --,d.DATE_OF_BIRTH
        --                        ,d.DATE_OF_BIRTH_PARTIAL
        --                        ,100 
        --                        ,d.NATIONALITY
        --                        ,100 
        --                        ,100 
        --                        ,d.DOC_NUMBER
        --                        ,100 
        --                        ,d.ISSUING_COUNTRY
        --                        ,100 
        --                        ,100 
        --                        ,d.DATE_OF_EXPIRY
        --                        ,d.DATE_OF_EXPIRY
        --                        ,100
        --                   ) 
        --                from DL_BLACKLIST.BLACKLIST_CASES a
        --                inner join DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES b on a.ID = b.BLACKLIST_CASE
        --                inner join DL_BLACKLIST.IDENTITIES c on b.IDENTITY = c.KEY_VALUE
        --                left join DL_BLACKLIST.TRAVEL_DOCS d on b.IDENTITY = d.IDENTITY
        --                where a.is_active = 'Y' 
        --                and a.CASE_NUMBER IN 
        --                (
        --                    SELECT column_value AS WLCD
        --                    FROM TABLE( v_wlcd )
        --                    WHERE column_value IS NOT NULL 
        --                )
        --            ]'
        --;
        --
        --
        --open v_c0 for v_sql;
        open v_c0 for 
                        select 
                            DL_BLACKLIST.OT_BLT_SEARCH_RESULT_EXT
                            (
                                b.IDENTITY
                                ,c.SURNAME
                                ,c.SURNAME_THAI
                                ,c.MIDDLE_NAME
                                ,c.MIDDLENAME_THAI
                                ,c.GIVEN_NAME
                                ,c.GIVENNAME_THAI
                                ,c.SEX
                                ,c.SEX
                                --,c.DATE_OF_BIRTH
                                ,c.DATE_OF_BIRTH_PARTIAL
                                ,c.NATIONALITY
                                ,c.NATIONALITY
                                ,d.DOC_NUMBER
                                ,d.ISSUING_COUNTRY
                                ,d.ISSUING_COUNTRY
                                ,d.DATE_OF_EXPIRY
                                ,DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
                                ,rownum
                                ,count(*) over()
                                ,c.SURNAME
                                ,60 
                                ,100 
                                ,c.MIDDLE_NAME
                                ,100 
                                ,100 
                                ,c.GIVEN_NAME
                                ,100 
                                ,100 
                                ,c.SEX
                                ,100 
                                ,100 
                                --,d.DATE_OF_BIRTH
                                ,d.DATE_OF_BIRTH_PARTIAL
                                --,d.DATE_OF_BIRTH
                                ,d.DATE_OF_BIRTH_PARTIAL
                                ,100 
                                ,d.NATIONALITY
                                ,100 
                                ,100 
                                ,d.DOC_NUMBER
                                ,100 
                                ,d.ISSUING_COUNTRY
                                ,100 
                                ,100 
                                ,d.DATE_OF_EXPIRY
                                ,d.DATE_OF_EXPIRY
                                ,100
                            ) 
                        from DL_BLACKLIST.BLACKLIST_CASES a
                        inner join DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES b on a.ID = b.BLACKLIST_CASE
                        inner join DL_BLACKLIST.IDENTITIES c on b.IDENTITY = c.KEY_VALUE
                        left join DL_BLACKLIST.TRAVEL_DOCS d on b.IDENTITY = d.IDENTITY
                        where a.is_active = 'Y' 
                        and a.CASE_NUMBER IN 
                        (
                            SELECT column_value AS WLCD
                            FROM TABLE( v_wlcd )
                            WHERE column_value IS NOT NULL 
                        );
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
    end if;
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
  end SearchBLDemographic$pl;
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
  * MSCS      14.02.2019  SearchBLDemographic$JSON created
  *******************************************************************************/
  --
  function SearchBLDemographic$JSON(p_MVMNTID       in varchar2
                                   ,p_NATIONALITY   in varchar2
                                   ,p_DOCNO         in varchar2
                                   ,p_ID_CARD       in varchar2
                                   ,p_DOB           in varchar2
                                   ,p_SEX           in varchar2
                                   ,p_GIVENNAME     in varchar2
                                   ,p_MIDDLENAME    in varchar2
                                   ,p_SURNAME       in varchar2
                                   ,p_GIVENNAME_TH  in varchar2 default null
                                   ,p_MIDDLENAME_TH in varchar2 default null
                                   ,p_SURNAME_TH    in varchar2 default null
                                   ,p_PIBICSPRDCONN in varchar2 default null
                                   --
                                   ) return clob is
    --
    --l_bl_resultset  dl_blacklist.ot_blt_search_result_ext;
    --
    v_result clob;
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
    /*
    dl_blacklist.chk_blacklist
    (
        P_MOVEMENTID  => p_MVMNTID
        ,P_NATIONCD   => p_NATIONALITY
        ,P_PASSNO     => p_DOCNO
        ,P_IDCard     => p_ID_CARD
        ,P_BIRTHDTE   => p_DOB
        ,P_SEX        => p_SEX
        ,P_EFIRSTNM   => p_GIVENNAME
        ,P_EMIDDLENMN => p_MIDDLENAME
        ,P_EFAMILYNM  => p_SURNAME
        ,lResult      => l_bl_resultset
    );
    */
    --
    --
    DBMS_LOB.createtemporary(v_Result, true);
    --
    --
    DBMS_LOB.append(v_Result, '[');
    
    for R0 in 
    (
        --               
        select 
            rownum as ROW_NUM
            ,case
                when (t.blt_search_result is not null) then
                    json_object
                    (
                        key 'id' value t.blt_search_result.id
                        ,key 'surname' value t.blt_search_result.surname
                        ,key 'surnameThai' value t.blt_search_result.surname_thai
                        ,key 'middlename' value t.blt_search_result.middle_name
                        ,key 'middlenameThai' value t.blt_search_result.middle_name_thai
                        ,key 'firstname' value t.blt_search_result.given_name
                        ,key 'firstnameThai' value t.blt_search_result.given_name_thai
                        ,key 'sexCode' value t.blt_search_result.sex
                        ,key 'sex' value t.blt_search_result.sex$dv
                        ,key 'dateOfBirth' value t.blt_search_result.date_of_birth.getFormatData('YYYY-MM-DD')
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
                        ,key 'dateOfBirthFromQueryValue' value t.blt_search_result.date_of_birth_f$qry.getFormatData('YYYY-MM-DD')
                        ,key 'dateOfBirthToQueryValue' value t.blt_search_result.date_of_birth_t$qry.getFormatData('YYYY-MM-DD')
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
        from 
        (
            --
            select treat(t.object_value as dl_blacklist.ot_blt_search_result_ext) as blt_search_result
            from table
            (
                --
                dl_blacklist.pkg_search.SearchBLDemographic$pl
                (
                    p_MVMNTID        => p_MVMNTID
                    ,p_NATIONALITY   => p_NATIONALITY
                    ,p_DOCNO         => p_DOCNO
                    ,p_ID_CARD       => p_ID_CARD
                    ,p_DOB           => p_DOB
                    ,p_SEX           => p_SEX
                    ,p_GIVENNAME     => p_GIVENNAME
                    ,p_MIDDLENAME    => p_MIDDLENAME
                    ,p_SURNAME       => p_SURNAME
                    ,p_GIVENNAME_TH  => p_GIVENNAME_TH
                    ,p_MIDDLENAME_TH => p_MIDDLENAME_TH
                    ,p_SURNAME_TH    => p_SURNAME_TH
                    ,p_PIBICSPRDCONN => p_PIBICSPRDCONN
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
        if (R0.JSON_OBJ is not null) then
          --
          if (R0.ROW_NUM > 1) then
            DBMS_LOB.append(v_Result, ',');
          end if;
          --
          DBMS_LOB.append(v_Result, R0.JSON_OBJ);
          --
        end if;
        --
    end loop;
    --
    DBMS_LOB.append(v_Result, ']');
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
      dl_common.pkg_util.FreeTempLOB(v_Result);
      --
      --
      raise_application_error(v_sqlcode
                             ,v_sqlerrm);
      --
  end SearchBLDemographic$json;
  --
  function SearchBLDemographic$JSON(p_Req_JSON in clob
                                   --
                                   ) return clob is
    --
    v_mvmntid       varchar2(4000 char);
    v_nationality   varchar2(4000 char);
    v_docno         varchar2(4000 char);
    v_doc_exp_date  varchar2(4000 char);
    v_id_card       varchar2(4000 char);
    v_dob           varchar2(4000 char);
    v_sex           varchar2(4000 char);
    v_givenname     varchar2(4000 char);
    v_middlename    varchar2(4000 char);
    v_surname       varchar2(4000 char);
    v_givenname_th  varchar2(4000 char);
    v_middlename_th varchar2(4000 char);
    v_surname_th    varchar2(4000 char);
    v_pibicsprdconn varchar2(4000 char);
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
    select jt.x_mvmntid
          ,jt.x_nationality
          ,jt.x_docno
          ,jt.x_doc_exp_date
          ,jt.x_id_card
          ,jt.x_dob
          ,jt.x_sex
          ,jt.x_givenname
          ,jt.x_middlename
          ,jt.x_surname
          ,jt.x_givenname_th
          ,jt.x_middlename_th
          ,jt.x_surname_th
          ,jt.x_pibicsprdconn
      into v_mvmntid
          ,v_nationality
          ,v_docno
          ,v_doc_exp_date
          ,v_id_card
          ,v_dob
          ,v_sex
          ,v_givenname
          ,v_middlename
          ,v_surname
          ,v_givenname_th
          ,v_middlename_th
          ,v_surname_th
          ,v_pibicsprdconn
      from json_table(p_req_json format json
                     , '$'
                      --
                      --error on error
                      --null on error
                      --default '$NV$' on error
                      --
                       columns(x_MVMNTID varchar2(4000 char) path '$.objectId'
                              ,x_NATIONALITY varchar2(4000 char) path '$.demographic.nationality'
                              ,x_DOCNO varchar2(4000 char) path '$.demographic.passportNumber'
                              ,x_DOC_EXP_DATE varchar2(4000 char) path '$.demographic.passportExpiryDate'
                              ,x_ID_CARD varchar2(4000 char) path '$.demographic.idCard'
                              ,x_DOB varchar2(4000 char) path '$.demographic.dateOfBirth'
                              ,x_SEX varchar2(4000 char) path '$.demographic.sex'
                              ,x_GIVENNAME varchar2(4000 char) path '$.demographic.firstname'
                              ,x_MIDDLENAME varchar2(4000 char) path '$.demographic.middlename'
                              ,x_SURNAME varchar2(4000 char) path '$.demographic.surname'
                              ,x_GIVENNAME_TH varchar2(4000 char) path '$.demographic.firstnameThai'
                              ,x_MIDDLENAME_TH varchar2(4000 char) path '$.demographic.middlenameThai'
                              ,x_SURNAME_TH varchar2(4000 char) path '$.demographic.surnameThai'
                              ,x_PIBICSPRDCONN varchar2(4000 char) path '$.pibPrdConn'
                               --
                               )
                      --
                      ) jt;
    --
    --
    return SearchBLDemographic$JSON(p_MVMNTID       => v_MVMNTID
                                   ,p_NATIONALITY   => v_NATIONALITY
                                   ,p_DOCNO         => v_DOCNO
                                   ,p_ID_CARD       => v_ID_CARD
                                   ,p_DOB           => v_DOB
                                   ,p_SEX           => v_SEX
                                   ,p_GIVENNAME     => v_GIVENNAME
                                   ,p_MIDDLENAME    => v_MIDDLENAME
                                   ,p_SURNAME       => v_SURNAME
                                   ,p_GIVENNAME_TH  => v_GIVENNAME_TH
                                   ,p_MIDDLENAME_TH => v_MIDDLENAME_TH
                                   ,p_SURNAME_TH    => v_SURNAME_TH
                                   ,p_PIBICSPRDCONN => v_pibicsprdconn
                                   --
                                   );
    --
  end SearchBLDemographic$json;
  --
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
end PKG_SEARCH;
/
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_SEARCH" TO PUBLIC;
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_SEARCH" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_SEARCH" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_SEARCH" TO "BIOSUPPORT";
