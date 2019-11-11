CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_COMMON"."PKG_APEX_UTIL" AS

    FUNCTION IS_CURRENT_PAGE(i_pageid NUMBER,i_app_alias VARCHAR2, i_current_pageid NUMBER, i_current_applicationid NUMBER) return VARCHAR2 AS
        l_found NUMBER;
        l_application_id NUMBER;
    BEGIN

        SELECT APPLICATION_ID INTO l_application_id FROM APEX_APPLICATIONS WHERE ALIAS = i_app_alias;

        IF i_pageid = i_current_pageid AND l_application_id = i_current_applicationid then
            return 'Y';
        ELSE
            SELECT
                count(*) INTO l_found
            FROM
                DL_COMMON.APEX_MENU
            WHERE
                PAGE_ID = i_pageid AND
                APP_ALIAS = i_app_alias AND
                instr(',' || CHILD_PAGES || ',',',' || i_current_pageid || ',',1) != 0;


            IF l_found > 0 then
                return 'Y';
            END IF;

        END IF;

        return 'N';

    END IS_CURRENT_PAGE;


  -- START: f_user_has_other_sessions - Function returns number of other User Sessions ******************************************************************
    function f_user_has_other_sessions return number as

      /*******************************************************************************
      * Author    Date        Description
      * --------  ----------  -------------------------------------------------------*
      * MLanger   22.02.2019  Initial
      *
      * Description:
      * Function returns the number of session of curret user
      *
      *******************************************************************************/

      -- Variables
        l_cnt number;
        l_user varchar2( 100 char );
        l_workspace varchar2( 100 char );
        l_session_id number := apex_custom_auth.get_session_id;                        -- Id of current User Session
        l_session_created date;                                                        -- Start Date/Time of current User Session

      -- Logger
        l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.f_user_has_other_sessions';
        l_params logger.tab_param;
        -- logger.append_param(l_params, '', null);
    begin

      logger.append_param(l_params, 'Current Session ID', l_session_id);

      -- Get Workspace Name
        select workspace into l_workspace from apex_applications where application_id = v('APP_ID');
        logger.append_param(l_params, 'APP_ID', v('APP_ID'));
        logger.append_param(l_params, 'l_workspace', l_workspace);
        logger.log('START', l_scope, null, l_params);

      -- Get Values of current user session
        select  user_name
                , session_created
          into  l_user
                , l_session_created
        from    apex_workspace_sessions
        where   workspace_name = l_workspace
                and apex_session_id = l_session_id
                and user_name is not null
        ;


      -- if User Name is nobody then exit with 0
      -- if User Name is BIO_TEST/BIO_USER then allow multiple logins (move this option to users table)
        if l_user IN ('NOBODY', 'BIO_TEST', 'BIO_USER') then
            return 0;
        end if;


      -- Get Number of other session of current user
        select  count(*) into l_cnt
        from    v_apex_sessions
        where   user_name = l_user
                and workspace_name = l_workspace
                and apex_session_id != l_session_id
                and workspace_user_id is null
        ;


      -- End of Function
        logger.log('END', l_scope, null, l_params);
        return l_cnt;


      -- Exception handler ******************************************************************************************************
        exception
          when no_data_found then
              return 0;

          when others then
              logger.log_error('ERROR', l_scope, null, l_params);
              rollback;
              raise;


    end;
  -- END: f_user_has_other_sessions - Function returns false when user has others Sessions and true if not ********************************************************************




  -- START: prc_kill_apex_session - procedure kills the specified APEX Session (not Oracle Session) ***************************************************************************
    procedure prc_kill_apex_session ( p_apex_session_id number ) as

      /*******************************************************************************
      * Author    Date        Description
      * --------  ----------  -------------------------------------------------------*
      * MLanger   22.02.2019  Initial
      *
      * Description:
      * procedure kills the specified APEX Session (not Oracle Session)
      *
      *******************************************************************************/

      -- Varaibales
        l_cnt number;


      -- Logger
        l_scope logger_logs.scope%type := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit) || '.prc_kill_apex_session';
        l_params logger.tab_param;
        -- logger.append_param(l_params, '', null);
    begin


      -- Logging
        logger.append_param(l_params, 'P_APEX_SESSION_ID', p_apex_session_id);
        logger.append_param(l_params, 'APP_ID', v('APP_ID'));


      -- Kill the specified Apex Session
        apex_050100.wwv_flow_session.delete_session( p_apex_session_id );

        l_cnt := sql%rowcount;
        logger.log(l_cnt || ' Session (' || p_apex_session_id || ') successful deleted.', l_scope, null, l_params);
        commit;


      -- Exception handler ******************************************************************************************************
        exception when others then
              logger.log_error('ERROR', l_scope, null, l_params);
              rollback;
              raise;

    end;
  -- END: prc_kill_apex_session - procedure kills the specified APEX Session (not Oracle Session) *****************************************************************************
  --
  /*******************************************************************************
   * Author    Date        Description
   * --------  ----------  -------------------------------------------------------*
   * MStephan  17.06.2019  Safely create an empty APEX collection without ORA-00001
   *******************************************************************************/
  PROCEDURE create_empty_collection(p_collection_name varchar2)
  IS
  BEGIN
    IF APEX_COLLECTION.COLLECTION_EXISTS( p_collection_name ) THEN
      APEX_COLLECTION.TRUNCATE_COLLECTION( p_collection_name );
    ELSE
      APEX_COLLECTION.CREATE_COLLECTION( p_collection_name );
    END IF;
  END create_empty_collection;
  --

END PKG_APEX_UTIL;
/
  GRANT EXECUTE ON "DL_COMMON"."PKG_APEX_UTIL" TO PUBLIC;
  GRANT EXECUTE ON "DL_COMMON"."PKG_APEX_UTIL" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_COMMON"."PKG_APEX_UTIL" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_COMMON"."PKG_APEX_UTIL" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_COMMON"."PKG_APEX_UTIL" TO "BIOSAADM";
