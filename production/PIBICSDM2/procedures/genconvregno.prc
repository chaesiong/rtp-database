CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."GENCONVREGNO" IS
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
    cursor c1 is

    select convregno, count('X') from vw_tmmain where (to_char(inoutdate, 'YYYYMM') between '201301' and '201412') and dept_seqno  = 16 and cardtype = '2' 
    and convregno is not null and convregno not like 'FG9999%'
    group by convregno
    having Count('X') > 20;

    dept c1%rowtype;  
begin 
 open c1;
 loop fetch c1 into dept; exit when c1%notfound;
    
    insert into flightnumbers_dept (
       seqno, convregno, dept_seqno, 
       flightprefix, flightnumber, cardtype, 
       upddte, remark) 
    values (investigate_seq.nextval,
     dept.convregno,
     '16',
     null,
     null,
     '2',
     sysdate,
     'BEGIN FLIGHT NO. DEPT 16');
    commit;
 
 end loop; --cursor
 close c1;
 commit; 
 --Exception
   --when others then
         --null;--prompt(sqlerrm||'[Re-Gen Error]');
end;


END GENCONVREGNO;
/
