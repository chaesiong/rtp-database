CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_AMPURBYSEQNO" (ID_TMP Number, flag varchar2) return varchar2 is
cmp varchar2(200);
dmp varchar2(200);
endesc varchar2(200);
tmp varchar2(200);
begin
    begin
    select ampcd,amp_desc,amp_desc_en into cmp,dmp,endesc from ampur where amp_seqno=ID_TMP;
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
  GRANT EXECUTE ON "PIBICSDM2"."GET_AMPURBYSEQNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_AMPURBYSEQNO" TO "BIOSAADM";
