CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATE_PERMITCHNG" IS
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
file_ut UTL_FILE.FILE_TYPE;
    
    cursor c1 is
    
    select a.chngperson_seqno, a.passportno, a.nation_seqno, a.efamilynm, a.visa_expdate, c.chgpermite_date
    from chng_person a, chng_changevisalist b, chng_changevisa c 
    where a.changevisalist_seqno = b.changevisalist_seqno 
    and b.changevisa_seqno = c.changevisa_seqno
    and a.changevisalist_seqno is not null
    and c.chgpermite_date is not null
    and to_char(a.visa_expdate, 'YYYYMMDD') <> to_char(c.chgpermite_date, 'YYYYMMDD')
    and to_char(c.chgpermite_date, 'YYYYMMDD') > to_char(sysdate, 'YYYYMMDD');
    
    --select * from visatype;

    recs c1%rowtype;
begin
    totalrow:=0;
    commitrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 
 --file_ut := UTL_FILE.FOPEN('PISCES_DIR','log_MIGRATE_FACT_ADDR24'||sysdateFile||'.txt','W');
 --utl_file.put_line(file_ut,sysdateTxt||' Start MIGRATE_FACT_ADDR24 .... !!!');utl_file.fflush(file_ut);
 
    open c1;
        loop fetch c1 into recs; exit when c1%notfound;
            
            update chng_person 
            set visa_expdate = to_date(to_char(recs.chgpermite_date, 'YYYYMMDD'), 'YYYYMMDD'), 
            flagupdate = '20180221 update permit visa exprie = ' || to_char(recs.visa_expdate, 'dd/MM/yyyy') 
            where chngperson_seqno = recs.chngperson_seqno;

                
            totalrow:=totalrow+1;
            commitrow:=commitrow+1;
            if commitrow = 1000 then
                commitrow:=0;
                --utl_file.put_line(file_ut,sysdateTxt||' Commit Rows'||totalrow);utl_file.fflush(file_ut);
                commit;
            end if;
        end loop; --cursor
    close c1;
    commit;
    --utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    --utl_file.put_line(file_ut,sysdateTxt||' End MIGRATE_FACT_ADDR24 .... !!!');utl_file.fflush(file_ut);
    --utl_file.fclose(file_ut);
 /*Exception
  when others then
     utl_file.put_line(file_ut,'Error by tmrunno :'||rec_tm.tmrunno);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');*/
end;

END MIGRATE_PERMITCHNG;
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATE_PERMITCHNG" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATE_PERMITCHNG" TO "BIOSAADM";
