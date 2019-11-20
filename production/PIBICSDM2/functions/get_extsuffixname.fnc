CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_EXTSUFFIXNAME" (suffix_tmp varchar2) return varchar2 is
tmp varchar2(200);
begin
 begin
 select decode(upper(suffix_tmp),'MR',1,'MRS',3,'MISS',2,'MASTER',9,'MAST',9,'MS',28,null) into tmp from dual;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_EXTSUFFIXNAME" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_EXTSUFFIXNAME" TO "BIOSAADM";
