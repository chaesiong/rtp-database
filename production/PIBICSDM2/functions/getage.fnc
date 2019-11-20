CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GETAGE" (v_birthdte varchar2) RETURN NUMBER IS
    tmp Number;
    begin
        tmp :=TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - TO_NUMBER(SUBSTR(v_birthdte, 7));
       return tmp;
      exception when OTHERS then
      return null; 
END getAge;
/
  GRANT EXECUTE ON "PIBICSDM2"."GETAGE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GETAGE" TO "BIOSAADM";
