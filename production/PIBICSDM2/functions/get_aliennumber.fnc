CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_ALIENNUMBER" (arsseq Number) return varchar2 is
tmp varchar2(200);
begin
    begin
       select aliencert_number||'/'||aliencert_year into tmp from ars_aliencert where aliencert_seqno = arsseq;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_ALIENNUMBER" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_ALIENNUMBER" TO "BIOSAADM";
