CREATE OR REPLACE EDITIONABLE FUNCTION "DL_BORDERCONTROL"."FN_CHK_BL" (P_PASSNO IN VARCHAR2) 
RETURN VARCHAR2 AS 

v_PassNo varchar2(20);

BEGIN

select max(passportno)
into v_PassNo
from PIBICSDM2.foundwatchlist wl
where wl.passportno = P_PASSNO;

--if 
--  begin
  
--  end

--else 

--end if 
return(v_PassNo);

END FN_Chk_BL;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."FN_CHK_BL" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."FN_CHK_BL" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."FN_CHK_BL" TO "BIOSUPPORT";
