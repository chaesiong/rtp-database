CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_DELETE_TMINOUT_M" 
(
  v_dstart IN VARCHAR2 
) AS 
BEGIN
  DELETE FROM PIBICSDM2.TMINOUT WHERE SEQNO IN (
    SELECT SEQNO FROM PIBICSDM2.TMINOUTLOG 
        WHERE TO_CHAR(LOGDTE,'dd/mm/yyyy') = v_dstart AND LOGFLAG = 'D'
  );
  COMMIT;
END P_DELETE_TMINOUT_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_DELETE_TMINOUT_M" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_DELETE_TMINOUT_M" TO "BIOSAADM";
