CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_NAMEALLHR" (profileseq number,flag char) return varchar2 is
tmp varchar2(200);
begin
 begin
 if flag = 'A' then
   select  GET_RANKNAMEFROMPROFILESEQNO(profile_seqno,'A')|| name||' '|| sname into tmp  from hr_profile where profile_seqno =  profileseq;
 elsif flag = 'B' then
    select  GET_RANKNAMEFROMPROFILESEQNO(profile_seqno,'A')|| name into tmp  from hr_profile where profile_seqno =  profileseq;
 elsif flag = 'C' then
    select   sname into tmp  from hr_profile where profile_seqno =  profileseq;
 elsif flag = 'D' then
    select   pid into tmp  from hr_profile where profile_seqno =  profileseq;
 elsif flag = 'E' then
    select   dept_seqno into tmp  from hr_profile where profile_seqno =  profileseq;
 else select   name into tmp  from hr_profile where profile_seqno =  profileseq;
 end if;   
 
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_NAMEALLHR" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_NAMEALLHR" TO "BIOSAADM";
