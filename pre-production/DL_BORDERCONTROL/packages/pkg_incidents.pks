CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_INCIDENTS" is
  --
  --
  /*******************************************************************************
  ???


  Author    Date        Description
  --------  ----------  -------------------------------------------------------*
  WWirns    13.11.2017  Added
  *******************************************************************************/
  --
  --
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
                               );
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
                            );
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
end PKG_INCIDENTS;
/
