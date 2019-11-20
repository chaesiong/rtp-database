CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PERMITTYPEBYSEQNO" (petmit_tmp varchar2,flag char) return varchar2 is
enm varchar2(200);
tnm varchar2(200);
tmp varchar2(200);
begin
 begin
 select permitnm, permitnm into enm,tnm  from PERMITTYPE where permit_seqno=trim(petmit_tmp);
 if flag = 'T' then
    tmp := tnm;
 elsif flag = 'E' then
    tmp := enm;
 else tmp := tnm;
 end if;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_PERMITTYPEBYSEQNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_PERMITTYPEBYSEQNO" TO "BIOSAADM";
