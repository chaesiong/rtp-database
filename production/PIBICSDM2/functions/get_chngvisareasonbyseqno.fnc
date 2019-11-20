CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CHNGVISAREASONBYSEQNO" (reasonseqno_tmp Number, flag char) return varchar2 is
reasonG varchar2(200);
reasonN varchar2(200);
tmp varchar2(200);
begin
    begin    
        select reasonnm,reason_group into reasonN,reasonG from CHNGVISA_REASON where reason_seqno =reasonseqno_tmp; 
    if flag = 'G' then
       tmp := reasonG;
    elsif flag = 'N' then
       tmp := reasonN;
    else tmp := reasonN;
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_CHNGVISAREASONBYSEQNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_CHNGVISAREASONBYSEQNO" TO "BIOSAADM";
