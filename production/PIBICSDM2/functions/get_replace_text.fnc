CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_REPLACE_TEXT" (text varchar2) return varchar2 is
tmp varchar2(3000);
begin
    begin
        tmp := '';
    if text is not NULL then
       tmp := REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(text, '<p>', '') , '</p>', '')  , '&', '')  , 'nbsp;', ' ')  , '<br />', '') , '<br>', '')  , '<strong>', '')   , '</strong>', '')  ;
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_REPLACE_TEXT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_REPLACE_TEXT" TO "BIOSAADM";
