CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."VOAONLINEDAY" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       VOAONLINEDAY
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        23/06/2015   Sumet-C       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     VOAONLINEDAY
      Sysdate:         23/06/2015
      Date and Time:   23/06/2015, 22:03:03, and 23/06/2015 22:03:03
      Username:        Sumet-C (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
    DECLARE
    sysdateTxt varchar2(25);
    sysdateFile varchar2(8);
    sysdateCurrent varchar2(8);
    totalrownum number(20);
    commitrow number(20);
    totaldelete number(20);
    batchlogno_seq number(20);
    postfix varchar2(20);
    --file_ut UTL_FILE.FILE_TYPE;
    
    CURSOR c1 IS
    select voao_seqno from voa_online where to_char(indte, 'yyyymmdd') = to_char(sysdate-2, 'yyyymmdd');
    rec_voa c1%ROWTYPE;
    
    BEGIN
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        sysdateFile := to_char(sysdate, 'yyyymmdd');
        sysdateCurrent := to_char(sysdate, 'yyyymmdd');
        totalrownum := 0;
        commitrow := 0;
        totaldelete := 0;
        
        batchlogno_seq := batchlog_seq.nextval;
        insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (batchlogno_seq, 'VOA', '3', 'VOAONLINEDAY', null, 0, 0, 0, sysdate, null, '1', 'VOAONLINE001', sysdate, 'N', 0, 0, 0, sysdate);
        commit;
        
        --file_ut := UTL_FILE.FOPEN('LOGS_DIR', 'LOG_VOAONLINEDAY' || sysdateFile || '.txt', 'W');
        --utl_file.put_line(file_ut, sysdateTxt || ' Start VOAONLINEDAY .... !!!');
        --utl_file.fflush(file_ut);
        
        OPEN c1;
        LOOP FETCH c1 INTO rec_voa; EXIT WHEN c1%NOTFOUND;
           postfix := 'DELETE';
          
            FOR rec_voalist IN (select voalo_seqno from voalist_online where voao_seqno = rec_voa.voao_seqno)
            LOOP
                commitrow := commitrow + 1;
                totalrownum := totalrownum + 1;
                totaldelete := totaldelete + 1;
                
                insert into voalist_online_log (voalo_log_seqno, log_flag, log_usrupd, log_date, version, create_by, create_date, update_by, update_date, 
                voalo_seqno, passport_place, passport_expdate, passport_issuedate, passportno, tm6no, suffix_seqno, efamilynm, efirstnm, emiddlenm, 
                birth_date, sex, nation_seqno, rpjseqno, occ_seqno, verify_blacklist, sts, voao_seqno, voar_seqno, peradd, count_seqno) 
                select voalistonline_log_seq.nextval, 'M', 'VOAONLINEDAY', sysdate, version, create_by, create_date, update_by, update_date, 
                voalo_seqno, passport_place, passport_expdate, passport_issuedate, passportno, tm6no, suffix_seqno, efamilynm, efirstnm, emiddlenm, 
                birth_date, sex, nation_seqno, rpjseqno, occ_seqno, verify_blacklist, sts, voao_seqno, voar_seqno, peradd, count_seqno 
                from voalist_online where voalo_seqno = rec_voalist.voalo_seqno;
                
                delete voalist_online where voalo_seqno = rec_voalist.voalo_seqno;
                
                DBMS_OUTPUT.PUT_LINE('voalo_seqno = ' || rec_voalist.voalo_seqno || ' ' || postfix);
                --utl_file.put_line(file_ut, 'voalo_seqno = ' || rec_voalist.voalo_seqno || ' ' || postfix);
                --utl_file.fflush(file_ut);
             END LOOP;
             
             commitrow := commitrow + 1;
             totalrownum := totalrownum + 1;
             totaldelete := totaldelete + 1;
             
             insert into voa_online_log (voao_log_seqno, log_flag, log_usrupd, log_date, version, create_by, create_date, update_by, update_date, 
             voao_seqno, barcode, visatype_seqno, fromcountry, in_conv_seqno, in_convno, in_flightprefix, in_flightnumber, addr, peradd, thairef, 
             pv_seqno, amp_seqno, tmb_seqno, in_dept_seqno, indte, out_dept_seqno, out_convno, out_flightprefix, out_flightnumber, out_conv_seqno, outdte) 
             select voaonline_log_seq.nextval, 'M', 'VOAONLINEDAY', sysdate, version, create_by, create_date, update_by, update_date, 
             voao_seqno, barcode, visatype_seqno, fromcountry, in_conv_seqno, in_convno, in_flightprefix, in_flightnumber, addr, peradd, thairef, 
             pv_seqno, amp_seqno, tmb_seqno, in_dept_seqno, indte, out_dept_seqno, out_convno, out_flightprefix, out_flightnumber, out_conv_seqno, outdte 
             from voa_online where voao_seqno = rec_voa.voao_seqno;
             
             delete voa_online where voao_seqno = rec_voa.voao_seqno;
             
             DBMS_OUTPUT.PUT_LINE('voao_seqno = ' || rec_voa.voao_seqno || ' ' || postfix);
            --utl_file.put_line(file_ut, 'voao_seqno = ' || rec_voa.voao_seqno || ' ' || postfix);
            --utl_file.fflush(file_ut);
            
            IF commitrow >= 1000 THEN
                update batchlog set prrow = prrow + commitrow, totaldel = totaldelete where batchlogno = batchlogno_seq;
                commit;
                commitrow := 0;
            END IF;
            
        END LOOP;
        CLOSE c1;
        
        update batchlog  set totalrow = totalrownum, prrow = totalrownum, totaldel = totaldelete, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
        commit;
        
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        --utl_file.put_line(file_ut, 'Total : ' || totalrownum);
        --utl_file.fflush(file_ut);
        --utl_file.put_line(file_ut, sysdateTxt || ' End VOAONLINEDAY .... !!!');
        --utl_file.fflush(file_ut);
        --utl_file.fclose(file_ut);
    
--    EXCEPTION
--        WHEN others THEN
--            DBMS_OUTPUT.PUT_LINE(sqlerrm||'[Re-Gen Error]');
     -- null;--prompt(sqlerrm||'[Re-Gen Error]');
     
    END;
END VOAONLINEDAY;
/
