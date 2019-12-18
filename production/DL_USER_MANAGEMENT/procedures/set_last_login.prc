CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_USER_MANAGEMENT"."SET_LAST_LOGIN" 
(
  i_username IN VARCHAR2 
) AS 
BEGIN

declare
l_user_id users.id%type;
l_user_state users.state%type;
    
    begin
    
        select id
            ,state
        into l_user_id
            ,l_user_state
        from users
        where username = upper(i_username);
--DBMS_OUTPUT.PUT_LINE(l_user_id);

        update users$sgd
        set last_login = sysdate
        where id = l_user_id;
        
    exception
      when no_data_found then
        DBMS_OUTPUT.PUT_LINE('no_data_found');
    end;
       
END SET_LAST_LOGIN;
/
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."SET_LAST_LOGIN" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."SET_LAST_LOGIN" TO "BIOSAADM";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."SET_LAST_LOGIN" TO "PIBICSAPP";
