CREATE OR REPLACE EDITIONABLE FUNCTION "SERVAPP"."FN_PUT_ZERO" 
(
  P_DATA IN VARCHAR2 
, P_LENGTH IN NUMBER 
) RETURN VARCHAR2 AS 
v_data varchar2(200);
v_temp varchar2(200);
BEGIN
  if P_DATA IS null then
  RETURN NULL;
  else
  v_temp := '000000000000000000000000'||P_DATA;
  select substr(v_temp,length(v_temp)-(P_LENGTH-1),P_LENGTH)
  into v_data
  from dual;
  return v_data;
  end if;
END FN_PUT_ZERO;
/
