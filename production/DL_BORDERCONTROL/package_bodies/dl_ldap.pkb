CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."DL_LDAP" as
  /**
  * ========================================================================<br/>
  * <b> Functions / Procedures for LDAP access in apex application </b>  <br/> <br/>
  * <br/>
  * @file    $HeadURL: $<br/>
  * @version $Revision: 1.0 $<br/>
  * @author  $Author: K. Sarikaya $<br/>
  * @date    $Date: $<br/>
  * @version $Id: $<br/>
  * ========================================================================<br/>
  * @headcom
  */

  function authenticate(p_username in varchar2
                       ,p_password in varchar2) return boolean
  -- Authenticate User/Password
   is

    excp_ldap exception; -- LDAP-Failure
    pragma exception_init(excp_ldap
                         ,-31202);
    ldap_host  varchar2(512); -- The LDAP Directory Host
    ldap_port  pls_integer; -- The LDAP Directory Port
    retval     pls_integer; -- Used for all API return values.
    my_session dbms_ldap.session; -- Used to store our LDAP Session
  begin
    -- AD-Serverdaten
    ldap_host := l_ldap_host;
    ldap_port := l_ldap_port;
    -- Test, ob User-Pwd ok
    my_session := dbms_ldap.init(ldap_host
                                ,ldap_port);
    retval     := dbms_ldap.simple_bind_s(my_session
                                         ,l_ladap_domain || p_username
                                         ,p_password);
    retval     := dbms_ldap.unbind_s(my_session);
    return(true);
  exception
    when excp_ldap then
      retval := dbms_ldap.unbind_s(my_session);
      return(false);
    when others then
      return(false);
  end;

  function get_userdata(p_ldap_user   in varchar2
                       ,p_ldap_passwd in varchar2) return usr_tab_attr
    pipelined
  -- Get User Data, e.g. memberOf
    --Usage:
    --SELECT val FROM (SELECT * FROM TABLE(
    -- DL_LDAP.get_userdata('Userlogin','Password')));
   is

    user_row       usr_attr_type;
    l_ldap_user    varchar2(256) := p_ldap_user;
    l_ldap_user_dn varchar2(256) := l_ladap_domain || p_ldap_user;
    l_ldap_passwd  varchar2(256) := p_ldap_passwd;
    --l_filter VARCHAR2(256) := searchString;
    l_filter      varchar2(256) := '(' || chr(38) || '(objectclass=user)(sAMAccountName=' || l_ldap_user || '))';
    l_retval      pls_integer;
    l_session     dbms_ldap.session;
    l_attrs       dbms_ldap.string_collection;
    v_entry_id    number(12);
    l_message     dbms_ldap.message;
    l_entry       dbms_ldap.message;
    l_attr_name   varchar2(256);
    l_ber_element dbms_ldap.ber_element;
    l_vals        dbms_ldap.string_collection;
  begin
    dbms_ldap.use_exception := true;
    l_session               := dbms_ldap.init(hostname => l_ldap_host
                                             ,portnum  => l_ldap_port);
    l_retval                := dbms_ldap.simple_bind_s(ld     => l_session
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

    l_attrs(1) := 'memberOf'; --Mitglied in Gruppen nur von Interesse
    l_retval := dbms_ldap.search_s(ld       => l_session
                                  ,base     => l_ldap_base
                                  ,scope    => dbms_ldap.scope_subtree
                                  ,filter   => l_filter
                                  ,attrs    => l_attrs
                                  ,attronly => 0
                                  ,res      => l_message);

    if dbms_ldap.count_entries(ld  => l_session
                              ,msg => l_message) > 0
    then
      l_entry := dbms_ldap.first_entry(ld  => l_session
                                      ,msg => l_message);
      <<entry_loop>>
      v_entry_id := 0;
      while l_entry is not null
      loop
        v_entry_id := v_entry_id + 1;
        -- Get all Attributes of the Entry
        l_attr_name := dbms_ldap.first_attribute(ld        => l_session
                                                ,ldapentry => l_entry
                                                ,ber_elem  => l_ber_element);

        <<attributes_loop>>
        while l_attr_name is not null
        --AND l_attr_name  IN('sAMAccountName','employeeNumber','
        -- displayName')

        loop
          l_vals := dbms_ldap.get_values(ld        => l_session
                                        ,ldapentry => l_entry
                                        ,attr      => l_attr_name);

          <<values_loop>>
          user_row.login := null;
          for i in l_vals.first .. l_vals.last
          loop
            if l_attr_name = 'sAMAccountName'
            then
              user_row.login := l_vals(i);
            else
              user_row.login := null;
            end if;

            user_row.id   := v_entry_id;
            user_row.attr := l_attr_name;
            user_row.val  := l_vals(i);
            pipe row(user_row);
          end loop values_loop;

          l_attr_name := dbms_ldap.next_attribute(ld        => l_session
                                                 ,ldapentry => l_entry
                                                 ,ber_elem  => l_ber_element);

        end loop attibutes_loop;

        l_entry := dbms_ldap.next_entry(ld  => l_session
                                       ,msg => l_entry);
      end loop entry_loop;

    end if;
    -- Close Connection to LDAP Server

    l_retval := dbms_ldap.unbind_s(ld => l_session);
    return;
  end;

  function ldap_bind_admin(admin_session in dbms_ldap.session
                          ,admin_cn      in varchar2
                          ,admin_pass    in varchar2) return number as
  begin
    return dbms_ldap.simple_bind_s(admin_session
                                  ,'cn=' || admin_cn || ',dc=khm20928'
                                  ,admin_pass);
  end;

  function ldap_get_permissions(admin_cn   in varchar2
                               ,admin_pass in varchar2) return ldap_tab_permission
    pipelined as

    user_row        ldap_permission;
    admin_session   dbms_ldap.session;
    retval          varchar2(256);
    vals            dbms_ldap.string_collection;
    tmpval          dbms_ldap.string_collection;
    msg             varchar2(256) := '';
    attrname        varchar2(256);
    ber             dbms_ldap.ber_element;
    ent             dbms_ldap.message;
    permission_name varchar2(256);
    permission_id   number;
    user_found      number;
    ldap_host       varchar2(256) := get_ldap_host();
    ldap_port       varchar2(256) := '389';
    ldap_base       varchar2(256) := get_ldap_base();
  begin
    dbms_ldap.use_exception := true;
    admin_session := dbms_ldap.init(ldap_host
                                   ,ldap_port);
    retval := ldap_bind_admin(admin_session
                             ,admin_cn
                             ,admin_pass);
    vals(1) := 'cn';
    vals(2) := 'gidNumber';
    retval := dbms_ldap.search_s(ld       => admin_session
                                ,base     => 'ou=permissions,' || ldap_base
                                ,scope    => dbms_ldap.scope_subtree
                                ,filter   => 'objectclass=posixGroup'
                                ,attrs    => vals
                                ,attronly => 0
                                ,res      => msg);

    if dbms_ldap.count_entries(ld  => admin_session
                              ,msg => msg) > 0
    then
      ent := dbms_ldap.first_entry(ld  => admin_session
                                  ,msg => msg);
      <<entry_loop>>
      while ent is not null
      loop
        user_row        := null;
        permission_name := null;
        permission_id   := 0;
        attrname        := dbms_ldap.first_attribute(ld        => admin_session
                                                    ,ldapentry => ent
                                                    ,ber_elem  => ber);

        <<attributes_loop>>
        while attrname is not null
        loop
          tmpval := dbms_ldap.get_values(ld        => admin_session
                                        ,ldapentry => ent
                                        ,attr      => attrname);

          <<values_loop>>
          for i in tmpval.first .. tmpval.last
          loop
            if attrname = 'cn'
            then
              permission_name := tmpval(i);
            elsif attrname = 'gidNumber'
            then
              permission_id := to_number(tmpval(i));
            end if;
          end loop;

          attrname := dbms_ldap.next_attribute(ld        => admin_session
                                              ,ldapentry => ent
                                              ,ber_elem  => ber);

        end loop;

        user_row.name         := permission_name;
        user_row.permissionid := permission_id;
        pipe row(user_row);
        ent := dbms_ldap.next_entry(ld  => admin_session
                                   ,msg => ent);
      end loop;

    end if;

    retval := dbms_ldap.unbind_s(admin_session);
  end;

  function ldap_has_user_permission(admin_cn      in varchar2
                                   ,admin_pass    in varchar2
                                   ,user_cn       in varchar2
                                   ,permission_id in number) return number as

    admin_session dbms_ldap.session;
    retval        varchar2(256);
    vals          dbms_ldap.string_collection;
    msg           varchar2(256) := '';
    user_found    number;
    ldap_host     varchar2(256) := get_ldap_host();
    ldap_port     varchar2(256) := '389';
    ldap_base     varchar2(256) := get_ldap_base();
  begin
    dbms_ldap.use_exception := true;
    admin_session := dbms_ldap.init(ldap_host
                                   ,ldap_port);
    retval := ldap_bind_admin(admin_session
                             ,admin_cn
                             ,admin_pass);
    vals(1) := 'cn';
    vals(2) := 'memberUid';
    retval := dbms_ldap.search_s(ld       => admin_session
                                ,base     => 'ou=permissions,' || ldap_base
                                ,scope    => dbms_ldap.scope_subtree
                                ,filter   => '(' || chr(38) || '(objectclass=posixGroup)(gidNumber=' || permission_id || ')(memberUid=' || user_cn || '))'
                                ,attrs    => vals
                                ,attronly => 0
                                ,res      => msg);

    user_found := 0;
    if dbms_ldap.count_entries(ld  => admin_session
                              ,msg => msg) > 0
    then
      user_found := 1;
    end if;

    retval := dbms_ldap.unbind_s(admin_session);
    return user_found;
  end;

  function ldap_get_group_id(admin_session in dbms_ldap.session
                            ,group_cn      in varchar2) return number as

    retval    varchar2(256);
    vals      dbms_ldap.string_collection;
    tmpval    dbms_ldap.string_collection;
    msg       varchar2(256) := '';
    attrname  varchar2(256);
    ber       dbms_ldap.ber_element;
    ent       dbms_ldap.message;
    ldap_base varchar2(256) := get_ldap_base();
  begin
    vals(1) := 'gidNumber';
    retval := dbms_ldap.search_s(ld       => admin_session
                                ,base     => 'ou=permissions,' || ldap_base
                                ,scope    => dbms_ldap.scope_subtree
                                ,filter   => '(' || chr(38) || '(objectclass=posixGroup)(cn=' || group_cn || '))'
                                ,attrs    => vals
                                ,attronly => 0
                                ,res      => msg);

    if dbms_ldap.count_entries(ld  => admin_session
                              ,msg => msg) > 0
    then
      ent := dbms_ldap.first_entry(ld  => admin_session
                                  ,msg => msg);
      <<entry_loop>>
      while ent is not null
      loop
        attrname := dbms_ldap.first_attribute(ld        => admin_session
                                             ,ldapentry => ent
                                             ,ber_elem  => ber);

        <<attributes_loop>>
        while attrname is not null
        loop
          tmpval := dbms_ldap.get_values(ld        => admin_session
                                        ,ldapentry => ent
                                        ,attr      => attrname);

          <<values_loop>>
          for i in tmpval.first .. tmpval.last
          loop
            return to_number(tmpval(i));
          end loop;

          attrname := dbms_ldap.next_attribute(ld        => admin_session
                                              ,ldapentry => ent
                                              ,ber_elem  => ber);

        end loop;

        ent := dbms_ldap.next_entry(ld  => admin_session
                                   ,msg => ent);
      end loop;

    end if;

    return 0;
  end;

  function ldap_get_group_permissions(admin_cn   in varchar2
                                     ,admin_pass in varchar2
                                     ,group_cn   in varchar2) return ldap_tab_permission
    pipelined as

    user_row      ldap_permission;
    admin_session dbms_ldap.session;
    retval        varchar2(256);
    vals          dbms_ldap.string_collection;
    tmpval        dbms_ldap.string_collection;
    msg           varchar2(256) := '';
    attrname      varchar2(256);
    ber           dbms_ldap.ber_element;
    ent           dbms_ldap.message;
    ldap_host     varchar2(256) := get_ldap_host();
    ldap_port     varchar2(256) := '389';
    ldap_base     varchar2(256) := get_ldap_base();
  begin
    dbms_ldap.use_exception := true;
    admin_session := dbms_ldap.init(ldap_host
                                   ,ldap_port);
    retval := ldap_bind_admin(admin_session
                             ,admin_cn
                             ,admin_pass);
    vals(1) := 'memberUid';
    retval := dbms_ldap.search_s(ld       => admin_session
                                ,base     => 'ou=permissiongroups,' || ldap_base
                                ,scope    => dbms_ldap.scope_subtree
                                ,filter   => '(' || chr(38) || '(objectclass=posixGroup)(cn=' || group_cn || '))'
                                ,attrs    => vals
                                ,attronly => 0
                                ,res      => msg);

    if dbms_ldap.count_entries(ld  => admin_session
                              ,msg => msg) > 0
    then
      ent := dbms_ldap.first_entry(ld  => admin_session
                                  ,msg => msg);
      <<entry_loop>>
      while ent is not null
      loop
        attrname := dbms_ldap.first_attribute(ld        => admin_session
                                             ,ldapentry => ent
                                             ,ber_elem  => ber);

        <<attributes_loop>>
        while attrname is not null
        loop
          tmpval := dbms_ldap.get_values(ld        => admin_session
                                        ,ldapentry => ent
                                        ,attr      => attrname);

          <<values_loop>>
          for i in tmpval.first .. tmpval.last
          loop
            user_row.name         := tmpval(i);
            user_row.permissionid := ldap_get_group_id(admin_session
                                                      ,tmpval(i));
            pipe row(user_row);
          end loop;

          attrname := dbms_ldap.next_attribute(ld        => admin_session
                                              ,ldapentry => ent
                                              ,ber_elem  => ber);

        end loop;

        ent := dbms_ldap.next_entry(ld  => admin_session
                                   ,msg => ent);
      end loop;

    end if;

    retval := dbms_ldap.unbind_s(admin_session);
  end;

  function ldap_get_user_permissions(admin_cn   in varchar2
                                    ,admin_pass in varchar2
                                    ,user_cn    in varchar2) return ldap_tab_permission
    pipelined as

    user_row        ldap_permission;
    admin_session   dbms_ldap.session := null;
    retval          varchar2(256);
    vals            dbms_ldap.string_collection;
    tmpval          dbms_ldap.string_collection;
    msg             varchar2(256) := '';
    attrname        varchar2(256);
    ber             dbms_ldap.ber_element;
    ent             dbms_ldap.message;
    permission_name varchar2(256);
    permission_id   number;
    user_found      number;
    ldap_host       varchar2(256) := get_ldap_host();
    ldap_port       varchar2(256) := '389';
    ldap_base       varchar2(256) := get_ldap_base();
  begin
    dbms_ldap.use_exception := true;
    admin_session := dbms_ldap.init(ldap_host
                                   ,ldap_port);
    retval := ldap_bind_admin(admin_session
                             ,admin_cn
                             ,admin_pass);
    vals(1) := 'cn';
    vals(2) := 'gidNumber';
    vals(3) := 'memberUid';
    retval := dbms_ldap.search_s(ld       => admin_session
                                ,base     => 'ou=permissions,' || ldap_base
                                ,scope    => dbms_ldap.scope_subtree
                                ,filter   => 'objectclass=posixGroup'
                                ,attrs    => vals
                                ,attronly => 0
                                ,res      => msg);

    --if DBMS_LDAP.count_entries(ld => admin_session, msg => msg) > 0 THEN

    ent := dbms_ldap.first_entry(ld  => admin_session
                                ,msg => msg);
    <<entry_loop>>
    while ent is not null
    loop
      user_row        := null;
      permission_name := null;
      permission_id   := 0;
      user_found      := 0;
      attrname        := dbms_ldap.first_attribute(ld        => admin_session
                                                  ,ldapentry => ent
                                                  ,ber_elem  => ber);

      <<attributes_loop>>
      while attrname is not null
      loop
        tmpval := dbms_ldap.get_values(ld        => admin_session
                                      ,ldapentry => ent
                                      ,attr      => attrname);

        <<values_loop>>
        for i in tmpval.first .. tmpval.last
        loop
          if attrname = 'cn'
          then
            permission_name := tmpval(i);
          elsif attrname = 'gidNumber'
          then
            permission_id := to_number(tmpval(i));
          elsif attrname = 'memberUid'
                and lower(user_cn) = lower(tmpval(i))
          then
            user_found := 1;
          end if;
        end loop;

        attrname := dbms_ldap.next_attribute(ld        => admin_session
                                            ,ldapentry => ent
                                            ,ber_elem  => ber);

      end loop;

      if user_found > 0
      then
        user_row.name         := permission_name;
        user_row.permissionid := permission_id;
        pipe row(user_row);
      end if;

      ent := dbms_ldap.next_entry(ld  => admin_session
                                 ,msg => ent);
    end loop;
    --END IF;

    retval := dbms_ldap.unbind_s(admin_session);
    --EXCEPTION WHEN OTHERS THEN
    --  IF admin_session IS NOT NULL THEN
    --    retval := DBMS_LDAP.unbind_s(admin_session);
    --  END IF;
    --  raise;
  end;

  function ldap_get_permission_name(admin_cn      in varchar2
                                   ,admin_pass    in varchar2
                                   ,permission_id in number) return varchar2 as

    admin_session   dbms_ldap.session;
    retval          varchar2(256);
    vals            dbms_ldap.string_collection;
    tmpval          dbms_ldap.string_collection;
    msg             varchar2(256) := '';
    attrname        varchar2(256);
    ber             dbms_ldap.ber_element;
    ent             dbms_ldap.message;
    permission_name varchar2(256) := null;
    ldap_host       varchar2(256) := get_ldap_host();
    ldap_port       varchar2(256) := '389';
    ldap_base       varchar2(256) := get_ldap_base();
  begin
    dbms_ldap.use_exception := true;
    admin_session := dbms_ldap.init(ldap_host
                                   ,ldap_port);
    retval := ldap_bind_admin(admin_session
                             ,admin_cn
                             ,admin_pass);
    vals(1) := 'cn';
    retval := dbms_ldap.search_s(ld       => admin_session
                                ,base     => 'ou=permissions,' || ldap_base
                                ,scope    => dbms_ldap.scope_subtree
                                ,filter   => '(' || chr(38) || '(objectclass=posixGroup)(gidNumber=' || permission_id || '))'
                                ,attrs    => vals
                                ,attronly => 0
                                ,res      => msg);

    if dbms_ldap.count_entries(ld  => admin_session
                              ,msg => msg) > 0
    then
      ent := dbms_ldap.first_entry(ld  => admin_session
                                  ,msg => msg);
      <<entry_loop>>
      while ent is not null
      loop
        attrname := dbms_ldap.first_attribute(ld        => admin_session
                                             ,ldapentry => ent
                                             ,ber_elem  => ber);

        <<attributes_loop>>
        while attrname is not null
        loop
          tmpval := dbms_ldap.get_values(ld        => admin_session
                                        ,ldapentry => ent
                                        ,attr      => attrname);

          <<values_loop>>
          for i in tmpval.first .. tmpval.last
          loop
            if attrname = 'cn'
            then
              permission_name := tmpval(i);
            end if;
          end loop;

          attrname := dbms_ldap.next_attribute(ld        => admin_session
                                              ,ldapentry => ent
                                              ,ber_elem  => ber);

        end loop;

        ent := dbms_ldap.next_entry(ld  => admin_session
                                   ,msg => ent);
      end loop;

    end if;

    retval := dbms_ldap.unbind_s(admin_session);
    return permission_name;
  end;

  function ldap_modify_user_permissions(admin_cn        in varchar2
                                       ,admin_pass      in varchar2
                                       ,user_cn         in varchar2
                                       ,permission_mask in varchar2) return varchar2 as
    v_array apex_application_global.vc_arr2;
    v_tmp   varchar2(255);
  begin
    v_array := apex_util.string_to_table(permission_mask
                                        ,',');
    for i in 1 .. v_array.count
    loop
      if substr(v_array(i)
               ,1
               ,1) = '+'
      then
        v_tmp := ldap_add_user_permission(admin_cn
                                         ,admin_pass
                                         ,user_cn
                                         ,to_number(substr(v_array(i)
                                                          ,2)));

        if v_tmp <> 'OK'
        then
          return v_tmp;
        end if;
      elsif substr(v_array(i)
                  ,1
                  ,1) = '-'
      then
        v_tmp := ldap_remove_user_permission(admin_cn
                                            ,admin_pass
                                            ,user_cn
                                            ,to_number(substr(v_array(i)
                                                             ,2)));

        if v_tmp <> 'OK'
        then
          return v_tmp;
        end if;
      end if;
    end loop;

    return 'OK';
  end;

  function ldap_add_user_permission(admin_cn      in varchar2
                                   ,admin_pass    in varchar2
                                   ,user_cn       in varchar2
                                   ,permission_id in number) return varchar2 as

    retval          pls_integer;
    admin_session   dbms_ldap.session;
    user_dn         varchar2(256);
    user_array      dbms_ldap.mod_array;
    user_vals       dbms_ldap.string_collection;
    ldap_host       varchar2(256) := get_ldap_host();
    ldap_port       varchar2(256) := '389';
    ldap_base       varchar2(256) := get_ldap_base();
    errcode         number := 0;
    errmsg          varchar2(256) := '';
    permission_name varchar2(255) := ldap_get_permission_name(admin_cn
                                                             ,admin_pass
                                                             ,permission_id);
  begin
    dbms_ldap.use_exception := true;
    admin_session := dbms_ldap.init(ldap_host
                                   ,ldap_port);
    retval := ldap_bind_admin(admin_session
                             ,admin_cn
                             ,admin_pass);
    user_array := dbms_ldap.create_mod_array(20);
    user_vals(1) := user_cn;
    dbms_ldap.populate_mod_array(user_array
                                ,dbms_ldap.mod_add
                                ,'memberUid'
                                ,user_vals);
    user_dn := 'cn=' || permission_name || ',ou=permissions,' || ldap_base;
    retval  := dbms_ldap.modify_s(admin_session
                                 ,user_dn
                                 ,user_array);
    dbms_ldap.free_mod_array(user_array);

    --insert into user_manage_audit (exec_user, affected_user, action, exec_host) values (lower(v('APP_USER')), lower(user_cn), 4, lower(v('AI_TERMINAL_NAME')));
    retval := dbms_ldap.unbind_s(admin_session);
    return 'OK';
  exception
    when others then
      errcode := sqlcode;
      errmsg  := sqlerrm;
      errmsg  := trim(regexp_replace(errcode || ': ' || errmsg
                                    ,'^.*:'
                                    ,''));

      return( /*errcode || ': ' ||*/errmsg || ' (' || permission_id || ')');
  end;

  function ldap_remove_user_permission(admin_cn      in varchar2
                                      ,admin_pass    in varchar2
                                      ,user_cn       in varchar2
                                      ,permission_id in number) return varchar2 as

    retval          pls_integer;
    admin_session   dbms_ldap.session;
    user_dn         varchar2(256);
    user_array      dbms_ldap.mod_array;
    user_vals       dbms_ldap.string_collection;
    ldap_host       varchar2(256) := get_ldap_host();
    ldap_port       varchar2(256) := '389';
    ldap_base       varchar2(256) := get_ldap_base();
    errcode         number := 0;
    errmsg          varchar2(256) := '';
    permission_name varchar2(255) := ldap_get_permission_name(admin_cn
                                                             ,admin_pass
                                                             ,permission_id);
  begin
    dbms_ldap.use_exception := true;
    admin_session := dbms_ldap.init(ldap_host
                                   ,ldap_port);
    retval := ldap_bind_admin(admin_session
                             ,admin_cn
                             ,admin_pass);
    user_array := dbms_ldap.create_mod_array(20);
    user_vals(1) := user_cn;
    dbms_ldap.populate_mod_array(user_array
                                ,dbms_ldap.mod_delete
                                ,'memberUid'
                                ,user_vals);
    user_dn := 'cn=' || permission_name || ',ou=permissions,' || ldap_base;
    retval  := dbms_ldap.modify_s(admin_session
                                 ,user_dn
                                 ,user_array);
    dbms_ldap.free_mod_array(user_array);

    --insert into user_manage_audit (exec_user, affected_user, action, exec_host) values (lower(v('APP_USER')), lower(user_cn), 4, lower(v('AI_TERMINAL_NAME')));
    retval := dbms_ldap.unbind_s(admin_session);
    return 'OK';
  exception
    when others then
      errcode := sqlcode;
      errmsg  := sqlerrm;
      errmsg  := trim(regexp_replace(errcode || ': ' || errmsg
                                    ,'^.*:'
                                    ,''));

      return( /*errcode || ': ' ||*/errmsg || ' (' || permission_id || ')');
  end;

  function ldap_enumerate_users(admin_cn   in varchar2
                               ,admin_pass in varchar2) return ldap_tab_type
    pipelined as

    user_row      ldap_rec_type;
    admin_session dbms_ldap.session;
    ldap_host     varchar2(256) := get_ldap_host();
    ldap_port     varchar2(256) := '389';
    ldap_base     varchar2(256) := get_ldap_base();
    vals          dbms_ldap.string_collection;
    retval        varchar2(256) := '';
    tmpval        dbms_ldap.string_collection;
    msg           varchar2(256) := '';
    attrname      varchar2(256);
    ber           dbms_ldap.ber_element;
    ent           dbms_ldap.message;
    user_cn       varchar2(256);
    user_group    varchar2(256);
    last_login    varchar2(256);
    locked_date   varchar2(256);
  begin
    dbms_ldap.use_exception := true;
    admin_session := dbms_ldap.init(ldap_host
                                   ,ldap_port);
    retval := ldap_bind_admin(admin_session
                             ,admin_cn
                             ,admin_pass);
    vals(1) := 'cn';
    vals(2) := 'gidNumber';
    vals(3) := 'authTimestamp';
    vals(4) := 'pwdAccountLockedTime';
    retval := dbms_ldap.search_s(ld       => admin_session
                                ,base     => 'ou=users,' || ldap_base
                                ,scope    => dbms_ldap.scope_subtree
                                ,filter   => 'objectclass=posixAccount'
                                ,attrs    => vals
                                ,attronly => 0
                                ,res      => msg);

    if dbms_ldap.count_entries(ld  => admin_session
                              ,msg => msg) > 0
    then
      ent := dbms_ldap.first_entry(ld  => admin_session
                                  ,msg => msg);
      <<entry_loop>>
      while ent is not null
      loop
        user_cn     := null;
        user_group  := null;
        last_login  := null;
        locked_date := null;
        attrname    := dbms_ldap.first_attribute(ld        => admin_session
                                                ,ldapentry => ent
                                                ,ber_elem  => ber);

        <<attributes_loop>>
        while attrname is not null
        loop
          tmpval := dbms_ldap.get_values(ld        => admin_session
                                        ,ldapentry => ent
                                        ,attr      => attrname);

          <<values_loop>>
          for i in tmpval.first .. tmpval.last
          loop
            if attrname = 'cn'
            then
              user_cn := tmpval(i);
            elsif attrname = 'gidNumber'
            then
              if tmpval(i) = '100'
              then
                user_group := 'gdiadmin';
              elsif tmpval(i) = '200'
              then
                user_group := 'gdioper';
              elsif tmpval(i) = '300'
              then
                user_group := 'gdiuser';
              end if;
            elsif attrname = 'authTimestamp'
            then
              last_login := tmpval(i);
            elsif attrname = 'pwdAccountLockedTime'
            then
              locked_date := tmpval(i);
            end if;
          end loop values_loop;

          attrname := dbms_ldap.next_attribute(ld        => admin_session
                                              ,ldapentry => ent
                                              ,ber_elem  => ber);

        end loop attributes_loop;

        user_row.user_name  := user_cn;
        user_row.group_name := user_group;
        if last_login is not null
        then
          user_row.last_login := TO_DATE(last_login
                                        ,'YYYYMMDDHH24MISS"Z"') + (systimestamp - sys_extract_utc(systimestamp));
        else
          user_row.last_login := null;
        end if;

        if locked_date is not null
        then
          user_row.is_locked := 1;
        else
          user_row.is_locked := 0;
        end if;

        pipe row(user_row);
        ent := dbms_ldap.next_entry(ld  => admin_session
                                   ,msg => ent);
      end loop entry_loop;

    end if;

    retval := dbms_ldap.unbind_s(admin_session);
  end;

  function get_users(admin_cn   in varchar2
                    ,admin_pass in varchar2) return ldap_tab_entry
    pipelined as

    user_row      ldap_entry;
    admin_session dbms_ldap.session;
    ldap_host     varchar2(256) := get_ldap_host();
    ldap_port     varchar2(256) := '389';
    ldap_base     varchar2(256) := get_ldap_base();
    vals          dbms_ldap.string_collection;
    retval        varchar2(256) := '';
    tmpval        dbms_ldap.string_collection;
    msg           varchar2(256) := '';
    attrname      varchar2(256);
    ber           dbms_ldap.ber_element;
    ent           dbms_ldap.message;
    user_cn       varchar2(256);
    user_group    varchar2(256);
    last_login    varchar2(256);
    locked_date   varchar2(256);
    server_name   varchar2(255);
  begin
    dbms_ldap.use_exception := true;
    server_name := PKG_COMMON.Get_Parameter('SERVER_NAME');
    admin_session := dbms_ldap.init(ldap_host
                                   ,ldap_port);
    retval := ldap_bind_admin(admin_session
                             ,admin_cn
                             ,admin_pass);
    vals(1) := 'cn';
    vals(2) := 'gidNumber';
    vals(3) := 'authTimestamp';
    vals(4) := 'pwdAccountLockedTime';
    vals(5) := 'uid';
    vals(6) := 'departmentNumber';
    vals(7) := 'employeeNumber';
    vals(8) := 'givenName';
    vals(9) := 'sn';
    vals(10) := 'userPassword';
    vals(11) := 'pwdChangedTime';
    vals(12) := 'modifyTimestamp';
    vals(13) := 'createTimestamp';
    retval := dbms_ldap.search_s(ld       => admin_session
                                ,base     => 'ou=users,' || ldap_base
                                ,scope    => dbms_ldap.scope_subtree
                                ,filter   => 'objectclass=posixAccount'
                                ,attrs    => vals
                                ,attronly => 0
                                ,res      => msg);

    if dbms_ldap.count_entries(ld  => admin_session
                              ,msg => msg) > 0
    then
      ent := dbms_ldap.first_entry(ld  => admin_session
                                  ,msg => msg);
      <<entry_loop>>
      while ent is not null
      loop
        user_row := null;
        attrname := dbms_ldap.first_attribute(ld        => admin_session
                                             ,ldapentry => ent
                                             ,ber_elem  => ber);

        <<attributes_loop>>
        while attrname is not null
        loop
          tmpval := dbms_ldap.get_values(ld        => admin_session
                                        ,ldapentry => ent
                                        ,attr      => attrname);

          <<values_loop>>
          for i in tmpval.first .. tmpval.last
          loop
            null;
            if attrname = 'cn'
            then
              user_row.cn := tmpval(i);
            elsif attrname = 'gidNumber'
            then
              user_row.gidnumber := tmpval(i);
            elsif attrname = 'authTimestamp'
            then
              user_row.authtimestamp := tmpval(i);
            elsif attrname = 'pwdAccountLockedTime'
            then
              user_row.pwdaccountlockedtime := tmpval(i);
            elsif attrname = 'uid'
            then
              user_row.userid := tmpval(i);
            elsif attrname = 'departmentNumber'
            then
              user_row.departmentnumber := tmpval(i);
            elsif attrname = 'employeeNumber'
            then
              user_row.employeenumber := tmpval(i);
            elsif attrname = 'givenName'
            then
              user_row.givenname := tmpval(i);
            elsif attrname = 'sn'
            then
              user_row.sn := tmpval(i);
            elsif attrname = 'userPassword'
            then
              user_row.userpassword := tmpval(i);
            elsif attrname = 'pwdChangedTime'
            then
              user_row.pwdchangedtime := tmpval(i);
            elsif attrname = 'modifyTimestamp'
            then
              user_row.modifytimestamp := tmpval(i);
            elsif attrname = 'createTimestamp'
            then
              user_row.createtimestamp := tmpval(i);
            end if;

          end loop values_loop;

          attrname := dbms_ldap.next_attribute(ld        => admin_session
                                              ,ldapentry => ent
                                              ,ber_elem  => ber);

        end loop attributes_loop;

        user_row.servername := server_name;
        pipe row(user_row);
        ent := dbms_ldap.next_entry(ld  => admin_session
                                   ,msg => ent);
      end loop entry_loop;

    end if;

    retval := dbms_ldap.unbind_s(admin_session);
  end;

  function ldap_get_value(admin_cn   in varchar2
                         ,admin_pass in varchar2
                         ,user_cn    in varchar2
                         ,attr_name  in varchar2) return varchar2 as

    admin_session dbms_ldap.session;
    ldap_host     varchar2(256) := get_ldap_host();
    ldap_port     varchar2(256) := '389';
    ldap_base     varchar2(256) := get_ldap_base();
    vals          dbms_ldap.string_collection;
    retval        varchar2(256) := '';
    tmpval        dbms_ldap.string_collection;
    msg           varchar2(256) := '';
    attrname      varchar2(256);
    ber           dbms_ldap.ber_element;
    ent           dbms_ldap.message;
    cn            varchar2(256);
    user_group    varchar2(256);
    return_value  varchar2(256) := null;
    tmp_value     varchar2(256);
  begin
    dbms_ldap.use_exception := true;
    admin_session := dbms_ldap.init(ldap_host
                                   ,ldap_port);
    retval := ldap_bind_admin(admin_session
                             ,admin_cn
                             ,admin_pass);
    vals(1) := 'cn';
    vals(2) := attr_name;
    retval := dbms_ldap.search_s(ld       => admin_session
                                ,base     => 'ou=users,' || ldap_base
                                ,scope    => dbms_ldap.scope_subtree
                                ,filter   => 'objectclass=posixAccount'
                                ,attrs    => vals
                                ,attronly => 0
                                ,res      => msg);

    if dbms_ldap.count_entries(ld  => admin_session
                              ,msg => msg) > 0
    then
      ent := dbms_ldap.first_entry(ld  => admin_session
                                  ,msg => msg);
      <<entry_loop>>
      while ent is not null
      loop
        cn        := null;
        tmp_value := null;
        attrname  := dbms_ldap.first_attribute(ld        => admin_session
                                              ,ldapentry => ent
                                              ,ber_elem  => ber);

        <<attributes_loop>>
        while attrname is not null
        loop
          tmpval := dbms_ldap.get_values(ld        => admin_session
                                        ,ldapentry => ent
                                        ,attr      => attrname);

          <<values_loop>>
          for i in tmpval.first .. tmpval.last
          loop
            if attrname = 'cn'
            then
              cn := tmpval(i);
            else
              tmp_value := tmpval(i);
            end if;
          end loop values_loop;

          attrname := dbms_ldap.next_attribute(ld        => admin_session
                                              ,ldapentry => ent
                                              ,ber_elem  => ber);

        end loop attributes_loop;

        if cn = user_cn
        then
          return_value := tmp_value;
        end if;
        ent := dbms_ldap.next_entry(ld  => admin_session
                                   ,msg => ent);
      end loop entry_loop;

    end if;

    retval := dbms_ldap.unbind_s(admin_session);
    return return_value;
  end;

  function ldap_add_user(admin_cn   in varchar2
                        ,admin_pass in varchar2
                        ,user_cn    in varchar2
                        ,user_pass  in varchar2
                        ,user_group in varchar2) return varchar2 as

    retval        pls_integer;
    admin_session dbms_ldap.session;
    user_dn       varchar2(256);
    user_array    dbms_ldap.mod_array;
    user_vals     dbms_ldap.string_collection;
    ldap_host     varchar2(256) := get_ldap_host();
    ldap_port     varchar2(256) := '389';
    ldap_base     varchar2(256) := get_ldap_base();
    errcode       number := 0;
    errmsg        varchar2(256) := '';
    user_gid      varchar2(256) := '0';
  begin
    dbms_ldap.use_exception := true;
    admin_session := dbms_ldap.init(ldap_host
                                   ,ldap_port);
    retval := ldap_bind_admin(admin_session
                             ,admin_cn
                             ,admin_pass);
    user_array := dbms_ldap.create_mod_array(20);
    user_vals(1) := user_cn;
    dbms_ldap.populate_mod_array(user_array
                                ,dbms_ldap.mod_add
                                ,'uid'
                                ,user_vals);
    dbms_ldap.populate_mod_array(user_array
                                ,dbms_ldap.mod_add
                                ,'cn'
                                ,user_vals);
    dbms_ldap.populate_mod_array(user_array
                                ,dbms_ldap.mod_add
                                ,'sn'
                                ,user_vals);

    -- user_vals(1) := user_pass;
    user_vals(1) := createsshapassword(user_pass);
    dbms_ldap.populate_mod_array(user_array
                                ,dbms_ldap.mod_add
                                ,'userpassword'
                                ,user_vals);
    user_vals(1) := '/tmp/';
    dbms_ldap.populate_mod_array(user_array
                                ,dbms_ldap.mod_add
                                ,'homeDirectory'
                                ,user_vals);
    if lower(user_group) = 'gdiadmin'
    then
      user_gid := '100';
    elsif lower(user_group) = 'gdioper'
    then
      user_gid := '200';
    elsif lower(user_group) = 'gdiuser'
    then
      user_gid := '300';
    end if;

    user_vals(1) := user_gid;
    dbms_ldap.populate_mod_array(user_array
                                ,dbms_ldap.mod_add
                                ,'gidNumber'
                                ,user_vals);
    user_vals(1) := '0';
    dbms_ldap.populate_mod_array(user_array
                                ,dbms_ldap.mod_add
                                ,'uidNumber'
                                ,user_vals);
    user_vals(1) := 'top';
    user_vals(2) := 'inetOrgPerson';
    user_vals(3) := 'posixAccount';
    dbms_ldap.populate_mod_array(user_array
                                ,dbms_ldap.mod_add
                                ,'objectclass'
                                ,user_vals);
    user_dn := 'cn=' || user_cn || ', ou=users,' || ldap_base;
    retval  := dbms_ldap.add_s(admin_session
                              ,user_dn
                              ,user_array);
    dbms_ldap.free_mod_array(user_array);
    insert into user_manage_audit
      (exec_user
      ,affected_user
      ,group_name
      ,action
      ,exec_host)
    values
      (lower(v('APP_USER'))
      ,lower(user_cn)
      ,user_group
      ,1
      ,lower(v('AI_TERMINAL_NAME')));

    retval := dbms_ldap.unbind_s(admin_session);
    return 'OK';
  exception
    when others then
      errcode := sqlcode;
      errmsg  := sqlerrm;
      errmsg  := trim(regexp_replace(errcode || ': ' || errmsg
                                    ,'^.*:'
                                    ,''));

      return( /*errcode || ': ' ||*/errmsg);
  end;

  function ldap_set_user_password(admin_cn   in varchar2
                                 ,admin_pass in varchar2
                                 ,user_cn    in varchar2
                                 ,user_pass  in varchar2) return varchar2 as

    retval        pls_integer;
    admin_session dbms_ldap.session;
    user_dn       varchar2(256);
    user_array    dbms_ldap.mod_array;
    user_vals     dbms_ldap.string_collection;
    ldap_host     varchar2(256) := get_ldap_host();
    ldap_port     varchar2(256) := '389';
    ldap_base     varchar2(256) := get_ldap_base();
    errcode       number := 0;
    errmsg        varchar2(256) := '';
    laststep      varchar2(256) := '';
  begin
    dbms_ldap.use_exception := true;
    laststep := 'DBMS_LDAP.init';
    admin_session := dbms_ldap.init(ldap_host
                                   ,ldap_port);
    laststep := 'DBMS_LDAP.simple_bind_s';
    retval := ldap_bind_admin(admin_session
                             ,admin_cn
                             ,admin_pass);
    laststep := 'DBMS_LDAP.create_mod_array';
    user_array := dbms_ldap.create_mod_array(20);
    user_vals(1) := createsshapassword(user_pass);
    laststep := 'DBMS_LDAP.populate_mod_array';
    dbms_ldap.populate_mod_array(user_array
                                ,dbms_ldap.mod_replace
                                ,'userpassword'
                                ,user_vals);
    user_dn  := 'cn=' || user_cn || ',ou=users,' || ldap_base;
    laststep := 'DBMS_LDAP.modify_s';
    retval   := dbms_ldap.modify_s(admin_session
                                  ,user_dn
                                  ,user_array);
    laststep := 'DBMS_LDAP.free_mod_array';
    dbms_ldap.free_mod_array(user_array);
    laststep := 'insert into user_manage_audit';
    insert into user_manage_audit
      (exec_user
      ,affected_user
      ,action
      ,exec_host)
    values
      (lower(v('APP_USER'))
      ,lower(user_cn)
      ,4
      ,lower(v('AI_TERMINAL_NAME')));

    laststep := 'DBMS_LDAP.unbind_s';
    retval   := dbms_ldap.unbind_s(admin_session);
    laststep := 'return';
    return 'OK';
  exception
    when others then
      errcode := sqlcode;
      errmsg  := sqlerrm;
      errmsg  := trim(regexp_replace(errcode || ': ' || errmsg
                                    ,'^.*:'
                                    ,'') || ' [' || laststep || ']');

      return( /*errcode || ': ' ||*/errmsg);
  end;

  function ldap_set_user_group(admin_cn   in varchar2
                              ,admin_pass in varchar2
                              ,user_cn    in varchar2
                              ,user_group in varchar2) return varchar2 as

    retval        pls_integer;
    admin_session dbms_ldap.session;
    user_dn       varchar2(256);
    user_array    dbms_ldap.mod_array;
    user_vals     dbms_ldap.string_collection;
    ldap_host     varchar2(256) := get_ldap_host();
    ldap_port     varchar2(256) := '389';
    ldap_base     varchar2(256) := get_ldap_base();
    errcode       number := 0;
    errmsg        varchar2(256) := '';
    user_gid      varchar2(256) := '0';
    v_cnt         number := 0;
  begin
    select count(*)
      into v_cnt
      from table(ldap_enumerate_users(admin_cn
                                     ,admin_pass)) usertable
     where lower(usertable.group_name) = lower(user_group)
       and lower(usertable.user_name) = lower(user_cn);

    if v_cnt > 0
    then
      return 'OK';
    end if;
    dbms_ldap.use_exception := true;
    admin_session           := dbms_ldap.init(ldap_host
                                             ,ldap_port);
    retval                  := ldap_bind_admin(admin_session
                                              ,admin_cn
                                              ,admin_pass);
    user_array              := dbms_ldap.create_mod_array(20);
    if lower(user_group) = 'gdiadmin'
    then
      user_gid := '100';
    elsif lower(user_group) = 'gdioper'
    then
      user_gid := '200';
    elsif lower(user_group) = 'gdiuser'
    then
      user_gid := '300';
    end if;

    user_vals(1) := user_gid;
    dbms_ldap.populate_mod_array(user_array
                                ,dbms_ldap.mod_replace
                                ,'gidNumber'
                                ,user_vals);
    user_dn := 'cn=' || user_cn || ', ou=users,' || ldap_base;
    retval  := dbms_ldap.modify_s(admin_session
                                 ,user_dn
                                 ,user_array);
    dbms_ldap.free_mod_array(user_array);
    insert into user_manage_audit
      (exec_user
      ,affected_user
      ,group_name
      ,action
      ,exec_host)
    values
      (lower(v('APP_USER'))
      ,lower(user_cn)
      ,user_group
      ,3
      ,lower(v('AI_TERMINAL_NAME')));

    retval := dbms_ldap.unbind_s(admin_session);
    return 'OK';
  exception
    when others then
      errcode := sqlcode;
      errmsg  := sqlerrm;
      errmsg  := trim(regexp_replace(errcode || ': ' || errmsg
                                    ,'^.*:'
                                    ,''));

      return( /*errcode || ': ' ||*/errmsg);
  end;

  function ldap_set_user_metadata(admin_cn            in varchar2
                                 ,admin_pass          in varchar2
                                 ,user_cn             in varchar2
                                 ,user_sn             in varchar2
                                 ,user_givenname      in varchar2
                                 ,user_employeenumber in varchar2) return varchar2 as

    retval             pls_integer;
    admin_session      dbms_ldap.session;
    user_dn            varchar2(256);
    user_array         dbms_ldap.mod_array;
    user_vals          dbms_ldap.string_collection;
    ldap_host          varchar2(256) := get_ldap_host();
    ldap_port          varchar2(256) := '389';
    ldap_base          varchar2(256) := get_ldap_base();
    errcode            number := 0;
    errmsg             varchar2(256) := '';
    user_gid           varchar2(256) := '0';
    v_cnt              number := 0;
    old_sn             varchar2(256);
    old_givenname      varchar2(256);
    old_employeenumber varchar2(256);
  begin
    dbms_ldap.use_exception := true;
    select sn
          ,givenname
          ,employeenumber
      into old_sn
          ,old_givenname
          ,old_employeenumber
      from table(dl_ldap.get_users(admin_cn
                                  ,admin_pass))
     where cn = user_cn
       and ROWNUM < 2;

    admin_session := dbms_ldap.init(ldap_host
                                   ,ldap_port);
    retval        := ldap_bind_admin(admin_session
                                    ,admin_cn
                                    ,admin_pass);
    user_array    := dbms_ldap.create_mod_array(20);
    user_dn       := 'cn=' || user_cn || ', ou=users,' || ldap_base;
    if user_sn is null
       and old_sn is not null
    then
      user_vals(1) := user_cn;
      dbms_ldap.populate_mod_array(user_array
                                  ,dbms_ldap.mod_replace
                                  ,'sn'
                                  ,user_vals);
    else
      user_vals(1) := user_sn;
      dbms_ldap.populate_mod_array(user_array
                                  ,dbms_ldap.mod_replace
                                  ,'sn'
                                  ,user_vals);
    end if;
    --retval := DBMS_LDAP.modify_s(admin_session,user_dn,user_array);

    /*user_vals(1) := user_givenname;
    IF user_givenname IS NULL THEN
      user_vals(1) := ' ';
    END IF;
    DBMS_LDAP.populate_mod_array(user_array,DBMS_LDAP.MOD_REPLACE, 'givenName',user_vals);*/

    if old_givenname is not null
    then
      if user_givenname is null
      then
        user_vals(1) := old_givenname;
        dbms_ldap.populate_mod_array(user_array
                                    ,dbms_ldap.mod_delete
                                    ,'givenName'
                                    ,user_vals);
      else
        user_vals(1) := user_givenname;
        dbms_ldap.populate_mod_array(user_array
                                    ,dbms_ldap.mod_replace
                                    ,'givenName'
                                    ,user_vals);
      end if;
    else
      if user_givenname is null
      then
        null;
      else
        user_vals(1) := user_givenname;
        dbms_ldap.populate_mod_array(user_array
                                    ,dbms_ldap.mod_add
                                    ,'givenName'
                                    ,user_vals);
      end if;
    end if;

    if old_employeenumber is not null
    then
      if user_employeenumber is null
      then
        user_vals(1) := old_employeenumber;
        dbms_ldap.populate_mod_array(user_array
                                    ,dbms_ldap.mod_delete
                                    ,'employeeNumber'
                                    ,user_vals);
      else
        user_vals(1) := user_employeenumber;
        dbms_ldap.populate_mod_array(user_array
                                    ,dbms_ldap.mod_replace
                                    ,'employeeNumber'
                                    ,user_vals);
      end if;
    else
      if user_employeenumber is null
      then
        null;
      else
        user_vals(1) := user_employeenumber;
        dbms_ldap.populate_mod_array(user_array
                                    ,dbms_ldap.mod_add
                                    ,'employeeNumber'
                                    ,user_vals);
      end if;
    end if;

    /*user_vals(1) := user_employeenumber;
    IF user_employeenumber IS NULL THEN
      user_vals(1) := ' ';
    END IF;
    DBMS_LDAP.populate_mod_array(user_array,DBMS_LDAP.MOD_REPLACE, 'employeeNumber',user_vals);*/

    retval := dbms_ldap.modify_s(admin_session
                                ,user_dn
                                ,user_array);
    dbms_ldap.free_mod_array(user_array);

    -- insert into user_manage_audit (exec_user, affected_user, group_name, action, exec_host) values (lower(v('APP_USER')), lower(user_cn), user_group, 3, lower(v('AI_TERMINAL_NAME')));
    retval := dbms_ldap.unbind_s(admin_session);
    return 'OK';
  exception
    when others then
      errcode := sqlcode;
      errmsg  := sqlerrm;
      errmsg  := trim(regexp_replace(errcode || ': ' || errmsg
                                    ,'^.*:'
                                    ,''));

      return( /*errcode || ': ' ||*/errmsg);
  end;

  function ldap_remove_user(admin_cn   in varchar2
                           ,admin_pass in varchar2
                           ,user_cn    in varchar2) return varchar2 as

    retval        pls_integer;
    admin_session dbms_ldap.session;
    user_dn       varchar2(256);
    ldap_host     varchar2(256) := get_ldap_host();
    ldap_port     varchar2(256) := '389';
    ldap_base     varchar2(256) := get_ldap_base();
    errcode       number := 0;
    errmsg        varchar2(256) := '';
  begin
    dbms_ldap.use_exception := true;
    admin_session           := dbms_ldap.init(ldap_host
                                             ,ldap_port);
    retval                  := ldap_bind_admin(admin_session
                                              ,admin_cn
                                              ,admin_pass);
    user_dn                 := 'cn=' || user_cn || ', ou=users,' || ldap_base;
    retval                  := dbms_ldap.delete_s(admin_session
                                                 ,user_dn);
    retval                  := dbms_ldap.unbind_s(admin_session);
    insert into user_manage_audit
      (exec_user
      ,affected_user
      ,action
      ,exec_host)
    values
      (lower(v('APP_USER'))
      ,lower(user_cn)
      ,2
      ,lower(v('AI_TERMINAL_NAME')));

    return 'OK';
  exception
    when others then
      errcode := sqlcode;
      errmsg  := sqlerrm;
      errmsg  := trim(regexp_replace(errcode || ': ' || errmsg
                                    ,'^.*:'
                                    ,''));

      return( /*errcode || ': ' ||*/errmsg);
  end;

  function get_ldap_base return varchar2 as
  begin
    return regexp_replace(PKG_COMMON.Get_Parameter('OPEN_LDAP_BASE')
                         ,'ou=[^,]*,'
                         ,''
                         ,1
                         ,0
                         ,'i');
  end;

  function get_ldap_host return varchar2 as
  begin
    return PKG_COMMON.Get_Parameter('OPEN_LDAP_HOST');
  end;

  function createsshapassword(textpassword in varchar2) return varchar2 as
    res varchar2(255);
  begin
    select /*utl_raw.cast_to_varchar2(utl_encode.base64_encode(utl_raw.cast_to_raw(*/
     '{SSHA}' || utl_raw.cast_to_varchar2(utl_encode.base64_encode(dbms_crypto.hash(utl_raw.cast_to_raw(textpassword || salty.salt)
                                                                                   ,3) || utl_raw.cast_to_raw(salty.salt))) /*)))*/
      into res
      from dual
          ,(select dbms_random.string('A'
                                     ,8) salt
              from dual) salty;

    return res;
  end;

  function comparesshapassword(textpassword in varchar2
                              ,p_salt       in varchar2
                              ,p_compare    in varchar2) return number as
    res varchar2(255);
  begin
    select '{SSHA}' || utl_raw.cast_to_varchar2(utl_encode.base64_encode(dbms_crypto.hash(utl_raw.cast_to_raw(textpassword || salty.salt)
                                                                                         ,3) || utl_raw.cast_to_raw(salty.salt)))
      into res
      from dual
          ,(select p_salt salt
              from dual) salty;

    if p_compare = res
    then
      return 1;
    end if;
    return 0;
  end;

  function extractsalt(p_password in varchar2) return varchar2 as
    v_raw      raw(2000);
    v_salt     varchar2(8);
    v_password varchar2(4000);
  begin
    v_password := substr(p_password
                        ,7); -- remove leading '{SSHA}'
    select utl_raw.cast_to_varchar2(substr(utl_encode.base64_decode(utl_raw.cast_to_raw(v_password))
                                          ,-16))
      into v_salt
      from dual;

    return v_salt;
  end;

  function ldap_compare_password(admin_cn      in varchar2
                                ,admin_pass    in varchar2
                                ,user_cn       in varchar2
                                ,user_password in varchar2) return number as
    v_password varchar2(4000);
    v_salt     varchar2(100);
  begin
    dbms_ldap.use_exception := true;
    v_password              := ldap_get_value(admin_cn
                                             ,admin_pass
                                             ,lower(user_cn)
                                             ,'userPassword');
    v_salt                  := extractsalt(v_password);
    return comparesshapassword(user_password
                              ,v_salt
                              ,v_password);
  end;

  function ldap_get_last_login(admin_cn   in varchar2
                              ,admin_pass in varchar2
                              ,user_cn    in varchar2) return date as

    user_row      ldap_rec_type;
    admin_session dbms_ldap.session;
    ldap_host     varchar2(256) := get_ldap_host();
    ldap_port     varchar2(256) := '389';
    ldap_base     varchar2(256) := get_ldap_base();
    vals          dbms_ldap.string_collection;
    retval        varchar2(256) := '';
    tmpval        dbms_ldap.string_collection;
    msg           varchar2(256) := '';
    attrname      varchar2(256);
    ber           dbms_ldap.ber_element;
    ent           dbms_ldap.message;
    cn            varchar2(256);
    user_group    varchar2(256);
    authtime      date := null;
    tmptime       date := null;
    tmp_value     varchar2(256);
  begin
    -- authTimestamp
    dbms_ldap.use_exception := true;
    tmp_value               := ldap_get_value(admin_cn
                                             ,admin_pass
                                             ,user_cn
                                             ,'authTimestamp');
    if tmp_value is null
    then
      return null;
    else
      return TO_DATE(tmp_value
                    ,'YYYYMMDDHH24MISS"Z"') +(systimestamp - sys_extract_utc(systimestamp));
    end if;

  end;

  function ldap_lock_account(admin_cn   in varchar2
                            ,admin_pass in varchar2
                            ,user_cn    in varchar2) return varchar2 as

    retval        pls_integer;
    admin_session dbms_ldap.session;
    user_dn       varchar2(256);
    user_array    dbms_ldap.mod_array;
    user_vals     dbms_ldap.string_collection;
    ldap_host     varchar2(256) := get_ldap_host();
    ldap_port     varchar2(256) := '389';
    ldap_base     varchar2(256) := get_ldap_base();
    errcode       number := 0;
    errmsg        varchar2(256) := '';
    user_gid      varchar2(256) := '0';
    v_cnt         number := 0;
    v_logon_time  number := to_number(TO_CHAR(sysdate
                                             ,'YYYYMMDD'));
  begin
    dbms_ldap.use_exception := true;
    admin_session := dbms_ldap.init(ldap_host
                                   ,ldap_port);
    retval := ldap_bind_admin(admin_session
                             ,admin_cn
                             ,admin_pass);
    user_array := dbms_ldap.create_mod_array(20);
    user_vals(1) := TO_CHAR(sys_extract_utc(systimestamp)
                           ,'YYYYMMDDHH24MISS"Z"');
    dbms_ldap.populate_mod_array(user_array
                                ,dbms_ldap.mod_add
                                ,'pwdAccountLockedTime'
                                ,user_vals);
    user_dn := 'cn=' || user_cn || ', ou=users,' || ldap_base;
    retval  := dbms_ldap.modify_s(admin_session
                                 ,user_dn
                                 ,user_array);
    dbms_ldap.free_mod_array(user_array);
    retval := dbms_ldap.unbind_s(admin_session);
    insert into user_manage_audit
      (exec_user
      ,affected_user
      ,group_name
      ,action
      ,exec_host)
    values
      (lower(v('APP_USER'))
      ,lower(user_cn)
      ,null
      ,6
      ,lower(v('AI_TERMINAL_NAME')));

    return 'OK';
  exception
    when others then
      errcode := sqlcode;
      errmsg  := sqlerrm;
      errmsg  := trim(regexp_replace(errcode || ': ' || errmsg
                                    ,'^.*:'
                                    ,''));

      return( /*errcode || ': ' ||*/errmsg);
  end;

  function ldap_unlock_account(admin_cn   in varchar2
                              ,admin_pass in varchar2
                              ,user_cn    in varchar2) return varchar2 as

    retval        pls_integer;
    admin_session dbms_ldap.session;
    user_dn       varchar2(256);
    user_array    dbms_ldap.mod_array;
    user_vals     dbms_ldap.string_collection;
    ldap_host     varchar2(256) := get_ldap_host();
    ldap_port     varchar2(256) := '389';
    ldap_base     varchar2(256) := get_ldap_base();
    errcode       number := 0;
    errmsg        varchar2(256) := '';
    user_gid      varchar2(256) := '0';
    v_cnt         number := 0;
    v_logon_time  number := to_number(TO_CHAR(sysdate
                                             ,'YYYYMMDD'));
  begin
    dbms_ldap.use_exception := true;
    admin_session := dbms_ldap.init(ldap_host
                                   ,ldap_port);
    retval := ldap_bind_admin(admin_session
                             ,admin_cn
                             ,admin_pass);
    user_dn := 'cn=' || user_cn || ', ou=users,' || ldap_base;
    user_array := dbms_ldap.create_mod_array(20);
    user_vals(1) := ldap_get_value(admin_cn
                                  ,admin_pass
                                  ,user_cn
                                  ,'pwdAccountLockedTime');
    dbms_ldap.populate_mod_array(user_array
                                ,dbms_ldap.mod_delete
                                ,'pwdAccountLockedTime'
                                ,user_vals);
    retval := dbms_ldap.modify_s(admin_session
                                ,user_dn
                                ,user_array);
    dbms_ldap.free_mod_array(user_array);
    retval := dbms_ldap.unbind_s(admin_session);
    insert into user_manage_audit
      (exec_user
      ,affected_user
      ,group_name
      ,action
      ,exec_host)
    values
      (lower(v('APP_USER'))
      ,lower(user_cn)
      ,null
      ,5
      ,lower(v('AI_TERMINAL_NAME')));

    return 'OK';
  exception
    when others then
      errcode := sqlcode;
      errmsg  := sqlerrm;
      errmsg  := trim(regexp_replace(errcode || ': ' || errmsg
                                    ,'^.*:'
                                    ,''));

      return( /*errcode || ': ' ||*/errmsg);
  end;

  function ldap_lock_date(admin_cn   in varchar2
                         ,admin_pass in varchar2
                         ,user_cn    in varchar2) return date as
    v_lockdate varchar2(255) := null;
  begin
    v_lockdate := ldap_get_value(admin_cn
                                ,admin_pass
                                ,user_cn
                                ,'pwdAccountLockedTime');
    if v_lockdate is not null
    then
      return TO_DATE(v_lockdate
                    ,'YYYYMMDDHH24MISS"Z"');
    else
      return null;
    end if;

  end;

end dl_ldap;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."DL_LDAP" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."DL_LDAP" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."DL_LDAP" TO "BIOSUPPORT";
