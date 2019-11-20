CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."MIGRATEDEPTCD" (tmpdeptcd varchar) return varchar2 is
tmp varchar(5);
begin
 begin
   select b.deptcd into tmp from department_mapping a, department b where a.dept_seqno_c = b.dept_seqno and deptcd_o =tmpdeptcd;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEDEPTCD" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEDEPTCD" TO "BIOSAADM";
