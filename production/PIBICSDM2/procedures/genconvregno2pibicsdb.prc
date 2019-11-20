CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."GENCONVREGNO2PIBICSDB" (v_dept IN number)  IS
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
fprefix varchar2(20);
fnumber varchar2(20);
v_seqno number(10);
    cursor c1 is
   
    select * from flightnumbers_dept where length(convregno) <> 8 and convregno not in (
    select trim(flightprefix||flightnumber) from flightnumbers where dept_seqno = 16 and flight_type ='N'  group by flightprefix||flightnumber);

    dept c1%rowtype;  
begin
 open c1;
 loop fetch c1 into dept; exit when c1%notfound;
v_seqno := null;
v_seqno := GetSEQ_RUNNO('FLIGHTNUMBERS');
  
 insert into flightnumbers (
   flightseqno, flightprefix, flightnumber, 
   dept_seqno, allflag, cardtype, 
   flightstartdte, flightenddte, actflag, 
   create_by, create_date, update_by, 
   update_date, version, flight_type) 
values (v_seqno , dept.flightprefix, dept.flightnumber, v_dept, 'N', dept.cardtype,
  sysdate, to_date('203010090900', 'YYYYMMDDHH24MI'), 'ACTIVE',  'sixteen', sysdate, 'sixteen', sysdate, '0', 'N');
  
  commit;
 end loop; --cursor
 close c1;
 commit; 
 --Exception
   --when others then
         --null;--prompt(sqlerrm||'[Re-Gen Error]');
end;


END GENCONVREGNO2PIBICSDB;
/
  GRANT EXECUTE ON "PIBICSDM2"."GENCONVREGNO2PIBICSDB" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GENCONVREGNO2PIBICSDB" TO "BIOSAADM";
