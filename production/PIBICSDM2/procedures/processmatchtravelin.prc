CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESSMATCHTRAVELIN" IS
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
case_Tmmain varchar2(12); 
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
        
        select efamilynm, emiddlenm, efirstnm, sex, a.birthdte, a.nationcd, intdtno, intm6no, to_char(indte, 'dd/mm/yyyy hh24:mi') indte, 
        get_visatypes(invisatypecd, 'T') invisa, to_char(invisaexpdte, 'dd/mm/yyyy') invisaexpdte, indte indtesort, 
        get_conveyances(inconvcd, 'T') inconveyance, inconvregno,  indeptcd, b.deptabbfmt3
        from tmmain a, department b where a.indeptcd = b.deptcd(+) and a.nationcd <> 'T03'
        and (to_char(indte, 'YYYYMM') between '201406' and '201407')
        and indeptcd in ('00127','00119','00210', '00207','00131','00090','00091','00086','00087','00095','00186','00107','00162','00161','00163','00151','00148','00146','00209');
        
        --and indeptcd in ('00162','00161','00163','00208');
        
        --and (to_char(indte, 'YYYYMM') between '201404' and '201405') and indeptcd in ('00070','00071');
        --and (to_char(indte, 'YYYYMM') between '201404' and '201405') and indeptcd = '00054';        
        --and (to_char(indte, 'YYYYMM') between '201404' and '201405') and indeptcd = '00090';
        --and (to_char(indte, 'YYYYMM') between '201404' and '201405') and indeptcd = '00169';
        --and (to_char(indte, 'YYYYMM') between '201404' and '201405') and indeptcd = '00119';
        --and (to_char(indte, 'YYYYMM') between '201404' and '201405') and indeptcd in (select deptcd from department where dept_seqno in (221,233,232,209,239,226,219,212,207,216,211,214));
        --and to_char(indte, 'YYYYMM') between '201401' and '201406' 
        --and nationcd in ('V03', 'K02', 'R04')
        --and indeptcd in (select deptcd from department 
        --where rel_code in (select dept_seqno from department where dept_seqno = 7 or rel_code = 7) and checkpoint = 'Y' and actflag = 'Y');        
        
    rec_tm c1%rowtype;  
            
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_PROCESSMATCHTRAVELIN'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start PROCESSMATCHTRAVELIN .... !!!');utl_file.fflush(file_ut); 
 
  delete matchtravel;
  commit;
 
 open c1;
    loop fetch c1 into rec_tm; exit when c1%notfound;

    
    /*<<itemtm_loop>> for itm in
     (
        select Count('X') cnt from vw_tmmain where to_char(inoutdate, 'YYYYMM') > '201301' and cardtype = '2'
        --and tdtno = 'M78376577' and nationcd = 'K02'  
        and tdtno = rec_tm.intdtno and nationcd = rec_tm.nationcd  and deptcd  in rec_tm.indeptcd
     )
     loop*/
     
        insert into matchtravel (matchseqno, efamilynm, efirstnm, emiddlenm, sex, birthdte, intdtno, intm6no, indte, invisa, invisaexpdte, indtesort, inconveyance, inconvregno, indeptcd, indepttnm, nationcd, amount) 
        values ( matchtravel_seqno.nextval, rec_tm.efamilynm, rec_tm.efirstnm, rec_tm.emiddlenm, rec_tm.sex, rec_tm.birthdte, rec_tm.intdtno, rec_tm.intm6no, rec_tm.indte, rec_tm.invisa,
        rec_tm.invisaexpdte, rec_tm.indtesort, rec_tm.inconveyance, rec_tm.inconvregno, rec_tm.indeptcd, rec_tm.deptabbfmt3, rec_tm.nationcd, null);
        
        /*
     end loop;
     */

    commit;  
 end loop; --cursor
 close c1;
 commit; 
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End PROCESSMATCHTRAVELIN.... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 --Exception
  --when others then
   --null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END PROCESSMATCHTRAVELIN;
/
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSMATCHTRAVELIN" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSMATCHTRAVELIN" TO "BIOSAADM";
