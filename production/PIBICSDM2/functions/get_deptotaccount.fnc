CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTOTACCOUNT" (esyear char,esmonth varchar,profileseq Number) return NumbER is
tmp number;
posd varchar2(6);
begin
    begin   
         select actnew into posd from ot_poschange q ,ot_poschangeperson w
            where q.otposchangeseqno=w.otposchangeseqno and   profile_seqno=profileseq   and q.estimateyear = esyear and q.estimatemonth = esmonth ;
        if posd ='Y' then
         select newdept_seqno into tmp from ot_poschange a ,ot_poschangeperson b
            where a.otposchangeseqno=b.otposchangeseqno and   profile_seqno=profileseq   and a.estimateyear = esyear and a.estimatemonth = esmonth ;
        else
            select orgdept_seqno into tmp from ot_poschange c ,ot_poschangeperson d
            where c.otposchangeseqno=d.otposchangeseqno and   profile_seqno=profileseq   and c.estimateyear = esyear and c.estimatemonth = esmonth ;
        end if;
    Exception When No_Data_Found Then Null ;
             select dept_seqno into tmp from OT_NONAUTHPERSON  b,OT_NONAUTHORIZED a
              where A.OTNONAUTHSEQNO  =B.OTNONAUTHSEQNO and profile_seqno=profileseq
            and ESTIMATEYEAR=decode(esmonth-1,0,esyear-1,esyear) and estimatemonth=decode(esmonth-1,0,12,esmonth-1);
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTOTACCOUNT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTOTACCOUNT" TO "BIOSAADM";
