CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_NATIONSABBBYSEQ" (countseqno_tmp Number) return varchar2 is
abb varchar2(4);
begin
    begin
    select abbcount into abb  from country where count_seqno=countseqno_tmp;
    Exception When No_Data_Found Then Null ;
    end;
  return abb;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_NATIONSABBBYSEQ" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_NATIONSABBBYSEQ" TO "BIOSAADM";
