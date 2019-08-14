CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_STAGING4PIBICS_INTF"."P_BK_SYNC_BLACKLIST_CASES" 
(p_wlcd in varchar2)


AS

BEGIN
begin
  INSERT INTO dl_staging4pibics_intf.sync_blacklist_cases_bk 
  (wlcd, seqno, ownerage, expirydate, nationcd
                , passportno, case_id, identity_id, address_id, travel_docs_id
                , create_date, pibics_table_cd, is_active_in_mvlog, dml_type, dml_start_ts
                , currentness_in_pibics, currentness_in_bc, row_shall_be_ignored
                --, cnt_errors
                )
                
          (select wlcd, seqno, ownerage, expirydate, nationcd
                , passportno, case_id, identity_id, address_id, travel_docs_id
                , create_date, pibics_table_cd, is_active_in_mvlog, dml_type, dml_start_ts
                , currentness_in_pibics, currentness_in_bc, row_shall_be_ignored
                --, cnt_errors
          from dl_staging4pibics_intf.sync_blacklist_cases 
          where wlcd = p_wlcd);
          
end;        

END P_BK_SYNC_BLACKLIST_CASES;
/
