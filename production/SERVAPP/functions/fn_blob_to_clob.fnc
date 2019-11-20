CREATE OR REPLACE EDITIONABLE FUNCTION "SERVAPP"."FN_BLOB_TO_CLOB" 
(
  P_BLOB IN BLOB 
) RETURN CLOB AS 
BEGIN
if P_BLOB is null then
  RETURN NULL;
else 
    if length(P_BLOB) >0 then
    RETURN apex_web_service.blob2clobbase64(P_BLOB);
    else 
    RETURN NULL;
    end if;
end if;
END FN_BLOB_TO_CLOB;

/
  GRANT EXECUTE ON "SERVAPP"."FN_BLOB_TO_CLOB" TO "BIOSAADM";
