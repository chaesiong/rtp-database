CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_POLICORGANIZEALL" (orgseq varchar2 ,flag char) return varchar2 is
tmp varchar2(200);
begin 
    begin
        if flag='A' then
            select orgcd into tmp from policorganize where org_seqno = orgseq;
        elsif flag='B' then
            select orgnm into tmp from policorganize where org_seqno = orgseq;            
        elsif flag='C' then
            select orgnm into tmp from policorganize where orgcd = orgseq;            
        end if;
    Exception When No_Data_Found Then Null ;
        begin 
            select deptabbfmt1 into tmp from department where dept_seqno =  orgseq;
        Exception when others then return null;
        end;
    end;
  return tmp;
end;
/
