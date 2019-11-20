CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_SUFFIXNAME" (suffixseq number) return varchar2 is
tmp varchar2(200);
begin
 begin
   select  SUFFIX_DESC into tmp  from SUFFIX where SUFFIX_SEQNO =  suffixseq;
  
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_SUFFIXNAME" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_SUFFIXNAME" TO "BIOSAADM";
