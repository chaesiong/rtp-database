CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_NATIONSEQNO" (nationcd_tmp varchar2) return varchar2 is
tmp Number(4);
begin
 begin   
   select count_seqno into tmp from country where countcd = nationcd_tmp;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_NATIONSEQNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_NATIONSEQNO" TO "BIOSAADM";
