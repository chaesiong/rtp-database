CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_EXTRECHECKNUMBER" (idtmp varchar2) return number is
tmp number;
begin
begin
    select to_number(idtmp) into tmp from dual;
    Exception 
        When Others Then tmp := null ;
end;    
    return tmp;
end;
/
