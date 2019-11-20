CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_RANKFROMRANKID" (rankidtmp varchar2,flag char) return varchar2 is
tmp varchar2(400);
begin
    begin
    if flag = 'A' then
       select ranknm into tmp from rank where rankid = rankidtmp ;
    elsif flag = 'B' then
       select rankfullnm into tmp from rank where  rankid = rankidtmp ;
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_RANKFROMRANKID" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_RANKFROMRANKID" TO "BIOSAADM";
