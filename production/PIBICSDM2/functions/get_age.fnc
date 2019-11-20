CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_AGE" (v_birthdte varchar2) RETURN NUMBER IS
    tmp Number;
    begin
        if length(v_birthdte) = 10 then
            tmp :=TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - TO_NUMBER(SUBSTR(v_birthdte, 7));
        elsif length(v_birthdte) = 8 then
            tmp :=TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - TO_NUMBER(SUBSTR(v_birthdte, 5));
        elsif length(v_birthdte) = 4 then
            tmp :=TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - TO_NUMBER(v_birthdte);
        else
            tmp := null;
        end if;
        if tmp > 120 then
            tmp := null;
        end if;
        
        return tmp;
      exception when OTHERS then
      return null; 
END get_Age;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_AGE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_AGE" TO "BIOSAADM";
