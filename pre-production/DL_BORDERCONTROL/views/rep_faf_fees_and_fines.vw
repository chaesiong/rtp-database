CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."REP_FAF_FEES_AND_FINES" ("RWNUM", "RECEIPT_NUMBER", "PAYMENT_RATE", "DOCNO", "NAME", "SEX", "DATE_OF_BIRTH", "NATIONALITY", "ISSUING_DATE", "TOTAL_COSTS", "STATUS", "TM6NO", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME", "SEARCH_RECEIPT_NUMBER", "GENERATION_STATUS", "KEY_VALUE", "FEE_OR_FINE", "INS_BORDERPOST", "INS_TERMINAL", "REFERENCE_NUMBER") AS 
  SELECT ROWNUM AS rwnum
      ,src."RECEIPT_NUMBER",src."PAYMENT_RATE",src."DOCNO",src."NAME",src."SEX",src."DATE_OF_BIRTH",src."NATIONALITY",src."ISSUING_DATE",src."TOTAL_COSTS",src."STATUS",src."TM6NO",src."LAST_NAME",src."FIRST_NAME",src."MIDDLE_NAME",src."SEARCH_RECEIPT_NUMBER",src."GENERATION_STATUS",src."KEY_VALUE",src."FEE_OR_FINE",src."INS_BORDERPOST",src."INS_TERMINAL",src."REFERENCE_NUMBER"
  FROM (SELECT faf.booking_number || '/' || faf.receipt_number AS receipt_number
              ,det.payment_rate
              ,faf.docno
              ,faf.first_name ||
                CASE
                  WHEN faf.last_name IS NOT NULL AND faf.first_name IS NOT NULL THEN ' - ' || faf.last_name
                  WHEN faf.last_name IS NOT NULL THEN faf.last_name
                  ELSE NULL
                END AS name
              ,faf.sex
              ,faf.date_of_birth
              ,faf.nationality
              ,faf.issuing_date
              ,faf.total_costs
              ,faf.status
              ,form.form_no AS tm6no
              ,faf.last_name
              ,faf.first_name
              ,faf.middle_name
              ,faf.receipt_number AS search_receipt_number
              ,faf.generation_status
              ,faf.key_value
              ,faf.fee_or_fine
              ,faf.ins_borderpost
              ,faf.ins_terminal
              ,faf.reference_number
          FROM dl_bordercontrol.faf_fees_and_fines faf
          LEFT JOIN dl_bordercontrol.entry_forms form ON faf.entry_form = form.key_value
          JOIN dl_bordercontrol.faf_fees_and_fines_details det ON faf.key_value = det.fees_and_fines
         ORDER BY issuing_date DESC) src
;
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_FEES_AND_FINES" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."REP_FAF_FEES_AND_FINES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."REP_FAF_FEES_AND_FINES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_FEES_AND_FINES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."REP_FAF_FEES_AND_FINES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_FEES_AND_FINES" TO "TESTADM";