CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_COMPANYBYSEQ" (companySeq_tmp number) return varchar2 is
nm varchar2(400);
begin
    begin
    select companynm into nm  from ext_company where company_seqno=companySeq_tmp;
   
    Exception When No_Data_Found Then Null ;
    end;
  return nm;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_COMPANYBYSEQ" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_COMPANYBYSEQ" TO "BIOSAADM";
