CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_USER_MANAGEMENT"."PKG_MAN_USERS" is
  /**
  * ========================================================================<br/>
  * <b> Functions and procedures for managing users </b>  <br/> <br/>
  * <br/>
  * @file    $HeadURL: $<br/>
  * @version $Revision: 1.13 $<br/>
  * @author  $Author: MThierhoff $<br/>
  * @date    $Date: 09/06/2017 $<br/>
  * @version $Id: $<br/>
  * ========================================================================<br/>
  * @headcom
  */
  /*
  ********************************************************************************
  --------------------------------------------------------------------------------
    History
    ==============================================================================
    Date        Author              Description
    ----------  -----------------   ---------------------------------
    12.03.2018  SRuseva             authenticate - reset bad password counter to 0 only if > 0
                                    PASSWORD_MEETS_SECURITY_RULES - compate distinct history passwords
    09.08.2018  WWirns              Implement PWD_MUST_DIFFER_FROM_N_LAST
    20.09.2018  MStahl              Password Policy, length, consecutive, repetition of characters
    24.09.2018  MStahl              Password Policy, not contain first name, last name, phone number
    26.09.2018  MStahl              Added to check if pwd expires and show warning => check_pwd_expired()
    05.10.2018  Mstahl              Check if user account has expired
    18.10.2018  MStahl              Added session timeout
    03.12.2018  MStahl              Translation via messages added
    13.02.2019  MStahl              User password does not expire option
    24.07.2019  MSCS                Added national_id, first_name_thai, last_name_thai, dob, rank,
                                    department_level_1, department_level_2, department_level_2, position
  ********************************************************************************
  */

  g_scope_prefix constant varchar2(62 char) := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.';
  g_PBKDF2_out_key_length       number := 32;
  g_pwd_min_length              number := pkg_param_config.F_Param_Value_Num(i_param_name => 'pwd_min_length');
  g_pwd_max_length              number := pkg_param_config.F_Param_Value_Num(i_param_name => 'pwd_max_length');
  g_pwd_must_differ_from_n_last number := pkg_param_config.F_Param_Value_Num(i_param_name => 'pwd_must_differ_from_n_last');
  g_pwd_char_repeat             number := pkg_param_config.F_Param_Value_Num(i_param_name => 'pwd_char_repeat');
  g_pwd_consecutive             number := pkg_param_config.F_Param_Value_Num(i_param_name => 'pwd_consecutive');
  g_pwd_consecutive_last        number;
  g_pwd_consecutive_curr        number;
  g_pwd_consecutive_count       number := 0;

  -- User data
  g_usr_first_name    varchar2(100 char);
  g_usr_last_name     varchar2(100 char);
  g_usr_phone_number  varchar2(15 char);

  -- User activities
  gc_activity_login        constant number := 1;
  gc_activity_logout       constant number := 2;
  gc_activity_failed_login constant number := 3;

  -- Error codes
  gc_err_usr_not_exists  constant number := -20100;
  gc_err_usr_no_access   constant number := -20110;
  gc_err_usr_ex          constant number := -20120;
  gc_err_no_um           constant number := -20130;
  gc_err_comp_not_exists constant number := -20140;
  gc_err_comp_no_access  constant number := -20141;
  gc_err_comp_ex         constant number := -20142;

  gc_err_pwd_not_secure  constant number := -20210;
  gc_err_pwd_not_correct constant number := -20230;
  gc_err_pwd_change      constant number := -20240;

  gc_err_no_permission constant number := -20260;

  -- Error messages l_err_msg := apex_lang.message('UM_PWD_EXPIRE', round(l_exp_date, 0));
  gc_err_msg_usr_not_exists  constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_USR_NOT_EXISTS');
  gc_err_msg_comp_not_exists constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_COMP_NOT_EXISTS');
  gc_err_msg_pwd_not_correct constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_PWD_NOT_CORRECT');
  gc_err_msg_pwd_change      constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_PWD_CHANGE');
  gc_err_msg_username_ex     constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_USERNAME_EX');
  gc_err_msg_compname_ex     constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_COMPNAME_EX');
  gc_err_msg_usr_ex_in_ad    constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_USR_EX_IN_AD');
  gc_err_msg_comp_ex_in_ad   constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_COMP_EX_IN_AD');
  gc_err_msg_no_um           constant varchar2(200 char) := apex_lang.message('UM_ERR_MSG_NO_UM');

  gc_err_msg_pwd_min_length     constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_PWD_MIN_LENGTH');
  gc_err_msg_pwd_max_length     constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_PWD_MAX_LENGTH');
  gc_err_msg_pwd_wo_alpha       constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_PWD_WO_ALPHA');
  gc_err_msg_pwd_wo_numeric     constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_PWD_WO_NUMERIC');
  gc_err_msg_pwd_wo_punctuation constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_PWD_WO_PUNCTUATION');
  gc_err_msg_pwd_wo_upper_lower constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_PWD_WO_UPPER_LOWER');
  gc_err_msg_pwd_differ_old     constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_PWD_DIFFER_OLD');
  gc_err_msg_pwd_differ_n_last  constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_PWD_DIFFER_N_LAST');
  gc_err_msg_pwd_reused         constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_PWD_REUSED');
  gc_err_msg_pwd_w_username     constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_PWD_W_USERNAME');
  gc_err_msg_pwd_contain_f_name constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_PWD_CONTAIN_F_NAME');
  gc_err_msg_pwd_contain_l_name constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_PWD_CONTAIN_L_NAME');
  gc_err_msg_pwd_contain_phone  constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_PWD_CONTAIN_PHONE');
  gc_err_msg_pwd_char_repeat    constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_PWD_CHAR_REPEAT');
  gc_err_msg_pwd_consecutive    constant varchar2(100 char) := apex_lang.message('UM_ERR_MSG_PWD_CONSECUTIVE');

  gc_err_msg_no_permission constant varchar2(200 char) := apex_lang.message('UM_ERR_MSG_NO_PERMISSION');

  --
  -----------------------------------------------------------------------------
  /**
  * Get ID (resp. DN) and source (AD or Deramlog User Management) of user <br/>
  * @param  i_username       username
  * @param  i_user_id        DN if user from AD, users.id if user from Dermalog User Management
  * @param  i_user_source    1 if user from AD, 2 if user from Dermalog User Management
  <br/><br/>
  */
  procedure GET_USER_ID_AND_SOURCE(i_username    in varchar2
                                  ,o_user_id     out varchar2
                                  ,o_user_source out number) as
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'GET_USER_ID_AND_SOURCE';
    -- l_params logger.tab_param;
    l_dn     varchar2(256);
  begin
    -- logger.append_param(l_params
    --                    ,'i_username'
    --                    ,i_username);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    if pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'usr_from_ad') = 1
    then
      if dl_ldap.find_user(i_username => i_username
                          ,o_dn       => l_dn)
      then
        o_user_id     := l_dn;
        o_user_source := 1;
      elsif pkg_param_config.F_Param_Value_IS_ON(i_param_name => 'usr_from_dl_um') = 1
      then
        begin
          select id
            into o_user_id
            from users
           where username = upper(i_username);
          o_user_source := 2;
        exception
          when no_data_found then
            raise_application_error(gc_err_usr_not_exists
                                   ,gc_err_msg_usr_not_exists);
        end;
      else
        raise_application_error(gc_err_usr_not_exists
                               ,gc_err_msg_usr_not_exists);
      end if;
    elsif pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'usr_from_dl_um') = 1
    then
      begin
        select id
          into o_user_id
          from users
         where username = upper(i_username);
        o_user_source := 2;
      exception
        when no_data_found then
          raise_application_error(gc_err_usr_not_exists
                                 ,gc_err_msg_usr_not_exists);
      end;
    else
      raise_application_error(gc_err_no_um
                             ,gc_err_msg_no_um);
    end if;

  --   logger.log('END'
  --             ,l_scope);

  exception
    when others then
  --     logger.log_error('Unhandled Exception'
  --                     ,l_scope
  --                     ,null
  --                     ,l_params);
      raise;
  end GET_USER_ID_AND_SOURCE;
  --
  --
  /**
  * Log activity of user into table activites
  *
  * PARAMETERS
  *   @param  i_user_id    ID of user
  *   @param  i_user_source 1 if user from AD, 2 if user from Dermalog User Management, 3 if DB schema user
  *   @param  i_IP         IP
  *   @param  i_activity   activity
  *   @param  i_comments   comment on activity
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
  * WWirns    17.07.2018  LOG_USER_ACTIVITY:
  *******************************************************************************/
  --
  procedure LOG_USER_ACTIVITY(i_user_id     in varchar2
                             ,i_user_source in number default sys_context(pkg_set_custom_ctx.g_CtxNamespace
                                                                         ,pkg_set_custom_ctx.g_CtxUserSource)
                             ,i_IP          in varchar2 default sys_context(pkg_set_custom_ctx.g_CtxNamespace
                                                                           ,pkg_set_custom_ctx.g_CtxIP)
                             ,i_activity    in number
                             ,i_comments    in varchar2
                              --
                              ) is
    --
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'LOG_USER_ACTIVITY';
    -- l_params logger.tab_param;
  begin
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    insert into activities
      (user_id
      ,user_source
      ,INS_BY
      ,operation
      ,comments
      ,INS_AT
      ,app_name
       --
       )
    values
      (i_user_id
      ,i_user_source
      ,i_IP
      ,i_activity
      ,i_comments
      ,systimestamp
      ,nvl(sys_context(pkg_set_custom_ctx.g_CtxNamespace
                      ,pkg_set_custom_ctx.g_CtxAppName)
          ,v('APP_ALIAS'))
       --
       );

    commit;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end LOG_USER_ACTIVITY;

  /**
  * Generates a random string as salt <br/>
  * @param  i_length desired length of the generated salt in bytes
  * @return salt
  <br/><br/>
  */
  function GENERATE_SALT(i_length in number) return varchar2 as
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'GENERATE_SALT';
    -- l_params logger.tab_param;
    l_return users.pw_salt%type;
  begin
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    l_return := DBMS_RANDOM.STRING('a'
                                  ,i_length);

    return l_return;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end GENERATE_SALT;

  /**
  * Function for deriving key from password using HMAC-SHA-256 as the core hash with PBKDF2 algorithm <br/>
  * @param  i_password        password from which the key is to be derived
  * @param  i_salt            cryptographic salt
  * @param  i_iterations      desired number of iterations
  * @param  i_key_length      desired length of the derived key. It's the length of the result in raw format. But the result is returned as varchar2, so the length is doubled.
  * @return                   derived key
  <br/><br/>
  */
  function PBKDF2_hmac_sha_256(i_password   in varchar2
                              ,i_salt       in varchar2
                              ,i_iterations in number
                              ,i_key_length in number) return varchar2 is
    -- l_scope       logger_logs.scope%type := g_scope_prefix || 'PBKDF2_hmac_sha_256';
    -- l_params      logger.tab_param;
    l_block_count integer;
    l_last        raw(32767);
    l_xorsum      raw(32767);
    l_result      raw(32767);
  begin
    -- logger.append_param(l_params
    --                    ,'i_iterations'
    --                    ,i_iterations);
    -- logger.append_param(l_params
    --                    ,'i_key_length'
    --                    ,i_key_length);

    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    l_block_count := ceil(i_key_length / 32); -- 32 bytes for SHA256.

    for i in 1 .. l_block_count
    loop
      l_last := utl_raw.concat(utl_raw.cast_to_raw(i_salt)
                              ,utl_raw.cast_from_binary_integer(i
                                                               ,utl_raw.big_endian));

      l_xorsum := null;

      for j in 1 .. i_iterations
      loop
        l_last := dbms_crypto.mac(l_last
                                 ,dbms_crypto.hmac_sh256
                                 ,utl_raw.cast_to_raw(i_password));

        if l_xorsum is null
        then
          l_xorsum := l_last;
        else
          l_xorsum := utl_raw.bit_xor(l_xorsum
                                     ,l_last);
        end if;

      end loop;

      l_result := utl_raw.concat(l_result
                                ,l_xorsum);

    end loop;

    -- logger.log('END'
    --           ,l_scope);

    return rawtohex(utl_raw.substr(l_result
                                  ,1
                                  ,i_key_length));

  end PBKDF2_hmac_sha_256;

  --
  -----------------------------------------------------------------------------
  /**
  * Check for user from Dermalog User Management (UM) if he has to change his password <br/>
  * @param    i_username       username
  * @return   TRUE if the user is from UM and UM users are to be used and the user has to change his password. Else FALSE.
  <br/><br/>
  */
  function IS_PWD_CHANGE_NECESSARY(i_username in varchar2) return boolean as
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'IS_PWD_CHANGE_NECESSARY';
    -- l_params logger.tab_param;
    l_cnt    number;
  begin
    -- logger.append_param(l_params
    --                    ,'i_username'
    --                    ,i_username);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    select count(*)
      into l_cnt
      from USERS u
     where u.USERNAME = upper(i_username)
       and (u.PW_MUST_BE_CHANGED = 'Y' or sysdate > u.PW_EXPIRATION_DATE)
       and PKG_PARAM_CONFIG.F_Param_Value_Is_ON(i_param_name => 'usr_from_dl_um') = 1;

    -- logger.log('END'
    --           ,l_scope);

    case
      when l_cnt = 0 then
        return false;
      else
        return true;
    end case;

  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end IS_PWD_CHANGE_NECESSARY;

  --
  -----------------------------------------------------------------------------
  /**
  * Validate password for given user. Raise error, if the password is not correct. <br/>
  * @param  i_user_id        id of user
  * @param  i_password       password
  <br/><br/>
  */
  procedure PASSWORD_CORRECT_OR_ERROR(i_user_id  in varchar2
                                     ,i_password in varchar2) as
    -- l_scope                logger_logs.scope%type := g_scope_prefix || 'PASSWORD_CORRECT_OR_ERROR';
    -- l_params               logger.tab_param;
    l_stored_salt          users.pw_salt%type;
    l_stored_iteration_cnt users.pw_iteration_count%type;
    l_stored_hash          users.pw_hash%type;
    l_calculated_hash      users.pw_hash%type;
  begin
    -- logger.append_param(l_params
    --                    ,'i_user_id'
    --                    ,i_user_id);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    /* Get salt, iteration count and hash of the stored password */
    select t.PW_SALT
          ,t.PW_ITERATION_COUNT
          ,t.PW_HASH
      into l_stored_salt
          ,l_stored_iteration_cnt
          ,l_stored_hash
      from USERS t
     where t.ID = i_user_id;

    l_calculated_hash := PBKDF2_hmac_sha_256(i_password   => i_password
                                            ,i_salt       => l_stored_salt
                                            ,i_iterations => l_stored_iteration_cnt
                                            ,i_key_length => g_PBKDF2_out_key_length); -- Note: the given key length will be the length for the raw, but the output will be in varchar2 with the duplicate length

    if l_calculated_hash != l_stored_hash
    then
      raise_application_error(gc_err_pwd_not_correct
                             ,gc_err_msg_pwd_not_correct);
    end if;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end PASSWORD_CORRECT_OR_ERROR;

  --
  -----------------------------------------------------------------------------
  /**
  * Check for user from Dermalog User Management (UM) if he has to change his password <br/>
  * @param    i_username       username
  * @return   TRUE if the user is from UM and UM users are to be used and the user has to change his password. Else FALSE.
  <br/><br/>
  */
  function IS_PWD_CHANGE_NECESSARY_LOGIN(i_username in varchar2
                                        ,i_password in varchar2) return boolean as
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'IS_PWD_CHANGE_NECESSARY';
    -- l_params logger.tab_param;
    l_cnt    number;
    l_usr_id varchar2(32);
  begin
    -- logger.append_param(l_params
    --                    ,'i_username'
    --                    ,i_username);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    select count(*)
      into l_cnt
      from USERS u
     where u.USERNAME = upper(i_username)
       and (u.PW_MUST_BE_CHANGED = 'Y' or sysdate > u.PW_EXPIRATION_DATE)
       and PKG_PARAM_CONFIG.F_Param_Value_Is_ON(i_param_name => 'usr_from_dl_um') = 1;

    -- logger.log('END'
    --           ,l_scope);

    case
      when l_cnt = 0 then
        return false;
      else

        select id
          into l_usr_id
          from users
         where username = upper(i_username);

        PASSWORD_CORRECT_OR_ERROR(i_user_id  => l_usr_id
                                 ,i_password => i_password);

        return true;
    end case;

  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      return false;
  end IS_PWD_CHANGE_NECESSARY_LOGIN;
  --
  -----------------------------------------------------------------------------
  /**
  * Check if password meets required security rules <br/>
  * @param  i_username                         username
  * @param  i_password                         password
  * @param  o_pwd_min_length                   TRUE if password meets minimum length requirement, else FALSE
  * @param  o_pwd_max_length                   TRUE if password meets maximum length requirement, else FALSE
  * @param  o_pwd_must_contain_alpha           TRUE if password meets "password must contain alphabetic character" requirement, else FALSE
  * @param  o_pwd_must_contain_numeric         TRUE if password meets "password must contain numeric character" requirement, else FALSE
  * @param  o_pwd_must_contain_punctuation     TRUE if password meets "password must contain punctuation character" requirement, else FALSE
  * @param  o_pwd_must_contain_upper_lower     TRUE if password meets "password must contain upper-case and lower-case characters" requirement, else FALSE
  * @param  o_pwd_must_differ_from_old         TRUE if password meets "password must differ from old password" requirement, else FALSE
  * @param  o_pwd_not_reusable                 TRUE if password meets "password not reusable" requirement, else FALSE
  * @param  o_pwd_must_not_contain_username    TRUE if password meets "password must not contain username" requirement, else FALSE
  * @param  o_pwd_must_not_contain_f_name      TRUE if password meets "password must not contain first name" requirement, else FALSE
  * @param  o_pwd_must_not_contain_l_name      TRUE if password meets "password must not contain last name" requirement, else FALSE
  * @param  o_pwd_must_not_contain_phone       TRUE if password meets "password must not contain phone number" requirement, else FALSE
  * @param  o_pwd_char_repeat                  TRUE if password meets "password does not contain too many repetitions of the same character in a row" requirement, else FALSE
  * @param  o_pwd_consecutive                  TRUE if password meets "password does not contain too many consecutive characters in a row" requirement, else FALSE
  * @return TRUE if the passwords meets all the security rules, else FALSE
  <br/><br/>
  */
  function PASSWORD_MEETS_SECURITY_RULES(i_username                     in varchar2
                                        ,i_password                     in varchar2
                                        ,i_first_name                   in varchar2 default null
                                        ,i_last_name                    in varchar2 default null
                                        ,i_phone_number                 in varchar2 default null
                                        ,o_pwd_min_length               out boolean
                                        ,o_pwd_max_length               out boolean
                                        ,o_pwd_must_contain_alpha       out boolean
                                        ,o_pwd_must_contain_numeric     out boolean
                                        ,o_pwd_must_contain_punctuation out boolean
                                        ,o_pwd_must_contain_upper_lower out boolean
                                        ,o_pwd_must_differ_from_old     out boolean
                                        ,o_pwd_not_reusable             out boolean
                                        ,o_pwd_must_not_contain_user    out boolean
                                        ,o_pwd_must_not_contain_f_name  out boolean
                                        ,o_pwd_must_not_contain_l_name  out boolean
                                        ,o_pwd_must_not_contain_phone   out boolean
                                        ,o_pwd_must_differ_from_n_last  out boolean
                                        ,o_pwd_char_repeat              out boolean
                                        ,o_pwd_consecutive              out boolean
                                         --
                                         ) return boolean as
    -- l_scope               logger_logs.scope%type := g_scope_prefix || 'PASSWORD_MEETS_SECURITY_RULES';
    -- l_params              logger.tab_param;
    o_all_ok              boolean := true;
    l_compare_hash        users.pw_hash%type;
    l_old_hash            users.pw_hash%type;
    l_old_salt            users.pw_salt%type;
    l_old_iteration_count users.pw_iteration_count%type;
  begin
    -- logger.append_param(l_params
    --                    ,'i_username'
    --                    ,i_username);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);
    --

    /* Check if password has at least minimum length */

    if length(i_password) >= g_pwd_min_length
    then
      o_pwd_min_length := true;
    else
      o_pwd_min_length := false;
      o_all_ok         := false;
    end if;

    /* Check if password reached maximum length */

    if length(i_password) <= g_pwd_max_length
    then
      o_pwd_max_length := true;
    else
      o_pwd_max_length := false;
      o_all_ok         := false;
    end if;

    /* Check if password meets "password must contain alphabetic character" requirement */

    if pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'pwd_must_contain_alpha') = 0
       or regexp_like(i_password
                     ,'[[:alpha:]]')
    then
      o_pwd_must_contain_alpha := true;
    else
      o_pwd_must_contain_alpha := false;
      o_all_ok                 := false;
    end if;

    /* Check if password meets "password must contain numeric character"  requirement */

    if pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'pwd_must_contain_numeric') = 0
       or regexp_like(i_password
                     ,'[[:digit:]]')
    then
      o_pwd_must_contain_numeric := true;
    else
      o_pwd_must_contain_numeric := false;
      o_all_ok                   := false;
    end if;

    /* Check if password meets "password must contain punctuation character" requirement */

    if pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'pwd_must_contain_punctuation') = 0
       or regexp_like(i_password
                     ,'[!"#$%&()``*+,-/:;<=>?_]')
    then
      o_pwd_must_contain_punctuation := true;
    else
      o_pwd_must_contain_punctuation := false;
      o_all_ok                       := false;
    end if;

    /* Check if password meets "password must contain upper-case and lower-case characters" requirement */

    if pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'pwd_must_contain_upper_lower') = 0
       or (regexp_like(i_password
                      ,'[[:upper:]]') and regexp_like(i_password
                                                     ,'[[:lower:]]'))
    then
      o_pwd_must_contain_upper_lower := true;
    else
      o_pwd_must_contain_upper_lower := false;
      o_all_ok                       := false;
    end if;

    /* Check if password meets "password not reusable" requirement */

    if pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'pwd_not_reusable') = 0
    then
      o_pwd_not_reusable := true;
    else

      o_pwd_not_reusable := true;

      for R0 in (
                 --
                 select s.ID
                   from USERS s
                  where s.USERNAME = upper(i_username)
                 --
                 )
      loop

        for cur_old_pwd in (
                            --
                            select distinct u.PW_SALT
                                            ,u.PW_HASH
                                            ,u.PW_ITERATION_COUNT
                              from (
                                     --
                                     select t0.ID
                                            ,t0.PW_SALT
                                            ,t0.PW_HASH
                                            ,t0.PW_ITERATION_COUNT
                                       from USERS t0
                                      where t0.ID = R0.ID
                                     union all
                                     select t1.ID
                                            ,t1.PW_SALT
                                            ,t1.PW_HASH
                                            ,t1.PW_ITERATION_COUNT
                                       from USERS$HIS t1
                                      where t1.ID = R0.ID
                                     --
                                     ) u
                            --
                            )
        loop

          l_compare_hash := PBKDF2_hmac_sha_256(i_password   => i_password
                                               ,i_salt       => cur_old_pwd.pw_salt
                                               ,i_iterations => cur_old_pwd.pw_iteration_count
                                               ,i_key_length => g_PBKDF2_out_key_length);

          if l_compare_hash = cur_old_pwd.pw_hash
          then
            o_pwd_not_reusable := false;
            o_all_ok           := false;
            exit;
          end if;

        end loop;

        exit;
      end loop;

    end if;

    /* Check if password meets "password must differ from old password" requirement */
    -- Note: a new user has no old password to compare. Select for password data would fail, but will not be executed in this case, because o_pwd_not_reusable will be TRUE

    if o_pwd_not_reusable = true
       or pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'pwd_must_differ_from_old') = 0
    then
      o_pwd_must_differ_from_old := true;
    else
      select pw_hash
            ,pw_salt
            ,pw_iteration_count
        into l_old_hash
            ,l_old_salt
            ,l_old_iteration_count
        from users
       where username = upper(i_username);

      l_compare_hash := PBKDF2_hmac_sha_256(i_password   => i_password
                                           ,i_salt       => l_old_salt
                                           ,i_iterations => l_old_iteration_count
                                           ,i_key_length => g_PBKDF2_out_key_length);

      if l_old_hash != l_compare_hash
      then
        o_pwd_must_differ_from_old := true;
      else
        o_pwd_must_differ_from_old := false;
        o_all_ok                   := false;
      end if;
    end if;

    /* Check if password meets "password must not contain username" requirement */

    if pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'pwd_must_not_contain_username') = 0
       or instr(upper(i_password)
               ,upper(i_username)) = 0
    then
      o_pwd_must_not_contain_user := true;
    else
      o_pwd_must_not_contain_user := false;
      o_all_ok                    := false;
    end if;


    /* Check if password meets "password must not contain first name" requirement */

    if i_first_name is null then
      begin
        select first_name into g_usr_first_name from dl_user_management.users where username = i_username;
        exception when no_data_found
          then null;
      end;
    else
      g_usr_first_name := i_first_name;
    end if;

    if g_usr_first_name is not null then
      if pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'pwd_must_not_contain_f_name') = 0
        or instr(upper(i_password)
                ,upper(g_usr_first_name)) = 0
      then
        o_pwd_must_not_contain_f_name := true;
      else
        o_pwd_must_not_contain_f_name := false;
        o_all_ok                    := false;
      end if;
    end if;

    /* Check if password meets "password must not contain last name" requirement */

    if i_last_name is null then
      begin
        select last_name into g_usr_last_name from dl_user_management.users where username = i_username;
        exception when no_data_found
          then null;
      end;
    else
      g_usr_last_name := i_last_name;
    end if;

    if g_usr_last_name is not null then
      if pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'pwd_must_not_contain_l_name') = 0
        or instr(upper(i_password)
                ,upper(g_usr_last_name)) = 0
      then
        o_pwd_must_not_contain_l_name := true;
      else
        o_pwd_must_not_contain_l_name := false;
        o_all_ok                    := false;
      end if;
    end if;

    /* Check if password meets "password must not contain phone number" requirement */

    if i_phone_number is null then
      begin
        select phone_number into g_usr_phone_number from dl_user_management.users where username = i_username;

        exception when no_data_found
          then null;
      end;
    else
      g_usr_phone_number := i_phone_number;
    end if;

    if g_usr_phone_number is not null then
      if pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'pwd_must_not_contain_phone') = 0
          or instr(upper(i_password)
                  ,g_usr_phone_number) = 0
      then
        o_pwd_must_not_contain_phone := true;
      else
        o_pwd_must_not_contain_phone := false;
        o_all_ok                    := false;
      end if;
    end if;
    --
    -- Check if password meets "password must differ from n last passwords" requirement
    if g_pwd_must_differ_from_n_last = 0
       or not o_pwd_not_reusable
    then
      o_pwd_must_differ_from_n_last := true;
    else
      o_pwd_must_differ_from_n_last := true;

      for R0 in (
                 --
                 select s.ID
                   from USERS s
                  where s.USERNAME = upper(i_username)
                 --
                 )
      loop

        for cur_old_pwd in (
                            --
                            select distinct u.PW_SALT
                                            ,u.PW_HASH
                                            ,u.PW_ITERATION_COUNT
                              from (
                                     --
                                     select t0.ID
                                            ,t0.PW_SALT
                                            ,t0.PW_HASH
                                            ,t0.PW_ITERATION_COUNT
                                            ,t0.DML_AT
                                       from USERS t0
                                      where t0.ID = R0.ID
                                     union all
                                     select t1.ID
                                            ,t1.PW_SALT
                                            ,t1.PW_HASH
                                            ,t1.PW_ITERATION_COUNT
                                            ,t1.DML_AT
                                       from USERS$HIS t1
                                      where t1.ID = R0.ID
                                      order by DML_AT desc
                                     --
                                     ) u
                             where rownum <= g_pwd_must_differ_from_n_last
                            --
                            )
        loop

          l_compare_hash := PBKDF2_hmac_sha_256(i_password   => i_password
                                               ,i_salt       => cur_old_pwd.pw_salt
                                               ,i_iterations => cur_old_pwd.pw_iteration_count
                                               ,i_key_length => g_PBKDF2_out_key_length);

          if l_compare_hash = cur_old_pwd.pw_hash
          then
            o_pwd_must_differ_from_n_last := false;
            o_all_ok                      := false;
            exit;
          end if;

        end loop;

        exit;
      end loop;

    end if;

    /* Check if character within password does not repeat given times in a row */

    if g_pwd_char_repeat > 0 then
      if regexp_like(i_password
                      ,'(.)\1{' || g_pwd_char_repeat || '}')
      then
        o_pwd_char_repeat := false;
        o_all_ok          := false;
      else
        o_pwd_char_repeat := true;
      end if;
    else
      o_pwd_char_repeat := true;
    end if;

    /* Check if characters within password are not consecutive given times in a row */

    if g_pwd_consecutive > 0 then
        g_pwd_consecutive_last := ascii((substr(i_password, 1, 2)));
        for i in 2..length(i_password)
        loop
          g_pwd_consecutive_curr := ascii(substr(i_password, i , i + 1));
          if g_pwd_consecutive_last + 1 = g_pwd_consecutive_curr
            then g_pwd_consecutive_count := g_pwd_consecutive_count + 1;
            else g_pwd_consecutive_count := 0;
          end if;
          if g_pwd_consecutive_count = g_pwd_consecutive
            then o_pwd_consecutive := false;
                 o_all_ok          := false;
              exit;
          end if;
          g_pwd_consecutive_last := g_pwd_consecutive_curr;
          o_pwd_consecutive := true;
        end loop;
      else
        o_pwd_consecutive := true;
    end if;

    --
    -- logger.log('END'
    --           ,l_scope);
    --
    return o_all_ok;

  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end PASSWORD_MEETS_SECURITY_RULES;

  --
  -----------------------------------------------------------------------------
  /**
  * Check if password meets required security rules. If not, raise custom error with explaining error message. <br/>
  * @param  i_username                         username
  * @param  i_password                         password
  * @return TRUE if the passwords meets all the security rules, else FALSE
  <br/><br/>
  */
  procedure PASSWORD_SECURE_OR_ERROR(i_username     in varchar2
                                    ,i_password     in varchar2
                                    ,i_first_name   in varchar2 default null
                                    ,i_last_name    in varchar2 default null
                                    ,i_phone_number in varchar2 default null) as
    -- l_scope                        logger_logs.scope%type := g_scope_prefix || 'PASSWORD_SECURE_OR_ERROR';
    -- l_params                       logger.tab_param;
    l_password_secure              boolean;
    l_err_msg_pwd_not_secure       varchar2(2048) := 'Password doesn''t meet security requirements!';
    l_pwd_min_length               boolean;
    l_pwd_max_length               boolean;
    l_pwd_must_contain_alpha       boolean;
    l_pwd_must_contain_numeric     boolean;
    l_pwd_must_contain_punctuation boolean;
    l_pwd_must_contain_upper_lower boolean;
    l_pwd_must_differ_from_old     boolean;
    l_pwd_not_reusable             boolean;
    l_pwd_must_not_contain_user    boolean;
    l_pwd_must_not_contain_f_name  boolean;
    l_pwd_must_not_contain_l_name  boolean;
    l_pwd_must_not_contain_phone   boolean;
    l_pwd_must_differ_from_n_last  boolean;
    l_pwd_char_repeat              boolean;
    l_pwd_consecutive              boolean;
  begin
    -- logger.append_param(l_params
    --                    ,'i_username'
    --                    ,i_username);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);
    --

    /* Check if password meets security requirements */
    l_password_secure := PASSWORD_MEETS_SECURITY_RULES(i_username                     => i_username
                                                      ,i_password                     => i_password
                                                      ,i_first_name                   => i_first_name
                                                      ,i_last_name                    => i_last_name
                                                      ,i_phone_number                 => i_phone_number
                                                      ,o_pwd_min_length               => l_pwd_min_length
                                                      ,o_pwd_max_length               => l_pwd_max_length
                                                      ,o_pwd_must_contain_alpha       => l_pwd_must_contain_alpha
                                                      ,o_pwd_must_contain_numeric     => l_pwd_must_contain_numeric
                                                      ,o_pwd_must_contain_punctuation => l_pwd_must_contain_punctuation
                                                      ,o_pwd_must_contain_upper_lower => l_pwd_must_contain_upper_lower
                                                      ,o_pwd_must_differ_from_old     => l_pwd_must_differ_from_old
                                                      ,o_pwd_not_reusable             => l_pwd_not_reusable
                                                      ,o_pwd_must_not_contain_user    => l_pwd_must_not_contain_user
                                                      ,o_pwd_must_not_contain_f_name  => l_pwd_must_not_contain_f_name
                                                      ,o_pwd_must_not_contain_l_name  => l_pwd_must_not_contain_l_name
                                                      ,o_pwd_must_not_contain_phone   => l_pwd_must_not_contain_phone
                                                      ,o_pwd_must_differ_from_n_last  => l_pwd_must_differ_from_n_last
                                                      ,o_pwd_char_repeat              => l_pwd_char_repeat
                                                      ,o_pwd_consecutive              => l_pwd_consecutive
                                                       --
                                                       );

    if not l_password_secure
    then

      /* Construct error message */
      if not l_pwd_min_length
      then
        l_err_msg_pwd_not_secure := l_err_msg_pwd_not_secure || ' ' || gc_err_msg_pwd_min_length || ' ' || g_pwd_min_length;
      end if;
      if not l_pwd_max_length
      then
        l_err_msg_pwd_not_secure := l_err_msg_pwd_not_secure || ' ' || gc_err_msg_pwd_max_length || ' ' || g_pwd_max_length;
      end if;
      if not l_pwd_must_contain_alpha
      then
        l_err_msg_pwd_not_secure := l_err_msg_pwd_not_secure || ' ' || gc_err_msg_pwd_wo_alpha;
      end if;
      if not l_pwd_must_contain_numeric
      then
        l_err_msg_pwd_not_secure := l_err_msg_pwd_not_secure || ' ' || gc_err_msg_pwd_wo_numeric;
      end if;
      if not l_pwd_must_contain_punctuation
      then
        l_err_msg_pwd_not_secure := l_err_msg_pwd_not_secure || ' ' || gc_err_msg_pwd_wo_punctuation;
      end if;
      if not l_pwd_must_contain_upper_lower
      then
        l_err_msg_pwd_not_secure := l_err_msg_pwd_not_secure || ' ' || gc_err_msg_pwd_wo_upper_lower;
      end if;
      if not l_pwd_must_differ_from_old
      then
        l_err_msg_pwd_not_secure := l_err_msg_pwd_not_secure || ' ' || gc_err_msg_pwd_differ_old;
      end if;
      if not l_pwd_not_reusable
      then
        l_err_msg_pwd_not_secure := l_err_msg_pwd_not_secure || ' ' || gc_err_msg_pwd_reused;
      end if;
      if not l_pwd_must_not_contain_user
      then
        l_err_msg_pwd_not_secure := l_err_msg_pwd_not_secure || ' ' || gc_err_msg_pwd_w_username;
      end if;
      if not l_pwd_must_not_contain_f_name
      then
        l_err_msg_pwd_not_secure := l_err_msg_pwd_not_secure || ' ' || gc_err_msg_pwd_contain_f_name;
      end if;
      if not l_pwd_must_not_contain_l_name
      then
        l_err_msg_pwd_not_secure := l_err_msg_pwd_not_secure || ' ' || gc_err_msg_pwd_contain_l_name;
      end if;
      if not l_pwd_must_not_contain_phone
      then
        l_err_msg_pwd_not_secure := l_err_msg_pwd_not_secure || ' ' || gc_err_msg_pwd_contain_phone;
      end if;
      if not l_pwd_must_differ_from_n_last
      then
        l_err_msg_pwd_not_secure := l_err_msg_pwd_not_secure || ' ' || gc_err_msg_pwd_differ_n_last;
      end if;
      if not l_pwd_char_repeat
      then
        l_err_msg_pwd_not_secure := l_err_msg_pwd_not_secure || ' ' || gc_err_msg_pwd_char_repeat || ' ' || g_pwd_char_repeat;
      end if;
      if not l_pwd_consecutive
      then
        l_err_msg_pwd_not_secure := l_err_msg_pwd_not_secure || ' ' || gc_err_msg_pwd_consecutive || ' ' || g_pwd_consecutive;
      end if;

      raise_application_error(gc_err_pwd_not_secure
                             ,l_err_msg_pwd_not_secure);

    end if;

    --
    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end PASSWORD_SECURE_OR_ERROR;

  --
  -----------------------------------------------------------------------------
  /**
  * Store password for given user <br/>
  * @param  i_user_id        id of user
  * @param  i_password       password
  <br/><br/>
  */
  procedure STORE_PASSWORD(i_user_id             in varchar2
                          ,i_password            in varchar2
                          ,i_pwd_must_be_changed in varchar2 default 'N') as
    -- l_scope           logger_logs.scope%type := g_scope_prefix || 'STORE_PASSWORD';
    -- l_params          logger.tab_param;
    l_username        users.username%type;
    l_pw_expire       users.pw_expire%type;
    l_salt            users.pw_salt%type;
    l_hash            users.pw_hash%type;
    l_iteration_cnt   number := pkg_param_config.F_Param_Value_Num(i_param_name => 'pwd_hashing_iteration_cnt');
    l_pwd_expiry_days number;
  begin
    -- logger.append_param(l_params
    --                    ,'i_user_id'
    --                    ,i_user_id);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    begin
      select username, pw_expire
        into l_username, l_pw_expire
        from users
       where id = i_user_id;
    exception
      when no_data_found then
        raise_application_error(gc_err_usr_not_exists
                               ,gc_err_msg_usr_not_exists);
    end;

    /* Check if password meets security requirements. Raise error, if not. */
    PASSWORD_SECURE_OR_ERROR(i_username => l_username
                            ,i_password => i_password);

    /* Hash password */
    l_salt := GENERATE_SALT(i_length => 32);
    l_hash := PBKDF2_hmac_sha_256(i_password   => i_password
                                 ,i_salt       => l_salt
                                 ,i_iterations => l_iteration_cnt
                                 ,i_key_length => g_PBKDF2_out_key_length); -- Note: the given key length will be the length for the raw, but the output will be in varchar2 with the duplicate length

    /* Check when password expires */
    l_pwd_expiry_days := pkg_param_config.F_Param_Value_Num(i_param_name => 'pwd_expiry_days');

    update users
       set pw_salt            = l_salt
          ,pw_iteration_count = l_iteration_cnt
          ,pw_hash            = l_hash
          ,pw_expiration_date = case l_pw_expire when 0 then to_date('31.12.9999') when 1 then (sysdate + l_pwd_expiry_days) end
          ,pw_must_be_changed = i_pwd_must_be_changed
     where id = i_user_id;

    commit;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end STORE_PASSWORD;

  --
  -----------------------------------------------------------------------------
  /**
  * Change password for given user <br/>
  * @param  i_username       username
  * @param  i_password_new   new password
  * @param  i_password_old   old password
  <br/><br/>
  */
  procedure CHANGE_PASSWORD(i_username     in varchar2
                           ,i_password_new in varchar2
                           ,i_password_old in varchar2) as
    -- l_scope           logger_logs.scope%type := g_scope_prefix || 'CHANGE_PASSWORD';
    -- l_params          logger.tab_param;
    l_user_id         users.id%type;
    l_pw_expire       users.pw_expire%type;
    l_salt            users.pw_salt%type;
    l_hash            users.pw_hash%type;
    l_iteration_cnt   number := pkg_param_config.F_Param_Value_Num(i_param_name => 'pwd_hashing_iteration_cnt');
    l_pwd_expiry_days number;
  begin
    -- logger.append_param(l_params
    --                    ,'i_username'
    --                    ,i_username);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    begin
      select id, pw_expire
        into l_user_id, l_pw_expire
        from users
       where username = upper(i_username);
    exception
      when no_data_found then
        raise_application_error(gc_err_usr_not_exists
                               ,gc_err_msg_usr_not_exists);
    end;

    /* Check if old password is correct. Raise error, if not */
    PASSWORD_CORRECT_OR_ERROR(i_user_id  => l_user_id
                             ,i_password => i_password_old);

    /* Check if password meets security requirements. Raise error, if not. */
    PASSWORD_SECURE_OR_ERROR(i_username => i_username
                            ,i_password => i_password_new);

    /* Hash password */
    l_salt := GENERATE_SALT(i_length => 32);
    l_hash := PBKDF2_hmac_sha_256(i_password   => i_password_new
                                 ,i_salt       => l_salt
                                 ,i_iterations => l_iteration_cnt
                                 ,i_key_length => g_PBKDF2_out_key_length); -- Note: the given key length will be the length for the raw, but the output will be in varchar2 with the duplicate length

    /* Check when password expires */
    l_pwd_expiry_days := pkg_param_config.F_Param_Value_Num(i_param_name => 'pwd_expiry_days');

    update users
       set pw_salt            = l_salt
          ,pw_iteration_count = l_iteration_cnt
          ,pw_hash            = l_hash
          ,pw_expiration_date = case l_pw_expire when 0 then to_date('31.12.9999') when 1 then (sysdate + l_pwd_expiry_days) end
          ,pw_must_be_changed = 'N'
          ,dml_at             = sysdate
     where id = l_user_id;

    update users$sgd
       set bad_password_count = 0
     where id = l_user_id;

    commit;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end CHANGE_PASSWORD;
  --
  --
  /**
  * Reset password for given user. Only allowed for user with edit right on object "User Management - Users, Roles, Permissions" <br/>
  *
  * PARAMETERS
  *   @param  i_username       username
  *   @param  i_password_new   new password
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
  * WWirns    17.07.2018  RESET_PASSWORD:Bypass logged in user and rights check for specific db-user(s)
  * WWirns    17.07.2018  RESET_PASSWORD:Switch error messages
  *******************************************************************************/
  --
  procedure RESET_PASSWORD(i_username     in varchar2
                          ,i_password_new in varchar2
                           --
                           ) is
    --
    -- l_scope                   logger_logs.scope%type := g_scope_prefix || 'RESET_PASSWORD';
    -- l_params                  logger.tab_param;
    l_user_id                 users.id%type;
    l_pw_expire               users.pw_expire%type;
    l_salt                    users.pw_salt%type;
    l_hash                    users.pw_hash%type;
    l_iteration_cnt           number := pkg_param_config.F_Param_Value_Num(i_param_name => 'pwd_hashing_iteration_cnt');
    l_pwd_expiry_days         number;
    l_resetting_username      user_pool.username%type := v('APP_USER');
    l_resetting_user_id_or_dn varchar2(256);
    l_resetting_user_source   activities.user_source%type;
    l_has_right               boolean;
    l_pi_Tmp                  pls_integer;
  begin
    -- logger.append_param(l_params
    --                    ,'i_username'
    --                    ,i_username);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    begin
      select id, pw_expire
        into l_user_id, l_pw_expire
        from users
       where username = upper(i_username);
    exception
      when no_data_found then
        raise_application_error(gc_err_usr_not_exists
                               ,gc_err_msg_usr_not_exists);
    end;

    if (l_resetting_username is null)
    then
      -- Specific db-users and/or -roles have allways the rights to change a password!
      begin
        select 1
          into l_pi_Tmp
          from dual
         where SYS_CONTEXT('USERENV'
                          ,'SESSION_USER') in ('SYS'
                                              ,'SYSTEM')
            or SYS_CONTEXT('USERENV'
                          ,'ISDBA') = 'TRUE';
      exception
        when NO_DATA_FOUND then
          l_pi_Tmp := 0;
      end;
      --
      l_has_right := sys.diutil.int_to_bool(l_pi_Tmp);
      --
    else
      /* Get ID, resp. DN, of the user trying to reset the password */
      GET_USER_ID_AND_SOURCE(i_username    => l_resetting_username
                            ,o_user_id     => l_resetting_user_id_or_dn
                            ,o_user_source => l_resetting_user_source);

      /* Check if the user trying to reset the password has the right to EDIT in object "User Management - Users, Roles, Permissions" */
      l_has_right := pkg_authorization.HAS_USER_PERMISSION(i_user_id_or_dn => l_resetting_user_id_or_dn
                                                          ,i_object_id     => 'UMU'
                                                          ,i_grant_id      => 'EDT');
    end if;

    if not l_has_right
    then
      raise_application_error(gc_err_no_permission
                             ,gc_err_msg_no_permission);
    end if;

    /* Check if password meets security requirements. Raise error, if not. */
    PASSWORD_SECURE_OR_ERROR(i_username => i_username
                            ,i_password => i_password_new);

    /* Hash password */
    l_salt := GENERATE_SALT(i_length => 32);
    l_hash := PBKDF2_hmac_sha_256(i_password   => i_password_new
                                 ,i_salt       => l_salt
                                 ,i_iterations => l_iteration_cnt
                                 ,i_key_length => g_PBKDF2_out_key_length); -- Note: the given key length will be the length for the raw, but the output will be in varchar2 with the duplicate length

    /* Check when password expires */
    l_pwd_expiry_days := pkg_param_config.F_Param_Value_Num(i_param_name => 'pwd_expiry_days');

    update users
       set pw_salt            = l_salt
          ,pw_iteration_count = l_iteration_cnt
          ,pw_hash            = l_hash
          ,pw_expiration_date = case l_pw_expire when 0 then to_date('31.12.9999') when 1 then (sysdate + l_pwd_expiry_days) end
          ,pw_must_be_changed = 'Y'
          ,dml_at             = sysdate
     where id = l_user_id;

    update users$sgd
       set bad_password_count = 0
     where id = l_user_id;
    commit;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end RESET_PASSWORD;

  /**
  * Create a new user in Dermalog User Management <br/>
  * @param  i_username    username
  * @param  i_first_name  first name
  * @param  i_last_name   last name
  * @param  i_mail_address mail address
  * @param  i_state        state
  * @param  i_password    password
  * @return ID of user
  <br/><br/>
  */
  function ADD_USER(i_username            in varchar2
                   ,i_first_name          in varchar2
                   ,i_last_name           in varchar2
                   ,i_mail_address        in varchar2
                   ,i_phone_number        in varchar2
                   ,i_state               in number
                   ,i_password            in varchar2
                   ,i_pwd_must_be_changed in varchar2 default 'N'
                   ,i_insert_source       in varchar2 default user
                   ,i_pw_expire           in number   default 1
                   ,i_national_id         in number   default null
                   ,i_first_name_thai     in varchar2 default null
                   ,i_last_name_thai      in varchar2 default null
                   ,i_dob                 in varchar2 default null
                   ,i_rank                in varchar2 default null
                   ,i_department_level_1  in number   default null
                   ,i_department_level_2  in number   default null
                   ,i_department_level_3  in number   default null
                   ,i_position            in varchar2 default null
                    --
                    ) return varchar2 as
    --
    l_scope   logger_logs.scope%type := g_scope_prefix || 'ADD_USER';
    -- l_params  logger.tab_param;
    l_user_id users.id%type;
    --l_user_in_ad boolean;
    l_dn varchar2(256);

    l_salt            users.pw_salt%type;
    l_hash            users.pw_hash%type;
    l_iteration_cnt   number := pkg_param_config.F_Param_Value_Num(i_param_name => 'pwd_hashing_iteration_cnt');
    l_pwd_expiry_days number;

  begin
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    /* Verify that username does not already exist in AD, if AD is used */
    if pkg_param_config.F_Param_Value_Is_On(i_param_name => 'usr_from_ad') = 1
    then
      if dl_ldap.find_user(i_username => i_username
                          ,o_dn       => l_dn)
      then
        raise_application_error(gc_err_usr_ex
                               ,gc_err_msg_usr_ex_in_ad);
      end if;
    end if;

    /* Check if password meets security requirements. Raise error, if not. */
    PASSWORD_SECURE_OR_ERROR(i_username     => i_username
                            ,i_password     => i_password
                            ,i_first_name   => i_first_name
                            ,i_last_name    => i_last_name
                            ,i_phone_number => i_phone_number);

    /* Hash password */
    l_salt := GENERATE_SALT(i_length => 32);
    l_hash := PBKDF2_hmac_sha_256(i_password   => i_password
                                 ,i_salt       => l_salt
                                 ,i_iterations => l_iteration_cnt
                                 ,i_key_length => g_PBKDF2_out_key_length); -- Note: the given key length will be the length for the raw, but the output will be in varchar2 with the duplicate length

    /* Check when password expires */
    l_pwd_expiry_days := pkg_param_config.F_Param_Value_Num(i_param_name => 'pwd_expiry_days');

    begin
      insert into USERS
        (USERNAME
        ,FIRST_NAME
        ,LAST_NAME
        ,MAIL_ADDRESS
        ,PHONE_NUMBER
        ,STATE
        ,PW_HASH
        ,PW_SALT
        ,PW_ITERATION_COUNT
        ,PW_EXPIRE
        ,PW_EXPIRATION_DATE
        ,PW_MUST_BE_CHANGED
        ,INS_BY
         --
        ,NATIONAL_ID
        ,FIRST_NAME_THAI
        ,LAST_NAME_THAI
        ,DOB
        ,RANK
        ,DEPARTMENT_LEVEL_1
        ,DEPARTMENT_LEVEL_2
        ,DEPARTMENT_LEVEL_3
        ,POSITION
         --
         )
      values
        (upper(i_username)
        ,i_first_name
        ,i_last_name
        ,i_mail_address
        ,i_phone_number
        ,i_state
        ,l_hash
        ,l_salt
        ,l_iteration_cnt
        ,i_pw_expire
        ,case i_pw_expire when 0 then to_date('31.12.9999') when 1 then (sysdate + l_pwd_expiry_days) end
        ,i_pwd_must_be_changed
        ,nvl(i_insert_source
            ,l_scope)
         --
        ,i_national_id
        ,i_first_name_thai
        ,i_last_name_thai
        ,i_dob
        ,i_rank
        ,i_department_level_1
        ,i_department_level_2
        ,i_department_level_3
        ,i_position
         --
         );
    exception
      when dup_val_on_index then
        if lower(sqlerrm) like '%username_un%'
        then
          raise_application_error(gc_err_usr_ex
                                 ,gc_err_msg_username_ex);
        end if;
    end;

    select id
      into l_user_id
      from users
     where username = upper(i_username);

    insert into USERS$SGD
      (ID
      ,LAST_LOGIN
      ,BAD_PASSWORD_COUNT
      ,OFFLINE_PIN
       --
       )
    values
      (l_user_id
      ,null
      ,0
      ,floor(dbms_random.value(1000, 9999))
       --
       );

    commit;

    return l_user_id;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end ADD_USER;
  --
  -----------------------------------------------------------------------------
  /**
  * Authenticate a user against Dermalog User Management <br/>
  * @param  i_username       id of user
  * @param  i_password       password
  <br/><br/>
  */
  procedure AUTHENTICATE(i_username in varchar2
                        ,i_password in varchar2) as
    -- l_scope                 logger_logs.scope%type := g_scope_prefix || 'AUTHENTICATE';
    -- l_params                logger.tab_param;
    l_user_id               users.id%type;
    l_user_state            users.state%type;
    l_bad_password_count    users$sgd.bad_password_count%type;
    l_last_login            users$sgd.last_login%type;
    l_set_expired           users$sgd.set_expired%type;
    l_err_msg_usr_no_access varchar2(2048) := 'User has no access right!';
    l_IP                    varchar2(200) := SYS_CONTEXT('USERENV'
                                                        ,'IP_ADDRESS');
  begin
    -- logger.append_param(l_params
    --                    ,'i_username'
    --                    ,i_username);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    begin
      select id
            ,state
        into l_user_id
            ,l_user_state
        from users
       where username = upper(i_username);
    exception
      when no_data_found then
        raise_application_error(gc_err_usr_not_exists
                               ,gc_err_msg_usr_not_exists);
    end;

    /* Check if user state is active. Raise error, if not. */
    if l_user_state != 1
    then
      case l_user_state
        when 0 then
          l_err_msg_usr_no_access := l_err_msg_usr_no_access || ' ' || 'User must be activated first.';
        when -5 then
          l_err_msg_usr_no_access := l_err_msg_usr_no_access || ' ' || 'User is locked.';
        when -1 then
          l_err_msg_usr_no_access := l_err_msg_usr_no_access || ' ' || 'User account has expired.';
        else
          null;
      end case;
      LOG_USER_ACTIVITY(i_user_id     => l_user_id
                       ,i_user_source => 2
                       ,i_IP          => l_IP
                       ,i_activity    => gc_activity_failed_login
                       ,i_comments    => l_err_msg_usr_no_access);
      raise_application_error(gc_err_usr_no_access
                             ,l_err_msg_usr_no_access);
    end if;

    /* Check if user has access right. Raise error, if not. */
    begin
      select bad_password_count
        into l_bad_password_count
        from users$sgd
       where id = l_user_id;
    exception
      when no_data_found then
        LOG_USER_ACTIVITY(i_user_id     => l_user_id
                         ,i_user_source => 2
                         ,i_IP          => l_IP
                         ,i_activity    => gc_activity_failed_login
                         ,i_comments    => 'User has no password.');
        raise_application_error(gc_err_usr_no_access
                               ,l_err_msg_usr_no_access || ' User has no password.');
    end;

    if IS_PWD_CHANGE_NECESSARY(i_username => i_username)
    then
      raise_application_error(gc_err_pwd_change
                             ,gc_err_msg_pwd_change);
    end if;

    if l_bad_password_count >= pkg_param_config.F_Param_Value_Num(i_param_name => 'pwd_max_attempts')
    then

      LOG_USER_ACTIVITY(i_user_id     => l_user_id
                       ,i_user_source => 2
                       ,i_IP          => l_IP
                       ,i_activity    => gc_activity_failed_login
                       ,i_comments    => 'Too many failed login attempts.');
      raise_application_error(gc_err_usr_no_access
                             ,l_err_msg_usr_no_access || ' Too many failed login attempts.');
    end if;

    /* Check if user account is inactiv */

    begin
      select last_login, set_expired
        into l_last_login, l_set_expired
        from users$sgd
      where id = l_user_id;
    exception
      when no_data_found then
        LOG_USER_ACTIVITY(i_user_id     => l_user_id
                         ,i_user_source => 2
                         ,i_IP          => l_IP
                         ,i_activity    => gc_activity_failed_login
                         ,i_comments    => 'User has no password.');
        raise_application_error(gc_err_usr_no_access
                               ,l_err_msg_usr_no_access || ' User has no password.');
    end;

    if l_last_login < sysdate - pkg_param_config.F_Param_Value_Num(i_param_name => 'acc_expire_after')
      then
        /* Check if the account has been set to inactive before */
        if l_set_expired < sysdate - pkg_param_config.F_Param_Value_Num(i_param_name => 'acc_expire_after')
          or l_set_expired is null
          then
            LOG_USER_ACTIVITY(i_user_id     => l_user_id
                       ,i_user_source => 2
                       ,i_IP          => l_IP
                       ,i_activity    => gc_activity_failed_login
                       ,i_comments    => 'User account has expired.');
            /* Set to know if the account has been manually unlocked*/
            begin
              update users$sgd
                set set_expired = sysdate
              where id = l_user_id;
              /* Update user account to inactive*/
              update users
                set state = -1
              where id = l_user_id;
            end;
            /* Raise error*/
            raise_application_error(gc_err_usr_no_access
                             ,l_err_msg_usr_no_access || ' User account has expired.');
          end if;
    end if;


    /* Check if user has valid password. Log failed login attempt and raise error, if not */
    begin
      PASSWORD_CORRECT_OR_ERROR(i_user_id  => l_user_id
                               ,i_password => i_password);
    exception
      when others then
        LOG_USER_ACTIVITY(i_user_id     => l_user_id
                         ,i_user_source => 2
                         ,i_IP          => l_IP
                         ,i_activity    => gc_activity_failed_login
                         ,i_comments    => sqlerrm);
        update users$sgd
           set bad_password_count =
               (nvl(bad_password_count
                   ,0) + 1)
         where id = l_user_id;
        commit;

          if l_bad_password_count + 1 >= pkg_param_config.F_Param_Value_Num(i_param_name => 'pwd_max_attempts')
          then
            update dl_user_management.users
              set state = -5
            where id = l_user_id;
          end if;

        raise;
    end;

    /* Reset bad password counter to 0 */
    update users$sgd
       set bad_password_count = 0
     where id = l_user_id
       and nvl(bad_password_count
              ,0) > 0;

    /* Remove flag thats shows if the user account was set to inactive */
    update users$sgd
       set set_expired = null
     where id = l_user_id;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end AUTHENTICATE;

  --
  -----------------------------------------------------------------------------
  /**
  * Function for custom authentication scheme in apex. Note: Names of Parameters (p_username and p_password) MUST NOT be changed! <br/>
  * @param  p_username       id of user
  * @param  p_password       password
  * @return TRUE if user could be authenticated, else FALSE
  <br/><br/>
  */
  function APEX_AUTHENTICATE(p_username in varchar2
                            ,p_password in varchar2) return boolean as
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'APEX_AUTHENTICATE';
    -- l_params logger.tab_param;
    l_dn     varchar2(256);
  begin
    -- logger.append_param(l_params
    --                    ,'p_username'
    --                    ,p_username);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    /* Depending on the parameters settings for use of Active Directory and Dermalog User Management,
    chose against which pool of users to authenticate the user */
    if pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'usr_from_ad') = 1
    then
      if dl_ldap.find_user(i_username => p_username
                          ,o_dn       => l_dn)
      then
        return dl_ldap.AUTHENTICATE(i_username => p_username
                                   ,i_password => p_password);
      elsif pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'usr_from_dl_um') = 1
      then
        AUTHENTICATE(i_username => p_username
                    ,i_password => p_password);
      else
        raise_application_error(gc_err_usr_not_exists
                               ,gc_err_msg_usr_not_exists);
      end if;
    elsif pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'usr_from_dl_um') = 1
    then
      AUTHENTICATE(i_username => p_username
                  ,i_password => p_password);
    else
      raise_application_error(gc_err_no_um
                             ,gc_err_msg_no_um);
    end if;

    -- logger.log('END'
    --           ,l_scope);

    return true;
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      return false;
  end APEX_AUTHENTICATE;

  /**
  * Procedure to be called directly after LOGIN for logging purposes <br/>
  * @param  i_username  username
  <br/><br/>
  */
  procedure POST_LOGIN(i_username in varchar2 default V('APP_USER')) as
    -- l_scope         logger_logs.scope%type := g_scope_prefix || 'POST_LOGIN';
    -- l_params        logger.tab_param;
    l_user_id_or_dn varchar2(256);
    l_user_source   activities.user_source%type;
  begin
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    GET_USER_ID_AND_SOURCE(i_username    => i_username
                          ,o_user_id     => l_user_id_or_dn
                          ,o_user_source => l_user_source);

    pkg_set_custom_ctx.Set_Apex_Context(i_user_source => l_user_source);

    LOG_USER_ACTIVITY(i_user_id  => l_user_id_or_dn
                     ,i_activity => gc_activity_login
                     ,i_comments => null);

    if sys_context(pkg_set_custom_ctx.g_CtxNamespace
                  ,pkg_set_custom_ctx.g_CtxUserSource) = 2
    then
      update users$sgd
         set last_login = sysdate
       where id = l_user_id_or_dn;
    end if;

    commit;

    -- Set Session-Time
    declare
        l_time number;
    begin
        select active_num
        into l_time
        from dl_user_management.parameter_settings
        where name = 'session_time';
        APEX_UTIL.SET_SESSION_MAX_IDLE_SECONDS(p_seconds => l_time);
    end;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end POST_LOGIN;

  /**
  * Procedure to be called directly after initialization of a new database session for setting the context <br/>
  * @param  i_username  username
  <br/><br/>
  */
  procedure POST_INIT_NEW_DB_SESSION(i_username in varchar2 default V('APP_USER')) as
    -- l_scope         logger_logs.scope%type := g_scope_prefix || 'POST_INIT_NEW_DB_SESSION';
    -- l_params        logger.tab_param;
    l_user_id_or_dn varchar2(256);
    l_user_source   activities.user_source%type;
  begin
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    begin
      GET_USER_ID_AND_SOURCE(i_username    => i_username
                            ,o_user_id     => l_user_id_or_dn
                            ,o_user_source => l_user_source);
    exception
      when others then
        l_user_source := null;
    end;

    pkg_set_custom_ctx.Set_Apex_Context(i_user_source => l_user_source);

    commit;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end POST_INIT_NEW_DB_SESSION;

  /**
  * Procedure to be called directly after LOGOUT for for logging purposes <br/>
  * @param  i_username  username
  <br/><br/>
  */
  procedure POST_LOGOUT(i_username in varchar2 default V('APP_USER')) as
    -- l_scope       logger_logs.scope%type := g_scope_prefix || 'POST_LOGOUT';
    -- l_params      logger.tab_param;
    l_user_id     users.id%type;
    l_user_source activities.user_source%type;
  begin
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    GET_USER_ID_AND_SOURCE(i_username    => i_username
                          ,o_user_id     => l_user_id
                          ,o_user_source => l_user_source);

    LOG_USER_ACTIVITY(i_user_id  => l_user_id
                     ,i_activity => gc_activity_logout
                     ,i_comments => null);

    commit;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end POST_LOGOUT;

  --
  -----------------------------------------------------------------------------
  /**
  * Get CN out of DN (active Directory) <br/>
  * @param  i_dn             DN
  * @return o_CN             CN
  <br/><br/>
  */
  function Get_CN_from_DN(i_dn in varchar2) return varchar2 as
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'Get_CN_from_DN';
    -- l_params logger.tab_param;
  begin
    -- logger.append_param(l_params
    --                    ,'i_dn'
    --                    ,i_dn);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    return substr(i_dn
                 ,instr(i_dn
                       ,'CN=') + 3
                 ,instr(i_dn
                       ,',') - instr(i_dn
                                    ,'CN=') - 3);

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end Get_CN_from_DN;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   @param  ???
  *   @return ???
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
  * WWirns    05.09.2018  Add_Computer: Added
  *******************************************************************************/
  --
  function Add_Computer(i_Name        in varchar2
                       ,i_Description in varchar2
                       ,i_DNS_Name    in varchar2
                       ,i_Sort_Order  in integer
                       ,i_Is_Active   in integer
                        --
                        ) return varchar2 is
    --
    -- l_scope       logger_logs.scope%type := g_scope_prefix || 'Add_Computer';
    -- l_params      logger.tab_param;
    l_computer_id computers.id%type;
    l_dn          varchar2(256);
    --
  begin
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    -- Verify that username does not already exist in AD, if AD is used
    if pkg_param_config.F_Param_Value_Is_On(i_param_name => 'computer_from_ad') = 1
    then
      if DL_LDAP.Find_Computer(p_Name => i_Name
                              ,p_DN   => l_dn)
      then
        raise_application_error(gc_err_comp_ex
                               ,gc_err_msg_comp_ex_in_ad);
      end if;
    end if;

    begin
      insert into COMPUTERS
        (name
        ,DESCRIPTION
        ,DNS_NAME
        ,SORT_ORDER
        ,IS_ACTIVE
         --
         )
      values
        (upper(i_Name)
        ,i_Description
        ,i_DNS_Name
        ,i_Sort_Order
        ,i_Is_Active
         --
         );
    exception
      when dup_val_on_index then
        if lower(sqlerrm) like '%computer_un%'
        then
          raise_application_error(gc_err_comp_ex
                                 ,gc_err_msg_compname_ex);
        end if;
    end;

    select id
      into l_computer_id
      from COMPUTERS
     where name = upper(i_Name);

    commit;

    return l_computer_id;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end Add_Computer;
  --
  --
  /**
  * Save list of roles for a user
  *
  * PARAMETERS
  *   @param  i_user_id    id or dn of user
  *   @param  i_roles_list colon separated list of role IDs or DNs
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
  * WWirns    29.08.2018  Save_User_Roles: Added
  *******************************************************************************/
  --
  procedure Save_User_Roles(i_user_id    in varchar2
                           ,i_roles_list in clob
                            --
                            ) as
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'Save_User_Roles';
    -- l_params logger.tab_param;
  begin
    -- logger.append_param(l_params
    --                    ,'i_user_id'
    --                    ,i_user_id);
    -- logger.append_param(l_params
    --                    ,'i_roles_list'
    --                    ,i_roles_list);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    case
      when lower(i_user_id) like '%cn=%' -- User from AD
       then
        delete from user_role_rel
         where user_dn = i_user_id
           and ':' || nvl(i_roles_list
                         ,'$NV$') || ':' not like '%:' || role_id || ':%'
           and ':' || nvl(i_roles_list
                         ,'$NV$') || ':' not like '%:' || role_dn || ':%';

        insert into user_role_rel
          (user_dn
          ,role_id
          ,role_dn)
          (select i_user_id
                 ,case source
                    when 2 then
                     id_or_dn
                    else
                     null
                  end as role_id
                 ,case source
                    when 1 then
                     id_or_dn
                    else
                     null
                  end as role_dn
             from role_pool
            where ':' || i_roles_list || ':' like '%:' || id_or_dn || ':%'
           minus
           select user_dn
                 ,role_id
                 ,role_dn
             from user_role_rel
            where user_dn = i_user_id);
      else
        -- User from UM
        delete from user_role_rel
         where user_id = i_user_id
           and ':' || nvl(i_roles_list
                         ,'$NV$') || ':' not like '%:' || role_id || ':%'
           and ':' || nvl(i_roles_list
                         ,'$NV$') || ':' not like '%:' || role_dn || ':%';

        insert into user_role_rel
          (user_id
          ,role_id
          ,role_dn)
          (select i_user_id
                 ,case source
                    when 2 then
                     id_or_dn
                    else
                     null
                  end as role_id
                 ,case source
                    when 1 then
                     id_or_dn
                    else
                     null
                  end as role_dn
             from role_pool
            where ':' || i_roles_list || ':' like '%:' || id_or_dn || ':%'
           minus
           select user_id
                 ,role_id
                 ,role_dn
             from user_role_rel
            where user_id = i_user_id);
    end case;

    commit;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end Save_User_Roles;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   @param  ???
  *   @return ???
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
  * WWirns    11.09.2018  Save_User_Org_Units: Added
  *******************************************************************************/
  --
  procedure Save_User_Org_Units(i_user_id       in varchar2
                               ,i_org_unit_list in clob
                                --
                                ) is
    --
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'Save_User_Org_Units';
    -- l_params logger.tab_param;
    --
  begin
    -- logger.append_param(l_params
    --                    ,'i_user_id'
    --                    ,i_user_id);
    -- logger.append_param(l_params
    --                    ,'i_org_unit_list'
    --                    ,i_org_unit_list);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    case
      when lower(i_user_id) like '%cn=%' -- User from AD
       then
        delete from user_org_unit_rel
         where user_dn = i_user_id
           and ':' || nvl(i_org_unit_list
                         ,'$NV$') || ':' not like '%:' || org_unit_id || ':%'
           and ':' || nvl(i_org_unit_list
                         ,'$NV$') || ':' not like '%:' || org_unit_dn || ':%';

        insert into user_org_unit_rel
          (user_dn
          ,org_unit_id
          ,org_unit_dn)
          (select i_user_id
                 ,case source
                    when 2 then
                     id_or_dn
                    else
                     null
                  end as org_unit_id
                 ,case source
                    when 1 then
                     id_or_dn
                    else
                     null
                  end as org_unit_dn
             from org_unit_pool
            where ':' || i_org_unit_list || ':' like '%:' || id_or_dn || ':%'
           minus
           select user_dn
                 ,org_unit_id
                 ,org_unit_dn
             from user_org_unit_rel
            where user_dn = i_user_id);
      else
        -- User from UM
        delete from user_org_unit_rel
         where user_id = i_user_id
           and ':' || nvl(i_org_unit_list
                         ,'$NV$') || ':' not like '%:' || org_unit_id || ':%'
           and ':' || nvl(i_org_unit_list
                         ,'$NV$') || ':' not like '%:' || org_unit_dn || ':%';

        insert into user_org_unit_rel
          (user_id
          ,org_unit_id
          ,org_unit_dn)
          (select i_user_id
                 ,case source
                    when 2 then
                     id_or_dn
                    else
                     null
                  end as org_unit_id
                 ,case source
                    when 1 then
                     id_or_dn
                    else
                     null
                  end as org_unit_dn
             from org_unit_pool
            where ':' || i_org_unit_list || ':' like '%:' || id_or_dn || ':%'
           minus
           select user_id
                 ,org_unit_id
                 ,org_unit_dn
             from user_org_unit_rel
            where user_id = i_user_id);
    end case;

    commit;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end Save_User_Org_Units;
  --
  -- Computer
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   @param  ???
  *   @return ???
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
  * WWirns    06.09.2018  Save_Computer_Roles: Added
  *******************************************************************************/
  --
  procedure Save_Computer_Roles(i_computer_id in varchar2
                               ,i_roles_list  in clob
                                --
                                ) is
    --
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'Save_Computer_Roles';
    -- l_params logger.tab_param;
    --
  begin
    -- logger.append_param(l_params
    --                    ,'i_computer_id'
    --                    ,i_computer_id);
    -- logger.append_param(l_params
    --                    ,'i_roles_list'
    --                    ,i_roles_list);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    case
      when lower(i_computer_id) like '%cn=%' -- computer from AD
       then
        delete from computer_role_rel
         where computer_dn = i_computer_id
           and ':' || nvl(i_roles_list
                         ,'$NV$') || ':' not like '%:' || role_id || ':%'
           and ':' || nvl(i_roles_list
                         ,'$NV$') || ':' not like '%:' || role_dn || ':%';

        insert into computer_role_rel
          (computer_dn
          ,role_id
          ,role_dn)
          (select i_computer_id
                 ,case source
                    when 2 then
                     id_or_dn
                    else
                     null
                  end as role_id
                 ,case source
                    when 1 then
                     id_or_dn
                    else
                     null
                  end as role_dn
             from role_pool
            where ':' || i_roles_list || ':' like '%:' || id_or_dn || ':%'
           minus
           select computer_dn
                 ,role_id
                 ,role_dn
             from computer_role_rel
            where computer_dn = i_computer_id);
      else
        -- computer from UM
        delete from computer_role_rel
         where computer_id = i_computer_id
           and ':' || nvl(i_roles_list
                         ,'$NV$') || ':' not like '%:' || role_id || ':%'
           and ':' || nvl(i_roles_list
                         ,'$NV$') || ':' not like '%:' || role_dn || ':%';

        insert into computer_role_rel
          (computer_id
          ,role_id
          ,role_dn)
          (select i_computer_id
                 ,case source
                    when 2 then
                     id_or_dn
                    else
                     null
                  end as role_id
                 ,case source
                    when 1 then
                     id_or_dn
                    else
                     null
                  end as role_dn
             from role_pool
            where ':' || i_roles_list || ':' like '%:' || id_or_dn || ':%'
           minus
           select computer_id
                 ,role_id
                 ,role_dn
             from computer_role_rel
            where computer_id = i_computer_id);
    end case;

    commit;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end Save_Computer_Roles;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   @param  ???
  *   @return ???
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
  * WWirns    11.09.2018  Save_Computer_Org_Units: Added
  *******************************************************************************/
  --
  procedure Save_Computer_Org_Units(i_computer_id   in varchar2
                                   ,i_org_unit_list in clob
                                    --
                                    ) is
    --
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'Save_Computer_Org_Units';
    -- l_params logger.tab_param;
    --
  begin
    -- logger.append_param(l_params
    --                    ,'i_computer_id'
    --                    ,i_computer_id);
    -- logger.append_param(l_params
    --                    ,'i_org_unit_list'
    --                    ,i_org_unit_list);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    case
      when lower(i_computer_id) like '%cn=%' -- computer from AD
       then
        delete from computer_org_unit_rel
         where computer_dn = i_computer_id
           and ':' || nvl(i_org_unit_list
                         ,'$NV$') || ':' not like '%:' || org_unit_id || ':%'
           and ':' || nvl(i_org_unit_list
                         ,'$NV$') || ':' not like '%:' || org_unit_dn || ':%';

        insert into computer_org_unit_rel
          (computer_dn
          ,org_unit_id
          ,org_unit_dn)
          (select i_computer_id
                 ,case source
                    when 2 then
                     id_or_dn
                    else
                     null
                  end as org_unit_id
                 ,case source
                    when 1 then
                     id_or_dn
                    else
                     null
                  end as org_unit_dn
             from org_unit_pool
            where ':' || i_org_unit_list || ':' like '%:' || id_or_dn || ':%'
           minus
           select computer_dn
                 ,org_unit_id
                 ,org_unit_dn
             from computer_org_unit_rel
            where computer_dn = i_computer_id);
      else
        -- computer from UM
        delete from computer_org_unit_rel
         where computer_id = i_computer_id
           and ':' || nvl(i_org_unit_list
                         ,'$NV$') || ':' not like '%:' || org_unit_id || ':%'
           and ':' || nvl(i_org_unit_list
                         ,'$NV$') || ':' not like '%:' || org_unit_dn || ':%';

        insert into computer_org_unit_rel
          (computer_id
          ,org_unit_id
          ,org_unit_dn)
          (select i_computer_id
                 ,case source
                    when 2 then
                     id_or_dn
                    else
                     null
                  end as org_unit_id
                 ,case source
                    when 1 then
                     id_or_dn
                    else
                     null
                  end as org_unit_dn
             from org_unit_pool
            where ':' || i_org_unit_list || ':' like '%:' || id_or_dn || ':%'
           minus
           select computer_id
                 ,org_unit_id
                 ,org_unit_dn
             from computer_org_unit_rel
            where computer_id = i_computer_id);
    end case;

    commit;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end Save_Computer_Org_Units;
  --
  -- Role
  --
  --
  /**
  * Save list of grant on an object for a role
  *
  * PARAMETERS
  *   @param  i_role_id    id of role
  *   @param  i_object_id  id of object
  *   @param  i_grants_list colon separated list of grant IDs
  *   @return ???
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
  *******************************************************************************/
  --
  procedure Save_Role_Permissions(i_role_id     in varchar2
                                 ,i_object_id   in varchar2
                                 ,i_grants_list in clob
                                  --
                                  ) as
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'Save_Role_Permissions';
    -- l_params logger.tab_param;
  begin
    -- logger.append_param(l_params
    --                    ,'i_role_id'
    --                    ,i_role_id);
    -- logger.append_param(l_params
    --                    ,'i_object_id'
    --                    ,i_object_id);
    -- logger.append_param(l_params
    --                    ,'i_grants_list'
    --                    ,i_grants_list);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    case
      when lower(i_role_id) like '%cn=%' -- Role from AD
       then
        delete from role_object_grant_rel
         where role_dn = i_role_id
           and object_grant_rel_id in (select id
                                         from object_grant_rel
                                        where object_id = i_object_id
                                          and ':' || nvl(i_grants_list
                                                        ,'$NV$') || ':' not like '%:' || grant_id || ':%');

        insert into role_object_grant_rel
          (role_dn
          ,object_grant_rel_id)
          (select i_role_id
                 ,id
             from object_grant_rel
            where object_id = i_object_id
              and ':' || i_grants_list || ':' like '%:' || grant_id || ':%'
           minus
           select role_dn
                 ,object_grant_rel_id
             from role_object_grant_rel
            where role_dn = i_role_id);
      else
        -- Role from UM
        delete from role_object_grant_rel
         where role_id = i_role_id
           and object_grant_rel_id in (select id
                                         from object_grant_rel
                                        where object_id = i_object_id
                                          and ':' || nvl(i_grants_list
                                                        ,'$NV$') || ':' not like '%:' || grant_id || ':%');

        insert into role_object_grant_rel
          (role_id
          ,object_grant_rel_id)
          (select i_role_id
                 ,id
             from object_grant_rel
            where object_id = i_object_id
              and ':' || i_grants_list || ':' like '%:' || grant_id || ':%'
           minus
           select role_id
                 ,object_grant_rel_id
             from role_object_grant_rel
            where role_id = i_role_id);
    end case;

    commit;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end Save_Role_Permissions;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   @param  ???
  *   @return ???
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
  * WWirns    06.09.2018  Save_Role_Roles: Added
  *******************************************************************************/
  --
  procedure Save_Role_Roles(i_role_id    in varchar2
                           ,i_roles_list in clob
                            --
                            ) as
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'Save_Role_Roles';
    -- l_params logger.tab_param;
  begin
    --
    -- logger.append_param(l_params
    --                    ,'i_role_id'
    --                    ,i_role_id);
    -- logger.append_param(l_params
    --                    ,'i_roles_list'
    --                    ,i_roles_list);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    case
      when lower(i_role_id) like '%cn=%' -- Role from AD
       then
        delete from ROLE_ROLE_REL d
         where d.ROLE_DN = i_role_id
           and ':' || nvl(i_roles_list
                         ,'$NV$') || ':' not like '%:' || d.MEMBER_ROLE_ID || ':%'
           and ':' || nvl(i_roles_list
                         ,'$NV$') || ':' not like '%:' || d.MEMBER_ROLE_DN || ':%';

        insert into ROLE_ROLE_REL
          (ROLE_DN
          ,MEMBER_ROLE_ID
          ,MEMBER_ROLE_DN)
          (select i_role_id
                 ,case source
                    when 2 then
                     ID_OR_DN
                    else
                     null
                  end as ROLE_ID
                 ,case source
                    when 1 then
                     ID_OR_DN
                    else
                     null
                  end as ROLE_DN
             from ROLE_POOL
            where ':' || i_roles_list || ':' like '%:' || id_or_dn || ':%'
           minus
           select ROLE_DN
                 ,MEMBER_ROLE_ID
                 ,MEMBER_ROLE_DN
             from ROLE_ROLE_REL
            where ROLE_DN = i_role_id);
      else
        -- Role from UM
        delete from ROLE_ROLE_REL
         where ROLE_ID = i_role_id
           and ':' || nvl(i_roles_list
                         ,'$NV$') || ':' not like '%:' || MEMBER_ROLE_ID || ':%'
           and ':' || nvl(i_roles_list
                         ,'$NV$') || ':' not like '%:' || MEMBER_ROLE_DN || ':%';

        insert into ROLE_ROLE_REL
          (ROLE_ID
          ,MEMBER_ROLE_ID
          ,MEMBER_ROLE_DN)
          (select i_role_id
                 ,case source
                    when 2 then
                     ID_OR_DN
                    else
                     null
                  end as ROLE_ID
                 ,case source
                    when 1 then
                     ID_OR_DN
                    else
                     null
                  end as ROLE_DN
             from ROLE_POOL
            where ':' || i_roles_list || ':' like '%:' || ID_OR_DN || ':%'
           minus
           select ROLE_ID
                 ,MEMBER_ROLE_ID
                 ,MEMBER_ROLE_DN
             from ROLE_ROLE_REL
            where ROLE_ID = i_role_id);
    end case;

    commit;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end Save_Role_Roles;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   @param  ???
  *   @return ???
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
  * WWirns    06.09.2018  Save_Role_Member_Of_Roles: Added
  *******************************************************************************/
  --
  procedure Save_Role_Member_Of_Roles(i_role_id    in varchar2
                                     ,i_roles_list in clob
                                      --
                                      ) as
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'Save_Role_Member_Of_Roles';
    -- l_params logger.tab_param;
  begin
    -- logger.append_param(l_params
    --                    ,'i_role_id'
    --                    ,i_role_id);
    -- logger.append_param(l_params
    --                    ,'i_roles_list'
    --                    ,i_roles_list);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);
    case
      when (lower(i_role_id) like '%cn=%') then
        -- Role from AD
        delete from ROLE_ROLE_REL d
         where d.MEMBER_ROLE_DN = i_role_id
           and ':' || nvl(i_roles_list
                         ,'$NV$') || ':' not like '%:' || d.ROLE_ID || ':%'
           and ':' || nvl(i_roles_list
                         ,'$NV$') || ':' not like '%:' || d.ROLE_DN || ':%';

        insert into ROLE_ROLE_REL
          (MEMBER_ROLE_DN
          ,ROLE_ID
          ,ROLE_DN
           --
           )
          (
           --
           select i_role_id as MEMBER_ROLE_DN
                  ,case source
                     when 2 then
                      t0.ID_OR_DN
                     else
                      null
                   end as ROLE_ID
                  ,case source
                     when 1 then
                      t0.ID_OR_DN
                     else
                      null
                   end as ROLE_DN
             from ROLE_POOL t0
            where ':' || i_roles_list || ':' like '%:' || t0.ID_OR_DN || ':%'
           minus
           select t1.MEMBER_ROLE_DN
                  ,t1.ROLE_ID
                  ,t1.ROLE_DN
             from ROLE_ROLE_REL t1
            where t1.MEMBER_ROLE_DN = i_role_id
           --
           );
        --
      else
        -- Role from UM
        delete from ROLE_ROLE_REL d
         where d.MEMBER_ROLE_ID = i_role_id
           and ':' || nvl(i_roles_list
                         ,'$NV$') || ':' not like '%:' || d.ROLE_ID || ':%'
           and ':' || nvl(i_roles_list
                         ,'$NV$') || ':' not like '%:' || d.ROLE_DN || ':%';

        insert into ROLE_ROLE_REL
          (MEMBER_ROLE_ID
          ,ROLE_ID
          ,ROLE_DN
           --
           )
          (
           --
           select i_role_id as MEMBER_ROLE_ID
                  ,case source
                     when 2 then
                      t0.ID_OR_DN
                     else
                      null
                   end as ROLE_ID
                  ,case source
                     when 1 then
                      t0.ID_OR_DN
                     else
                      null
                   end as ROLE_DN
             from ROLE_POOL t0
            where ':' || i_roles_list || ':' like '%:' || t0.ID_OR_DN || ':%'
           minus
           select t1.MEMBER_ROLE_ID
                  ,t1.ROLE_ID
                  ,t1.ROLE_DN
             from ROLE_ROLE_REL t1
            where t1.MEMBER_ROLE_ID = i_role_id
           --
           );

    end case;

    commit;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end Save_Role_Member_Of_Roles;
  --
  --
  /**
  * Save list of users for role
  *
  * PARAMETERS
  *   @param  i_role_id    id or dn of role
  *   @param  i_users_list colon separated list of user IDs or DNs
  *   @return ???
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
  *******************************************************************************/
  --
  procedure Save_Role_Users(i_role_id    in varchar2
                           ,i_users_list in clob
                            --
                            ) as
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'Save_Role_Users';
    -- l_params logger.tab_param;
  begin
    -- logger.append_param(l_params
    --                    ,'i_role_id'
    --                    ,i_role_id);
    -- logger.append_param(l_params
    --                    ,'i_users_list'
    --                    ,i_users_list);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    case
      when lower(i_role_id) like '%cn=%' -- Role from AD
       then
        delete from user_role_rel
         where role_dn = i_role_id
           and ':' || nvl(i_users_list
                         ,'$NV$') || ':' not like '%:' || user_id || ':%'
           and ':' || nvl(i_users_list
                         ,'$NV$') || ':' not like '%:' || user_dn || ':%';

        insert into user_role_rel
          (role_dn
          ,user_id
          ,user_dn)
          (select i_role_id
                 ,case source
                    when 2 then
                     id_or_dn
                    else
                     null
                  end as user_id
                 ,case source
                    when 1 then
                     id_or_dn
                    else
                     null
                  end as user_dn
             from user_pool
            where ':' || i_users_list || ':' like '%:' || id_or_dn || ':%'
           minus
           select role_dn
                 ,user_id
                 ,user_dn
             from user_role_rel
            where role_dn = i_role_id);
      else
        -- Role from UM
        delete from user_role_rel
         where role_id = i_role_id
           and ':' || nvl(i_users_list
                         ,'$NV$') || ':' not like '%:' || user_id || ':%'
           and ':' || nvl(i_users_list
                         ,'$NV$') || ':' not like '%:' || user_dn || ':%';

        insert into user_role_rel
          (role_id
          ,user_id
          ,user_dn)
          (select i_role_id
                 ,case source
                    when 2 then
                     id_or_dn
                    else
                     null
                  end as user_id
                 ,case source
                    when 1 then
                     id_or_dn
                    else
                     null
                  end as user_dn
             from user_pool
            where ':' || i_users_list || ':' like '%:' || id_or_dn || ':%'
           minus
           select role_id
                 ,user_id
                 ,user_dn
             from user_role_rel
            where role_id = i_role_id);
    end case;

    commit;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end Save_Role_Users;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   @param  ???
  *   @return ???
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
  * WWirns    06.09.2018  Save_Role_Computers: Added
  *******************************************************************************/
  --
  procedure Save_Role_Computers(i_role_id       in varchar2
                               ,i_computer_list in clob
                                --
                                ) is
    --
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'Save_Role_Computers';
    -- l_params logger.tab_param;
    --
  begin
    -- logger.append_param(l_params
    --                    ,'i_role_id'
    --                    ,i_role_id);
    -- logger.append_param(l_params
    --                    ,'i_computer_list'
    --                    ,i_computer_list);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    case
      when lower(i_role_id) like '%cn=%' -- Role from AD
       then
        delete from computer_role_rel
         where role_dn = i_role_id
           and ':' || nvl(i_computer_list
                         ,'$NV$') || ':' not like '%:' || computer_id || ':%'
           and ':' || nvl(i_computer_list
                         ,'$NV$') || ':' not like '%:' || computer_dn || ':%';

        insert into computer_role_rel
          (role_dn
          ,computer_id
          ,computer_dn)
          (select i_role_id
                 ,case source
                    when 2 then
                     id_or_dn
                    else
                     null
                  end as computer_id
                 ,case source
                    when 1 then
                     id_or_dn
                    else
                     null
                  end as computer_dn
             from computer_pool
            where ':' || i_computer_list || ':' like '%:' || id_or_dn || ':%'
           minus
           select role_dn
                 ,computer_id
                 ,computer_dn
             from computer_role_rel
            where role_dn = i_role_id);
      else
        -- Role from UM
        delete from computer_role_rel
         where role_id = i_role_id
           and ':' || nvl(i_computer_list
                         ,'$NV$') || ':' not like '%:' || computer_id || ':%'
           and ':' || nvl(i_computer_list
                         ,'$NV$') || ':' not like '%:' || computer_dn || ':%';

        insert into computer_role_rel
          (role_id
          ,computer_id
          ,computer_dn)
          (select i_role_id
                 ,case source
                    when 2 then
                     id_or_dn
                    else
                     null
                  end as computer_id
                 ,case source
                    when 1 then
                     id_or_dn
                    else
                     null
                  end as computer_dn
             from computer_pool
            where ':' || i_computer_list || ':' like '%:' || id_or_dn || ':%'
           minus
           select role_id
                 ,computer_id
                 ,computer_dn
             from computer_role_rel
            where role_id = i_role_id);
    end case;

    commit;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end Save_Role_Computers;
  --
  -- Org-Unit
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   @param  ???
  *   @return ???
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
  * WWirns    06.09.2018  Save_Org_Unit_Org_Units: Added
  *******************************************************************************/
  --
  procedure Save_Org_Unit_Org_Units(i_org_unit_id   in varchar2
                                   ,i_org_unit_list in clob
                                    --
                                    ) is
    --
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'Save_Org_Unit_Org_Units';
    -- l_params logger.tab_param;
    --
  begin
    -- logger.append_param(l_params
    --                    ,'i_org_unit_id'
    --                    ,i_org_unit_id);
    -- logger.append_param(l_params
    --                    ,'i_org_unit_list'
    --                    ,i_org_unit_list);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    case
      when lower(i_org_unit_id) like '%cn=%' then
        -- org_unit from AD
        delete from ORG_UNIT_ORG_UNIT_REL d
         where d.org_unit_DN = i_org_unit_id
           and ':' || nvl(i_org_unit_list
                         ,'$NV$') || ':' not like '%:' || d.MEMBER_org_unit_ID || ':%'
           and ':' || nvl(i_org_unit_list
                         ,'$NV$') || ':' not like '%:' || d.MEMBER_org_unit_DN || ':%';

        insert into ORG_UNIT_ORG_UNIT_REL
          (org_unit_DN
          ,MEMBER_org_unit_ID
          ,MEMBER_org_unit_DN)
          (select i_org_unit_id
                 ,case source
                    when 2 then
                     ID_OR_DN
                    else
                     null
                  end as org_unit_ID
                 ,case source
                    when 1 then
                     ID_OR_DN
                    else
                     null
                  end as org_unit_DN
             from org_unit_POOL
            where ':' || i_org_unit_list || ':' like '%:' || id_or_dn || ':%'
           minus
           select org_unit_DN
                 ,MEMBER_org_unit_ID
                 ,MEMBER_org_unit_DN
             from org_unit_org_unit_REL
            where org_unit_DN = i_org_unit_id);
      else
        -- org_unit from UM
        delete from org_unit_org_unit_REL
         where org_unit_ID = i_org_unit_id
           and ':' || nvl(i_org_unit_list
                         ,'$NV$') || ':' not like '%:' || MEMBER_org_unit_ID || ':%'
           and ':' || nvl(i_org_unit_list
                         ,'$NV$') || ':' not like '%:' || MEMBER_org_unit_DN || ':%';

        insert into org_unit_org_unit_REL
          (org_unit_ID
          ,MEMBER_org_unit_ID
          ,MEMBER_org_unit_DN)
          (select i_org_unit_id
                 ,case source
                    when 2 then
                     ID_OR_DN
                    else
                     null
                  end as org_unit_ID
                 ,case source
                    when 1 then
                     ID_OR_DN
                    else
                     null
                  end as org_unit_DN
             from org_unit_POOL
            where ':' || i_org_unit_list || ':' like '%:' || ID_OR_DN || ':%'
           minus
           select org_unit_ID
                 ,MEMBER_org_unit_ID
                 ,MEMBER_org_unit_DN
             from org_unit_org_unit_REL
            where org_unit_ID = i_org_unit_id);
    end case;

    commit;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end Save_Org_Unit_Org_Units;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   @param  ???
  *   @return ???
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
  * WWirns    10.09.2018  Save_Org_Unit_Member_Of_OUnits: Added
  *******************************************************************************/
  --
  procedure Save_Org_Unit_Member_Of_OUnits(i_org_unit_id   in varchar2
                                          ,i_org_unit_list in clob
                                           --
                                           ) is
    --
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'Save_Org_Unit_Member_Of_OUnits';
    -- l_params logger.tab_param;
    --
  begin
    -- logger.append_param(l_params
    --                    ,'i_org_unit_id'
    --                    ,i_org_unit_id);
    -- logger.append_param(l_params
    --                    ,'i_org_unit_list'
    --                    ,i_org_unit_list);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);
    case
      when (lower(i_org_unit_id) like '%cn=%') then
        -- org_unit from AD
        delete from ORG_UNIT_ORG_UNIT_REL d
         where d.MEMBER_ORG_UNIT_DN = i_org_unit_id
           and ':' || nvl(i_org_unit_list
                         ,'$NV$') || ':' not like '%:' || d.ORG_UNIT_ID || ':%'
           and ':' || nvl(i_org_unit_list
                         ,'$NV$') || ':' not like '%:' || d.ORG_UNIT_DN || ':%';

        insert into ORG_UNIT_ORG_UNIT_REL
          (MEMBER_ORG_UNIT_DN
          ,ORG_UNIT_ID
          ,ORG_UNIT_DN
           --
           )
          (
           --
           select i_org_unit_id as MEMBER_ORG_UNIT_DN
                  ,case source
                     when 2 then
                      t0.ID_OR_DN
                     else
                      null
                   end as ORG_UNIT_ID
                  ,case source
                     when 1 then
                      t0.ID_OR_DN
                     else
                      null
                   end as ORG_UNIT_DN
             from ORG_UNIT_POOL t0
            where ':' || i_org_unit_list || ':' like '%:' || t0.ID_OR_DN || ':%'
           minus
           select t1.MEMBER_ORG_UNIT_DN
                  ,t1.ORG_UNIT_ID
                  ,t1.ORG_UNIT_DN
             from ORG_UNIT_ORG_UNIT_REL t1
            where t1.MEMBER_ORG_UNIT_DN = i_org_unit_id
           --
           );
        --
      else
        -- org_unit from UM
        delete from ORG_UNIT_ORG_UNIT_REL d
         where d.MEMBER_ORG_UNIT_ID = i_org_unit_id
           and ':' || nvl(i_org_unit_list
                         ,'$NV$') || ':' not like '%:' || d.ORG_UNIT_ID || ':%'
           and ':' || nvl(i_org_unit_list
                         ,'$NV$') || ':' not like '%:' || d.ORG_UNIT_DN || ':%';

        insert into ORG_UNIT_ORG_UNIT_REL
          (MEMBER_ORG_UNIT_ID
          ,ORG_UNIT_ID
          ,ORG_UNIT_DN
           --
           )
          (
           --
           select i_org_unit_id as MEMBER_ORG_UNIT_ID
                  ,case source
                     when 2 then
                      t0.ID_OR_DN
                     else
                      null
                   end as ORG_UNIT_ID
                  ,case source
                     when 1 then
                      t0.ID_OR_DN
                     else
                      null
                   end as ORG_UNIT_DN
             from ORG_UNIT_POOL t0
            where ':' || i_org_unit_list || ':' like '%:' || t0.ID_OR_DN || ':%'
           minus
           select t1.MEMBER_ORG_UNIT_ID
                  ,t1.ORG_UNIT_ID
                  ,t1.ORG_UNIT_DN
             from ORG_UNIT_ORG_UNIT_REL t1
            where t1.MEMBER_ORG_UNIT_ID = i_org_unit_id
           --
           );

    end case;

    commit;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end Save_Org_Unit_Member_Of_OUnits;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   @param  ???
  *   @return ???
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
  * WWirns    06.09.2018  Save_Org_Unit_Users: Added
  *******************************************************************************/
  --
  procedure Save_Org_Unit_Users(i_org_unit_id in varchar2
                               ,i_users_list  in clob
                                --
                                ) is
    --
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'Save_Org_Unit_Users';
    -- l_params logger.tab_param;
    --
  begin
    -- logger.append_param(l_params
    --                    ,'i_org_unit_id'
    --                    ,i_org_unit_id);
    -- logger.append_param(l_params
    --                    ,'i_users_list'
    --                    ,i_users_list);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    case
      when lower(i_org_unit_id) like '%cn=%' -- org_unit from AD
       then
        delete from user_org_unit_rel
         where org_unit_dn = i_org_unit_id
           and ':' || nvl(i_users_list
                         ,'$NV$') || ':' not like '%:' || user_id || ':%'
           and ':' || nvl(i_users_list
                         ,'$NV$') || ':' not like '%:' || user_dn || ':%';

        insert into user_org_unit_rel
          (org_unit_dn
          ,user_id
          ,user_dn)
          (select i_org_unit_id
                 ,case source
                    when 2 then
                     id_or_dn
                    else
                     null
                  end as user_id
                 ,case source
                    when 1 then
                     id_or_dn
                    else
                     null
                  end as user_dn
             from user_pool
            where ':' || i_users_list || ':' like '%:' || id_or_dn || ':%'
           minus
           select org_unit_dn
                 ,user_id
                 ,user_dn
             from user_org_unit_rel
            where org_unit_dn = i_org_unit_id);
      else
        -- org_unit from UM
        delete from user_org_unit_rel
         where org_unit_id = i_org_unit_id
           and ':' || nvl(i_users_list
                         ,'$NV$') || ':' not like '%:' || user_id || ':%'
           and ':' || nvl(i_users_list
                         ,'$NV$') || ':' not like '%:' || user_dn || ':%';

        insert into user_org_unit_rel
          (org_unit_id
          ,user_id
          ,user_dn)
          (select i_org_unit_id
                 ,case source
                    when 2 then
                     id_or_dn
                    else
                     null
                  end as user_id
                 ,case source
                    when 1 then
                     id_or_dn
                    else
                     null
                  end as user_dn
             from user_pool
            where ':' || i_users_list || ':' like '%:' || id_or_dn || ':%'
           minus
           select org_unit_id
                 ,user_id
                 ,user_dn
             from user_org_unit_rel
            where org_unit_id = i_org_unit_id);
    end case;

    commit;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end Save_Org_Unit_Users;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   @param  ???
  *   @return ???
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
  * WWirns    06.09.2018  Save_Org_Unit_Computers: Added
  *******************************************************************************/
  --
  procedure Save_Org_Unit_Computers(i_org_unit_id   in varchar2
                                   ,i_computer_list in clob
                                    --
                                    ) is
    --
    -- l_scope  logger_logs.scope%type := g_scope_prefix || 'Save_Org_Unit_Computers';
    -- l_params logger.tab_param;
    --
  begin
    -- logger.append_param(l_params
    --                    ,'i_org_unit_id'
    --                    ,i_org_unit_id);
    -- logger.append_param(l_params
    --                    ,'i_computer_list'
    --                    ,i_computer_list);
    -- logger.log('START'
    --           ,l_scope
    --           ,null
    --           ,l_params);

    case
      when lower(i_org_unit_id) like '%cn=%' then
        -- org_unit from AD
        delete from computer_org_unit_rel
         where org_unit_dn = i_org_unit_id
           and ':' || nvl(i_computer_list
                         ,'$NV$') || ':' not like '%:' || computer_id || ':%'
           and ':' || nvl(i_computer_list
                         ,'$NV$') || ':' not like '%:' || computer_dn || ':%';

        insert into computer_org_unit_rel
          (org_unit_dn
          ,computer_id
          ,computer_dn)
          (select i_org_unit_id
                 ,case source
                    when 2 then
                     id_or_dn
                    else
                     null
                  end as computer_id
                 ,case source
                    when 1 then
                     id_or_dn
                    else
                     null
                  end as computer_dn
             from computer_pool
            where ':' || i_computer_list || ':' like '%:' || id_or_dn || ':%'
           minus
           select org_unit_dn
                 ,computer_id
                 ,computer_dn
             from computer_org_unit_rel
            where org_unit_dn = i_org_unit_id);
      else
        -- org_unit from UM
        delete from computer_org_unit_rel
         where org_unit_id = i_org_unit_id
           and ':' || nvl(i_computer_list
                         ,'$NV$') || ':' not like '%:' || computer_id || ':%'
           and ':' || nvl(i_computer_list
                         ,'$NV$') || ':' not like '%:' || computer_dn || ':%';

        insert into computer_org_unit_rel
          (org_unit_id
          ,computer_id
          ,computer_dn)
          (select i_org_unit_id
                 ,case source
                    when 2 then
                     id_or_dn
                    else
                     null
                  end as computer_id
                 ,case source
                    when 1 then
                     id_or_dn
                    else
                     null
                  end as computer_dn
             from computer_pool
            where ':' || i_computer_list || ':' like '%:' || id_or_dn || ':%'
           minus
           select org_unit_id
                 ,computer_id
                 ,computer_dn
             from computer_org_unit_rel
            where org_unit_id = i_org_unit_id);
    end case;

    commit;

    -- logger.log('END'
    --           ,l_scope);
  exception
    when others then
      -- logger.log_error('Unhandled Exception'
      --                 ,l_scope
      --                 ,null
      --                 ,l_params);
      raise;
  end Save_Org_Unit_Computers;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   @param  ???
  *   @return ???
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
  * MStahl    26.09.2018  Added to check if pwd expires and show warning
  *******************************************************************************/
  --
