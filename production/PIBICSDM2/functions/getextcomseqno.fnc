CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GETEXTCOMSEQNO" (comnm varchar2) RETURN NUMBER IS
    tmp Number;
    begin
       select company_seqno into tmp  from ext_company 
                    where replace(COMPANYNM,' ','') = replace(comnm,' ','')     
                    and rownum = 1;
       return tmp;
      exception when no_data_found then
      return tmp; 
END;
/
