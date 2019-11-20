CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_COUNTRYNM" (pcount_seqno varchar2, flag char) return varchar2 is
tnm varchar2(200);
enm varchar2(200);
cnm varchar2(3);
tmp varchar2(200);
begin
    begin    
        select counttnm, countenm, countcd into tnm, enm, cnm  from country where count_seqno = pcount_seqno;
    if flag = 'T' then
       tmp := tnm;
    elsif flag = 'E' then
       tmp := enm;
   elsif flag = 'C' then
        tmp := cnm;
    else tmp := tnm;
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_COUNTRYNM" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_COUNTRYNM" TO "BIOSAADM";
