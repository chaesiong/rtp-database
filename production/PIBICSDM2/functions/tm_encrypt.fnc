CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."TM_ENCRYPT" (str_p varchar2) RETURN varchar2 IS
        i                    number := 1;
        return_v                varchar2(200) := null;
        return2_v                varchar2(200) := null;
    BEGIN
        if length(str_p) > 0 then
          for i in 1..length(str_p) loop
          return_v := return_v||ltrim(to_char(ascii(substr(str_p,i,1)),'000'));
          end loop;
          for i in 1..length(return_v) loop
          return2_v := return2_v||ltrim(to_char(ascii(substr(return_v,i,1)),'000'));
          end loop;
        end if;
        return (return2_v);  
    END;
/
  GRANT EXECUTE ON "PIBICSDM2"."TM_ENCRYPT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."TM_ENCRYPT" TO "BIOSAADM";
