CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESSTRAVELINVESTIGATE" IS
tmpVar NUMBER;
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is    
       --select tdtno from wllogrerun where nationcd = 'K02' and cnt = '84';    
       
       --select * from tmmorethan where nationcd = 'V03' and cnt  in  (9,10,11,33,34,60,61,62,72,76);
       
       select * from tmmorethan where nationcd = 'R04' and cnt  in  (9,10,11,12,20,21,22,34,35,54,55);

        
    rec_tm c1%rowtype;  
begin

    delete travelinvestigate;

    commit;

 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_travelInvestigate'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start travel investtgate .... !!!');utl_file.fflush(file_ut); 
 open c1;
    loop fetch c1 into rec_tm; exit when c1%notfound;    
    <<itemtm_loop>> for itm in
     (
        /*select * from (select  'ITTIPON'||tm6no tm6no, 'ITTIPON'||tdtno tdtno, nationenm, efamilynm, efirstnm, emiddlenm,  sex, 'ITTIPON'||birthdte birthdte,  cardtype,   
        'ITTIPON'||inoutdte inoutdte, convregno, depttnm, nationcd, deptcd from vw_tmmain where tdtno=rec_tm.tdtno and nationcd = 'V03' order by inoutdate desc) where rownum =1*/
        select  'ITTIPON'||tm6no tm6no, 'ITTIPON'||tdtno tdtno, nationenm, efamilynm, efirstnm, emiddlenm,  sex, 'ITTIPON'||birthdte birthdte,  cardtype,   
        'ITTIPON'||inoutdte inoutdte, convregno, depttnm, nationcd, deptcd, inoutdate, visatypetnm, to_char(visaexpdte, 'dd/mm/yyyy') visaexpdte, getAge(birthdte) age
         from vw_tmonline where tdtno=rec_tm.tdtno and nationcd = 'R04' 
     )
     loop
        insert into travelinvestigate (INVESTIGATESEQ, seq, tm6no, tdtno, efamilynm, efirstnm, emiddlenm, sex, birthdte, nationenm, cardtype, inoutdte, 
        convregno,  depttnm, nationcd, deptcd, inoutdate, visa, visaexp, age, cnt) 
        values (investigate_seq.nextval,null, itm.tm6no, itm.tdtno, itm.efamilynm, itm.efirstnm, itm.emiddlenm, itm.sex, itm.birthdte, itm.nationenm, 
        itm.cardtype, itm.inoutdte,itm.convregno, itm.depttnm, itm.nationcd, itm.deptcd, itm.inoutdate, itm.visatypetnm, itm.visaexpdte, itm.age, rec_tm.cnt );
     end loop;
    
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
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End travel investtgate.... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 --Exception
  --when others then
   -- null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END ;
/
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSTRAVELINVESTIGATE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSTRAVELINVESTIGATE" TO "BIOSAADM";
