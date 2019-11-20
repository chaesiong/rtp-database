CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_RELATIONPASSJOINBYSEQNO" (rpjseqno_tmp Number,flag char) return varchar2 is
tnm varchar2(200);
enm varchar2(200);
tmp varchar2(200);
begin
 begin
   select rpjdesc, rpjenm into tnm,enm from Relationpassjoin where rpjseqno =rpjseqno_tmp; 
    if flag = 'T' then
    tmp := tnm;
 elsif flag = 'E' then
    tmp := enm;
 else tmp := tnm;
 end if;
 Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_RELATIONPASSJOINBYSEQNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_RELATIONPASSJOINBYSEQNO" TO "BIOSAADM";
