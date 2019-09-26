CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTCDBYMAPPINGIP" (ip varchar2,flag varchar2) return varchar2 is
tmp varchar2(20);
spotno varchar2(20);
deptseqno number(4);
deptcd varchar2(20);
begin
 begin   
        --Default  substr(D.DEPTCD,3)
        select substr(d.deptcd,3),spotseqno,d.dept_seqno ,d.deptcd into tmp,spotno,deptseqno,deptcd
        from mappingip m, department d 
        where  m.dept_seqno = d.dept_seqno 
        and 1=1  and ipaddress =ip;
        if flag = 'S' then
            tmp := spotno;
        elsif  flag = 'DS' then
            tmp := deptseqno;
        elsif  flag = 'DC' then
            tmp := deptcd;
        end if;
exception when no_data_found then null ;
end;
    return tmp;
end;
/
