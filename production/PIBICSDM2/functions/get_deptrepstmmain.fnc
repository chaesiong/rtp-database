CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTREPSTMMAIN" (tm8seq Number, passportno varchar2, nation_seqno Number) return varchar2 is
tmp varchar2(200);
begin
 begin
    select get_deptnmrelabbr(dept_seqno, 'T') into tmp from reps_tm8 where tm8_seqno = tm8seq;    
Exception When No_Data_Found Then 
    select get_deptnmrelabbr(dept_seqno, 'T') into tmp  from (
    select dept_seqno from reps_tm8 where  passportno = passportno and national_seqno = nation_seqno order by doc_date 
    ) where rownum =1;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTREPSTMMAIN" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTREPSTMMAIN" TO "BIOSAADM";
