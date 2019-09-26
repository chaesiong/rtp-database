CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PLACETYPEBYCODE" (CODE_PT Number) return varchar2 is
tmp varchar2(200);
begin
    begin
    select pt_name into tmp from PLACE_TYPE where pt_code=CODE_PT;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
