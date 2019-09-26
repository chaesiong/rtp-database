CREATE OR REPLACE EDITIONABLE PROCEDURE "JASPER_REPORTING"."XLOG" (
   p_module   IN   VARCHAR2,
   p_msg      IN   VARCHAR2,
   p_type     IN   VARCHAR2 DEFAULT 'DEBUG',
   p_level         PLS_INTEGER DEFAULT 15
)
IS
BEGIN
   xlib_log.m (p_module      => p_module,
                       p_msg         => p_msg,
                       p_type        => p_type,
                       p_level       => p_level
                      );
END xlog;
/
