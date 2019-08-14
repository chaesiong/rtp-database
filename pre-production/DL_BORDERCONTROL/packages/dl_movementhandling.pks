CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."DL_MOVEMENTHANDLING" as
  --
  --
  --
  -- Global/var/other declarations

  TYPE last_movement_info_rec_typ IS RECORD
  (
    source              VARCHAR2(30)
    ,source_sec         VARCHAR2(30)
    ,source_sec_pk_val  VARCHAR2(100)
    ,direction          MOVEMENTS.EXITFLG%TYPE
    ,travel_date        MOVEMENTS.MOVEMENT_DT%TYPE
    --
    ,docno              BORDERDOCUMENTS.DOCNO%TYPE
    ,docno_expiry_date  BORDERDOCUMENTS.EXPIRYDATE%TYPE
    --
    ,visa_number        VISAS.VISA_NUMBER%TYPE
    ,visa_type          MOVEMENTS.VISA_TYPE%TYPE
    ,visa_expiry_date   MOVEMENTS.MAX_STAY_DT%TYPE
    ,visa_image         VISAS.VISA_IMAGE%TYPE
    --
    ,permit_type        VISAS.PERMIT_TYPE%TYPE
    ,permit_expiry_date VISAS.PERMIT_EXPIRY_DATE%TYPE
    --
    ,entry_form_no      ENTRY_FORMS.FORM_NO%TYPE
    ,province           ENTRY_FORMS.PROVINCE%TYPE
    ,district           ENTRY_FORMS.DISTRICT%TYPE
    ,subdistrict        ENTRY_FORMS.SUBDISTRICT%TYPE
    ,address            ENTRY_FORMS.ADDRESS%TYPE
    ,note               ENTRY_FORMS.NOTE%TYPE
    ,entry_form_image   ENTRY_FORMS.FORM_IMAGE%TYPE
  );
  --
  --
  --
  /*
  function Get_ATTR_SEQ_EXPIRY_DATE# return simple_integer deterministic;
  --
  function Get_ATTR_SEQ_ISSUING_DATE# return simple_integer deterministic;
  --
  function Get_ATTR_SEQ_NATIONALITY# return simple_integer deterministic;
  --
  function Get_ATTR_SEQ_PLACEOFBIRTH# return simple_integer deterministic;
  */
  --
  /*
  function Get_ATTR_SEQ_TEMPLATE_LI# return simple_integer deterministic;
  --
  function Get_ATTR_SEQ_TEMPLATE_LL# return simple_integer deterministic;
  --
  function Get_ATTR_SEQ_TEMPLATE_LM# return simple_integer deterministic;
  --
  function Get_ATTR_SEQ_TEMPLATE_LR# return simple_integer deterministic;
  --
  function Get_ATTR_SEQ_TEMPLATE_LT# return simple_integer deterministic;
  --
  function Get_ATTR_SEQ_TEMPLATE_RI# return simple_integer deterministic;
  --
  function Get_ATTR_SEQ_TEMPLATE_RL# return simple_integer deterministic;
  --
  function Get_ATTR_SEQ_TEMPLATE_RM# return simple_integer deterministic;
  --
  function Get_ATTR_SEQ_TEMPLATE_RR# return simple_integer deterministic;
  --
  function Get_ATTR_SEQ_TEMPLATE_RT# return simple_integer deterministic;
  */
  --
  --
  --
  /*ADD_MODIFY_... Functions: return 0 when successful, 1 when failed. will either add or update an existing add-on record to a given movement*/
  function ADD_MODIFY_VARCHAR(p_MVMNTID        in MOVEMENT_ATTR.MVMNTID%type
                             ,p_SEQNO          in MOVEMENT_ATTR.SEQNO%type
                             ,p_DATA           in MOVEMENT_ATTR.ATTRVARCHAR%type
                             ,p_INS_TERMINAL   in MOVEMENT_ATTR.INS_TERMINAL%type
                             ,p_INS_BORDERPOST in MOVEMENT_ATTR.INS_BORDERPOST%type
                              --
                              ) return number;
  --
  --
  --
  function ADD_MODIFY_BLOB(p_MVMNTID        in MOVEMENT_ATTR.MVMNTID%type
                          ,p_SEQNO          in MOVEMENT_ATTR.SEQNO%type
                          ,p_DATA           in MOVEMENT_ATTR.ATTRBLOB%type
                          ,p_INS_TERMINAL   in MOVEMENT_ATTR.INS_TERMINAL%type
                          ,p_INS_BORDERPOST in MOVEMENT_ATTR.INS_BORDERPOST%type
                           --
                           ) return number;
  --
  --
  --
  /* GET_... Functions: return NULL when not available*/
  function get_VARCHAR(p_MVMNTID        in MOVEMENT_ATTR.MVMNTID%type
                      ,p_SEQNO          in MOVEMENT_ATTR.SEQNO%type
                      ,p_INS_BORDERPOST in MOVEMENT_ATTR.INS_BORDERPOST%type default null
                       --
                       ) return MOVEMENT_ATTR.ATTRVARCHAR%type;
  --
  --
  --
  function get_BLOB(p_MVMNTID        in MOVEMENT_ATTR.MVMNTID%type
                   ,p_SEQNO          in MOVEMENT_ATTR.SEQNO%type
                   ,p_INS_BORDERPOST in MOVEMENT_ATTR.INS_BORDERPOST%type default null
                    --
                    ) return MOVEMENT_ATTR.ATTRBLOB%type;
  --
  --
  --
  function Create_Movement(p_EXITFLG        in MOVEMENTS.EXITFLG%type
                          ,p_INS_TERMINAL   in MOVEMENTS.INS_TERMINAL%type
                          ,p_INS_BORDERPOST in MOVEMENTS.INS_BORDERPOST%type
                          ,p_SOURCE_SYSTEM  in MOVEMENTS.SOURCE_SYSTEM%type default 1
                          ,p_INS_BY         in MOVEMENTS.INS_BY%type default user
                          ) return varchar2;
  --
  --
  --
  function GET_LAST_MOVEMENT_BLOB(p_DOCNO          in BORDERDOCUMENTS.DOCNO%type
                                 ,p_EXPIRYDATE     in BORDERDOCUMENTS.EXPIRYDATE%type
                                 ,p_ISSUECTRY      in BORDERDOCUMENTS.ISSUECTRY%type
                                 ,p_TYPE           in varchar2
                                 ,p_INS_BORDERPOST in MOVEMENT_ATTR.INS_BORDERPOST%type default null
                                  --
                                  ) return blob;
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
  function Get_Last_Movement(p_DOCNO          in BORDERDOCUMENTS.DOCNO%type
                            ,p_ISSUECTRY      in BORDERDOCUMENTS.ISSUECTRY%type
                            ,p_EXPIRYDATE     in BORDERDOCUMENTS.EXPIRYDATE%type
                            ,p_VALUE          in varchar2
                            ,p_EXITFLG        in MOVEMENTS.EXITFLG%type default null
                            ) return varchar2;
  --
  function Get_Last_Bio_Movement(p_DOCNO          in BORDERDOCUMENTS.DOCNO%type
                                ,p_ISSUECTRY      in BORDERDOCUMENTS.ISSUECTRY%type
                                ,p_EXPIRYDATE     in BORDERDOCUMENTS.EXPIRYDATE%type
                                ,p_VALUE          in varchar2
                                ,p_EXITFLG        in MOVEMENTS.EXITFLG%type default null
                                ) return varchar2;
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
                                   ) return last_movement_info_rec_typ;
  --
  procedure Load_Visa_Data_On_Departure(p_DOCNO          in BORDERDOCUMENTS.DOCNO%type
                                       ,p_TRANSPORT_MODE in DL_COMMON.TRANS_MODES.NUM_VALUE%type
                                       ,p_NATIONALITY    in BORDERDOCUMENTS.NAT%type
                                       ,p_EXPIRY_DATE     in BORDERDOCUMENTS.EXPIRYDATE%type);

  --
  procedure Load_Data_On_Departure(p_DOCNO          in BORDERDOCUMENTS.DOCNO%type
                                  ,p_ISSUECTRY      in BORDERDOCUMENTS.ISSUECTRY%type
                                  ,p_EXPIRYDATE     in BORDERDOCUMENTS.EXPIRYDATE%type
                                  ,p_GENDER         in BORDERDOCUMENTS.SEX%type
                                  ,p_DOB            in VARCHAR2
                                  ,p_SURNAME        in BORDERDOCUMENTS.SURNAME%type
                                  ,p_GIVENNAME      in BORDERDOCUMENTS.GIVENNAME%type
                                  ,p_MIDDLENAME     in BORDERDOCUMENTS.MIDDLENAME%type
                                  ,p_NATIONALITY    in BORDERDOCUMENTS.NAT%type default null);
  --
  procedure Load_Entry_Form_On_Departure(p_DOCNO          in BORDERDOCUMENTS.DOCNO%type
                                        ,p_TRANSPORT_MODE in DL_COMMON.TRANS_MODES.NUM_VALUE%type
                                        ,p_NATIONALITY    in BORDERDOCUMENTS.NAT%type
                                        ,p_EXPIRY_DATE     in BORDERDOCUMENTS.EXPIRYDATE%type);
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
                            );
  --
  procedure Load_Fellow_Passenger(p_MVMNTID          in MOVEMENTS.MVMNTID%type
                                 ,p_EXITFLG          in MOVEMENTS.EXITFLG%type
                                 ,p_DOCNO            in BORDERDOCUMENTS.DOCNO%type
                                 ,p_NATIONALITY      in BORDERDOCUMENTS.NAT%type
                                 ,p_EXPIRY_DATE       in BORDERDOCUMENTS.EXPIRYDATE%type
                                 );
  --
  procedure Save_Fellow_Passanger(p_MVMNTID          in MOVEMENTS.MVMNTID%type
                                 ,p_KEY_VALUE        in apex_application_global.vc_arr2
                                 ,p_RELATION         in apex_application_global.vc_arr2
                                 ,p_LAST_NAME        in apex_application_global.vc_arr2
                                 ,p_FIRST_NAME       in apex_application_global.vc_arr2
                                 ,p_DATE_OF_BIRTH    in apex_application_global.vc_arr2
                                 ,p_SEX              in apex_application_global.vc_arr2
                                -- ,p_NATIONALITY      in apex_application_global.vc_arr2
                                 ,p_SEQ_NO           in apex_application_global.vc_arr2
                                 --
                                 );
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
                                 ,p_DIRECTION               in VEHICLE_DETAILS.MSCS_CARDTYPE%type
                                 ,p_CONVEYANCE_NO           in VEHICLE_DETAILS.MSCS_CONVREGNO%type
                                 ,p_FROM_TO_COUNTRY         in VEHICLE_DETAILS.MSCS_IOCOUNTCD%type
                                 ,p_PORT_NAME               in VEHICLE_DETAILS.MSCS_IOPORTNM%type
                                 ,p_FROM_TO_OTHER_PORT      in VEHICLE_DETAILS.MSCS_IONOTE%type
                                 ,p_FROM_TO_PORT_IN_THAI    in VEHICLE_DETAILS.MSCS_IODEPT%type
                                 ,p_IN_OUT_PORT_IN_THAI     in VEHICLE_DETAILS.MSCS_IODEPTTH%type
                                 );
  --
  /**
   * Checks if the given nationality (icao code) is listed in the country_management table and returns
   * a json object with the information if the landcard (aka Tm6 card) information are needed or not
   * @param p_nationality Nationality that should be checked
   * @param p_direction   Defines the direction (1 = departure, 0 = arrival)
   */
  PROCEDURE check_need_landcard (p_nationality  IN VARCHAR2
                                ,p_direction    IN PLS_INTEGER);

end DL_MOVEMENTHANDLING;

/
