CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_COUNTCD" (countseqno_tmp varchar2) return varchar2 is 
tnm varchar2(200);
tmp varchar2(200);
begin
    begin
    select countcd into tnm  from country where count_seqno=trim(countseqno_tmp) ;
    tmp := tnm;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
