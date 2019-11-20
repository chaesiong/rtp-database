CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."INS_WL0" IS
/******************************************************************************
   NAME:       INS_WL0
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        16/3/2011          1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     INS_WL0
      Sysdate:         16/3/2011
      Date and Time:   16/3/2011, 13:52:24, and 16/3/2011 13:52:24
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
 /*<TOAD_FILE_CHUNK>*/ 
declare   
    CURSOR wl IS
     select wlcd
    from watchlist@tmdb    
    --where  wlcd  in (select wlcd from watchlist) and   TO_CHAR(credte, 'DD-MON-YYYY')  =  TO_CHAR(sysdate-1, 'DD-MON-YYYY')    order by credte ;
    where  wlcd  in (select wlcd from watchlist) and   TO_CHAR(credte, 'DD-MON-YYYY')  =  TO_CHAR(sysdate, 'DD-MON-YYYY')    order by credte ;
 

begin
    
    FOR wl_rec in wl
    LOOP       
    
        delete from WLREMARK where wlcd = wl_rec.wlcd;
        delete from WLRELATION where wlcd = wl_rec.wlcd;
        delete from WLINDICATECARD where wlcd = wl_rec.wlcd;
        delete from WLCHARGE where wlcd = wl_rec.wlcd;
        delete from WATCHLISTNM where wlcd = wl_rec.wlcd;  
        delete from WATCHLIST where wlcd = wl_rec.wlcd;
        commit;
    END LOOP;        
end;


 
END INS_WL0; 
/
  GRANT EXECUTE ON "PIBICSDM2"."INS_WL0" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."INS_WL0" TO "BIOSAADM";
