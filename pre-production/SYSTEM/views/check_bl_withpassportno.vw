CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."CHECK_BL_WITHPASSPORTNO" ("MVMNTID", "DATE_OF_ENTRY", "DOCNO", "GIVENNAME", "SURNAME", "SEX", "NAT", "CALC_DOB", "EXPIRYDATE", "FORM_NO", "PIBICS_DOC_NO", "WLCD", "REMARK", "REASONCD", "REASONENM", "REASONTNM") AS 
  select m.mvmntid
, m.DATE_OF_ENTRY
, d.DOCNO
, d.givenname
, d.surname
, CASE d.SEX WHEN 1 THEN 'M' WHEN 2 THEN 'F' ELSE 'X' END as SEX
, d.nat
, TO_CHAR(d.CALC_DOB, 'DD/MM/YYYY') as CALC_DOB
,d.expirydate
, e.FORM_NO
, pibics.DOCNO as pibics_doc_no
, pibics.wlcd, pibics.REMARK, pibics.REASONCD, pibics.REASONENM, pibics.REASONTNM
from dl_bordercontrol.movements m
inner join dl_bordercontrol.borderdocuments d on m.brddocid = d.brddocid
inner join DL_BORDERCONTROL.ENTRY_FORMS e on m.ENTRY_FORM = e.KEY_VALUE

inner join (select w.wlcd, id.DOCNO, w.REMARK, br.REASONCD, br.REASONENM, br.REASONTNM
from PIBICSDM2.WATCHLIST w
inner join PIBICSDM2.WLINDICATECARD id on w.wlcd = id.WLCD
left join PIBICSDM2.BLIMPREASON br on w.REASONCD = br.REASONCD) pibics on

d.DOCNO = pibics.DOCNO
where m.SOURCE_SYSTEM = '1' and m.IS_FINISHED = 'Y'
  --and trunc(m.DATE_OF_ENTRY) = TO_DATE('11-jan-2019','dd-mon-yyyy')
and trunc(m.DATE_OF_ENTRY) = to_char(to_date(sysdate), 'dd-mon-yyyy')
group by m.mvmntid, m.DATE_OF_ENTRY, d.DOCNO, d.givenname, d.surname, d.SEX
, d.nat, d.CALC_DOB, d.expirydate, e.FORM_NO, pibics.DOCNO ,pibics.wlcd, pibics.REMARK, pibics.REASONCD, pibics.REASONENM, pibics.REASONTNM
order by m.DATE_OF_ENTRY desc;
