CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_YEAROFDOB" (v_birthdte varchar2) RETURN varchar2 IS
    tmp varchar2(10);
    v_dob varchar2(10);
    v_tmpdob date;
    begin
        v_dob := substr(v_birthdte, -4);
        v_tmpdob := to_date(v_dob||'01'||'01', 'YYYYMMDD');
        
        if v_dob is null then
            tmp := null;
        else
            tmp := v_dob;
        end if;

        return tmp;
      exception when OTHERS then
      return null; 
END get_YearOfDob;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_YEAROFDOB" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_YEAROFDOB" TO "BIOSAADM";
