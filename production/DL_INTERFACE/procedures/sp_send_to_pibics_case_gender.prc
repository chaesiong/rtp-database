CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_INTERFACE"."SP_SEND_TO_PIBICS_CASE_GENDER" AS 

cursor send_again is  SELECT a.BRDDOCID, a.SENDER_OBJECT_ID	
                           FROM DL_INTERFACE.UNSUCCESS_LIST a
                           WHERE a.UNSUCCESS = 2;
    
BEGIN 

    DECLARE
        sSubGender VARCHAR2(1); 
        sGender VARCHAR2(1) := null; 
        iSex NUMBER(32,0) := 0;
        
        BEGIN
        for LoopInfo in send_again 
        loop 
          Begin
            iSex := 0;
          
            SELECT substr(bor.mrzdg1, 65, 1) into sSubGender FROM DL_BORDERCONTROL.BORDERDOCUMENTS bor WHERE bor.BRDDOCID = LoopInfo.BRDDOCID;
            --DBMS_OUTPUT.PUT_LINE('sSubGender = ' || sSubGender);
            sGender := sSubGender;
            --DBMS_OUTPUT.PUT_LINE('sGender = ' || sGender);
            
            --DBMS_OUTPUT.PUT_LINE(iSex);
            
            if ((sGender = 'M') or (sGender = 'A') or (sGender = 'H') or (sGender = 'L') or (sGender = 'N') or (sGender = 'R') or (sGender = '?') or (sGender = 'V') or (sGender = '<'))
            then iSex := 1;
            else iSex := 0;
            end if;
            
            --DBMS_OUTPUT.PUT_LINE('IF 1');
            --DBMS_OUTPUT.PUT_LINE(iSex);
            --DBMS_OUTPUT.PUT_LINE(sGender);
            
            if (iSex != 1)
            then
                begin
                      if ((sGender = 'F') or (sGender = '4') or (sGender = 'C') or (sGender = 'E') or (sGender = 'T'))
                      then iSex := 2;
                      else iSex := 0;
                      end if;
                end;
            end if;
            
            --DBMS_OUTPUT.PUT_LINE('IF 2');
            --DBMS_OUTPUT.PUT_LINE(iSex);
            --DBMS_OUTPUT.PUT_LINE(sGender);
            
            if ((iSex = 1) or (iSex = 2))
            then
                begin  
                    update DL_BORDERCONTROL.BORDERDOCUMENTS 
                    set sex = iSex
                    where BRDDOCID = LoopInfo.BRDDOCID;
                    commit;
                --DBMS_OUTPUT.PUT_LINE('IF 3');
                --DBMS_OUTPUT.PUT_LINE(iSex);
                --DBMS_OUTPUT.PUT_LINE(sGender);
                        
                DL_INTERFACE.PKG_LISTENER.send_bordercontrol_movement(LoopInfo.SENDER_OBJECT_ID, 'I');
                end;
             end if;
          End;
          
          --DBMS_OUTPUT.PUT_LINE('END IF');
          --DBMS_OUTPUT.PUT_LINE(iSex);
          --DBMS_OUTPUT.PUT_LINE(sGender);
          
        end loop;
        END;
        
        DELETE FROM DL_INTERFACE.UNSUCCESS_LIST WHERE UNSUCCESS = 2;
        COMMIT;


END SP_SEND_TO_PIBICS_CASE_GENDER;
/
  GRANT EXECUTE ON "DL_INTERFACE"."SP_SEND_TO_PIBICS_CASE_GENDER" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_INTERFACE"."SP_SEND_TO_PIBICS_CASE_GENDER" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_INTERFACE"."SP_SEND_TO_PIBICS_CASE_GENDER" TO "BIOSAADM";
