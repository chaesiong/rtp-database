CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."TF_TMRUNNOIMM" IS
tmpVar NUMBER;
BEGIN
declare
    sysdateTxt varchar2(25);
    sysdateFile varchar2(8);
    totalrow number(20);
    file_ut UTL_FILE.FILE_TYPE;
    datatype varchar2(10);
    cursor c1 is
    --select tmrunno, indte, outdte from tmmain@tmdb where (to_char(indte, 'mmyyyy') = '022011' or to_char(outdte, 'mmyyyy') = '022011');
    --select tmrunno, indte, outdte from tmmain@tmdb where (to_char(indte, 'yyyymmdd') between '20110301' and '20110308') or (to_char(outdte, 'yyyymmdd') between '20110301' and '20110308');
select tmrunno, indte, outdte from tmmain@tmdb where to_char(outdte, 'mmyyyy') = '022011'
and tmrunno not in (select replace(tmrunno, 'ITIMS') from tmmain where to_char(outdte, 'mmyyyy') = '022011');
    rectm c1%rowtype;  
begin 
 totalrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_tmrunnoIMM'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start insert tmrunno imm 2 pibics .... !!!');utl_file.fflush(file_ut); 
 open c1;
    loop fetch c1 into rectm; exit when c1%notfound;
        if(rectm.indte is not null and rectm.outdte is null) then
            datatype :='IN';
        elsif (rectm.indte is null and rectm.outdte is not null) then
            datatype :='OUT';
        else
            datatype :='INOUT';
        end if;
        insert into tmrunnoimm (tmrunno, typedata, indte, outdte, month) values (rectm.tmrunno, datatype, rectm.indte, rectm.outdte, '022011');
        totalrow:=totalrow+1;
        commit;
    end loop; --cursor
 close c1;
 commit; 
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End insert tmrunno imm 2 pibics .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut); 
 Exception
   when others then
     utl_file.put_line(file_ut,'Error by tmrunno :'||rectm.tmrunno);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
         null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END TF_TMRUNNOIMM;
/
