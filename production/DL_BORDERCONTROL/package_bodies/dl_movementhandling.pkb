CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."DL_MOVEMENTHANDLING" as
  --
  -- Part1: Major-Version
  -- Part2: Minor-Version
  -- Part3:
  -- Part4: Patch-Version
  --
  -- !!! INCREMENT THIS VERSIONS STRING ON EACH CHANGE INSIDE THE PACKAGE !!!
  --
  C_PACKAGE_ID       constant simple_integer := -1; --PKG_CONSTS.C_PID$DEMO$REPORT4CENT;
  C_OBJECT_VERSION   constant varchar2(19) := '1.0.0018';
  C_OBJECT_COPYRIGHT constant varchar2(255 char) := 'Copyright: DERMALOG Identification Systems GmbH, Hamburg - Germany, 2013-' || to_char(sysdate
                                                                                                                                          ,'yyyy');
  --
  -- If NOT initialized then call Init_PACKAGE() in every proc/func where Init_PACKAGE must be run before normal processing of it can be go!!!
  -- For example: "if (not g_PACKAGE_Initialized) then Init_PACKAGE(); end if;"
  g_PACKAGE_Initialized  boolean := false;
  g_PACKAGE_Initializing boolean := false;
  --
  --ATTR_SEQ_EXPIRY_DATE#  constant simple_integer := 21;
  --ATTR_SEQ_ISSUING_DATE# constant simple_integer := 22;
  --ATTR_SEQ_NATIONALITY#  constant simple_integer := 23;
  --ATTR_SEQ_PLACEOFBIRTH# constant simple_integer := 24;
  /*
  ATTR_SEQ_TEMPLATE_RT# constant simple_integer := 70;
  ATTR_SEQ_TEMPLATE_RI# constant simple_integer := 71;
  ATTR_SEQ_TEMPLATE_RM# constant simple_integer := 72;
  ATTR_SEQ_TEMPLATE_RR# constant simple_integer := 73;
  ATTR_SEQ_TEMPLATE_RL# constant simple_integer := 74;
  ATTR_SEQ_TEMPLATE_LT# constant simple_integer := 75;
  ATTR_SEQ_TEMPLATE_LI# constant simple_integer := 76;
  ATTR_SEQ_TEMPLATE_LM# constant simple_integer := 77;
  ATTR_SEQ_TEMPLATE_LR# constant simple_integer := 78;
  ATTR_SEQ_TEMPLATE_LL# constant simple_integer := 79;
  */
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
  * WWirns    14.11.2017  XX:Added
  *******************************************************************************/
  --
  /*
  function Get_ATTR_SEQ_EXPIRY_DATE# return simple_integer deterministic is
  begin
    return ATTR_SEQ_EXPIRY_DATE#;
  end;
  --
  function Get_ATTR_SEQ_ISSUING_DATE# return simple_integer deterministic is
  begin
    return ATTR_SEQ_ISSUING_DATE#;
  end;
  --
  function Get_ATTR_SEQ_NATIONALITY# return simple_integer deterministic is
  begin
    return ATTR_SEQ_NATIONALITY#;
  end;
  --
  function Get_ATTR_SEQ_PLACEOFBIRTH# return simple_integer deterministic is
  begin
    return ATTR_SEQ_PLACEOFBIRTH#;
  end;
  */
  --
  /*
  function Get_ATTR_SEQ_TEMPLATE_LI# return simple_integer deterministic is
  begin
    return ATTR_SEQ_TEMPLATE_LI#;
  end;
  --
  function Get_ATTR_SEQ_TEMPLATE_LL# return simple_integer deterministic is
  begin
    return ATTR_SEQ_TEMPLATE_LL#;
  end;
  --
  function Get_ATTR_SEQ_TEMPLATE_LM# return simple_integer deterministic is
  begin
    return ATTR_SEQ_TEMPLATE_LM#;
  end;
  --
  function Get_ATTR_SEQ_TEMPLATE_LR# return simple_integer deterministic is
  begin
    return ATTR_SEQ_TEMPLATE_LR#;
  end;
  --
  function Get_ATTR_SEQ_TEMPLATE_LT# return simple_integer deterministic is
  begin
    return ATTR_SEQ_TEMPLATE_LT#;
  end;
  --
  function Get_ATTR_SEQ_TEMPLATE_RI# return simple_integer deterministic is
  begin
    return ATTR_SEQ_TEMPLATE_RI#;
  end;
  --
  function Get_ATTR_SEQ_TEMPLATE_RL# return simple_integer deterministic is
  begin
    return ATTR_SEQ_TEMPLATE_RL#;
  end;
  --
  function Get_ATTR_SEQ_TEMPLATE_RM# return simple_integer deterministic is
  begin
    return ATTR_SEQ_TEMPLATE_RM#;
  end;
  --
  function Get_ATTR_SEQ_TEMPLATE_RR# return simple_integer deterministic is
  begin
    return ATTR_SEQ_TEMPLATE_RR#;
  end;
  --
  function Get_ATTR_SEQ_TEMPLATE_RT# return simple_integer deterministic is
  begin
    return ATTR_SEQ_TEMPLATE_RT#;
  end;
  */
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
  * WWirns    14.11.2017  XX:
  * WWirns    14.11.2017  LOGGER added
  *******************************************************************************/
  --
  function ADD_MODIFY_VARCHAR(p_MVMNTID        in MOVEMENT_ATTR.MVMNTID%type
                             ,p_SEQNO          in MOVEMENT_ATTR.SEQNO%type
                             ,p_DATA           in MOVEMENT_ATTR.ATTRVARCHAR%type
                             ,p_INS_TERMINAL   in MOVEMENT_ATTR.INS_TERMINAL%type
                             ,p_INS_BORDERPOST in MOVEMENT_ATTR.INS_BORDERPOST%type
                              --
                              ) return number as
    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'add_modify_varchar';
    v_LOG_Params logger.tab_param;
    --
  begin
    --
    logger.append_param(v_LOG_Params
                       ,'p_MVMNTID'
                       ,p_MVMNTID);
    logger.append_param(v_LOG_Params
                       ,'p_SEQNO'
                       ,p_SEQNO);
    logger.log('START'
              ,v_LOG_Scope
              ,null
              ,v_LOG_Params);
    --
    --
    /*
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    */
    --
    merge into MOVEMENT_ATTR dest
    using (
           --
           select p_MVMNTID        as MVMNTID
                  ,p_SEQNO          as SEQNO
                  ,p_DATA           as ATTRVARCHAR
                  ,p_INS_TERMINAL   as INS_TERMINAL
                  ,p_INS_BORDERPOST as INS_BORDERPOST
             from dual
           --
           ) src
    on (src.MVMNTID = dest.MVMNTID and src.SEQNO = dest.SEQNO)
    when matched then
      update
         set dest.ATTRVARCHAR = src.ATTRVARCHAR
    when not matched then
      insert
        (MVMNTID
        ,SEQNO
        ,ATTRVARCHAR
        ,INS_TERMINAL
        ,INS_BORDERPOST
         --
         )
      values
        (src.MVMNTID
        ,src.SEQNO
        ,src.ATTRVARCHAR
        ,src.INS_TERMINAL
        ,src.INS_BORDERPOST
         --
         );
    --
    logger.log('RETURN'
              ,v_LOG_Scope);
    --
    return 0;
    --
  exception
    when others then
      logger.log_error('Unhandled Exception'
                      ,v_LOG_Scope
                      ,null
                      ,v_LOG_Params);
      raise;
      --
  end ADD_MODIFY_VARCHAR;
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
  * WWirns    14.11.2017  XX:
  * WWirns    14.11.2017  LOGGER added
  *******************************************************************************/
  --
  function ADD_MODIFY_BLOB(p_MVMNTID        in MOVEMENT_ATTR.MVMNTID%type
                          ,p_SEQNO          in MOVEMENT_ATTR.SEQNO%type
                          ,p_DATA           in MOVEMENT_ATTR.ATTRBLOB%type
                          ,p_INS_TERMINAL   in MOVEMENT_ATTR.INS_TERMINAL%type
                          ,p_INS_BORDERPOST in MOVEMENT_ATTR.INS_BORDERPOST%type
                           --
                           ) return number as
    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'add_modify_blob';
    v_LOG_Params logger.tab_param;
    --
  begin
    --
    logger.append_param(v_LOG_Params
                       ,'p_MVMNTID'
                       ,p_MVMNTID);
    logger.append_param(v_LOG_Params
                       ,'p_SEQNO'
                       ,p_SEQNO);
    logger.log('START'
              ,v_LOG_Scope
              ,null
              ,v_LOG_Params);
    --
    --
    /*
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    */
    --
    merge into MOVEMENT_ATTR dest
    using (
           --
           select p_MVMNTID        as MVMNTID
                  ,p_SEQNO          as SEQNO
                  ,p_DATA           as ATTRBLOB
                  ,p_INS_TERMINAL   as INS_TERMINAL
                  ,p_INS_BORDERPOST as INS_BORDERPOST
             from dual
           --
           ) src
    on (src.MVMNTID = dest.MVMNTID and src.SEQNO = dest.SEQNO)
    when matched then
      update
         set dest.ATTRBLOB = src.ATTRBLOB
    when not matched then
      insert
        (MVMNTID
        ,SEQNO
        ,ATTRBLOB
        ,INS_TERMINAL
        ,INS_BORDERPOST
         --
         )
      values
        (src.MVMNTID
        ,src.SEQNO
        ,src.ATTRBLOB
        ,src.INS_TERMINAL
        ,src.INS_BORDERPOST
         --
         );
    --
    logger.log('RETURN'
              ,v_LOG_Scope);
    --
    return 0;
    --
  exception
    when others then
      logger.log_error('Unhandled Exception'
                      ,v_LOG_Scope
                      ,null
                      ,v_LOG_Params);
      raise;
      --
  end ADD_MODIFY_BLOB;
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
  * WWirns    14.11.2017  XX:Refactor
  * WWirns    14.11.2017  LOGGER added
  *******************************************************************************/
  --
  function get_VARCHAR(p_MVMNTID        in MOVEMENT_ATTR.MVMNTID%type
                      ,p_SEQNO          in MOVEMENT_ATTR.SEQNO%type
                      ,p_INS_BORDERPOST in MOVEMENT_ATTR.INS_BORDERPOST%type default null
                       --
                       ) return MOVEMENT_ATTR.ATTRVARCHAR%type is
    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'get_VARCHAR';
    v_LOG_Params logger.tab_param;
    --
    v_Result MOVEMENT_ATTR.ATTRVARCHAR%type;
    --
    --
  begin
    --
    logger.append_param(v_LOG_Params
                       ,'p_MVMNTID'
                       ,p_MVMNTID);
    logger.append_param(v_LOG_Params
                       ,'p_SEQNO'
                       ,p_SEQNO);
    logger.log('START'
              ,v_LOG_Scope
              ,null
              ,v_LOG_Params);
    --
    --
    /*
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    */
    --
    select t.ATTRVARCHAR
      into v_Result
      from MOVEMENT_ATTR t
     where t.MVMNTID = p_MVMNTID
       and t.SEQNO = p_SEQNO;
    --
    logger.log('RETURN'
              ,v_LOG_Scope);
    --
    return v_Result;
    --
  exception
    when others then
      logger.log_error('Unhandled Exception'
                      ,v_LOG_Scope
                      ,null
                      ,v_LOG_Params);
      raise;
      --
  end get_VARCHAR;
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
  * WWirns    14.11.2017  XX:Refactor
  * WWirns    14.11.2017  LOGGER added
  *******************************************************************************/
  --
  function get_BLOB(p_MVMNTID        in MOVEMENT_ATTR.MVMNTID%type
                   ,p_SEQNO          in MOVEMENT_ATTR.SEQNO%type
                   ,p_INS_BORDERPOST in MOVEMENT_ATTR.INS_BORDERPOST%type default null
                    --
                    ) return MOVEMENT_ATTR.ATTRBLOB%type is
    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'get_BLOB';
    v_LOG_Params logger.tab_param;
    --
    v_Result MOVEMENT_ATTR.ATTRBLOB%type;
    --
  begin
    --
    logger.append_param(v_LOG_Params
                       ,'p_MVMNTID'
                       ,p_MVMNTID);
    logger.append_param(v_LOG_Params
                       ,'p_SEQNO'
                       ,p_SEQNO);
    logger.log('START'
              ,v_LOG_Scope
              ,null
              ,v_LOG_Params);
    --
    --
    /*
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    */
    --
    select t.ATTRBLOB
      into v_Result
      from MOVEMENT_ATTR t
     where t.MVMNTID = p_MVMNTID
       and t.SEQNO = p_SEQNO;
    --
    logger.log('RETURN'
              ,v_LOG_Scope);
    --
    return v_Result;
    --
  exception
    when others then
      logger.log_error('Unhandled Exception'
                      ,v_LOG_Scope
                      ,null
                      ,v_LOG_Params);
      raise;
      --
  end get_BLOB;
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
  * WWirns    14.11.2017  XX:Refactor
  * WWirns    14.11.2017  LOGGER added
  * WWirns    15.12.2017  Rename PSSNGRSTATUS to PERSON_TYPE and drop RNKDSGNTDID
  * WWirns    30.01.2018  Add VISA_TYPE and change VISA
  * WWirns    30.01.2018  Rename VISAEXPDT to MAX_STAY_DT
  * WWirns    30.01.2018  Save no data as attribute
  * WWirns    30.01.2018  Remove parameter p_MANUAL_EXPIRY_DATE, p_MANUAL_ISSUING_DATE, p_MANUAL_NATIONALITY and p_MANUAL_PLACEOFBIRTH
  *******************************************************************************/
  --
  function Create_Movement(p_EXITFLG        in MOVEMENTS.EXITFLG%type
                          ,p_INS_TERMINAL   in MOVEMENTS.INS_TERMINAL%type
                          ,p_INS_BORDERPOST in MOVEMENTS.INS_BORDERPOST%type
                          ,p_SOURCE_SYSTEM  in MOVEMENTS.SOURCE_SYSTEM%type default 1) return varchar2 is
    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'Create_Movement';
    v_LOG_Params logger.tab_param;
    --
    v_BRDOCID BORDERDOCUMENTS.BRDDOCID%type;
    v_MVMNTID MOVEMENTS.MVMNTID%type;
    --
    --
  begin
    --
    logger.log('START'
              ,v_LOG_Scope
              ,null
              ,v_LOG_Params);
    --
    -- save movement without borderdocument
    insert into MOVEMENTS i
      (MVMNTID
      ,EXITFLG
      ,INS_TERMINAL
      ,INS_BORDERPOST
      ,SOURCE_SYSTEM
       --
       )
    values
      (SYS_GUID()
      ,p_EXITFLG
      ,p_INS_TERMINAL
      ,p_INS_BORDERPOST
      ,p_SOURCE_SYSTEM
       --
       )
    returning i.MVMNTID into v_MVMNTID;
    --
    --
    --save movement_blob
    insert into MOVEMENTS_BLOB i
      (MVMNT_ID
      ,INS_TERMINAL
      ,INS_BORDERPOST
       --
       )
    values
      (v_MVMNTID
      ,p_INS_TERMINAL
      ,p_INS_BORDERPOST
       --
       );
    --
    logger.log('RETURN'
              ,v_LOG_Scope);
    --
    return v_MVMNTID;
    --
  exception
    when others then
      logger.log_error('Unhandled Exception'
                      ,v_LOG_Scope
                      ,null
                      ,v_LOG_Params);
      raise;
      --
  end Create_Movement;
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
  * WWirns    14.11.2017  XX:Moved here from standalone "FUNCTION DL_BORDERCONTROL.GET_LAST_MOVEMENT_BLOB" and partial refactor
  * WWirns    14.11.2017  LOGGER added
  * WWirns    03.12.2018  Argument check added
  *******************************************************************************/
  --
  function GET_LAST_MOVEMENT_BLOB(p_DOCNO          in BORDERDOCUMENTS.DOCNO%type
                                 ,p_EXPIRYDATE     in BORDERDOCUMENTS.EXPIRYDATE%type
                                 ,p_ISSUECTRY      in BORDERDOCUMENTS.ISSUECTRY%type
                                 ,p_TYPE           in varchar2
                                 ,p_INS_BORDERPOST in MOVEMENT_ATTR.INS_BORDERPOST%type default null
                                  --
                                  ) return blob is
    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'GET_LAST_MOVEMENT_BLOB';
    v_LOG_Params logger.tab_param;
    --
    v_Result         blob;
    v_Template_Names varchar2(200) := ',TEMPLATE_RT,TEMPLATE_RI,TEMPLATE_RM,TEMPLATE_RR,TEMPLATE_RL,TEMPLATE_LT,TEMPLATE_LI,TEMPLATE_LM,TEMPLATE_LR,TEMPLATE_LL,';
    v_Template_Idx   number;
    --
  begin
    --
    logger.append_param(v_LOG_Params
                       ,'p_DOCNO'
                       ,p_DOCNO);
    logger.append_param(v_LOG_Params
                       ,'p_EXPIRYDATE'
                       ,p_EXPIRYDATE);
    logger.append_param(v_LOG_Params
                       ,'p_ISSUECTRY'
                       ,p_ISSUECTRY);
    logger.append_param(v_LOG_Params
                       ,'p_TYPE'
                       ,p_TYPE);
    logger.log('START'
              ,v_LOG_Scope
              ,null
              ,v_LOG_Params);
    --
    --
    /*
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    */
    --
    --
    if (p_DOCNO is null
       --
       and p_EXPIRYDATE is null
       --
       and p_ISSUECTRY is null
       --
       --and p_TYPE         is null
       --
       )
    then
      return null;
    end if;
    --
    --
    v_Template_Idx := instr(v_Template_Names
                           ,',' || p_TYPE || ',');
    --
    if (p_TYPE = 'LIVE_PHOTO')
    then
      --
      for R0 in (
                 --
                 select t.LIVE_PHOTO as RESULT_BLOB
                   from V_MOVEMENTS t
                  where exists (select null
                           from BORDERDOCUMENTS e
                          where e.DOCNO = p_DOCNO
                            and e.ISSUECTRY = p_ISSUECTRY
                            and trunc(e.EXPIRYDATE) = trunc(p_EXPIRYDATE)
                            and e.BRDDOCID = t.BRDDOCID
                         --
                         )
                    and is_finished = 'Y'
                  order by t.DML_AT desc
                 --
                 )
      loop
        --
        v_Result := R0.RESULT_BLOB;
        exit when v_Result is not null;
        --
      end loop;
      --
    elsif (v_Template_Idx > 0)
    then
      --
      for R0 in (
                 --
                 select DECODE(p_TYPE
                               ,'TEMPLATE_LL'
                               ,t.TEMPLATE_LL
                               ,'TEMPLATE_LI'
                               ,t.TEMPLATE_LI
                               ,'TEMPLATE_LM'
                               ,t.TEMPLATE_LM
                               ,'TEMPLATE_LR'
                               ,t.TEMPLATE_LR
                               ,'TEMPLATE_LT'
                               ,t.TEMPLATE_LT
                               ,'TEMPLATE_RL'
                               ,t.TEMPLATE_RL
                               ,'TEMPLATE_RI'
                               ,t.TEMPLATE_RI
                               ,'TEMPLATE_RM'
                               ,t.TEMPLATE_RM
                               ,'TEMPLATE_RR'
                               ,t.TEMPLATE_RR
                               ,'TEMPLATE_RT'
                               ,t.TEMPLATE_RT
                               ,null
                                --
                                ) as RESULT_BLOB
                   from V_MOVEMENTS t
                  where exists (select null
                           from BORDERDOCUMENTS e
                          where e.DOCNO = p_DOCNO
                            and e.ISSUECTRY = p_ISSUECTRY
                            and trunc(e.EXPIRYDATE) = trunc(p_EXPIRYDATE)
                            and e.BRDDOCID = t.BRDDOCID
                         --
                         )
                    and is_finished = 'Y'
                  order by t.DML_AT desc
                 --
                 )
      loop
        --
        v_Result := R0.RESULT_BLOB;
        exit when v_Result is not null;
        --
      end loop;
      --
    else
      --
      for R0 in (
                 --
                 select DECODE(p_TYPE
                               ,'WSQ_LL'
                               ,t.WSQ_LL
                               ,'WSQ_LI'
                               ,t.WSQ_LI
                               ,'WSQ_LM'
                               ,t.WSQ_LM
                               ,'WSQ_LR'
                               ,t.WSQ_LR
                               ,'WSQ_LT'
                               ,t.WSQ_LT
                               ,'WSQ_RL'
                               ,t.WSQ_RL
                               ,'WSQ_RI'
                               ,t.WSQ_RI
                               ,'WSQ_RM'
                               ,t.WSQ_RM
                               ,'WSQ_RR'
                               ,t.WSQ_RR
                               ,'WSQ_RT'
                               ,t.WSQ_RT
                               ,null
                                --
                                ) as RESULT_BLOB
                   from V_MOVEMENTS t
                  where exists (select null
                           from BORDERDOCUMENTS e
                          where e.DOCNO = p_DOCNO
                            and e.ISSUECTRY = p_ISSUECTRY
                            and trunc(e.EXPIRYDATE) = trunc(p_EXPIRYDATE)
                            and e.BRDDOCID = t.BRDDOCID
                         --
                         )
                    and is_finished = 'Y'
                  order by t.DML_AT desc
                 --
                 )
      loop
        --
        v_Result := R0.RESULT_BLOB;
        exit when v_Result is not null;
        --
      end loop;
      --
    end if;
    --
    logger.log('RETURN'
              ,v_LOG_Scope);
    --
    return v_Result;
    --
  exception
    when NO_DATA_FOUND then
      return null;
    when others then
      logger.log_error('Unhandled Exception'
                      ,v_LOG_Scope
                      ,null
                      ,v_LOG_Params);
      raise;
      --
  end GET_LAST_MOVEMENT_BLOB;
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
  function Get_Last_Movement(p_DOCNO          in BORDERDOCUMENTS.DOCNO%type
                            ,p_ISSUECTRY      in BORDERDOCUMENTS.ISSUECTRY%type
                            ,p_EXPIRYDATE     in BORDERDOCUMENTS.EXPIRYDATE%type
                            ,p_VALUE          in varchar2
                            ,p_EXITFLG        in MOVEMENTS.EXITFLG%type default null
                            ) return varchar2 is
  --
    v_last_movement     MOVEMENTS.MVMNTID%type;
    v_ins_at            MOVEMENTS.INS_AT%type;
    v_entry_form        MOVEMENTS.ENTRY_FORM%type;
    v_brddocid          BORDERDOCUMENTS.BRDDOCID%type;
  begin
    v_brddocid := PKG_BORDERDOCUMENTS.Get_Document(p_DOCNO
                                                 ,p_ISSUECTRY
                                                 ,p_EXPIRYDATE
                                                 );
    select mvmntid
          ,INS_AT
          ,ENTRY_FORM
      into v_last_movement
          ,v_ins_at
          ,v_entry_form
      from (select mvmntid
                  ,INS_AT
                  ,ENTRY_FORM
              from dl_bordercontrol.movements
             where brddocid = v_brddocid
               and (case
                   when p_EXITFLG is null
                   then 1
                   when (p_EXITFLG = 0 and EXITFLG = p_EXITFLG)
                   then 1
                   when (p_EXITFLG = 1 and EXITFLG = p_EXITFLG)
                   then 1
                   end ) = 1
               and IS_FINISHED = 'Y'
             order by DATE_OF_ENTRY desc NULLS LAST)
     where ROWNUM = 1;
     --
     IF p_VALUE = 'LAST_MOVEMENT'
     THEN
       return v_last_movement;
     ELSIF p_VALUE = 'INS_AT'
     THEN
       return v_ins_at;
     ELSIF p_VALUE = 'ENTRY_FORM'
     THEN
       return v_entry_form;
     END IF;
  end;
  --
  --
  /* get last movement using identity */
  function Get_Last_Bio_Movement(p_DOCNO          in BORDERDOCUMENTS.DOCNO%type
                                ,p_ISSUECTRY      in BORDERDOCUMENTS.ISSUECTRY%type
                                ,p_EXPIRYDATE     in BORDERDOCUMENTS.EXPIRYDATE%type
                                ,p_VALUE          in varchar2
                                ,p_EXITFLG        in MOVEMENTS.EXITFLG%type default null
                                ) return varchar2 is
  --
    v_last_movement     MOVEMENTS.MVMNTID%type;
    v_ins_at            MOVEMENTS.INS_AT%type;
    v_entry_form        MOVEMENTS.ENTRY_FORM%type;
    v_brddocid          BORDERDOCUMENTS.BRDDOCID%type;
  begin
    v_brddocid := PKG_BORDERDOCUMENTS.Get_Document(p_DOCNO
                                                 ,p_ISSUECTRY
                                                 ,p_EXPIRYDATE
                                                 );
    select mvmntid
          ,INS_AT
          ,ENTRY_FORM
      into v_last_movement
          ,v_ins_at
          ,v_entry_form
      from (select mvmntid
                  ,INS_AT
                  ,ENTRY_FORM
              from dl_bordercontrol.movements
             where brddocid in
               (
                    select v_brddocid as BRDDOCID from dual
                    union all
                    select brddocid
                    from dl_bordercontrol.identities
                    where identity in
                    (
                        select identity
                        from dl_bordercontrol.identities
                        where brddocid = v_brddocid
                    )
               )
               and EXITFLG != 2 -- ignoring OFFLOAD
               and (case
                   when p_EXITFLG is null
                   then 1
                   when (p_EXITFLG = 0 and EXITFLG = p_EXITFLG)
                   then 1
                   when (p_EXITFLG = 1 and EXITFLG = p_EXITFLG)
                   then 1
                   end ) = 1
               and IS_FINISHED = 'Y'
             order by DATE_OF_ENTRY desc NULLS LAST)
     where ROWNUM = 1;
     --
     IF p_VALUE = 'LAST_MOVEMENT'
     THEN
       return v_last_movement;
     ELSIF p_VALUE = 'INS_AT'
     THEN
       return v_ins_at;
     ELSIF p_VALUE = 'ENTRY_FORM'
     THEN
       return v_entry_form;
     END IF;
  end Get_Last_Bio_Movement;
  --
  --
  function Get_Last_Movement_Info(p_DOCNO             in BORDERDOCUMENTS.DOCNO%type
                                   ,p_ISSUECTRY       in BORDERDOCUMENTS.ISSUECTRY%type
                                   ,p_EXPIRYDATE      in BORDERDOCUMENTS.EXPIRYDATE%type
                                   ,p_GENDER          in BORDERDOCUMENTS.SEX%type
                                   ,p_DOB             in VARCHAR2
                                   ,p_SURNAME         in BORDERDOCUMENTS.SURNAME%type
                                   ,p_GIVENNAME       in BORDERDOCUMENTS.GIVENNAME%type
                                   ,p_MIDDLENAME      in BORDERDOCUMENTS.MIDDLENAME%type
                                   ,p_EXITFLG         in MOVEMENTS.EXITFLG%type default null
                                   ,p_NATIONALITY     in BORDERDOCUMENTS.NAT%type default null -- used for stateless
                                   ,p_PIBICS_PRD_CONN in NUMBER default 0
                                   ) return last_movement_info_rec_typ is
  --
    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'Get_Last_Movement_Info';
    v_LOG_Params logger.tab_param;
    --
    v_last_bio_movement_info    last_movement_info_rec_typ;
    v_last_pib_movement_info    last_movement_info_rec_typ;
    --
    v_last_movement             MOVEMENTS.MVMNTID%type;
    v_visa                      MOVEMENTS.VISA%type;
    v_entry_form                MOVEMENTS.ENTRY_FORM%type;
    --
    v_nationcd                  DL_COMMON.ICAO_DOC_CODES$LC.NOTICE%type;
    --
    v_source                    VARCHAR2(30);
    --
    v_return                    last_movement_info_rec_typ;
    --
    l_pibics_query              CLOB;
    l_pibics_prod_query         VARCHAR2(32000);
    --

  begin

    logger.log('START', v_LOG_Scope, null, v_LOG_Params);

    -- init
    v_last_bio_movement_info.source := 'BIO';
    v_last_bio_movement_info.source_sec := 'BIO';
    v_last_bio_movement_info.source_sec_pk_val := NULL;

    v_last_pib_movement_info.source := 'PIBICS';
    v_last_pib_movement_info.source_sec := NULL;
    v_last_pib_movement_info.source_sec_pk_val := NULL;


    /* BIO fetch starts */
    logger.log('BIO fetch starts', v_LOG_Scope, null, v_LOG_Params);
    -- last movement with this borderdocument
    --v_last_movement := Get_Last_Movement(p_DOCNO, p_ISSUECTRY, p_EXPIRYDATE, 'LAST_MOVEMENT', p_EXITFLG);
    -- last movement with this borderdocument identity
    --v_last_movement := Get_Last_Bio_Movement(p_DOCNO, p_ISSUECTRY, p_EXPIRYDATE, 'LAST_MOVEMENT', p_EXITFLG);
    SELECT Get_Last_Bio_Movement(p_DOCNO, p_ISSUECTRY, p_EXPIRYDATE, 'LAST_MOVEMENT', p_EXITFLG)
    INTO v_last_movement
    FROM DUAL;

    --DBMS_OUTPUT.PUT_LINE('v_last_movement: ' || v_last_movement);

    IF v_last_movement IS NOT NULL THEN
        --DBMS_OUTPUT.PUT_LINE('In BIO');
        -- get visa data from table movements
        SELECT
            m.mvmntid
            , m.visa
            , CAST(m.date_of_entry AS DATE) --movement_dt
            , m.exitflg
            , m.entry_form
            , b.docno
            , b.expirydate
        INTO
            v_last_bio_movement_info.source_sec_pk_val
            , v_visa
            , v_last_bio_movement_info.travel_date
            , v_last_bio_movement_info.direction
            , v_entry_form
            , v_last_bio_movement_info.docno
            , v_last_bio_movement_info.docno_expiry_date
        FROM movements m, borderdocuments b
        WHERE m.mvmntid = v_last_movement
        AND b.brddocid = m.brddocid;

        IF v_visa IS NOT NULL THEN
            --DBMS_OUTPUT.PUT_LINE('In BIO VISA');
            -- get visa data from table visas
            SELECT
                visa_number
                ,visa_image
                ,expiry_date
                ,visa_type
                ,permit_type
                ,permit_expiry_date
            INTO
                v_last_bio_movement_info.visa_number
                ,v_last_bio_movement_info.visa_image
                ,v_last_bio_movement_info.visa_expiry_date
                ,v_last_bio_movement_info.visa_type
                ,v_last_bio_movement_info.permit_type
                ,v_last_bio_movement_info.permit_expiry_date
            FROM visas
            WHERE key_value = v_visa;
        END IF;

        IF v_entry_form IS NOT NULL THEN
            --DBMS_OUTPUT.PUT_LINE('In BIO ENTRY FORMS');
            -- get entry form data from table entry_forms
            SELECT
                form_no
                , form_image
                , province
                , district
                , subdistrict
                , address
                , note
            INTO
                v_last_bio_movement_info.entry_form_no
                , v_last_bio_movement_info.entry_form_image
                , v_last_bio_movement_info.province
                , v_last_bio_movement_info.district
                , v_last_bio_movement_info.subdistrict
                , v_last_bio_movement_info.address
                , v_last_bio_movement_info.note
            FROM entry_forms
            WHERE key_value = v_entry_form;
        END IF;
    END IF;
    logger.log('BIO fetch ends', v_LOG_Scope, null, v_LOG_Params);
    /* BIO fetch ends */

    /* get params for pibics fetch starts */
    -- NAT might be different than ISSUECTRY in case of stateless
    -- use ISSUECTRY to get the last movement info from BIO
    -- use NAT to get the last movement info from PIBICS
    -- if NAT is null, use ISSUECTRY
    BEGIN
        SELECT NVL(notice, notice$dlc)
        INTO v_nationcd
        FROM dl_common.icao_doc_codes$lc
        WHERE key_value = NVL(p_NATIONALITY, p_ISSUECTRY)
        ;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_nationcd := NULL;
    END;
    /* get params for pibics fetch ends */

    /* PIBICS fetch starts */
    logger.log('PIBICS fetch starts', v_LOG_Scope, null, v_LOG_Params);
    BEGIN
        --*--SELECT
        --*--    source_sec
        --*--    , source_sec_pk_val
        --*--    , traveldate
        --*--    , visa_type
        --*--    , visa_expiry_date
        --*--    , direction
        --*--    , entry_form_no
        --*--    -----------
        --*--    , (
        --*--          SELECT acp.key_value
        --*--          FROM dl_bordercontrol.v_province vp,
        --*--          dl_bordercontrol.adm_class_province acp
        --*--          WHERE vp.pv_seqno = t.province
        --*--          AND acp.display_code = vp.pvcd
        --*--      ) PROVINCE
        --*--    -----------
        --*--    , note
        --*--    , docno
        --*--    , TRUNC(docno_expiry_date)
        --*--INTO
        --*--    v_last_pib_movement_info.source_sec
        --*--    , v_last_pib_movement_info.source_sec_pk_val
        --*--    , v_last_pib_movement_info.travel_date
        --*--    , v_last_pib_movement_info.visa_type
        --*--    , v_last_pib_movement_info.visa_expiry_date
        --*--    , v_last_pib_movement_info.direction
        --*--    , v_last_pib_movement_info.entry_form_no
        --*--    , v_last_pib_movement_info.province
        --*--    , v_last_pib_movement_info.note
        --*--    , v_last_pib_movement_info.docno
        --*--    , v_last_pib_movement_info.docno_expiry_date
        --*--FROM
        --*--(
        --*--    SELECT /*+ NO_PARALLEL */
        --*--        source_sec
        --*--        , source_sec_pk_val
        --*--        , traveldate
        --*--        , visa_type
        --*--        , visa_expiry_date
        --*--        , direction
        --*--        , entry_form_no
        --*--        , province
        --*--        , note
        --*--        , docno
        --*--        , docno_expiry_date
        --*--    FROM
        --*--    (
        --*--        -- 1
        --*--        SELECT /*+ NO_PARALLEL INDEX(v_tminout_ma tminout_ma TMINOUT_MA_COMPOSITE_IDX2) */
        --*--            'TMINOUT_MA' AS SOURCE_SEC
        --*--            , seqno AS SOURCE_SEC_PK_VAL
        --*--            , inoutdte AS TRAVELDATE
        --*--            , visatypecd AS VISA_TYPE
        --*--            , visaexpdte AS VISA_EXPIRY_DATE
        --*--            , DECODE(cardtype, 1, 0, 2, 1, cardtype) DIRECTION
        --*--            , tm6no AS ENTRY_FORM_NO
        --*--            , pv_seqno AS PROVINCE
        --*--            , remark AS NOTE
        --*--            , tdtno AS DOCNO
        --*--            , passportexpdte AS DOCNO_EXPIRY_DATE
        --*--        FROM dl_bordercontrol.v_tminout_ma
        --*--        WHERE nationcd = v_nationcd
        --*--        AND sex = DECODE(p_GENDER, 1, 'M', 2, 'F', sex)
        --*--        --AND birthdte = p_DOB
        --*--        AND (birthdte = p_DOB OR birthdte = SUBSTR(p_DOB, -4, 4) OR birthdte = SUBSTR(p_DOB, -7, 7) OR birthdte = SUBSTR(p_DOB, -8, 8) OR birthdte = '//' || SUBSTR(p_DOB, -4, 4))
        --*--        AND
        --*--        (
        --*--            tdtno = p_DOCNO
        --*--            OR
        --*--            (
        --*--                UPPER(TRIM(REGEXP_REPLACE(efamilynm, '\s{2,}', ' '))) = UPPER(TRIM(p_SURNAME))
        --*--                AND UPPER(TRIM(REGEXP_REPLACE(efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(emiddlenm, '\s{2,}', ' '))), NULL) = UPPER(TRIM(p_GIVENNAME)) || NVL2(TRIM(p_MIDDLENAME), ' ' || UPPER(TRIM(p_MIDDLENAME)), NULL)
        --*--            )
        --*--        )
        --*--        AND
        --*--        (
        --*--            CASE
        --*--                WHEN p_EXITFLG IS NULL THEN 1
        --*--                WHEN (p_EXITFLG = 0 AND cardtype = 1) THEN 1 -- arrival
        --*--                WHEN (p_EXITFLG = 1 AND cardtype = 2) THEN 1 -- departure
        --*--            END
        --*--        ) = 1
        --*--        AND 
        --*--        (
        --*--           typedata IN ('BIO-PHB', 'BIO-RETH')
        --*--           OR
        --*--           NVL(typedata, '~') NOT LIKE 'BIO%'
        --*--        )
        --*--        -- 2
        --*--        UNION ALL
        --*--        SELECT /*+ NO_PARALLEL INDEX(v_tminout tminout TMINOUT_COMPOSITE_IDX2) */
        --*--            'TMINOUT' AS SOURCE_SEC
        --*--            , seqno AS SOURCE_SEC_PK_VAL
        --*--            , inoutdte AS TRAVELDATE
        --*--            , visatypecd AS VISA_TYPE
        --*--            , visaexpdte AS VISA_EXPIRY_DATE
        --*--            , DECODE(cardtype, 1, 0, 2, 1, cardtype) DIRECTION
        --*--            , tm6no AS ENTRY_FORM_NO
        --*--            , pv_seqno AS PROVINCE
        --*--            , remark AS NOTE
        --*--            , tdtno AS DOCNO
        --*--            , passportexpdte AS DOCNO_EXPIRY_DATE
        --*--        FROM dl_bordercontrol.v_tminout
        --*--        WHERE nationcd = v_nationcd
        --*--        AND sex = DECODE(p_GENDER, 1, 'M', 2, 'F', sex)
        --*--        --AND birthdte = p_DOB
        --*--        AND (birthdte = p_DOB OR birthdte = SUBSTR(p_DOB, -4, 4) OR birthdte = SUBSTR(p_DOB, -7, 7) OR birthdte = SUBSTR(p_DOB, -8, 8) OR birthdte = '//' || SUBSTR(p_DOB, -4, 4))
        --*--        AND
        --*--        (
        --*--            tdtno = p_DOCNO
        --*--            OR
        --*--            (
        --*--                UPPER(TRIM(REGEXP_REPLACE(efamilynm, '\s{2,}', ' '))) = UPPER(TRIM(p_SURNAME))
        --*--                AND UPPER(TRIM(REGEXP_REPLACE(efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(emiddlenm, '\s{2,}', ' '))), NULL) = UPPER(TRIM(p_GIVENNAME)) || NVL2(TRIM(p_MIDDLENAME), ' ' || UPPER(TRIM(p_MIDDLENAME)), NULL)
        --*--            )
        --*--        )
        --*--        AND
        --*--        (
        --*--            CASE
        --*--                WHEN p_EXITFLG IS NULL THEN 1
        --*--                WHEN (p_EXITFLG = 0 AND cardtype = 1) THEN 1 -- arrival
        --*--                WHEN (p_EXITFLG = 1 AND cardtype = 2) THEN 1 -- departure
        --*--            END
        --*--        ) = 1
        --*--        AND 
        --*--        (
        --*--           typedata IN ('BIO-PHB', 'BIO-RETH')
        --*--           OR
        --*--           NVL(typedata, '~') NOT LIKE 'BIO%'
        --*--        )
        --*--        -- 3
        --*--        UNION ALL
        --*--        SELECT /*+ NO_PARALLEL INDEX(v_tmmain tmmain TMMAIN_COMPOSITE_IDX1) */
        --*--            'TMMAIN_IN' AS SOURCE_SEC
        --*--            , tmrunno AS SOURCE_SEC_PK_VAL
        --*--            , indte AS TRAVELDATE
        --*--            , invisatypecd AS VISA_TYPE
        --*--            , invisaexpdte AS VISA_EXPIRY_DATE
        --*--            , 0 DIRECTION
        --*--            , intm6no AS ENTRY_FORM_NO
        --*--            , pv_seqno AS PROVINCE
        --*--            , inremark AS NOTE
        --*--            , intdtno AS DOCNO
        --*--            , inpassportexpdte AS DOCNO_EXPIRY_DATE
        --*--        FROM dl_bordercontrol.v_tmmain
        --*--        WHERE indte IS NOT NULL
        --*--        AND nationcd = v_nationcd
        --*--        AND sex = DECODE(p_GENDER, 1, 'M', 2, 'F', sex)
        --*--        --AND birthdte = p_DOB
        --*--        AND (birthdte = p_DOB OR birthdte = SUBSTR(p_DOB, -4, 4) OR birthdte = SUBSTR(p_DOB, -7, 7) OR birthdte = SUBSTR(p_DOB, -8, 8) OR birthdte = '//' || SUBSTR(p_DOB, -4, 4))
        --*--        AND
        --*--        (
        --*--            intdtno = p_DOCNO
        --*--            OR
        --*--            (
        --*--                UPPER(TRIM(REGEXP_REPLACE(efamilynm, '\s{2,}', ' '))) = UPPER(TRIM(p_SURNAME))
        --*--                AND UPPER(TRIM(REGEXP_REPLACE(efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(emiddlenm, '\s{2,}', ' '))), NULL) = UPPER(TRIM(p_GIVENNAME)) || NVL2(TRIM(p_MIDDLENAME), ' ' || UPPER(TRIM(p_MIDDLENAME)), NULL)
        --*--            )
        --*--        )
        --*--        AND
        --*--        (
        --*--            CASE
        --*--                WHEN p_EXITFLG IS NULL THEN 1
        --*--                WHEN p_EXITFLG = 0 THEN 1 -- arrival
        --*--            END
        --*--        ) = 1
        --*--        AND 
        --*--        (
        --*--           typedata IN ('BIO-PHB', 'BIO-RETH')
        --*--           OR
        --*--           NVL(typedata, '~') NOT LIKE 'BIO%'
        --*--        )
        --*--        -- 4
        --*--        UNION ALL
        --*--        SELECT /*+ NO_PARALLEL INDEX(v_tmmain tmmain TMMAIN_COMPOSITE_IDX1) */
        --*--            'TMMAIN_OUT' AS SOURCE_SEC
        --*--            , tmrunno AS SOURCE_SEC_PK_VAL
        --*--            , outdte AS TRAVELDATE
        --*--            , outvisatypecd AS VISA_TYPE
        --*--            , outvisaexpdte AS VISA_EXPIRY_DATE
        --*--            , 1 DIRECTION
        --*--            , outtm6no AS ENTRY_FORM_NO
        --*--            , pv_seqno AS PROVINCE
        --*--            , outremark AS NOTE
        --*--            , outtdtno AS DOCNO
        --*--            , outpassportexpdte AS DOCNO_EXPIRY_DATE
        --*--        FROM dl_bordercontrol.v_tmmain
        --*--        WHERE outdte IS NOT NULL
        --*--        AND nationcd = v_nationcd
        --*--        AND sex = DECODE(p_GENDER, 1, 'M', 2, 'F', sex)
        --*--        --AND birthdte = p_DOB
        --*--        AND (birthdte = p_DOB OR birthdte = SUBSTR(p_DOB, -4, 4) OR birthdte = SUBSTR(p_DOB, -7, 7) OR birthdte = SUBSTR(p_DOB, -8, 8) OR birthdte = '//' || SUBSTR(p_DOB, -4, 4))
        --*--        AND
        --*--        (
        --*--            outtdtno = p_DOCNO
        --*--            OR
        --*--            (
        --*--                UPPER(TRIM(REGEXP_REPLACE(efamilynm, '\s{2,}', ' '))) = UPPER(TRIM(p_SURNAME))
        --*--                AND UPPER(TRIM(REGEXP_REPLACE(efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(emiddlenm, '\s{2,}', ' '))), NULL) = UPPER(TRIM(p_GIVENNAME)) || NVL2(TRIM(p_MIDDLENAME), ' ' || UPPER(TRIM(p_MIDDLENAME)), NULL)
        --*--            )
        --*--        )
        --*--        AND
        --*--        (
        --*--            CASE
        --*--                WHEN p_EXITFLG IS NULL THEN 1
        --*--                WHEN p_EXITFLG = 1 THEN 1 -- departure
        --*--            END
        --*--        ) = 1
        --*--        AND 
        --*--        (
        --*--           typedata IN ('BIO-PHB', 'BIO-RETH')
        --*--           OR
        --*--           NVL(typedata, '~') NOT LIKE 'BIO%'
        --*--        )
        --*--    )
        --*--    ORDER BY traveldate DESC NULLS LAST
        --*--) t
        --*--WHERE ROWNUM = 1;


        -- PIBICS PRD DATA
        IF p_PIBICS_PRD_CONN = 1 THEN
        l_pibics_prod_query :=
        q'[
        UNION ALL
        -- PIBICS PRD tminout_ma start --
        SELECT /*+ NO_PARALLEL */
            'TMINOUT_MA_PRD' AS SOURCE_SEC
            , seqno AS SOURCE_SEC_PK_VAL
            , inoutdte AS TRAVELDATE
            , visatypecd AS VISA_TYPE
            , visaexpdte AS VISA_EXPIRY_DATE
            , DECODE(cardtype, 1, 0, 2, 1, cardtype) DIRECTION
            , tm6no AS ENTRY_FORM_NO
            , pv_seqno AS PROVINCE
            , remark AS NOTE
            , tdtno AS DOCNO
            , passportexpdte AS DOCNO_EXPIRY_DATE
        FROM dl_bordercontrol.v_tminout_ma_1hr_prod
        WHERE nationcd = ']' || v_nationcd || q'['
        AND sex = DECODE(']' || p_GENDER || q'[', 1, 'M', 2, 'F', sex)
        --AND birthdte = ']' || p_DOB || q'['
        AND (birthdte = ']' || p_DOB || q'[' OR birthdte = SUBSTR(']' || p_DOB || q'[', -4, 4) OR birthdte = SUBSTR(']' || p_DOB || q'[', -7, 7) OR birthdte = SUBSTR(']' || p_DOB || q'[', -8, 8) OR birthdte = '//' || SUBSTR(']' || p_DOB || q'[', -4, 4))
        AND
        (
            tdtno = ']' || p_DOCNO || q'['
            OR
            (
                UPPER(TRIM(REGEXP_REPLACE(efamilynm, '\s{2,}', ' '))) = UPPER(TRIM(']' || p_SURNAME|| q'['))
                AND UPPER(TRIM(REGEXP_REPLACE(efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(emiddlenm, '\s{2,}', ' '))), NULL) = UPPER(TRIM(']' || p_GIVENNAME || q'[')) || NVL2(TRIM(']' || p_MIDDLENAME || q'['), ' ' || UPPER(TRIM(']' || p_MIDDLENAME || q'[')), NULL)
            )
        )
        AND
        (
            CASE
                WHEN ']' || p_EXITFLG || q'[' IS NULL THEN 1
                WHEN (']' || p_EXITFLG || q'[' = 0 AND cardtype = 1) THEN 1 -- arrival
                WHEN (']' || p_EXITFLG || q'[' = 1 AND cardtype = 2) THEN 1 -- departure
            END
        ) = 1
        AND 
        (
            typedata IN ('BIO-PHB', 'BIO-RETH')
            OR
            NVL(typedata, '~') NOT LIKE 'BIO%'
        )
        -- PIBICS PRD tminout_ma end --
        UNION ALL
        -- PIBICS PRD tminout start --
        SELECT /*+ NO_PARALLEL */
            'TMINOUT_PRD' AS SOURCE_SEC
            , seqno AS SOURCE_SEC_PK_VAL
            , inoutdte AS TRAVELDATE
            , visatypecd AS VISA_TYPE
            , visaexpdte AS VISA_EXPIRY_DATE
            , DECODE(cardtype, 1, 0, 2, 1, cardtype) DIRECTION
            , tm6no AS ENTRY_FORM_NO
            , pv_seqno AS PROVINCE
            , remark AS NOTE
            , tdtno AS DOCNO
            , passportexpdte AS DOCNO_EXPIRY_DATE
        FROM dl_bordercontrol.v_tminout_1hr_prod
        WHERE nationcd = ']' || v_nationcd || q'['
        AND sex = DECODE(']' || p_GENDER || q'[', 1, 'M', 2, 'F', sex)
        --AND birthdte = ']' || p_DOB || q'['
        AND (birthdte = ']' || p_DOB || q'[' OR birthdte = SUBSTR(']' || p_DOB || q'[', -4, 4) OR birthdte = SUBSTR(']' || p_DOB || q'[', -7, 7) OR birthdte = SUBSTR(']' || p_DOB || q'[', -8, 8) OR birthdte = '//' || SUBSTR(']' || p_DOB || q'[', -4, 4))
        AND
        (
            tdtno = ']' || p_DOCNO || q'['
            OR
            (
                UPPER(TRIM(REGEXP_REPLACE(efamilynm, '\s{2,}', ' '))) = UPPER(TRIM(']' || p_SURNAME || q'['))
                AND UPPER(TRIM(REGEXP_REPLACE(efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(emiddlenm, '\s{2,}', ' '))), NULL) = UPPER(TRIM(']' || p_GIVENNAME || q'[')) || NVL2(TRIM(']' || p_MIDDLENAME || q'['), ' ' || UPPER(TRIM(']' || p_MIDDLENAME || q'[')), NULL)
            )
        )
        AND
        (
            CASE
                WHEN ']' || p_EXITFLG || q'[' IS NULL THEN 1
                WHEN (']' || p_EXITFLG || q'[' = 0 AND cardtype = 1) THEN 1 -- arrival
                WHEN (']' || p_EXITFLG || q'[' = 1 AND cardtype = 2) THEN 1 -- departure
            END
        ) = 1
        AND 
        (
            typedata IN ('BIO-PHB', 'BIO-RETH')
            OR
            NVL(typedata, '~') NOT LIKE 'BIO%'
        )
        -- PIBICS PRD tminout end --
        UNION ALL
        -- PIBICS PRD tmmain IN start --
        SELECT /*+ NO_PARALLEL */
            'TMMAIN_IN_PRD' AS SOURCE_SEC
            , tmrunno AS SOURCE_SEC_PK_VAL
            , indte AS TRAVELDATE
            , invisatypecd AS VISA_TYPE
            , invisaexpdte AS VISA_EXPIRY_DATE
            , 0 DIRECTION
            , intm6no AS ENTRY_FORM_NO
            , pv_seqno AS PROVINCE
            , inremark AS NOTE
            , intdtno AS DOCNO
            , inpassportexpdte AS DOCNO_EXPIRY_DATE
        FROM dl_bordercontrol.v_tmmain_in_1hr_prod
        WHERE indte IS NOT NULL
        AND nationcd = ']' || v_nationcd || q'['
        AND sex = DECODE(']' || p_GENDER || q'[', 1, 'M', 2, 'F', sex)
        --AND birthdte = ']' || p_DOB || q'['
        AND (birthdte = ']' || p_DOB || q'[' OR birthdte = SUBSTR(']' || p_DOB || q'[', -4, 4) OR birthdte = SUBSTR(']' || p_DOB || q'[', -7, 7) OR birthdte = SUBSTR(']' || p_DOB || q'[', -8, 8) OR birthdte = '//' || SUBSTR(']' || p_DOB || q'[', -4, 4))
        AND
        (
            intdtno = ']' || p_DOCNO || q'['
            OR
            (
                UPPER(TRIM(REGEXP_REPLACE(efamilynm, '\s{2,}', ' '))) = UPPER(TRIM(']' || p_SURNAME || q'['))
                AND UPPER(TRIM(REGEXP_REPLACE(efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(emiddlenm, '\s{2,}', ' '))), NULL) = UPPER(TRIM(']' || p_GIVENNAME || q'[')) || NVL2(TRIM(']' || p_MIDDLENAME || q'['), ' ' || UPPER(TRIM(']' || p_MIDDLENAME || q'[')), NULL)
            )
        )
        AND
        (
            CASE
                WHEN ']' || p_EXITFLG || q'[' IS NULL THEN 1
                WHEN ']' || p_EXITFLG || q'[' = 0 THEN 1 -- arrival
            END
        ) = 1
        AND 
        (
            typedata IN ('BIO-PHB', 'BIO-RETH')
            OR
            NVL(typedata, '~') NOT LIKE 'BIO%'
        )
        -- PIBICS PRD tmmain IN end --
        UNION ALL
        -- PIBICS PRD tmmain OUT start --
        SELECT /*+ NO_PARALLEL */
            'TMMAIN_OUT_PRD' AS SOURCE_SEC
            , tmrunno AS SOURCE_SEC_PK_VAL
            , outdte AS TRAVELDATE
            , outvisatypecd AS VISA_TYPE
            , outvisaexpdte AS VISA_EXPIRY_DATE
            , 1 DIRECTION
            , outtm6no AS ENTRY_FORM_NO
            , pv_seqno AS PROVINCE
            , outremark AS NOTE
            , outtdtno AS DOCNO
            , outpassportexpdte AS DOCNO_EXPIRY_DATE
        FROM dl_bordercontrol.v_tmmain_out_1hr_prod
        WHERE outdte IS NOT NULL
        AND nationcd = ']' || v_nationcd || q'['
        AND sex = DECODE(']' || p_GENDER || q'[', 1, 'M', 2, 'F', sex)
        --AND birthdte = ']' || p_DOB || q'['
        AND (birthdte = ']' || p_DOB || q'[' OR birthdte = SUBSTR(']' || p_DOB || q'[', -4, 4) OR birthdte = SUBSTR(']' || p_DOB || q'[', -7, 7) OR birthdte = SUBSTR(']' || p_DOB || q'[', -8, 8) OR birthdte = '//' || SUBSTR(']' || p_DOB || q'[', -4, 4))
        AND
        (
            outtdtno = ']' || p_DOCNO || q'['
            OR
            (
                UPPER(TRIM(REGEXP_REPLACE(efamilynm, '\s{2,}', ' '))) = UPPER(TRIM(']' || p_SURNAME || q'['))
                AND UPPER(TRIM(REGEXP_REPLACE(efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(emiddlenm, '\s{2,}', ' '))), NULL) = UPPER(TRIM(']' || p_GIVENNAME || q'[')) || NVL2(TRIM(']' || p_MIDDLENAME || q'['), ' ' || UPPER(TRIM(']' || p_MIDDLENAME || q'[')), NULL)
            )
        )
        AND
        (
            CASE
                WHEN ']' || p_EXITFLG || q'[' IS NULL THEN 1
                WHEN ']' || p_EXITFLG || q'[' = 1 THEN 1 -- departure
            END
        ) = 1
        AND 
        (
            typedata IN ('BIO-PHB', 'BIO-RETH')
            OR
            NVL(typedata, '~') NOT LIKE 'BIO%'
        )
        -- PIBICS PRD tmmain OUT end --
        ]';
        END IF;

        -- MAIN
        l_pibics_query :=
