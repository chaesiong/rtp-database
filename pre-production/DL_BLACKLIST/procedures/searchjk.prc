CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_BLACKLIST"."SEARCHJK" 
(P_MOVEMENTID IN VARCHAR2)IS
BEGIN 

  SELECT P_MOVEMENTID FROM DUAL;
END SearchJK;
/
  GRANT EXECUTE ON "DL_BLACKLIST"."SEARCHJK" TO "DERMALOG_PROXY";