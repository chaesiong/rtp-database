CREATE OR REPLACE EDITIONABLE FUNCTION "SERVAPP"."F_PASSNO" (v_pass IN VARCHAR2) RETURN NUMBER AS 
    v_count  NUMBER;
BEGIN
  select count(*) into v_count from SERVAPP.THAIPASSPORT_MI t
  where t.passportno = v_pass ;
   if   v_count = 0 then
   RETURN 0;
   else
   RETURN 1;
   end if;
END F_PASSNO;
/
