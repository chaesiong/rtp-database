CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_TAMBONBYSEQNO" (ID_TMP Number, flag varchar2) return varchar2 is
cmp varchar2(200);
dmp varchar2(200);
endesc varchar2(200);
tmp varchar2(200);
begin
    begin
    select tmbcd,tmb_desc,tmb_desc_EN into cmp,dmp,endesc from tambon where tmb_seqno=ID_TMP;
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
  GRANT EXECUTE ON "PIBICSDM2"."GET_TAMBONBYSEQNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_TAMBONBYSEQNO" TO "BIOSAADM";
