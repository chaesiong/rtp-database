CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" ("MVMNTID", "BRDDOCID", "LANDBARCD", "EXITFLG", "MAX_STAY_DT", "FINGERMATCH", "FACEMATCH", "MVMNTADDR", "ORIDEST", "INS_AT", "INS_TERMINAL", "INS_BORDERPOST", "REFUSEDFLG", "OBSERVATION", "TRNSPRTUNITID", "PERSON_TYPE", "SCANNED_FLIGHT", "PS_1", "PS_2", "PS_3", "PS_4", "PS_5", "PS_6", "PS_7", "PS_8", "PS_9", "PS_10", "FINGERMATCH_HISTORY", "FACEMATC_HISTORY", "REASON_OFFLOAD", "REASON_DEPORTEE", "VISA_TYPE", "VISA", "DML_AT", "DML_BY", "DML_TYPE", "INS_BY", "IS_FINISHED", "PRIOR_MOVEMENT", "ENTRY_FORM", "FORM_NO_APPROVED", "MOVEMENT_DT", "SOURCE_SYSTEM", "DATE_OF_ENTRY", "DOCNO", "NAT", "EXPIRYDATE") AS 
  select m."MVMNTID"
      ,m."BRDDOCID"
      ,m."LANDBARCD"
      ,m."EXITFLG"
      ,m."MAX_STAY_DT"
      ,m."FINGERMATCH"
      ,m."FACEMATCH"
      ,m."MVMNTADDR"
      ,m."ORIDEST"
      ,m."INS_AT"
      ,m."INS_TERMINAL"
      ,m."INS_BORDERPOST"
      ,m."REFUSEDFLG"
      ,m."OBSERVATION"
      ,m."TRNSPRTUNITID"
      ,m."PERSON_TYPE"
      ,m."SCANNED_FLIGHT"
      ,m."PS_1"
      ,m."PS_2"
      ,m."PS_3"
      ,m."PS_4"
      ,m."PS_5"
      ,m."PS_6"
      ,m."PS_7"
      ,m."PS_8"
      ,m."PS_9"
      ,m."PS_10"
      ,m."FINGERMATCH_HISTORY"
      ,m."FACEMATC_HISTORY"
      ,m."REASON_OFFLOAD"
      ,m."REASON_DEPORTEE"
      ,m."VISA_TYPE"
      ,m."VISA"
      ,m."DML_AT"
      ,m."DML_BY"
      ,m."DML_TYPE"
      ,m."INS_BY"
      ,m."IS_FINISHED"
      ,m."PRIOR_MOVEMENT"
      ,m."ENTRY_FORM"
      ,m."FORM_NO_APPROVED"
      ,m."MOVEMENT_DT"
      ,m."SOURCE_SYSTEM"
      ,m."DATE_OF_ENTRY"
      ,bd.DOCNO
      ,bd.NAT
      ,bd.EXPIRYDATE
  from dl_bordercontrol.BORDERDOCUMENTS bd
  inner join dl_bordercontrol.MOVEMENTS m on m.BRDDOCID = bd.BRDDOCID
;
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MVMT_WITH_BRDDOCS" TO "PORNRUKSA_S";
