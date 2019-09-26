CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_NATIONSBYSEQ" (countseqno_tmp Number, flag char) return varchar2 is
enm varchar2(200);
tnm varchar2(200);
tmp varchar2(200);
countcd varchar2(4);
begin
    begin
    select nationenm, nationtnm,countcd into enm,tnm,countcd  from country where count_seqno=countseqno_tmp;
    if flag = 'T' then
       tmp := tnm;
    elsif flag = 'E' then
       tmp := enm;
    elsif flag = 'S' then
       tmp := countcd;       
    else tmp := tnm;
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
