CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" ("VISA", "EXITFLG", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "INS_TERMINAL", "INS_BORDERPOST", "NAT") AS 
  select m.VISA
        ,m.EXITFLG
        ,m.INS_AT
        ,m.INS_BY
        ,m.DML_AT
        ,m.DML_BY
        ,m.DML_TYPE
        ,m.INS_TERMINAL
        ,m.INS_BORDERPOST
        ,bd.NAT
    from DL_BORDERCONTROL.MOVEMENTS       m
        ,DL_BORDERCONTROL.BORDERDOCUMENTS bd
   where m.BRDDOCID = bd.BRDDOCID;
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISA_BY_COUNTRY" TO "PUNYAWII_D";
