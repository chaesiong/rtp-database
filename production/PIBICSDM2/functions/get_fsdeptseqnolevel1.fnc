CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FSDEPTSEQNOLEVEL1" (deptseqno_tmp Number, flag varchar2) return varchar2 is
tmp Number;
tmplevel Number(1);
relcd Number(4);
begin
 begin
 select deptlevel into tmplevel from department where dept_seqno=deptseqno_tmp;
 if tmplevel = 1 then
    select dept_seqno into tmp from department where dept_seqno=deptseqno_tmp and deptlevel=1; 
elsif tmplevel =2 then
   select dept_seqno into tmp from department where dept_seqno=(select rel_code from department where dept_seqno = deptseqno_tmp) and deptlevel=1;
    if tmp =3 then
        tmp:=deptseqno_tmp;
    end if;  
elsif  tmplevel=0 then
    tmp:=deptseqno_tmp;
else
   select rel_code into relcd from department where dept_seqno = deptseqno_tmp;
   select dept_seqno into tmp from department where dept_seqno=(select rel_code from department where dept_seqno = relcd) and deptlevel=1;
   
    if tmp =3 then
         tmp :=  relcd;    
    end if;
   
end if; 
if flag = 'RELCODE' then
    tmp:=null;
     select rel_code into tmp from department where rel_code >1 and dept_seqno = deptseqno_tmp;
end if;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_FSDEPTSEQNOLEVEL1" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_FSDEPTSEQNOLEVEL1" TO "BIOSAADM";
