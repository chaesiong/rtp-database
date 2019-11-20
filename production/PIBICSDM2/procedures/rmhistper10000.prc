CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."RMHISTPER10000" (start_mm IN VARCHAR2, end_mm IN VARCHAR2) IS
tmpVar NUMBER;
BEGIN
declare
    v_totalRow number(20);
    v_totalRound number(20);
    sysdateTxt varchar2(25);
    sysdateFile varchar2(8);
    v_date varchar2(8);
    start_date varchar2(8);
    end_date varchar2(8);
    batchlogno_seq number(20);
    file_ut utl_file.file_type;
    v_rowCommit number(20);
    v_countTotalRow number(20);
    BEGIN
        v_totalRow := 0;
        v_totalRound := 0;
        v_countTotalRow := 0;
        
        select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
        select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
    
        SELECT to_char(sysdate, 'YYYY') - 3 into v_date from dual;
        start_date := v_date||start_mm;
        end_date := v_date||end_mm;
        
        SELECT COUNT('X') into v_totalRow from tmmain where ((to_char(indte, 'YYYYMM') between start_date and end_date) or (to_char(outdte, 'YYYYMM') between start_date and end_date));
        IF v_totalRow > 0 THEN
            v_totalRound := CEIL(v_totalRow/10000);
             file_ut := utl_file.fopen('PISCES_DIR','logRemoveHistoryPIBICS '|| start_date || '_' || end_date||'.txt','W');
            utl_file.put_line(file_ut,sysdatetxt||' Start remove data PIBICS '|| start_date || ' - ' || end_date || ' History .... !!!');     
            utl_file.fflush(file_ut);              
            --DBMS_OUTPUT.PUT_LINE('Found '||v_totalRound||'  Rounds.');
            utl_file.put_line(file_ut, 'Found '||v_totalRound||'  Rounds.');
            utl_file.fflush(file_ut);            
            
            -- Insert batchlog
            batchlogno_seq := batchlog_seq.nextval;
            insert
            into batchlog
            (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus) 
            values ( batchlogno_seq, 'HIST', '999', 'ลบข้อมูลการเดินทาง (PIBICS)  '|| start_date || ' - ' || end_date , null, v_totalRow, 0, 0, sysdate, null, '1', ' HIST01', sysdate, 'N');
            commit;
            -- End Insert batchlog
                
            FOR v_round IN 1..v_totalRound
            LOOP
                SELECT COUNT('X') into v_rowCommit FROM tmmain where 
                ((to_char(indte, 'YYYYMM') between start_date and end_date)  or (to_char(outdte, 'YYYYMM') between start_date and end_date)) AND ROWNUM <= 10000;

                -- Start Delete data
                DELETE FROM tmmain where 
                ((to_char(indte, 'YYYYMM') between start_date and end_date)  or (to_char(outdte, 'YYYYMM') between start_date and end_date))  AND ROWNUM <= 10000;
                COMMIT;
              
                --DBMS_OUTPUT.PUT_LINE('Commit '||'Round['||v_round||'] : '||v_rowCommit||' Row.');
                 utl_file.put_line(file_ut, 'Commit '||'Round['||v_round||'] : '||v_rowCommit||' Row.');
              
                v_countTotalRow := v_countTotalRow+v_rowCommit; 
                -- End Delete data
                
                -- Update batchlog
                update batchlog set prrow =  prrow + v_rowCommit where batchlogno = batchlogno_seq;
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
            
            utl_file.put_line(file_ut, 'Data was commited '||v_countTotalRow||' Record.');
            utl_file.fflush(file_ut);
            -- End Process Delete data
            --DBMS_OUTPUT.PUT_LINE('Data was commited '||v_countTotalRow||' Record.'); 
        ELSE
            --DBMS_OUTPUT.PUT_LINE('NOT DATA FOUND');
            utl_file.put_line(file_ut,'NOT DATA FOUND');utl_file.fflush(file_ut);
        END IF;
                -- Start Write file
            utl_file.put_line(file_ut,'Total remove data  :'||v_countTotalRow);utl_file.fflush(file_ut);
            select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
            utl_file.put_line(file_ut,sysdatetxt||' Complete remove data PIBICS '|| start_date || ' - ' || end_date || ' History  ...!!!!'); 
            utl_file.fclose(file_ut);
            -- End Write file
    Exception
    WHEN no_data_found THEN
        --dbms_output.put_line('NOT DATA FOUND!');
        utl_file.put_line(file_ut,'NOT DATA FOUND');utl_file.fflush(file_ut);
        utl_file.fclose(file_ut);
    WHEN others THEN
        --dbms_output.put_line('Error!');
        utl_file.put_line(file_ut,'Error!');utl_file.fflush(file_ut);
        utl_file.fclose(file_ut);
   END;
END RMHISTPER10000;
/
  GRANT EXECUTE ON "PIBICSDM2"."RMHISTPER10000" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."RMHISTPER10000" TO "BIOSAADM";
