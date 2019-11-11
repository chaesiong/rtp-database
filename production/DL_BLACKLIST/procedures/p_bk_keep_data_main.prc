CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_BLACKLIST"."P_BK_KEEP_DATA_MAIN" 
AS
     
begin
      -- Start Transaction
      -- Create save point
      SAVEPOINT save_point;
      
      for cursor in (select wlcd from dl_blacklist.keep_blacklist_data)
      loop
          -- Backup 
          DL_BLACKLIST.PKG_KEEP_BLACKLIST_DATA.P_BK_SYNC_BLACKLIST_CASES(cursor.wlcd);
          DL_BLACKLIST.PKG_KEEP_BLACKLIST_DATA.P_BK_BLACKLIST_CASES(cursor.wlcd);
          DL_BLACKLIST.PKG_KEEP_BLACKLIST_DATA.P_BK_BLACKLIST_CASE_IDENT(cursor.wlcd);
          DL_BLACKLIST.PKG_KEEP_BLACKLIST_DATA.P_BK_IDENTITIES(cursor.wlcd);
          DL_BLACKLIST.PKG_KEEP_BLACKLIST_DATA.P_BK_TRAVEL_DOCS(cursor.wlcd);
          
          --  Clear Data Transfer
          DL_BLACKLIST.PKG_KEEP_BLACKLIST_DATA.P_BK_STEP_DELETE(cursor.wlcd);
          
          -- Retransfer Data
          DL_STAGING4PIBICS.PKG_WATCHLIST.MERGE_WLCD(cursor.wlcd);
          DL_STAGING4PIBICS_INTF.PKG_ST_WATCHLIST.KEEP_CURRENTBY_WLCD(cursor.wlcd);
          
          
          commit;
      end loop;
      
      DL_BLACKLIST.PKG_KEEP_BLACKLIST_DATA.DELETE_KEEP_BLACKLIST_DATA;
      
      -- Exception 
      EXCEPTION
          WHEN OTHERS THEN
              BEGIN
                  --DBMS_OUTPUT.PUT_LINE('Error : ' || SQLERRM);
                  ROLLBACK TO save_point;
              END;

END P_BK_KEEP_DATA_MAIN;
/
  GRANT EXECUTE ON "DL_BLACKLIST"."P_BK_KEEP_DATA_MAIN" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BLACKLIST"."P_BK_KEEP_DATA_MAIN" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_BLACKLIST"."P_BK_KEEP_DATA_MAIN" TO "BIOSAADM";
