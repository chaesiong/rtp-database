CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_RANKCRWNM" (rankcrwSeqno_tmp number) return varchar2 is
nm varchar2(200);
begin
    begin
    select ranknm into nm  from rankcrw where rankcrw_seqno=rankcrwSeqno_tmp;
   
    Exception When No_Data_Found Then Null ;
    end;
  return nm;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_RANKCRWNM" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_RANKCRWNM" TO "BIOSAADM";
