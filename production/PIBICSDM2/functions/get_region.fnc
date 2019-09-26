CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_REGION" (pvseqno Number) return varchar2 is
tmp varchar2(30);
begin
 begin
 select regtnm into tmp from province p
 left join region r
 on p.reg_seqno = r.reg_seqno
 where p.pv_seqno = pvseqno;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
