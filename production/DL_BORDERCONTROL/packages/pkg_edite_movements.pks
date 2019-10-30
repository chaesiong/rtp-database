CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_EDITE_MOVEMENTS" AS
    /***************************************************************************************
    * This package provides a service for editing Movements which where allready saved
    *
    *
    * Author    Date        Description
    * --------  ----------  ---------------------------------------------------------------*
    * CFunke   10.10.2018  Initial Release
    ***************************************************************************************/

  PROCEDURE save_changes(
                         i_MVMNTID              in DL_BORDERCONTROL.MOVEMENTS.MVMNTID%type
                        ,i_BRDDOCID             in DL_BORDERCONTROL.MOVEMENTS.BRDDOCID%type
                        ,i_EXITFLG              in DL_BORDERCONTROL.MOVEMENTS.EXITFLG%type
                        ,i_MAX_STAY_DT          in DL_BORDERCONTROL.MOVEMENTS.MAX_STAY_DT%type
                        ,i_INS_TERMINAL         in DL_BORDERCONTROL.MOVEMENTS.INS_TERMINAL%type
                        ,i_INS_BORDERPOST       in DL_BORDERCONTROL.MOVEMENTS.INS_BORDERPOST%type
                        ,i_TRNSPRTUNITID        in DL_BORDERCONTROL.MOVEMENTS.TRNSPRTUNITID%type
                        ,i_PERSON_TYPE          in DL_BORDERCONTROL.MOVEMENTS.PERSON_TYPE%type
                        ,i_SCANNED_FLIGHT       in DL_BORDERCONTROL.MOVEMENTS.SCANNED_FLIGHT%type
                        ,i_PS_3                 in DL_BORDERCONTROL.MOVEMENTS.PS_3%type
                        ,i_PS_4                 in DL_BORDERCONTROL.MOVEMENTS.PS_4%type
                        ,i_VISA_TYPE            in DL_BORDERCONTROL.MOVEMENTS.VISA_TYPE%type
                        ,i_VISA                 in DL_BORDERCONTROL.MOVEMENTS.VISA%type
                        ,i_ENTRY_FORM           in DL_BORDERCONTROL.MOVEMENTS.ENTRY_FORM%type
                        ,i_DATE_OF_ENTRY        in varchar2
                        ,i_SOURCE_SYSTEM        in varchar2
                        ,i_DOCTYPE              in DL_BORDERCONTROL.BORDERDOCUMENTS.DOCTYPE%type
                        ,i_DOCNO                in DL_BORDERCONTROL.BORDERDOCUMENTS.DOCNO%type
                        ,i_ISSUECTRY            in DL_BORDERCONTROL.BORDERDOCUMENTS.ISSUECTRY%type
                        ,i_NAT                  in DL_BORDERCONTROL.BORDERDOCUMENTS.NAT%type
                        ,i_DOB                  in DL_BORDERCONTROL.BORDERDOCUMENTS.DOB%type
                        ,i_EXPIRYDATE           in DL_BORDERCONTROL.BORDERDOCUMENTS.EXPIRYDATE%type
                        ,i_GIVENNAME            in DL_BORDERCONTROL.BORDERDOCUMENTS.GIVENNAME%type
                        ,i_SURNAME              in DL_BORDERCONTROL.BORDERDOCUMENTS.SURNAME%type
                        ,i_MIDDLENAME           in DL_BORDERCONTROL.BORDERDOCUMENTS.MIDDLENAME%type
                        ,i_GIVENNAME_THAI       in DL_BORDERCONTROL.BORDERDOCUMENTS.GIVENNAME_THAI%type
                        ,i_MIDDLENAME_THAI      in DL_BORDERCONTROL.BORDERDOCUMENTS.MIDDLENAME_THAI%type
                        ,i_SURNAME_THAI         in DL_BORDERCONTROL.BORDERDOCUMENTS.SURNAME_THAI%type
                        ,i_CALC_DOB             in DL_BORDERCONTROL.BORDERDOCUMENTS.CALC_DOB%type
                        ,i_MANUAL_PLACEOFBIRTH  in DL_BORDERCONTROL.BORDERDOCUMENTS.MANUAL_PLACEOFBIRTH%type
                        ,i_SEX                  in DL_BORDERCONTROL.BORDERDOCUMENTS.SEX%type
                        ,i_DOCCLASS             in DL_BORDERCONTROL.BORDERDOCUMENTS.DOCCLASS%type
                        ,i_SUB_NATIONALITY      in DL_BORDERCONTROL.BORDERDOCUMENTS.SUB_NATIONALITY%type
                        ,i_FORM_NO              in DL_BORDERCONTROL.ENTRY_FORMS.FORM_NO%type
                        ,i_PROVINCE             in DL_BORDERCONTROL.ENTRY_FORMS.PROVINCE%type
                        ,i_DISTRICT             in DL_BORDERCONTROL.ENTRY_FORMS.DISTRICT%type
                        ,i_SUBDISTRICT          in DL_BORDERCONTROL.ENTRY_FORMS.SUBDISTRICT%type
                        ,i_ADDRESS              in DL_BORDERCONTROL.ENTRY_FORMS.ADDRESS%type
                        ,i_NOTE                 in DL_BORDERCONTROL.ENTRY_FORMS.NOTE%type
                        );
                        
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * MSCS      17.12.2018  edit_last_movement_info
  *******************************************************************************/
  --
    PROCEDURE edit_last_movement_info
    (
                            p_MVMNTID                   in DL_BORDERCONTROL.MOVEMENTS.MVMNTID%type
                            ,p_EXITFLG                  in DL_BORDERCONTROL.MOVEMENTS.EXITFLG%type
                            ,p_MAX_STAY_DT              in DL_BORDERCONTROL.MOVEMENTS.MAX_STAY_DT%type
                            ,p_TRNSPRTUNITID            in DL_BORDERCONTROL.MOVEMENTS.TRNSPRTUNITID%type
                            ,p_PERSON_TYPE              in DL_BORDERCONTROL.MOVEMENTS.PERSON_TYPE%type
                            ,p_SCANNED_FLIGHT           in DL_BORDERCONTROL.MOVEMENTS.SCANNED_FLIGHT%type
                            ,p_VISA_TYPE                in DL_BORDERCONTROL.VISAS.VISA_TYPE%type
                            ,p_VISA_NUMBER              in DL_BORDERCONTROL.VISAS.VISA_NUMBER%type
                            ,p_VISA_EXPIRY_DATE         in DL_BORDERCONTROL.VISAS.EXPIRY_DATE%type
                            ,p_PERMIT_TYPE              in DL_BORDERCONTROL.VISAS.PERMIT_TYPE%type
                            ,p_PERMIT_EXPIRY_DATE       in DL_BORDERCONTROL.VISAS.PERMIT_EXPIRY_DATE%type
                            ,p_DOCTYPE                  in DL_BORDERCONTROL.BORDERDOCUMENTS.DOCTYPE%type
                            ,p_DOCCLASS                 in DL_BORDERCONTROL.BORDERDOCUMENTS.DOCCLASS%type
                            ,p_GIVENNAME                in DL_BORDERCONTROL.BORDERDOCUMENTS.GIVENNAME%type
                            ,p_SURNAME                  in DL_BORDERCONTROL.BORDERDOCUMENTS.SURNAME%type
                            ,p_MIDDLENAME               in DL_BORDERCONTROL.BORDERDOCUMENTS.MIDDLENAME%type
                            ,p_SEX                      in DL_BORDERCONTROL.BORDERDOCUMENTS.SEX%type
                            ,p_DOB                      in DL_BORDERCONTROL.BORDERDOCUMENTS.DOB%type
                            ,p_SUB_NATIONALITY          in DL_BORDERCONTROL.BORDERDOCUMENTS.SUB_NATIONALITY%type
                            ,p_ENTRY_FORM_NO            in DL_BORDERCONTROL.ENTRY_FORMS.FORM_NO%type
                            ,p_PROVINCE                 in DL_BORDERCONTROL.ENTRY_FORMS.PROVINCE%type
                            ,p_DISTRICT                 in DL_BORDERCONTROL.ENTRY_FORMS.DISTRICT%type
                            ,p_SUBDISTRICT              in DL_BORDERCONTROL.ENTRY_FORMS.SUBDISTRICT%type
                            ,p_ADDRESS                  in DL_BORDERCONTROL.ENTRY_FORMS.ADDRESS%type
                            ,p_NOTE                     in DL_BORDERCONTROL.ENTRY_FORMS.NOTE%type
                            ,p_MVMNT_MANUAL_UPDATE_NOTE in DL_BORDERCONTROL.MSCS_MOVEMENTS_MANUAL_UPDATE.NOTE%type
                            ,p_STATELESS                in DL_BORDERCONTROL.BORDERDOCUMENTS.NAT%type default null
                            ,p_PERSON                   in DL_BORDERCONTROL.PERSON.KEY_VALUE%type default null
    );
    
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * MSCS      01.05.2019  delete_movement
  *******************************************************************************/
  --
    PROCEDURE delete_movement
    (
        p_MVMNTID                   in DL_BORDERCONTROL.MOVEMENTS.MVMNTID%type
        ,p_MVMNT_MANUAL_UPDATE_NOTE in DL_BORDERCONTROL.MSCS_MOVEMENTS_MANUAL_UPDATE.NOTE%type
    );
    
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * MSCS      17.07.2019  offload_movement
  *******************************************************************************/
  --
    PROCEDURE offload_movement
    (
        p_MVMNTID                   in DL_BORDERCONTROL.MOVEMENTS.MVMNTID%type
        ,p_MVMNT_MANUAL_UPDATE_NOTE in DL_BORDERCONTROL.MSCS_MOVEMENTS_MANUAL_UPDATE.NOTE%type
    );
    
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * MSCS      17.07.2019  offload_movements
  *******************************************************************************/
  --
    PROCEDURE offload_movements
    (
        p_COLL_NAME                 in VARCHAR2
        ,p_MVMNT_MANUAL_UPDATE_NOTE in DL_BORDERCONTROL.MSCS_MOVEMENTS_MANUAL_UPDATE.NOTE%type
    );

end;
/
