CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESSMATCHTRAVELOUT" IS
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
    
    /*select tdtno, min(personid) personid  from immigration 
    where to_char(inoutdte, 'YYYYMMDD') between '20130101' and '20130630'
    and imginout is not null 
    group by tdtno;*/
    
    --select * from vw_tmonline where (to_char(inoutdate, 'YYYYMM') between '201705' and '201706') and cardtype like '1' and nationcd like 'V03';
    
    select * from vw_tmonline where (to_char(inoutdate, 'YYYYMM') = '201612') and cardtype like '1' and nationcd like 'V03';
     
    rec_tm c1%rowtype;  
begin
    totalrow:=0;
    commitrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
    --file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_PROCESSMATCHTRAVELOUT'||sysdateFile||'.txt','W');
    --utl_file.put_line(file_ut,sysdateTxt||' Start PROCESSMATCHTRAVELOUT .... !!!');utl_file.fflush(file_ut); 
    open c1;
    loop fetch c1 into rec_tm; exit when c1%notfound;
    v_found := 'NOTFOUND';

    insert into matchtravel (matchseqno, efamilynm, efirstnm, emiddlenm, sex, 
    birthdte, intdtno, intm6no, indeptcd, inoutdte) 
    values (matchtravel_seqno.nextval, rec_tm.efamilynm, rec_tm.efirstnm, rec_tm.emiddlenm,
    rec_tm.sex, rec_tm.birthdte, rec_tm.tdtno, rec_tm.tm6no, rec_tm.deptcd, rec_tm.inoutdate);
    
    totalrow:=totalrow+1;   
    commitrow:=commitrow+1; 
    commit; 
 end loop; --cursor
 close c1;
 commit; 

 --Exception
  --when others then
   --null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END PROCESSMATCHTRAVELOUT;
/
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSMATCHTRAVELOUT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSMATCHTRAVELOUT" TO "BIOSAADM";
