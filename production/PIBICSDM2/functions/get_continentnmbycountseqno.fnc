CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CONTINENTNMBYCOUNTSEQNO" (countseqno_tmp varchar2,flag char) return varchar2 is
enm varchar2(200);
tnm varchar2(200);
contncd varchar2(3);
tmp varchar2(200);
begin
    begin    
    select continenttnm, continentenm,b.continentcd  into tnm, enm,contncd from country a,continent b where a.continentcd=b.continentcd and a.countcd=(select a.countcd  from country a where a.count_seqno=countseqno_tmp);
    if flag = 'T' then
       tmp := tnm;
    elsif flag = 'E' then
       tmp := enm;
    elsif flag = 'S' then --return continebtcd
       tmp := contncd;       
    else tmp := tnm;
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_CONTINENTNMBYCOUNTSEQNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_CONTINENTNMBYCOUNTSEQNO" TO "BIOSAADM";
