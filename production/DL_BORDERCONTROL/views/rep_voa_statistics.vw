CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."REP_VOA_STATISTICS" ("REQUESTED_DATE", "NATIONALITY", "VISA_NUMBER", "SEX", "OFFICER", "BORDERPOST", "WORKSTATION", "BORDERPOST_NAME", "WORKSTATION_ADDRESS", "TRANS_VEHICLE", "TRANS_NUMBER", "REPORT_TYPE", "RECEIPT_BOOKING_NUMBER", "RECEIPT_NUMBER", "CREATED_BY") AS 
  SELECT v.applicant_date AS requested_date
      ,p.nationality
      ,v.visa_number
      ,p.sex
      ,v.ins_officer    AS officer
      ,v.ins_borderpost AS borderpost
      ,v.ins_terminal   AS workstation
      ,b.name           AS borderpost_name
      ,t.ipaddress      AS workstation_address
      ,v.trans_vehicle
      ,v.trans_number
      ,NULL               AS report_type
      ,faf.booking_number AS receipt_booking_number
      ,faf.receipt_number AS receipt_number
      ,SUBSTR(v.ins_by, 1, INSTR(v.ins_by, '@') - 1) AS created_by
  FROM dl_bordercontrol.visas v
  JOIN dl_bordercontrol.person p                    ON v.person         = p.key_value
  JOIN dl_bordercontrol.borderposts b               ON v.ins_borderpost = b.key_value
  JOIN dl_bordercontrol.terminals t                 ON v.ins_terminal   = t.id
  LEFT JOIN dl_bordercontrol.faf_fees_and_fines faf ON v.receipt        = faf.key_value
 WHERE v.visa_type in (SELECT key_value FROM dl_common.visa_types WHERE icao_dc_list = 'VISA_ON_ARRIVAL')
 ORDER BY requested_date DESC
;
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_STATISTICS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."REP_VOA_STATISTICS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."REP_VOA_STATISTICS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_STATISTICS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."REP_VOA_STATISTICS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_STATISTICS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_STATISTICS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_STATISTICS" TO "BIOSUPPORT";
