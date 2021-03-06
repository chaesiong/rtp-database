CREATE OR REPLACE EDITIONABLE FUNCTION "SERVAPP"."FN_IS_NUMBER" (p_string IN VARCHAR2)
   RETURN INT
IS
   v_new_num NUMBER;
BEGIN
   v_new_num := TO_NUMBER(p_string);
   RETURN 1;
EXCEPTION
WHEN VALUE_ERROR THEN
   RETURN 0;
END FN_IS_NUMBER;
/
  GRANT EXECUTE ON "SERVAPP"."FN_IS_NUMBER" TO "BIOSAADM";
