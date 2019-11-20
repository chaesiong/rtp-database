CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_COUNTSEQNO" (countCd_tmp varchar2) return varchar2 is 
tnm varchar2(200);
tmp varchar2(200);
begin
    begin
    select count_seqno into tnm  from country where countcd=trim(countCd_tmp) ;
    tmp := tnm;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_COUNTSEQNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_COUNTSEQNO" TO "BIOSAADM";
