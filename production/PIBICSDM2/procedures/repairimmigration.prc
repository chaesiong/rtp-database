CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."REPAIRIMMIGRATION" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       REPAIRIMMIGRATION
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        18/10/2011   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     REPAIRIMMIGRATION
      Sysdate:         18/10/2011
      Date and Time:   18/10/2011, 00:55:14, and 18/10/2011 00:55:14
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
    sysdateTxt varchar2(25);
    sysdateFile varchar2(8);
    totalrow number(20);
    cmtrow number(20);
    updrow number(20);
    file_ut UTL_FILE.FILE_TYPE;
    cursor c1  is   
      
    /*select a.*, to_number(to_char(a.inoutdte, 'YYYYMMDDHH24MISS')) minoutdte from tmmainlast a where a.flagprocess is null;*/

  --  select * from (
    select a.*, to_number(to_char(a.inoutdte, 'YYYYMMDDHH24MISS')) minoutdte 
    from tmmainlast a 
    where a.flagprocess is null
    and to_char(inoutdte, 'yyyymm')='201105' 
    order by inoutdte desc;
  --  ) where rownum <=120;    
    
    rec_tm c1%rowtype;
begin
    cmtrow:=0;totalrow:=0;updrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
    file_ut := UTL_FILE.FOPEN('LOGS_DIR','logRepairImmigration'||sysdateFile||'.txt','W');
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    utl_file.put_line(file_ut,sysdateTxt||' Start Repair Immigration .... !!!');     
    open c1;
     loop fetch c1 into rec_tm; exit when c1%notfound;
    if (rec_tm.efamilynm is not null) and (rec_tm.efirstnm is not null) and (rec_tm.emiddlenm is not null) then  
        --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
        --utl_file.put_line(file_ut,sysdateTxt||' Case 3 Names personid line 1'); 
        <<itemInter1_loop>> FOR itemInter1 IN
        (
        select  to_number(to_char(inoutdte, 'YYYYMMDDHH24MISS')) imm_inoutdte from immigration b
        where b.personid = rec_tm.immpersonid     
        )
        LOOP
            --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
            --utl_file.put_line(file_ut,sysdateTxt||' Case 3 Names personid line 2');            
            if rec_tm.minoutdte >  itemInter1.imm_inoutdte then
                --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
                --utl_file.put_line(file_ut,sysdateTxt||' Case 3 Names Update personid line 3');                
                update immigration
                set personid = rec_tm.immpersonid, tm6no = rec_tm.tm6no, inoutdte = rec_tm.inoutdte, cardtype = rec_tm.cardtype, tdtcd = rec_tm.tdtcd,
                tdtno = rec_tm.tdtno, visatypecd = rec_tm.visatypecd, visaexpdte = rec_tm.visaexpdte,
                passportdte = rec_tm.passportdte, passportexpdte = rec_tm.passportexpdte, updusr = 'PIS004',
                upddte = sysdate, updterm = '192.169.1.199',
                imginout = rec_tm.imginout, deptcd = rec_tm.deptcd, convregno = rec_tm.convregno,
                convcd = rec_tm.convcd 
                where personid = rec_tm.immpersonid;
                updrow:=updrow+1;
                --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
                --utl_file.put_line(file_ut,sysdateTxt||' Case 3 Names Update personid line 4');                      
            end if;
            --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
            --utl_file.put_line(file_ut,sysdateTxt||' Case 3 Names Update Tmmain line 5');                
            --update tmmain set personid = rec_tm.immpersonid where  efamilynm = rec_tm.efamilynm and efirstnm=rec_tm.efirstnm
            --and emiddlenm = rec_tm.emiddlenm and nationcd =rec_tm.nationcd and sex = rec_tm.sex and birthdte = rec_tm.birthdte;         
            ---select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
            --utl_file.put_line(file_ut,sysdateTxt||' Case 3 Names Update Tmmain line 6');                
        END LOOP;--Loop For  
    elsif (rec_tm.efamilynm is not null) and (rec_tm.efirstnm is not null) and (rec_tm.emiddlenm is null) then
        --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
        --utl_file.put_line(file_ut,sysdateTxt||' Case 2 Names personid line 1'); 
        <<itemInter1_loop>> FOR itemInter1 IN
        (        
        select  to_number(to_char(inoutdte, 'YYYYMMDDHH24MISS')) imm_inoutdte from immigration b
        where b.personid = rec_tm.immpersonid           
        )
        LOOP
            --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
            --utl_file.put_line(file_ut,sysdateTxt||' Case 2 Names personid line 2');           
            if rec_tm.minoutdte >  itemInter1.imm_inoutdte then
                --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
                --utl_file.put_line(file_ut,sysdateTxt||' Case 2 Names Update personid line 3');              
                update immigration
                set personid = rec_tm.immpersonid, tm6no = rec_tm.tm6no, inoutdte = rec_tm.inoutdte, cardtype = rec_tm.cardtype, tdtcd = rec_tm.tdtcd,
                tdtno = rec_tm.tdtno, visatypecd = rec_tm.visatypecd, visaexpdte = rec_tm.visaexpdte,
                passportdte = rec_tm.passportdte, passportexpdte = rec_tm.passportexpdte, updusr = 'PIS004',
                upddte = sysdate, updterm = '192.169.1.199',
                imginout = rec_tm.imginout, deptcd = rec_tm.deptcd, convregno = rec_tm.convregno,
                convcd = rec_tm.convcd 
                where personid = rec_tm.immpersonid;   
                updrow:=updrow+1;
                --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
                --utl_file.put_line(file_ut,sysdateTxt||' Case 2 Names Update personid line 4');                       
            end if;
            --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
            --utl_file.put_line(file_ut,sysdateTxt||' Case 2 Names Update Tmmain line 5');     
            --update tmmain set personid = rec_tm.immpersonid where efamilynm = rec_tm.efamilynm and efirstnm=rec_tm.efirstnm
            --and emiddlenm is null and nationcd =rec_tm.nationcd and sex = rec_tm.sex and birthdte = rec_tm.birthdte;        
            --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
            --utl_file.put_line(file_ut,sysdateTxt||' Case 2 Names Update Tmmain line 6');                       
        END LOOP;--Loop For                              
    elsif (rec_tm.efamilynm is not null) and (rec_tm.efirstnm is null) and (rec_tm.emiddlenm is null) then
        --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
        --utl_file.put_line(file_ut,sysdateTxt||' Case 1 efamilynm Names personid line 1');         
        <<itemInter1_loop>> FOR itemInter1 IN
        (        
        select  to_number(to_char(inoutdte, 'YYYYMMDDHH24MISS')) imm_inoutdte from immigration b
        where b.personid = rec_tm.immpersonid            
        )
        LOOP
            --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
            --utl_file.put_line(file_ut,sysdateTxt||' Case 1 efamilynm Names personid line 2');         
            if rec_tm.minoutdte >  itemInter1.imm_inoutdte then
                --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
                --utl_file.put_line(file_ut,sysdateTxt||' Case 1 efamilynm Names Update personid line 3');               
                update immigration
                set personid = rec_tm.immpersonid, tm6no = rec_tm.tm6no, inoutdte = rec_tm.inoutdte, cardtype = rec_tm.cardtype, tdtcd = rec_tm.tdtcd,
                tdtno = rec_tm.tdtno, visatypecd = rec_tm.visatypecd, visaexpdte = rec_tm.visaexpdte,
                passportdte = rec_tm.passportdte, passportexpdte = rec_tm.passportexpdte, updusr = 'PIS004',
                upddte = sysdate, updterm = '192.169.1.199',
                imginout = rec_tm.imginout, deptcd = rec_tm.deptcd, convregno = rec_tm.convregno,
                convcd = rec_tm.convcd 
                where personid = rec_tm.immpersonid;    
                updrow:=updrow+1;
                --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
                --utl_file.put_line(file_ut,sysdateTxt||' Case 1 efamilynm Names Update personid line 4');              
            end if;
            --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
            --utl_file.put_line(file_ut,sysdateTxt||' Case 1 efamilynm Names Update Tmmain line 5');   
            --update tmmain set personid = rec_tm.immpersonid where efamilynm = rec_tm.efamilynm and efirstnm is null
            --and emiddlenm is null and nationcd =rec_tm.nationcd and sex = rec_tm.sex and birthdte = rec_tm.birthdte;  
            --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
            --utl_file.put_line(file_ut,sysdateTxt||' Case 1 efamilynm Names Update Tmmain line 6');                 
        END LOOP;--Loop For itemInter1      
    elsif (rec_tm.efamilynm is null) and (rec_tm.efirstnm is not null) and (rec_tm.emiddlenm is null) then 
        --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
        --utl_file.put_line(file_ut,sysdateTxt||' Case 1 efirstnm Names personid line 1');     
        <<itemInter1_loop>> FOR itemInter1 IN
        (
        select  to_number(to_char(inoutdte, 'YYYYMMDDHH24MISS')) imm_inoutdte from immigration b
        where b.personid = rec_tm.immpersonid
        )
        LOOP
            --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
            --utl_file.put_line(file_ut,sysdateTxt||' Case 1 efirstnm Names personid line 2');          
            if rec_tm.minoutdte >  itemInter1.imm_inoutdte then
                --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
                --utl_file.put_line(file_ut,sysdateTxt||' Case 1 efirstnm Names Update personid line 3');              
                update immigration
                set personid = rec_tm.immpersonid, tm6no = rec_tm.tm6no, inoutdte = rec_tm.inoutdte, cardtype = rec_tm.cardtype, tdtcd = rec_tm.tdtcd,
                tdtno = rec_tm.tdtno, visatypecd = rec_tm.visatypecd, visaexpdte = rec_tm.visaexpdte,
                passportdte = rec_tm.passportdte, passportexpdte = rec_tm.passportexpdte, updusr = 'PIS004',
                upddte = sysdate, updterm = '192.169.1.199',
                imginout = rec_tm.imginout, deptcd = rec_tm.deptcd, convregno = rec_tm.convregno,
                convcd = rec_tm.convcd 
                where personid = rec_tm.immpersonid;  
                updrow:=updrow+1;
                --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
                --utl_file.put_line(file_ut,sysdateTxt||' Case 1 efirstnm Names Update personid line 4');                       
            end if;
            --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
            --utl_file.put_line(file_ut,sysdateTxt||' Case 1 efirstnm Names Update Tmmain line 5');               
            --update tmmain set personid = rec_tm.immpersonid where efamilynm is null and efirstnm = rec_tm.efirstnm
            --and emiddlenm is null and nationcd =rec_tm.nationcd and sex = rec_tm.sex and birthdte = rec_tm.birthdte;  
            --select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
            --utl_file.put_line(file_ut,sysdateTxt||' Case 1 efirstnm Names Update Tmmain line 6');                   
        END LOOP;--Loop For itemInter1
    end if;
    update tmmainlast set flagprocess = 'Y' where tmseqno=rec_tm.tmseqno;
    totalrow:=totalrow+1;
    cmtrow:=cmtrow+1;
    if cmtrow = 100 then
    --utl_file.put_line(file_ut,sysdateTxt||' Commit:'||cmtrow);utl_file.fflush(file_ut);
        commit;
        cmtrow:=0;
    end if;  
    END LOOP;--Loop Cursor
    close c1; 
    COMMIT;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    utl_file.put_line(file_ut,'Total Repair Immigration  :'||totalrow);utl_file.fflush(file_ut);
    utl_file.put_line(file_ut,sysdateTxt||' Complete Repair Immigration  ...!!!!'); 
    UTL_FILE.FCLOSE(file_ut); 
END;


END REPAIRIMMIGRATION;
/
