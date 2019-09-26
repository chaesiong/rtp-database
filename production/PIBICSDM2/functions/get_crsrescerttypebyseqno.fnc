CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CRSRESCERTTYPEBYSEQNO" (rescerttypenm_tmp varchar2) return varchar2 is 
tnm varchar2(200);
tmp varchar2(200);
begin
    begin
    select rescerttypenm into tnm  from crs_rescerttype where rescerttype_seqno=rescerttypenm_tmp;
    tmp := tnm;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
