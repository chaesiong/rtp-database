CREATE OR REPLACE EDITIONABLE PACKAGE BODY "JASPER_REPORTING"."XLIB_LOG" 
IS
/*=========================================================================
   FILE  :  $Id: xlib_log.pkb 56 2013-05-13 07:06:46Z dietmar.aust $
=========================================================================*/

   PROCEDURE m (
      p_module      IN   VARCHAR2,
      p_msg         IN   VARCHAR2,
      p_type    IN   VARCHAR2 DEFAULT 'DEBUG',
      p_level   IN   PLS_INTEGER DEFAULT 15
   )
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;
   BEGIN
      INSERT INTO xlib_logs
                  (log_module, log_msg, log_type, log_level, log_created_on, log_created_by
                  )
           values (   substr(p_module,1,100)
                    , substr(p_msg,1,4000)
                    , substr(p_type,1,20)
                    , p_level
                    , sysdate
                    , substr(nvl(v('APP_USER'), user),1,100)
                  );
      COMMIT;
   END;
END;
/
  GRANT EXECUTE ON "JASPER_REPORTING"."XLIB_LOG" TO "DL_BORDERCONTROL";
