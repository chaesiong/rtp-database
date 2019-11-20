CREATE OR REPLACE EDITIONABLE FUNCTION "SERVAPP"."F_DATE" (v_date IN VARCHAR2) RETURN NUMBER IS
    v_date1 DATE;
BEGIN
    select to_date(v_date) into v_date1 from dual;
        RETURN 1;
    Exception WHEN Others THEN
        RETURN 0;
END;

/
  GRANT EXECUTE ON "SERVAPP"."F_DATE" TO "BIOSAADM";
