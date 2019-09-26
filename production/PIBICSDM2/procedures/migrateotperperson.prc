CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEOTPERPERSON" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       MIGRATEOTPERPERSON
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        28/08/2012   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     MIGRATEOTPERPERSON
      Sysdate:         28/08/2012
      Date and Time:   28/08/2012, 16:54:18, and 28/08/2012 16:54:18
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(20);
timenow varchar2(25);
totalrow number(20);
foundhr varchar2(20);
seqno number(20);
file_ut UTL_FILE.FILE_TYPE;
cursor c1 is              
    select a.sectionid, rankname, firstname, lastname, b.dept_seqno dept_seqno, decode(amtmemberdead, 0, null, 'Y') amtmemberdead, 
    decode(amtdead, 150, '1', 75, '2', '3') amtdead, decode(c.rank_seqno, null, 998, c.rank_seqno) rank_seqno
    from otperperson a, deptotmapping b, rank c where a.sectionid = b.sectionid and a.rankname=c.ranknm(+) order by a.sectionid;         
    recHR c1%rowtype;
begin
    totalrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDDHH24MI') into sysdateFile from dual;
    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_hrProfileOT'||sysdateFile,'W');
    utl_file.put_line(file_ut,sysdateTxt||' Start migrate OTPERPERON 2 PIBICS HR_PROFILE_OT .... !!!');utl_file.fflush(file_ut);    
    open c1;
        loop
        fetch c1 into recHR; exit when c1%notfound;
        foundhr:='NOTFOUND';
        
       /* BEGIN
            select max(runno) into seqno from seq_runno where TABLENM = 'HR_PROFILE_OT';        
            update seq_runno set runno = seqno+1 where TABLENM = 'HR_PROFILE_OT'; 
            commit;
        END;*/
        
        
        <<itemHr_loop>> FOR itemHR IN
            (
                select profile_seqno, pid, rank_seqno, level_seqno, rel_seqno, title_seqno, card_id, name, sname, 
                sex, c_type, mar_status, status_seqno, birth_date, pos_seqno, kp7, retire_date, sixty_date, quit_date, bank_seqno, acc_no, address1, address2, prov_code, 
                post_code, tel, mobile, email, health_benefit, cremation, create_by, create_date, update_by, update_date, version, dept_seqno, pos_date, pos_no, deptpolis_seqno 
                from hr_profile b where name = recHR.firstname and sname = recHR.lastname and c_type <> '9'          
            )
            LOOP
                seqno:=GetSEQ_RUNNO('HR_PROFILE_OT');
                foundhr:='FOUND';
                insert into hr_profile_ot (profile_seqno, pid, rank_seqno, level_seqno, rel_seqno, title_seqno, card_id, name, sname, sex, c_type, mar_status, 
                status_seqno, birth_date, pos_seqno, kp7, retire_date, sixty_date, quit_date, bank_seqno, acc_no, address1, address2, prov_code, 
                post_code, tel, mobile, email, health_benefit, cremation, create_by, create_date, update_by, update_date, version, dept_seqno, 
                pos_date, pos_no, deptpolis_seqno, sectionid, dept_seqno_old, exitperson) 
                values (seqno, itemHR.pid, recHR.rank_seqno, itemHR.level_seqno, itemHR.rel_seqno,
                itemHR.title_seqno, itemHR.card_id, itemHR.name, itemHR.sname, itemHR.sex, recHR.amtdead, itemHR.mar_status, itemHR.status_seqno,
                itemHR.birth_date, itemHR.pos_seqno, itemHR.kp7, itemHR.retire_date, itemHR.sixty_date, itemHR.quit_date, itemHR.bank_seqno, itemHR.acc_no,
                itemHR.address1, itemHR.address2, itemHR.prov_code, itemHR.post_code, itemHR.tel, itemHR.mobile, itemHR.email, itemHR.health_benefit,
                recHR.amtmemberdead, itemHR.create_by, itemHR.create_date, itemHR.update_by, itemHR.update_date, itemHR.version, recHR.dept_seqno, itemHR.pos_date,
                itemHR.pos_no, itemHR.deptpolis_seqno, recHR.sectionid, itemHR.dept_seqno, null);
                totalrow:=totalrow+1;
            END LOOP;
        
            if foundhr = 'NOTFOUND' then
                seqno:=GetSEQ_RUNNO('HR_PROFILE_OT');
                insert into hr_profile_ot (profile_seqno, rank_seqno, name, sname, c_type, cremation, create_by, create_date, update_by, update_date, version, dept_seqno, 
                sectionid, dept_seqno_old, exitperson) 
                values (seqno, recHR.rank_seqno, recHR.firstname, recHR.lastname, recHR.amtdead,
                recHR.amtmemberdead, 'OTSYSTEM', sysdate, 'OTSYSTEM', sysdate, 0, recHR.dept_seqno, recHR.sectionid, null, 'Y');
                totalrow:=totalrow+1;
            end if;
        commit;
        end loop;
        
    close c1;
    commit;
     utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
     select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
     utl_file.put_line(file_ut,sysdateTxt||' End migrate OTPERPERON 2 PIBICS HR_PROFILE_OT .... !!!');utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
end;
END MIGRATEOTPERPERSON;
/
