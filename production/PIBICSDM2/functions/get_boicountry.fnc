CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_BOICOUNTRY" (idtmp varchar2,flag char) return varchar2 is
tmp varchar2(200);
begin
 begin
 if flag = 'Z' then
   select  zone_seqno into tmp  from BoiCountry where country_id =  idtmp;
 else
   select seqno into tmp from BoiCountry where country_id = idtmp;
 end if;   
 
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_BOICOUNTRY" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_BOICOUNTRY" TO "BIOSAADM";
