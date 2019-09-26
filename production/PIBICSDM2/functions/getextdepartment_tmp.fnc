CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GETEXTDEPARTMENT_TMP" (departmentcode varchar2) RETURN NUMBER IS
    tmp Number;
    begin
       select seqno into tmp from extdepartment_tmp where code = departmentcode and rownum=1;
       return tmp;
      exception when no_data_found then
      return null; 
END getExtDepartment_tmp;
/
