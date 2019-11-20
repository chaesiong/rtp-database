CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."INS_WL5" IS
/******************************************************************************
   NAME:       INS_WL5
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        16/3/2011          1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     INS_WL2
      Sysdate:         16/3/2011
      Date and Time:   16/3/2011, 13:52:24, and 16/3/2011 13:52:24
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
begin
    
-- ==============================  Re Create Sequence  Watchlist  

declare   
       TWLSEQNO       integer;
       drop_seq_str1 varchar(1000);
       drop_seq_str11 varchar(1000);    
begin
    
-- ==============================  Re Create Sequence  Watchlist  


select substr(max(wlcd),-6,6) into TWLSEQNO  from  watchlist where wlcd like 'S%';

drop_seq_str1 := 'drop sequence wl_seq';



drop_seq_str11 := 'CREATE SEQUENCE wl_seq  START WITH '|| TWLSEQNO ||'  INCREMENT BY 1 MINVALUE 1 NOCACHE  NOCYCLE  NOORDER ';

EXECUTE IMMEDIATE drop_seq_str1;

EXECUTE IMMEDIATE drop_seq_str11;


end;
 
END INS_WL5; 
/
  GRANT EXECUTE ON "PIBICSDM2"."INS_WL5" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."INS_WL5" TO "BIOSAADM";
