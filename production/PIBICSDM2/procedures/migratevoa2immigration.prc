CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEVOA2IMMIGRATION" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       migrateVOA2IMMIGRATION
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        23/05/2012   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     migrateVOA2IMMIGRATION
      Sysdate:         23/05/2012
      Date and Time:   23/05/2012, 17:00:48, and 23/05/2012 17:00:48
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
timenow varchar2(25);
cursor c1 is       
       --select * from tminout where dept_seqno=209 and typedata='VOA' and nationcd is null;
       select * from tmmain where inseqno in (
       select to_char(B.TMINOUT_SEQNO) from voa_voa15 a, voa_voa15list b 
       where a.voa_seqno=b.voa_seqno and a.dept_seqno = 209 and to_char(a.create_date, 'yyyymmdd') = '20120525');
       rec_tmmain c1%rowtype;
begin
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into timenow from dual;
    dbms_output.put_line(timenow||' Start Process migrate voa 2 immigration .... !!!');       
    open c1;
        loop
        fetch c1 into rec_tmmain; exit when c1%notfound;
        dbms_output.put_line('PERSON_ID: '||rec_tmmain.personid);
        update immigration set nationcd = rec_tmmain.nationcd where personid = rec_tmmain.personid;
        commit;
        end loop;
    close c1;
    commit;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into timenow from dual;
    dbms_output.put_line(timenow||' Complete  Process migrate voa 2 immigration .... !!!');
end;

END migrateVOA2IMMIGRATION;
/
