CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PROVINCEBYSEQNO" (ID_TMP Number, flag varchar2) return varchar2 is
cmp varchar2(200);
dmp varchar2(200);
endesc varchar2(200);
tmp varchar2(200);
begin
    begin
    select pvcd,pv_desc,pv_desc_en into cmp,dmp,endesc from province where pv_seqno=ID_TMP;
      if flag = 'C' then
        tmp := cmp;
     elsif flag = 'D' then
        tmp := dmp;
     elsif flag = 'E' then
        tmp := endesc;            
     else tmp := dmp;
    end if;  
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_PROVINCEBYSEQNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_PROVINCEBYSEQNO" TO "BIOSAADM";
