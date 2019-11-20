CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTCDLEVEL3" (deptseqno_tmp Number) return varchar2 is
tmp varchar2(200);
tmplevel Number(1);
relcd Number(4);
begin
 begin
   select deptcd into tmp from department where dept_seqno=deptseqno_tmp and deptlevel=3; 
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTCDLEVEL3" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTCDLEVEL3" TO "BIOSAADM";
