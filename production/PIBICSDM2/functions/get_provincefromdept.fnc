CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PROVINCEFROMDEPT" (v_seqno Number,flag char) return varchar2 is
tmp varchar2(200);
tnm varchar2(200);
tmppv varchar2(200);
begin
    begin
    select get_Province(pv_seqno), pv_seqno into tnm, tmppv from department where dept_seqno=get_deptseqnolevel2(v_seqno);
    if flag = 'T' then
       tmp := tnm;
    else tmp := tmppv;
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_PROVINCEFROMDEPT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_PROVINCEFROMDEPT" TO "BIOSAADM";
