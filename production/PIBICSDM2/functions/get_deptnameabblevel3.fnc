CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTNAMEABBLEVEL3" (deptseqno_tmp Number, flag varchar2) return varchar2 is
enm varchar2(200);
tnm varchar2(200);
tmp varchar2(200);
begin
 begin
   select ABBRNM, ABBRNM into enm, tnm from department where dept_seqno=deptseqno_tmp and deptlevel=3; 
    if flag = 'T' then
        tmp := tnm;
    elsif flag = 'E' then
        tmp := enm;
    else tmp := tnm;
    end if;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
