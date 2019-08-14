CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_APEX_UTIL" authid current_user is
  --
  --
  /*******************************************************************************
  ???


  Author    Date        Description
  --------  ----------  -------------------------------------------------------*
  CHageman  18.05.2018  Added function get_server_url
  CHageman  26.03.2018  Added procedure get_location_data
  WWirns    13.11.2017  Added
  *******************************************************************************/
  --
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
                              ,x_terminal_id      OUT dl_bordercontrol.terminals.id%type);


  /*
   *  Sets the Apex Environment so you can pretend to be in an apex Session.
   *
   *
   */
  PROCEDURE set_apex_environment (i_application_id      IN  NUMBER,
                                   i_session_id          IN VARCHAR2,
                                   i_workspace_name      IN VARCHAR2 default 'DL_BORDERCONTROL');
  --
  --
  procedure COLL_Init(p_COLLECTION_NAME in varchar2
                      --
                      );
  --
  --
  --
  function COLL_Get_BLOB001(p_COLLECTION_NAME in varchar2
                            --
                            ) return blob;
  --
  --
  --
  -- obsolet: USER_MANAGEMENT is used for authorization
  function Get_Authorisation_Level(p_USERNAME            in varchar2
                                  ,p_PASSWORD            in varchar2
                                  ,p_AUTHENTICATION_BASE in varchar2
                                  ,p_HOST                in varchar2
                                   --
                                   ) return number;
  --
  --
  --
  function Get_APP_Static_File_Content(p_FILE_NAME in varchar2
                                       --
                                       ) return blob;
  --
  --
  --
  function Get_WS_Static_File_Content(p_FILE_NAME in varchar2
                                      --
                                      ) return blob;


  --
  --
  --
  function Get_Pibics_Image(p_IMAGE_TYPE      in varchar2,
                            p_PK_VAL          in varchar2,
                            p_MVMNT_SRC       in varchar2 DEFAULT NULL
                            --
                            ) return blob;
  --
  --
  --
  procedure Get_Pibics_Image(p_COLLECTION_NAME in varchar2,
                             p_IMAGE_TYPE      in varchar2,
                             p_PK_VAL          in varchar2,
                             p_MVMNT_SRC       in varchar2 DEFAULT NULL
                             --
                             );
  --
  --
  --
  procedure Init_PACKAGE;
  --
  procedure Check_OBJECT_DEPENDENCE;
  --
  function Get_PACKAGE_ID return simple_integer deterministic;
  --
  function Get_OBJECT_NAME return varchar2 deterministic;
  --
  function Get_OBJECT_COPYRIGHT return varchar2 deterministic;
  --
  function Get_OBJECT_VERSION$VC return varchar2 deterministic;
  --
  /**
   * Gets the URL of the server (e.g. http://10.120.39.197) to provide that
   * services which are used with NGINX can still be called from database
   *
   * Example of usage: DL_BORDERCONTROL.PKG_APEX_FEE_AND_FINE
   *
   * @return VARCHAR2 Server-URL
   */
  FUNCTION get_server_url
  RETURN VARCHAR2;

end PKG_APEX_UTIL;
/
