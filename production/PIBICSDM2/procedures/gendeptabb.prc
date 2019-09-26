CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."GENDEPTABB" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       GENDEPTABB
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        9/2/2011          1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     GENDEPTABB
      Sysdate:         9/2/2011
      Date and Time:   9/2/2011, 13:35:46, and 9/2/2011 13:35:46
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
    abbfmt1 varchar2(200);
    abbfmt2 varchar2(200);
    cursor c1 is
     select * from department where rel_code = 16 or dept_seqno = 16;
    dept c1%rowtype;  
begin 
 open c1;
 loop fetch c1 into dept; exit when c1%notfound;
    abbfmt1 := GET_DEPTABBNNM(dept.dept_seqno, 'T');
    abbfmt2 := GET_DEPTABBNM(dept.dept_seqno, 'T');
    update department set deptabbfmt1 = abbfmt1, deptabbfmt2 = abbfmt2 where dept_seqno=dept.dept_seqno;
 end loop; --cursor
 close c1;
 commit; 
 Exception
   when others then
         null;--prompt(sqlerrm||'[Re-Gen Error]');
end;


END GENDEPTABB;
/
