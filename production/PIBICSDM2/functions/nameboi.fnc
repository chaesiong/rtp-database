CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."NAMEBOI" (valtxt varchar2,returnnm varchar2) return varchar2 is
str string_fnc.t_array;
tmpF varchar2(200);
tmpL varchar2(200);
tmpM varchar2(200);
tmp varchar2(200);
chkErr varchar2(1);
begin
chkErr := 'N';
 begin
    str := string_fnc.split(replace(replace(replace(trim(valtxt),',',' '),'-',' '),'  ',' '),' ');
    tmp := '';
    for i in 1..str.count loop
    chkErr := 'Y';
        if i = 1 then
            tmpF := trim(str(i));
        elsif i = 2 then
            tmpL := trim(str(i));
        else
            tmpM := tmpM||str(i);
        end if;
    end loop;
    if returnnm = 'F' then
        IF chkErr = 'N' THEN
            return replace(replace(replace(trim(valtxt),',',' '),'-',' '),'  ',' ');
        END IF;    
        tmp := tmpF;
    elsif returnnm = 'L' then
        tmp := tmpL;
    else
        tmp := trim(tmpM);
    end if;    
 Exception When No_Data_Found Then Null ;
 end;
  return upper(tmp);
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."NAMEBOI" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."NAMEBOI" TO "BIOSAADM";
