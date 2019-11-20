CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_BIRTHDTE90" (birthdte_tmp varchar2) return varchar2 is
str string_fnc.t_array;
tmp varchar2(20);
begin
 begin
    str := string_fnc.split(birthdte_tmp,'-');
    tmp := '';
    for i in 1..str.count loop
        if length(str(i)) = 0 then
            --dbms_output.put_line('0'||replace(str(i),'/',''));
            tmp := tmp||'0'||str(i);
        else 
            --dbms_output.put_line(replace(str(i),'/',''));  
            tmp := tmp||str(i);
        end if;    
    end loop;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_BIRTHDTE90" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_BIRTHDTE90" TO "BIOSAADM";
