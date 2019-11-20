CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_DELTMINOUT_M" 
(
  v_dstart IN VARCHAR2 
) AS 
BEGIN
  DECLARE
  totalrownum number(8);
  
  CURSOR c1 IS
    SELECT SEQNO FROM PIBICSDM2.TMINOUTLOG 
        WHERE TO_CHAR(LOGDTE,'dd/mm/yyyy') = v_dstart AND LOGFLAG = 'D';
  
    rec_tminoutlog c1%ROWTYPE;
  
    BEGIN
    
        totalrownum := 0;
    
        OPEN c1;
        LOOP FETCH c1 INTO rec_tminoutlog; EXIT WHEN c1%NOTFOUND;
  
            DELETE FROM PIBICSDM2.TMINOUT WHERE SEQNO = rec_tminoutlog.SEQNO;
            COMMIT;
            dbms_output.put_line('DELETE FROM PIBICSDM2.TMINOUT WHERE SEQNO = '||rec_tminoutlog.SEQNO);
            totalrownum := totalrownum+1;
            
        END LOOP;
        dbms_output.put_line(totalrownum);
        
        CLOSE c1;
            exception
                when others then
                    null;
   END;
END P_DELTMINOUT_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_DELTMINOUT_M" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_DELTMINOUT_M" TO "BIOSAADM";
