CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_COUNTCDEX" (countseqno_tmp varchar2) return varchar2 is 
tnm varchar2(200);
tmp varchar2(200);
begin
    begin
    select countcd into tnm  from country where count_seqno=trim(countseqno_tmp) ;
    tmp := tnm;
    Exception When No_Data_Found Then Null ;
     select countcd into tnm  from country where countcd=trim(countseqno_tmp) ;
     tmp := tnm;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_COUNTCDEX" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_COUNTCDEX" TO "BIOSAADM";
