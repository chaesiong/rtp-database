CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GETAGE2DATE" ( v_birthdte varchar2) RETURN date IS
    tmp date;
    begin
        tmp := to_date(substr(v_birthdte, 7)||substr(v_birthdte, 4, 2)||substr(v_birthdte, 0, 2), 'YYYYMMDD');
       return tmp;
      exception when OTHERS then
      return null; 
END getAge2Date;
/
