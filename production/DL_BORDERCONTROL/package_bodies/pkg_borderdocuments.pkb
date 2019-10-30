CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_BORDERDOCUMENTS" is
  --
  -- Part1: Major-Version
  -- Part2: Minor-Version
  -- Part3:
  -- Part4: Patch-Version
  --
  -- !!! INCREMENT THIS VERSIONS STRING ON EACH CHANGE INSIDE THE PACKAGE !!!
  --
  C_PACKAGE_ID       constant simple_integer := -1; --PKG_CONSTS.C_PID$DEMO$REPORT4CENT;
  C_OBJECT_VERSION   constant varchar2(19) := '1.0.0012';
  C_OBJECT_COPYRIGHT constant varchar2(255 char) := 'Copyright: DERMALOG Identification Systems GmbH, Hamburg - Germany, 2013-' || to_char(sysdate
                                                                                                                                          ,'yyyy');
  --
  -- If NOT initialized then call Init_PACKAGE() in every proc/func where Init_PACKAGE must be run before normal processing of it can be go!!!
  -- For example: "if (not g_PACKAGE_Initialized) then Init_PACKAGE(); end if;"
  g_PACKAGE_Initialized  boolean := false;
  g_PACKAGE_Initializing boolean := false;
  --
  IMG_SEQ_VISUAL_FACE# constant simple_integer := 0;
  IMG_SEQ_ICAO_FACE#   constant simple_integer := 1;
  IMG_SEQ_VISUAL_PAGE# constant simple_integer := 2;
  IMG_SEQ_UV_PAGE#     constant simple_integer := 3;
  IMG_SEQ_IR_PAGE#     constant simple_integer := 4;
  IMG_SEQ_DG3_0#       constant simple_integer := 5;
  IMG_SEQ_DG3_1#       constant simple_integer := 6;
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
  * WWirns    13.11.2017  XX:Added
  * M.Bock    27.05.2019  Added procedure Update_CALC_MRZ
  * MSCS      19.07.2019  Added Partial DOB capability to Create_Document
  *******************************************************************************/
  --
  function Get_IMG_SEQ_VISUAL_FACE# return simple_integer deterministic is
  begin
    return IMG_SEQ_VISUAL_FACE#;
  end;
  --
  function Get_IMG_SEQ_ICAO_FACE# return simple_integer deterministic is
  begin
    return IMG_SEQ_ICAO_FACE#;
  end;
  --
  function Get_IMG_SEQ_VISUAL_PAGE# return simple_integer deterministic is
  begin
    return IMG_SEQ_VISUAL_PAGE#;
  end;
  --
  function Get_IMG_SEQ_UV_PAGE# return simple_integer deterministic is
  begin
    return IMG_SEQ_UV_PAGE#;
  end;
  --
  function Get_IMG_SEQ_IR_PAGE# return simple_integer deterministic is
  begin
    return IMG_SEQ_IR_PAGE#;
  end;
  --
  function Get_IMG_SEQ_DG3_0# return simple_integer deterministic is
  begin
    return IMG_SEQ_DG3_0#;
  end;
  --
  function Get_IMG_SEQ_DG3_1# return simple_integer deterministic is
  begin
    return IMG_SEQ_DG3_1#;
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
  * WWirns    13.11.2017  XX:Moved here from standalone "FUNCTION DL_BORDERCONTROL.GBD" and partial refactor
  * WWirns    14.11.2017  LOGGER added
  *******************************************************************************/
  --
  function Get_Document(p_DOCNO          in BORDERDOCUMENTS.DOCNO%type
                       ,p_ISSUECTRY      in BORDERDOCUMENTS.ISSUECTRY%type
                       ,p_EXPIRYDATE     in BORDERDOCUMENTS.EXPIRYDATE%type
                       ,p_INS_BORDERPOST in BORDERDOCUMENTS.INS_BORDERPOST%type default null
                        --
                        ) return BORDERDOCUMENTS.BRDDOCID%type is
    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'add_modify_varchar';
    v_LOG_Params logger.tab_param;
    --
    v_Result BORDERDOCUMENTS.BRDDOCID%type;
    --
  begin
    --
    logger.append_param(v_LOG_Params
                       ,'p_DOCNO'
                       ,p_DOCNO);
    logger.append_param(v_LOG_Params
                       ,'p_ISSUECTRY'
                       ,p_ISSUECTRY);
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
    v_Result := null;
     begin
      select t.BRDDOCID
        into v_Result
        from BORDERDOCUMENTS t
       where t.DOCNO = p_DOCNO
         and t.ISSUECTRY = p_ISSUECTRY
         and t.EXPIRYDATE = trunc(p_EXPIRYDATE);
         -- expirydate in table is already truncated and indexed (Check-Constraint)
    exception
      when NO_DATA_FOUND then
        v_Result := null;
     end;
    --
    return v_Result;
    --
  exception
    when others then
      -- ??? Why return null ???
      --raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
      return null;
      --
  end Get_Document;
  --
  --
  /*******************************************************************************
   * ???
   *
   * Author    Date        Description
   * --------  ----------  -------------------------------------------------------*
   * Chageman  14.09.2018  Added
   *******************************************************************************/
  FUNCTION get_document_rec(p_docno           IN BORDERDOCUMENTS.DOCNO%type
                           ,p_issuectry       IN BORDERDOCUMENTS.ISSUECTRY%type
                           ,p_expirydate      IN BORDERDOCUMENTS.EXPIRYDATE%type
                           ,p_ins_borderpost  IN BORDERDOCUMENTS.INS_BORDERPOST%type default null)
  RETURN BORDERDOCUMENTS%ROWTYPE
  IS

    l_scope logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'get_document_rec';
    l_params logger.tab_param;
    --
    l_result BORDERDOCUMENTS%ROWTYPE;

  BEGIN

    logger.append_param(l_params, 'p_docno', p_docno);
    logger.append_param(l_params, 'p_issuectry', p_issuectry);
    logger.append_param(l_params, 'p_expirydate', p_expirydate);
    logger.append_param(l_params, 'p_ins_borderpost', p_ins_borderpost);
    logger.log('GET DOCUMENT RECORD: start', l_scope, null, l_params);

    BEGIN

      select *
        into l_result
        from BORDERDOCUMENTS t
       where t.DOCNO = p_docno
         and t.ISSUECTRY = p_issuectry
         and t.EXPIRYDATE = trunc(p_expirydate);
         -- expirydate in table is already truncated and indexed (Check-Constraint)

    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        l_result := NULL;
    END;

    logger.log('GET DOCUMENT RECORD: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('GET DOCUMENT RECORD: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END get_document_rec;
  --
  --
  /**
   * Searches for similar entries in the borderdocuments table and returns a table of
   * borderdocuments
   * The function searches in table BORDERDOCUMENTS:
   *  - issuing country (issuectry)
   *  - nationality (nat)
   *  - date of birth (dob)
   *  - givenname (first name)
   *  - surname (last name)
   *  - middlename
   *
   * If the document already exists, the most important information is the identity
   * !! Only datasets with an identity column will be returned !!
   *
   * This function is used to merge multiple borderdocuments to one identity
   *
   * @param p_issuectry   Issuing country of the document
   * @param p_nat         Nationality of the person / document
   * @param p_dob         Date of birth of the person / document
   * @param p_givenname   Givenname (first name) of the person / document
   * @param p_surname     Surname (last name) of the person / document
   * @param p_middlename  Middlename of the person / document
   * @return t_borderdocuments_tab Table of borderdocuments that could be found
   */
  FUNCTION get_similar_documents (p_issuectry   IN borderdocuments.issuectry%TYPE
                                 ,p_nat         IN borderdocuments.nat%TYPE
                                 ,p_dob         IN borderdocuments.dob%TYPE
                                 ,p_givenname   IN borderdocuments.givenname%TYPE
                                 ,p_surname     IN borderdocuments.surname%TYPE
                                 ,p_middlename  IN borderdocuments.middlename%TYPE)
  RETURN t_borderdocuments_tab PIPELINED
  IS

    l_scope logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'get_similar_documents';
    l_params logger.tab_param;
    --
    l_result t_borderdocuments_tab;
    l_rec    dl_bordercontrol.borderdocuments%ROWTYPE;
    --
    CURSOR l_documents_cur IS
    SELECT *
      FROM dl_bordercontrol.borderdocuments
     WHERE issuectry              = p_issuectry
       AND nat                    = p_nat
       AND dob                    = p_dob
       AND surname                = p_surname
       AND NVL(givenname, 'xyz')  = NVL(p_givenname, 'xyz')
       AND NVL(middlename, 'xyz') = NVL(p_middlename, 'xyz');

  BEGIN

    logger.append_param(l_params, 'p_issuectry', p_issuectry);
    logger.append_param(l_params, 'p_nat', p_nat);
    logger.append_param(l_params, 'p_dob', p_dob);
    logger.append_param(l_params, 'p_givenname', p_givenname);
    logger.append_param(l_params, 'p_surname', p_surname);
    logger.append_param(l_params, 'p_middlename', p_middlename);
    logger.log('GET SIMILAR DOCUMENTS: start', l_scope, null, l_params);

    FOR l_document_rec IN l_documents_cur
    LOOP
      l_rec := l_document_rec;
      PIPE ROW(l_rec);
    END LOOP;

    --logger.append_param(l_params, 'hits', l_result.COUNT);

    logger.log('GET SIMILAR DOCUMENTS: done', l_scope, null, l_params);
    RETURN;

  EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
      logger.append_param(l_params, 'hits', 0);
      logger.log('GET SIMILAR DOCUMENTS: done', l_scope, null, l_params);
      RETURN;

    WHEN OTHERS
    THEN
      logger.log_error('GET SIMILAR DOCUMENTS: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END get_similar_documents;
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
  * MSCS      19.07.2019  Added Partial DOB capability
  * M.Bock    11.04.2019  Added user defined exception for unknown country
  * CHageman  18.10.2018  Added
  *******************************************************************************/
  function Create_Document(p_DOCNO               in BORDERDOCUMENTS.DOCNO%type
                          ,p_DOCTYPE             in BORDERDOCUMENTS.DOCTYPE%type
                          ,p_ISSUECTRY           in BORDERDOCUMENTS.ISSUECTRY%type
                          ,p_EXPIRYDATE          in BORDERDOCUMENTS.EXPIRYDATE%type
                          ,p_SURNAME             in BORDERDOCUMENTS.SURNAME%type
                          ,p_MIDDLENAME          in BORDERDOCUMENTS.MIDDLENAME%type
                          ,p_GIVENNAME           in BORDERDOCUMENTS.GIVENNAME%type
                          ,p_SEX                 in BORDERDOCUMENTS.SEX%type
                          ,p_DOB                 in BORDERDOCUMENTS.DOB%type -- varchar2(10 char)
                          ,p_MRZDG1              in BORDERDOCUMENTS.MRZDG1%type
                          ,p_INS_TERMINAL        in BORDERDOCUMENTS.INS_TERMINAL%type
                          ,p_INS_BORDERPOST      in BORDERDOCUMENTS.INS_BORDERPOST%type
                          ,p_Img_VISUAL_FACE     in blob
                          ,p_Img_ICAO_FACE       in blob
                          ,p_Img_VISUALPAGE      in blob
                          ,p_Img_UVPAGE          in blob
                          ,p_Img_IRPAGE          in blob
                          ,p_Img_DG3_0           in blob
                          ,p_Img_DG3_1           in blob
                          ,p_MANUAL_EXPIRY_DATE  in date default null
                          ,p_MANUAL_ISSUING_DATE in date default null
                          ,p_MANUAL_NATIONALITY  in varchar2 default null
                          ,p_MANUAL_PLACEOFBIRTH in varchar2 default null
                          ,p_docclass            in BORDERDOCUMENTS.docclass%TYPE DEFAULT NULL
                          ,x_identity           OUT identities.identity%TYPE
                           --
                           ) return BORDERDOCUMENTS.BRDDOCID%type
  IS

    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'Create_Document';
    v_LOG_Params logger.tab_param;
    --
    v_Result        BORDERDOCUMENTS.BRDDOCID%type;
    l_result_rec    borderdocuments%ROWTYPE;
    v_TMP_BRDDOCID  BORDERDOCUMENTS.BRDDOCID%type;
    v_Do_Update     boolean;
    v_vc_Tmp        varchar2(1 char);
    --
    l_identity_rec  identities%ROWTYPE;
    l_merge_brddoc  t_borderdocuments_tab := t_borderdocuments_tab();
    l_brddoc_rec    borderdocuments%ROWTYPE;
    l_tmp_identity  identities.identity%TYPE;
    l_movement_exists  varchar2(1 char);
    l_issuectry     BORDERDOCUMENTS.ISSUECTRY%type := p_ISSUECTRY;
    c_issuectry_unk CONSTANT BORDERDOCUMENTS.ISSUECTRY%type := '###';
    c_fk_issuectry  CONSTANT varchar2(5 char) := '$FK02';
    c_err_issuectry CONSTANT varchar2(100 char) := 'DL_BORDERCONTROL.PKG_BORDERDOCUMENTS.CREATE_DOCUMENT.UNKNOWN_COUNTRY_%';
    --
    --
    CHECK_CONSTRAINT_VIOLATED EXCEPTION;
    PRAGMA EXCEPTION_INIT(CHECK_CONSTRAINT_VIOLATED, -02291);

    procedure L_Do_Image(p_BRDDOCID in BORDERDOCIMAGES.BRDDOCID%type
                        ,p_SEQNO    in BORDERDOCIMAGES.SEQNO%type
                        ,p_IMAGE    in BORDERDOCIMAGES.IMAGE%type
                         --
                         ) is
    begin
      --
      if (p_IMAGE is not null)
      then
        if (v_Do_Update)
        then
          begin
            select '#'
              into v_vc_Tmp
              from BORDERDOCIMAGES
             where BRDDOCID = p_BRDDOCID
               and SEQNO = p_SEQNO;
            --
            -- Currently no updates
            null;
          exception
            when NO_DATA_FOUND then
              insert into BORDERDOCIMAGES
                (BRDDOCID
                ,SEQNO
                ,IMAGE
                ,INS_TERMINAL
                ,INS_BORDERPOST
                 --
                 )
              values
                (p_BRDDOCID
                ,p_SEQNO
                ,p_IMAGE
                ,p_INS_TERMINAL
                ,p_INS_BORDERPOST
                 --
                 );
          end;
        else
          insert into BORDERDOCIMAGES
            (BRDDOCID
            ,SEQNO
            ,IMAGE
            ,INS_TERMINAL
            ,INS_BORDERPOST
             --
             )
          values
            (p_BRDDOCID
            ,p_SEQNO
            ,p_IMAGE
            ,p_INS_TERMINAL
            ,p_INS_BORDERPOST
             --
             );
        end if;
      end if;
      --
    end L_Do_Image;
    --
  begin
    --
    logger.append_param(v_LOG_Params,'p_DOCNO',p_DOCNO);
    logger.append_param(v_LOG_Params,'p_ISSUECTRY',p_ISSUECTRY);
    logger.append_param(v_LOG_Params,'p_EXPIRYDATE',p_EXPIRYDATE);
    logger.log('START',v_LOG_Scope,null,v_LOG_Params);
    --
    -- Check if country code is known, otherwise user code XXX
    begin
        select case
                when exists (select NULL
                             from dl_common.icao_doc_codes
                             where key_value = p_ISSUECTRY)
                then p_ISSUECTRY
                else c_issuectry_unk
            end
            into l_issuectry
        from dual;
    end;

    -- get current BRDDOCID of this BorderDocument
    l_result_rec := get_document_rec (p_docno           => p_DOCNO
                                     ,p_issuectry       => l_issuectry
                                     ,p_expirydate      => p_EXPIRYDATE
                                     ,p_ins_borderpost  => p_INS_BORDERPOST);

    v_result := l_result_rec.brddocid;

    -- get identity for this document
    BEGIN
      SELECT identity
        INTO l_identity_rec.identity
        FROM identities
       WHERE brddocid = l_result_rec.brddocid;

    EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
        NULL;
    END;

    -- TODO: delete
    /*v_Result := Get_Document(p_DOCNO
                            ,p_ISSUECTRY
                            ,p_EXPIRYDATE
                            ,p_INS_BORDERPOST);*/
    --
    --
    v_Do_Update := case
                     when (v_Result is not null) then
                      true
                     else
                      false
                   end;
    --
    -- Create BorderDocument
    if (v_Do_Update)
    then
      --
      -- Currently no updates
      -- Now updating when no finished movement exists
      
      -- check if any finished movement exists
      SELECT 
        CASE
            WHEN EXISTS
            (
                SELECT NULL
                FROM movements
                WHERE brddocid = v_Result
                AND is_finished = 'Y'
            )
            THEN 'Y'
            ELSE 'N'
        END
      INTO l_movement_exists
      FROM DUAL;
      
      -- update if no finished movement exists
      IF l_movement_exists = 'N' THEN
        UPDATE borderdocuments SET
            dob                     = p_DOB
            , sex                   = p_SEX
            , givenname             = p_GIVENNAME
            , surname               = p_SURNAME
            , middlename            = p_MIDDLENAME
            , manual_expiry_date    = p_MANUAL_EXPIRY_DATE
            , manual_issuing_date   = p_MANUAL_ISSUING_DATE
            , manual_nationality    = p_MANUAL_NATIONALITY
            , manual_placeofbirth   = p_MANUAL_PLACEOFBIRTH
            , dob_partial           = pkg_common.Get_Partial_Date(p_DOB, 1, 0, 0, 1)
        WHERE brddocid = v_Result;
        
        logger.append_param(v_LOG_Params,'BRDDOCID',v_Result);
        logger.log('Document Updated',v_LOG_Scope,null,v_LOG_Params);
      END IF;
      --
      --
      x_identity := l_identity_rec.identity;
    else
      begin
          insert into BORDERDOCUMENTS i
            (BRDDOCID
            ,DOCTYPE
            ,DOCNO
            ,ISSUECTRY
            ,NAT
            ,DOB
            ,SEX
            ,EXPIRYDATE
            ,GIVENNAME
            ,SURNAME
             --,OPTIONALDATA
             --,AFISID
            ,INS_TERMINAL
            ,INS_BORDERPOST
             --,OFFICER_OBSERVATION
            ,MRZDG1
             --,P_01
             --,P_02
             --,P_03
             --,P_04
             --,P_05
             ,MIDDLENAME
             --,GIVENNAME_THAI
             --,MIDDLENAME_THAI
             --,SURNAME_THAI
             --,CALC_DOB
            ,MANUAL_EXPIRY_DATE
            ,MANUAL_ISSUING_DATE
            ,MANUAL_NATIONALITY
            ,MANUAL_PLACEOFBIRTH
            ,docclass
            ,dob_partial
             --
             )
          values
            (null
            ,p_DOCTYPE
            ,p_DOCNO
            ,l_issuectry
            ,l_issuectry
            ,p_DOB
            ,p_SEX
            ,p_EXPIRYDATE
            ,p_GIVENNAME
            ,p_SURNAME
             --,OPTIONALDATA
             --,AFISID
            ,p_INS_TERMINAL
            ,p_INS_BORDERPOST
             --,OFFICER_OBSERVATION
            ,p_MRZDG1
             --,P_01
             --,P_02
             --,P_03
             --,P_04
             --,P_05
             ,p_MIDDLENAME
             --,GIVENNAME_THAI
             --,MIDDLENAME_THAI
             --,SURNAME_THAI
             --,CALC_DOB
            ,p_MANUAL_EXPIRY_DATE
            ,p_MANUAL_ISSUING_DATE
            ,p_MANUAL_NATIONALITY
            ,p_MANUAL_PLACEOFBIRTH
            ,p_docclass
            ,pkg_common.Get_Partial_Date(p_DOB, 1, 0, 0, 1)
             --
             )
          returning i.BRDDOCID into v_Result;
      exception when CHECK_CONSTRAINT_VIOLATED then
            IF instr(SQLERRM, c_fk_issuectry) > 0 THEN
                raise_application_error( -20000, c_err_issuectry || p_ISSUECTRY);
            ELSE
                raise;
            END IF;
      end;
      -- 1. create identity to merge the other ones
      l_identity_rec.identity  := pkg_identities.get_new_bio_id();
      l_identity_rec.brddocid  := v_result;
      l_identity_rec.source    := 'D';
      l_identity_rec.key_value := pkg_identities.save_identity(l_identity_rec);
      --
      -- 2. define the borderdocumentsarray that should be used to merge the created document
      FOR l_brddoc_rec IN (SELECT *
                             FROM TABLE(get_similar_documents (p_issuectry  => l_issuectry
                                                              ,p_nat        => l_issuectry
                                                              ,p_dob        => p_dob
                                                              ,p_givenname  => p_givenname
                                                              ,p_surname    => p_surname
                                                              ,p_middlename => p_middlename)))
      LOOP
        l_merge_brddoc.EXTEND(1);
        l_merge_brddoc(l_merge_brddoc.COUNT) := l_brddoc_rec;
      END LOOP;

      -- 2.1. define borderdocument record
      l_brddoc_rec.brddocid := v_result;
      l_brddoc_rec.expirydate := p_expirydate;

      -- 2.2. merge borderdocuments and return identity information
      l_tmp_identity := pkg_identities.merge_identities(l_merge_brddoc, l_brddoc_rec);
      l_identity_rec.identity := NVL(l_tmp_identity, l_identity_rec.identity);
      x_identity := l_identity_rec.identity;
      --
      -- Test to get the correct one BRDDOCID of this Border-Document
      v_TMP_BRDDOCID := Get_Document(p_DOCNO
                                    ,l_issuectry
                                    ,p_EXPIRYDATE
                                    ,p_INS_BORDERPOST);
      --
      if (v_TMP_BRDDOCID is null)
      then
        Raise_application_error(-20000
                               ,'"Get_Document" delivers NULL of currently inserted border document!');
      elsif (v_TMP_BRDDOCID != v_Result)
      then
        Raise_application_error(-20000
                               ,'"Get_Document" delivers an other BRDDOCID than the currently inserted border document!');
      end if;
      --
    end if;
    --
    --
    --
    L_Do_Image(v_Result
              ,Get_IMG_SEQ_VISUAL_FACE#()
              ,p_Img_VISUAL_FACE
               --
               );

    --
    L_Do_Image(v_Result
              ,Get_IMG_SEQ_ICAO_FACE#()
              ,p_Img_ICAO_FACE
               --
               );
    --
    L_Do_Image(v_Result
              ,Get_IMG_SEQ_VISUAL_PAGE#()
              ,p_Img_VISUALPAGE
               --
               );
    --
    L_Do_Image(v_Result
              ,Get_IMG_SEQ_UV_PAGE#()
              ,p_Img_UVPAGE
               --
               );
    --
    L_Do_Image(v_Result
              ,Get_IMG_SEQ_IR_PAGE#()
              ,p_Img_IRPAGE
               --
               );
    --
    L_Do_Image(v_Result
              ,Get_IMG_SEQ_DG3_0#()
              ,p_Img_DG3_0
               --
               );
    --
    L_Do_Image(v_Result
              ,Get_IMG_SEQ_DG3_1#()
              ,p_Img_DG3_1
               --
               );
    --
    --
    return v_Result;

  END create_document;
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
  * WWirns    13.11.2017  XX:Moved here from standalone "PROCEDURE DL_BORDERCONTROL.CREATEBORDERDOCUMENT" and partial refactor
  * WWirns    14.11.2017  LOGGER added
  * WWirns    30.01.2018  Add parameter p_MANUAL_EXPIRY_DATE, p_MANUAL_ISSUING_DATE, p_MANUAL_NATIONALITY and p_MANUAL_PLACEOFBIRTH
  * WWirns    01.02.2018  Change handling of BRDDOCID and add function implementation
  *******************************************************************************/
  --
  function Create_Document(p_DOCNO               in BORDERDOCUMENTS.DOCNO%type
                          ,p_DOCTYPE             in BORDERDOCUMENTS.DOCTYPE%type
                          ,p_ISSUECTRY           in BORDERDOCUMENTS.ISSUECTRY%type
                          ,p_EXPIRYDATE          in BORDERDOCUMENTS.EXPIRYDATE%type
                          ,p_SURNAME             in BORDERDOCUMENTS.SURNAME%type
                          ,p_MIDDLENAME          in BORDERDOCUMENTS.MIDDLENAME%type
                          ,p_GIVENNAME           in BORDERDOCUMENTS.GIVENNAME%type
                          ,p_SEX                 in BORDERDOCUMENTS.SEX%type
                          ,p_DOB                 in BORDERDOCUMENTS.DOB%type -- varchar2(10 char)
                          ,p_MRZDG1              in BORDERDOCUMENTS.MRZDG1%type
                          ,p_INS_TERMINAL        in BORDERDOCUMENTS.INS_TERMINAL%type
                          ,p_INS_BORDERPOST      in BORDERDOCUMENTS.INS_BORDERPOST%type
                          ,p_Img_VISUAL_FACE     in blob
                          ,p_Img_ICAO_FACE       in blob
                          ,p_Img_VISUALPAGE      in blob
                          ,p_Img_UVPAGE          in blob
                          ,p_Img_IRPAGE          in blob
                          ,p_Img_DG3_0           in blob
                          ,p_Img_DG3_1           in blob
                          ,p_MANUAL_EXPIRY_DATE  in date default null
                          ,p_MANUAL_ISSUING_DATE in date default null
                          ,p_MANUAL_NATIONALITY  in varchar2 default null
                          ,p_MANUAL_PLACEOFBIRTH in varchar2 default null
                          ,p_docclass            in BORDERDOCUMENTS.docclass%TYPE DEFAULT NULL
                           --
                           ) return BORDERDOCUMENTS.BRDDOCID%type
  is

    l_identity VARCHAR2(32 CHAR);--borderdocuments.identity%TYPE;

  begin

    RETURN Create_Document(p_DOCNO               => p_DOCNO
                          ,p_DOCTYPE             => p_DOCTYPE
                          ,p_ISSUECTRY           => p_ISSUECTRY
                          ,p_EXPIRYDATE          => p_EXPIRYDATE
                          ,p_SURNAME             => p_SURNAME
                          ,p_MIDDLENAME          => p_MIDDLENAME
                          ,p_GIVENNAME           => p_GIVENNAME
                          ,p_SEX                 => p_SEX
                          ,p_DOB                 => p_DOB
                          ,p_MRZDG1              => p_MRZDG1
                          ,p_INS_TERMINAL        => p_INS_TERMINAL
                          ,p_INS_BORDERPOST      => p_INS_BORDERPOST
                          ,p_Img_VISUAL_FACE     => p_Img_VISUAL_FACE
                          ,p_Img_ICAO_FACE       => p_Img_ICAO_FACE
                          ,p_Img_VISUALPAGE      => p_Img_VISUALPAGE
                          ,p_Img_UVPAGE          => p_Img_UVPAGE
                          ,p_Img_IRPAGE          => p_Img_IRPAGE
                          ,p_Img_DG3_0           => p_Img_DG3_0
                          ,p_Img_DG3_1           => p_Img_DG3_1
                          ,p_MANUAL_EXPIRY_DATE  => p_MANUAL_EXPIRY_DATE
                          ,p_MANUAL_ISSUING_DATE => p_MANUAL_ISSUING_DATE
                          ,p_MANUAL_NATIONALITY  => p_MANUAL_NATIONALITY
                          ,p_MANUAL_PLACEOFBIRTH => p_MANUAL_PLACEOFBIRTH
                          ,p_docclass            => p_docclass
                          ,x_identity            => l_identity);

  end Create_Document;
  --
  procedure Create_Document(p_DOCNO               in BORDERDOCUMENTS.DOCNO%type
                           ,p_DOCTYPE             in BORDERDOCUMENTS.DOCTYPE%type
                           ,p_ISSUECTRY           in BORDERDOCUMENTS.ISSUECTRY%type
                           ,p_EXPIRYDATE          in BORDERDOCUMENTS.EXPIRYDATE%type
                           ,p_SURNAME             in BORDERDOCUMENTS.SURNAME%type
                           ,p_MIDDLENAME          in BORDERDOCUMENTS.MIDDLENAME%type
                           ,p_GIVENNAME           in BORDERDOCUMENTS.GIVENNAME%type
                           ,p_SEX                 in BORDERDOCUMENTS.SEX%type
                           ,p_DOB                 in BORDERDOCUMENTS.DOB%type -- varchar2(10 char)
                           ,p_MRZDG1              in BORDERDOCUMENTS.MRZDG1%type
                           ,p_INS_TERMINAL        in BORDERDOCUMENTS.INS_TERMINAL%type
                           ,p_INS_BORDERPOST      in BORDERDOCUMENTS.INS_BORDERPOST%type
                           ,p_Img_VISUAL_FACE     in blob
                           ,p_Img_ICAO_FACE       in blob
                           ,p_Img_VISUALPAGE      in blob
                           ,p_Img_UVPAGE          in blob
                           ,p_Img_IRPAGE          in blob
                           ,p_Img_DG3_0           in blob
                           ,p_Img_DG3_1           in blob
                           ,p_MANUAL_EXPIRY_DATE  in date default null
                           ,p_MANUAL_ISSUING_DATE in date default null
                           ,p_MANUAL_NATIONALITY  in varchar2 default null
                           ,p_MANUAL_PLACEOFBIRTH in varchar2 default null
                            ,p_docclass            in BORDERDOCUMENTS.docclass%TYPE DEFAULT NULL
                            --
                            ) is
    --
    v_BRDDOCID BORDERDOCUMENTS.BRDDOCID%type;
    --
  begin
    --
    v_BRDDOCID := Create_Document(p_DOCNO
                                 ,p_DOCTYPE
                                 ,p_ISSUECTRY
                                 ,p_EXPIRYDATE
                                 ,p_SURNAME
                                 ,p_MIDDLENAME
                                 ,p_GIVENNAME
                                 ,p_SEX
                                 ,p_DOB
                                 ,p_MRZDG1
                                 ,p_INS_TERMINAL
                                 ,p_INS_BORDERPOST
                                 ,p_Img_VISUAL_FACE
                                 ,p_Img_ICAO_FACE
                                 ,p_Img_VISUALPAGE
                                 ,p_Img_UVPAGE
                                 ,p_Img_IRPAGE
                                 ,p_Img_DG3_0
                                 ,p_Img_DG3_1
                                 ,p_MANUAL_EXPIRY_DATE
                                 ,p_MANUAL_ISSUING_DATE
                                 ,p_MANUAL_NATIONALITY
                                 ,p_MANUAL_PLACEOFBIRTH
                                 ,p_docclass
                                  --
                                  );
    --
  end Create_Document;
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
  * WWirns    13.11.2017  XX:Moved here from standalone "FUNCTION DL_BORDERCONTROL.IS_DOCUMENT_BLACKLISTED" and partial refactor
  * WWirns    14.11.2017  LOGGER added
  *******************************************************************************/
  --
  /*
  function Is_On_Blacklist(p_DOCNO             in BORDERDOCUMENTS.DOCNO%type
                          ,p_ISSUECTRY         in BORDERDOCUMENTS.ISSUECTRY%type default null
                          ,p_EXPIRYDATE        in BORDERDOCUMENTS.EXPIRYDATE%type default null
                          ,p_SURNAME           in BORDERDOCUMENTS.SURNAME%type default null
                          ,p_GIVENNAME         in BORDERDOCUMENTS.GIVENNAME%type default null
                          ,p_SEX               in BORDERDOCUMENTS.SEX%type default null
                          ,p_DOB               in BORDERDOCUMENTS.DOB%type default null -- varchar2(10 char)
                          ,p_Do_Write_Incident in number default 1
                          ,p_INS_TERMINAL      in BORDERDOCUMENTS.INS_TERMINAL%type default null
                          ,p_INS_BORDERPOST    in BORDERDOCUMENTS.INS_BORDERPOST%type default null
                           --
                           ) return number is
    --
    v_LOG_Scope  logger_logs.scope%type := g_LOG_SCOPE_PREFIX || 'add_modify_varchar';
    v_LOG_Params logger.tab_param;
    --
    v_DOB                 date;
    v_BL_Hit_Cnt          number;
    v_Name_Concat         varchar2(4000 char);
    v_Name_Concat_Reverse varchar2(4000 char);
    --
  begin
    --
    logger.append_param(v_LOG_Params
                       ,'p_DOCNO'
                       ,p_DOCNO);
    logger.append_param(v_LOG_Params
                       ,'p_ISSUECTRY'
                       ,p_ISSUECTRY);
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

    --
    --
    v_DOB := to_date(p_DOB
                    ,'RRMMDD');
    --
    -- Bedingung 1: DOCNO + ISSUING STATE hinreichend
    --
    select count(*)
      into v_BL_Hit_Cnt
      from CAMBODIA_BLACKLIST t
     where t.DOCNO = upper(p_DOCNO)
       and upper(t.ISSUING_COUNTRY) = upper(p_ISSUECTRY)
       and t.ACTIVE = 1;
    --
    if (v_BL_Hit_Cnt > 0)
    then
      --
      if (p_Do_Write_Incident = 1)
      then
        PKG_INCIDENTS.Create_Incident$AT(p_DOCNO
                                        ,p_ISSUECTRY
                                        ,p_EXPIRYDATE
                                        ,p_SURNAME
                                        ,p_GIVENNAME
                                        ,p_SEX
                                        ,v_DOB
                                        ,1
                                        ,p_INS_TERMINAL
                                        ,p_INS_BORDERPOST
                                         --
                                         );
      end if;
      --
      return 1;
      --
    end if;
    --
    -- Bedingung 2: NACHNAME + VORNAME (Konkatiniert) + GEBURTSDATUM
    --
    v_Name_Concat := upper(replace(p_SURNAME
                                  ,' '
                                  ,null))
                    --
                     || upper(replace(p_GIVENNAME
                                     ,' '
                                     ,null));
    --
    select count(*)
      into v_BL_Hit_Cnt
      from CAMBODIA_BLACKLIST t
     where upper(replace(t.NAME
                        ,' '
                        ,null))
          --
           || upper(replace(firstname
                           ,' '
                           ,null)) = v_Name_Concat
       and trunc(t.DOB) = v_DOB
       and t.ACTIVE = 1;
    --
    if (v_BL_Hit_Cnt > 0)
    then
      if (p_Do_Write_Incident = 1)
      then
        PKG_INCIDENTS.Create_Incident$AT(p_DOCNO
                                        ,p_ISSUECTRY
                                        ,p_EXPIRYDATE
                                        ,p_SURNAME
                                        ,p_GIVENNAME
                                        ,p_SEX
                                        ,v_DOB
                                        ,1
                                        ,p_INS_TERMINAL
                                        ,p_INS_BORDERPOST
                                         --
                                         );
      end if;
      --
      return 1;
      --
    end if;
    --
    -- Bedingung 3: VORNAME + NACHNAME(Konkatiniert) + GEBURTSDATUM
    --
    v_Name_Concat_Reverse := upper(replace(p_GIVENNAME
                                          ,' '
                                          ,null))
                            --
                             || upper(replace(p_SURNAME
                                             ,' '
                                             ,null));
    --
    select count(*)
      into v_BL_Hit_Cnt
      from CAMBODIA_BLACKLIST t
     where upper(replace(t.NAME
                        ,' '
                        ,null))
          --
           || upper(replace(t.FIRSTNAME
                           ,' '
                           ,null)) = v_Name_Concat_Reverse
       and trunc(t.DOB) = v_DOB
       and t.ACTIVE = 1;
    --
    if (v_BL_Hit_Cnt > 0)
    then
      --
      if (p_Do_Write_Incident = 1)
      then
        PKG_INCIDENTS.Create_Incident$AT(p_DOCNO
                                        ,p_ISSUECTRY
                                        ,p_EXPIRYDATE
                                        ,p_SURNAME
                                        ,p_GIVENNAME
                                        ,p_SEX
                                        ,v_DOB
                                        ,1
                                        ,p_INS_TERMINAL
                                        ,p_INS_BORDERPOST
                                         --
                                         );
      end if;
      --
      return 1;
      --
    end if;
    --
    return 0;
    --
  end Is_On_Blacklist;
  */
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
  procedure Update_CALC_MRZ (p_BRDDOCID in BORDERDOCUMENTS.BRDDOCID%type
                            ,p_CALC_MRZDG1 in BORDERDOCUMENTS.CALC_MRZDG1%type) is
  begin
    UPDATE BORDERDOCUMENTS SET CALC_MRZDG1 = p_CALC_MRZDG1
    WHERE BRDDOCID = p_BRDDOCID;
  end;
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
end PKG_BORDERDOCUMENTS;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_BORDERDOCUMENTS" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_BORDERDOCUMENTS" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_BORDERDOCUMENTS" TO "BIOSUPPORT";
