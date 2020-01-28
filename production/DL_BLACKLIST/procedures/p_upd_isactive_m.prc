CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_BLACKLIST"."P_UPD_ISACTIVE_M" 
(
    v_dstart IN VARCHAR2, 
    settype IN VARCHAR2
)
IS 
    settype2 VARCHAR2(15);
BEGIN
  
  settype2 := settype;

  IF (settype2 = '' OR settype2 IS NULL) THEN settype2 := 'N';
  END IF;
  
  UPDATE DL_BLACKLIST.BLACKLIST_CASES SET IS_ACTIVE = settype2 WHERE CASE_NUMBER IN (
    --SELECT WLCD FROM PIBICSDM2.WATCHLISTLOG 
        --WHERE TO_CHAR(LOGDTE,'dd/mm/yyyy') = v_dstart AND LOGFLAG = 'D'
        'W556332','W571926','W557058'
  );
  COMMIT;

END P_UPD_ISACTIVE_M;
/
