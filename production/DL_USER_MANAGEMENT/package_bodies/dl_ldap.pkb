CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_USER_MANAGEMENT"."DL_LDAP" is
  /**
  * ========================================================================<br/>
  * <b> Functions / Procedures for LDAP access in apex application </b>  <br/> <br/>
  * <br/>
  * @file    $HeadURL: $<br/>
  * @version $Revision: 1.6 $<br/>
  * @author  $Author: KSarikaya, MThierhoff $<br/>
  * @date    $Date: 05/04/2017 $<br/>
  * @version $Id: $<br/>
  * ========================================================================<br/>
  * @headcom
  */

  g_Use_Cache4Roles boolean := false;

  --
  --
  /**
  * Cast binary integer to unsigned integer
  *
  * PARAMETERS
  *     @param    ???
  *     @return   ???
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
  * WWirns    30.08.2018  Cast_BinInt_To_Unsigned:Added
  *******************************************************************************/
  --
  function Cast_BinInt_To_Unsigned(p_Raw in raw
                                   --
                                   ) return integer is
    --
    v_Result integer;
    --
  begin
    --
    if (utl_raw.length(p_Raw) > 4)
    then
      Raise_application_error(-20000
                             ,'The length of Argument p_Raw[' || p_Raw || '] must not exceed 4!');
    end if;
    --
    if (utl_raw.bit_and(p_Raw
                       ,'80000000') <> '00000000')
    then
      v_Result := utl_raw.cast_to_binary_integer(utl_raw.bit_and(p_Raw
                                                                ,'7FFFFFFF')) + power(2
                                                                                     ,31);
    else
      v_Result := utl_raw.cast_to_binary_integer(p_Raw);
    end if;
    --
    return v_Result;
    --
  end Cast_BinInt_To_Unsigned;
  --
  --
  /**
  * "Active Directory" (AD) Sid to string
  *
  * PARAMETERS
  *     @param    ???
  *     @return   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   Raw-Format    : 0105000000000005150000000EBA0F11CB08687AFA443DCA01020000
  *   String-Format : S-1-5-21-286243342-2053638347-3393012986-513
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    30.08.2018  AD_Sid_To_String:Added
  *******************************************************************************/
  --
  function AD_Sid_To_String(p_Raw in raw
                            --
                            ) return varchar2 is
    --
    v_Result varchar2(32767);
    --
    v_vc_Tmp varchar2(32767);
    i        pls_integer;
    v_Dashes pls_integer;
    --
  begin
    --
    --
    if (p_Raw is null)
    then
      return v_Result;
    end if;
    --
    -- 01            "S-[1 Byte:Revision]"
    v_vc_Tmp := 'S-' || trim(utl_raw.cast_to_binary_integer(utl_raw.substr(p_Raw
                                                                          ,1
                                                                          ,1)));
    --
    -- 05            "-[1 Byte:Number of following dashes]"
    v_Dashes := utl_raw.cast_to_binary_integer(utl_raw.substr(p_Raw
                                                             ,2
                                                             ,1));
    v_vc_Tmp := v_vc_Tmp || '-' || trim(v_Dashes);
    --
    -- 000000000005  "-[6 Byte: treated as a 48-bit number in big-endian format]"
    -- What does it mean? Whatever, it is not part of the string format!
    null;
    --
    -- 00000000      "-[4 byte: treated as a 32-bit number in little-endian format]"
    for i in 1 .. v_Dashes
    loop
      v_vc_Tmp := v_vc_Tmp || '-' || trim(Cast_BinInt_To_Unsigned(utl_raw.reverse(utl_raw.substr(p_Raw
                                                                                                ,5 + i * 4
                                                                                                ,4))));
    end loop;
    --
    --
    v_Result := v_vc_Tmp;
    --
    --
    return v_Result;
    --
  end AD_Sid_To_String;
  --
  --
  /**
  * "Active Directory" (AD) GUID to string (OctetString)
  *
  * PARAMETERS
  *     @param    ???
  *     @return   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   Raw-Format    : EC7B0F398D154A49B53B79FDC0598E42
  *   String-Format : {390F7BEC-158D-494A-B53B-79FDC0598E42}
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    30.08.2018  AD_GUID_To_String:Added
  *******************************************************************************/
  --
  function AD_GUID_To_String(p_Raw in raw
                             --
                             ) return varchar2 is
    --
    v_Result varchar2(32767);
    --
    v_vc_Tmp varchar2(32767);
    --
  begin
    --
    --
    if (p_Raw is null)
    then
      return v_Result;
    end if;
    --
    -- EC7B0F39 -8D15 -4A49 -B53B -79FDC0598E42
    -- 390F7BEC -158D -494A -B53B -79FDC0598E42
    v_vc_Tmp := '{' || utl_raw.reverse(utl_raw.substr(p_Raw
                                                     ,1
                                                     ,4));
    --
    v_vc_Tmp := v_vc_Tmp || '-' || utl_raw.reverse(utl_raw.substr(p_Raw
                                                                 ,5
                                                                 ,2));
    --
    v_vc_Tmp := v_vc_Tmp || '-' || utl_raw.reverse(utl_raw.substr(p_Raw
                                                                 ,7
                                                                 ,2));
    --
    v_vc_Tmp := v_vc_Tmp || '-' || utl_raw.substr(p_Raw
                                                 ,9
                                                 ,2);
    --
    v_vc_Tmp := v_vc_Tmp || '-' || utl_raw.substr(p_Raw
                                                 ,11
                                                 ,6) || '}';
    --
    --
    v_Result := v_vc_Tmp;
    --
    --
    return v_Result;
    --
  end AD_GUID_To_String;

  /**
  * Authenticate user against Active Directory <br/>
  * @param  i_username    distinguished name of the user that we are trying to login as
  * @param  i_password    password
  * @return  TRUE if authentication was successful, else FALSE
  <br/><br/>
  */
  function authenticate(i_username in varchar2
                       ,i_password in varchar2) return boolean
  -- Authenticate User/Password
   is
    excp_ldap exception; -- LDAP-Failure
    pragma exception_init(excp_ldap
                         ,-31202);
    LDAP_HOST  varchar2(512); -- The LDAP Directory Host
    LDAP_PORT  pls_integer; -- The LDAP Directory Port
    RETVAL     pls_integer; -- Used for all API return values.
    MY_SESSION DBMS_LDAP.SESSION; -- Used to store our LDAP Session
  begin
    if pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'usr_from_ad') = 0
    then
      return false;
    end if;
    -- AD server data
    LDAP_HOST := g_ldap_host;
    LDAP_PORT := g_ldap_port;

    -- Check user password
    MY_SESSION := DBMS_LDAP.INIT(LDAP_HOST
                                ,LDAP_PORT);
    RETVAL     := DBMS_LDAP.SIMPLE_BIND_S(MY_SESSION
                                         ,g_ldap_domain || i_username
                                         ,i_password);
    RETVAL     := DBMS_LDAP.UNBIND_S(MY_SESSION);

    return(true);

  exception
    when excp_ldap then
      RETVAL := DBMS_LDAP.UNBIND_S(MY_SESSION);
      return(false);
    when others then
      return(false);
  end authenticate;
  --
  --
  /**
  * Get data from Active Directory
  *
  * PARAMETERS
  *     @param  i_filter      A character string representing the search filter. The value NULL can be passed to indicate that the filter "(objectclass=*)", which matches all entries, is to be used.
  *     @param  i_attribute   atribute to be returned for each matching entry. e.g. 'sAMAccountname', 'displayName', 'memberOf', 'mail', 'badPwdCount', 'lastLogoff', 'lastLogon', 'accountExpires'
  *     @return  TRUE if authentication was successful, else FALSE
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   sample usage:
  *          SELECT * FROM TABLE(dl_ldap.get_data(i_attribute => 'memberOf'));
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    24.08.2018  get_data:Add bitmask to control parameter check whether AD
  *                       is for specific entity active or not
  *******************************************************************************/
  --
  function get_data(i_filter           in varchar2 default 'objectclass=*'
                   ,i_attribute        in varchar2 default '*' -- retrieve all attributes
                   ,p_Check_Param_Mask in pls_integer default 15 -- Bitmask: 1 => usr_from_ad, 2 => role_from_ad, 4 => org_unit_from_ad, 8 => computer_from_ad
                    --
                    ) return tab_attr
    pipelined is
    attr_row       attr_type;
    l_ldap_user    varchar2(256) := g_ldap_read_user;
    l_ldap_user_dn varchar2(256) := g_ldap_domain || l_ldap_user;
    l_ldap_passwd  varchar2(256) := g_ldap_read_user_pwd;
    --l_filter VARCHAR2(256) := '(&(objectclass=user)(sAMAccountName='|| l_ldap_user ||'))';
    l_retval      pls_integer;
    l_session     DBMS_LDAP.session;
    l_attrs       DBMS_LDAP.string_collection;
    l_entry_id    number(12);
    l_message     DBMS_LDAP.message;
    l_entry       DBMS_LDAP.message;
    l_attr_name   varchar2(256);
    l_ber_element DBMS_LDAP.ber_element;
    l_vals        DBMS_LDAP.string_collection;
    l_dn          varchar2(256);
  begin
    --
    --
    if (nvl(p_Check_Param_Mask
           ,15) > 0)
    then
      if (bitand(p_Check_Param_Mask
                ,1) = 1 and pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'usr_from_ad') = 0)
      then
        return;
      end if;
      if (bitand(p_Check_Param_Mask
                ,2) = 2 and pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'role_from_ad') = 0)
      then
        return;
      end if;
      if (bitand(p_Check_Param_Mask
                ,4) = 4 and pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'org_unit_from_ad') = 0)
      then
        return;
      end if;
      if (bitand(p_Check_Param_Mask
                ,8) = 8 and pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'computer_from_ad') = 0)
      then
        return;
      end if;
    end if;

    DBMS_LDAP.USE_EXCEPTION := true;
    l_session               := DBMS_LDAP.init(hostname => g_ldap_host
                                             ,portnum  => g_ldap_port);
    l_retval                := DBMS_LDAP.simple_bind_s(ld     => l_session
                                                      ,dn     => l_ldap_user_dn
                                                      ,passwd => l_ldap_passwd);

    --l_attrs(1)  := 'sAMAccountName';
    --l_attrs(1)  := 'displayName';
    --l_attrs(2)  := 'employeeNumber';
    --l_attrs(2) := 'company';
    --l_attrs(3)  := 'displayName';
    --l_attrs(4)  := 'description';
    --l_attrs(5)  := 'telephoneNumber';
    --l_attrs(6)  := 'facsimileTelephoneNumber';
    --l_attrs(7)  := 'department';
    --l_attrs(8)  := 'company';
    --l_attrs(9)  := 'employeeID';
    --l_attrs(10) := 'streetAddress';
    --l_attrs(11) := 'mail';
    --l_attrs(12) := 'c';
    --l_attrs(13) := 'l';
    --l_attrs(14) := 'postalCode';
    --l_attrs(15) := 'cn';
    --l_attrs(1) := 'memberOf'; --Mitglied in Gruppen nur von Interesse

    l_attrs(1) := 'cn';
    l_attrs(2) := i_attribute;

    l_retval := DBMS_LDAP.search_s(ld       => l_session
                                  ,base     => g_ldap_search_base
                                  ,scope    => DBMS_LDAP.SCOPE_SUBTREE
                                  ,filter   => i_filter
                                  ,attrs    => l_attrs
                                  ,attronly => 0
                                  ,res      => l_message);

    if DBMS_LDAP.count_entries(ld  => l_session
                              ,msg => l_message) > 0
    then
      l_entry := DBMS_LDAP.first_entry(ld  => l_session
                                      ,msg => l_message);

      <<entry_loop>>
      l_entry_id := 0;

      while l_entry is not null
      loop
        l_entry_id := l_entry_id + 1;

        l_dn := DBMS_LDAP.get_dn(ld        => l_session
                                ,ldapentry => l_entry);

        -- Get all Attributes of the Entry
        l_attr_name := DBMS_LDAP.first_attribute(ld        => l_session
                                                ,ldapentry => l_entry
                                                ,ber_elem  => l_ber_element);

        <<attributes_loop>>
        while l_attr_name is not null
        loop
          l_vals := DBMS_LDAP.get_values(ld        => l_session
                                        ,ldapentry => l_entry
                                        ,attr      => l_attr_name);
          <<values_loop>>

          for i in l_vals.FIRST .. l_vals.LAST
          loop
            if l_attr_name = 'cn'
            then
              attr_row.cn := l_vals(i);
            end if;
            if i_attribute in ('cn')
               or l_attr_name not in ('cn')
            then
              attr_row.id   := l_entry_id;
              attr_row.dn   := l_dn;
              attr_row.attr := l_attr_name;
              attr_row.val  := l_vals(i);
              pipe row(attr_row);
            end if;
          end loop values_loop;

          l_attr_name := DBMS_LDAP.next_attribute(ld        => l_session
                                                 ,ldapentry => l_entry
                                                 ,ber_elem  => l_ber_element);

        end loop attibutes_loop;

        l_entry := DBMS_LDAP.next_entry(ld  => l_session
                                       ,msg => l_entry);

      end loop entry_loop;

    end if;

    -- Close Connection to LDAP Server
    l_retval := DBMS_LDAP.unbind_s(ld => l_session);

    return;

  exception
    when no_data_needed then
      -- Close Connection to LDAP Server
      l_retval := DBMS_LDAP.unbind_s(ld => l_session);
      return;
  end get_data;
  --
  --
  /**
  * Get all users
  *
  * PARAMETERS
  *     @param    ???
  *     @return   Rows of users
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   If there are multiple value for an attribute they are concatenated with CRLF as separator
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    30.08.2018  Get_Users:Refactored
  *******************************************************************************/
  --
  function Get_Users return user_tab_attr
    pipelined is
    --
    --'(&(objectcategory=user)(objectClass=person))'
    l_Filter       varchar2(4000) := 'objectCategory=user';
    l_ldap_user    varchar2(256) := g_ldap_read_user;
    l_ldap_user_dn varchar2(256) := g_ldap_domain || l_ldap_user;
    l_ldap_passwd  varchar2(256) := g_ldap_read_user_pwd;
    i              pls_integer;
    user_row       user_attr_type;
    l_retval       pls_integer;
    l_session      DBMS_LDAP.session;
    l_attrs        DBMS_LDAP.string_collection;
    l_entry_id     number(20);
    l_message      DBMS_LDAP.message;
    l_entry        DBMS_LDAP.message;
    l_attr_name    varchar2(256);
    l_ber_element  DBMS_LDAP.ber_element;
    l_values       DBMS_LDAP.string_collection;
    l_binvalues    DBMS_LDAP.BINVAL_COLLECTION;
    l_value        varchar2(32767);
    l_dn           varchar2(256);
    --
  begin

    if pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'usr_from_ad') = 0
    then
      return;
    end if;

    DBMS_LDAP.USE_EXCEPTION := true;

    l_session := DBMS_LDAP.init(hostname => g_ldap_host
                               ,portnum  => g_ldap_port);
    l_retval  := DBMS_LDAP.simple_bind_s(ld     => l_session
                                        ,dn     => l_ldap_user_dn
                                        ,passwd => l_ldap_passwd);
    begin

      l_attrs(0) := 'objectSid';
      l_attrs(1) := 'cn';
      l_attrs(2) := 'sAMAccountName';
      l_attrs(3) := 'displayName';
      l_attrs(4) := 'mail';
      l_attrs(5) := 'lastLogon';
      l_attrs(6) := 'badPwdCount';
      l_attrs(7) := 'primaryGroupID';
      l_attrs(8) := 'memberOf';

      l_retval := DBMS_LDAP.search_s(ld       => l_session
                                    ,base     => g_ldap_search_base
                                    ,scope    => DBMS_LDAP.SCOPE_SUBTREE
                                    ,filter   => l_Filter
                                    ,attrs    => l_attrs
                                    ,attronly => 0
                                    ,res      => l_message);
      begin

        if (DBMS_LDAP.count_entries(ld  => l_session
                                   ,msg => l_message) > 0)
        then
          l_entry := DBMS_LDAP.first_entry(ld  => l_session
                                          ,msg => l_message);

          l_entry_id := 0;

          while (l_entry is not null)
          loop
            l_entry_id  := l_entry_id + 1;
            user_row.id := l_entry_id;

            --
            -- Do not substr "l_dn", because we need the whole text!
            l_dn        := DBMS_LDAP.get_dn(ld        => l_session
                                           ,ldapentry => l_entry);
            user_row.dn := l_dn;
            --
            --
            user_row.sid            := null;
            user_row.cn             := null;
            user_row.sAMAccountName := null;
            user_row.displayName    := null;
            user_row.mail           := null;
            user_row.lastLogon      := null;
            user_row.badPwdCount    := null;
            user_row.primaryGroupID := null;
            user_row.memberOf       := null;
            --
            -- Get all attributes of the entry
            l_attr_name := DBMS_LDAP.first_attribute(ld        => l_session
                                                    ,ldapentry => l_entry
                                                    ,ber_elem  => l_ber_element);
            begin
              --
              --
              while (l_attr_name is not null)
              loop
                l_value := null;
                --
                if (l_attr_name = 'objectSid')
                then
                  l_binvalues := DBMS_LDAP.get_values_len(ld        => l_session
                                                         ,ldapentry => l_entry
                                                         ,attr      => l_attr_name);
                  i           := l_binvalues.first;
                  if (i is not null)
                  then
                    l_value := AD_Sid_To_String(l_binvalues(i));
                  end if;
                else
                  l_values := DBMS_LDAP.get_values(ld        => l_session
                                                  ,ldapentry => l_entry
                                                  ,attr      => l_attr_name);
                  i        := l_values.first;
                  if (i is not null)
                  then
                    l_value := l_values(i);
                    i       := l_values.next(i);
                    while (i is not null)
                    loop
                      l_value := substr(l_value || chr(13) || chr(10) || l_values(i)
                                       ,1
                                       ,32767);
                      i       := l_values.next(i);
                    end loop;
                  end if;
                end if;
                --
                l_value := substr(l_value
                                 ,1
                                 ,4000);
                case l_attr_name
                  when 'objectSid' then
                    user_row.sid := l_value;
                  when 'cn' then
                    user_row.cn := l_value;
                  when 'sAMAccountName' then
                    user_row.sAMAccountName := l_value;
                  when 'displayName' then
                    user_row.displayName := l_value;
                  when 'mail' then
                    user_row.mail := l_value;
                  when 'lastLogon' then
                    user_row.lastLogon := l_value;
                  when 'badPwdCount' then
                    user_row.badPwdCount := l_value;
                  when 'primaryGroupID' then
                    user_row.primaryGroupID := l_value;
                  when 'memberOf' then
                    user_row.memberOf := l_value;
                  else
                    null;
                end case;
                --
                l_attr_name := DBMS_LDAP.next_attribute(ld        => l_session
                                                       ,ldapentry => l_entry
                                                       ,ber_elem  => l_ber_element);
                --
              end loop;

              if (l_ber_element is not null)
              then
                DBMS_LDAP.ber_free(ber     => l_ber_element
                                  ,freebuf => 0);
              end if;
            exception
              when others then
                if (l_ber_element is not null)
                then
                  DBMS_LDAP.ber_free(ber     => l_ber_element
                                    ,freebuf => 0);
                end if;
                raise;
            end;

            pipe row(user_row);

            l_entry := DBMS_LDAP.next_entry(ld  => l_session
                                           ,msg => l_entry);

          end loop;

        end if;

        l_retval := DBMS_LDAP.msgfree(lm => l_message);
      exception
        when others then
          l_retval := DBMS_LDAP.msgfree(lm => l_message);
          raise;
      end;

      -- Close Connection to LDAP Server
      l_retval := DBMS_LDAP.unbind_s(ld => l_session);
    exception
      when others then
        -- Close Connection to LDAP Server
        l_retval := DBMS_LDAP.unbind_s(ld => l_session);
        raise;
    end;

    return;

  exception
    when no_data_needed then
      return;
  end Get_Users;

  /**
  * Search if user is in Active Directory and get the cn if he is <br/>
  * @param  i_username    username (sAMAccountName)
  * @param  o_dn          dn of the user, if he was found
  * @return  TRUE if user was found in AD, else FALSE
  <br/><br/>
  */
  function find_user(i_username in varchar2
                    ,o_dn       out varchar2) return boolean is
  begin
    if pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'usr_from_ad') = 0
    then
      return false;
    end if;
    begin
      select dn
        into o_dn
        from table(dl_ldap.get_data(i_filter    => '(&(&(objectcategory=user)(objectClass=person))(sAMAccountName=' || i_username || '))'
                                   ,i_attribute => 'sAMAccountName'));
    exception
      when others then
        return false;
    end;

    return true;

  end find_user;
  --
  --
  /**
  * Get entries from Active Directory
  *
  * PARAMETERS
  *     @param    p_Check_Param_Mask is a Bitmask: 1 => usr_from_ad, 2 => role_from_ad, 4 => org_unit_from_ad, 8 => computer_from_ad
  *     @return   Rows of any filtered entities
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
  * WWirns    24.08.2018  Get_Entries:Added
  * WWirns    30.08.2018  Get_Entries:If the value is not convertable to varchar, then save it as RwaToHex
  * WWirns    30.08.2018  Get_Entries:For special attributes use AD_*_To_String-Functions
  *******************************************************************************/
  --
  function Get_Entries(p_Filter           in varchar2
                      ,p_Attribute        in varchar2
                      ,p_Check_Param_Mask in pls_integer default 15
                       --
                       ) return tab_entry
    pipelined is
    i               pls_integer;
    entry_row       entry_type;
    l_ldap_user     varchar2(256) := g_ldap_read_user;
    l_ldap_user_dn  varchar2(256) := g_ldap_domain || l_ldap_user;
    l_ldap_passwd   varchar2(256) := g_ldap_read_user_pwd;
    l_retval        pls_integer;
    l_session       DBMS_LDAP.session;
    l_attrs         DBMS_LDAP.string_collection;
    l_entry_id      number(20);
    l_message       DBMS_LDAP.message;
    l_entry         DBMS_LDAP.message;
    l_attr_name     varchar2(256);
    l_ber_element   DBMS_LDAP.ber_element;
    l_values        DBMS_LDAP.string_collection;
    l_binvalues     DBMS_LDAP.BINVAL_COLLECTION;
    l_dn            varchar2(256);
    l_Use_Character boolean;
  begin
    --
    --
    if (nvl(p_Check_Param_Mask
           ,15) > 0)
    then
      if (bitand(p_Check_Param_Mask
                ,1) = 1 and pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'usr_from_ad') = 0)
      then
        return;
      end if;
      if (bitand(p_Check_Param_Mask
                ,2) = 2 and pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'role_from_ad') = 0)
      then
        return;
      end if;
      if (bitand(p_Check_Param_Mask
                ,4) = 4 and pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'org_unit_from_ad') = 0)
      then
        return;
      end if;
      if (bitand(p_Check_Param_Mask
                ,8) = 8 and pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'computer_from_ad') = 0)
      then
        return;
      end if;
    end if;
    --
    --
    DBMS_LDAP.USE_EXCEPTION := true;

    l_session := DBMS_LDAP.init(hostname => g_ldap_host
                               ,portnum  => g_ldap_port);
    l_retval  := DBMS_LDAP.simple_bind_s(ld     => l_session
                                        ,dn     => l_ldap_user_dn
                                        ,passwd => l_ldap_passwd);
    begin

      if (p_Attribute is not null)
      then
        l_attrs(0) := p_Attribute;
      end if;

      if (p_Filter is not null)
      then

        l_retval := DBMS_LDAP.search_s(ld       => l_session
                                      ,base     => g_ldap_search_base
                                      ,scope    => DBMS_LDAP.SCOPE_SUBTREE
                                      ,filter   => p_Filter
                                      ,attrs    => l_attrs
                                      ,attronly => 0
                                      ,res      => l_message);
        begin

          if DBMS_LDAP.count_entries(ld  => l_session
                                    ,msg => l_message) > 0
          then
            l_entry := DBMS_LDAP.first_entry(ld  => l_session
                                            ,msg => l_message);

            l_entry_id := 0;

            while l_entry is not null
            loop
              l_entry_id := l_entry_id + 1;

              l_dn := DBMS_LDAP.get_dn(ld        => l_session
                                      ,ldapentry => l_entry);

              entry_row.id   := l_entry_id;
              entry_row.dn   := l_dn;
              entry_row.attr := null;
              entry_row.val  := null;

              if (p_Attribute is not null)
              then
                -- Get all Attributes of the Entry
                l_attr_name := DBMS_LDAP.first_attribute(ld        => l_session
                                                        ,ldapentry => l_entry
                                                        ,ber_elem  => l_ber_element);
                begin

                  while (l_attr_name is not null)
                  loop
                    if (l_attr_name in ('objectSid'
                                       ,'objectGUID'
                                       ,'dNSProperty'
                                       ,'dnsRecord'
                                       ,'dSASignature'
                                       ,'logonHours'
                                       ,'mS-DS-CreatorSID'
                                       ,'mSMQEncryptKey'
                                       ,'mSMQSignCertificates'
                                       ,'mSMQSignKey'
                                       ,'mSMQSites'
                                       ,'samDomainUpdates'
                                       ,'securityIdentifier'
                                        --
                                        ))
                    then
                      l_Use_Character := false;
                    else
                      begin
                        l_values        := DBMS_LDAP.get_values(ld        => l_session
                                                               ,ldapentry => l_entry
                                                               ,attr      => l_attr_name);
                        l_Use_Character := true;
                      exception
                        when others then
                          -- O R A-12703: Diese Zeichensatzkonvertierung wird nicht unterstützt
                          if (sqlcode != -12703)
                          then
                            raise;
                          end if;
                          l_Use_Character := false;
                      end;
                    end if;

                    if (l_Use_Character)
                    then
                      --
                      i := l_values.first;
                      while (i is not null)
                      loop
                        entry_row.attr := substr(l_attr_name
                                                ,1
                                                ,4000);
                        entry_row.val  := substr(l_values(i)
                                                ,1
                                                ,4000);

                        i := l_values.next(i);
                        if (i is not null)
                        then
                          pipe row(entry_row);
                          entry_row.attr := null;
                          entry_row.val  := null;
                        end if;
                      end loop;
                      --
                    else
                      --
                      l_binvalues := DBMS_LDAP.get_values_len(ld        => l_session
                                                             ,ldapentry => l_entry
                                                             ,attr      => l_attr_name);
                      i           := l_binvalues.first;
                      while (i is not null)
                      loop
                        entry_row.attr := substr(l_attr_name
                                                ,1
                                                ,4000);

                        if (l_attr_name in ('objectSid'
                                            --
                                            ))
                        then
                          --
                          entry_row.val := AD_Sid_To_String(l_binvalues(i));
                          --
                        elsif (l_attr_name in ('objectGUID'
                                               --
                                               ))
                        then
                          --
                          entry_row.val := AD_GUID_To_String(l_binvalues(i));
                          --
                        else
                          --
                          if (utl_raw.length(l_binvalues(i)) > (4000 / 2))
                          then
                            entry_row.val := utl_raw.substr(l_binvalues(i)
                                                           ,1
                                                           ,(4000 / 2));
                          else
                            entry_row.val := l_binvalues(i);
                          end if;
                          --
                        end if;
                        i := l_binvalues.next(i);
                        if (i is not null)
                        then
                          pipe row(entry_row);
                          entry_row.attr := null;
                          entry_row.val  := null;
                        end if;
                      end loop;
                      --
                    end if;

                    l_attr_name := DBMS_LDAP.next_attribute(ld        => l_session
                                                           ,ldapentry => l_entry
                                                           ,ber_elem  => l_ber_element);
                    if (l_attr_name is not null)
                    then
                      pipe row(entry_row);
                      entry_row.attr := null;
                      entry_row.val  := null;
                    end if;

                  end loop;

                  if (l_ber_element is not null)
                  then
                    DBMS_LDAP.ber_free(ber     => l_ber_element
                                      ,freebuf => 0);
                  end if;
                exception
                  when others then
                    if (l_ber_element is not null)
                    then
                      DBMS_LDAP.ber_free(ber     => l_ber_element
                                        ,freebuf => 0);
                    end if;
                    raise;
                end;

              end if;

              pipe row(entry_row);

              l_entry := DBMS_LDAP.next_entry(ld  => l_session
                                             ,msg => l_entry);

            end loop;

          end if;

          l_retval := DBMS_LDAP.msgfree(lm => l_message);
        exception
          when others then
            l_retval := DBMS_LDAP.msgfree(lm => l_message);
            raise;
        end;

      end if;
      -- Close Connection to LDAP Server
      l_retval := DBMS_LDAP.unbind_s(ld => l_session);
    exception
      when others then
        -- Close Connection to LDAP Server
        l_retval := DBMS_LDAP.unbind_s(ld => l_session);
        raise;
    end;

    return;

  exception
    when no_data_needed then
      return;
  end Get_Entries;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *     @param    ???
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
  * WWirns    31.08.2018  Set_Use_Cache4Roles:Added
  *******************************************************************************/
  --
  procedure Set_Use_Cache4Roles(p_Use_Cache in pls_integer default 0
                                --
                                ) is
  begin
    g_Use_Cache4Roles := sys.diutil.int_to_bool(nvl(p_Use_Cache
                                                   ,0));
  end Set_Use_Cache4Roles;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *     @param    ???
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
  * WWirns    31.08.2018  Cache_Roles$AT:Added
  *******************************************************************************/
  --
  procedure Cache_Roles$AT(p_Roles     in TT_LDAP_ROLE
                          ,p_Do_Delete in boolean default false
                           --
                           ) is
    --
    pragma autonomous_transaction;
    --
    i pls_integer;
    --
  begin
    if (nvl(p_Do_Delete
           ,false))
    then
      delete from LDAP_ROLES$GT;
      commit;
    end if;
    if (p_Roles is not null)
    then
      forall i in p_Roles.first .. p_Roles.last
        insert into LDAP_ROLES$GT
        values p_Roles
          (i);
      commit;
    end if;
  end Cache_Roles$AT;
  --
  --
  /**
  * Get all roles
  *
  * PARAMETERS
  *     @param    ???
  *     @return   Rows of roles/groups
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
  * WWirns    23.08.2018  Get_Roles:Added
  * WWirns    31.08.2018  Get_Roles:Added usage of cache by global temporary table
  *******************************************************************************/
  --
  function Get_Roles(p_Use_Cache in pls_integer default null
                     --
                     ) return TT_LDAP_ROLE
    pipelined is
    --
    l_Filter         varchar2(4000) := 'objectCategory=group';
    l_ldap_user      varchar2(256) := g_ldap_read_user;
    l_ldap_user_dn   varchar2(256) := g_ldap_domain || l_ldap_user;
    l_ldap_passwd    varchar2(256) := g_ldap_read_user_pwd;
    i                pls_integer;
    role_row         OT_LDAP_ROLE;
    role_rows        TT_LDAP_ROLE;
    l_name           varchar2(4000);
    l_sAMAccountName varchar2(4000);
    l_retval         pls_integer;
    l_session        DBMS_LDAP.session;
    l_attrs          DBMS_LDAP.string_collection;
    l_entry_id       number(20);
    l_message        DBMS_LDAP.message;
    l_entry          DBMS_LDAP.message;
    l_attr_name      varchar2(256);
    l_ber_element    DBMS_LDAP.ber_element;
    l_values         DBMS_LDAP.string_collection;
    l_binvalues      DBMS_LDAP.BINVAL_COLLECTION;
    l_value          varchar2(32767);
    l_dn             varchar2(256);
    l_Use_Cache      boolean;
    l_Cached_Rows    integer;
    --
  begin

    if pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'role_from_ad') = 0
    then
      return;
    end if;

    DBMS_LDAP.USE_EXCEPTION := true;

    l_session := DBMS_LDAP.init(hostname => g_ldap_host
                               ,portnum  => g_ldap_port);
    l_retval  := DBMS_LDAP.simple_bind_s(ld     => l_session
                                        ,dn     => l_ldap_user_dn
                                        ,passwd => l_ldap_passwd);
    begin
      if (p_Use_Cache is not null)
      then
        l_Use_Cache := sys.diutil.int_to_bool(p_Use_Cache);
      else
        l_Use_Cache := g_Use_Cache4Roles;
      end if;

      role_row  := OT_LDAP_ROLE();
      role_rows := TT_LDAP_ROLE();

      if (l_Use_Cache)
      then
        --
        select count(*)
          into l_Cached_Rows
          from LDAP_ROLES$GT t;
        --
      else
        --
        if (not g_Use_Cache4Roles)
        then
          Cache_Roles$AT(null
                        ,true);
        end if;
        --
        l_Cached_Rows := 0;
        --
      end if;
      --
      if (l_Cached_Rows > 0)
      then
        --
        for R0 in (
                   --
                   select t.OBJECT_VALUE
                     from LDAP_ROLES$GT t
                   --
                   )
        loop
          pipe row(R0.OBJECT_VALUE);
        end loop;
        --
      else
        --
        l_attrs(0) := 'objectSid';
        l_attrs(1) := 'name';
        l_attrs(2) := 'sAMAccountName';
        l_attrs(3) := 'cn';
        l_attrs(4) := 'description';
        --l_attrs(5) := 'member';
        --l_attrs(6) := 'memberOf';

        l_retval := DBMS_LDAP.search_s(ld       => l_session
                                      ,base     => g_ldap_search_base
                                      ,scope    => DBMS_LDAP.SCOPE_SUBTREE
                                      ,filter   => l_Filter
                                      ,attrs    => l_attrs
                                      ,attronly => 0
                                      ,res      => l_message);
        begin

          if (DBMS_LDAP.count_entries(ld  => l_session
                                     ,msg => l_message) > 0)
          then
            l_entry := DBMS_LDAP.first_entry(ld  => l_session
                                            ,msg => l_message);

            l_entry_id := 0;

            while (l_entry is not null)
            loop
              l_entry_id  := l_entry_id + 1;
              role_row.id := l_entry_id;

              --
              -- Do not substr "l_dn", because we need the whole text!
              l_dn        := DBMS_LDAP.get_dn(ld        => l_session
                                             ,ldapentry => l_entry);
              role_row.dn := l_dn;
              --
              --
              role_row.sid         := null;
              role_row.cn          := null;
              role_row.role_name   := null;
              role_row.description := null;
              --role_row.role_member   := null;
              --role_row.role_memberOf := null;
              --
              -- Get all attributes of the entry
              l_attr_name := DBMS_LDAP.first_attribute(ld        => l_session
                                                      ,ldapentry => l_entry
                                                      ,ber_elem  => l_ber_element);
              begin
                --
                --
                while (l_attr_name is not null)
                loop
                  l_value := null;
                  --
                  if (l_attr_name = 'objectSid')
                  then
                    l_binvalues := DBMS_LDAP.get_values_len(ld        => l_session
                                                           ,ldapentry => l_entry
                                                           ,attr      => l_attr_name);
                    i           := l_binvalues.first;
                    if (i is not null)
                    then
                      l_value := AD_Sid_To_String(l_binvalues(i));
                    end if;
                  else
                    l_values := DBMS_LDAP.get_values(ld        => l_session
                                                    ,ldapentry => l_entry
                                                    ,attr      => l_attr_name);
                    i        := l_values.first;
                    if (i is not null)
                    then
                      l_value := l_values(i);
                      i       := l_values.next(i);
                      while (i is not null)
                      loop
                        l_value := substr(l_value || chr(13) || chr(10) || l_values(i)
                                         ,1
                                         ,32767);
                        i       := l_values.next(i);
                      end loop;
                    end if;
                  end if;
                  --
                  l_value := substr(l_value
                                   ,1
                                   ,4000);
                  case l_attr_name
                    when 'name' then
                      l_name := l_value;
                    when 'sAMAccountName' then
                      l_sAMAccountName := l_value;
                    when 'objectSid' then
                      role_row.sid := l_value;
                    when 'cn' then
                      role_row.cn := l_value;
                    when 'description' then
                      role_row.description := l_value;
                      /*
                      when 'member' then
                        role_row.role_member := l_value;
                      when 'memberOf' then
                        role_row.role_memberOf := l_value;
                      */
                    else
                      null;
                  end case;
                  --
                  role_row.role_name := nvl(l_name
                                           ,nvl(l_sAMAccountName
                                               ,role_row.cn));
                  --
                  l_attr_name := DBMS_LDAP.next_attribute(ld        => l_session
                                                         ,ldapentry => l_entry
                                                         ,ber_elem  => l_ber_element);
                  --
                end loop;

                if (l_ber_element is not null)
                then
                  DBMS_LDAP.ber_free(ber     => l_ber_element
                                    ,freebuf => 0);
                end if;
              exception
                when others then
                  if (l_ber_element is not null)
                  then
                    DBMS_LDAP.ber_free(ber     => l_ber_element
                                      ,freebuf => 0);
                  end if;
                  raise;
              end;

              pipe row(role_row);
              --
              if (l_Use_Cache)
              then
                if (l_Cached_Rows = 0)
                then
                  role_rows.extend();
                  role_rows(role_rows.last()) := role_row;
                end if;
              end if;

              l_entry := DBMS_LDAP.next_entry(ld  => l_session
                                             ,msg => l_entry);

            end loop;

          end if;

          l_retval := DBMS_LDAP.msgfree(lm => l_message);
        exception
          when others then
            l_retval := DBMS_LDAP.msgfree(lm => l_message);
            raise;
        end;

      end if;

      if (l_Use_Cache)
      then
        if (l_Cached_Rows = 0)
        then
          Cache_Roles$AT(role_rows);
        end if;
      end if;

      -- Close Connection to LDAP Server
      l_retval := DBMS_LDAP.unbind_s(ld => l_session);
    exception
      when others then
        -- Close Connection to LDAP Server
        l_retval := DBMS_LDAP.unbind_s(ld => l_session);
        raise;
    end;

    return;

  exception
    when no_data_needed then
      return;
  end Get_Roles;
  --
  --
  /**
  * Find a specific entity
  *
  * PARAMETERS
  *     @param    p_Name name for searching
  *     @param    p_DN returns the DN of the found entity
  *     @return   Returns boolean whether found or not
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
  * WWirns    24.08.2018  Find_Role:Added
  *******************************************************************************/
  --
  function Find_Role(p_Name in varchar2
                    ,p_DN   out varchar2
                     --
                     ) return boolean is
  begin
    --
    begin
      select t.DN
        into p_DN
        from table(DL_LDAP.Get_Entries(p_Filter           => '(&(objectCategory=group)(|(name=' || p_Name || ')(sAMAccountName=' || p_Name || ')(cn=' || p_Name || ')))'
                                      ,p_Attribute        => ''
                                      ,p_Check_Param_Mask => 2
                                       --
                                       )
                   --
                   ) t;
    exception
      when NO_DATA_FOUND then
        return false;
    end;
    --
    return true;
    --
  end Find_Role;
  --
  --
  /**
  * Get all organisation units
  *
  * PARAMETERS
  *     @param    ???
  *     @return   Rows of organisation units
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
  * WWirns    24.08.2018  Get_Org_Units:Added
  *******************************************************************************/
  --
  function Get_Org_Units return org_unit_tab_attr
    pipelined is
    --
    l_Filter       varchar2(4000) := 'objectCategory=organizationalUnit';
    l_ldap_user    varchar2(256) := g_ldap_read_user;
    l_ldap_user_dn varchar2(256) := g_ldap_domain || l_ldap_user;
    l_ldap_passwd  varchar2(256) := g_ldap_read_user_pwd;
    i              pls_integer;
    org_unit_row   org_unit_attr_type;
    l_name         varchar2(4000);
    l_retval       pls_integer;
    l_session      DBMS_LDAP.session;
    l_attrs        DBMS_LDAP.string_collection;
    l_entry_id     number(20);
    l_message      DBMS_LDAP.message;
    l_entry        DBMS_LDAP.message;
    l_attr_name    varchar2(256);
    l_ber_element  DBMS_LDAP.ber_element;
    l_values       DBMS_LDAP.string_collection;
    l_value        varchar2(32767);
    l_dn           varchar2(256);
    --
  begin

    if pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'org_unit_from_ad') = 0
    then
      return;
    end if;

    DBMS_LDAP.USE_EXCEPTION := true;

    l_session := DBMS_LDAP.init(hostname => g_ldap_host
                               ,portnum  => g_ldap_port);
    l_retval  := DBMS_LDAP.simple_bind_s(ld     => l_session
                                        ,dn     => l_ldap_user_dn
                                        ,passwd => l_ldap_passwd);
    begin

      l_attrs(0) := 'name';
      l_attrs(1) := 'ou';
      l_attrs(2) := 'description';

      l_retval := DBMS_LDAP.search_s(ld       => l_session
                                    ,base     => g_ldap_search_base
                                    ,scope    => DBMS_LDAP.SCOPE_SUBTREE
                                    ,filter   => l_Filter
                                    ,attrs    => l_attrs
                                    ,attronly => 0
                                    ,res      => l_message);
      begin

        if (DBMS_LDAP.count_entries(ld  => l_session
                                   ,msg => l_message) > 0)
        then
          l_entry := DBMS_LDAP.first_entry(ld  => l_session
                                          ,msg => l_message);

          l_entry_id := 0;

          while (l_entry is not null)
          loop
            l_entry_id      := l_entry_id + 1;
            org_unit_row.id := l_entry_id;

            --
            -- Do not substr "l_dn", because we need the whole text!
            l_dn            := DBMS_LDAP.get_dn(ld        => l_session
                                               ,ldapentry => l_entry);
            org_unit_row.dn := l_dn;
            --
            --
            org_unit_row.ou              := null;
            org_unit_row.org_unit_name   := null;
            org_unit_row.description     := null;
            org_unit_row.org_unit_parent := null;
            --
            -- Get all attributes of the entry
            l_attr_name := DBMS_LDAP.first_attribute(ld        => l_session
                                                    ,ldapentry => l_entry
                                                    ,ber_elem  => l_ber_element);
            begin
              --
              --
              while (l_attr_name is not null)
              loop
                l_value  := null;
                l_values := DBMS_LDAP.get_values(ld        => l_session
                                                ,ldapentry => l_entry
                                                ,attr      => l_attr_name);
                i        := l_values.first;
                if (i is not null)
                then
                  l_value := l_values(i);
                  i       := l_values.next(i);
                  while (i is not null)
                  loop
                    l_value := substr(l_value || chr(13) || chr(10) || l_values(i)
                                     ,1
                                     ,32767);
                    i       := l_values.next(i);
                  end loop;
                end if;
                --
                l_value := substr(l_value
                                 ,1
                                 ,4000);
                case l_attr_name
                  when 'name' then
                    l_name := l_value;
                  when 'ou' then
                    org_unit_row.ou := l_value;
                  when 'description' then
                    org_unit_row.description := l_value;
                  else
                    null;
                end case;
                --
                org_unit_row.org_unit_name := nvl(l_name
                                                 ,org_unit_row.ou);
                --
                if (org_unit_row.dn like 'OU=' || org_unit_row.ou || ',OU=%')
                then
                  org_unit_row.org_unit_parent := substr(org_unit_row.dn
                                                        ,length('OU=' || org_unit_row.ou || ',') + 1);
                end if;
                --
                l_attr_name := DBMS_LDAP.next_attribute(ld        => l_session
                                                       ,ldapentry => l_entry
                                                       ,ber_elem  => l_ber_element);
                --
              end loop;

              if (l_ber_element is not null)
              then
                DBMS_LDAP.ber_free(ber     => l_ber_element
                                  ,freebuf => 0);
              end if;
            exception
              when others then
                if (l_ber_element is not null)
                then
                  DBMS_LDAP.ber_free(ber     => l_ber_element
                                    ,freebuf => 0);
                end if;
                raise;
            end;

            pipe row(org_unit_row);

            l_entry := DBMS_LDAP.next_entry(ld  => l_session
                                           ,msg => l_entry);

          end loop;

        end if;

        l_retval := DBMS_LDAP.msgfree(lm => l_message);
      exception
        when others then
          l_retval := DBMS_LDAP.msgfree(lm => l_message);
          raise;
      end;

      -- Close Connection to LDAP Server
      l_retval := DBMS_LDAP.unbind_s(ld => l_session);
    exception
      when others then
        -- Close Connection to LDAP Server
        l_retval := DBMS_LDAP.unbind_s(ld => l_session);
        raise;
    end;

    return;

  exception
    when no_data_needed then
      return;
  end Get_Org_Units;
  --
  --
  /**
  * Find a specific entity
  *
  * PARAMETERS
  *     @param    p_Name name for searching
  *     @param    p_DN returns the DN of the found entity
  *     @return   Returns boolean whether found or not
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
  * WWirns    24.08.2018  Find_Org_Unit:Added
  *******************************************************************************/
  --
  function Find_Org_Unit(p_Name in varchar2
                        ,p_DN   out varchar2
                         --
                         ) return boolean is
  begin
    --
    begin
      select t.DN
        into p_DN
        from table(DL_LDAP.Get_Entries(p_Filter           => '(&(objectCategory=organizationalUnit)(|(name=' || p_Name || ')(ou=' || p_Name || ')))'
                                      ,p_Attribute        => ''
                                      ,p_Check_Param_Mask => 4
                                       --
                                       )
                   --
                   ) t;
    exception
      when NO_DATA_FOUND then
        return false;
    end;
    --
    return true;
    --
  end Find_Org_Unit;
  --
  --
  /**
  * Get all computers
  *
  * PARAMETERS
  *     @param    ???
  *     @return   Rows of computers
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
  * WWirns    24.08.2018  Get_Computers:Added
  *******************************************************************************/
  --
  function Get_Computers return computer_tab_attr
    pipelined is
    --
    l_Filter         varchar2(4000) := 'objectCategory=computer';
    l_ldap_user      varchar2(256) := g_ldap_read_user;
    l_ldap_user_dn   varchar2(256) := g_ldap_domain || l_ldap_user;
    l_ldap_passwd    varchar2(256) := g_ldap_read_user_pwd;
    i                pls_integer;
    computer_row     computer_attr_type;
    l_name           varchar2(4000);
    l_sAMAccountName varchar2(4000);
    l_retval         pls_integer;
    l_session        DBMS_LDAP.session;
    l_attrs          DBMS_LDAP.string_collection;
    l_entry_id       number(20);
    l_message        DBMS_LDAP.message;
    l_entry          DBMS_LDAP.message;
    l_attr_name      varchar2(256);
    l_ber_element    DBMS_LDAP.ber_element;
    l_values         DBMS_LDAP.string_collection;
    l_binvalues      DBMS_LDAP.BINVAL_COLLECTION;
    l_value          varchar2(32767);
    l_dn             varchar2(256);
    --
  begin

    if pkg_param_config.F_Param_Value_Is_ON(i_param_name => 'computer_from_ad') = 0
    then
      return;
    end if;

    DBMS_LDAP.USE_EXCEPTION := true;

    l_session := DBMS_LDAP.init(hostname => g_ldap_host
                               ,portnum  => g_ldap_port);
    l_retval  := DBMS_LDAP.simple_bind_s(ld     => l_session
                                        ,dn     => l_ldap_user_dn
                                        ,passwd => l_ldap_passwd);
    begin

      l_attrs(0) := 'objectSid';
      l_attrs(1) := 'name';
      l_attrs(2) := 'sAMAccountName';
      l_attrs(3) := 'cn';
      l_attrs(4) := 'description';
      l_attrs(5) := 'primaryGroupID';
      l_attrs(6) := 'memberOf';

      l_retval := DBMS_LDAP.search_s(ld       => l_session
                                    ,base     => g_ldap_search_base
                                    ,scope    => DBMS_LDAP.SCOPE_SUBTREE
                                    ,filter   => l_Filter
                                    ,attrs    => l_attrs
                                    ,attronly => 0
                                    ,res      => l_message);
      begin

        if (DBMS_LDAP.count_entries(ld  => l_session
                                   ,msg => l_message) > 0)
        then
          l_entry := DBMS_LDAP.first_entry(ld  => l_session
                                          ,msg => l_message);

          l_entry_id := 0;

          while (l_entry is not null)
          loop
            l_entry_id      := l_entry_id + 1;
            computer_row.id := l_entry_id;

            --
            -- Do not substr "l_dn", because we need the whole text!
            l_dn            := DBMS_LDAP.get_dn(ld        => l_session
                                               ,ldapentry => l_entry);
            computer_row.dn := l_dn;
            --
            --
            computer_row.sid               := null;
            computer_row.cn                := null;
            computer_row.computer_name     := null;
            computer_row.description       := null;
            computer_row.primaryGroupID    := null;
            computer_row.computer_memberOf := null;
            --
            -- Get all attributes of the entry
            l_attr_name := DBMS_LDAP.first_attribute(ld        => l_session
                                                    ,ldapentry => l_entry
                                                    ,ber_elem  => l_ber_element);
            begin
              --
              --
              while (l_attr_name is not null)
              loop
                l_value := null;
                --
                if (l_attr_name = 'objectSid')
                then
                  l_binvalues := DBMS_LDAP.get_values_len(ld        => l_session
                                                         ,ldapentry => l_entry
                                                         ,attr      => l_attr_name);
                  i           := l_binvalues.first;
                  if (i is not null)
                  then
                    l_value := AD_Sid_To_String(l_binvalues(i));
                  end if;
                else
                  l_values := DBMS_LDAP.get_values(ld        => l_session
                                                  ,ldapentry => l_entry
                                                  ,attr      => l_attr_name);
                  i        := l_values.first;
                  if (i is not null)
                  then
                    l_value := l_values(i);
                    i       := l_values.next(i);
                    while (i is not null)
                    loop
                      l_value := substr(l_value || chr(13) || chr(10) || l_values(i)
                                       ,1
                                       ,32767);
                      i       := l_values.next(i);
                    end loop;
                  end if;
                end if;
                --
                l_value := substr(l_value
                                 ,1
                                 ,4000);
                case l_attr_name
                  when 'name' then
                    l_name := l_value;
                  when 'sAMAccountName' then
                    l_sAMAccountName := l_value;
                  when 'objectSid' then
                    computer_row.sid := l_value;
                  when 'cn' then
                    computer_row.cn := l_value;
                  when 'description' then
                    computer_row.description := l_value;
                  when 'primaryGroupID' then
                    computer_row.primaryGroupID := l_value;
                  when 'memberOf' then
                    computer_row.computer_memberOf := l_value;
                  else
                    null;
                end case;
                --
                computer_row.computer_name := nvl(l_name
                                                 ,nvl(l_sAMAccountName
                                                     ,computer_row.cn));

                --
                l_attr_name := DBMS_LDAP.next_attribute(ld        => l_session
                                                       ,ldapentry => l_entry
                                                       ,ber_elem  => l_ber_element);
                --
              end loop;

              if (l_ber_element is not null)
              then
                DBMS_LDAP.ber_free(ber     => l_ber_element
                                  ,freebuf => 0);
              end if;
            exception
              when others then
                if (l_ber_element is not null)
                then
                  DBMS_LDAP.ber_free(ber     => l_ber_element
                                    ,freebuf => 0);
                end if;
                raise;
            end;

            pipe row(computer_row);

            l_entry := DBMS_LDAP.next_entry(ld  => l_session
                                           ,msg => l_entry);

          end loop;

        end if;

        l_retval := DBMS_LDAP.msgfree(lm => l_message);
      exception
        when others then
          l_retval := DBMS_LDAP.msgfree(lm => l_message);
          raise;
      end;

      -- Close Connection to LDAP Server
      l_retval := DBMS_LDAP.unbind_s(ld => l_session);
    exception
      when others then
        -- Close Connection to LDAP Server
        l_retval := DBMS_LDAP.unbind_s(ld => l_session);
        raise;
    end;

    return;

  exception
    when no_data_needed then
      return;
  end Get_Computers;
  --
  --
  /**
  * Find a specific entity
  *
  * PARAMETERS
  *     @param    p_Name name for searching
  *     @param    p_DN returns the DN of the found entity
  *     @return   Returns boolean whether found or not
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
  * WWirns    24.08.2018  Find_Computer:Added
  *******************************************************************************/
  --
  function Find_Computer(p_Name in varchar2
                        ,p_DN   out varchar2
                         --
                         ) return boolean is
  begin
    --
    begin
      select t.DN
        into p_DN
        from table(DL_LDAP.Get_Entries(p_Filter           => '(&(objectCategory=computer)(|(name=' || p_Name || ')(sAMAccountName=' || p_Name || ')(cn=' || p_Name || ')))'
                                      ,p_Attribute        => ''
                                      ,p_Check_Param_Mask => 8
                                       --
                                       )
                   --
                   ) t;
    exception
      when NO_DATA_FOUND then
        return false;
    end;
    --
    return true;
    --
  end Find_Computer;
  --
end DL_LDAP;
/
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."DL_LDAP" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."DL_LDAP" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."DL_LDAP" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."DL_LDAP" TO "BIOSUPPORT";
