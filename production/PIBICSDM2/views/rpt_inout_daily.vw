CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."RPT_INOUT_DAILY" ("AIRPORT", "COUNTER", "DIRECTION", "SEX", "NATIONALITY", "VISATYPE", "PERSONTYPE", "COUNTTRAVLER") AS 
  SELECT X.Name AS Airport,
X.TNAME AS Counter,
CASE X.exitflg
WHEN 0 THEN 'ขาเข้า'
WHEN 1 THEN 'ขาออก'
END Direction,
CASE X.SEX
WHEN 1 THEN 'ชาย'
WHEN 2 THEN 'หญิง'
END SEX,
X.NAT AS NATIONALITY,
X.display_value AS VisaType,
CASE X.person_Type
WHEN 1 THEN 'ผู้เดินทาง'
WHEN 2 THEN 'ลูกเรือ'
END PersonType,
count(*) AS CountTravler
FROM (
select m.DATE_OF_ENTRY, m.EXITFLG, bp.NAME, m.SCANNED_FLIGHT, vt.DISPLAY_VALUE, t.name AS TNAME
, d.DOCNO, d.GIVENNAME, d.SURNAME, d.SEX, d.NAT, d.CALC_DOB, m.person_type, m.ins_by
from dl_bordercontrol.movements m
inner join dl_bordercontrol.borderdocuments d on m.brddocid = d.brddocid
--inner join DL_BORDERCONTROL.ENTRY_FORMS e on m.ENTRY_FORM = e.KEY_VALUE
left join dl_bordercontrol.borderposts bp on m.INS_BORDERPOST = bp.key_value
LEFT JOIN DL_BORDERCONTROL.TERMINALS t ON m.INS_TERMINAL = t.ID
left join DL_COMMON.VISA_TYPES$I18N vt on m.VISA_TYPE = vt.KEY_VALUE
WHERE m.SOURCE_SYSTEM = 1
and m.IS_FINISHED = 'Y'
--and DL_INTERFACE.PKG_OBJECT_HANDLING.AA_GET_PIBICS_PK(m.mvmntid) is not null
and TRUNC(m.DATE_OF_ENTRY) >= DATE '2018-12-12'
and TRUNC(m.DATE_OF_ENTRY) < trunc(sysdate)
order BY m.DATE_OF_ENTRY
) X
GROUP BY X.NAME, X.DISPLAY_VALUE, X.TNAME, X.SEX, X.NAT, X.EXITFLG, X.PERSON_TYPE;
