CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_RANKNAME" (rankseqno_tmp varchar2, flag varchar2) return varchar2 is
anm varchar2(200);
fnm varchar2(200);
tmp varchar2(200);
begin
 begin
   select ranknm, rankfullnm into anm,fnm from rank where rank_seqno =rankseqno_tmp; 
    if flag = 'A' then
        tmp := anm;
     elsif flag = 'F' then
        tmp := fnm;
     else tmp := anm;
    end if;   
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_RANKNAME" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_RANKNAME" TO "BIOSAADM";
