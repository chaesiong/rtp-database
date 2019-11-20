CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESS_LA" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PROCESS_LA
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        03/04/2018   ITTIPON-S       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PROCESS_LA
      Sysdate:         03/04/2018
      Date and Time:   03/04/2018, 17:07:07, and 03/04/2018 17:07:07
      Username:        ITTIPON-S (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
   DECLARE
    sysdateTxt varchar2(25);
    sysdateFile varchar2(8);
    sysdateCurrent varchar2(8);
    totalrownum number(20);
    commitrow number(20);
    totalinsert number(20);
    totaldelete number(20);
    totalupdate number(20);
    batchlogno_seq number(20);
    postfix varchar2(20);
    fs_fees_seq number(20);
    fs_feesdetail_seq number(20);
    
    CURSOR c1 IS
        
        select (select dept_seqno from department where dept_seqno between 387 and 468 and pv_seqno = (select pv_seqno from province where pvcd = substr(tt2_rcode, 1, 2))) dept_seqno, apid, 
        decode(replace(lower(etitle), '.', ''), 'mr', 1, 'miss', 2, 'mrs', 3) suffix_seqno, efname efirstnm, elname efamilynm, nat, decode(nat, 'MYM', 27, 'CAM', 36, 'LAO', 114) nation_senqo, passport_no tdtno,
        case when length(dob) = 8 then substr(dob, 7) || '/' || substr(dob, 5, 2) || '/' || (substr(dob, 1, 4) - 543) end birthdte, garden sex, 
        case when length(visa_issue_date) = 8 then substr(visa_issue_date, 7) || '/' || substr(visa_issue_date, 5, 2) || '/' || (substr(visa_issue_date, 1, 4) - 543) end visa_issue_date,
        substr(tm6, 1, 7) tm6no, case when length(visa_exp_date) = 8 then substr(visa_exp_date, 7) || '/' || substr(visa_exp_date, 5, 2) || '/' || (substr(visa_exp_date, 1, 4) - 543) end visa_exp_date,
        addr, fnsplit(addr, '#', 1) building, fnsplit(addr, '#', 2) moo, fnsplit(addr, '#', 4) soi, 
        get_addrseqbyname(fnsplit(addr, '#', 5), fnsplit(addr, '#', 6), fnsplit(addr, '#', 7), 'T') tmb_seqno, 
        get_addrseqbyname(fnsplit(addr, '#', 5), fnsplit(addr, '#', 6), fnsplit(addr, '#', 7), 'A') amp_seqno, 
        get_addrseqbyname(fnsplit(addr, '#', 5), fnsplit(addr, '#', 6), fnsplit(addr, '#', 7), 'P') pv_seqno,
        case when length(card_iss_date) = 8 then substr(card_iss_date, 7) || '/' || substr(card_iss_date, 5, 2) || '/' || (substr(card_iss_date, 1, 4) - 543) end card_iss_date,
        case when length(card_exp_date) = 8 then substr(card_exp_date, 7) || '/' || substr(card_exp_date, 5, 2) || '/' || (substr(card_exp_date, 1, 4) - 543) end card_exp_date,
        case when master_desc = 'บุคคลธรรมดา' then fnsplit(master_name, ' ', '1') else master_name end empfirstname, 
        case when master_desc = 'บุคคลธรรมดา' then fnsplit(master_name, ' ', '2') end empfamilynm,
        master_address, fnsplit(master_address, '#', 1) masbuilding, fnsplit(master_address, '#', 2) masmoo, fnsplit(master_address, '#', 4) massoi, 
        get_addrseqbyname(fnsplit(master_address, '#', 5), fnsplit(master_address, '#', 6), fnsplit(master_address, '#', 7), 'T') mastmb_seqno, 
        get_addrseqbyname(fnsplit(master_address, '#', 5), fnsplit(master_address, '#', 6), fnsplit(master_address, '#', 7), 'A') masamp_seqno, 
        get_addrseqbyname(fnsplit(master_address, '#', 5), fnsplit(master_address, '#', 6), fnsplit(master_address, '#', 7), 'P') maspv_seqno,
        bookno, amount, 21 visatype_seqno
        from moi_la_apply where process_flag is null;       
        
    rec_imm c1%ROWTYPE;
    
    BEGIN
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        sysdateFile := to_char(sysdate, 'yyyymmdd');
        sysdateCurrent := to_char(sysdate, 'yyyymmdd');
        totalrownum := 0;
        commitrow := 0;
        totalinsert := 0;
        totaldelete := 0;
        totalupdate := 0;
        fs_fees_seq := 0;
        fs_feesdetail_seq := 0;
        
        batchlogno_seq := batchlog_seq.nextval;
        insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (batchlogno_seq, 'LA', '74', 'LA APPLY', null, 0, 0, 0, sysdate, null, '1', 'LA0001', sysdate, 'N', 0, 0, 0, sysdate);
        commit;
        
        OPEN c1;
        LOOP FETCH c1 INTO rec_la; EXIT WHEN c1%NOTFOUND;
            


            
            totalrownum := totalrownum + 1;
            commitrow := commitrow + 1;
            IF commitrow = 1000 THEN
                update batchlog set prrow = prrow + commitrow, totalins = totalinsert, totaldel = totaldelete, totalupd = totalupdate where batchlogno = batchlogno_seq;
                commit;
                commitrow := 0;
            END IF;
        
        END LOOP;
        CLOSE c1;
        
        update batchlog  set totalrow = totalrownum, prrow = totalrownum, totalins = totalinsert, totaldel = totaldelete, totalupd = totalupdate, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
        commit;
        

--    EXCEPTION
--        WHEN others THEN
--            --DBMS_OUTPUT.PUT_LINE(sqlerrm||'[Re-Gen Error]');
     -- null;--prompt(sqlerrm||'[Re-Gen Error]');
     
    END;
END PROCESS_LA;
/
  GRANT EXECUTE ON "PIBICSDM2"."PROCESS_LA" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PROCESS_LA" TO "BIOSAADM";
