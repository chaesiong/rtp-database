CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."MIGRATEVISATYPECD" (tmpvisacd varchar) return varchar2 is
tmp varchar(5);
begin
 begin
   select visatypecd into tmp from visatype where old_visatype = tmpvisacd; 
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEVISATYPECD" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEVISATYPECD" TO "BIOSAADM";
