CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTABBFMT4" (v_deptseqno number) return varchar2 is
nm varchar2(200);
begin
    begin
    select DEPTABBFMT4 into nm  from department where dept_seqno = v_deptseqno;   
    Exception When No_Data_Found Then Null ;
    end;
  return nm;
end;
/
