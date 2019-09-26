CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GETIMMOUTBOUND" (v_personid varchar2) RETURN Char IS
    ctype Char(1);
    tmp Char(1);
    begin
       select cardtype into ctype from immigration where personid = v_personid;
        if ctype = '1' then
            tmp := 'N';
        elsif ctype = '2' then
            tmp := 'Y';
        end if;
        return tmp;
      exception when no_data_found then
      return null; 
END getImmOutBound;
/
