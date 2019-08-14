CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_EDITE_MOVEMENTS" AS
    /***************************************************************************************
    * This package provides a service for editing Movements which where already saved
    *
    *
    * Author    Date        Description
    * --------  ----------  ---------------------------------------------------------------*
    * CFunke   10.10.2018  Initial Release
    ***************************************************************************************/

  c_scope_prefix         CONSTANT VARCHAR2(31) := lower($$plsql_unit) || '.';
  
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
                        ) IS
  BEGIN

    update DL_BORDERCONTROL.MOVEMENTS
    set BRDDOCID = i_BRDDOCID
       ,EXITFLG = i_EXITFLG
       ,MAX_STAY_DT = i_MAX_STAY_DT
       ,TRNSPRTUNITID = i_TRNSPRTUNITID
       ,PERSON_TYPE = i_PERSON_TYPE
       ,SCANNED_FLIGHT = i_SCANNED_FLIGHT
       ,PS_3 = i_PS_3
       ,PS_4 = i_PS_4
       ,VISA_TYPE = i_VISA_TYPE
       ,VISA = i_VISA
       ,ENTRY_FORM = i_ENTRY_FORM
       ,DATE_OF_ENTRY = to_timestamp(i_DATE_OF_ENTRY, 'DD-MON-YYYY HH24:MI:SS')
       ,SOURCE_SYSTEM = decode(i_SOURCE_SYSTEM, 'BIO', 1, 'PIB', 2, 'ATC', 3, 'N/A', -999, 'N/A')
    where MVMNTID = i_MVMNTID;

    update DL_BORDERCONTROL.BORDERDOCUMENTS
    set DOCTYPE = i_DOCTYPE
       ,DOCNO = i_DOCNO
       ,ISSUECTRY = i_ISSUECTRY
       ,NAT = i_NAT
       ,DOB = to_char(to_date(i_CALC_DOB, 'DD.MM.YYYY'), 'YYMMDD')
       ,EXPIRYDATE = i_EXPIRYDATE
       ,GIVENNAME = i_GIVENNAME
       ,SURNAME = i_SURNAME
       ,MIDDLENAME = i_MIDDLENAME
       ,GIVENNAME_THAI = i_GIVENNAME_THAI
       ,MIDDLENAME_THAI = i_MIDDLENAME_THAI
       ,SURNAME_THAI = i_SURNAME_THAI
       --,CALC_DOB = i_CALC_DOB
       ,MANUAL_PLACEOFBIRTH = i_MANUAL_PLACEOFBIRTH
       ,SEX = i_SEX
       ,DOCCLASS = i_DOCCLASS
       ,SUB_NATIONALITY = i_SUB_NATIONALITY
    where BRDDOCID = i_BRDDOCID;


    update DL_BORDERCONTROL.ENTRY_FORMS
    set PROVINCE = i_PROVINCE
       ,DISTRICT = i_DISTRICT
       ,SUBDISTRICT = i_SUBDISTRICT
       ,ADDRESS = i_ADDRESS
       ,NOTE = i_NOTE
    where FORM_NO = i_FORM_NO;

    commit;
  END;
  
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
    ) IS
        
        l_scope                 logger_logs.scope%type := c_scope_prefix || 'edit_last_movement_info';
        l_params                logger.tab_param;
        
        l_mvmnt_exists          VARCHAR2(1) := 'N';        
        l_brddocid              dl_bordercontrol.borderdocuments.brddocid%TYPE;
        l_exitflg               dl_bordercontrol.movements.exitflg%TYPE;
        l_visa_key_value        dl_bordercontrol.movements.visa%TYPE;
        l_entry_form_key_value  dl_bordercontrol.movements.entry_form%TYPE;
        
        e_mvmnt_does_not_exist  EXCEPTION;
        
    BEGIN
        
        -- this proc needs to be re-written properly
        
        logger.log('P17 - pkg_edite_movements.edit_last_movement_info: start', l_scope, null, l_params);
        logger.append_param(l_params, 'p_MVMNTID', p_MVMNTID);
        logger.append_param(l_params, 'p_EXITFLG', p_EXITFLG);
        
        -- check if the movement exists
        SELECT 
            CASE WHEN EXISTS
            (
                SELECT NULL
                FROM dl_bordercontrol.movements
                WHERE mvmntid = p_MVMNTID
            )
            THEN 'Y'
            ELSE 'N'
            END
            INTO l_mvmnt_exists
        FROM DUAL;
        
        IF NVL(l_mvmnt_exists, 'N') = 'N' THEN
            RAISE e_mvmnt_does_not_exist;
        END IF;
        
        -- get brddocid, exitflg, visa, entry_form
        SELECT brddocid, exitflg, visa, entry_form
        INTO l_brddocid, l_exitflg, l_visa_key_value, l_entry_form_key_value
        FROM dl_bordercontrol.v_edit_movements
        WHERE mvmntid = p_MVMNTID;
        
        IF l_brddocid IS NOT NULL THEN
            UPDATE dl_bordercontrol.borderdocuments SET 
                givenname            = p_GIVENNAME
                ,surname             = p_SURNAME
                ,middlename          = p_MIDDLENAME
                ,sex                 = p_SEX
                ,dob                 = p_DOB
                ,dob_partial         = dl_bordercontrol.pkg_common.Get_Partial_Date(p_DOB, 1, 0, 0, 1)
                ,nat                 = NVL(p_STATELESS, issuectry)
                ,sub_nationality     = p_SUB_NATIONALITY
            WHERE brddocid = l_brddocid;
        END IF;
        
        IF l_visa_key_value IS NOT NULL THEN
            UPDATE dl_bordercontrol.visas SET 
                visa_type      = p_VISA_TYPE
                ,visa_number   = p_VISA_NUMBER
                ,expiry_date   = p_VISA_EXPIRY_DATE 
                ,permit_type   = p_PERMIT_TYPE
                ,permit_expiry_date = p_PERMIT_EXPIRY_DATE
            WHERE key_value = l_visa_key_value
            AND borderdocument = l_brddocid;
        END IF;
        
        IF l_entry_form_key_value IS NOT NULL THEN
            UPDATE dl_bordercontrol.entry_forms SET 
                form_no      = p_ENTRY_FORM_NO
                ,province    = p_PROVINCE
                ,district    = p_DISTRICT
                ,subdistrict = p_SUBDISTRICT
                ,address     = p_ADDRESS
                ,note        = p_NOTE
            WHERE key_value = l_entry_form_key_value;
        ELSIF p_ENTRY_FORM_NO IS NOT NULL OR p_NOTE IS NOT NULL THEN
            INSERT INTO dl_bordercontrol.entry_forms
            (
                ins_terminal
                ,ins_borderpost
                ,form_no
                ,province
                ,district
                ,subdistrict
                ,address
                ,note
            )
            VALUES
            (
                V('AI_TERMINAL_ID')
                ,V('AI_BORDERPOST_ID')
                ,p_ENTRY_FORM_NO
                ,p_PROVINCE
                ,p_DISTRICT
                ,p_SUBDISTRICT
                ,p_ADDRESS
                ,p_NOTE
            )
            RETURNING key_value INTO l_entry_form_key_value;
        END IF;

        
        UPDATE dl_bordercontrol.movements SET 
            exitflg             = p_EXITFLG
            ,max_stay_dt        = p_MAX_STAY_DT
            ,trnsprtunitid      = p_TRNSPRTUNITID
            ,person_type        = p_PERSON_TYPE
            ,scanned_flight     = p_SCANNED_FLIGHT
            ,visa_type          = p_VISA_TYPE
            ,entry_form         = NVL(entry_form, l_entry_form_key_value)
        WHERE mvmntid = p_MVMNTID
        AND source_system IN (1, 4);        
        
        -- insert movement manual update note
        INSERT INTO DL_BORDERCONTROL.MSCS_MOVEMENTS_MANUAL_UPDATE
        (
            MVMNTID
            , NOTE
            , MOVEMENT_DML_TYPE
            , INS_TERMINAL
            , INS_BORDERPOST
        )
        VALUES
        (
            p_MVMNTID
            , p_MVMNT_MANUAL_UPDATE_NOTE
            , 'U' -- UPDATE
            , V('AI_TERMINAL_ID')
            , V('AI_BORDERPOST_ID')
        );
    
        COMMIT;
        
        logger.log('P17 - pkg_edite_movements.edit_last_movement_info: done', l_scope, null, l_params);
        
        -- call the listener
        IF p_EXITFLG = 2 THEN
            /*
            DL_INTERFACE.PKG_LISTENER.SEND_DEL_BORDERCONTROL_MOVEMENT(
                P_MVMNTID => p_MVMNTID
            );
            */
            dl_bordercontrol.pkg_pibics_hook.set_action_movement(
                p_mvmntid   => p_MVMNTID,
                p_dml_type  => 'D'
            );
        ELSE
            /*
            DL_INTERFACE.PKG_LISTENER.SEND_BORDERCONTROL_MOVEMENT(
                P_MVMNTID => p_MVMNTID,
                P_DML_TYPE => 'U'
            );
            */
            dl_bordercontrol.pkg_pibics_hook.set_action_movement(
                p_mvmntid   => p_MVMNTID,
                p_dml_type  => 'U'
            );
        END IF;
        
    EXCEPTION
        WHEN e_mvmnt_does_not_exist THEN
            logger.log_error('P17 - pkg_edite_movements.edit_last_movement_info: mvmnt does not exist', l_scope, null, l_params);
            RAISE;
        WHEN OTHERS THEN
            logger.log_error('P17 - pkg_edite_movements.edit_last_movement_info: unhandled exeption', l_scope, null, l_params);
            RAISE;
    END edit_last_movement_info;
    
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
    ) IS
    
        l_scope                 logger_logs.scope%type := c_scope_prefix || 'delete_movement';
        l_params                logger.tab_param;
        
        l_mvmnt_exists          VARCHAR2(1) := 'N';        
        l_brddocid              dl_bordercontrol.movements.brddocid%TYPE;
        l_exitflg               dl_bordercontrol.movements.exitflg%TYPE;
        l_visa_key_value        dl_bordercontrol.movements.visa%TYPE;
        l_entry_form_key_value  dl_bordercontrol.movements.entry_form%TYPE;
        
        e_mvmnt_does_not_exist  EXCEPTION;
    
    BEGIN
        
        -- merge with the rest service later if/when available
        
        logger.log('P17 - pkg_edite_movements.delete_movement: start', l_scope, null, l_params);
        logger.append_param(l_params, 'p_MVMNTID', p_MVMNTID);
        
        -- check if the movement exists
        SELECT 
            CASE WHEN EXISTS
            (
                SELECT NULL
                FROM dl_bordercontrol.movements
                WHERE mvmntid = p_MVMNTID
            )
            THEN 'Y'
            ELSE 'N'
            END
            INTO l_mvmnt_exists
        FROM DUAL;
        
        IF NVL(l_mvmnt_exists, 'N') = 'N' THEN
            RAISE e_mvmnt_does_not_exist;
        END IF;
        
        UPDATE dl_bordercontrol.movements SET 
            is_finished         = 'N' -- OR 'D' ??
        WHERE mvmntid = p_MVMNTID
        AND source_system IN (1, 4); 
        
        -- insert movement manual update note
        INSERT INTO DL_BORDERCONTROL.MSCS_MOVEMENTS_MANUAL_UPDATE
        (
            MVMNTID
            , NOTE
            , MOVEMENT_DML_TYPE
            , INS_TERMINAL
            , INS_BORDERPOST
        )
        VALUES
        (
            p_MVMNTID
            , p_MVMNT_MANUAL_UPDATE_NOTE
            , 'D' -- DELETE
            , V('AI_TERMINAL_ID')
            , V('AI_BORDERPOST_ID')
        );
    
        COMMIT;
        
        logger.log('P17 - pkg_edite_movements.delete_movement: done', l_scope, null, l_params);
        
        -- call the listener
        -- use hook instead:
        -- dl_bordercontrol.pkg_pibics_hook.set_action_crew(p_MVMNTID);
        -- dl_bordercontrol.pkg_pibics_hook.set_action_movement(p_MVMNTID);
        /*
        DL_INTERFACE.PKG_LISTENER.SEND_DEL_BORDERCONTROL_MOVEMENT(
            P_MVMNTID => p_MVMNTID
        );
        */
        dl_bordercontrol.pkg_pibics_hook.set_action_movement(
            p_mvmntid   => p_MVMNTID,
            p_dml_type  => 'D'
        );
        
    EXCEPTION
        WHEN e_mvmnt_does_not_exist THEN
            logger.log_error('P17 - pkg_edite_movements.delete_movement: mvmnt does not exist', l_scope, null, l_params);
            RAISE;
        WHEN OTHERS THEN
            logger.log_error('P17 - pkg_edite_movements.delete_movement: unhandled exeption', l_scope, null, l_params);
            RAISE;
    END delete_movement;
    
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
    ) IS
    
        l_scope                 logger_logs.scope%type := c_scope_prefix || 'offload_movement';
        l_params                logger.tab_param;
        
        l_mvmnt_exists          VARCHAR2(1) := 'N';        
        l_brddocid              dl_bordercontrol.movements.brddocid%TYPE;
        l_exitflg               dl_bordercontrol.movements.exitflg%TYPE;
        l_visa_key_value        dl_bordercontrol.movements.visa%TYPE;
        l_entry_form_key_value  dl_bordercontrol.movements.entry_form%TYPE;
        
        e_mvmnt_does_not_exist  EXCEPTION;
    
    BEGIN
        
        -- merge with the rest service later if/when available
        
        logger.log('P17 - pkg_edite_movements.offload_movement: start', l_scope, null, l_params);
        logger.append_param(l_params, 'p_MVMNTID', p_MVMNTID);
        
        -- check if the movement exists
        SELECT 
            CASE WHEN EXISTS
            (
                SELECT NULL
                FROM dl_bordercontrol.movements
                WHERE mvmntid = p_MVMNTID
            )
            THEN 'Y'
            ELSE 'N'
            END
            INTO l_mvmnt_exists
        FROM DUAL;
        
        IF NVL(l_mvmnt_exists, 'N') = 'N' THEN
            RAISE e_mvmnt_does_not_exist;
        END IF;
        
        UPDATE dl_bordercontrol.movements SET 
            exitflg             = 2
        WHERE mvmntid = p_MVMNTID
        AND source_system IN (1, 4); 
        
        -- insert movement manual update note
        INSERT INTO DL_BORDERCONTROL.MSCS_MOVEMENTS_MANUAL_UPDATE
        (
            MVMNTID
            , NOTE
            , MOVEMENT_DML_TYPE
            , INS_TERMINAL
            , INS_BORDERPOST
        )
        VALUES
        (
            p_MVMNTID
            , p_MVMNT_MANUAL_UPDATE_NOTE
            , 'U' -- UPDATE
            , V('AI_TERMINAL_ID')
            , V('AI_BORDERPOST_ID')
        );
    
        COMMIT;
        
        logger.log('P17 - pkg_edite_movements.offload_movement: done', l_scope, null, l_params);
        
        -- call the listener
        -- use hook instead:
        -- dl_bordercontrol.pkg_pibics_hook.set_action_crew(p_MVMNTID);
        -- dl_bordercontrol.pkg_pibics_hook.set_action_movement(p_MVMNTID);
        /*
        DL_INTERFACE.PKG_LISTENER.SEND_DEL_BORDERCONTROL_MOVEMENT(
            P_MVMNTID => p_MVMNTID
        );
        */
        /**/
        dl_bordercontrol.pkg_pibics_hook.set_action_movement(
            p_mvmntid   => p_MVMNTID,
            p_dml_type  => 'D'
        );
        /**/
        
    EXCEPTION
        WHEN e_mvmnt_does_not_exist THEN
            logger.log_error('P17 - pkg_edite_movements.offload_movement: mvmnt does not exist', l_scope, null, l_params);
            RAISE;
        WHEN OTHERS THEN
            logger.log_error('P17 - pkg_edite_movements.offload_movement: unhandled exeption', l_scope, null, l_params);
            RAISE;
    END offload_movement;

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
    ) IS
    
        l_scope                 logger_logs.scope%type := c_scope_prefix || 'offload_movements';
        l_params                logger.tab_param;
        
        l_coll_count            NUMBER := 0;
        l_max_count_allowed     NUMBER := 1000;
        
        l_mvmnt_exists          VARCHAR2(1) := 'N';        
        l_brddocid              dl_bordercontrol.movements.brddocid%TYPE;
        l_exitflg               dl_bordercontrol.movements.exitflg%TYPE;
        l_visa_key_value        dl_bordercontrol.movements.visa%TYPE;
        l_entry_form_key_value  dl_bordercontrol.movements.entry_form%TYPE;
        
        e_invalid_coll          EXCEPTION;
        e_invalid_coll_count            EXCEPTION;
        e_mvmnt_does_not_exist  EXCEPTION;
        e_mvmnt_does_not_exist  EXCEPTION;
    
    BEGIN
        
        -- merge with the rest service later if/when available
        
        logger.append_param(l_params, 'p_COLL_NAME', p_COLL_NAME);
        logger.log('P17 - pkg_edite_movements.offload_movements: start', l_scope, null, l_params);
        
        IF p_COLL_NAME IS NULL OR NOT(APEX_COLLECTION.COLLECTION_EXISTS(p_COLL_NAME)) THEN
            RAISE e_invalid_coll;
        END IF;
        
        l_coll_count := APEX_COLLECTION.COLLECTION_MEMBER_COUNT(p_COLL_NAME);
        logger.append_param(l_params, 'l_coll_count', l_coll_count);
        
        IF l_coll_count = 0 OR l_coll_count > l_max_count_allowed THEN
            RAISE e_invalid_coll_count;
        END IF;
        
        UPDATE dl_bordercontrol.movements SET 
            exitflg   = 2
        WHERE mvmntid IN
        (
            SELECT c001
            FROM apex_collections
            WHERE collection_name = p_COLL_NAME
            AND n001 = 1 
            AND c001 IS NOT NULL
        )
        AND source_system IN (1, 4)
        AND is_finished = 'Y'
        AND exitflg IN (0, 1); 
        
        logger.append_param(l_params, 'No. of movements offloaded', SQL%ROWCOUNT);
        
        -- insert movement manual update note
        INSERT INTO dl_bordercontrol.mscs_movements_manual_update
        (
            mvmntid
            , note
            , movement_dml_type
            , ins_terminal
            , ins_borderpost
        )
        SELECT 
            c001
            , p_MVMNT_MANUAL_UPDATE_NOTE
            , 'U' -- UPDATE
            , V('AI_TERMINAL_ID')
            , V('AI_BORDERPOST_ID')
        FROM apex_collections ac
        WHERE collection_name = p_COLL_NAME
        AND n001 = 1 
        AND c001 IS NOT NULL
        AND EXISTS
        (
            SELECT NULL
            FROM dl_bordercontrol.movements
            WHERE mvmntid = ac.c001
            AND is_finished = 'Y'
            AND exitflg = 2
            AND source_system IN (1, 4)
        )
        ;
    
        COMMIT;
        
        logger.log('P17 - pkg_edite_movements.offload_movements: done', l_scope, null, l_params);
        
        -- call the listener
        -- use hook instead:
        -- dl_bordercontrol.pkg_pibics_hook.set_action_crew(p_MVMNTID);
        -- dl_bordercontrol.pkg_pibics_hook.set_action_movement(p_MVMNTID);
        FOR x IN
        (
            SELECT c001 AS MVMNTID
            FROM apex_collections ac
            WHERE collection_name = p_COLL_NAME
            AND n001 = 1 
            AND c001 IS NOT NULL
            AND EXISTS
            (
                SELECT NULL
                FROM dl_bordercontrol.movements
                WHERE mvmntid = ac.c001
                AND is_finished = 'Y'
                AND exitflg = 2
                AND source_system IN (1, 4)
            )
        )
        LOOP
            dl_bordercontrol.pkg_pibics_hook.set_action_movement(
                p_mvmntid   => x.MVMNTID,
                p_dml_type  => 'D'
            );
        END LOOP;
        
    EXCEPTION
        WHEN e_invalid_coll THEN
            logger.log_error('P17 - pkg_edite_movements.offload_movements: Invalid collection', l_scope, null, l_params);
            RAISE;
        WHEN e_invalid_coll_count THEN
            logger.log_error('P17 - pkg_edite_movements.offload_movements: Empty collection or > ' || l_max_count_allowed, l_scope, null, l_params);
            RAISE;
        WHEN OTHERS THEN
            logger.log_error('P17 - pkg_edite_movements.offload_movements: unhandled exeption', l_scope, null, l_params);
            RAISE;
    END offload_movements;
    
end;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_EDITE_MOVEMENTS" TO "DERMALOG_PROXY";
