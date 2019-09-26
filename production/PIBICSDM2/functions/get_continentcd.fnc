CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CONTINENTCD" (nationcd varchar2,flag char) return varchar2 is
tmp varchar2(200);
begin
 begin
    if flag='A' then
        SELECT  A.CONTINENT_SEQNO into tmp  FROM CONTINENT A,COUNTRY B WHERE A.CONTINENTCD=B.CONTINENTCD AND COUNTCD=nationcd;
    elsif flag='B' then
        SELECT  A.CONTINENTCD into tmp  FROM CONTINENT A,COUNTRY B WHERE A.CONTINENTCD=B.CONTINENTCD AND COUNTCD=nationcd;
   elsif flag='C' then
        SELECT  A.CONTINENTENM into tmp  FROM CONTINENT A,COUNTRY B WHERE A.CONTINENTCD=B.CONTINENTCD AND COUNTCD=nationcd;
    else
        SELECT A.CONTINENTTNM into tmp  FROM CONTINENT A,COUNTRY B WHERE A.CONTINENTCD=B.CONTINENTCD AND COUNTCD=nationcd;
    end if;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
