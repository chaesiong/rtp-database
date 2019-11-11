CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."XLIB_LOG" IS
/*=========================================================================
   FILE  :  $Id: xlib_log.pkb 56 2013-05-13 07:06:46Z dietmar.aust $
=========================================================================*/

    PROCEDURE m (
        p_module   IN VARCHAR2,
        p_msg      IN VARCHAR2,
        p_type     IN VARCHAR2 DEFAULT 'DEBUG',
        p_level    IN PLS_INTEGER DEFAULT 15
    ) IS
        PRAGMA autonomous_transaction;
    BEGIN
        INSERT INTO xlib_logs (
            log_module,
            log_msg,
            log_type,
            log_level,
            log_created_on,
            log_created_by
        ) VALUES (
            substr(p_module,1,100),
            substr(p_msg,1,4000),
            substr(p_type,1,20),
            p_level,
            SYSDATE,
            substr(nvl(v('APP_USER'),user),1,100)
        );

        COMMIT;
    END;

END;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."XLIB_LOG" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."XLIB_LOG" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."XLIB_LOG" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."XLIB_LOG" TO "BIOSAADM";
