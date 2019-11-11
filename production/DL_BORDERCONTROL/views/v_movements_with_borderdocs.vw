CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" ("AIRLINE", "ORIGINAIRPORT", "DESTINATIONAIRPORT", "PS_3", "VISA_TYPE", "VISA", "MVMNTID", "BRDDOCID", "LANDBARCD", "EXITFLG", "MAX_STAY_DT", "FINGERMATCH", "FACEMATCH", "MVMNTADDR", "ORIDEST", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "INS_TERMINAL", "INS_BORDERPOST", "REFUSEDFLG", "OBSERVATION", "TRNSPRTUNITID", "PERSON_TYPE", "SCANNED_FLIGHT", "PRIOR_MOVEMENT", "ENTRY_FORM", "MOVEMENT_DT", "INS_AT_BC_DOC", "INS_BY_BC_DOC", "DML_AT_BC_DOC", "DML_BY_BC_DOC", "DML_TYPE_BC_DOC", "INS_TERMINAL_BC_DOC", "INS_BORDERPOST_BC_DOC", "DOCNO", "ISSUECTRY", "NAT", "EXPIRYDATE", "SEX", "DOB", "SURNAME", "GIVENNAME", "DOCTYPE") AS 
  select (select a.NUM_VALUE
            from DL_COMMON.CARRIERS a
           where a.IS_ACTIVE = 'Y'
             and a.NUM_VALUE = (select f.AGENTID
                                  from DL_BORDERCONTROL.FLIGHTS f
                                 where f.FLIGHTNUM = m.SCANNED_FLIGHT
                                   and not f.DIRECTIONFLG = m.EXITFLG
                                   and f.ACTIVE = 1)) as AIRLINE
        ,(select a.NUM_VALUE
            from DL_COMMON.PORTS a
           where a.NUM_VALUE = (select f.ORIGINAIRPORTID
                                  from DL_BORDERCONTROL.FLIGHTS f
                                 where f.FLIGHTNUM = m.SCANNED_FLIGHT
                                   and not f.DIRECTIONFLG = m.EXITFLG
                                   and f.ACTIVE = 1)) as ORIGINAIRPORT
        ,(select a.NUM_VALUE
            from DL_COMMON.PORTS a
           where a.NUM_VALUE = (select f.DESTINAIRPORTID
                                  from DL_BORDERCONTROL.FLIGHTS f
                                 where f.FLIGHTNUM = m.SCANNED_FLIGHT
                                   and not f.DIRECTIONFLG = m.EXITFLG
                                   and f.ACTIVE = 1)) as DESTINATIONAIRPORT
        ,m.PS_3
        ,m.VISA_TYPE
        ,m.VISA
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
        ,m.PRIOR_MOVEMENT
        ,m.ENTRY_FORM
        ,m.MOVEMENT_DT
        ,bd.INS_AT as INS_AT_BC_DOC
        ,bd.INS_BY as INS_BY_BC_DOC
        ,bd.DML_AT as DML_AT_BC_DOC
        ,bd.DML_BY as DML_BY_BC_DOC
        ,bd.DML_TYPE as DML_TYPE_BC_DOC
        ,bd.INS_TERMINAL as INS_TERMINAL_BC_DOC
        ,bd.INS_BORDERPOST as INS_BORDERPOST_BC_DOC
        ,bd.DOCNO
        ,bd.ISSUECTRY
        ,bd.NAT
        ,bd.EXPIRYDATE
        ,bd.SEX
        ,bd.DOB
        ,bd.SURNAME
        ,bd.GIVENNAME
        ,bd.DOCTYPE
    from dl_bordercontrol.MOVEMENTS       m
        ,dl_bordercontrol.BORDERDOCUMENTS bd
   where m.BRDDOCID = bd.BRDDOCID;
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "JASPER_REPORTING";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."V_MOVEMENTS_WITH_BORDERDOCS" TO "BIOSAADM";
