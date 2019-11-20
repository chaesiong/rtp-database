CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEVOA2TMINOUT" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       migrateVOA2TMINOUT
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        23/05/2012   Administrator       1. Created this function.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     migrateVOA2TMINOUT
      Sysdate:         23/05/2012
      Date and Time:   23/05/2012, 16:59:37, and 23/05/2012 16:59:37
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
timenow varchar2(25);
cursor c1 is       
       select b.* from voa_voa15 a, voa_voa15list b 
       where a.voa_seqno=b.voa_seqno and a.dept_seqno = 209 and to_char(a.create_date, 'yyyymmdd') = '20120523';
       rec_tmmain c1%rowtype;
begin
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into timenow from dual;
    dbms_output.put_line(timenow||' Start Process migrate voa 2 tminout .... !!!');       
    open c1;
        loop
        fetch c1 into rec_tmmain; exit when c1%notfound;
        dbms_output.put_line('TMINOUT_SEQNO: '||rec_tmmain.tminout_seqno);
        update tminout set nationcd = get_NationsBySeq(rec_tmmain.nation_seqno, 'S') where seqno = rec_tmmain.tminout_seqno;
        commit;
        end loop;
    close c1;
    commit;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into timenow from dual;
    dbms_output.put_line(timenow||' Complete  Process migrate voa 2 tminout .... !!!');
end;

END migrateVOA2TMINOUT;
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEVOA2TMINOUT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEVOA2TMINOUT" TO "BIOSAADM";
