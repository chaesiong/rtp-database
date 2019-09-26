CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GETAGEONDEPARTURE" (v_inoutdte varchar2, v_birthdte varchar2) RETURN NUMBER IS
    tmp Number;
    begin
        tmp :=TO_NUMBER(v_inoutdte) - TO_NUMBER(SUBSTR(v_birthdte, 7));
       return tmp;
      exception when OTHERS then
      return null; 
END getAgeOnDeparture;
/
