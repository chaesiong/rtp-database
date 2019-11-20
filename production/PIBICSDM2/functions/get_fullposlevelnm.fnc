CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FULLPOSLEVELNM" (posseq Number,flag CHAR) return varchar2 is
tmp varchar2(200);
begin
 begin
    if flag = 'AB' then
         select poslevelabvnm  into tmp  from poslevel where poslevel_seqno=posseq;
 elsif flag = 'FU' then
         select poslevelfullnm  into tmp    from poslevel where poslevel_seqno=posseq;
 elsif flag = 'B' then
         select poslevelid||'-'||poslevelabvnm  into tmp    from poslevel where poslevel_seqno=posseq;
 elsif flag = 'A' then
         select poslevelid||'-'||poslevelfullnm   into tmp  from poslevel  where poslevel_seqno=posseq;
 else  select poslevelid||'-'||poslevelabvnm||'-'||poslevelfullnm  into tmp   from poslevel  where poslevel_seqno=posseq;
 end if;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_FULLPOSLEVELNM" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_FULLPOSLEVELNM" TO "BIOSAADM";
