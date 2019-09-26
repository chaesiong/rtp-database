CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."FN_CHK_BL" (P_PASSNO IN VARCHAR2) 
RETURN varchar2 AS 
--  V_PASSNO  varchar2(20) := 'P0574968';
  V_DOC     number;
  V_Results   varchar2(100);
--V_WLCD VARCHAR2(20) := 'S063191';
--V_EFIRST VARCHAR2(100) :='BOUN';
--V_ELAST VARCHAR2(100) :='TONGVONGKHAM';
--V_EMID  VARCHAR2(100) :=null;
--V_NAT  VARCHAR2(100) :='';

BEGIN

  select count(*) into V_DOC from pibicsdm2.WLINDICATECARD wl where IDCCD = '0020' and wl.docno = P_PASSNO;
  
if V_DOC >= 1 
then
   V_Results := 'Found Passport';
 
end if;
  return V_Results;
END;

 --select FN_Chk_BL('P0574968') from dual;
/
