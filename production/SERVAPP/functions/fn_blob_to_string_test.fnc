CREATE OR REPLACE EDITIONABLE FUNCTION "SERVAPP"."FN_BLOB_TO_STRING_TEST" (B BLOB) 
return clob is 
c clob;
n number;
begin 
if (b is null) then 
return null;
end if;
if (length(b)=0) then
return empty_clob(); 
end if;
return null;
end;

/
