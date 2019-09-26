CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_NAMEFROMPROFILESEQNO" (profileseq number) return varchar2 is
tmp varchar2(200);
begin
 begin
   select name||' '|| sname into tmp  from hr_profile where profile_seqno =  profileseq;
  
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
