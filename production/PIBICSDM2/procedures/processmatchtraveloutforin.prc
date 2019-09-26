CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESSMATCHTRAVELOUTFORIN" IS
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
chk_Break varchar2(1);
v_found varchar2(8);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is      
        
            select efamilynm, emiddlenm, efirstnm, sex, birthdte, nationcd, outtdtno, outtm6no, to_char(outdte, 'dd/mm/yyyy hh24:mi') outdte, 
            outdte outdtesort, get_conveyances(outconvcd, 'T') outconveyance, outconvregno, outdeptcd, b.abbrnm
            from tmmain a, department b where a.outdeptcd = b.deptcd(+) and a.nationcd <> 'T03'
            --and (to_char(outdte, 'YYYYMM') between '201404' and  '201405') and outdeptcd  in ('00070','00071');
            --and (to_char(outdte, 'YYYYMM') between '201404' and  '201405') and outdeptcd  = '00054';
            --and (to_char(outdte, 'YYYYMM') between '201404' and  '201405') and outdeptcd  = '00090';
            --and (to_char(outdte, 'YYYYMM') between '201404' and '201405') and outdeptcd = '00119';
            --and (to_char(outdte, 'YYYYMM') between '201404' and '201405') and outdeptcd in (select deptcd from department where dept_seqno in (221,233,232,209,239,226,219,212,207,216,211,214));
            --and to_char(outdte, 'yyyymmdd') between '20140614' and '20140618' and outdeptcd in (select deptcd from department 
            --where rel_code in (select dept_seqno from department where dept_seqno = 7 or rel_code = 7) and checkpoint = 'Y' and actflag = 'Y');
            and (to_char(outdte, 'YYYYMM') between '201406' and '201407')
             and outdeptcd in ('00127','00119','00210', '00207','00131','00090','00091','00086','00087','00095','00186','00107','00162','00161','00163','00151','00148','00146','00209');
            --and nationcd in ('V03', 'K02', 'R04');
            --and outdeptcd in ('00162','00161','00163','00208');
        
    rec_tm c1%rowtype;  
begin
    totalrow:=0;
    commitrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_PROCESSMATCHTRAVELOUT'||sysdateFile||'.txt','W');
    utl_file.put_line(file_ut,sysdateTxt||' Start PROCESSMATCHTRAVELOUT .... !!!');utl_file.fflush(file_ut); 
    open c1;
    loop fetch c1 into rec_tm; exit when c1% notfound;
    v_found := 'NOTFOUND';

   <<iteminter4_loop>> for iteminter4 in
   (
    select * from matchtravel where (intdtno=rec_tm.outtdtno) and (nationcd = rec_tm.nationcd) and (indeptcd = rec_tm.outdeptcd) order by indtesort desc    
    )
    loop
         
        if  (to_number(to_char(iteminter4.indtesort, 'YYYYMMDD')) =  to_number(to_char(rec_tm.outdtesort, 'YYYYMMDD'))) and 
        (to_number(to_char(iteminter4.indtesort, 'YYYYMMDDHH24MISS')) >  to_number(to_char(rec_tm.outdtesort, 'YYYYMMDDHH24MISS'))) then
            update matchtravel set  efamilynm = rec_tm.efamilynm, efirstnm  = rec_tm.efirstnm, emiddlenm = rec_tm.emiddlenm,
            sex = rec_tm.sex, birthdte = rec_tm.birthdte, outtdtno = rec_tm.outtdtno, outtm6no = rec_tm.outtm6no, outdte = rec_tm.outdte,
            outdtesort = rec_tm.outdtesort, outconveyance = rec_tm.outconveyance, outconvregno = rec_tm.outconvregno, outdeptcd = rec_tm.outdeptcd,
            outdepttnm = rec_tm.abbrnm 
            where matchseqno = iteminter4.matchseqno;
            chk_break := 'Y';
            v_found := 'FOUND';
        end if;
      
        exit iteminter4_loop when chk_break='Y'; -- Break For Loop itemInter4
    end loop;--Loop For itemInter4
    
    chk_Break := 'N';
    
    if v_found = 'NOTFOUND' then 
        insert into matchtravel (matchseqno, efamilynm, efirstnm, emiddlenm, sex, birthdte, outtdtno, outtm6no, outdte, outdtesort, outconveyance, outconvregno, nationcd) 
        values ( MATCHTRAVEL_SEQNO.nextval,  rec_tm.efamilynm, rec_tm.efirstnm, rec_tm.emiddlenm, rec_tm.sex, 
        rec_tm.birthdte,rec_tm.outtdtno, rec_tm.outtm6no, rec_tm.outdte, rec_tm.outdtesort, rec_tm.outconveyance, rec_tm.outconvregno, rec_tm.nationcd );
    end if;        
    
    totalrow:=totalrow+1;   
    commitrow:=commitrow+1; 
    commit; 
 end loop; --cursor
 close c1;
 commit; 
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End PROCESSMATCHTRAVELOUT.... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 --Exception
  --when others then
   --null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END PROCESSMATCHTRAVELOUTFORIN;
/
