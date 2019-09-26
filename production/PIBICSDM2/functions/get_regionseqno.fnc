CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_REGIONSEQNO" (pvseqno Number) return Number is
tmp Number;
begin
 begin
 select r.reg_seqno into tmp from province p
 left join region r
 on p.reg_seqno = r.reg_seqno
 where p.pv_seqno = pvseqno;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
