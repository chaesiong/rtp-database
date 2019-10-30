CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."CHECK_BL_WITHFNAME_LNAME_SEX_NAT" ("MVMNTID", "DATE_OF_ENTRY", "DOCNO", "GIVENNAME", "SURNAME", "BSEX", "NAT", "BCALC_DOB", "EXPIRYDATE", "FORM_NO", "FIRSTNM", "LASTNM", "SEX", "ABBCOUNT", "BIRTHDTE", "CALC_DOB", "WLCD", "REMARK", "REASONCD", "REASONENM", "REASONTNM") AS 
  select m.mvmntid
, m.DATE_OF_ENTRY
, d.DOCNO
, d.givenname
, d.surname
, CASE d.SEX WHEN 1 THEN 'M' WHEN 2 THEN 'F' ELSE 'X' END as BSEX
, d.nat
, TO_CHAR(d.CALC_DOB, 'DD/MM/YYYY') as BCALC_DOB
,d.expirydate
, e.FORM_NO
, pibics.FIRSTNM
, pibics.LASTNM
, pibics.SEX
, pibics.ABBCOUNT
, pibics.BIRTHDTE
, TO_CHAR(d.CALC_DOB, 'DD/MM/YYYY') as CALC_DOB
, pibics.wlcd
, pibics.REMARK
, pibics.REASONCD
, pibics.REASONENM
, pibics.REASONTNM
from dl_bordercontrol.movements m
inner join dl_bordercontrol.borderdocuments d on m.brddocid = d.brddocid
inner join DL_BORDERCONTROL.ENTRY_FORMS e on m.ENTRY_FORM = e.KEY_VALUE
inner join (select NVL(w1.WLEFIRSTNM, w1.WLTFIRSTNM) as FIRSTNM, NVL(w1.WLELASTNM,w1.WLTLASTNM)as LASTNM
,w.SEX, w1.NATIONCD, c.ABBCOUNT, w1.BIRTHDTE, w.wlcd, w.REMARK, br.REASONCD, br.REASONENM, br.REASONTNM 
--, TO_CHAR(w1.BIRTHDTE, 'DD/MM/YYYY') as CALC_DOB
from PIBICSDM2.WATCHLIST w
inner join PIBICSDM2.WATCHLISTNM w1 on w.WLCD = w1.WLCD
inner join (select * from PIBICSDM2.COUNTRY where actflag = 'Y') c on w1.NATIONCD = c.COUNTCD
left join PIBICSDM2.BLIMPREASON br on w.REASONCD = br.REASONCD) pibics on
d.GIVENNAME = pibics.FIRSTNM and
d.surname = pibics.LASTNM and
CASE d.SEX WHEN 1 THEN 'M' WHEN 2 THEN 'F' ELSE 'X' END = pibics.SEX and
d.nat = pibics.ABBCOUNT
where m.SOURCE_SYSTEM = '1' and m.IS_FINISHED = 'Y'
and pibics.BIRTHDTE = TO_CHAR(d.CALC_DOB, 'DD/MM/YYYY')
 --and trunc(m.DATE_OF_ENTRY) = TO_DATE('11-jan-2019','dd-mon-yyyy')
and trunc(m.DATE_OF_ENTRY) = to_char(to_date(sysdate), 'dd-mon-yyyy')
order by m.DATE_OF_ENTRY desc;
