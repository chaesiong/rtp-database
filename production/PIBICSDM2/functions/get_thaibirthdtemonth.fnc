CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_THAIBIRTHDTEMONTH" (BIRTHDTE varchar2) return varchar2 is
tmp varchar2(100);
begin
    begin       
    if length(BIRTHDTE) = 10 then
       tmp := substr(BIRTHDTE,1,2)||' '|| GET_THAIMONTH (substr(BIRTHDTE,4,2))||' '||(to_number(substr(BIRTHDTE,7,4))+543);
    elsif length(BIRTHDTE) = 8 then
      tmp := GET_THAIMONTH (substr(BIRTHDTE,4,2))||' '||(to_number(substr(BIRTHDTE,7,4))+543);
     elsif length(BIRTHDTE) = 4 then
      tmp := to_number(substr(BIRTHDTE,7,4))+543;  
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_THAIBIRTHDTEMONTH" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_THAIBIRTHDTEMONTH" TO "BIOSAADM";
