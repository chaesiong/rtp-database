CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTVIEWLEVEL2" (deptseqno_tmp number) return number is
tmp number(10);
tmplevel number(10);
relcd number(4);
begin
    begin
        select dld into tmplevel from departmentlevel where deptseq=deptseqno_tmp;        
        if tmplevel = 1 then 
            select deptlevel into  tmp from departmentlevel where deptseq=2 and dld=1;             
        elsif tmplevel = 2 then
            select deptlevel into tmp from departmentlevel where deptseq=deptseqno_tmp and dld=2; 
        else
            select rel_code into relcd from departmentlevel where deptseq = deptseqno_tmp;
            select deptlevel into tmp from departmentlevel where deptseq=relcd and dld=2;
        end if; 
exception when no_data_found then null ;
end;
    return tmp;
end;
/
