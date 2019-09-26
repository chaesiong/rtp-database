CREATE OR REPLACE EDITIONABLE FUNCTION "SERVAPP"."FN_GET_ERROR_MESSAGE" 
(
  P_ERROR_CODE IN VARCHAR2 ,
  P_ERROR_OTHER_MSG IN VARCHAR2
) RETURN VARCHAR2 AS 
v_msg varchar2(500);
SHOW_SYSTEM_ERROR_MESSAGE varchar2(1000);
BEGIN
 v_msg := '';
 select error_message
 into v_msg
 from mscs_errorcodemaster
  where error_code =P_ERROR_CODE ;

  SELECT CONFIG_VALUE INTO SHOW_SYSTEM_ERROR_MESSAGE  FROM MSCS_SYS_CONFIG WHERE CONFIG_NAME ='SHOW_SYSTEM_ERROR_MESSAGE';

  if SHOW_SYSTEM_ERROR_MESSAGE='1' then
        v_msg := v_msg || ' ' ||P_ERROR_OTHER_MSG ;
  end if;

  return v_msg ;
   Exception WHEN Others THEN
   return P_ERROR_OTHER_MSG;
END FN_GET_ERROR_MESSAGE;

/
