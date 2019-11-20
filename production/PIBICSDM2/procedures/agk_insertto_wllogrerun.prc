CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."AGK_INSERTTO_WLLOGRERUN" IS
tmpVar NUMBER;
BEGIN
declare
    v_totalRow number(20);
    v_row number(20);
    
    BEGIN
    v_row := 0;
            FOR v_record IN (select tdtno, COUNT('X') CNT from vw_tmonline where to_char(inoutdate, 'YYYYMM') = '201311' and nationcd = 'T03' and tdtno like 'AA%' and TYPEDATA = 'การเดินทางเข้า-ออก' group by tdtno)-- (1..v_totalRound)
            LOOP
            v_row :=  v_row+1;
                INSERT INTO WLLOGRERUN(DEPT_SEQNO, TDTNO,CNT) VALUES (v_row,v_record.tdtno,v_record.cnt);

               -- UPDATE WLLOGRERUN SET DEPT_SEQNO = v_round;
                -- dbms_output.put_line(v_row);
                commit;
            END LOOP;
           
    Exception
    WHEN no_data_found THEN
        dbms_output.put_line('NOT DATA FOUND!');
    WHEN others THEN
        dbms_output.put_line('Error!');
   END;
END AGK_INSERTTO_WLLOGRERUN;
/
  GRANT EXECUTE ON "PIBICSDM2"."AGK_INSERTTO_WLLOGRERUN" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."AGK_INSERTTO_WLLOGRERUN" TO "BIOSAADM";
