CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTABBFMT3BYDEPTCD" (v_deptcd varchar2) return varchar2 is
nm varchar2(500);
begin
    begin
    select DEPTABBFMT3 into nm  from department where deptcd = v_deptcd;   
    Exception When No_Data_Found Then Null ;
    end;
  return nm;
end;
/
