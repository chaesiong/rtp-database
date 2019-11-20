CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_REPS_GETNAME" (nametxt varchar2) return varchar2 is
tmp varchar2(500);
begin
    begin
        select decode(FNsplit(nametxt,'.',2),null,nametxt,FNsplit(nametxt,'.',2)) into tmp from dual;
    Exception When No_Data_Found Then Null ;
    end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_REPS_GETNAME" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_REPS_GETNAME" TO "BIOSAADM";
