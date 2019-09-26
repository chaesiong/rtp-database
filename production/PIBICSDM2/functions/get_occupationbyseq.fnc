CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_OCCUPATIONBYSEQ" (occseqno_tmp Number, flag char) return varchar2 is
enm varchar2(200);
tnm varchar2(200);
tmp varchar2(200);
cnm varchar2(200);
begin
    begin
    select occenm, occtnm,occcd into enm,tnm,cnm  from occupation where occ_seqno=occseqno_tmp;
    if flag = 'T' then
       tmp := tnm;
    elsif flag = 'E' then
       tmp := enm;
   elsif flag = 'C' then
        tmp := cnm;
    else tmp := tnm;
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