procedure check_pwd_expired as
  begin
    if apex_authentication.is_authenticated
    then
      declare
        l_exp_days    number;
        l_exp_date    number;
        l_err_msg varchar2(400);
      begin

        apex_util.set_preference(
                p_preference=>'PWD_EXP_NOTIFICATION',
                p_value => v('APP_SESSION'));

        begin
          select active_num
          into l_exp_days
          from dl_user_management.parameter_settings
          where name = 'pwd_expiry_days_warn';

          exception when no_data_found
          then null;
        end;
        if l_exp_days > 0
        then
          begin
          select pw_expiration_date - sysdate
            into l_exp_date
            from dl_user_management.users
            where username = v('APP_USER');

          exception when no_data_found
          then null;
          end;

          if l_exp_date <= l_exp_days
          then
            l_err_msg := apex_lang.message('UM_PWD_EXPIRE', round(l_exp_date, 0));

            htp.p('<script language="javascript">');
            htp.p('apex.message.showErrors( [{type: "error", location: ["page", "inline"], message: "' || l_err_msg || '",unsafe: false}] );');
            htp.p('</script>');

            end if;
        end if;
      end;
    end if;
end check_pwd_expired;

end pkg_man_users;
/
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_MAN_USERS" TO "DL_INTERFACE";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_MAN_USERS" TO PUBLIC;
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_MAN_USERS" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_MAN_USERS" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_MAN_USERS" TO "PIBICSAPP";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_MAN_USERS" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_MAN_USERS" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."PKG_MAN_USERS" TO "PIBICSDM2";
