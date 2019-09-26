CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTNAME" (deptseqno_tmp Number, flag varchar2) return varchar2 is
enm varchar2(200);
tnm varchar2(200);
tmp varchar2(200);
deptcd varchar2(6);
begin
 begin
   select deptenm,depttnm,deptcd into enm,tnm,deptcd from department where dept_seqno =deptseqno_tmp; 
    if flag = 'T' then
        tmp := tnm;
     elsif flag = 'E' then
        tmp := enm;
     elsif flag = 'S' then
        tmp := deptcd;
     else tmp := tnm;
    end if;   
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
