CREATE OR REPLACE EDITIONABLE TYPE "DL_BORDERCONTROL"."T_HOOK_PAYLOAD" AS OBJECT
(obj_version   VARCHAR2(10 CHAR)
,obj_input     CLOB);
/

  GRANT EXECUTE ON "DL_BORDERCONTROL"."T_HOOK_PAYLOAD" TO "DL_INTERFACE";
