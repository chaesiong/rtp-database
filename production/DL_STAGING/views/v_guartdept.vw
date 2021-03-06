CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_GUARTDEPT" ("GUARTDEPT_SEQNO", "DEPT_SEQNO", "COMNM", "AMOUNT", "AMOUNTLEFT", "ADDR", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "ACTFLAG", "COMCD", "PV_SEQNO", "AMP_SEQNO", "TMB_SEQNO") AS 
  SELECT 
    GUARTDEPT_SEQNO, 
    DEPT_SEQNO, 
    COMNM, 
    AMOUNT, 
    AMOUNTLEFT, 
    ADDR, 
    CREATE_BY, 
    CREATE_DATE, 
    UPDATE_BY, 
    UPDATE_DATE, 
    VERSION, 
    ACTFLAG, 
    COMCD, 
    PV_SEQNO, 
    AMP_SEQNO, 
    TMB_SEQNO
  FROM pibicsdm2.GUARTDEPT;
  GRANT SELECT ON "DL_STAGING"."V_GUARTDEPT" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_STAGING"."V_GUARTDEPT" TO "BIO_BD";
  GRANT SELECT ON "DL_STAGING"."V_GUARTDEPT" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING"."V_GUARTDEPT" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING"."V_GUARTDEPT" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_STAGING"."V_GUARTDEPT" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING"."V_GUARTDEPT" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING"."V_GUARTDEPT" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING"."V_GUARTDEPT" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING"."V_GUARTDEPT" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING"."V_GUARTDEPT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING"."V_GUARTDEPT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING"."V_GUARTDEPT" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING"."V_GUARTDEPT" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING"."V_GUARTDEPT" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_STAGING"."V_GUARTDEPT" TO "BIOSAADM";
