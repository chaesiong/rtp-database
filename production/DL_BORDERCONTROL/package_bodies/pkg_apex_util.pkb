CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_APEX_UTIL" is
  --
  -- Part1: Major-Version
  -- Part2: Minor-Version
  -- Part3:
  -- Part4: Patch-Version
  -- Part6: Minor-Version
  --
  -- !!! INCREMENT THIS VERSIONS STRING ON EACH CHANGE INSIDE THE PACKAGE !!!
  --
  C_PACKAGE_ID       constant simple_integer := -1; --PKG_CONSTS.C_PID$DEMO$REPORT4CENT;
  C_OBJECT_VERSION   constant varchar2(19) := '1.0.0000';
  C_OBJECT_COPYRIGHT constant varchar2(255 char) := 'Copyright: DERMALOG Identification Systems GmbH, Hamburg - Germany, 2013-' || to_char(sysdate
                                                                                                                                          ,'yyyy');
  --
  -- If NOT initialized then call Init_PACKAGE() in every proc/func where Init_PACKAGE must be run before normal processing of it can be go!!!
  -- For example: "if (not g_PACKAGE_Initialized) then Init_PACKAGE(); end if;"
  g_PACKAGE_Initialized  boolean := false;
  g_PACKAGE_Initializing boolean := false;
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
  * CHageman  18.05.2018  Added function get_server_url
  * CHageman  26.03.2018  Added procedure get_location_data
  * WWirns    13.11.2017  XX:Moved here from standalone "PROCEDURE DL_BORDERCONTROL.INIT_COLLECTION" and partial refactor
  *******************************************************************************/
  --
  --
  /**
   * This procedure gets the Terminal and Borderpost-information so the officer can work
   * with the Bordercontrol-Applications.
   *
   * !! Throws Error 20999 if no configuration can be found with the related remote_addr !!
   */
  PROCEDURE get_location_data (p_remote_addr      IN  VARCHAR2
                              ,x_borderpost_id    OUT dl_bordercontrol.borderposts.key_value%type
                              ,x_borderpost_name  OUT dl_bordercontrol.borderposts.name%type
                              ,x_terminal_id      OUT dl_bordercontrol.terminals.id%type)
  IS
  BEGIN

    SELECT t.id
          ,bp.key_value
          ,bp.name
      INTO x_terminal_id
          ,x_borderpost_id
          ,x_borderpost_name
      FROM dl_bordercontrol.terminals t
      JOIN dl_bordercontrol.borderposts bp ON bp.key_value = t.border_post
     WHERE t.ipaddress = p_remote_addr;

  EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
      raise_application_error(-20999, 'GET_LOCATION_DATA: Terminal and Borderpost could not be found!');
  END get_location_data;


    PROCEDURE set_apex_environment (i_application_id      IN  NUMBER,
                                   i_session_id          IN VARCHAR2,
                                   i_workspace_name      IN VARCHAR2 default 'DL_BORDERCONTROL')
    AS
        l_securitygroup VARCHAR2(3200);
    BEGIN

        SELECT WORKSPACE_ID INTO l_securitygroup FROM APEX_WORKSPACES WHERE WORKSPACE = i_workspace_name;

        wwv_flow_api.set_security_group_id(l_securitygroup);
        wwv_flow.g_flow_id := i_application_id;
        wwv_flow.g_instance := i_session_id;

    END;


  --
  --
  procedure COLL_Init(p_COLLECTION_NAME in varchar2
                      --
                      ) is
  begin
    --
    /*
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    */
    --
    --APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => p_COLLECTION_NAME);
    dl_common.pkg_apex_util.create_empty_collection(p_collection_name => p_COLLECTION_NAME);
    APEX_COLLECTION.ADD_MEMBER(p_collection_name => p_COLLECTION_NAME
                              ,p_blob001         => null);
    -- release
    COMMIT;
    --
  end COLL_Init;
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
  * WWirns    13.11.2017  XX:Moved here from standalone "FUNCTION DL_BORDERCONTROL.SB" and partial refactor
  *******************************************************************************/
  --
  function COLL_Get_BLOB001(p_COLLECTION_NAME in varchar2
                            --
                            ) return blob is
    --
    v_Result blob;
    --
  begin
    --
    /*
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    */
    --
    select t.BLOB001
      into v_Result
      from APEX_COLLECTIONS t
     where t.COLLECTION_NAME = p_COLLECTION_NAME;
    --
    return v_Result;
    --
  end COLL_Get_BLOB001;
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
  * WWirns    13.11.2017  XX:Moved here from standalone "FUNCTION DL_BORDERCONTROL.GET_AUTHORISATION_LEVEL" and partial refactor
  *******************************************************************************/
  --
  function Get_Authorisation_Level(p_USERNAME            in varchar2
                                  ,p_PASSWORD            in varchar2
                                  ,p_AUTHENTICATION_BASE in varchar2
                                  ,p_HOST                in varchar2
                                   --
                                   ) return number is
    --
    v_Result           number;
    l_attributes       apex_application_global.vc_arr2;
    l_attribute_values apex_application_global.vc_arr2;
    --
  begin
    --
    /*
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    */
    --
    v_Result := -1;
    --
    apex_ldap.get_all_user_attributes(p_username         => p_USERNAME
                                     ,p_pass             => p_PASSWORD
                                     ,p_auth_base        => p_AUTHENTICATION_BASE
                                     ,p_host             => p_HOST
                                     ,p_port             => '389'
                                     ,p_attributes       => l_attributes
                                     ,p_attribute_values => l_attribute_values);
    --
    for i in l_attributes.first .. l_attributes.last
    loop
      if (l_attributes(i) = 'gidNumber')
      then
        v_Result := to_number(l_attribute_values(i));
        exit;
      end if;
    end loop;
    --
    return v_Result;
    --
  exception
    when others then
      -- ??? Why return -1 ???
      return v_Result;
      --
  end Get_Authorisation_Level;
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
  * WWirns    13.11.2017  XX:Moved here from standalone "FUNCTION DL_BORDERCONTROL.GETSTATICAPPIMAGE" and partial refactor
  *******************************************************************************/
  --
  function Get_APP_Static_File_Content(p_FILE_NAME in varchar2
                                       --
                                       ) return blob is
    --
    v_Result blob;
    --
  begin
    --
    /*
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    */
    --
    begin
      select FILE_CONTENT
        into v_Result
        from APEX_APPLICATION_STATIC_FILES
       where FILE_NAME = p_FILE_NAME
         and APPLICATION_ID = v('APP_ID');
    exception
      when NO_DATA_FOUND then
        v_Result := null;
    end;
    --
    return v_Result;
    --
  end Get_APP_Static_File_Content;
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
  * WWirns    13.11.2017  XX:Moved here from standalone "FUNCTION DL_BORDERCONTROL.GETSTATICIMAGE" and partial refactor
  *******************************************************************************/
  --
  function Get_WS_Static_File_Content(p_FILE_NAME in varchar2
                                      --
                                      ) return blob is
    --
    v_Result blob;
    --
  begin
    --
    /*
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    */
    --
    begin
      select FILE_CONTENT
        into v_Result
        from APEX_WORKSPACE_STATIC_FILES
       where FILE_NAME = p_FILE_NAME;
      --
    exception
      when NO_DATA_FOUND then
        v_Result := null;
    end;
    --
    return v_Result;
    --
  end Get_WS_Static_File_Content;
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
  * MSCS      14.05.2019  Get PIBICS Movement/Person Images
  *******************************************************************************/
  --
  function Get_Pibics_Image(p_IMAGE_TYPE      in varchar2,
                            p_PK_VAL          in varchar2,
                            p_MVMNT_SRC       in varchar2 DEFAULT NULL
                            --
                            ) return blob is
    --
    v_Result blob;
    --
  begin
    --
    /*
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    */
    --
    begin
        v_Result := pibicsdm2.f_get_pibics_img
                    (
                        p_image_type    => p_IMAGE_TYPE,
                        p_pk_val        => p_PK_VAL,
                        p_mvmnt_src     => p_MVMNT_SRC
                    );
    exception
        when OTHERS then
            v_Result := null;
    end;
    --
    return v_Result;
    --
  end Get_Pibics_Image;
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
  * MSCS      14.05.2019  Get PIBICS Movement/Person Images
  *******************************************************************************/
  --
  procedure Get_Pibics_Image(p_COLLECTION_NAME in varchar2,
                             p_IMAGE_TYPE      in varchar2,
                             p_PK_VAL          in varchar2,
                             p_MVMNT_SRC       in varchar2 DEFAULT NULL
                             --
                             ) is
    --
    v_Result blob;
    --
  begin
    --
    /*
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    */
    --
    begin
        v_Result := pibicsdm2.f_get_pibics_img
                    (
                        p_image_type    => p_IMAGE_TYPE,
                        p_pk_val        => p_PK_VAL,
                        p_mvmnt_src     => p_MVMNT_SRC
                    );
    exception
        when OTHERS then
            v_Result := null;
    end;
    --
    APEX_COLLECTION.UPDATE_MEMBER (
        p_collection_name => p_COLLECTION_NAME,
        p_seq  => 1,
        p_blob001 => v_Result
    );
    --
    -- release
    COMMIT;
    --
  end Get_Pibics_Image;
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
  procedure Init_PACKAGE is
    --
  begin
    --
    -- !!! Attention with call of other packages, because their init routines could be call back !!!
    -- !!! Try to avoid call of other packages here in this init block in order to prevent endless loops !!!
    --
    --
    -- Initial-Block
    if (not g_PACKAGE_Initializing)
    then
      --
      g_PACKAGE_Initializing := true;
      g_PACKAGE_Initialized  := false;
      --
      --
      Check_OBJECT_DEPENDENCE();
      --
      --
      null;
      --
      --
      g_PACKAGE_Initialized  := true;
      g_PACKAGE_Initializing := false;
      --
    end if;
    --
    -- For example, below are calls into functions they itself calls me
    --
    null;
    --
  end Init_PACKAGE;
  --
  --
  --
  procedure Check_OBJECT_DEPENDENCE is
  begin
    -- WWirns: For example check ORACLE-Version
    -- or internal version via "Get_OBJECT_VERSION$VC()" of other package or object types
    -- or if column of table exists
    -- and so on...
    null;
    --
  end Check_OBJECT_DEPENDENCE;
  --
  --
  --
  function Get_PACKAGE_ID return simple_integer deterministic is
  begin
    return C_PACKAGE_ID;
  end;
  --
  function Get_OBJECT_NAME return varchar2 deterministic is
  begin
    return $$plsql_unit_owner || '.' || $$plsql_unit;
  end;
  --
  function Get_OBJECT_COPYRIGHT return varchar2 deterministic is
  begin
    return C_OBJECT_COPYRIGHT;
  end;
  --
  function Get_OBJECT_VERSION$VC return varchar2 deterministic is
  begin
    return C_OBJECT_VERSION;
  end;
  --
  /*******************************************************************************
   * Author    Date        Description
   * --------  ----------  -------------------------------------------------------*
   * CHageman  13.06.2018  Filtered : as there should be no port at the server address
   *******************************************************************************/
  /**
   * Gets the URL of the server (e.g. http://10.120.39.197) to provide that
   * services which are used with NGINX can still be called from database
   *
   * Example of usage: DL_BORDERCONTROL.PKG_APEX_FEE_AND_FINE
   *
   * @return VARCHAR2 Server-URL
   */
  FUNCTION get_server_url
  RETURN VARCHAR2
  IS

    l_url  VARCHAR2(4000 CHAR);
    l_host VARCHAR2(4000 CHAR);

  BEGIN

    CASE
      WHEN INSTR(OWA_UTIL.GET_CGI_ENV('HTTP_HOST'), ':') > 0 THEN l_host := SUBSTR(OWA_UTIL.GET_CGI_ENV('HTTP_HOST'), 1, INSTR(OWA_UTIL.GET_CGI_ENV('HTTP_HOST'), ':') - 1);
      ELSE                                                        l_host := OWA_UTIL.GET_CGI_ENV('HTTP_HOST');
    END CASE;

    l_url := OWA_UTIL.GET_CGI_ENV('REQUEST_PROTOCOL') || '://' || l_host;

    RETURN l_url;

  END get_server_url;
  --
--
--
begin
  --
  Init_PACKAGE();
  --
end PKG_APEX_UTIL;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_APEX_UTIL" TO "DERMALOG_PROXY";
