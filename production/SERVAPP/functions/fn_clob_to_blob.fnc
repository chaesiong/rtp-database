CREATE OR REPLACE EDITIONABLE FUNCTION "SERVAPP"."FN_CLOB_TO_BLOB" 
(
  P_CLOB IN CLOB 
) RETURN BLOB AS 
BEGIN
if P_CLOB is null or LOWER(P_CLOB) ='null' or P_CLOB='' then
  RETURN NULL;
  else
   if length(P_CLOB) >0 then
  return APEX_WEB_SERVICE.CLOBBASE642BLOB(P_CLOB);
  else 
  return null;
  end if;
  end if;
END FN_CLOB_TO_BLOB;

/