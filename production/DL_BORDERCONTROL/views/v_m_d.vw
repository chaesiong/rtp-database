CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."V_M_D" ("MANUALEXPIRYDATE", "MVMNTID", "BRDDOCID", "LANDBARCD", "EXITFLG", "REASON_OFFLOAD", "REASON_DEPORTEE", "MAX_STAY_DT", "FINGERMATCH", "FACEMATCH", "MVMNTADDR", "ORIDEST", "CREATION_DATE", "DATE_OF_ENTRY", "SOURCE_SYSTEM", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "INS_TERMINAL", "INS_BORDERPOST", "REFUSEDFLG", "OBSERVATION", "TRNSPRTUNITID", "PERSON_TYPE", "SCANNED_FLIGHT", "MVMNT_ID", "WSQ_LL", "WSQ_LI", "WSQ_LM", "WSQ_LR", "WSQ_LT", "WSQ_RL", "WSQ_RI", "WSQ_RM", "WSQ_RR", "WSQ_RT", "VISA_PAGE", "LANDINGCARD_PAGE", "LIVE_PHOTO", "VISA_TYPE", "VISA", "VISUM_INFO", "LC_INFO", "GRANTED_BY_SUPERVISOR", "SUPERVISOR_REASON", "PS_5", "PS_6", "PS_7", "PS_8", "PS_9", "PS_10", "PRIOR_MOVEMENT", "ENTRY_FORM", "MOVEMENT_DT", "PSBLOB_1", "PSBLOB_2", "PSBLOB_3", "PSBLOB_4", "PSBLOB_5", "PSBLOB_6", "PSBLOB_7", "PSBLOB_8", "PSBLOB_9", "PSBLOB_10", "TEMPLATE_LL", "TEMPLATE_LI", "TEMPLATE_LM", "TEMPLATE_LR", "TEMPLATE_LT", "TEMPLATE_RL", "TEMPLATE_RI", "TEMPLATE_RM", "TEMPLATE_RR", "TEMPLATE_RT", "DOCNO", "PASS_VISUAL_FACE", "PASS_ICAO_FACE", "PASS_VISUALPAGE", "GIVENNAME", "SURNAME", "MIDDLENAME", "SEX", "GENDER", "EXPIRYDATE", "DOB", "DOCTYPE", "DOCCLASS", "ISSUECTRY", "INS_AT_BC_DOC", "INS_BY_BC_DOC", "DML_AT_BC_DOC", "DML_BY_BC_DOC", "DML_TYPE_BC_DOC", "INS_TERMINAL_BC_DOC", "INS_BORDERPOST_BC_DOC", "DATEOFISSUE", "NATIONALITY", "PLACEOFBIRTH", "VISUM_NUMBER", "VISUM_LOCATION", "VISUM_DURATION", "VISUM_START", "VISUM_END", "VISA_TYPE_NAME", "PERMIT_TYPE", "PERMIT_EXPIRY_DATE", "LC_LENGTH", "LC_ADDRESS", "TM6_NUMBER", "PROVINCE", "DISTRICT", "SUBDISTRICT", "NOTE", "MVMNT_OTHER_IMAGE_1", "MVMNT_OTHER_IMAGE_2", "MVMNT_OTHER_IMAGE_3", "MVMNT_OTHER_IMAGE_4", "MVMNT_OTHER_IMAGE_5", "MVMNT_OTHER_IMAGE_6", "MVMNT_OTHER_IMAGE_7", "MVMNT_OTHER_IMAGE_8", "MVMNT_OTHER_IMAGE_9", "MVMNT_OTHER_IMAGE_10") AS 
  select d.MANUAL_EXPIRY_DATE as MANUALEXPIRYDATE
        ,m.MVMNTID
        ,m.BRDDOCID
        ,m.LANDBARCD
        ,m.EXITFLG
        ,m.REASON_OFFLOAD
        ,m.REASON_DEPORTEE
        ,m.MAX_STAY_DT
        ,m.FINGERMATCH
        ,m.FACEMATCH
        ,m.MVMNTADDR
        ,m.ORIDEST
        ,m.INS_AT CREATION_DATE
        ,m.DATE_OF_ENTRY
        ,m.SOURCE_SYSTEM
        ,m.INS_BY
        ,m.DML_AT
        ,m.DML_BY
        ,m.DML_TYPE
        ,m.INS_TERMINAL
        ,(select name
            from dl_bordercontrol.borderposts
           where key_value = m.INS_BORDERPOST) as INS_BORDERPOST
        ,m.REFUSEDFLG
        ,m.OBSERVATION
        ,m.TRNSPRTUNITID
        ,m.PERSON_TYPE
        ,m.SCANNED_FLIGHT
        ,m.MVMNT_ID
        ,m.WSQ_LL
        ,m.WSQ_LI
        ,m.WSQ_LM
        ,m.WSQ_LR
        ,m.WSQ_LT
        ,m.WSQ_RL
        ,m.WSQ_RI
        ,m.WSQ_RM
        ,m.WSQ_RR
        ,m.WSQ_RT
        ,DECODE(length(m.VISA_PAGE)
               ,0
               ,dl_bordercontrol.PKG_APEX_UTIL.Get_WS_Static_File_Content('VISUM.jpg')
               ,m.VISA_PAGE) as VISA_PAGE
        ,DECODE(length(m.LANDINGCARD_PAGE)
               ,0
               ,dl_bordercontrol.PKG_APEX_UTIL.Get_WS_Static_File_Content('LANDINGCARD.jpg')
               ,m.LANDINGCARD_PAGE) as LANDINGCARD_PAGE
        ,m.LIVE_PHOTO
        ,m.VISA_TYPE
        ,m.VISA
        ,m.PS_1 as VISUM_INFO
        ,m.PS_2 as LC_INFO
        ,m.PS_3 as GRANTED_BY_SUPERVISOR
        ,m.PS_4 as SUPERVISOR_REASON
        ,m.PS_5
        ,m.PS_6
        ,m.PS_7
        ,m.PS_8
        ,m.PS_9
        ,m.PS_10
        ,m.PRIOR_MOVEMENT
        ,m.ENTRY_FORM
        ,m.MOVEMENT_DT
        ,m.PSBLOB_1
        ,m.PSBLOB_2
        ,m.PSBLOB_3
        ,m.PSBLOB_4
        ,m.PSBLOB_5
        ,m.PSBLOB_6
        ,m.PSBLOB_7
        ,m.PSBLOB_8
        ,m.PSBLOB_9
        ,m.PSBLOB_10
        ,m.TEMPLATE_LL
        ,m.TEMPLATE_LI
        ,m.TEMPLATE_LM
        ,m.TEMPLATE_LR
        ,m.TEMPLATE_LT
        ,m.TEMPLATE_RL
        ,m.TEMPLATE_RI
        ,m.TEMPLATE_RM
        ,m.TEMPLATE_RR
        ,m.TEMPLATE_RT
        ,d.DOCNO
        ,d.PASS_VISUAL_FACE
        ,d.PASS_ICAO_FACE
        ,d.PASS_VISUALPAGE
        ,d.GIVENNAME
        ,d.SURNAME
        ,d.MIDDLENAME
        ,d.SEX
        ,case
         when d.SEX = 1
         then 'male'
         when d.SEX = 2
         then 'female'
         end as GENDER
        ,to_char(d.EXPIRYDATE
                ,'DD/MM/YYYY') as EXPIRYDATE
        /* -- Orig
        ,to_char(dl_bordercontrol.PKG_COMMON.PARSE_DATE(d.DOB
                                                       ,1
                                                       ,0
                                                       ,0
                                                       ,1)
                ,'DD/MM/YYYY') as DOB
        */
        /* -- Alternate 1
        ,dl_bordercontrol.PKG_COMMON.GET_PARTIAL_DATE(d.DOB
                                                      ,1
                                                      ,0
                                                      ,0
                                                      ,1).getFormatData('DD/MM/YYYY') as DOB
        */
        -- Alternate 2
        ,d.DOB_PARTIAL.getFormatData('DD/MM/YYYY') as DOB
        ,d.DOCTYPE
        ,d.DOCCLASS
        ,d.ISSUECTRY
        ,d.INS_AT as INS_AT_BC_DOC
        ,d.INS_BY as INS_BY_BC_DOC
        ,d.DML_AT as DML_AT_BC_DOC
        ,d.DML_BY as DML_BY_BC_DOC
        ,d.DML_TYPE as DML_TYPE_BC_DOC
        ,d.INS_TERMINAL as INS_TERMINAL_BC_DOC
        ,d.INS_BORDERPOST as INS_BORDERPOST_BC_DOC
        ,(select ATTRVARCHAR
            from dl_bordercontrol.MOVEMENT_ATTR ma
           where ma.MVMNTID = m.MVMNTID
             and ma.SEQNO = 22) as DATEOFISSUE
        , d.NAT as NATIONALITY
        ,(select ATTRVARCHAR
            from dl_bordercontrol.MOVEMENT_ATTR ma
           where ma.MVMNTID = m.MVMNTID
             and ma.SEQNO = 24) as PLACEOFBIRTH
        ,(Select VISA_NUMBER from dl_bordercontrol.visas where key_value = m.visa) as VISUM_NUMBER
        ,(select ATTRVARCHAR
            from dl_bordercontrol.MOVEMENT_ATTR ma
           where ma.MVMNTID = m.MVMNTID
             and ma.SEQNO = 101) as VISUM_LOCATION
        ,(select ATTRVARCHAR
            from dl_bordercontrol.MOVEMENT_ATTR ma
           where ma.MVMNTID = m.MVMNTID
             and ma.SEQNO = 104) as VISUM_DURATION
        ,(select ATTRVARCHAR
            from dl_bordercontrol.MOVEMENT_ATTR ma
           where ma.MVMNTID = m.MVMNTID
             and ma.SEQNO = 102) as VISUM_START
        ,(Select EXPIRY_DATE from dl_bordercontrol.visas where key_value = m.visa) as VISUM_END
        ,(Select Display_value from dl_common.visa_types where key_value = m.VISA_TYPE) as VISA_TYPE_NAME
        ,(Select PERMIT_TYPE from dl_bordercontrol.visas where key_value = m.visa) as PERMIT_TYPE
		,(Select PERMIT_EXPIRY_DATE from dl_bordercontrol.visas where key_value = m.visa) as PERMIT_EXPIRY_DATE
        ,(select ATTRVARCHAR
            from dl_bordercontrol.MOVEMENT_ATTR ma
           where ma.MVMNTID = m.MVMNTID
             and ma.SEQNO = 106) as LC_LENGTH
        ,(select ADDRESS from dl_bordercontrol.entry_forms where key_value = m.ENTRY_FORM) as LC_ADDRESS
		,(select FORM_NO from dl_bordercontrol.entry_forms where key_value = m.ENTRY_FORM) as TM6_NUMBER
		,(select NVL(display_value, name$dlc)
		    from dl_bordercontrol.adm_class_province$lc
			where key_value = (select PROVINCE
			from dl_bordercontrol.entry_forms
			where KEY_VALUE = m.ENTRY_FORM)) as PROVINCE
		,(select NVL(display_value, name$dlc) from dl_bordercontrol.adm_class_district$lc
			where key_value = (select DISTRICT
			from dl_bordercontrol.entry_forms
			where KEY_VALUE = m.ENTRY_FORM)) as DISTRICT
		,(select NVL(display_value, name$dlc) from dl_bordercontrol.adm_class_subdistrict$lc
			where key_value = (select SUBDISTRICT
			from dl_bordercontrol.entry_forms
			where KEY_VALUE = m.ENTRY_FORM)) as SUBDISTRICT
		,(select NOTE from dl_bordercontrol.entry_forms where key_value = m.ENTRY_FORM) as NOTE
		,DL_BORDERCONTROL.DL_MOVEMENTHANDLING.get_BLOB(m.MVMNTID, 'MVMNT_OTHER_IMAGE_1') as MVMNT_OTHER_IMAGE_1
		,DL_BORDERCONTROL.DL_MOVEMENTHANDLING.get_BLOB(m.MVMNTID, 'MVMNT_OTHER_IMAGE_2') as MVMNT_OTHER_IMAGE_2
		,DL_BORDERCONTROL.DL_MOVEMENTHANDLING.get_BLOB(m.MVMNTID, 'MVMNT_OTHER_IMAGE_3') as MVMNT_OTHER_IMAGE_3
		,DL_BORDERCONTROL.DL_MOVEMENTHANDLING.get_BLOB(m.MVMNTID, 'MVMNT_OTHER_IMAGE_4') as MVMNT_OTHER_IMAGE_4
		,DL_BORDERCONTROL.DL_MOVEMENTHANDLING.get_BLOB(m.MVMNTID, 'MVMNT_OTHER_IMAGE_5') as MVMNT_OTHER_IMAGE_5
		,DL_BORDERCONTROL.DL_MOVEMENTHANDLING.get_BLOB(m.MVMNTID, 'MVMNT_OTHER_IMAGE_6') as MVMNT_OTHER_IMAGE_6
		,DL_BORDERCONTROL.DL_MOVEMENTHANDLING.get_BLOB(m.MVMNTID, 'MVMNT_OTHER_IMAGE_7') as MVMNT_OTHER_IMAGE_7
		,DL_BORDERCONTROL.DL_MOVEMENTHANDLING.get_BLOB(m.MVMNTID, 'MVMNT_OTHER_IMAGE_8') as MVMNT_OTHER_IMAGE_8
		,DL_BORDERCONTROL.DL_MOVEMENTHANDLING.get_BLOB(m.MVMNTID, 'MVMNT_OTHER_IMAGE_9') as MVMNT_OTHER_IMAGE_9
		,DL_BORDERCONTROL.DL_MOVEMENTHANDLING.get_BLOB(m.MVMNTID, 'MVMNT_OTHER_IMAGE_10') as MVMNT_OTHER_IMAGE_10
    from dl_bordercontrol.V_MOVEMENTS m
   inner join dl_bordercontrol.V_BORDEROCUMENTS d
      on (m.BRDDOCID = d.BRDDOCID);
  GRANT SELECT ON "DL_BORDERCONTROL"."V_M_D" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."V_M_D" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."V_M_D" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_M_D" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."V_M_D" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_M_D" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_M_D" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_M_D" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BORDERCONTROL"."V_M_D" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."V_M_D" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_M_D" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."V_M_D" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."V_M_D" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."V_M_D" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."V_M_D" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."V_M_D" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."V_M_D" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."V_M_D" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."V_M_D" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_M_D" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_M_D" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_M_D" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_M_D" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_M_D" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_M_D" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_M_D" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_M_D" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_M_D" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_M_D" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_M_D" TO "PORNRUKSA_S";
