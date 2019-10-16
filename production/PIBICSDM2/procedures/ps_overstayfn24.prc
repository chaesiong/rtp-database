CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_OVERSTAYFN24" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PS_OVERSTAYFN24
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        19/06/2014   Sumet-C       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PS_OVERSTAYFN24
      Sysdate:         19/06/2014
      Date and Time:   19/06/2014, 11:52:10, and 19/06/2014 11:52:10
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
    totalupdate number(20);
    batchlogno_seq number(20);
    postfix varchar2(20);
    TMOVSSEQNO number(20);
    --file_ut UTL_FILE.FILE_TYPE;
    
    CURSOR c1 IS
    select  a.alien_seqno, a.passportno, a.count_seqno, c.name, c.addr, c.road, c.pv_seqno, c.amp_seqno, c.tmb_seqno, c.postcode, c.tel
    from fn_alienlist a, fn_addressnotify b, fn_hotel c 
    where a.addrn_seqno = b.addrn_seqno(+)  and b.hotel_seqno = c. hotel_seqno(+) 
    and to_char(a.update_date, 'yyyymmdd') = to_char(sysdate -1, 'yyyymmdd') and checkindte is not null 
    and a.passportno <> 'PASSPORT';
    rec_fn c1%ROWTYPE;
    
    BEGIN
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        sysdateFile := to_char(sysdate, 'yyyymmdd');
        sysdateCurrent := to_char(sysdate, 'yyyymmdd');
        totalrownum := 0;
        commitrow := 0;
        totalupdate := 0;
        
        batchlogno_seq := batchlog_seq.nextval;
        insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (batchlogno_seq, 'OVS', '18', 'OVERSTAYFN24 ' || to_char(sysdate -1, 'yyyymmdd'), null, 0, 0, 0, sysdate, null, '1', 'OVS001', sysdate, 'N', 0, 0, 0, sysdate);
        commit;
        
        --file_ut := UTL_FILE.FOPEN('LOGS_DIR', 'log_PS_OVERSTAYFN24' || sysdateFile || '.txt', 'W');
        --utl_file.put_line(file_ut, sysdateTxt || ' Start PS_OVERSTAYFN24 .... !!!');
        --utl_file.fflush(file_ut);
        
        OPEN c1;
        LOOP FETCH c1 INTO rec_fn; EXIT WHEN c1%NOTFOUND;
            postfix := '';
            TMOVSSEQNO := null;
            BEGIN
                select TMOVSSEQNO into TMOVSSEQNO 
                from processfines where tdtno = rec_fn.passportno
                and (case when rec_fn.count_seqno in (45, 94, 143) and count_seqno in (45, 94, 143) then 1 
                when rec_fn.count_seqno not in (45, 94, 143) and count_seqno = rec_fn.count_seqno then 1 else 0 end = 1)
                and typeaddr <> 'FN90' and rownum = 1;
                IF TMOVSSEQNO IS NOT NULL THEN
                    postfix := 'UPDATE';
                    totalupdate := totalupdate + 1;
                    update processfines set alien_seqno = rec_fn.alien_seqno, processdte = sysdate, building = rec_fn.name, addr = rec_fn.addr, road = rec_fn.road, 
                    pv_seqno = rec_fn.pv_seqno, amp_seqno = rec_fn.amp_seqno, tmb_seqno = rec_fn.tmb_seqno, tel = rec_fn.tel, typeaddr = 'FN38' 
                    where tdtno = rec_fn.passportno and count_seqno = rec_fn.count_seqno;
                    
                END IF;
            EXCEPTION WHEN NO_DATA_FOUND THEN
                NULL;
            END;
            
            totalrownum := totalrownum + 1;
            commitrow := commitrow + 1;
            IF commitrow = 1000 THEN
                update batchlog set prrow = prrow + commitrow, totalupd = totalupdate where batchlogno = batchlogno_seq;
                commit;
                commitrow := 0;
            END IF;
        
            --DBMS_OUTPUT.PUT_LINE('passportno = ' || rec_fn.passportno || ', nation_seqno = ' || rec_fn.count_seqno ||  ' ' || postfix);
            --utl_file.put_line(file_ut, 'passportno = ' || rec_fn.passportno || ', nation_seqno = ' || rec_fn.count_seqno || ' ' || postfix);
            --utl_file.fflush(file_ut);
        
        END LOOP;
        CLOSE c1;
        
        update batchlog set totalrow = totalrownum, prrow = totalrownum, totalupd = totalupdate, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
        commit;
        
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        --utl_file.put_line(file_ut, 'Total : ' || totalrownum);
        ---utl_file.fflush(file_ut);
        ---utl_file.put_line(file_ut, sysdateTxt || ' End PS_OVERSTAYFN24 .... !!!');
        ---utl_file.fflush(file_ut);
        --utl_file.fclose(file_ut);
    
--    EXCEPTION
--        WHEN others THEN
--            DBMS_OUTPUT.PUT_LINE(sqlerrm||'[Re-Gen Error]');
     -- null;--prompt(sqlerrm||'[Re-Gen Error]');
     
    END;
END PS_OVERSTAYFN24;
/