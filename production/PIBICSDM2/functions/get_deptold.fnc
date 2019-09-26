CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTOLD" (esyear char,esmonth varchar,profileseq Number) return NumbER is
tmp number;
posd varchar2(6);
begin
    begin   
       select substr(pos_date,1,6) posdate into posd  from hr_profile_ot where profile_seqno = profileseq;
        if posd=(esyear||esmonth) then
          select otdept_seqno into tmp from ot_accountperson b,ot_account a
             where A.ACCOUNTSEQNO=B.ACCOUNTSEQNO and profile_seqno=profileseq
            and ESTIMATEYEAR=decode(esmonth-1,0,esyear-1,esyear) and estimatemonth=decode(esmonth-1,0,12,esmonth-1);
           end if;
    Exception When No_Data_Found Then Null ;
             select dept_seqno into tmp from OT_NONAUTHPERSON  b,OT_NONAUTHORIZED a
              where A.OTNONAUTHSEQNO  =B.OTNONAUTHSEQNO and profile_seqno=profileseq
            and ESTIMATEYEAR=decode(esmonth-1,0,esyear-1,esyear) and estimatemonth=decode(esmonth-1,0,12,esmonth-1);
    end;
  return tmp;
end;
/
