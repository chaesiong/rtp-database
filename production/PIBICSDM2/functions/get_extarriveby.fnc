CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_EXTARRIVEBY" (arrive_tmp varchar2) return varchar2 is
tmp varchar2(200);
begin
 begin
 select decode(arrive_tmp,'1',2,'2',3,'3',1,'4',4,5) into tmp from dual;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_EXTARRIVEBY" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_EXTARRIVEBY" TO "BIOSAADM";
