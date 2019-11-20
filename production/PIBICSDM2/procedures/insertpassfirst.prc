CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."INSERTPASSFIRST" IS
tmpVar NUMBER;
BEGIN
declare
totalrow number(20);
commitrow number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    select * from fn_checkpassfirst_tmp
    order by user_id asc;
    rec_tm c1%rowtype;  
begin
 totalrow:=0;
 commitrow:=0;
 open c1;
    loop fetch c1 into rec_tm; exit when c1%notfound;    
   
         insert into fn_checkpassfirst (seqno, user_id, passwordmd5, password, chgpwddate, pv_seqno) 
    values ( fn_checkpwd_seq.nextval, rec_tm.user_id, rec_tm.passwordmd5, rec_tm.password, rec_tm.chgpwddate, rec_tm.pv_seqno);
    
    totalrow:=totalrow+1;   
    commitrow:=commitrow+1;
    if commitrow = 1000 then
     commitrow:=0;
   
    commit; 
   end if;   
 end loop; --cursor
 close c1;
 commit;  
 Exception
  when others then
   null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END insertPassfirst;
/
  GRANT EXECUTE ON "PIBICSDM2"."INSERTPASSFIRST" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."INSERTPASSFIRST" TO "BIOSAADM";
