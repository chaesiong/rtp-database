CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTABBFMT2FROMUSERID" (userid varchar2) return varchar2 is
tmp Number(4);
dept varchar2(100);
begin
 begin
  select dept_seqno into tmp from hr_profile p left join fw_user u on u.person_id = P.PROFILE_SEQNO where u.user_id = userid;
  if tmp is not null then 
    select DEPTABBFMT2 into dept from department where dept_seqno = tmp;
   end if;
Exception When No_Data_Found Then Null ;
end;
    return dept;
end;
/
