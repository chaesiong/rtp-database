CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTALL" (deptseq varchar2 ,flag char) return varchar2 is
tmp varchar2(200);
begin 
    begin
        if flag='A' then
            select to_char(org_seqno) into tmp from department where dept_seqno = deptseq;
        elsif flag='B' then
            select substr(deptcd,3,3) into tmp from department where dept_seqno = deptseq;
        elsif flag='C' then
            select deptabbfmt1 into tmp from department where dept_seqno = deptseq;    
        elsif flag='D' then
            select deptabbfmt2 into tmp from department where dept_seqno = deptseq;
        end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTALL" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTALL" TO "BIOSAADM";
