CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_HRPROFILEBYCARDID" (card_id_tmp varchar2) return varchar2 is
tmp varchar2(200);
begin
    begin
     select   get_RankName(rank_seqno,'S')||' '||name||' '||sname  into tmp from  hr_profile where card_id=card_id_tmp ;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_HRPROFILEBYCARDID" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_HRPROFILEBYCARDID" TO "BIOSAADM";
