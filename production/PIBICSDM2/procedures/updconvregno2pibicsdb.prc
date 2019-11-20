CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."UPDCONVREGNO2PIBICSDB" IS
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
    cursor c1 is

    select * from flightnumbers_dept where length(convregno) <> 8;

    dept c1%rowtype;  
begin
 open c1;
 loop fetch c1 into dept; exit when c1%notfound;
    fprefix :=null;
    fnumber := null;
    
    if length(dept.convregno) = 7 then
        fprefix := substr(dept.convregno, 1, 3);
        fnumber := substr(dept.convregno, 4);
    else
        fprefix := substr(dept.convregno, 1, 2);
        fnumber := substr(dept.convregno, 3);   
    end if;    
 
    update flightnumbers_dept set flightprefix = fprefix, flightnumber = fnumber where seqno = dept.seqno;
    commit;
 
 end loop; --cursor
 close c1;
 commit; 
 --Exception
   --when others then
         --null;--prompt(sqlerrm||'[Re-Gen Error]');
end;


END UPDCONVREGNO2PIBICSDB;
/
  GRANT EXECUTE ON "PIBICSDM2"."UPDCONVREGNO2PIBICSDB" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."UPDCONVREGNO2PIBICSDB" TO "BIOSAADM";
