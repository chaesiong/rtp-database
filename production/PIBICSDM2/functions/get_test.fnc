CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_TEST" return varchar2 is
tmp varchar2(200);
begin
    begin
    select amp_desc into tmp from ampur;
    Exception When No_Data_Found Then Null ;
    end;
  return 'is null';
end;
/
