CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPARTMENTS" (deptcd_tmp varchar2,flag char) return varchar2 is
enm varchar2(200);
tnm varchar2(200);
tmpseqno number(4);
tmp varchar2(200);
begin
 begin
select deptenm,depttnm, dept_seqno into enm,tnm, tmpseqno from department where deptcd=trim(deptcd_tmp);
 if flag = 'T' then
    tmp := tnm;
    if(tmpseqno in (92, 93, 94 , 95, 96)) then
         tmp := tmp || ' ตม.ทอ.สุวรรณภูมิ';
    end if;
 elsif flag = 'E' then
    tmp := enm;
 else tmp := tnm;
 end if;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
