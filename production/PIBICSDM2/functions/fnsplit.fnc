CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."FNSPLIT" (valtxt varchar2,splittxt varchar2,returnitem number) return varchar2 is
str string_fnc.t_array;
tmp varchar2(500);
item number;
begin
 begin
    str := string_fnc.split(valtxt,splittxt);
    tmp := '';
    for i in 1..str.count loop
        if i = returnitem then 
            tmp := replace(str(i),splittxt,'');
        end if;
    end loop;
      
 Exception When Others Then tmp := Null ;
 end;
  return tmp;
end; 
/
  GRANT EXECUTE ON "PIBICSDM2"."FNSPLIT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."FNSPLIT" TO "BIOSAADM";
