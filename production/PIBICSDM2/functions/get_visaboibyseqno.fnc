CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_VISABOIBYSEQNO" (visatypesubseqno_tmp varchar2,flag char) return varchar2 is
code varchar2(200);
tnm varchar2(200);
tmp varchar2(200);
begin
 begin
 select visatypesubtnm,code_chngvisa into tnm,code  from VISATYPE_BOI where visatypesub_seqno =visatypesubseqno_tmp; 
 if flag = 'C' then
    tmp := code;
 elsif flag = 'T' then
    tmp := tnm;
 else tmp := tnm;
 end if;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_VISABOIBYSEQNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_VISABOIBYSEQNO" TO "BIOSAADM";
