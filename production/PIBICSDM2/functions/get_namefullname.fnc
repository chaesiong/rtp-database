CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_NAMEFULLNAME" (profileseq number) return varchar2 is
tmp varchar2(200);
begin
 begin
   select  GET_RANKNAMEFROMPROFILESEQNO(profile_seqno,'A')|| name||' '|| sname into tmp  from hr_profile where profile_seqno =  profileseq;
  
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_NAMEFULLNAME" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_NAMEFULLNAME" TO "BIOSAADM";
