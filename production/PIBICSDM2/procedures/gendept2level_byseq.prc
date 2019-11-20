CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."GENDEPT2LEVEL_BYSEQ" (v_SEQNO IN number) IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       GENDEPT2LEVEL
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        26/11/2013   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     GENDEPT2LEVEL
      Sysdate:         26/11/2013
      Date and Time:   26/11/2013, 18:51:35, and 26/11/2013 18:51:35
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
    abbfmt1 varchar2(200);
    abbfmt2 varchar2(200);
    abbfmt3 varchar2(200);
    cursor c1 is
    select * from department where dept_seqno = v_SEQNO;
    dept c1%rowtype;  
begin 
 open c1;
 loop fetch c1 into dept; exit when c1%notfound;
    abbfmt1 := GET_DEPTNAMEABBLEVEL1(dept.dept_seqno, 'T');
    abbfmt2 := GET_DEPTNAMEABBLEVEL2(dept.dept_seqno, 'T');
    abbfmt3 := GET_DEPTNAMEABBLEVEL3(dept.dept_seqno, 'T');
    if dept.DEPTLEVEL = 1  then
         update department set deptabbfmt1 = abbfmt1 || ' สตม.' where dept_seqno=dept.dept_seqno;
         update department set deptabbfmt2 = abbfmt1 || '/สตม.' where dept_seqno=dept.dept_seqno;
         update department set deptabbfmt3 = abbfmt1 || ' สตม.' where dept_seqno=dept.dept_seqno;
         update department set deptabbfmt4 = 'สตม./'|| abbfmt1 where dept_seqno=dept.dept_seqno;
    elsif dept.DEPTLEVEL = 2  then
        update department set deptabbfmt1 = abbfmt2 || ' ' || abbfmt1 where dept_seqno=dept.dept_seqno;
        update department set deptabbfmt2 = abbfmt2 || '/' || abbfmt1 where dept_seqno=dept.dept_seqno;
        update department set deptabbfmt3 = abbfmt2 || ' ' || abbfmt1 where dept_seqno=dept.dept_seqno;
        update department set deptabbfmt4 = abbfmt1 || '/' || abbfmt2 where dept_seqno=dept.dept_seqno;
    elsif dept.DEPTLEVEL = 3  then
        update department set deptabbfmt1 = abbfmt3 || ' ' || abbfmt2 || ' ' || abbfmt1 where dept_seqno=dept.dept_seqno;
        update department set deptabbfmt2 = abbfmt3 || '/' || abbfmt2 || '/' || abbfmt1 where dept_seqno=dept.dept_seqno;
        update department set deptabbfmt3 = abbfmt3 || ' ' || abbfmt2 where dept_seqno=dept.dept_seqno;
        update department set deptabbfmt4 = abbfmt1 || '/' || abbfmt2 || '/' || abbfmt3 where dept_seqno=dept.dept_seqno;
    end if;
 end loop; --cursor
 close c1;
 commit; 
 Exception
   when others then
         null;--prompt(sqlerrm||'[Re-Gen Error]');
end;



END GENDEPT2LEVEL_BYSEQ;
/
  GRANT EXECUTE ON "PIBICSDM2"."GENDEPT2LEVEL_BYSEQ" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GENDEPT2LEVEL_BYSEQ" TO "BIOSAADM";
