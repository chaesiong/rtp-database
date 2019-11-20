CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATE_BARCODE_LA" IS
tmpVar NUMBER;
BEGIN
declare
    sysdateTxt varchar2(25);
    sysdateFile varchar2(8);
    batchlogno_seq number(20);
    file_ut utl_file.file_type;
    v_countTotalRow number(20);
    BEGIN
        v_countTotalRow := 0;
        
        select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
        select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
        
        file_ut := utl_file.fopen('LOGS_DIR','log_MIGRATE_BARCODE_LA '|| sysdateFile ||'.txt','W');
        utl_file.put_line(file_ut,sysdatetxt||' Start MIGRATE_BARCODE_LA ... !!!');     
        utl_file.fflush(file_ut);              
        
        -- Insert batchlog
        batchlogno_seq := batchlog_seq.nextval;

        insert
        into batchlog
        (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus) 
        values ( batchlogno_seq, 'MIG_BCL', '888', 'MIGRATE_BARCODE_LA', null, 0, 0, 0, sysdate, null, '1', 'MIG_BCL', sysdate, 'N');
        commit;
        -- End Insert batchlog
            
        FOR laApplyRec IN (select FN_ADDRESS90_SEQNO from la_apply where FN_ADDRESS90_SEQNO in (SELECT ANDD_SEQNO from fn_address90 where SUBSTR(barcode,4) <> passportno))
        LOOP
            --Start Save log Old data
            /*INSERT INTO fn_address90_log
            (FN_ADDRESS90_LOG_SEQNO
            ,LOG_FLAG
            ,LOG_USRUPD
            ,LOG_DATE
            ,ANDD_SEQNO
            ,PASSPORTNO
            ,TM6NO
            ,EFAMILYNM
            ,EMIDDLENM
            ,EFIRSTNM
            ,BIRTHDATE
            ,NATION_SEQNO
            ,SEX
            ,VISATYPE_SEQNO
            ,INDTE
            ,CONV_SEQNO
            ,HTYPE_SEQNO
            ,BUILDING
            ,ADDR
            ,ROAD
            ,PV_SEQNO
            ,AMP_SEQNO
            ,TMB_SEQNO
            ,TEL
            ,DOCDATE
            ,FNPERSON_SEQNO
            ,FINE_SEQNO
            ,CREATE_DATE
            ,CREATE_BY
            ,UPDATE_DATE
            ,UPDATE_BY
            ,VERSION
            ,DEPT_SEQNO
            ,FULLNAME
            ,NATIONCD
            ,VISATYPE
            ,CONV
            ,TMBNM
            ,AMPNM
            ,PVNM
            ,SEXTXT
            ,USERNAME
            ,FLIGHTNO
            ,IPADDRESS
            ,UIPADDRESS
            ,REMARK_BL
            ,FINE_REMARK
            ,FIGHTNO
            ,PERMITDATE
            ,FINE_DATE
            ,FINE_NUMBER
            ,FLIGHTPREFIX
            ,FLIGHTNUMBER
            ,BARCODE
            ,T_ID
            ,NEXT_DATE
            ,FINE2_SEQNO
            ,FNEXLOGSEQNO
            ,IMPFLAG
            ,FNZONE_SEQNO
            ,UFNZONE_SEQNO
            )
            
            select 
            (select RUNNO+1 from SEQ_RUNNO where tablenm = 'FN_ADDRESS90_LOG')
            ,'O'
            ,'angkarn'
            ,sysdate
            ,ANDD_SEQNO
            ,PASSPORTNO
            ,TM6NO
            ,EFAMILYNM
            ,EMIDDLENM
            ,EFIRSTNM
            ,BIRTHDATE
            ,NATION_SEQNO
            ,SEX
            ,VISATYPE_SEQNO
            ,INDTE
            ,CONV_SEQNO
            ,HTYPE_SEQNO
            ,BUILDING
            ,ADDR
            ,ROAD
            ,PV_SEQNO
            ,AMP_SEQNO
            ,TMB_SEQNO
            ,TEL
            ,DOCDATE
            ,FNPERSON_SEQNO
            ,FINE_SEQNO
            ,CREATE_DATE
            ,CREATE_BY
            ,UPDATE_DATE
            ,UPDATE_BY
            ,VERSION
            ,DEPT_SEQNO
            ,FULLNAME
            ,NATIONCD
            ,VISATYPE
            ,CONV
            ,TMBNM
            ,AMPNM
            ,PVNM
            ,SEXTXT
            ,USERNAME
            ,FLIGHTNO
            ,IPADDRESS
            ,UIPADDRESS
            ,REMARK_BL
            ,FINE_REMARK
            ,FIGHTNO
            ,PERMITDATE
            ,FINE_DATE
            ,FINE_NUMBER
            ,FLIGHTPREFIX
            ,FLIGHTNUMBER
            ,BARCODE
            ,T_ID
            ,NEXT_DATE
            ,FINE2_SEQNO
            ,FNEXLOGSEQNO
            ,IMPFLAG
            ,FNZONE_SEQNO
            ,UFNZONE_SEQNO
            from fn_address90
            where ANDD_SEQNO in (laApplyRec.FN_ADDRESS90_SEQNO) 
            and SUBSTR(barcode,4) <> passportno;
            Update SEQ_RUNNO set RUNNO = RUNNO+1 where tablenm = 'FN_ADDRESS90_LOG';*/
            --End save Log Old data
        
            UPDATE fn_address90 SET BARCODE = GET_NATIONSBYSEQ(NATION_SEQNO,'S')||PASSPORTNO
            where ANDD_SEQNO = laApplyRec.FN_ADDRESS90_SEQNO
            and SUBSTR(barcode,4) <> passportno;
            Commit;
            
            --Start Save log Old data
            /*INSERT INTO FN_PERSON_LOG
            (FN_PERSON_LOG_SEQNO
            ,LOG_FLAG
            ,LOG_USRUPD
            ,LOG_DATE
            ,FNPERSON_SEQNO
            ,PASSPORTNO
            ,TM6NO
            ,EFAMILYNM
            ,EMIDDLENM
            ,EFIRSTNM
            ,BIRTHDATE
            ,NATION_SEQNO
            ,SEX
            ,VISATYPE_SEQNO
            ,INDTE
            ,CONV_SEQNO
            ,HTYPE_SEQNO
            ,BUILDING
            ,ADDR
            ,ROAD
            ,PV_SEQNO
            ,AMP_SEQNO
            ,TMB_SEQNO
            ,TEL
            ,DOCDATE
            ,NEXT_DATE
            ,PREVIOUS_DATE
            ,CREATE_DATE
            ,CREATE_BY
            ,UPDATE_DATE
            ,UPDATE_BY
            ,VERSION
            ,FIGHTNO
            ,PERMITDATE
            ,FLIGHTPREFIX
            ,FLIGHTNUMBER
            ,BARCODE
            ,FNEXLOGSEQNO
            ,PHONE_HOME
            ,EMAIL
            ,ANDD_SEQNO
            ,DEPT_SEQNO
            )
            select 
            (select RUNNO+1 from SEQ_RUNNO where tablenm = 'FN_PERSON_LOG')
            ,'O'
            ,'angkarn'
            ,sysdate
            ,FNPERSON_SEQNO
            ,PASSPORTNO
            ,TM6NO
            ,EFAMILYNM
            ,EMIDDLENM
            ,EFIRSTNM
            ,BIRTHDATE
            ,NATION_SEQNO
            ,SEX
            ,VISATYPE_SEQNO
            ,INDTE
            ,CONV_SEQNO
            ,HTYPE_SEQNO
            ,BUILDING
            ,ADDR
            ,ROAD
            ,PV_SEQNO
            ,AMP_SEQNO
            ,TMB_SEQNO
            ,TEL
            ,DOCDATE
            ,NEXT_DATE
            ,PREVIOUS_DATE
            ,CREATE_DATE
            ,CREATE_BY
            ,UPDATE_DATE
            ,UPDATE_BY
            ,VERSION
            ,FIGHTNO
            ,PERMITDATE
            ,FLIGHTPREFIX
            ,FLIGHTNUMBER
            ,BARCODE
            ,FNEXLOGSEQNO
            ,PHONE_HOME
            ,EMAIL
            ,ANDD_SEQNO
            ,DEPT_SEQNO
            from FN_PERSON
            where ANDD_SEQNO in (laApplyRec.FN_ADDRESS90_SEQNO) 
            and SUBSTR(barcode,4) <> passportno;
            Update SEQ_RUNNO set RUNNO = RUNNO+1 where tablenm = 'FN_PERSON_LOG';*/
            --End save Log Old data
            
            UPDATE fn_person SET BARCODE = GET_NATIONSBYSEQ(NATION_SEQNO,'S')||PASSPORTNO
            where ANDD_SEQNO = laApplyRec.FN_ADDRESS90_SEQNO
            and SUBSTR(barcode,4) <> passportno;
            Commit;
            
            v_countTotalRow := v_countTotalRow + 1; 
            
            -- Update batchlog
            update batchlog set prrow =  prrow + 1 where batchlogno = batchlogno_seq;
            commit;
            -- End Update batchlog
        END LOOP;
        -- Last Update batchlog
        update batchlog
        set totalrow   = v_countTotalRow,
        prrow          = v_countTotalRow,
        endprocess     = sysdate,
        status         = '0',
        tfstatus       = 'Y'
        where batchlogno = batchlogno_seq;
        commit;
        -- End Last Update batchlog
        
        utl_file.put_line(file_ut,'Total MIGRATE_BARCODE_LA  :'||v_countTotalRow);
        utl_file.fflush(file_ut);
        select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
        utl_file.put_line(file_ut,sysdatetxt||' Complete MIGRATE_BARCODE_LA ... !!!'); 
        utl_file.fclose(file_ut);
    Exception
    WHEN no_data_found THEN
        --dbms_output.put_line('NOT DATA FOUND!');
        utl_file.put_line(file_ut,'NOT DATA FOUND');
        utl_file.fflush(file_ut);
        utl_file.fclose(file_ut);
    WHEN others THEN
        --dbms_output.put_line('Error!');
        utl_file.put_line(file_ut,SQLERRM);
        utl_file.fflush(file_ut);
        utl_file.fclose(file_ut);
   END;
END MIGRATE_BARCODE_LA;
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATE_BARCODE_LA" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATE_BARCODE_LA" TO "BIOSAADM";
