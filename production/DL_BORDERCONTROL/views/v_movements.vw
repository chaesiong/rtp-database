CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."V_MOVEMENTS" ("REASON_OFFLOAD", "REASON_DEPORTEE", "IS_FINISHED", "MVMNTID", "BRDDOCID", "LANDBARCD", "EXITFLG", "MAX_STAY_DT", "FINGERMATCH", "FACEMATCH", "MVMNTADDR", "ORIDEST", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "INS_TERMINAL", "INS_BORDERPOST", "REFUSEDFLG", "OBSERVATION", "TRNSPRTUNITID", "PERSON_TYPE", "SCANNED_FLIGHT", "MVMNT_ID", "WSQ_LL", "WSQ_LI", "WSQ_LM", "WSQ_LR", "WSQ_LT", "WSQ_RL", "WSQ_RI", "WSQ_RM", "WSQ_RR", "WSQ_RT", "VISA_PAGE", "LANDINGCARD_PAGE", "LIVE_PHOTO", "VISA_TYPE", "VISA", "PS_1", "PS_2", "PS_3", "PS_4", "PS_5", "PS_6", "PS_7", "PS_8", "PS_9", "PS_10", "PRIOR_MOVEMENT", "ENTRY_FORM", "MOVEMENT_DT", "DATE_OF_ENTRY", "SOURCE_SYSTEM", "PSBLOB_1", "PSBLOB_2", "PSBLOB_3", "PSBLOB_4", "PSBLOB_5", "PSBLOB_6", "PSBLOB_7", "PSBLOB_8", "PSBLOB_9", "PSBLOB_10", "TEMPLATE_LL", "TEMPLATE_LI", "TEMPLATE_LM", "TEMPLATE_LR", "TEMPLATE_LT", "TEMPLATE_RL", "TEMPLATE_RI", "TEMPLATE_RM", "TEMPLATE_RR", "TEMPLATE_RT", "MANUALEXPIRYDATE", "DATEOFISSUE", "NATIONALITY", "PLACEOFBIRTH") AS 
  select m.REASON_OFFLOAD
        ,m.REASON_DEPORTEE
        ,m.IS_FINISHED
        ,m.MVMNTID
        ,m.BRDDOCID
        ,m.LANDBARCD
        ,m.EXITFLG
        ,m.MAX_STAY_DT
        ,m.FINGERMATCH
        ,m.FACEMATCH
        ,m.MVMNTADDR
        ,m.ORIDEST
        ,m.INS_AT
        ,m.INS_BY
        ,m.DML_AT
        ,m.DML_BY
        ,m.DML_TYPE
        ,m.INS_TERMINAL
        ,m.INS_BORDERPOST
        ,m.REFUSEDFLG
        ,m.OBSERVATION
        ,m.TRNSPRTUNITID
        ,m.PERSON_TYPE
        ,m.SCANNED_FLIGHT
        ,mb.MVMNT_ID
        ,mb.WSQ_LL
        ,mb.WSQ_LI
        ,mb.WSQ_LM
        ,mb.WSQ_LR
        ,mb.WSQ_LT
        ,mb.WSQ_RL
        ,mb.WSQ_RI
        ,mb.WSQ_RM
        ,mb.WSQ_RR
        ,mb.WSQ_RT
        ,v.VISA_IMAGE as VISA_PAGE
        ,ef.FORM_IMAGE as LANDINGCARD_PAGE
        ,mb.LIVE_PHOTO
        ,m.VISA_TYPE
        ,m.VISA
        ,m.PS_1
        ,m.PS_2
        ,m.PS_3
        ,m.PS_4
        ,m.PS_5
        ,m.PS_6
        ,m.PS_7
        ,m.PS_8
        ,m.PS_9
        ,m.PS_10
        ,m.PRIOR_MOVEMENT
        ,m.ENTRY_FORM
        ,m.MOVEMENT_DT
        ,m.DATE_OF_ENTRY
        ,m.SOURCE_SYSTEM
        ,mb.PSBLOB_1
        ,mb.PSBLOB_2
        ,mb.PSBLOB_3
        ,mb.PSBLOB_4
        ,mb.PSBLOB_5
        ,mb.PSBLOB_6
        ,mb.PSBLOB_7
        ,mb.PSBLOB_8
        ,mb.PSBLOB_9
        ,mb.PSBLOB_10
        ,mb.TEMPLATE_LL
        ,mb.TEMPLATE_LI
        ,mb.TEMPLATE_LM
        ,mb.TEMPLATE_LR
        ,mb.TEMPLATE_LT
        ,mb.TEMPLATE_RL
        ,mb.TEMPLATE_RI
        ,mb.TEMPLATE_RM
        ,mb.TEMPLATE_RR
        ,mb.TEMPLATE_RT
        ,(select ATTRVARCHAR
            from MOVEMENT_ATTR ma
           where ma.MVMNTID = m.MVMNTID
             and ma.SEQNO = 21) as MANUALEXPIRYDATE
        ,(select ATTRVARCHAR
            from MOVEMENT_ATTR ma
           where ma.MVMNTID = m.MVMNTID
             and ma.SEQNO = 22) as DATEOFISSUE
        ,(select ATTRVARCHAR
            from MOVEMENT_ATTR ma
           where ma.MVMNTID = m.MVMNTID
             and ma.SEQNO = 23) as NATIONALITY
        ,(select ATTRVARCHAR
            from MOVEMENT_ATTR ma
           where ma.MVMNTID = m.MVMNTID
             and ma.SEQNO = 24) as PLACEOFBIRTH
    from MOVEMENTS m
   left join MOVEMENTS_BLOB mb
      on (m.MVMNTID = mb.MVMNT_ID)
    left join VISAS v
      on (m.VISA = v.KEY_VALUE)
    left join ENTRY_FORMS ef
      on (m.ENTRY_FORM = ef.KEY_VALUE);
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "JASPER_REPORTING";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS" TO "PORNRUKSA_S";
