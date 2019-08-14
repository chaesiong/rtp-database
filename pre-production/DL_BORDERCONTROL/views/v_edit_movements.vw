CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."V_EDIT_MOVEMENTS" ("MVMNTID", "BRDDOCID", "LANDBARCD", "EXITFLG", "MAX_STAY_DT", "FINGERMATCH", "FACEMATCH", "MVMNTADDR", "ORIDEST", "INS_AT", "INS_TERMINAL", "INS_BORDERPOST", "REFUSEDFLG", "OBSERVATION", "TRNSPRTUNITID", "PERSON_TYPE", "SCANNED_FLIGHT", "PS_1", "PS_2", "PS_3", "PS_4", "PS_5", "PS_6", "PS_7", "PS_8", "PS_9", "PS_10", "FINGERMATCH_HISTORY", "FACEMATC_HISTORY", "REASON_OFFLOAD", "REASON_DEPORTEE", "VISA_TYPE", "VISA", "DML_AT", "DML_BY", "DML_TYPE", "INS_BY", "PRIOR_MOVEMENT", "ENTRY_FORM", "FORM_NO_APPROVED", "MOVEMENT_DT", "SOURCE_SYSTEM", "DATE_OF_ENTRY", "MRZVISA", "DOCTYPE", "DOCNO", "ISSUECTRY", "NAT", "DOB", "EXPIRYDATE", "GIVENNAME", "SURNAME", "OPTIONALDATA", "AFISID", "OFFICER_OBSERVATION", "MRZDG1", "P_01", "P_02", "P_03", "P_04", "P_05", "MIDDLENAME", "GIVENNAME_THAI", "MIDDLENAME_THAI", "SURNAME_THAI", "CALC_DOB", "MANUAL_EXPIRY_DATE", "MANUAL_ISSUING_DATE", "MANUAL_NATIONALITY", "MANUAL_PLACEOFBIRTH", "SEX", "DOCCLASS", "SUB_NATIONALITY", "FORM_IMAGE", "FORM_NO", "PROVINCE", "DISTRICT", "SUBDISTRICT", "ADDRESS", "NOTE", "PASS_IMAGE", "CHIP_IMAGE", "LIVE_PHOTO") AS 
  select --Movements
         m.MVMNTID
        ,m.BRDDOCID
        ,m.LANDBARCD
        ,m.EXITFLG
        ,m.MAX_STAY_DT
        ,m.FINGERMATCH
        ,m.FACEMATCH
        ,m.MVMNTADDR
        ,m.ORIDEST
        ,m.INS_AT
        ,m.INS_TERMINAL
        ,m.INS_BORDERPOST
        ,m.REFUSEDFLG
        ,m.OBSERVATION
        ,m.TRNSPRTUNITID
        ,m.PERSON_TYPE
        ,m.SCANNED_FLIGHT
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
        ,m.FINGERMATCH_HISTORY
        ,m.FACEMATC_HISTORY
        ,m.REASON_OFFLOAD
        ,m.REASON_DEPORTEE
        ,m.VISA_TYPE
        ,m.VISA
        ,m.DML_AT
        ,regexp_replace(decode(m.DML_BY, 'n.a.', 'EGATE', m.DML_BY), '([^@]*).*', '\1') DML_BY
        ,m.DML_TYPE
        ,regexp_replace(decode(m.INS_BY, 'n.a.', 'EGATE', m.INS_BY), '([^@]*).*', '\1') INS_BY
        ,m.PRIOR_MOVEMENT
        ,m.ENTRY_FORM
        ,m.FORM_NO_APPROVED
        ,m.MOVEMENT_DT
        ,decode(nvl(m.SOURCE_SYSTEM, -999), 1, 'BIO', 2, 'PIB', 3, 'ATC', -999, 'N/A', '' || m.SOURCE_SYSTEM) SOURCE_SYSTEM
        ,m.DATE_OF_ENTRY
        ,m.MRZVISA
        -- Borderdocuments
        ,b.DOCTYPE
        ,b.DOCNO
        ,b.ISSUECTRY
        ,b.NAT
        ,b.DOB_PARTIAL.getFormatData('DD/MM/YYYY') DOB --b.DOB
        ,b.EXPIRYDATE
        ,b.GIVENNAME
        ,b.SURNAME
        ,b.OPTIONALDATA
        ,b.AFISID
        ,b.OFFICER_OBSERVATION
        ,b.MRZDG1
        ,b.P_01
        ,b.P_02
        ,b.P_03
        ,b.P_04
        ,b.P_05
        ,b.MIDDLENAME
        ,b.GIVENNAME_THAI
        ,b.MIDDLENAME_THAI
        ,b.SURNAME_THAI
        ,b.CALC_DOB
        ,b.MANUAL_EXPIRY_DATE
        ,b.MANUAL_ISSUING_DATE
        ,b.MANUAL_NATIONALITY
        ,b.MANUAL_PLACEOFBIRTH
        ,b.SEX
        ,b.DOCCLASS
        ,b.SUB_NATIONALITY
        -- Entry Forms
        ,e.FORM_IMAGE
        ,e.FORM_NO
        ,e.PROVINCE
        ,e.DISTRICT
        ,e.SUBDISTRICT
        ,e.ADDRESS
        ,e.NOTE
        --Blobs
        ,(select Image
        from dl_bordercontrol.borderdocimages bi
        where bi.brddocid = m.BRDDOCID
        and seqno = 2) PASS_IMAGE
        ,(select Image
        from dl_bordercontrol.borderdocimages bi
        where bi.brddocid = m.BRDDOCID
        and seqno = 1) CHIP_IMAGE
        ,(select LIVE_PHOTO
        from DL_BORDERCONTROL.MOVEMENTS_BLOB mb
        where mb.MVMNT_ID = m.MVMNTID) LIVE_PHOTO
  from DL_BORDERCONTROL.MOVEMENTS m,
       DL_BORDERCONTROL.BORDERDOCUMENTS b,
       DL_BORDERCONTROL.ENTRY_FORMS e
  where m.BRDDOCID = b.BRDDOCID
    and m.ENTRY_FORM = e.KEY_VALUE (+)
    and m.IS_FINISHED = 'Y';
  GRANT SELECT ON "DL_BORDERCONTROL"."V_EDIT_MOVEMENTS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."V_EDIT_MOVEMENTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."V_EDIT_MOVEMENTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_EDIT_MOVEMENTS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."V_EDIT_MOVEMENTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_EDIT_MOVEMENTS" TO "TESTADM";