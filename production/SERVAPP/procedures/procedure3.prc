CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."PROCEDURE3" 
(
  P_CURSOR OUT SYS_REFCURSOR ,
  PRATE_SEQNO in int,
  lang in VARCHAR2,
  PASSPORT_NO in VARCHAR2,
  NATION_SEQNO in int,
  TM6_NO in VARCHAR2
) AS 
v_sql VARCHAR2(5000);
BEGIN
 v_sql :='select a.*
 ,cursor(
      select '''' as FINESDETAIL_SEQNO
                ,i.PRATE_SEQNO
                ,i.prateamount as prateamount
                ,i.PRATENM
        from   pibicsdm2.PAYMENTRATE i
        where i.PRATE_SEQNO ='||PRATE_SEQNO||'
       ) as prate_detail
from (
select a.*, ROW_NUMBER() OVER (PARTITION BY a.TM6NO ORDER BY to_date(a.INDTE,''dd/mm/yyyy'') DESC) RN
from (
    SELECT 
       m.form_no as TM6NO,
       case  b.sex when  1 then ''M'' when 2 then ''F'' else '''' end as sex,
       to_char(b.CALC_DOB,''dd/mm/yyyy'') as BIRTH_DATE,
       c.COUNT_SEQNO as NATION_SEQNO,
        b.nat as NATION_CODE
        ,decode('''||lang||''',''th-TH'',c.NATIONTNM,c.NATIONENM) as NATION_NAME
        ,b.docno as PASSPORTNO
        ,'''' as SUFFIX_SEQNO
        ,b.GIVENNAME as EFIRSTNM
        ,b.SURNAME as EFAMILYNM
        ,b.MIDDLENAME as EMIDDLENM
        ,cv.seqno as CONV_SEQNO
        ,pcv.CONVCD   as CONV_CODE
        ,decode('''||lang||''',''th-TH'',pcv.CONVTNM,pcv.CONVENM)  as CONV_NAME
        ,m.SCANNED_FLIGHT as CONVREGNO
        ,to_char(m.DATE_OF_ENTRY,''dd/mm/YYYY'') as INDTE
        ,to_char(v.EXPIRY_DATE,''dd/mm/YYYY'') as VISAEXPDTE
        ,to_char(v.PERMIT_EXPIRY_DATE,''dd/mm/yyyy'') as PERMIT_DATE
        ,pmt.PERMIT_SEQNO as PERMIT_SEQNO
        ,pmt.PERMITCD as PERMIT_CODE
        ,decode('''||lang||''',''th-TH'',pmt.PERMITNM,pmt.PERMITNM) as PERMIT_NAME
        ,vt.seqno as VISATYPE_SEQNO
        ,pv.VISATYPECD as VISATYPE_CODE
        ,decode('''||lang||''',''th-TH'',pv.VISATYPETNM,pv.VISATYPEENM) as VISATYPE_NAME
         ,null as fineslipamount

    FROM 
        (
          SELECT 
            t.key_value
            , ROW_NUMBER() OVER (PARTITION BY t.form_no ORDER BY t.ins_at DESC) RN
            ,t.form_no
            ,m.*
            FROM dl_bordercontrol.entry_forms t
             inner join  dl_bordercontrol.movements m on m.entry_form = t.key_value and  m.EXITFLG =0 ';
    if TM6_NO is not null then
    v_sql := v_sql ||' WHERE form_no = upper('''||TM6_NO||''') ';
    end if;
      v_sql := v_sql ||'       
        ) m
        inner join dl_bordercontrol.borderdocuments b on b.brddocid = m.brddocid
        left join PIBICSDM2.COUNTRY c on b.nat =c.abbcount
        left join dl_bordercontrol.visas v on m.VISA =v.key_value
        left join DL_STAGING4PIBICS_INTF.trcd_visatype vt on vt.key_value =v.VISA_TYPE
        left join PIBICSDM2.VISATYPE pv on pv.visatype_seqno = vt.seqno
        left join  DL_STAGING4PIBICS_INTF.TRCD_CONVEYANCE cv on case when FN_IS_NUMBER(m.TRNSPRTUNITID) =1 then to_number(m.TRNSPRTUNITID) else -99 end = to_number(cv.key_value)
        left join PIBICSDM2.CONVEYANCE pcv on cv.seqno =pcv.CONV_SEQNO
        left join dl_staging4pibics_intf.trcd_permittype dmt on dmt.key_value = v.permit_type
        left join PIBICSDM2.PERMITTYPE pmt on dmt.seqno =pmt.permit_seqno
    WHERE 
        m.RN = 1 ';
         if PASSPORT_NO is not null then
          v_sql := v_sql ||' and upper(b.docno) = upper('''||PASSPORT_NO||''') ';
         end if;
         if NATION_SEQNO is not null then
          v_sql := v_sql ||'  and c.COUNT_SEQNO = '||NATION_SEQNO||' ';
         end if;
      
   v_sql := v_sql ||'
   union all 

        select a.TM6NO,
           a.sex,
           a.BIRTHDTE as BIRTH_DATE,
           b.COUNT_SEQNO as NATION_SEQNO,
            b.ABBCOUNT as NATION_CODE
            ,decode('''||lang||''',''th-TH'',b.NATIONTNM,b.NATIONENM) as NATION_NAME
            ,a.tdtno as PASSPORTNO
            ,'''' as SUFFIX_SEQNO
            ,a.EFIRSTNM
            ,a.EFAMILYNM
            ,a.EMIDDLENM
            ,a.CONV_SEQNO
            ,pcv.CONVCD   as CONV_CODE
            ,decode('''||lang||''',''th-TH'',pcv.CONVTNM,pcv.CONVENM)  as CONV_NAME
            ,a.CONVREGNO
            ,to_char(a.inoutdte,''dd/mm/YYYY'') as OUTDTE
            ,to_char(a.VISAEXPDTE,''dd/mm/YYYY'') as VISAEXPDTE
            ,to_char(a.PM_EXEXPDTE,''dd/mm/yyyy'') as PERMIT_DATE
            ,a.PERMIT_SEQNO
            ,pmt.PERMITCD as PERMIT_CODE
            ,decode('''||lang||''',''th-TH'',pmt.PERMITNM,pmt.PERMITNM) as PERMIT_NAME
            ,a.VISATYPE_SEQNO
            ,pv.VISATYPECD as VISATYPE_CODE
            ,decode('''||lang||''',''th-TH'',pv.VISATYPETNM,pv.VISATYPEENM) as VISATYPE_NAME
             ,null as fineslipamount
        from (
        SELECT 
                a.*
                , ROW_NUMBER() OVER (PARTITION BY a.TM6NO ORDER BY a.SEQNO DESC) RN
            FROM pibicsdm2.tminout a
           where a.cardtype =1 ';
        if TM6_NO is not null then
         v_sql := v_sql ||' WHERE a.TM6NO = upper('''||TM6_NO||''') ';
        end if;
       if PASSPORT_NO is not null then
         v_sql := v_sql ||' and upper(a.tdtno) = upper('''||PASSPORT_NO||''') ';
        end if;
               
         v_sql := v_sql ||'  ) a
        left join pibicsdm2.country b on a.nationcd =b.COUNTCD
        left join PIBICSDM2.CONVEYANCE pcv on a.CONV_SEQNO =pcv.CONV_SEQNO
        left join PIBICSDM2.PERMITTYPE pmt on a.permit_seqno =pmt.permit_seqno
        left join PIBICSDM2.VISATYPE pv on pv.visatype_seqno = a.visatype_seqno ';
         if NATION_SEQNO is not null then
          v_sql := v_sql ||'  where b.COUNT_SEQNO = '||NATION_SEQNO||' ';
         end if;
      v_sql := v_sql ||'   
        and a.rn =1 ) a
)a
where a.RN=1';
  DBMS_OUTPUT.put_line(v_sql);

open P_CURSOR for v_sql;
END PROCEDURE3;
/
