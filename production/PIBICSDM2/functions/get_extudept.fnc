CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_EXTUDEPT" (v_seqno number, v_passno varchar2, v_extdate date, v_docno varchar2, v_udept number) RETURN NUMBER IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       GET_EXTUDEPT
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        12/02/2018   ITTIPON-S       1. Created this function.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     GET_EXTUDEPT
      Sysdate:         12/02/2018
      Date and Time:   12/02/2018, 11:15:50, and 12/02/2018 11:15:50
      Username:        ITTIPON-S (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
    tmpVar := null;
   BEGIN
   
        select udept_seqno into tmpVar from (
        select udept_seqno from ext_extensionlist where extperson_seqno = v_seqno 
        and cpassportno = v_passno and to_char(ext_date, 'yyyymmdd') = to_char(v_extdate , 'YYYYMMDD') and doc_no = v_docno 
        and approve_sts = 'A' order by create_date desc) where rownum = 1; 
   
    --RETURN tmpVar;
   EXCEPTION
     WHEN NO_DATA_FOUND THEN
       tmpVar := v_udept;
    END;
       return tmpVar;
END GET_EXTUDEPT;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_EXTUDEPT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_EXTUDEPT" TO "BIOSAADM";
