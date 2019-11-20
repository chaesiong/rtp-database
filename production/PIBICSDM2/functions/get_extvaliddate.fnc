CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_EXTVALIDDATE" (idtmp varchar2) return Date is
tmp Date;
begin
begin
    select to_date(idtmp,'dd/mm/yyyy') into tmp from dual;
    Exception 
        When Others Then tmp := null ;
end;    
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_EXTVALIDDATE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_EXTVALIDDATE" TO "BIOSAADM";
