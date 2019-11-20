CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTSEQNO" (deptcd_tmp varchar2) return varchar2 is
tmp Number(4);
begin
 begin
   select dept_seqno into tmp from department where deptcd=deptcd_tmp; 
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTSEQNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTSEQNO" TO "BIOSAADM";
