CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_NAMEIMMPIBICS" (usrid varchar2) return varchar2
is
   tmp   varchar2 (200);
begin
   begin
      select    get_ranknamefromprofileseqno (p.profile_seqno, 'A')
             || p.name
             || '  '
             || p.sname
        into tmp
        from hr_profile p, fw_user u
       where p.profile_seqno = u.person_id and u.user_id = usrid;
   exception
      when no_data_found
      then
         select b.ranknm ||' '|| a.firstnm||' '|| a.familynm into tmp from sysuser a, rankimm b where a.rankid=b.rankid and userid=usrid;
         return tmp;
   end;

   return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_NAMEIMMPIBICS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_NAMEIMMPIBICS" TO "BIOSAADM";
