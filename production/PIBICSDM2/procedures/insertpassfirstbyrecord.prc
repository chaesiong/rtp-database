CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."INSERTPASSFIRSTBYRECORD" IS
tmpVar NUMBER;
BEGIN
declare
totalrow number(20);
commitrow number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
--        select rownum,a.* from(
--        select * from(
--        select user_id, passwordmd5, password, chgpwddate, pv_seqno from  fn_checkpassfirst_tmp
--        minus
--        select user_id, passwordmd5, password, chgpwddate, pv_seqno from fn_checkpassfirst
--        ) order by pv_seqno desc,user_id
--        ) a
--        order by rownum ;
select user_id,a.password passwordmd5,b.password,chgpwddate,b.pv_seqno from fw_user a , fn_hotel b, fn_register c 
where a.user_id = b.hotelcd and a.user_id<>b.password and b.hotel_seqno = c.hotel_seqno and to_char(c.regisdte,'yyyymmdd') between '20150807' and  '20150921';
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
    if commitrow = 100 then
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

END insertPassfirstByRecord;
/
  GRANT EXECUTE ON "PIBICSDM2"."INSERTPASSFIRSTBYRECORD" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."INSERTPASSFIRSTBYRECORD" TO "BIOSAADM";
