CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_WATCHNM" (wlcd_tmp varchar2,flag char) return varchar2 is
tmp varchar2(200);
begin
    begin
    if flag = 'A' then
       select wlefirstnm into tmp from watchlistnm where wlcd = wlcd_tmp and seqno='0';
    elsif flag = 'B' then
       select wlelastnm into tmp from watchlistnm where wlcd = wlcd_tmp and seqno='0';
    elsif flag = 'C' then
      select wlemiddlenm into tmp from watchlistnm where wlcd = wlcd_tmp and seqno='0';
    elsif flag = 'D' then
      select wltfirstnm into tmp from watchlistnm where wlcd = wlcd_tmp and seqno='0';
    elsif flag = 'E' then
      select wltlastnm into tmp from watchlistnm where wlcd = wlcd_tmp and seqno='0';
    elsif flag = 'F' then
       select wltmiddlenm into tmp from watchlistnm where wlcd = wlcd_tmp and seqno='0';
    else select birthdte into tmp from watchlistnm where wlcd = wlcd_tmp and seqno='0';
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_WATCHNM" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_WATCHNM" TO "BIOSAADM";
