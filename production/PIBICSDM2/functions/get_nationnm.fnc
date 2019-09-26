CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_NATIONNM" (countcd_tmp varchar2,flag char) return varchar2 is
enm varchar2(200);
tnm varchar2(200);
tmp varchar2(200);
begin
    begin
    select nationtnm, nationenm into tnm,enm from country where countcd = trim(countcd_tmp);
    if flag = 'T' then
       tmp := tnm;
    elsif flag = 'E' then
       tmp := enm;
    else tmp := tnm;
    end if;
    EXCEPTION WHEN NO_DATA_FOUND THEN 
    BEGIN 
      select nationtnm, nationenm into tnm,enm from country where count_seqno = trim(countcd_tmp);
    if flag = 'T' then
       tmp := tnm;
    elsif flag = 'E' then
       tmp := enm;
    ELSE TMP := TNM;
    end if;
    Exception when others then return null;
    end;
    end;
  RETURN TMP;
end;
/
