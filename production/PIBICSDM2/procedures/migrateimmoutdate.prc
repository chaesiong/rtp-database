CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEIMMOUTDATE" IS
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrownum number(20);
commitrow number(20);
foundin  number(20);
batchlogno_seq number(20);
checkImage char(1);
addressfn varchar2(1800);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
        select * from tmmain where to_char(outdte, 'YYYYMMDDHH24MISS') between '20140701120000' and '20140702235900'
        and outcreusr <> 'PIS001' 
        and outtm6no <> 'TM66666' and outtm6no <> '0000000' and typedata <> 'LA_APPLY' and typedata <> 'VOA' 
        order by outdte asc;        
    rec_tm c1%rowtype;  
begin
    totalrownum:=0;
    commitrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
       
    batchlogno_seq := batchlog_seq.nextval;
    insert
    into batchlog
    (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus) 
    values ( batchlogno_seq, 'PIBICS', '999', 'MIGRATELASTIMMOUTDATE', null, 0, 0, 0, sysdate, null, '1', 'ADMIN01', sysdate, 'N');     
    commit;  
 
    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_MIGRATELASTIMMOUTDATE'||sysdateFile||'.txt','W');
    utl_file.put_line(file_ut,sysdateTxt||' Start MIGRATELASTIMMOUTDATE .... !!!');utl_file.fflush(file_ut); 
    open c1;
 
    foundin := 0;
    checkImage := null;
    addressfn := null;
    loop fetch c1 into rec_tm; exit when c1%notfound;    
    <<itemtm_loop>> for itm in
     (
        select * from (
            select * from immigration where 
            tdtno = rec_tm.outtdtno and nationcd = rec_tm.nationcd order by inoutdte desc
        ) where rownum =1
     )
     loop
        if (to_number(to_char(rec_tm.outdte, 'YYYYMMDDHH24MISS')) >  to_number(to_char(itm.inoutdte, 'YYYYMMDDHH24MISS'))) then
            update immigration
            set tm6no = rec_tm.outtm6no, inoutdte = rec_tm.outdte, cardtype = '2', tfirstnm = rec_tm.tfirstnm, tmiddlenm = rec_tm.tmiddlenm,
            tfamilynm = rec_tm.tfamilynm, efirstnm = rec_tm.efirstnm, emiddlenm = rec_tm.emiddlenm, efamilynm = rec_tm.efamilynm, sex = rec_tm.sex, 
            birthdte = rec_tm.birthdte, nationcd = rec_tm.nationcd, tdtcd = rec_tm.outtdtcd, tdtno = rec_tm.outtdtno, visaexpdte = rec_tm.outvisaexpdte, 
            passportexpdte = rec_tm.outpassportexpdte, updusr = rec_tm.outupdusr, upddte = rec_tm.outupddte, updterm = rec_tm.outupdterm, 
            remark = rec_tm.outremark, imginout = rec_tm.outimg, deptcd = rec_tm.outdeptcd, status = rec_tm.outstatus, tm5_seqno = rec_tm.outtm5_seqno, 
            tm2inout_seqno = rec_tm.outtm2inout_seqno, pm_re_entry =  rec_tm.outpm_re_entry, pm_reexpdte = rec_tm.outpm_reexpdte, 
            pm_extension = rec_tm.outpm_extension, pm_exexpdte = rec_tm.outpm_exexpdte, pm_non_quota = rec_tm.outpm_non_quota, 
            pm_nonexpdte = rec_tm.outpm_nonexpdte, newpermit= rec_tm.outpermitdte, permitcd = rec_tm.outpermitcd, convcd= rec_tm.outconvcd, 
            convregno = rec_tm.outconvregno, seqno = rec_tm.outseqno, flightprefix = rec_tm.outflightprefix, flightnumber = rec_tm.outflightnumber,
            visatypecd = rec_tm.outvisatypecd where personid = rec_tm.personid;
        end if;
     end loop;
    
    totalrownum:=totalrownum+1;   
    commitrow:=commitrow+1;
    if commitrow = 1000 then
        update batchlog set prrow = totalrownum where batchlogno = batchlogno_seq;
        commit;
      commitrow:=0;
    end if; 

 end loop; --cursor
 close c1;
  update batchlog
   set totalrow     = totalrownum,
     prrow          = totalrownum,
     endprocess     = sysdate,
     status         = '0',
     tfstatus       = 'Y'
   where batchlogno = batchlogno_seq;
   commit;
 utl_file.put_line(file_ut,'total :'||totalrownum);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End MIGRATELASTIMMINDATE .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 --Exception
  --when others then
 -- null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END MIGRATEIMMOUTDATE;
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEIMMOUTDATE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEIMMOUTDATE" TO "BIOSAADM";
