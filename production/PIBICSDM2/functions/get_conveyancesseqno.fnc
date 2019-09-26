CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CONVEYANCESSEQNO" (convseqno_tmp varchar2,flag char) return varchar2 is
enm varchar2(200);
tnm varchar2(200);
tmp varchar2(200);
convcd varchar2(4);
begin
 begin
 select convenm, convtnm,convcd into enm,tnm,convcd  from conveyance where conv_seqno=trim(convseqno_tmp);
 if flag = 'T' then
    tmp := tnm;
 elsif flag = 'E' then
    tmp := enm;
elsif flag = 'S' then
    tmp := convcd;     
 else tmp := tnm;
 end if;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
