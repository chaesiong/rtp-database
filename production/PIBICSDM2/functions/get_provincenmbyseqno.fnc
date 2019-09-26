CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PROVINCENMBYSEQNO" (ppv_seqno varchar2) return varchar2 is
tnm varchar2(200);
tmp varchar2(200);
begin
    begin    
        select pv_desc into tmp  from province where pv_seqno = ppv_seqno;

    end;
  return tmp;
end;
/
