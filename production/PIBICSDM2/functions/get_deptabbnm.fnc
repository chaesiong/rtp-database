CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTABBNM" (deptseqno_tmp Number, flag varchar2) return varchar2 is

rel2 Number(4);
rel3 Number(4);
level1 Number(1);
level2 Number(1);
tmplevel Number(1);
enm1 varchar2(200);
tnm1 varchar2(200);
enm2 varchar2(200);
tnm2 varchar2(200);
enm3 varchar2(200);
tnm3 varchar2(200);
tmp varchar2(200);

begin
 begin
 select deptlevel into tmplevel from department where dept_seqno=deptseqno_tmp;
 if tmplevel = 1 or tmplevel = 4 then
    select deptenm,abbrnm into enm1,tnm1 from department where dept_seqno=deptseqno_tmp ; 
elsif tmplevel = 0  then
    select deptenm,abbrnm into enm1,tnm1 from department where dept_seqno=1 ;     
elsif tmplevel =2 then
    select deptenm,abbrnm,rel_code into enm2,tnm2,rel2 from department where dept_seqno = deptseqno_tmp;
    select deptlevel into level1 from department where dept_seqno = rel2;
     if level1 = 1 then
      select deptenm,abbrnm into enm1,tnm1 from department where dept_seqno = rel2;
      end if;
   
elsif tmplevel =3 then
    select deptenm,abbrnm,rel_code into enm3,tnm3,rel3 from department where dept_seqno = deptseqno_tmp;
    select deptlevel into level2 from department where dept_seqno = rel3;
 if level2 = 2 then
      select deptenm,abbrnm,rel_code into enm2,tnm2,rel2 from department where dept_seqno = rel3;
      select deptlevel into level1 from department where dept_seqno = rel2;
       if level1 = 1 then
      select deptenm,abbrnm into enm1,tnm1 from department where dept_seqno = rel2;
      end if;
      end if;
    if level2 = 1 then
      select deptenm,abbrnm into enm1,tnm1 from department where dept_seqno = rel3;
      end if;
end if; 
 if flag = 'T' then
    if tnm3 is not null and tnm2 is null and tnm1 is null then
            tmp:= tnm3;
    elsif tnm3 is null and tnm2 is not null and tnm1 is null then
             tmp:= tnm2;
    elsif tnm3 is null and tnm2 is null and tnm1 is not null then
             tmp:= tnm1;
    elsif tnm3 is not null and tnm2 is not null and tnm1 is null then
             tmp:= tnm3||'/'||tnm2;
    elsif tnm3 is not null and tnm2 is null and tnm1 is not null then
             tmp:= tnm3||'/'||tnm1;
    elsif tnm3 is null and tnm2 is not null and tnm1 is not null then
             tmp:= tnm2||'/'||tnm1;
    elsif tnm3 is not null and tnm2 is not null and tnm1 is not null then
             tmp:= tnm3||'/'||tnm2||'/'||tnm1; 
    end if;   
 elsif flag = 'E' then
      tmp := nvl(enm3, '-')||'/'|| nvl(enm2, '-')||'/'||nvl(enm1, '-') ;
 else tmp := nvl(tnm3, '-')||'/'|| nvl(tnm2, '-')||'/'||nvl(tnm1, '-') ;  
 end if;
--Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTABBNM" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTABBNM" TO "BIOSAADM";
