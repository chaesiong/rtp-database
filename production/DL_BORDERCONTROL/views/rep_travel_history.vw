CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" ("ROW_NUM", "GIVENNAME", "SURNAME", "FULL_NAME", "SEX", "SEX_VALUE", "DATE_OF_BIRTH", "NATIONALITY", "NATIONALITY_VALUE", "DOCUMENT_NO", "IDENTITY", "DOCUMENT_TYPE_VALUE", "DOCUMENT_CLASS", "DOCUMENT_EXPIRY_DATE", "TRANSPORT", "BRDDOCID", "IS_FINISHED", "SUPERVISOR_NAME", "VISA_TYPE", "VISA_TYPE_VALUE", "BORDERPOST", "BORDERPOST_NAME", "PORT_MOVEMENT", "PORT_MOVEMENT_VALUE", "AIRLINE", "AIRLINE_VALUE", "ORIGIN_AIRPORT", "ORIGIN_AIRPORT_VALUE", "DESTINATION_AIRPORT", "DESTINATION_AIRPORT_VALUE", "CREATED_AT", "CREATED_BY", "CREATED_BY_USERNAME", "TRAVEL_DATE") AS 
  SELECT
      ROWNUM                                                row_num,
      bd.givenname,
      bd.surname,
      TRIM(bd.givenname || ' ' || bd.surname)               full_name,
      bd.sex                                                sex,
       (SELECT nvl(display_value,display_value$dlc)
          FROM dl_common.human_sexes$lc
         WHERE num_value = bd.sex)                         sex_value,
      TO_CHAR(dl_bordercontrol.PKG_COMMON.Parse_Date(bd.dob, 1, 0, 0, 1), 'DD/MM/YYYY') date_of_birth,
      bd.nat                                                nationality,
       (SELECT nvl(display_value,display_value$dlc)
          FROM dl_common.countries$lc
         WHERE key_value = bd.nat)                         nationality_value,
      bd.docno                                              document_no,
      i.identity,
      bd.doctype                                            document_type_value,
	  bd.docclass                                           document_class,
      bd.expirydate                                         document_expiry_date,
      scanned_flight                                        transport,
      M.brddocid,
	  DECODE(M.IS_FINISHED, 'Y', 1, 'N', 0) IS_FINISHED,
      M.ps_3                                                supervisor_name,
      m.visa_type                                           visa_type,
       (SELECT nvl(display_value,display_value$dlc)
          FROM dl_common.visa_types$lc
         WHERE key_value = m.visa_type)                    visa_type_value,
      M.ins_borderpost                                      borderpost,
       (SELECT nvl(name,name$dlc)
          FROM dl_bordercontrol.borderposts$lc
         WHERE key_value = M.ins_borderpost)               borderpost_name,
      exitflg                                               port_movement,
       (SELECT nvl(display_value,display_value$dlc)
          FROM dl_common.port_movements$lc
         WHERE num_value = M.exitflg)                      port_movement_value,
      ( SELECT A.num_value
          FROM dl_common.carriers A
         WHERE A.is_active = 'Y'
           AND A.num_value = (SELECT F.agentid
                                FROM dl_bordercontrol.flights F
                               WHERE F.flightnum = M.scanned_flight
                                 AND NOT F.directionflg = M.exitflg
                                 AND F.active = 1)) AS      airline,
       (SELECT nvl(A.display_value,A.display_value$dlc)
          FROM dl_common.carriers$lc A
         WHERE A.is_active = 'Y'
           AND A.num_value = (SELECT F.agentid
                                FROM dl_bordercontrol.flights F
                               WHERE F.flightnum = M.scanned_flight
                                 AND NOT F.directionflg = M.exitflg
                                 AND F.active = 1)) AS airline_value,
       (SELECT A.num_value
          FROM dl_common.ports A
         WHERE A.num_value = (SELECT F.originairportid
                                FROM dl_bordercontrol.flights F
                               WHERE F.flightnum = M.scanned_flight
                                 AND NOT F.directionflg = M.exitflg
                                 AND F.active = 1)) AS      origin_airport,
       (SELECT nvl(A.display_value,A.display_value$dlc)
          FROM dl_common.ports$lc A
         WHERE A.num_value = (SELECT F.originairportid
                                FROM dl_bordercontrol.flights F
                               WHERE F.flightnum = M.scanned_flight
                                 AND NOT F.directionflg = M.exitflg
                                 AND F.active = 1)) AS origin_airport_value,
       (SELECT A.num_value
          FROM dl_common.ports A
         WHERE A.num_value = (SELECT F.destinairportid
                                FROM dl_bordercontrol.flights F
                               WHERE F.flightnum = M.scanned_flight
                                 AND NOT F.directionflg = M.exitflg
                                 AND F.active = 1)) AS      destination_airport,
       (SELECT nvl(A.display_value,A.display_value$dlc)
          FROM dl_common.ports$lc A
         WHERE A.num_value = (SELECT F.destinairportid
                                FROM dl_bordercontrol.flights F
                               WHERE F.flightnum = M.scanned_flight
                                 AND NOT F.directionflg = M.exitflg
                                 AND F.active = 1)) AS destination_airport_value,
      m.ins_at                                              created_at,
      m.ins_by                                              created_by,
      CASE WHEN instr(m.ins_by, '@') > 0 THEN trim(substr(m.ins_by, 1, instr(m.ins_by,'@') - 2)) ELSE trim(m.ins_by) END AS created_by_username,
      m.date_of_entry                                         travel_date
    FROM dl_bordercontrol.movements       M
      ,dl_bordercontrol.borderdocuments bd
      ,dl_bordercontrol.identities i
    WHERE M.brddocid = bd.brddocid
      and m.brddocid = i.brddocid;
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "JASPER_REPORTING";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."REP_TRAVEL_HISTORY" TO "BIOSAADM";
