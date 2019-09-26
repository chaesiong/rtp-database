CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PLACESUBTYPE" (SEQNO_PS Number) return varchar2 is
tmp varchar2(200);
begin
    begin
    select ps_name into tmp from place_subtype where ps_seqno=SEQNO_PS;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