q'[
SELECT
    source_sec
    , source_sec_pk_val
    , traveldate
    , visa_type
    , visa_expiry_date
    , direction
    , entry_form_no
    -----------
    , (
          SELECT acp.key_value
          FROM dl_bordercontrol.v_province vp,
          dl_bordercontrol.adm_class_province acp
          WHERE vp.pv_seqno = t.province
          AND acp.display_code = vp.pvcd
      ) PROVINCE
    -----------
    , note
    , docno
    , TRUNC(docno_expiry_date)
FROM
(
    SELECT /*+ NO_PARALLEL */
        source_sec
        , source_sec_pk_val
        , traveldate
        , visa_type
        , visa_expiry_date
        , direction
        , entry_form_no
        , province
        , note
        , docno
        , docno_expiry_date
    FROM
    (
        -- PIBICS tminout_ma start --
        SELECT /*+ NO_PARALLEL INDEX(v_tminout_ma tminout_ma TMINOUT_MA_COMPOSITE_IDX2) */
            'TMINOUT_MA' AS SOURCE_SEC
            , seqno AS SOURCE_SEC_PK_VAL
            , inoutdte AS TRAVELDATE
            , visatypecd AS VISA_TYPE
            , visaexpdte AS VISA_EXPIRY_DATE
            , DECODE(cardtype, 1, 0, 2, 1, cardtype) DIRECTION
            , tm6no AS ENTRY_FORM_NO
            , pv_seqno AS PROVINCE
            , remark AS NOTE
            , tdtno AS DOCNO
            , passportexpdte AS DOCNO_EXPIRY_DATE
        FROM dl_bordercontrol.v_tminout_ma
        WHERE nationcd = ']' || v_nationcd || q'['
        AND sex = DECODE(']' || p_GENDER || q'[', 1, 'M', 2, 'F', sex)
        --AND birthdte = ']' || p_DOB || q'['
        AND (birthdte = ']' || p_DOB || q'[' OR birthdte = SUBSTR(']' || p_DOB || q'[', -4, 4) OR birthdte = SUBSTR(']' || p_DOB || q'[', -7, 7) OR birthdte = SUBSTR(']' || p_DOB || q'[', -8, 8) OR birthdte = '//' || SUBSTR(']' || p_DOB || q'[', -4, 4))
        AND
        (
            tdtno = ']' || p_DOCNO || q'['
            OR
            (
                UPPER(TRIM(REGEXP_REPLACE(efamilynm, '\s{2,}', ' '))) = UPPER(TRIM(']' || p_SURNAME|| q'['))
                AND UPPER(TRIM(REGEXP_REPLACE(efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(emiddlenm, '\s{2,}', ' '))), NULL) = UPPER(TRIM(']' || p_GIVENNAME || q'[')) || NVL2(TRIM(']' || p_MIDDLENAME || q'['), ' ' || UPPER(TRIM(']' || p_MIDDLENAME || q'[')), NULL)
            )
        )
        AND
        (
            CASE
                WHEN ']' || p_EXITFLG || q'[' IS NULL THEN 1
                WHEN (']' || p_EXITFLG || q'[' = 0 AND cardtype = 1) THEN 1 -- arrival
                WHEN (']' || p_EXITFLG || q'[' = 1 AND cardtype = 2) THEN 1 -- departure
            END
        ) = 1
        AND 
        (
            typedata IN ('BIO-PHB', 'BIO-RETH')
            OR
            NVL(typedata, '~') NOT LIKE 'BIO%'
        )
        -- PIBICS tminout_ma end --
        UNION ALL
        -- PIBICS tminout start --
        SELECT /*+ NO_PARALLEL INDEX(v_tminout tminout TMINOUT_COMPOSITE_IDX2) */
            'TMINOUT' AS SOURCE_SEC
            , seqno AS SOURCE_SEC_PK_VAL
            , inoutdte AS TRAVELDATE
            , visatypecd AS VISA_TYPE
            , visaexpdte AS VISA_EXPIRY_DATE
            , DECODE(cardtype, 1, 0, 2, 1, cardtype) DIRECTION
            , tm6no AS ENTRY_FORM_NO
            , pv_seqno AS PROVINCE
            , remark AS NOTE
            , tdtno AS DOCNO
            , passportexpdte AS DOCNO_EXPIRY_DATE
        FROM dl_bordercontrol.v_tminout
        WHERE nationcd = ']' || v_nationcd || q'['
        AND sex = DECODE(']' || p_GENDER || q'[', 1, 'M', 2, 'F', sex)
        --AND birthdte = ']' || p_DOB || q'['
        AND (birthdte = ']' || p_DOB || q'[' OR birthdte = SUBSTR(']' || p_DOB || q'[', -4, 4) OR birthdte = SUBSTR(']' || p_DOB || q'[', -7, 7) OR birthdte = SUBSTR(']' || p_DOB || q'[', -8, 8) OR birthdte = '//' || SUBSTR(']' || p_DOB || q'[', -4, 4))
        AND
        (
            tdtno = ']' || p_DOCNO || q'['
            OR
            (
                UPPER(TRIM(REGEXP_REPLACE(efamilynm, '\s{2,}', ' '))) = UPPER(TRIM(']' || p_SURNAME || q'['))
                AND UPPER(TRIM(REGEXP_REPLACE(efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(emiddlenm, '\s{2,}', ' '))), NULL) = UPPER(TRIM(']' || p_GIVENNAME || q'[')) || NVL2(TRIM(']' || p_MIDDLENAME || q'['), ' ' || UPPER(TRIM(']' || p_MIDDLENAME || q'[')), NULL)
            )
        )
        AND
        (
            CASE
                WHEN ']' || p_EXITFLG || q'[' IS NULL THEN 1
                WHEN (']' || p_EXITFLG || q'[' = 0 AND cardtype = 1) THEN 1 -- arrival
                WHEN (']' || p_EXITFLG || q'[' = 1 AND cardtype = 2) THEN 1 -- departure
            END
        ) = 1
        AND 
        (
            typedata IN ('BIO-PHB', 'BIO-RETH')
            OR
            NVL(typedata, '~') NOT LIKE 'BIO%'
        )
        -- PIBICS tminout end --
        UNION ALL
        -- PIBICS tmmain IN start --
        SELECT /*+ NO_PARALLEL INDEX(v_tmmain tmmain TMMAIN_COMPOSITE_IDX1) */
            'TMMAIN_IN' AS SOURCE_SEC
            , tmrunno AS SOURCE_SEC_PK_VAL
            , indte AS TRAVELDATE
            , invisatypecd AS VISA_TYPE
            , invisaexpdte AS VISA_EXPIRY_DATE
            , 0 DIRECTION
            , intm6no AS ENTRY_FORM_NO
            , pv_seqno AS PROVINCE
            , inremark AS NOTE
            , intdtno AS DOCNO
            , inpassportexpdte AS DOCNO_EXPIRY_DATE
        FROM dl_bordercontrol.v_tmmain
        WHERE indte IS NOT NULL
        AND nationcd = ']' || v_nationcd || q'['
        AND sex = DECODE(']' || p_GENDER || q'[', 1, 'M', 2, 'F', sex)
        --AND birthdte = ']' || p_DOB || q'['
        AND (birthdte = ']' || p_DOB || q'[' OR birthdte = SUBSTR(']' || p_DOB || q'[', -4, 4) OR birthdte = SUBSTR(']' || p_DOB || q'[', -7, 7) OR birthdte = SUBSTR(']' || p_DOB || q'[', -8, 8) OR birthdte = '//' || SUBSTR(']' || p_DOB || q'[', -4, 4))
        AND
        (
            intdtno = ']' || p_DOCNO || q'['
            OR
            (
                UPPER(TRIM(REGEXP_REPLACE(efamilynm, '\s{2,}', ' '))) = UPPER(TRIM(']' || p_SURNAME || q'['))
                AND UPPER(TRIM(REGEXP_REPLACE(efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(emiddlenm, '\s{2,}', ' '))), NULL) = UPPER(TRIM(']' || p_GIVENNAME || q'[')) || NVL2(TRIM(']' || p_MIDDLENAME || q'['), ' ' || UPPER(TRIM(']' || p_MIDDLENAME || q'[')), NULL)
            )
        )
        AND
        (
            CASE
                WHEN ']' || p_EXITFLG || q'[' IS NULL THEN 1
                WHEN ']' || p_EXITFLG || q'[' = 0 THEN 1 -- arrival
            END
        ) = 1
        AND 
        (
            typedata IN ('BIO-PHB', 'BIO-RETH')
            OR
            NVL(typedata, '~') NOT LIKE 'BIO%'
        )
        -- PIBICS tmmain IN end --
        UNION ALL
        -- PIBICS tmmain OUT start --
        SELECT /*+ NO_PARALLEL INDEX(v_tmmain tmmain TMMAIN_COMPOSITE_IDX1) */
            'TMMAIN_OUT' AS SOURCE_SEC
            , tmrunno AS SOURCE_SEC_PK_VAL
            , outdte AS TRAVELDATE
            , outvisatypecd AS VISA_TYPE
            , outvisaexpdte AS VISA_EXPIRY_DATE
            , 1 DIRECTION
            , outtm6no AS ENTRY_FORM_NO
            , pv_seqno AS PROVINCE
            , outremark AS NOTE
            , outtdtno AS DOCNO
            , outpassportexpdte AS DOCNO_EXPIRY_DATE
        FROM dl_bordercontrol.v_tmmain
        WHERE outdte IS NOT NULL
        AND nationcd = ']' || v_nationcd || q'['
        AND sex = DECODE(']' || p_GENDER || q'[', 1, 'M', 2, 'F', sex)
        --AND birthdte = ']' || p_DOB || q'['
        AND (birthdte = ']' || p_DOB || q'[' OR birthdte = SUBSTR(']' || p_DOB || q'[', -4, 4) OR birthdte = SUBSTR(']' || p_DOB || q'[', -7, 7) OR birthdte = SUBSTR(']' || p_DOB || q'[', -8, 8) OR birthdte = '//' || SUBSTR(']' || p_DOB || q'[', -4, 4))
        AND
        (
            outtdtno = ']' || p_DOCNO || q'['
            OR
            (
                UPPER(TRIM(REGEXP_REPLACE(efamilynm, '\s{2,}', ' '))) = UPPER(TRIM(']' || p_SURNAME || q'['))
                AND UPPER(TRIM(REGEXP_REPLACE(efirstnm, '\s{2,}', ' '))) || NVL2(TRIM(emiddlenm), ' ' || UPPER(TRIM(REGEXP_REPLACE(emiddlenm, '\s{2,}', ' '))), NULL) = UPPER(TRIM(']' || p_GIVENNAME || q'[')) || NVL2(TRIM(']' || p_MIDDLENAME || q'['), ' ' || UPPER(TRIM(']' || p_MIDDLENAME || q'[')), NULL)
            )
        )
        AND
        (
            CASE
                WHEN ']' || p_EXITFLG || q'[' IS NULL THEN 1
                WHEN ']' || p_EXITFLG || q'[' = 1 THEN 1 -- departure
            END
        ) = 1
        AND 
        (
            typedata IN ('BIO-PHB', 'BIO-RETH')
            OR
            NVL(typedata, '~') NOT LIKE 'BIO%'
        )
        -- PIBICS tmmain OUT end --
        ]'
        || l_pibics_prod_query
        || q'[
    )
    ORDER BY traveldate DESC NULLS LAST
) t
WHERE ROWNUM = 1
]';



        EXECUTE IMMEDIATE l_pibics_query
        INTO
            v_last_pib_movement_info.source_sec
            , v_last_pib_movement_info.source_sec_pk_val
            , v_last_pib_movement_info.travel_date
            , v_last_pib_movement_info.visa_type
            , v_last_pib_movement_info.visa_expiry_date
            , v_last_pib_movement_info.direction
            , v_last_pib_movement_info.entry_form_no
            , v_last_pib_movement_info.province
            , v_last_pib_movement_info.note
            , v_last_pib_movement_info.docno
            , v_last_pib_movement_info.docno_expiry_date
        ;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_last_pib_movement_info.source_sec := NULL;
            v_last_pib_movement_info.source_sec_pk_val := NULL;
            v_last_pib_movement_info.travel_date := NULL;
            v_last_pib_movement_info.visa_type := NULL;
            v_last_pib_movement_info.visa_expiry_date := NULL;
            v_last_pib_movement_info.direction := NULL;
            v_last_pib_movement_info.entry_form_no := NULL;
            v_last_pib_movement_info.province := NULL;
            v_last_pib_movement_info.note := NULL;
    END;
    logger.log('PIBICS fetch ends', v_LOG_Scope, null, v_LOG_Params);
    /* PIBICS fetch ends */

    IF v_last_bio_movement_info.travel_date IS NULL AND v_last_pib_movement_info.travel_date IS NULL THEN
        v_source := NULL;
    ELSIF v_last_bio_movement_info.travel_date IS NULL AND v_last_pib_movement_info.travel_date IS NOT NULL THEN
        v_source := 'PIBICS';
    ELSIF v_last_bio_movement_info.travel_date IS NOT NULL AND v_last_pib_movement_info.travel_date IS NULL THEN
        v_source := 'BIO';
    ELSIF v_last_bio_movement_info.travel_date > v_last_pib_movement_info.travel_date THEN
        v_source := 'BIO';
    ELSE
        v_source := 'PIBICS';
    END IF;

    v_return := CASE v_source
                    WHEN 'BIO' THEN v_last_bio_movement_info
                    WHEN 'PIBICS' THEN v_last_pib_movement_info
                    ELSE NULL
                END;

    logger.log('DONE', v_LOG_Scope, null, v_LOG_Params);

    RETURN v_return;

  end Get_Last_Movement_Info;
  --
  --
  procedure Load_Visa_Data_On_Departure(p_DOCNO          in BORDERDOCUMENTS.DOCNO%type
                                       ,p_TRANSPORT_MODE in DL_COMMON.TRANS_MODES.NUM_VALUE%type
                                       ,p_NATIONALITY    in BORDERDOCUMENTS.NAT%type
                                       ,p_EXPIRY_DATE     in BORDERDOCUMENTS.EXPIRYDATE%type) is
    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'Load_Visa_Data_On_Departure';
    v_LOG_Params logger.tab_param;
    --
    v_last_movement         MOVEMENTS.MVMNTID%type;
    v_max_stay_dt           MOVEMENTS.MAX_STAY_DT%type;
    v_visa_type             MOVEMENTS.VISA_TYPE%type;
    v_visa                  MOVEMENTS.VISA%type;
    v_ins_at                MOVEMENTS.INS_AT%type;
    v_visa_number           VISAS.VISA_NUMBER%type;
    v_issuing_date          VISAS.ISSUING_DATE%type;
    v_issuing_place         VISAS.ISSUING_PLACE%type;
    v_additional_info       VISAS.ADDITIONAL_INFO%type;
    v_permit_type           VISAS.PERMIT_TYPE%type;
    v_permit_expiry_date    VISAS.PERMIT_EXPIRY_DATE%type;
    v_visa_type_display     varchar2(255);
    v_visa_image            VISAS.VISA_IMAGE%type;
    v_overstay              varchar2(30);
    l_visas_rec             visas%ROWTYPE;
    l_movement_rec          movements%ROWTYPE;
    --
    l_commit                BOOLEAN := FALSE;

  begin
    -- last arrival with this borderdocument
    v_last_movement := Get_Last_Movement(p_DOCNO, p_NATIONALITY, p_EXPIRY_DATE, 'LAST_MOVEMENT', 0);
    v_ins_at := Get_Last_Movement(p_DOCNO, p_NATIONALITY, p_EXPIRY_DATE, 'INS_AT', 0);
    --
    -- get visa data from table movements
    select max_stay_dt
          ,visa_type
          ,visa
          ,movement_dt
      into v_max_stay_dt
          ,v_visa_type
          ,v_visa
          ,l_movement_rec.movement_dt
      from movements
     where mvmntid = v_last_movement;
    --
    -- get visa data from table visas
    select visa_number
          ,issuing_date
          ,issuing_place
          ,additional_info
          ,visa_image
          ,permit_type
          ,permit_expiry_date
          ,expiry_date
          ,visa_type
      into v_visa_number
          ,v_issuing_date
          ,v_issuing_place
          ,v_additional_info
          ,v_visa_image
          ,v_permit_type
          ,v_permit_expiry_date
          ,l_visas_rec.expiry_date
          ,l_visas_rec.visa_type
      from visas
     where key_value = v_visa;
    --
    /*select NVL(display_value
              ,DISPLAY_VALUE$DLC) || NVL2(t.permit_days
                                         ,' - ' || t.PERMIT_DAYS
                                         ,'') d
      into v_visa_type_display
      from DL_COMMON.VISA_TYPES#ICAO_DC_ITMS$LC t
     where (t.TRANS_MODE is null or t.TRANS_MODE = (select key_value
                                                      from DL_COMMON.TRANS_MODES
                                                     where NUM_VALUE = p_TRANSPORT_MODE))
       and (t.ICAO_DOC_CODE is null or t.ICAO_DOC_CODE = p_NATIONALITY)
       and num_value = v_visa_type;*/

       logger.append_param(v_LOG_Params, 'l_visas_rec.expiry_date', l_visas_rec.expiry_date);
       logger.append_param(v_LOG_Params, 'v_max_stay_dt', v_max_stay_dt);
    --
    --get length of stay
    /* commented by MSCS. using pkg_bmbs_apex_util.p17_get_overstay_info. */
    --if sysdate > NVL(v_max_stay_dt, l_visas_rec.expiry_date)
    --then
    --
    --  logger.append_param(v_LOG_Params, 'l_visas_rec.expiry_date', TO_CHAR(trunc(sysdate) - TRUNC(NVL(v_max_stay_dt, l_visas_rec.expiry_date))));
    --
    --  v_overstay := TO_CHAR(trunc(sysdate) - TRUNC(NVL(v_max_stay_dt, l_visas_rec.expiry_date)));
    --  /*apex_util.set_session_state('P17_VISUM_6' -- Length of stay (long field)
    --                             ,v_overstay);*/
    --
    --  -- set overstay APEX fields
    --  apex_util.set_session_state('P17_OVERSTAY_INFO_TRAVEL_DATE', l_movement_rec.movement_dt, l_commit);
    --  apex_util.set_session_state('P17_OVERSTAY_INFO_EXPIRY_DATE', NVL(v_max_stay_dt, l_visas_rec.expiry_date), l_commit);
    --  apex_util.set_session_state('P17_OVERSTAY_INFO_TODAY', SYSDATE, l_commit);
    --  apex_util.set_session_state('P17_OVERSTAY_INFO_DAYS', v_overstay, l_commit);
    --end if;
    /* commented by MSCS */

    --
    -- set APEX Items
    apex_util.set_session_state('P17_VISUM_1' -- Visa Number
                                 ,v_visa_number, l_commit);
    apex_util.set_session_state('P17_VISA_TYPE_ID' -- Visa Type (Code field)
                                ,SUBSTR(l_visas_rec.visa_type, -2, 2), l_commit);
    apex_util.set_session_state('P17_VISUM' -- Visa Type (Select List)
                                ,l_visas_rec.visa_type, l_commit);
                                --,v_visa_type_display);
    apex_util.set_session_state('P17_VISUM_4' -- Length of stay (short field)
                                ,null, l_commit);
    apex_util.set_session_state('P17_VISUM_5' -- Date of Expiry
                                ,NVL(v_max_stay_dt, l_visas_rec.expiry_date), l_commit);
    apex_util.set_session_state('P17_PERMIT_TYPE' -- Permit type (Select List)
                                ,v_permit_type, l_commit);
    apex_util.set_session_state('P17_PERMIT_EXPIRY' -- Permit Expiry Date
                                ,v_permit_expiry_date, l_commit);

    --
     -- update collection
    APEX_COLLECTION.UPDATE_MEMBER (
    p_collection_name => 'VISA_IMAGE',
    p_seq  => 1,
    p_blob001 => v_visa_image);
    --
  exception
    when others then
      logger.log_error('Unhandled Exception'
                      ,v_LOG_Scope
                      ,null
                      ,v_LOG_Params);

      -- set APEX Items
      apex_util.set_session_state('P17_VISUM_1' -- Visa Number
                                 ,null, l_commit);
      apex_util.set_session_state('P17_VISA_TYPE_ID' -- Visa Type (Code field)
                                 ,null, l_commit);
      apex_util.set_session_state('P17_VISUM' -- Visa Type (Select List)
                                 ,null, l_commit);
      apex_util.set_session_state('P17_VISUM_4' -- Length of stay (short field)
                                 ,null, l_commit);
      /*apex_util.set_session_state('P17_VISUM_6' -- Length of stay (long field)
                                 ,null, l_commit);*/
      apex_util.set_session_state('P17_VISUM_5' -- Date of Expiry
                                 ,null, l_commit);
      apex_util.set_session_state('P17_PERMIT_TYPE' -- Permit type (Select List)
                                 ,null, l_commit);
      apex_util.set_session_state('P17_PERMIT_EXPIRY' -- Permit Expiry Date
                                 ,null, l_commit);
  end;
  --
  procedure Load_Data_On_Departure(p_DOCNO          in BORDERDOCUMENTS.DOCNO%type
                                  ,p_ISSUECTRY      in BORDERDOCUMENTS.ISSUECTRY%type
                                  ,p_EXPIRYDATE     in BORDERDOCUMENTS.EXPIRYDATE%type
                                  ,p_GENDER         in BORDERDOCUMENTS.SEX%type
                                  ,p_DOB            in VARCHAR2
                                  ,p_SURNAME        in BORDERDOCUMENTS.SURNAME%type
                                  ,p_GIVENNAME      in BORDERDOCUMENTS.GIVENNAME%type
                                  ,p_MIDDLENAME     in BORDERDOCUMENTS.MIDDLENAME%type
                                  ,p_NATIONALITY    in BORDERDOCUMENTS.NAT%type default null)
  is
    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'Load_Data_On_Departure';
    v_LOG_Params logger.tab_param;
    --
    v_last_movement_info    last_movement_info_rec_typ;
    --
    l_commit                BOOLEAN := FALSE;
    --
  begin

    v_last_movement_info := Get_Last_Movement_Info
                            (
                                p_DOCNO          => p_DOCNO
                                ,p_ISSUECTRY     => p_ISSUECTRY
                                ,p_EXPIRYDATE    => p_EXPIRYDATE
                                ,p_GENDER        => p_GENDER
                                ,p_DOB           => p_DOB
                                ,p_SURNAME       => p_SURNAME
                                ,p_GIVENNAME     => p_GIVENNAME
                                ,p_MIDDLENAME    => p_MIDDLENAME
                                ,p_EXITFLG       => NULL --0 -- get last movement irrespective of arrival/departure
                                ,p_NATIONALITY   => p_NATIONALITY -- used for stateless
                            );

    logger.append_param(v_LOG_Params, 'last_movement_source', v_last_movement_info.source);
    logger.append_param(v_LOG_Params, 'last_movement_direction', v_last_movement_info.direction);

    -- set last movement fields
    apex_util.set_session_state('P17_LAST_DIRECTION', v_last_movement_info.direction, l_commit);
    apex_util.set_session_state('P17_LAST_MVMNT_SRC', v_last_movement_info.source, l_commit);
    apex_util.set_session_state('P17_LAST_MVMNT_SRC_SEC', v_last_movement_info.source_sec, l_commit);
    apex_util.set_session_state('P17_LAST_MVMNT_SRC_SEC_PK_VAL', v_last_movement_info.source_sec_pk_val, l_commit);
    apex_util.set_session_state('P17_LAST_MVMNT_TRAVEL_DATE', TO_CHAR(v_last_movement_info.travel_date, 'DD/MM/YYYY'), l_commit);
    apex_util.set_session_state('P17_LAST_MVMNT_DOCNO', v_last_movement_info.docno, l_commit);
    apex_util.set_session_state('P17_LAST_MVMNT_DOCNO_EXP_DATE', TO_CHAR(v_last_movement_info.docno_expiry_date, 'DD/MM/YYYY'), l_commit);
    apex_util.set_session_state('P17_LAST_MVMNT_VISA_TYPE', v_last_movement_info.visa_type, l_commit);
    apex_util.set_session_state('P17_LAST_MVMNT_VISA_EXP_DATE', TO_CHAR(v_last_movement_info.visa_expiry_date, 'DD/MM/YYYY'), l_commit);

    -- if last movement was a departure
    IF v_last_movement_info.direction = 1 THEN
        RETURN;
    END IF;


    -- set APEX Items
    IF NVL(p_ISSUECTRY, '~') != 'THA' THEN

        -- set APEX Items for VISA fields
        apex_util.set_session_state('P17_VISUM_1' -- Visa Number
                                    ,v_last_movement_info.visa_number, l_commit);
        apex_util.set_session_state('P17_VISA_TYPE_ID' -- Visa Type (Code field)
                                    ,SUBSTR(v_last_movement_info.visa_type, -2, 2), l_commit);
        apex_util.set_session_state('P17_VISUM' -- Visa Type (Select List)
                                    ,v_last_movement_info.visa_type, l_commit);
                                    --,v_visa_type_display);
        apex_util.set_session_state('P17_VISUM_4' -- Length of stay (short field)
                                    ,null, l_commit);
        apex_util.set_session_state('P17_VISUM_5' -- Date of Expiry
                                    ,v_last_movement_info.visa_expiry_date, l_commit);

        IF v_last_movement_info.source = 'BIO' THEN
            --IF apex_util.get_session_state('P17_PERMIT_TYPE') IS NULL THEN
                apex_util.set_session_state('P17_PERMIT_TYPE' -- Permit type (Select List)
                                            ,v_last_movement_info.permit_type, l_commit);
            --END IF;
            --IF apex_util.get_session_state('P17_PERMIT_EXPIRY') IS NULL THEN
                apex_util.set_session_state('P17_PERMIT_EXPIRY' -- Permit Expiry Date
                                            ,v_last_movement_info.permit_expiry_date, l_commit);
            --END IF;
        END IF;

        -- set APEX Items for ENTRY FORM fields
        apex_util.set_session_state('P17_TRAVELCARD_NO'
                                ,CASE
                                    WHEN v_last_movement_info.visa_type = '0023' AND v_last_movement_info.entry_form_no = '0000000' THEN 'XX00000'
                                    ELSE v_last_movement_info.entry_form_no
                                 END
                                , l_commit);

        apex_util.set_session_state('P17_PROVINCE'
                                ,v_last_movement_info.province, l_commit);

        apex_util.set_session_state('P17_TMP_AMPUR'
                                ,v_last_movement_info.district, l_commit);

        apex_util.set_session_state('P17_TMP_TAMBON'
                                ,v_last_movement_info.subdistrict, l_commit);

        apex_util.set_session_state('P17_LC_ADDRESS'
                                ,v_last_movement_info.address, l_commit);

        -- update VISA_IMAGE/LANDINGCARD_IMAGE collection
        IF v_last_movement_info.source = 'BIO' THEN
            APEX_COLLECTION.UPDATE_MEMBER
            (
                p_collection_name => 'VISA_IMAGE',
                p_seq  => 1,
                p_blob001 => v_last_movement_info.visa_image
            );

            APEX_COLLECTION.UPDATE_MEMBER
            (
                p_collection_name => 'LANDINGCARD_IMAGE',
                p_seq  => 1,
                p_blob001 => v_last_movement_info.entry_form_image
            );
        END IF;
        --
    END IF;
    --

    -- set additional info field (also available for THA)
    -- do not load remarks/notes from last movement as it should be specific to the current one -- 27/02/2019 MSC
    /*apex_util.set_session_state('P17_LC_ADD_INFO'
                               ,v_last_movement_info.note, l_commit);*/
    --

  exception
    when others then
      logger.log_error('Unhandled Exception'
                      ,v_LOG_Scope
                      ,null
                      ,v_LOG_Params);

      -- set APEX Items for VISA fields
      apex_util.set_session_state('P17_VISUM_1' -- Visa Number
                                 ,null, l_commit);
      apex_util.set_session_state('P17_VISA_TYPE_ID' -- Visa Type (Code field)
                                 ,null, l_commit);
      apex_util.set_session_state('P17_VISUM' -- Visa Type (Select List)
                                 ,null, l_commit);
      apex_util.set_session_state('P17_VISUM_4' -- Length of stay (short field)
                                 ,null, l_commit);
      /*apex_util.set_session_state('P17_VISUM_6' -- Length of stay (long field)
                                 ,null, l_commit);*/
      apex_util.set_session_state('P17_VISUM_5' -- Date of Expiry
                                 ,null, l_commit);
      /*apex_util.set_session_state('P17_PERMIT_TYPE' -- Permit type (Select List)
                                 ,null, l_commit);
      apex_util.set_session_state('P17_PERMIT_EXPIRY' -- Permit Expiry Date
                                 ,null, l_commit);*/

      -- set APEX Items for ENTRY FORM fields
      apex_util.set_session_state('P17_TRAVELCARD_NO_DISPLAY'
                                 ,null, l_commit);
      apex_util.set_session_state('P17_TRAVELCARD_NO'
                                 ,null, l_commit);
      apex_util.set_session_state('P17_PROVINCE'
                                 ,null, l_commit);
      apex_util.set_session_state('P17_TMP_AMPUR'
                                 ,null, l_commit);
      apex_util.set_session_state('P17_TMP_TAMBON'
                                 ,null, l_commit);
      apex_util.set_session_state('P17_LC_ADDRESS'
                                 ,null, l_commit);
      /*apex_util.set_session_state('P17_LC_ADD_INFO'
                                 ,null, l_commit);*/
  end Load_Data_On_Departure;
  --
  procedure Load_Entry_Form_On_Departure(p_DOCNO          in BORDERDOCUMENTS.DOCNO%type
                                        ,p_TRANSPORT_MODE in DL_COMMON.TRANS_MODES.NUM_VALUE%type
                                        ,p_NATIONALITY    in BORDERDOCUMENTS.NAT%type
                                        ,p_EXPIRY_DATE     in BORDERDOCUMENTS.EXPIRYDATE%type) is
    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'Load_Entry_Form_On_Departure';
    v_LOG_Params logger.tab_param;
    --
    v_entry_form    MOVEMENTS.ENTRY_FORM%type;
    v_form_no       ENTRY_FORMS.FORM_NO%type;
    v_form_image    ENTRY_FORMS.FORM_IMAGE%type;
    v_province      ENTRY_FORMS.PROVINCE%type;
    v_district      ENTRY_FORMS.DISTRICT%type;
    v_subdistrict   ENTRY_FORMS.SUBDISTRICT%type;
    v_address       ENTRY_FORMS.ADDRESS%type;
    v_note          ENTRY_FORMS.NOTE%type;
    v_last_movement MOVEMENTS.MVMNTID%type;
    --
    l_commit        BOOLEAN := false;
    --
  begin
    -- last arrival with this borderdocument
    v_last_movement := Get_Last_Movement(p_DOCNO, p_NATIONALITY, p_EXPIRY_DATE, 'LAST_MOVEMENT', 0);
    v_entry_form := Get_Last_Movement(p_DOCNO, p_NATIONALITY, p_EXPIRY_DATE, 'ENTRY_FORM', 0);
    --
    -- get entry_form_data
    select FORM_NO, FORM_IMAGE, PROVINCE, DISTRICT, SUBDISTRICT, ADDRESS, NOTE
      into v_form_no, v_form_image, v_province, v_district, v_subdistrict, v_address, v_note
      from entry_forms
     where key_value = v_entry_form;
    --
    /*begin
        SELECT display_value
        INTO v_province
        FROM dl_bordercontrol.lov_adm_class_province
        WHERE return_value = v_province;
    exception
      when others then v_province := null;
    end;*/
    --
    -- set APEX Items
    apex_util.set_session_state('P17_TRAVELCARD_NO'
                               ,v_form_no, l_commit);

    apex_util.set_session_state('P17_PROVINCE'
                               ,v_province, l_commit);

    apex_util.set_session_state('P17_TMP_AMPUR'
                               ,v_district, l_commit);

    apex_util.set_session_state('P17_TMP_TAMBON'
                               ,v_subdistrict, l_commit);

    apex_util.set_session_state('P17_LC_ADDRESS'
                               ,v_address, l_commit);

    apex_util.set_session_state('P17_LC_ADD_INFO'
                               ,v_note, l_commit);
    --
    -- update collection
    APEX_COLLECTION.UPDATE_MEMBER (
    p_collection_name => 'LANDINGCARD_IMAGE',
    p_seq  => 1,
    p_blob001 => v_form_image);
    --
  exception
    when others then
      logger.log_error('Unhandled Exception'
                      ,v_LOG_Scope
                      ,null
                      ,v_LOG_Params);

      -- set APEX Items
      apex_util.set_session_state('P17_TRAVELCARD_NO_DISPLAY'
                                 ,null, l_commit);
  end;
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
  * WWirns    22.02.2018  Move data and drop columns VISA_PAGE and LANDINGCARD_PAGE of table DL_BORDERCONTROL.MOVEMENTS_BLOB
  * MStephan  22.06.2018  Add optional parameter p_VISA_MRZ                      *
  * MSingh    06.02.2019  Create visa record in both arrival and departure       *
  *******************************************************************************/
  --
  procedure Update_Movement(p_MVMNTID               in MOVEMENTS.MVMNTID%type
                           ,p_DOCNO                 in BORDERDOCUMENTS.DOCNO%type
                           ,p_ISSUECTRY             in BORDERDOCUMENTS.ISSUECTRY%type
                           ,p_EXPIRYDATE            in BORDERDOCUMENTS.EXPIRYDATE%type
                           ,p_EXITFLG               in MOVEMENTS.EXITFLG%type
                           ,p_MAX_STAY_DT           in MOVEMENTS.MAX_STAY_DT%type
                           ,p_OBSERVATION           in MOVEMENTS.OBSERVATION%type
                           ,p_FACEMATCH             in MOVEMENTS.FACEMATCH%type
                           ,p_FINGERMATCH           in MOVEMENTS.FINGERMATCH%type
                           ,p_TRNSPRTUNITID         in MOVEMENTS.TRNSPRTUNITID%type
                           ,p_PERSON_TYPE           in MOVEMENTS.PERSON_TYPE%type
                           ,p_VISA_TYPE             in MOVEMENTS.VISA_TYPE%type
                           ,p_VISA                  in MOVEMENTS.VISA%type
                           ,p_INS_TERMINAL          in MOVEMENTS.INS_TERMINAL%type
                           ,p_INS_BORDERPOST        in MOVEMENTS.INS_BORDERPOST%type
                           ,p_DATE_OF_ENTRY         in MOVEMENTS.DATE_OF_ENTRY%type
                           ,p_VISA_NUMBER           in VISAS.VISA_NUMBER%type
                           ,p_EXPIRY_DATE_VISA      in VISAS.EXPIRY_DATE%type
                           ,p_ISSUING_DATE          in VISAS.ISSUING_DATE%type
                           ,p_ISSUING_PLACE         in VISAS.ISSUING_PLACE%type
                           ,p_ADDITIONAL_INFO       in VISAS.ADDITIONAL_INFO%type
                           ,p_PERMIT_TYPE           in VISAS.PERMIT_TYPE%type
                           ,p_PERMIT_EXPIRY_DATE    in VISAS.PERMIT_EXPIRY_DATE%type
                           ,p_ENTRY_FORM_NO         in ENTRY_FORMS.FORM_NO%type default null
                           ,p_PROVINCE              in ENTRY_FORMS.PROVINCE%type default null
                           ,p_DISTRICT              in ENTRY_FORMS.DISTRICT%type default null
                           ,p_SUBDISTRICT           in ENTRY_FORMS.SUBDISTRICT%type default null
                           ,p_ADDRESS               in ENTRY_FORMS.ADDRESS%type default null
                           ,p_NOTE                  in ENTRY_FORMS.NOTE%type default null
                           ,p_FORM_NO_APPROVED      in MOVEMENTS.FORM_NO_APPROVED%type default null
                           ,p_VISA_MRZ              in MOVEMENTS.MRZVISA%type default null
                           ,p_LIVE_PHOTO            in MOVEMENTS_BLOB.LIVE_PHOTO%type default null
                           ,p_WSQ_LL                in MOVEMENTS_BLOB.WSQ_LL%type default null
                           ,p_WSQ_LR                in MOVEMENTS_BLOB.WSQ_LR%type default null
                           ,p_WSQ_LM                in MOVEMENTS_BLOB.WSQ_LM%type default null
                           ,p_WSQ_LI                in MOVEMENTS_BLOB.WSQ_LI%type default null
                           ,p_WSQ_LT                in MOVEMENTS_BLOB.WSQ_LT%type default null
                           ,p_WSQ_RL                in MOVEMENTS_BLOB.WSQ_RL%type default null
                           ,p_WSQ_RR                in MOVEMENTS_BLOB.WSQ_RR%type default null
                           ,p_WSQ_RM                in MOVEMENTS_BLOB.WSQ_RM%type default null
                           ,p_WSQ_RI                in MOVEMENTS_BLOB.WSQ_RI%type default null
                           ,p_WSQ_RT                in MOVEMENTS_BLOB.WSQ_RT%type default null
                           ,p_VISA_IMAGE            in VISAS.VISA_IMAGE%type default null
                           ,p_ENTRY_FORM_IMAGE      in ENTRY_FORMS.FORM_IMAGE%type default null
                           ,p_SCANNED_FLIGHT        in MOVEMENTS.SCANNED_FLIGHT%type default null
                           ,p_PS_1                  in MOVEMENTS.PS_1%type default null
                           ,p_PS_2                  in MOVEMENTS.PS_2%type default null
                           ,p_PS_3                  in MOVEMENTS.PS_3%type default null
                           ,p_PS_4                  in MOVEMENTS.PS_4%type default null
                           ,p_PS_5                  in MOVEMENTS.PS_5%type default null
                           ,p_PS_6                  in MOVEMENTS.PS_6%type default null
                           ,p_PS_7                  in MOVEMENTS.PS_7%type default null
                           ,p_PS_8                  in MOVEMENTS.PS_8%type default null
                           ,p_PS_9                  in MOVEMENTS.PS_9%type default null
                           ,p_PS_10                 in MOVEMENTS.PS_10%type default null
                           ,p_PSBLOB_1              in MOVEMENTS_BLOB.PSBLOB_1%type default null
                           ,p_PSBLOB_2              in MOVEMENTS_BLOB.PSBLOB_2%type default null
                           ,p_PSBLOB_3              in MOVEMENTS_BLOB.PSBLOB_3%type default null
                           ,p_PSBLOB_4              in MOVEMENTS_BLOB.PSBLOB_4%type default null
                           ,p_PSBLOB_5              in MOVEMENTS_BLOB.PSBLOB_5%type default null
                           ,p_PSBLOB_6              in MOVEMENTS_BLOB.PSBLOB_6%type default null
                           ,p_PSBLOB_7              in MOVEMENTS_BLOB.PSBLOB_7%type default null
                           ,p_PSBLOB_8              in MOVEMENTS_BLOB.PSBLOB_8%type default null
                           ,p_PSBLOB_9              in MOVEMENTS_BLOB.PSBLOB_9%type default null
                           ,p_PSBLOB_10             in MOVEMENTS_BLOB.PSBLOB_10%type default null
                           ,p_TEMPLATE_LL           in MOVEMENT_ATTR.ATTRBLOB%type default null
                           ,p_TEMPLATE_LR           in MOVEMENT_ATTR.ATTRBLOB%type default null
                           ,p_TEMPLATE_LM           in MOVEMENT_ATTR.ATTRBLOB%type default null
                           ,p_TEMPLATE_LI           in MOVEMENT_ATTR.ATTRBLOB%type default null
                           ,p_TEMPLATE_LT           in MOVEMENT_ATTR.ATTRBLOB%type default null
                           ,p_TEMPLATE_RL           in MOVEMENT_ATTR.ATTRBLOB%type default null
                           ,p_TEMPLATE_RR           in MOVEMENT_ATTR.ATTRBLOB%type default null
                           ,p_TEMPLATE_RM           in MOVEMENT_ATTR.ATTRBLOB%type default null
                           ,p_TEMPLATE_RI           in MOVEMENT_ATTR.ATTRBLOB%type default null
                           ,p_TEMPLATE_RT           in MOVEMENT_ATTR.ATTRBLOB%type default null
                           ,p_SOURCE_SYSTEM         in MOVEMENTS.SOURCE_SYSTEM%type default 1 -- 1 = BmBS
                            --
                            ) is
    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'Update_Movement';
    v_LOG_Params logger.tab_param;
    --
    v_VISA          MOVEMENTS.VISA%type;
    v_VISA_TYPE     MOVEMENTS.VISA_TYPE%type;
    v_last_movement MOVEMENTS.MVMNTID%type;
    v_ENTRY_FORM    MOVEMENTS.ENTRY_FORM%type;
    v_BRDDOCID      BORDERDOCUMENTS.BRDDOCID%type;
    --
    v_MVMNTID               VEHICLE_DETAILS.MVMNTID%type;
    v_VEHICLE_TYPE          VEHICLE_DETAILS.VEHICLE_TYPE%type;
    v_NAME                  VEHICLE_DETAILS.NAME%type;
    v_OWNER                 VEHICLE_DETAILS.OWNER%type;
    v_FROM1                 VEHICLE_DETAILS.FROM1%type;
    v_TO1                   VEHICLE_DETAILS.TO1%type;
    v_PROVINCE              VEHICLE_DETAILS.PROVINCE%type;
    v_DATE_TIME             VEHICLE_DETAILS.DATE_TIME%type;
    v_FROM2                 VEHICLE_DETAILS.FROM2%type;
    v_TO2                   VEHICLE_DETAILS.TO2%type;
    -- cols added by MSCS --
    v_DIRECTION             VEHICLE_DETAILS.MSCS_CARDTYPE%type;
    v_CONVEYANCE_NO         VEHICLE_DETAILS.MSCS_CONVREGNO%type;
    v_FROM_TO_COUNTRY       VEHICLE_DETAILS.MSCS_IOCOUNTCD%type;
    v_PORT_NAME             VEHICLE_DETAILS.MSCS_IOPORTNM%type;
    v_FROM_TO_OTHER_PORT    VEHICLE_DETAILS.MSCS_IONOTE%type;
    v_FROM_TO_PORT_IN_THAI  VEHICLE_DETAILS.MSCS_IODEPT%type;
    v_IN_OUT_PORT_IN_THAI   VEHICLE_DETAILS.MSCS_IODEPTTH%type;
    ------------------------------------------------------------
    --
    --
  begin
    --

    logger.append_param(v_LOG_Params
                       ,'p_MVMNTID'
                       ,p_MVMNTID);
    logger.log('START'
              ,v_LOG_Scope
              ,null
              ,v_LOG_Params);
    --
    --
    v_VISA      := p_VISA;
    v_VISA_TYPE := p_VISA_TYPE;
    --
    --
    -- now creating visa record in both arrival and departure
    if (v_VISA is null and p_VISA_TYPE is not null)
    then
      for R0 in (
                 --
                 select t.*
                   from DL_COMMON.VISA_TYPES t
                  where t.KEY_VALUE = p_VISA_TYPE
                   -- and t.AUTO_GENERATE_VISA = 'Y'    Muss wieder einkommentiert werden wenn wir Visa Infos aus PIBICS bekommen!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    and t.IS_ACTIVE = 'Y'
                 --
                 )
      loop
        select BRDDOCID
          into v_BRDDOCID
          from DL_BORDERCONTROL.MOVEMENTS
         where MVMNTID = p_MVMNTID;
         --
        insert into DL_BORDERCONTROL.VISAS i
          (VISA_TYPE
          ,INS_TERMINAL
          ,INS_BORDERPOST
          ,VISA_NUMBER
          ,ISSUING_DATE
          ,ISSUING_PLACE
          ,ADDITIONAL_INFO
          ,VISA_IMAGE
          ,BORDERDOCUMENT
          ,PERMIT_TYPE
          ,PERMIT_EXPIRY_DATE
          ,EXPIRY_DATE
           --
           )
        values
          (v_VISA_TYPE
          ,p_INS_TERMINAL
          ,p_INS_BORDERPOST
          ,p_VISA_NUMBER
          ,p_ISSUING_DATE
          ,p_ISSUING_PLACE
          ,p_ADDITIONAL_INFO
          ,p_VISA_IMAGE
          ,v_BRDDOCID
          ,p_PERMIT_TYPE
          ,p_PERMIT_EXPIRY_DATE
          ,p_EXPIRY_DATE_VISA
           --
           )
        returning i.KEY_VALUE into v_VISA;
        exit;
      end loop;
    end if;
    --
    --
    if
    (
        p_ENTRY_FORM_IMAGE is not null
        or
        p_ENTRY_FORM_NO is not null
        or
        p_NOTE is not null -- added by MSCS for THAI
    )
    then
      insert into DL_BORDERCONTROL.ENTRY_FORMS i
        (i.FORM_IMAGE
        ,i.FORM_NO
        ,i.INS_TERMINAL
        ,i.INS_BORDERPOST
        ,i.PROVINCE
        ,i.DISTRICT
        ,i.SUBDISTRICT
        ,i.ADDRESS
        ,i.NOTE
         --
         )
      values
        (p_ENTRY_FORM_IMAGE
        ,p_ENTRY_FORM_NO
        ,p_INS_TERMINAL
        ,p_INS_BORDERPOST
        ,p_PROVINCE
        ,p_DISTRICT
        ,p_SUBDISTRICT
        ,p_ADDRESS
        ,p_NOTE
         --
         )
         returning i.KEY_VALUE into v_ENTRY_FORM;
      --
    end if;
    --
    -- save vehicle details
    IF APEX_COLLECTION.COLLECTION_EXISTS ('COLL_VEHICLE_DETAILS')
    THEN
       Select c001
              ,c002
              ,c003
              ,c004
              ,c005
              ,c006
              ,c007
              ,c008
              ,c009
              ,c010
              -----
              ,c011
              ,c012
              ,c013
              ,c014
              ,c015
              ,c016
              ,c017
              -----
       into v_MVMNTID
            ,v_VEHICLE_TYPE
            ,v_NAME
            ,v_OWNER
            ,v_FROM1
            ,v_TO1
            ,v_PROVINCE
            ,v_DATE_TIME
            ,v_FROM2
            ,v_TO2
            -- cols added by MSCS --
            ,v_DIRECTION
            ,v_CONVEYANCE_NO
            ,v_FROM_TO_COUNTRY
            ,v_PORT_NAME
            ,v_FROM_TO_OTHER_PORT
            ,v_FROM_TO_PORT_IN_THAI
            ,v_IN_OUT_PORT_IN_THAI
            -------------------------
       from apex_collections
       where collection_name = 'COLL_VEHICLE_DETAILS';
       --
       insert into VEHICLE_DETAILS(
        MVMNTID
        ,VEHICLE_TYPE
        ,NAME
        ,OWNER
        ,FROM1
        ,TO1
        ,PROVINCE
        ,DATE_TIME
        ,FROM2
        ,TO2
        -- cols added by MSCS --
        , MSCS_CARDTYPE
        , MSCS_CONVREGNO
        , MSCS_IOCOUNTCD
        , MSCS_IOPORTNM
        , MSCS_IONOTE
        , MSCS_IODEPT
        , MSCS_IODEPTTH
        -------------------------
        ,INS_TERMINAL
        ,INS_BORDERPOST
       )values(
        v_MVMNTID
        ,v_VEHICLE_TYPE
        ,v_NAME
        ,v_OWNER
        ,v_FROM1
        ,v_TO1
        ,v_PROVINCE
        ,v_DATE_TIME
        ,v_FROM2
        ,v_TO2
        -- cols added by MSCS --
        ,v_DIRECTION
        ,v_CONVEYANCE_NO
        ,v_FROM_TO_COUNTRY
        ,v_PORT_NAME
        ,v_FROM_TO_OTHER_PORT
        ,v_FROM_TO_PORT_IN_THAI
        ,v_IN_OUT_PORT_IN_THAI
        -------------------------
        ,p_INS_TERMINAL
        ,p_INS_BORDERPOST);
      --
      APEX_COLLECTION.DELETE_COLLECTION('COLL_VEHICLE_DETAILS');
    END IF;
    --
    -- save movement for this BRDDOCID
    update MOVEMENTS i
       set EXITFLG     = p_EXITFLG
          ,MAX_STAY_DT = p_MAX_STAY_DT
          ,FINGERMATCH = p_FINGERMATCH
          ,FACEMATCH   = p_FACEMATCH
          ,OBSERVATION    = p_OBSERVATION
          ,TRNSPRTUNITID  = p_TRNSPRTUNITID
          ,PERSON_TYPE    = p_PERSON_TYPE
          ,SCANNED_FLIGHT = p_SCANNED_FLIGHT
          ,PS_1           = p_PS_1
          ,PS_2           = p_PS_2
          ,PS_3           = p_PS_3
          ,PS_4           = p_PS_4
          ,PS_5           = p_PS_5
          ,PS_6           = p_PS_6
          ,PS_7           = p_PS_7
          ,PS_8           = p_PS_8
          ,PS_9           = p_PS_9
          ,PS_10          = p_PS_10
          ,VISA_TYPE      = v_VISA_TYPE
          ,VISA           = v_VISA
          ,PRIOR_MOVEMENT = v_last_movement
          ,ENTRY_FORM     = v_ENTRY_FORM
          ,IS_FINISHED    = 'Y'
          ,FORM_NO_APPROVED = nvl(p_FORM_NO_APPROVED, 'N')
          ,DATE_OF_ENTRY  = p_DATE_OF_ENTRY
          ,MRZVISA        = p_VISA_MRZ
          ,SOURCE_SYSTEM  = p_SOURCE_SYSTEM
    --
     where MVMNTID = p_MVMNTID;
    --
    begin
      IF p_PERSON_TYPE = 2 THEN
        dl_bordercontrol.pkg_pibics_hook.set_action_crew(p_MVMNTID);
      ELSE
        dl_bordercontrol.pkg_pibics_hook.set_action_movement(p_MVMNTID);
      END IF;
    exception when others then
      IF p_PERSON_TYPE = 2 THEN
        logger.log_error('dl_bordercontrol.pkg_pibics_hook.set_action_crew caused an unhandled exception', v_LOG_Scope);
      ELSE
        logger.log_error('dl_bordercontrol.pkg_pibics_hook.set_action_movement caused an unhandled exception', v_LOG_Scope);
      END IF;
    end;
    --
    logger.log('RETURN'
              ,v_LOG_Scope);
    --
    --
    commit;
    --
  exception
    when others then
      logger.log_error('Unhandled Exception'
                      ,v_LOG_Scope
                      ,null
                      ,v_LOG_Params);
      raise;
      --
  end Update_Movement;
  --
  procedure Load_Fellow_Passenger(p_MVMNTID          in MOVEMENTS.MVMNTID%type
                                 ,p_EXITFLG          in MOVEMENTS.EXITFLG%type
                                 ,p_DOCNO            in BORDERDOCUMENTS.DOCNO%type
                                 ,p_NATIONALITY      in BORDERDOCUMENTS.NAT%type
                                 ,p_EXPIRY_DATE       in BORDERDOCUMENTS.EXPIRYDATE%type
                                 ) is
    v_last_movement MOVEMENTS.MVMNTID%type;
    v_person PERSON.KEY_VALUE%type;
    v_count_person number;
    v_count_col number;
  begin
    --APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION('COLL_FELLOW_PASSENGER');
    dl_common.pkg_apex_util.create_empty_collection('COLL_FELLOW_PASSENGER');
    --
    IF p_EXITFLG = '1'
    THEN
        -- last arrival with this borderdocument
        v_last_movement := Get_Last_Movement(p_DOCNO, p_NATIONALITY, p_EXPIRY_DATE, 'LAST_MOVEMENT', 0);

        for x in (Select key_value,
                         relation,
                         last_name,
                         first_name,
                         date_of_birth,
                         sex,
                         nationality,
                         image
                from DL_BORDERCONTROL.FELLOW_PASSENGER
                where MVMNTID = v_last_movement)
        loop
          apex_collection.add_member(p_collection_name => 'COLL_FELLOW_PASSENGER',
            p_c002 => x.relation,
            p_c003 => x.last_name,
            p_c004 => x.first_name,
            p_c005 => x.date_of_birth,
            p_c006 => x.sex,
            p_c007 => x.nationality,
            p_c010 => 'I',
            p_blob001 => x.image);
        end loop;
    ELSIF p_EXITFLG = '0'
    THEN
      for x in (Select key_value,
                       relation,
                       last_name,
                       first_name,
                       date_of_birth,
                       sex,
                       nationality,
                       image
              from DL_BORDERCONTROL.FELLOW_PASSENGER
              where MVMNTID = p_MVMNTID)
      loop
        apex_collection.add_member(p_collection_name => 'COLL_FELLOW_PASSENGER',
          p_c001 => x.key_value,
          p_c002 => x.relation,
          p_c003 => x.last_name,
          p_c004 => x.first_name,
          p_c005 => x.date_of_birth,
          p_c006 => x.sex,
          p_c007 => x.nationality,
          p_c010 => 'U',
          p_blob001 => x.image);
      end loop;

      select count(*)
        into v_count_col
        from apex_collections
       where collection_name = 'COLL_FELLOW_PASSENGER';

      select count(*)
        into v_count_person
        from DL_BORDERCONTROL.FELLOW_PASSENGER
                where PERSON in (select person
                                 from DL_BORDERCONTROL.VISAS
                                 where borderdocument = (select BRDDOCID from dl_bordercontrol.borderdocuments where DOCNO = p_DOCNO));

      IF v_count_person > 0 and v_count_col = 0
      THEN
          for x in (Select key_value,
                             relation,
                             last_name,
                             first_name,
                             date_of_birth,
                             sex,
                             nationality,
                             image
                    from DL_BORDERCONTROL.FELLOW_PASSENGER
                    where PERSON in (select person
                                     from DL_BORDERCONTROL.VISAS
                                     where borderdocument = (select BRDDOCID from dl_bordercontrol.borderdocuments where DOCNO = p_DOCNO)))
            loop
              apex_collection.add_member(p_collection_name => 'COLL_FELLOW_PASSENGER',
                p_c002 => x.relation,
                p_c003 => x.last_name,
                p_c004 => x.first_name,
                p_c005 => x.date_of_birth,
                p_c006 => x.sex,
                p_c007 => x.nationality,
                p_c010 => 'I',
                p_blob001 => x.image);
            end loop;


      END IF;
    END IF;

    select count(*)
        into v_count_col
        from apex_collections
       where collection_name = 'COLL_FELLOW_PASSENGER';

    IF v_count_col = 0
    THEN
      apex_collection.add_member(p_collection_name => 'COLL_FELLOW_PASSENGER',
        p_c010 => 'I');
    END IF;

  end Load_Fellow_Passenger;
  --
  procedure Save_Fellow_Passanger(p_MVMNTID          in MOVEMENTS.MVMNTID%type
                                 ,p_KEY_VALUE        in apex_application_global.vc_arr2
                                 ,p_RELATION         in apex_application_global.vc_arr2
                                 ,p_LAST_NAME        in apex_application_global.vc_arr2
                                 ,p_FIRST_NAME       in apex_application_global.vc_arr2
                                 ,p_DATE_OF_BIRTH    in apex_application_global.vc_arr2
                                 ,p_SEX              in apex_application_global.vc_arr2
                                 ,p_SEQ_NO           in apex_application_global.vc_arr2
                                 --
                                 ) is
    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'Save_Fellow_Passanger';
    v_LOG_Params logger.tab_param;
    v_blob blob;
    v_DML_TYPE varchar2(1);
  begin

    logger.append_param(v_LOG_Params
                       ,'p_MVMNTID'
                       ,p_MVMNTID);
    logger.log('START'
              ,v_LOG_Scope
              ,null
              ,v_LOG_Params);
    --
    FOR i in 1..p_KEY_VALUE.COUNT
    LOOP
      begin
          select c010, BLOB001
            into v_DML_TYPE, v_blob
            from APEX_COLLECTIONS
           where COLLECTION_NAME = 'COLL_FELLOW_PASSENGER'
             and seq_id = p_SEQ_NO(i);
       exception when others then
         v_blob := null;
       end;

      IF p_RELATION(i) is null
         and p_LAST_NAME(i) is null
         and p_FIRST_NAME(i) is null
         and p_DATE_OF_BIRTH(i) is null
         and p_SEX(i) is null
         and dbms_lob.getlength(v_blob) = 0
      THEN
          delete DL_BORDERCONTROL.FELLOW_PASSENGER
          where KEY_VALUE = p_KEY_VALUE(i);
      ELSE

        IF p_KEY_VALUE(i) is null
        THEN
          insert into DL_BORDERCONTROL.FELLOW_PASSENGER (RELATION
                                                        ,LAST_NAME
                                                        ,FIRST_NAME
                                                        ,DATE_OF_BIRTH
                                                        ,SEX
                                                        ,IMAGE
                                                       -- ,NATIONALITY
                                                        ,MVMNTID)
          values (p_RELATION(i)
                  ,p_LAST_NAME(i)
                  ,p_FIRST_NAME(i)
                  ,p_DATE_OF_BIRTH(i)
                  ,p_SEX(i)
                  ,v_blob
                --  ,p_NATIONALITY(i)
                  ,p_MVMNTID);

        ELSIF p_KEY_VALUE(i) is not null
        THEN
          update DL_BORDERCONTROL.FELLOW_PASSENGER
             set RELATION = p_RELATION(i)
                ,LAST_NAME = p_LAST_NAME(i)
                ,FIRST_NAME = p_FIRST_NAME(i)
                ,DATE_OF_BIRTH = p_DATE_OF_BIRTH(i)
                ,SEX = p_SEX(i)
               -- ,NATIONALITY = p_NATIONALITY(i)
                ,MVMNTID = p_MVMNTID
                ,IMAGE = v_blob
          where KEY_VALUE = p_KEY_VALUE(i);

        END IF;
      END IF;
    END LOOP;
    --
    commit;
    --
  exception
    when others then
      logger.log_error('Unhandled Exception'
                      ,v_LOG_Scope
                      ,null
                      ,v_LOG_Params);
      raise;
      --
  end Save_Fellow_Passanger;
