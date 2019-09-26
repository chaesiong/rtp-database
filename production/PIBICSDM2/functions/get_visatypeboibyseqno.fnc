CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_VISATYPEBOIBYSEQNO" (visatypesubseqno_tmp Number) return varchar2 is
tnm varchar2(200);
begin
 begin
   select visatypesubtnm into tnm from VISATYPE_BOI where visatypesub_seqno =visatypesubseqno_tmp; 
Exception When No_Data_Found Then Null ;
end;
    return tnm;
end;
/
