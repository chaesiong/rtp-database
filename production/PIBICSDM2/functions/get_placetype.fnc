CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PLACETYPE" (SEQNO_PT Number) return varchar2 is
tmp varchar2(200);
begin
    begin
    select pt_name into tmp from PLACE_TYPE where pt_seqno=SEQNO_PT;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_PLACETYPE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_PLACETYPE" TO "BIOSAADM";
