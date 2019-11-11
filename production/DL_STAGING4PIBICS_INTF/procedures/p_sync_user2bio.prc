CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_STAGING4PIBICS_INTF"."P_SYNC_USER2BIO" AS

BEGIN
    DECLARE
    totalrownum number(8);
    err_code VARCHAR2(1000);
    err_msg VARCHAR2(1000);
    
    CURSOR c1 IS
        /*SELECT FU.USER_ID AS ID ,FU.USERNAME AS USERNAME 
            FROM PIBICSDM2.HR_PROFILE HP
            INNER JOIN PIBICSDM2.FW_USER FU ON HP.PROFILE_SEQNO = FU.PERSON_ID
            WHERE UPPER(FU.USER_ID) NOT IN (SELECT USERNAME FROM DL_USER_MANAGEMENT.USERS) 
            ORDER BY FU.USER_ID;
        SELECT T.ID FROM DL_BORDERCONTROL.TERMINALS T 
        WHERE T.BORDER_POST IN ('73F1C9E773553746E053650616AC8267','73F1C9E773C83746E053650616AC8267');
            */
            
        SELECT FU.USER_ID,FU.USERNAME FROM PIBICSDM2.FW_USER FU
        WHERE UPPER(FU.USER_ID) NOT IN (SELECT USERNAME FROM DL_USER_MANAGEMENT.USERS) 
        ORDER BY FU.USER_ID;
    
        rec_pibicsuser c1%ROWTYPE;
        
    BEGIN
    
        --totalrownum := 0;
    
        OPEN c1;
        LOOP FETCH c1 INTO rec_pibicsuser; EXIT WHEN c1%NOTFOUND;
  
            dbms_output.put_line('0 = '||rec_pibicsuser.ID);
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

--EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.USERS DISABLE';
--EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.ROLE_OBJECT_GRANT_REL DISABLE';
--EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.OBJECT_GRANT_REL DISABLE';
--EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.OBJECT_PAGE_REL DISABLE';
--EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.USER_ROLE_REL DISABLE';




--BEGIN
--dbms_mview.refresh( 'dl_user_management.apex_menu_permissions' );
--COMMIT;
--END;

--EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.USERS ENABLE';
--EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.ROLE_OBJECT_GRANT_REL ENABLE';
--EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.OBJECT_GRANT_REL ENABLE';
--EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.OBJECT_PAGE_REL ENABLE';
--EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.USER_ROLE_REL ENABLE';

/*EXCEPTION
    WHEN NO_DATA_FOUND THEN
        NULL;
    WHEN OTHERS THEN
    -- Consider logging the error and then re-raise
        RAISE;
*/
END P_SYNC_USER2BIO;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."P_SYNC_USER2BIO" TO "BIOSAADM";
