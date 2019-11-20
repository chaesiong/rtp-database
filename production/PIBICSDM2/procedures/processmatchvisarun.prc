CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESSMATCHVISARUN" IS
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
    
        with visarunlog16 as (
            select passportno, nationcd, birthdte, to_char(inoutdte, 'yyyymmdd') inoutdte from visarunlog 
            where dept_seqno  in (select dept_seqno from department 
            where (dept_seqno = 16 or rel_code = 16) or rel_code in (select dept_seqno 
            from department where rel_code = 16))
            and to_char(inoutdte, 'YYYYMM') = '201503'
            group by passportno, nationcd, birthdte, to_char(inoutdte, 'yyyymmdd')
        ) select * from visarunlog16;  
        
    rec_tm c1%rowtype;  
begin
    totalrow:=0;
    commitrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_PROCESSMATCHVISARUN'||sysdateFile||'.txt','W');
    utl_file.put_line(file_ut,sysdateTxt||' Start PROCESSMATCHVISARUN .... !!!');utl_file.fflush(file_ut); 
    open c1;
    loop fetch c1 into rec_tm; exit when c1% notfound;
    v_found := 'NOTFOUND';

   <<iteminter4_loop>> for tim in
   (
        select * from vw_tmmain where (tdtno=rec_tm.passportno) and (nationcd = rec_tm.nationcd) and (birthdte = rec_tm.birthdte) and to_char(inoutdate, 'yyyymmdd') = rec_tm.inoutdte   
    )
    loop
         

        insert into matchtravel (matchseqno, efamilynm, efirstnm, emiddlenm, sex, birthdte, intdtno, intm6no, indtesort) 
        values ( matchtravel_seqno.nextval, tim.efamilynm, tim.efirstnm, tim.emiddlenm, tim.sex, tim.birthdte, tim.tdtno, tim.tm6no, tim.inoutdate);
            
            
            chk_break := 'Y';
            v_found := 'FOUND';
      
        exit iteminter4_loop when chk_break='Y'; -- Break For Loop itemInter4
    end loop;--Loop For itemInter4
    
    chk_Break := 'N';
   
    
    totalrow:=totalrow+1;   
    commitrow:=commitrow+1; 
    commit; 
 end loop; --cursor
 close c1;
 commit; 
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End PROCESSMATCHVISARUN.... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 --Exception
  --when others then
   --null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END PROCESSMATCHVISARUN;
/
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSMATCHVISARUN" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSMATCHVISARUN" TO "BIOSAADM";
