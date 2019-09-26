CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTDPTNM" (deptdptSeqno_tmp number) return varchar2 is
nm varchar2(200);
begin
    begin
    select deptdptnm into nm  from departmentdpt where deptdpt_seqno=deptdptSeqno_tmp;
   
    Exception When No_Data_Found Then Null ;
    end;
  return nm;
end;
/
