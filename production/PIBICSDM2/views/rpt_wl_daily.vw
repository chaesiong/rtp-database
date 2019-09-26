CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."RPT_WL_DAILY" ("DATE_OF_ENTRY", "METHOD", "NAME", "DIRECTION", "ROWN") AS 
  with RPT_WL_FlgA
as 
(
select bc.CASE_NUMBER, bc.NOTICE, bc.CASE_TYPE, bc.ARRESTED_WARRANT_NUMBER, bc.ARRESTED_WARRANT_DATE, bc.REFERENCE_DOCUMENT
,r.DISPLAY_VALUE, nvl(m.DATE_OF_ENTRY,m.INS_AT) as DATE_OF_ENTRY,m.EXITFLG, b.NAME, NVL(a.DOCNO, bd.DOCNO) as DOCNO
,NVL(a.GIVENNAME,bd.GIVENNAME) as GIVENNAME
,NVL(a.LASTNAME,bd.SURNAME) as LASTNAME
,NVL(bl.GIVENNAME_THAI,bd.GIVENNAME_THAI) as GIVENNAME_THAI
,NVL(bl.SURNAME_THAI,bd.SURNAME_THAI) as SURNAME_THAI
,NVL(a.GENDER,bd.SEX) as GENDER
,NVL(a.DOB,bd.DOB) as DOB
,NVL(a.ISSUINGCOUNTRY,bd.NAT) as NATIONALITY
,a.BL_REMARKS
from DL_BORDERCONTROL.INCIDENTS a
left join DL_BORDERCONTROL.BORDERPOSTS b on a.INS_BORDERPOST = b.KEY_VALUE
inner join DL_BORDERCONTROL.MOVEMENTS m on a.MVMNTID = m.MVMNTID
left join DL_BORDERCONTROL.BORDERDOCUMENTS bd on a.BRDDOCID = bd.BRDDOCID
left join DL_BLACKLIST.IDENTITIES bl on a.BL_APPROVED_IDENTITY = bl.KEY_VALUE
left join DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES bci on bl.KEY_VALUE = bci.IDENTITY
left join DL_BLACKLIST.BLACKLIST_CASES bc on bci.BLACKLIST_CASE = bc.ID
left join DL_COMMON.REASON_CODES$I18N r on bc.REASON = r.KEY_VALUE
where m.SOURCE_SYSTEM = 1 
--and m.IS_FINISHED = 'Y'
and nvl(m.DATE_OF_ENTRY,m.INS_AT) > TO_DATE('2018-12-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
and nvl(m.DATE_OF_ENTRY,m.INS_AT) < trunc(sysdate)
--and bc.CASE_TYPE is not null
and a.BL_ACTION = 'A'
--and bc.CASE_TYPE = 'CRIMINAL'
order by nvl(m.DATE_OF_ENTRY,m.INS_AT)
),
RPT_WL_FlgF
as 
(
select nvl(m.DATE_OF_ENTRY,m.INS_AT) as DATE_OF_ENTRY,m.EXITFLG, b.NAME, NVL(a.DOCNO, bd.DOCNO) as DOCNO
,NVL(a.GIVENNAME,bd.GIVENNAME) as GIVENNAME
,NVL(a.LASTNAME,bd.SURNAME) as LASTNAME
,NVL(bl.GIVENNAME_THAI,bd.GIVENNAME_THAI) as GIVENNAME_THAI
,NVL(bl.SURNAME_THAI,bd.SURNAME_THAI) as SURNAME_THAI
,bd.SEX as GENDER
,NVL(a.DOB,bd.DOB) as DOB
,NVL(a.ISSUINGCOUNTRY,bd.NAT) as NATIONALITY
,a.BL_REMARKS
from DL_BORDERCONTROL.INCIDENTS a
left join DL_BORDERCONTROL.BORDERPOSTS b on a.INS_BORDERPOST = b.KEY_VALUE
inner join DL_BORDERCONTROL.MOVEMENTS m on a.MVMNTID = m.MVMNTID
left join DL_BORDERCONTROL.BORDERDOCUMENTS bd on a.BRDDOCID = bd.BRDDOCID
left join DL_BLACKLIST.IDENTITIES bl on a.BL_APPROVED_IDENTITY = bl.KEY_VALUE
left join DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES bci on bl.KEY_VALUE = bci.IDENTITY
left join DL_BLACKLIST.BLACKLIST_CASES bc on bci.BLACKLIST_CASE = bc.ID
left join PIBICSDM2.BLIMPREASON r on bc.REASON = r.REASON_SEQNO
where m.SOURCE_SYSTEM = 1 
--and m.IS_FINISHED = 'Y'
and nvl(m.DATE_OF_ENTRY,m.INS_AT) > TO_DATE('2018-12-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
and nvl(m.DATE_OF_ENTRY,m.INS_AT) < trunc(sysdate)
and a.BL_ACTION = 'F'
and a.OFFICER not in ('ALL_USER','BIO.TEST.ALL','BIO_TEST','BKK_USER','BKK_USER_IN','CNX_USER','DMK2_USER','DMK_USER'
,'DMK_USER_IN','HKT_USER','KBV_USER','KKC_USER','NAW_USER','USER198','USER202','USER218','USER223','USER238'
,'USER244','USER_TEST','UTP_USER','TEST','TESTER','USER_TEST','TT_OIL','TT_PROUD','SUPERADMIN','UM_ADMIN')
order by nvl(m.DATE_OF_ENTRY,m.INS_AT)
),
RPT_WL_FlgC
as 
(
select nvl(m.DATE_OF_ENTRY,m.INS_AT) as DATE_OF_ENTRY,m.EXITFLG, b.NAME, NVL(a.DOCNO, bd.DOCNO) as DOCNO
,NVL(a.GIVENNAME,bd.GIVENNAME) as GIVENNAME
,NVL(a.LASTNAME,bd.SURNAME) as LASTNAME
,NVL(bl.GIVENNAME_THAI,bd.GIVENNAME_THAI) as GIVENNAME_THAI
,NVL(bl.SURNAME_THAI,bd.SURNAME_THAI) as SURNAME_THAI
,bd.SEX as GENDER
,NVL(a.DOB,bd.DOB) as DOB
,NVL(a.ISSUINGCOUNTRY,bd.NAT) as NATIONALITY
,a.BL_REMARKS
from DL_BORDERCONTROL.INCIDENTS a
left join DL_BORDERCONTROL.BORDERPOSTS b on a.INS_BORDERPOST = b.KEY_VALUE
inner join DL_BORDERCONTROL.MOVEMENTS m on a.MVMNTID = m.MVMNTID
left join DL_BORDERCONTROL.BORDERDOCUMENTS bd on a.BRDDOCID = bd.BRDDOCID
left join DL_BLACKLIST.IDENTITIES bl on a.BL_APPROVED_IDENTITY = bl.KEY_VALUE
left join DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES bci on bl.KEY_VALUE = bci.IDENTITY
left join DL_BLACKLIST.BLACKLIST_CASES bc on bci.BLACKLIST_CASE = bc.ID
left join PIBICSDM2.BLIMPREASON r on bc.REASON = r.REASON_SEQNO
where m.SOURCE_SYSTEM = 1 
--and m.IS_FINISHED = 'Y'
and nvl(m.DATE_OF_ENTRY,m.INS_AT) > TO_DATE('2018-12-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
and nvl(m.DATE_OF_ENTRY,m.INS_AT) < trunc(sysdate)
and a.BL_ACTION = 'C'
order by nvl(m.DATE_OF_ENTRY,m.INS_AT)
),
RPT_WL_FlgOS
as 
(
select nvl(m.DATE_OF_ENTRY,m.INS_AT) as DATE_OF_ENTRY,m.EXITFLG, b.NAME,d.DOCNO,d.GIVENNAME, d.SURNAME
, d.GIVENNAME_THAI, d.SURNAME_THAI,d.SEX,d.CALC_DOB, d.NAT, a.EXTOVS_DATE, a.FINDOVERSTAYDAYS, a.FINDOVERSTAYAMOUNT
from DL_BORDERCONTROL.MSCS_MOVEMENTS_OVERSTAY a
left join DL_BORDERCONTROL.BORDERPOSTS b on a.INS_BORDERPOST = b.KEY_VALUE
inner join DL_BORDERCONTROL.MOVEMENTS m on a.MVMNTID = m.MVMNTID
inner join DL_BORDERCONTROL.BORDERDOCUMENTS d on m.BRDDOCID = d.BRDDOCID
where m.SOURCE_SYSTEM = 1 
and m.IS_FINISHED = 'Y'
and nvl(m.DATE_OF_ENTRY,m.INS_AT) > TO_DATE('2018-12-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
and nvl(m.DATE_OF_ENTRY,m.INS_AT) < trunc(sysdate)
and a.FLAGOVERSTAY = 'Y'
order by nvl(m.DATE_OF_ENTRY,m.INS_AT)
)
select DATE_OF_ENTRY,Method,Name,CASE exitflg 
WHEN 0 THEN 'ขาเข้า'
WHEN 1 THEN 'ขาออก'
else 'ไม่ระบุ'
END Direction,RowN
from (
select to_char(DATE_OF_ENTRY,'yyyymmdd') as DATE_OF_ENTRY ,'ตรวจสอบแล้วตรงกับบุคคลต้องห้ามและเฝ้าดู' as Method, name,exitflg,count(*) as RowN from RPT_WL_FlgA
group by to_char(DATE_OF_ENTRY,'yyyymmdd'),'ตรวจสอบแล้วตรงกับบุคคลต้องห้ามและเฝ้าดู', name,exitflg
union all
select to_char(DATE_OF_ENTRY,'yyyymmdd') as DATE_OF_ENTRY,'ใช้เพื่อตรวจสอบแล้วดำเนินการปิดหน้าจอ' as Method, name,exitflg,count(*) from RPT_WL_FlgF
group by to_char(DATE_OF_ENTRY,'yyyymmdd'),'ใช้เพื่อตรวจสอบแล้วดำเนินการปิดหน้าจอ', name,exitflg
union all
select to_char(DATE_OF_ENTRY,'yyyymmdd') as DATE_OF_ENTRY,'ตรวจสอบแล้วไม่ตรงกับบุคคลต้องห้ามและเฝ้าดู' as Method, name,exitflg,count(*) from RPT_WL_FlgC
group by to_char(DATE_OF_ENTRY,'yyyymmdd'),'ตรวจสอบแล้วไม่ตรงกับบุคคลต้องห้ามและเฝ้าดู', name,exitflg
union all
select to_char(DATE_OF_ENTRY,'yyyymmdd') as DATE_OF_ENTRY,'ต่างด้าวที่อยู่เกินกำหนดระยะอนุญาต' as Method, name,exitflg ,count(*) from RPT_WL_FlgOS
group by to_char(DATE_OF_ENTRY,'yyyymmdd'),'ต่างด้าวที่อยู่เกินกำหนดระยะอนุญาต', name,exitflg 
) where name not like '%Test%' and name not like '%ทดสอบ%'
order by 1,2;