--
  procedure Store_Vehicle_Details(p_MVMNTID                 in VEHICLE_DETAILS.MVMNTID%type
                                 ,p_VEHICLE_TYPE            in VEHICLE_DETAILS.VEHICLE_TYPE%type
                                 ,p_NAME                    in VEHICLE_DETAILS.NAME%type
                                 ,p_OWNER                   in VEHICLE_DETAILS.OWNER%type
                                 ,p_FROM1                   in VEHICLE_DETAILS.FROM1%type
                                 ,p_TO1                     in VEHICLE_DETAILS.TO1%type
                                 ,p_PROVINCE                in VEHICLE_DETAILS.PROVINCE%type
                                 ,p_DATE_TIME               in VEHICLE_DETAILS.DATE_TIME%type
                                 ,p_FROM2                   in VEHICLE_DETAILS.FROM2%type
                                 ,p_TO2                     in VEHICLE_DETAILS.TO2%type
                                 -- cols added by MSCS --
                                 ,p_DIRECTION               in VEHICLE_DETAILS.MSCS_CARDTYPE%type
                                 ,p_CONVEYANCE_NO           in VEHICLE_DETAILS.MSCS_CONVREGNO%type
                                 ,p_FROM_TO_COUNTRY         in VEHICLE_DETAILS.MSCS_IOCOUNTCD%type
                                 ,p_PORT_NAME               in VEHICLE_DETAILS.MSCS_IOPORTNM%type
                                 ,p_FROM_TO_OTHER_PORT      in VEHICLE_DETAILS.MSCS_IONOTE%type
                                 ,p_FROM_TO_PORT_IN_THAI    in VEHICLE_DETAILS.MSCS_IODEPT%type
                                 ,p_IN_OUT_PORT_IN_THAI     in VEHICLE_DETAILS.MSCS_IODEPTTH%type
                                 ---------------------------
                                 ) is
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'Store_Vehicle_Details';
    v_LOG_Params logger.tab_param;
  begin
    --APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION('COLL_VEHICLE_DETAILS');
    dl_common.pkg_apex_util.create_empty_collection('COLL_VEHICLE_DETAILS');
    --
    apex_collection.add_member(p_collection_name => 'COLL_VEHICLE_DETAILS'
                               ,p_c001 => p_MVMNTID
                               ,p_c002 => p_VEHICLE_TYPE
                               ,p_c003 => p_NAME
                               ,p_c004 => p_OWNER
                               ,p_c005 => p_FROM1
                               ,p_c006 => p_TO1
                               ,p_c007 => p_PROVINCE
                               ,p_c008 => p_DATE_TIME
                               ,p_c009 => p_FROM2
                               ,p_c010 => p_TO2
                               -- cols added by MSCS --
                               ,p_c011 => p_DIRECTION
                               ,p_c012 => p_CONVEYANCE_NO
                               ,p_c013 => p_FROM_TO_COUNTRY
                               ,p_c014 => p_PORT_NAME
                               ,p_c015 => p_FROM_TO_OTHER_PORT
                               ,p_c016 => p_FROM_TO_PORT_IN_THAI
                               ,p_c017 => p_IN_OUT_PORT_IN_THAI
                               -- cols added by MSCS --
                               );
  exception
    when others then
      logger.log_error('Unhandled Exception'
                      ,v_LOG_Scope
                      ,null
                      ,v_LOG_Params);
      raise;
      --
  end Store_Vehicle_Details;

  /**
   * Checks if the given nationality (icao code) is listed in the country_management table and returns
   * a json object with the information if the landcard (aka Tm6 card) information are needed or not
   * @param p_nationality Nationality that should be checked
   * @param p_direction   Defines the direction (1 = departure, 0 = arrival)
   */
  PROCEDURE check_need_landcard (p_nationality  IN VARCHAR2
                                ,p_direction    IN PLS_INTEGER)
  IS

    l_scope logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'check_need_landcard';
    l_params logger.tab_param;
    --
    l_country_mgmnt_rec country_management%ROWTYPE;
    --
    l_need  VARCHAR2(15 CHAR);

  BEGIN

    logger.append_param(l_params, 'p_nationality', p_nationality);
    logger.log('CHECK NEED LANDCARD: start', l_scope, null, l_params);

    BEGIN

      SELECT *
        INTO l_country_mgmnt_rec
        FROM country_management
      WHERE direction    = p_direction
        AND coutry_code = p_nationality;

      CASE l_country_mgmnt_rec.need_lc
        WHEN 0 THEN l_need := 'false';
        ELSE l_need := 'true';
      END CASE;

    exception
      when no_data_found then
        l_need := 'true';
    END;

    logger.append_param(l_params, 'l_need', l_need);
    logger.log('CHECK NEED LANDCARD: done', l_scope, null, l_params);

    apex_json.open_object();
    apex_json.write('need', l_need);
    apex_json.close_object();

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('CHECK NEED LANDCARD: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END check_need_landcard;

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
end DL_MOVEMENTHANDLING;

/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."DL_MOVEMENTHANDLING" TO "JASPER_REPORTING";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."DL_MOVEMENTHANDLING" TO "DERMALOG_PROXY";
