CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CRSRESCERTTYPESEQNO" (rescerttypenm_tmp varchar2) return varchar2 is 
tnm varchar2(200);
tmp varchar2(200);
begin
    begin
    select rescerttype_seqno into tnm  from crs_rescerttype where rescerttypenm=trim(rescerttypenm_tmp);
    tmp := tnm;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
