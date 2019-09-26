CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CRSRESCERTTYPE" (rescerttype_seqno_tmp varchar2) return varchar2 is 
tnm varchar2(200);
tmp varchar2(200);
begin
    begin
    select RESCERTTYPECD into tnm  from crs_rescerttype where RESCERTTYPE_SEQNO=trim(rescerttype_seqno_tmp);
    tmp := tnm;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
