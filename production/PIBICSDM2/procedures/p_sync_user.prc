CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_SYNC_USER" 
IS
    totalrownum NUMBER(8);
    p_username VARCHAR2(255);
    i_username VARCHAR2(50);
    i_first_name VARCHAR2(50);
    i_last_name VARCHAR2(50);
    i_mail_address VARCHAR2(50);
    i_phone_number VARCHAR2(50);
    i_state VARCHAR2(15);
    i_password VARCHAR2(100);
    i_pwd_must_be_changed VARCHAR2(15);
    i_insert_source VARCHAR2(15);
    i_role_id VARCHAR2(25);
    i_role_id1 VARCHAR2(25);
    i_role_id2 VARCHAR2(25);
BEGIN
 declare 
 totalrownum number(8);
 pointsp number(8);
 l_idx integer;
 l_str VARCHAR(50);
 l_list VARCHAR(255);
 count_loop number(8);
 resultadd VARCHAR(50);
 doexec boolean;
 
    
     
    CURSOR c1 IS
        SELECT FU.USER_ID AS USER_ID ,FU.USERNAME AS USERNAME 
            FROM PIBICSDM2.HR_PROFILE HP 
            INNER JOIN PIBICSDM2.FW_USER FU ON HP.PROFILE_SEQNO = FU.PERSON_ID 
            WHERE UPPER(FU.USER_ID) NOT IN (SELECT USERNAME FROM DL_USER_MANAGEMENT.USERS ) 
            AND ROWNUM < 2 
            ORDER BY FU.USER_ID;
  
    rec_user c1%ROWTYPE;

    BEGIN

        doexec := false;
        doexec := true;
        
        totalrownum := 0;
        i_mail_address := '';
        i_phone_number := '';
        i_state := '1';
        i_password := 'P@ssw0rd';
        i_pwd_must_be_changed := 'N';
        i_insert_source := 'user';
        i_role_id1 := 'BMBS_OFF1';
        i_role_id2 := 'BMBS_OFF1:BMBS_SUP';
        
        BEGIN
            IF (doexec = true) THEN
                EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.USERS DISABLE';
                EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.ROLE_OBJECT_GRANT_REL DISABLE';
                EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.OBJECT_GRANT_REL DISABLE';
                EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.OBJECT_PAGE_REL DISABLE';
                EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.USER_ROLE_REL DISABLE';
            END IF;
        END;
      
        OPEN c1;
        LOOP FETCH c1 INTO rec_user; EXIT WHEN c1%NOTFOUND;
        
            i_username := UPPER(rec_user.USER_ID);
            
            p_username := rec_user.USERNAME;
            p_username := REPLACE(p_username,'    ',' ');
            p_username := REPLACE(p_username,'   ',' ');
            p_username := REPLACE(p_username,'  ',' ');
            
            pointsp := -1;
            pointsp := INSTR(p_username, 'ว่าที่');
            IF (pointsp > 0) THEN p_username := REPLACE(p_username,'ว่าที่','');
            END IF;
            p_username := TRIM(p_username);
            i_first_name := '';
            i_last_name := '';
            
            l_list := p_username;
            l_str := '';
            count_loop := 0;
            
            LOOP
                l_idx := INSTR(l_list,' ');
                count_loop := count_loop+1;
                --dbms_output.put_line(l_idx);
                --dbms_output.put_line(count_loop);
                IF (l_idx >= 0 AND count_loop < 6) THEN
                    
                    IF (l_idx > 0) THEN 
                        l_str := substr(l_list,0,l_idx);
                        l_list := substr(l_list,l_idx+1);
                    ELSE
                        --dbms_output.put_line(l_idx||'_'||l_list);
                        IF (l_idx = 0) THEN -- AND l_list != ''
                            l_str := l_list;
                            l_list := '';
                            count_loop := 99;
                        END IF;
                    END IF;
                    
                    l_str := TRIM(l_str);                    
                    l_list := TRIM(l_list);
                    --dbms_output.put_line(l_str||'='||l_list);
                    IF(count_loop = 1 AND INSTR(l_str,'หญิง') > 0 ) THEN 
                        l_str := l_str || ' ';
                    END IF;
                    
                    IF(count_loop = 1 OR count_loop = 2) THEN
                        i_first_name := i_first_name || l_str;
                    ELSE                    
                        IF(count_loop > 2) THEN
                            i_last_name := i_last_name || l_str || ' ';
                        END IF;
                    END IF;

                ELSE 
                    EXIT;
                END IF;
            END LOOP;
            i_first_name := TRIM(i_first_name);
            i_last_name := TRIM(i_last_name);
            
            IF (pointsp > 0) THEN i_first_name := 'ว่าที่' || i_first_name;
            END IF;
            
            IF (INSTR(i_first_name,'ด.ต.') > 0 OR INSTR(i_first_name,'จ.ส.') > 0 OR INSTR(i_first_name,'ส.ต.') > 0) THEN
                i_role_id := i_role_id1;
            ELSE
                i_role_id := i_role_id2;
            END IF;
            
            --dbms_output.put_line(i_first_name||' '||i_last_name||' '||i_role_id);
            
            
            IF (doexec = true) THEN
            
                resultadd := DL_USER_MANAGEMENT.PKG_MAN_USERS.ADD_USER(i_username
                    ,i_first_name,i_last_name,i_mail_address,i_phone_number
                    ,i_state,i_password,i_pwd_must_be_changed,i_insert_source);
            
                DL_USER_MANAGEMENT.PKG_MAN_USERS.Save_User_Roles(resultadd,i_role_id);
                
                NULL;
            END IF;
            
            dbms_output.put_line(i_username||','||p_username||','||i_first_name||','||i_last_name||','||i_role_id);
            totalrownum := totalrownum+1;
            
        END LOOP;
        dbms_output.put_line(totalrownum);
        
        CLOSE c1;
        
        exception
            when others then
                null;
    
        BEGIN
            IF (doexec = true) THEN
                dbms_mview.refresh( 'dl_user_management.apex_menu_permissions' );
                COMMIT;
           
                EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.USERS ENABLE';
                EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.ROLE_OBJECT_GRANT_REL ENABLE';
                EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.OBJECT_GRANT_REL ENABLE';
                EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.OBJECT_PAGE_REL ENABLE';
                EXECUTE IMMEDIATE 'ALTER TRIGGER DL_USER_MANAGEMENT.USER_ROLE_REL ENABLE';
            END IF;
        END;
    
    END;
  
END P_SYNC_USER;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_SYNC_USER" TO "BIOSAADM";
