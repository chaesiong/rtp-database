CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_MGTHAIPASSSEQ26" is
tmpvar number;
/******************************************************************************
   NAME:       PS_BEGINCARDTYPETWO
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        28/08/2014   Sumet-C       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PS_BEGINCARDTYPETWO
      Sysdate:         28/08/2014
      Date and Time:   28/08/2014, 17:47:32, and 28/08/2014 17:47:32
      Username:        Sumet-C (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
begin
  declare
    sysdatetxt varchar2(25);
    sysdatefile varchar2(8);
    totalrownum number(20);
    commitrow number(20);
    totaldelete number(20);
    batchlogno_seq number(20);
    postfix varchar2(20);
    file_ut utl_file.file_type;
    
    cursor c1 is    
        select * from thaipassport where pps_seqno = 2 and pass_seqno <> '6' and tmppass_seqno is null and to_char(update_date, 'yyyymmdd') = to_char(sysdate -1, 'yyyymmdd');
    rec_thp c1%rowtype;
    
    begin
        sysdatetxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        sysdatefile := to_char(sysdate, 'yyyymmdd');
        totalrownum := 0;
        commitrow := 0;
        totaldelete := 0;
        
        batchlogno_seq := batchlog_seq.nextval;
        insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (batchlogno_seq, 'PPS', '44', 'MIGRATE THP 2 and 6', null, 0, 0, 0, sysdate, null, '1', 'PPS001', sysdate, 'N', 0, 0, 0, sysdate);
        commit;
        
        --file_ut := utl_file.fopen('LOGS_DIR', 'log_PS_MIGRATETHP2and6' || sysdatefile || '.txt', 'W');
        --utl_file.put_line(file_ut, sysdatetxt || ' Start PS_MIGRATETHP2and6 .... !!!');
        --utl_file.fflush(file_ut);
        
        open c1;
        loop fetch c1 into rec_thp; exit when c1%notfound;
            
            update thaipassport set tmppass_seqno = pass_seqno, pass_seqno = 6 where citizenid = rec_thp.citizenid and passportno = rec_thp.passportno;
            
            totalrownum := totalrownum + 1;
            commitrow := commitrow + 1;
            if commitrow = 1000 then
                update batchlog set prrow = prrow + commitrow  where batchlogno = batchlogno_seq;
                commit;
                commitrow := 0;
            end if;
            
            ----DBMS_OUTPUT.PUT_LINE('tdtno = ' || rec_imm.tdtno || ' nationcd = ' || rec_imm.nationcd || ' ' || postfix);
           -- utl_file.put_line(file_ut, 'tdtno = ' || rec_imm.tdtno || ' nationcd = ' || rec_imm.nationcd || ' ' || postfix);
            --utl_file.fflush(file_ut);
            
        end loop;
        close c1;
        
        update batchlog  set totalrow = totalrownum, prrow = totalrownum, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
        
        commit;
        
        sysdatetxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
       -- utl_file.put_line(file_ut, 'Total : ' || totalrownum);
       -- utl_file.fflush(file_ut);
     --   utl_file.put_line(file_ut, sysdatetxt || ' End PS_MIGRATETHP2and6 .... !!!');
      --  utl_file.fflush(file_ut);
        --utl_file.fclose(file_ut);
    
--    EXCEPTION
--        WHEN others THEN
--            --DBMS_OUTPUT.PUT_LINE(sqlerrm||'[Re-Gen Error]');
     -- null;--prompt(sqlerrm||'[Re-Gen Error]');
     
    end;
end ps_mgthaipassseq26;
/
