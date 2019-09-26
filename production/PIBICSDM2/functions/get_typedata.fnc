CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_TYPEDATA" (TYPE_TMP varchar2) return varchar2 is
tmp varchar2(200);
begin
    begin
    select typedesc into tmp  from TYPEDATDDESC where typecd = TYPE_TMP;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
