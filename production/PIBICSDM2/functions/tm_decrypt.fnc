CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."TM_DECRYPT" (str_p varchar2) RETURN varchar2 IS
        i                    number := 1;
        return_v                varchar2(200) := null;
        return2_v                varchar2(200) := null;
    BEGIN
        while not (i >= length(str_p)) loop
        return_v := return_v||chr(substr(str_p,i,3));
        i := i + 3;
        end loop;
        i := 1;
        while not (i >= length(return_v)) loop
        return2_v := return2_v||chr(substr(return_v,i,3));
        i := i + 3;
        end loop;
        return (return2_v);  
    END;
/
  GRANT EXECUTE ON "PIBICSDM2"."TM_DECRYPT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."TM_DECRYPT" TO "BIOSAADM";
