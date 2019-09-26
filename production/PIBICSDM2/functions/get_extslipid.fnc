CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_EXTSLIPID" (tmp number) RETURN NUMBER IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       get_extslipid
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        16/9/2008          1. Created this function.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     get_extslipid
      Sysdate:         16/9/2008
      Date and Time:   16/9/2008, 15:57:19, and 16/9/2008 15:57:19
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:      EXTSLIP (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
   tmpVar := 0;
   select extslipid into tmpVar from extslip where extid=tmp;
   RETURN tmpVar;
   EXCEPTION
     WHEN NO_DATA_FOUND THEN NULL;
   RETURN 0;
END;
/
