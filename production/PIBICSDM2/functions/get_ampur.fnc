CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_AMPUR" (IDAMP_TMP Number) return varchar2 is
tmp varchar2(200);
begin
    begin
    select amp_desc into tmp from ampur where amp_seqno=IDAMP_TMP;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_AMPUR" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_AMPUR" TO "BIOSAADM";
