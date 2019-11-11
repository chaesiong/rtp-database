CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_STAGING4PIBICS_INTF"."KEEP_CURRENT2" (p_date IN VARCHAR2) AUTHID DEFINER IS
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    
     DL_STAGING4PIBICS.PKG_WATCHLIST.MERGE_YYYYMMDD2(p_date);
     DL_STAGING4PIBICS_INTF.PKG_ST_WATCHLIST.KEEP_CURRENTBY2(p_date);
     dl_staging4pibics_intf.INSERT_WLINDICATECARD(p_date);
     
     commit;
    
END keep_current2;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."KEEP_CURRENT2" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."KEEP_CURRENT2" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."KEEP_CURRENT2" TO "BIOSAADM";
