CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CONTINENTFROMCONTICD" (nationcd char,flag char) return varchar2 is
tmp varchar2(200);
begin
 begin
    if flag='A' then
        SELECT continent_seqno into tmp  FROM CONTINENT A WHERE  A.CONTINENTCD =nationcd;
    elsif flag='B' then
        SELECT  A.CONTINENTCD into tmp  FROM CONTINENT A WHERE  A.CONTINENTCD =nationcd;
   elsif flag='C' then
        SELECT  A.CONTINENTENM into tmp  FROM  CONTINENT A WHERE  A.CONTINENTCD =nationcd;
    else
        SELECT A.CONTINENTTNM into tmp  FROM CONTINENT A WHERE  A.CONTINENTCD =nationcd;
    end if;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_CONTINENTFROMCONTICD" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_CONTINENTFROMCONTICD" TO "BIOSAADM";
