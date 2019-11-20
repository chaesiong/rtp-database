CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_NATIONSEQNOICONCEPT" (nationcd_tmp varchar2) return varchar2 is
tmp varchar2(4);
begin
 begin   
   select country_id into tmp from BOICOUNTRY where name90 like '%'||nationcd_tmp||'%';
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_NATIONSEQNOICONCEPT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_NATIONSEQNOICONCEPT" TO "BIOSAADM";
