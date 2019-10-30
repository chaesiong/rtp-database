CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_STAGING4PIBICS_INTF"."P_MAPP_ZONE_TERMINAL" AS 
BEGIN
    DECLARE
    totalrownum number(8);
    err_code VARCHAR2(1000);
    err_msg VARCHAR2(1000);
  
  CURSOR c1 IS
    SELECT T.ID FROM DL_BORDERCONTROL.TERMINALS T 
        WHERE T.BORDER_POST IN ('73F1C9E773553746E053650616AC8267','73F1C9E773C83746E053650616AC8267');
  
    rec_terminals c1%ROWTYPE;
  
    BEGIN
    
        totalrownum := 0;
    
        OPEN c1;
        LOOP FETCH c1 INTO rec_terminals; EXIT WHEN c1%NOTFOUND;
  
            INSERT INTO DL_STAGING4PIBICS_INTF.MAPP_ZONE_TERMINAL (ZONE_SEQNO,INS_TERMINAL) VALUES (0,rec_terminals.ID);
            COMMIT;
            dbms_output.put_line('0 = '||rec_terminals.ID);
            totalrownum := totalrownum+1;
            
        END LOOP;
        dbms_output.put_line(totalrownum); 
        
        CLOSE c1;
            exception
                when others then
                    err_code := SQLCODE;
                    err_msg := SUBSTR(SQLERRM, 1, 200);
                    dbms_output.put_line(err_code);
                    dbms_output.put_line(err_msg);
   END;

END P_MAPP_ZONE_TERMINAL;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."P_MAPP_ZONE_TERMINAL" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."P_MAPP_ZONE_TERMINAL" TO "BIOSUPPORT";
