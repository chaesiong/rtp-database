CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTABBLEVEL2" (deptseqno_tmp Number, flag varchar2) return varchar2 is
enm varchar2(200);
tnm varchar2(200);
tmp varchar2(200);
tmplevel Number(1);
relcd Number(4);
begin
 begin
 select deptlevel into tmplevel from department where dept_seqno=deptseqno_tmp;
 if tmplevel = 2 then
   select abbrnm, abbrnm into enm, tnm from department where dept_seqno=deptseqno_tmp and deptlevel=2; 
else
   select rel_code into relcd from department where dept_seqno = deptseqno_tmp;
   select abbrnm, abbrnm into enm, tnm from department where dept_seqno=relcd and deptlevel=2;
end if; 
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
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTABBLEVEL2" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTABBLEVEL2" TO "BIOSAADM";
