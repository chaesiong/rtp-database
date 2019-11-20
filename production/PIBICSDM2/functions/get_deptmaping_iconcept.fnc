CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTMAPING_ICONCEPT" (deptcd_tmp varchar2) return varchar2 is
tmp Number(4);
begin
 begin
   select dept_seqno_c into tmp from department_mapping where deptcd_o= substr('00000'||deptcd_tmp,-5); 
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTMAPING_ICONCEPT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTMAPING_ICONCEPT" TO "BIOSAADM";
