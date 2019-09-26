CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_TM2NON" (esyear char,esmonth char) return Number is
tmp Number;
begin
    begin
        select count( profile_seqno) into tmp from vwotnonautherized  
        where estimateyear=esyear and estimatemonth=esmonth and 
        dept_seqno in (select dept_seqno  from department where (dept_seqno=3 or rel_code=3) or rel_code in (select dept_seqno from department where rel_code =3));
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
