CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GETTHAINUMBERIC" (p_pass_string VARCHAR2) RETURN varchar2 IS
   v_MYCOUNTER     NUMBER (2);
   v_TMP VARCHAR2(1);
   v_RETURN VARCHAR2(50);
BEGIN
   v_MYCOUNTER := 1;
    v_RETURN := '';
   WHILE v_MYCOUNTER <= LENGTH (p_pass_string)
   LOOP
   select decode(substr(p_pass_string,v_MYCOUNTER,1),'1','๑','2','๒','3','๓','4','๔','5','๕','6','๖','7','๗','8','๘','9','๙','0','๐',substr(p_pass_string,v_MYCOUNTER,1)) into v_TMP from dual;
   v_RETURN := v_RETURN||v_TMP;
--      DBMS_OUTPUT.PUT_LINE (v_RETURN);
      v_MYCOUNTER := v_MYCOUNTER + 1;
--   Exception When No_Data_Found Then Null ;
   END LOOP;
   RETURN v_RETURN ;
END;
/
  GRANT EXECUTE ON "PIBICSDM2"."GETTHAINUMBERIC" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GETTHAINUMBERIC" TO "BIOSAADM";
