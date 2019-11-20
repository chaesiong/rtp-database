CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_BOOLEANDEPT" (deptSEQ Number ,useridtmp varchar2) return varchar2 is
tmp varchar2(1);
begin
 begin
 select 't' into tmp from dual where GET_HRDEPTSEQNO(useridtmp) IN (SELECT A.DEPT_SEQNO FROM DEPARTMENT A 
   WHERE (A.REL_CODE=deptSEQ OR A.DEPT_SEQNO=deptSEQ  )  OR 
   (A.REL_CODE IN (SELECT A.DEPT_SEQNO FROM DEPARTMENT A WHERE A.REL_CODE= deptSEQ ))) ;
 
Exception When No_Data_Found Then return 'f' ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_BOOLEANDEPT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_BOOLEANDEPT" TO "BIOSAADM";
