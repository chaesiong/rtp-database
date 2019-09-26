CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_TESTOTNONTM2" (esyear varchar2,esmonth varchar2)  return Number is
tmp Number;
begin
    begin
           select count(b.profile_seqno) into tmp from department a,hr_profile b
     where  a.dept_seqno=b.dept_seqno  and  (a.DEPT_SEQNO=3 OR a.REL_CODE=3 or rel_code in ( select dept_seqno from department where rel_code=3 )) AND b.LEVEL_SEQNO!=4 and substr(pos_date,0,6)!=esyear||esmonth;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
