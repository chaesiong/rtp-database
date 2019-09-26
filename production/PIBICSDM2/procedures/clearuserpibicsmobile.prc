CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CLEARUSERPIBICSMOBILE" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       CLEARUSERPIBICSMOBILE
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        08/03/2013   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     CLEARUSERPIBICSMOBILE
      Sysdate:         08/03/2013
      Date and Time:   08/03/2013, 14:34:43, and 08/03/2013 14:34:43
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
begin
declare
sysdatetxt varchar2(25);
sysdatefile varchar2(8);
otalrow number(8);
totalrow number(8);
file_ut utl_file.file_type;
    cursor c1 is
    select * from (
    select a.*, sysdate, (extract(minute from (sysdate - timelinedate))*60) / 60 tlminute 
    from fw_log a 
    where systemmessage = 'SUCCESS LOGIN MOBILE' and logout_time is null) where tlminute > 4; 
    rec_auth c1%rowtype;  
begin
 totalrow:=0;
 open c1;
 loop fetch c1 into rec_auth; exit when c1%notfound;
    update fw_log set logout_type = 'A', logout_time = sysdate where sessionid = rec_auth.sessionid;
   commit;   
   totalrow:=totalrow+1;
 end loop; --cursor
 close c1;
  exception
      when others then
          null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END CLEARUSERPIBICSMOBILE;
/
