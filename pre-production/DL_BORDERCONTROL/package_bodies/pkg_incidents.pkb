CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_INCIDENTS" is
  --
  -- Part1: Major-Version
  -- Part2: Minor-Version
  -- Part3:
  -- Part4: Patch-Version
  --
  -- !!! INCREMENT THIS VERSIONS STRING ON EACH CHANGE INSIDE THE PACKAGE !!!
  --
  C_PACKAGE_ID       constant simple_integer := -1; --PKG_CONSTS.C_PID$DEMO$REPORT4CENT;
  C_OBJECT_VERSION   constant varchar2(19) := '1.0.0004';
  C_OBJECT_COPYRIGHT constant varchar2(255 char) := 'Copyright: DERMALOG Identification Systems GmbH, Hamburg - Germany, 2013-' || to_char(sysdate
                                                                                                                                          ,'yyyy');
  --
  -- If NOT initialized then call Init_PACKAGE() in every proc/func where Init_PACKAGE must be run before normal processing of it can be go!!!
  -- For example: "if (not g_PACKAGE_Initialized) then Init_PACKAGE(); end if;"
  g_PACKAGE_Initialized  boolean := false;
  g_PACKAGE_Initializing boolean := false;
  --
  g_LOG_SCOPE_PREFIX constant varchar2(62 char) := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.';
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
  * WWirns    13.11.2017  XX:Moved here from standalone "PROCEDURE DL_BORDERCONTROL.CREATE_INCIDENT" and partial refactor
  * WWirns    14.11.2017  LOGGER added
  *******************************************************************************/
  --
  procedure Create_Incident$AT(p_DOCNO          in INCIDENTS.DOCNO%type
                              ,p_ISSUINGCOUNTRY in INCIDENTS.ISSUINGCOUNTRY%type default null
                              ,p_EXPIRYDATE     in BORDERDOCUMENTS.EXPIRYDATE%type default null
                              ,p_LASTNAME       in INCIDENTS.LASTNAME%type default null
                              ,p_GIVENNAME      in INCIDENTS.GIVENNAME%type default null
                              ,p_SEX            in BORDERDOCUMENTS.SEX%type default null
                              ,p_DOB            in INCIDENTS.DOB%type default null
                              ,p_TYPE           in INCIDENTS.TYPE%type
                              ,p_INS_TERMINAL   in INCIDENTS.INS_TERMINAL%type
                              ,p_INS_BORDERPOST in INCIDENTS.INS_BORDERPOST%type
                               --
                               ) is
    --
    pragma autonomous_transaction;
    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'add_modify_varchar';
    v_LOG_Params logger.tab_param;
    --
    v_CLIENT_IP varchar2(256);
    --
  begin
    --
    logger.append_param(v_LOG_Params
                       ,'p_DOCNO'
                       ,p_DOCNO);
    logger.append_param(v_LOG_Params
                       ,'p_ISSUINGCOUNTRY'
                       ,p_ISSUINGCOUNTRY);
    logger.append_param(v_LOG_Params
                       ,'p_EXPIRYDATE'
                       ,p_EXPIRYDATE);
    logger.log('START'
              ,v_LOG_Scope
              ,null
              ,v_LOG_Params);
    --
    /*
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    */
    --
    begin
      v_CLIENT_IP := owa_util.get_cgi_env('REMOTE_ADDR');
    exception
      when others then
        v_CLIENT_IP := sys_context('userenv'
                                  ,'ip_address');
    end;
    --
    insert into INCIDENTS
      (DOCNO
      ,CLIENT_IP
      ,OFFICER
      ,DOB
      ,LASTNAME
      ,GIVENNAME
      ,ISSUINGCOUNTRY
      ,type
      ,INS_TERMINAL
      ,INS_BORDERPOST
       --
       )
    values
      (p_DOCNO
      ,v_CLIENT_IP
      ,NVL(v('APP_USER')
          ,'n.a')
      ,p_DOB
      ,p_LASTNAME
      ,p_GIVENNAME
      ,p_ISSUINGCOUNTRY
      ,p_TYPE
      ,p_INS_TERMINAL
      ,p_INS_BORDERPOST
       --
       );
    --
    commit;
    --
    --owa_util.get_cgi_env('REMOTE_ADDR')
    --
  end Create_Incident$AT;
  --
  --
  --
  procedure Create_Incident(p_TYPE                          in INCIDENTS.TYPE%type
                           ,p_INS_TERMINAL                  in INCIDENTS.INS_TERMINAL%type
                           ,p_INS_BORDERPOST                in INCIDENTS.INS_BORDERPOST%type
                           ,p_DOCNO                         in INCIDENTS.DOCNO%type
                           --
                           ,p_ISSUINGCOUNTRY                in INCIDENTS.ISSUINGCOUNTRY%type default null
                           ,p_LASTNAME                      in INCIDENTS.LASTNAME%type default null
                           ,p_GIVENNAME                     in INCIDENTS.GIVENNAME%type default null
                           ,p_GENDER                        in INCIDENTS.GENDER%type default null
                           ,p_DOB                           in INCIDENTS.DOB%type default null
                           ,p_BRDDOCID                      in INCIDENTS.BRDDOCID%type default null
                           ,p_MVMNTID                       in INCIDENTS.MVMNTID%type default null
                           ,p_BL_STATUS                     in INCIDENTS.BL_STATUS%type default null
                           ,p_BL_NUMBER_OF_HITS             in INCIDENTS.BL_NUMBER_OF_HITS%type default null
                           ,p_BL_ACTION                     in INCIDENTS.BL_ACTION%type default null
                           ,p_BL_REMARKS                    in INCIDENTS.BL_REMARKS%type default null
                           ,p_BL_APPROVED_CASE              in INCIDENTS.BL_APPROVED_CASE%type default null
                           ,p_BL_APPROVED_IDENTITY          in INCIDENTS.BL_APPROVED_IDENTITY%type default null
                           ,p_BL_APPROVED_IDENTITY_SCORE    in INCIDENTS.BL_APPROVED_IDENTITY_SCORE%type default null
                           ,p_BL_APPROVED_FACE_SAVED        in INCIDENTS.BL_APPROVED_FACE_SAVED%type default null
                           ,p_BL_APPROVED_FINGER_SAVED      in INCIDENTS.BL_APPROVED_FINGER_SAVED%type default null
                           ,p_BL_LOG_KEY_VALUE              in INCIDENTS.BL_LOG_KEY_VALUE%type default null
                           ,p_OFFICER                       in INCIDENTS.OFFICER%type default null
                           ,p_SUPERVISOR                    in INCIDENTS.SUPERVISOR%type default null
                           ,p_CLIENT_IP                     in INCIDENTS.CLIENT_IP%type default null
                           ,p_ALLOW_PASS                    in INCIDENTS.ALLOW_PASS%type default null
                           ,p_ID                            out INCIDENTS.ID%type
                            --
                            ) is
    --
    pragma autonomous_transaction;
    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'Create_Incident';
    v_LOG_Params logger.tab_param;
    --
    v_CLIENT_IP varchar2(256);
    --
  begin
    --
    logger.append_param(v_LOG_Params, 'p_DOCNO', p_DOCNO);
    logger.append_param(v_LOG_Params, 'p_ISSUINGCOUNTRY', p_ISSUINGCOUNTRY);
    logger.append_param(v_LOG_Params, 'p_TYPE', p_TYPE);
    logger.log('START', v_LOG_Scope, null, v_LOG_Params);
    --
    
    --
    IF p_CLIENT_IP IS NULL THEN
        BEGIN
            v_CLIENT_IP := owa_util.get_cgi_env('REMOTE_ADDR');
        EXCEPTION
            WHEN OTHERS THEN
                v_CLIENT_IP := sys_context('userenv', 'ip_address');
        end;
    ELSE
        v_CLIENT_IP := p_CLIENT_IP;
    END IF;
    --
    
    --
    INSERT INTO dl_bordercontrol.incidents
    (
        docno 
        , client_ip 
        , officer 
        , dob 
        , lastname 
        , gender 
        , issuingcountry 
        , givenname 
        , type 
        , ins_terminal 
        , ins_borderpost 
        , brddocid 
        , mvmntid 
        , bl_status 
        , bl_number_of_hits 
        , bl_action 
        , bl_remarks 
        , bl_approved_case
        , bl_approved_identity 
        , bl_approved_identity_score 
        , bl_approved_face_saved
        , bl_approved_finger_saved
        , bl_log_key_value
        , supervisor
        , allow_pass
    )
    VALUES
    (
        p_DOCNO                                 --docno, 
        , v_CLIENT_IP                           --client_ip, 
        , NVL(p_OFFICER, v('APP_USER'))         --officer, 
        , p_DOB                                 --dob, 
        , p_LASTNAME                            --lastname, 
        , p_GENDER                              --gender, 
        , p_ISSUINGCOUNTRY                      --issuingcountry, 
        , p_GIVENNAME                           --givenname, 
        , p_TYPE                                --type,
        , p_INS_TERMINAL                        --ins_terminal, 
        , p_INS_BORDERPOST                      --ins_borderpost, 
        , p_BRDDOCID                            --brddocid, 
        , p_MVMNTID                             --mvmntid, 
        , p_BL_STATUS                           --bl_status, 
        , p_BL_NUMBER_OF_HITS                   --bl_number_of_hits, 
        , p_BL_ACTION                           --bl_action, 
        , p_BL_REMARKS                          --bl_remarks, 
        , p_BL_APPROVED_CASE                    --bl_approved_case,
        , p_BL_APPROVED_IDENTITY                --bl_approved_identity, 
        , p_BL_APPROVED_IDENTITY_SCORE          --bl_approved_identity_score, 
        , NVL(p_BL_APPROVED_FACE_SAVED, 'N')    --bl_approved_face_saved, 
        , NVL(p_BL_APPROVED_FINGER_SAVED, 'N')  --bl_approved_finger_saved, 
        , p_BL_LOG_KEY_VALUE                    --bl_log_key_value
        , p_SUPERVISOR                          --supervisor
        , p_ALLOW_PASS                          --allow_pass
    )
    RETURNING id INTO p_ID;
    --
    commit;
    --
    logger.append_param(v_LOG_Params, 'p_ID', p_ID);
    logger.log('DONE', v_LOG_Scope, null, v_LOG_Params);
    --
  end Create_Incident;
  --
  --
  --
  procedure Update_Incident(p_ID                             in INCIDENTS.ID%type
                            ,p_TYPE                          in INCIDENTS.TYPE%type
                            ,p_INS_TERMINAL                  in INCIDENTS.INS_TERMINAL%type
                            ,p_INS_BORDERPOST                in INCIDENTS.INS_BORDERPOST%type
                            ,p_DOCNO                         in INCIDENTS.DOCNO%type
                            --
                            ,p_ISSUINGCOUNTRY                in INCIDENTS.ISSUINGCOUNTRY%type default null
                            ,p_LASTNAME                      in INCIDENTS.LASTNAME%type default null
                            ,p_GIVENNAME                     in INCIDENTS.GIVENNAME%type default null
                            ,p_GENDER                        in INCIDENTS.GENDER%type default null
                            ,p_DOB                           in INCIDENTS.DOB%type default null
                            ,p_BRDDOCID                      in INCIDENTS.BRDDOCID%type default null
                            ,p_MVMNTID                       in INCIDENTS.MVMNTID%type default null
                            ,p_BL_STATUS                     in INCIDENTS.BL_STATUS%type default null
                            ,p_BL_NUMBER_OF_HITS             in INCIDENTS.BL_NUMBER_OF_HITS%type default null
                            ,p_BL_ACTION                     in INCIDENTS.BL_ACTION%type default null
                            ,p_BL_REMARKS                    in INCIDENTS.BL_REMARKS%type default null
                            ,p_BL_APPROVED_CASE              in INCIDENTS.BL_APPROVED_CASE%type default null
                            ,p_BL_APPROVED_IDENTITY          in INCIDENTS.BL_APPROVED_IDENTITY%type default null
                            ,p_BL_APPROVED_IDENTITY_SCORE    in INCIDENTS.BL_APPROVED_IDENTITY_SCORE%type default null
                            ,p_BL_APPROVED_FACE_SAVED        in INCIDENTS.BL_APPROVED_FACE_SAVED%type default null
                            ,p_BL_APPROVED_FINGER_SAVED      in INCIDENTS.BL_APPROVED_FINGER_SAVED%type default null
                            ,p_BL_LOG_KEY_VALUE              in INCIDENTS.BL_LOG_KEY_VALUE%type default null
                            ,p_OFFICER                       in INCIDENTS.OFFICER%type default null
                            ,p_SUPERVISOR                    in INCIDENTS.SUPERVISOR%type default null
                            ,p_CLIENT_IP                     in INCIDENTS.CLIENT_IP%type default null
                            ,p_ALLOW_PASS                    in INCIDENTS.ALLOW_PASS%type default null
                             --
                            ) is
    --
    pragma autonomous_transaction;
    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'Update_Incident';
    v_LOG_Params logger.tab_param;
    --
    v_CLIENT_IP varchar2(256);
    --
  begin
    --
    logger.append_param(v_LOG_Params, 'p_DOCNO', p_DOCNO);
    logger.append_param(v_LOG_Params, 'p_ISSUINGCOUNTRY', p_ISSUINGCOUNTRY);
    logger.append_param(v_LOG_Params, 'p_ID', p_ID);
    logger.append_param(v_LOG_Params, 'p_TYPE', p_TYPE);
    logger.log('START', v_LOG_Scope, null, v_LOG_Params);
    --
    
    --
    IF p_CLIENT_IP IS NULL THEN
        BEGIN
            v_CLIENT_IP := owa_util.get_cgi_env('REMOTE_ADDR');
        EXCEPTION
            WHEN OTHERS THEN
                v_CLIENT_IP := sys_context('userenv', 'ip_address');
        end;
    ELSE
        v_CLIENT_IP := p_CLIENT_IP;
    END IF;
    --
    
    --
    UPDATE dl_bordercontrol.incidents SET
        docno                           = p_DOCNO
        , client_ip                     = v_CLIENT_IP
        , officer                       = NVL(p_OFFICER, v('APP_USER'))
        , dob                           = p_DOB
        , lastname                      = p_LASTNAME
        , gender                        = p_GENDER
        , issuingcountry                = p_ISSUINGCOUNTRY
        , givenname                     = p_GIVENNAME
        , type                          = p_TYPE
        , ins_terminal                  = p_INS_TERMINAL
        , ins_borderpost                = p_INS_BORDERPOST
        , brddocid                      = p_BRDDOCID
        , mvmntid                       = p_MVMNTID
        , bl_status                     = p_BL_STATUS
        , bl_number_of_hits             = p_BL_NUMBER_OF_HITS
        , bl_action                     = p_BL_ACTION
        , bl_remarks                    = p_BL_REMARKS
        , bl_approved_case              = p_BL_APPROVED_CASE
        , bl_approved_identity          = p_BL_APPROVED_IDENTITY
        , bl_approved_identity_score    = p_BL_APPROVED_IDENTITY_SCORE
        , bl_approved_face_saved        = NVL(p_BL_APPROVED_FACE_SAVED, 'N')
        , bl_approved_finger_saved      = NVL(p_BL_APPROVED_FINGER_SAVED, 'N')
        , bl_log_key_value              = p_BL_LOG_KEY_VALUE
        , supervisor                    = p_SUPERVISOR
        , allow_pass                    = p_ALLOW_PASS
    WHERE id = p_ID;
    --
    commit;
    --
    logger.log('DONE', v_LOG_Scope, null, v_LOG_Params);
    --
  end Update_Incident;
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
  * WWirns    14.11.2017  LOGGER added
  *******************************************************************************/
  --
  procedure Init_PACKAGE is
    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'Init_PACKAGE';
    v_LOG_Params logger.tab_param;
    --
  begin
    --
    logger.log('START'
              ,v_LOG_Scope
              ,null
              ,v_LOG_Params);
    --
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
    logger.log('END'
              ,v_LOG_Scope);
    --
  exception
    when others then
      logger.log_error('Unhandled Exception'
                      ,v_LOG_Scope
                      ,null
                      ,v_LOG_Params);
      raise;
      --
  end Init_PACKAGE;
  --
  --
  --
  procedure Check_OBJECT_DEPENDENCE is
    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'Check_OBJECT_DEPENDENCE';
    v_LOG_Params logger.tab_param;
    --
  begin
    --
    logger.log('START'
              ,v_LOG_Scope
              ,null
              ,v_LOG_Params);
    --
    -- WWirns: For example check ORACLE-Version
    -- or internal version via "Get_OBJECT_VERSION$VC()" of other package or object types
    -- or if column of table exists
    -- and so on...
    null;
    --
    logger.log('END'
              ,v_LOG_Scope);
    --
  exception
    when others then
      logger.log_error('Unhandled Exception'
                      ,v_LOG_Scope
                      ,null
                      ,v_LOG_Params);
      raise;
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
--
--
begin
  --
  logger.log('START'
            ,g_LOG_SCOPE_PREFIX || 'begin');
  --
  Init_PACKAGE();
  --
  logger.log('END'
            ,g_LOG_SCOPE_PREFIX || 'begin');
  --
end PKG_INCIDENTS;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_INCIDENTS" TO "DERMALOG_PROXY";
