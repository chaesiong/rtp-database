CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_LEVELNAMEFROMPROFILESEQNO" (profileseq number, flag varchar2) return varchar2 is
anm varchar2(200);
fnm varchar2(200);
tmp varchar2(200);
begin
 begin
   select poslevelabvnm, poslevelfullnm into anm,fnm  from poslevel where poslevel_seqno =  (select level_seqno from hr_profile where profile_seqno =profileseq );
    if flag = 'A' then
        tmp := anm;
     elsif flag = 'F' then
        tmp := fnm;
     else tmp := anm;
    end if;   
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_LEVELNAMEFROMPROFILESEQNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_LEVELNAMEFROMPROFILESEQNO" TO "BIOSAADM";
