CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."UPDDEPTSTATISTICPIBICS" (P_YYYYMM IN VARCHAR2, STATISTICFILED  IN VARCHAR2, P_NATION  IN VARCHAR2) IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       INSDEPTSTATISTICPIBICS
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        20/09/2012   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     INSDEPTSTATISTICPIBICS
      Sysdate:         20/09/2012
      Date and Time:   20/09/2012, 12:09:04, and 20/09/2012 12:09:04
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
SQLCOMMAND VARCHAR2(1000);
AMOUNT number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    /*หาตามตม.จังหวัด*/

   /* with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno,  get_deptnamelevel1(deptseq, 'T') deptnamelevel1, get_deptnamelevel2(deptseq, 'T') 
    deptnamelevel2, get_deptnamelevel3(deptseq, 'T') deptnamelevel3, yyyymm, amount, rlc, deptlevel  from departmentlevel a,
    (select GET_DEPTSEQNOLEVEL2(dept_seqno) dept_seqno, 
    to_char(inoutdate, 'YYYYMM') yyyymm, count(tmrunno) amount from vw_tmmain 
    --where to_char(inoutdate, 'YYYYMM') = P_YYYYMM and cardtype = '2' and visatypecd = '0008'
    where to_char(inoutdate, 'YYYYMM') = P_YYYYMM 
    and cardtype = '1' 
    and visatypecd not in ('0008', '0022')
    group by GET_DEPTSEQNOLEVEL2(dept_seqno), to_char(inoutdate, 'YYYYMM')) b
    where a.DEPTSEQ=b.dept_seqno(+) ;        
*/
    /*
        with tmmainin as (
        select * from tmmain where (to_char(indte, 'YYYYMM') = P_YYYYMM ) and nationcd <> 'T03'
        ), tmmainout as (
        select * from tmmain where (to_char(outdte, 'YYYYMM') =  P_YYYYMM) and nationcd <> 'T03')
        select deptseq dept_seqno, count('X') amount
        from tmmainin a, tmmainout b, departmentlevel c 
        where a.indept_seqno = c.deptseq
        and (a.intdtno = b.outtdtno and a.indeptcd = b.outdeptcd)
        and (to_char(a.indte, 'yyyymmdd') = to_char(b.outdte, 'yyyymmdd') and to_char(a.indte, 'yyyymmddhh24mi') > to_char(b.outdte, 'yyyymmddhh24mi'))
        and a.intm6no <> '0000000' and b.outtm6no <> '0000000'
        and a.nationcd = 'V03'
        group by deptseq;
    */
      /*with tmmainin as (
    select * from tmmain where (to_char(indte, 'YYYYMM') = P_YYYYMM ) and nationcd <> 'T03'
    ), tmmainout as (
    select * from tmmain where (to_char(outdte, 'YYYYMM') =  P_YYYYMM) and nationcd <> 'T03')
    select deptseq dept_seqno, count('X') amount
    from tmmainin a, tmmainout b, departmentlevel c 
    where a.indept_seqno = c.deptseq
    and (a.intdtno = b.outtdtno and a.indeptcd = b.outdeptcd)
    and (to_char(a.indte, 'yyyymmdd') = to_char(b.outdte, 'yyyymmdd') and to_char(a.indte, 'yyyymmddhh24mi') > to_char(b.outdte, 'yyyymmddhh24mi'))
    and a.intm6no <> '0000000' and b.outtm6no <> '000000'
    and a.nationcd = 'K02'
    group by deptseq;
   */ 
      /* --INOUT */
      
      /* -- คนไทย
        with tmmain_in as 
        (select * from tmmain where to_char(indte, 'YYYYMM') = P_YYYYMM and nationcd = 'T03'),
        tmmain_out as (select * from tmmain where to_char(outdte, 'YYYYMM') = P_YYYYMM and nationcd = 'T03')
        select a.outdept_seqno dept_seqno, count('X') amount from tmmain_out a, tmmain_in b 
        where (a.outtdtno = b.intdtno and a.outtm6no = b.intm6no)
        and (to_char(a.outdte, 'yyyymmdd') = to_char(b.indte, 'yyyymmdd') and to_char(a.outdte, 'yyyymmddhh24mi') < to_char(b.indte, 'yyyymmddhh24mi'))
        and (a.outtm6no <> '0000000' and b.intm6no <> '000000')
        group by a.outdept_seqno;
     */
     
        /* คนต่างชาติ    
        with tmmain_in as 
        (select * from tmmain where to_char(indte, 'YYYYMM') = P_YYYYMM and nationcd = 'T03'),
        tmmain_out as (select * from tmmain where to_char(outdte, 'YYYYMM') = P_YYYYMM and nationcd = 'T03')
        select a.indept_seqno dept_seqno, count('X') amount from tmmain_in a, tmmain_out b 
        where (a.intdtno = b.outtdtno and a.intm6no = b.outtm6no)
        and (to_char(a.indte, 'yyyymmdd') = to_char(b.outdte, 'yyyymmdd') and to_char(a.indte, 'yyyymmddhh24mi') > to_char(b.outdte, 'yyyymmddhh24mi'))
        and (a.intm6no <> '0000000' and b.outtm6no <> '000000')
        group by a.indept_seqno;
       */
       

   with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno,  get_deptnamelevel1(deptseq, 'T') deptnamelevel1, get_deptnamelevel2(deptseq, 'T') deptnamelevel2, get_deptnamelevel3(deptseq, 'T') deptnamelevel3, yyyymm, amount, rlc, deptlevel  from departmentlevel a,
    (
    select deptcd, dept_seqno,
    to_char(inoutdate, 'YYYYMM') yyyymm, count(tmrunno) amount from vw_tmmain 
    where to_char(inoutdate, 'YYYYMM') = P_YYYYMM
    and cardtype = '2'
    --and tdtcd like '6%'
    --and imginout is null
    --and deptcd in (select deptcd from department where rel_code in (select dept_seqno from department where (dept_seqno = 4 or rel_code = 4)) and checkpoint = 'Y' and actflag = 'Y')
    --and deptcd = '00S10'
    --and nationcd <> 'T03'
    --and visatypecd = '0007'
    and nationcd like P_NATION||'%'  
   -- and creusr <> 'PIS001'
    --and typedatacd in ('NON-LA','NIDEN')
    and nationcd is not null
    group by deptcd, dept_seqno, to_char(inoutdate, 'YYYYMM')) b
    where a.deptcd=b.deptcd(+);

    --and deptcd in (select deptcd from department where rel_code in(56, 292))    
    --and deptcd in (select deptcd from department where convcd in ('0002','0004','0005') and checkpoint = 'Y')
    /*select deptcd, dept_seqno, 
    to_char(inoutdate, 'YYYYMM') yyyymm, count(tmrunno) amount from vw_tmmain 
    where to_char(inoutdate, 'YYYYMM') = P_YYYYMM and cardtype = '2' and deptcd = '00119'
    and nationcd = 'V03'
    --and nationcd in  ('L01','B16','C01')
    --and typedata in ('NON-LA','NIDEN')
    --and visatypecd = '0008'
    --where to_char(inoutdate, 'YYYYMM') = P_YYYYMM and (creusr <> 'PIS001' and creusr <> 'AtChannel')
    --where to_char(inoutdate, 'YYYYMM') = P_YYYYMM and (creusr = 'PIS001')
    --where to_char(inoutdate, 'YYYYMM') = P_YYYYMM and (creusr = 'AtChannel')
    group by deptcd, dept_seqno, to_char(inoutdate, 'YYYYMM')
    ) b
    where a.deptcd=b.deptcd(+) ; */
/*
    select dept_seqno, count('X') AMOUNT from (
    select distinct(creusr), decode(deptlevel, '2', b.dept_seqno, b.rel_code) dept_seqno
    from vw_tmmain a, department b 
    where a.deptcd = b.deptcd and to_char(inoutdate, 'YYYYMM') = P_YYYYMM
    ) group by dept_seqno; */

    /*EXT
   with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno,  get_deptnamelevel1(deptseq, 'T') deptnamelevel1, get_deptnamelevel2(deptseq, 'T') deptnamelevel2, 
    get_deptnamelevel3(deptseq, 'T') deptnamelevel3, YYYYMM, amount, rlc, deptlevel  from departmentlevel a,
    (
    select udept_seqno, to_char(EXT_DATE, 'yyyymm') YYYYMM, count('X') amount from ext_extensionlist 
    --where to_char(EXT_DATE, 'yyyymm') between P_YYYYMM and '201404'
    where to_char(EXT_DATE, 'yyyymm') = P_YYYYMM  
    and create_by not in ('ICPEXT','SYSTEM','BOISYSTEM','BOISYSTEM2','EXTSYSTEM') 
    AND actflag <> 'C'
    --and nation_seqno = 218
    --and nation_seqno in (27, 114, 36)
    --and ipaddress not in ('172.16.2.120','172.16.2.231','172.16.2.38','172.16.2.69','172.16.2.93')
    --and udept_seqno in (56, 292)
    --and udept_seqno in (select dept_seqno from department where rel_code in (select dept_seqno from department where (dept_seqno = 4 or rel_code = 4)) and deptlevel=2 and actflag = 'Y')
    group by udept_seqno, to_char(EXT_DATE , 'yyyymm')
    ) b
    where a.deptseq=b.udept_seqno(+) ;*/
      /*
    select dept_seqno, count('X') amount from (    
    select distinct(a.create_by) create_by, decode(deptlevel, '2', a.udept_seqno, b.rel_code) dept_seqno
    from ext_extensionlist a, department b 
    where a.udept_seqno = b.dept_seqno and to_char(a.create_date, 'yyyymm') = P_YYYYMM    
    ) group by dept_seqno;*/
    
    
    /*FN24
    with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno,  get_deptnamelevel1(deptseq, 'T') deptnamelevel1, get_deptnamelevel2(deptseq, 'T') deptnamelevel2, get_deptnamelevel3(deptseq, 'T') deptnamelevel3, 
    YYYYMM, amount, rlc, deptlevel  from departmentlevel a,
    (
    select c.dept_seqno, to_char(a.CHECKINDTE , 'YYYYMM') YYYYMM, count('X') amount  
    from fn_alienlist a, fn_addressnotify b, fn_hotel c where a.addrn_seqno=b.addrn_seqno(+) and b.hotel_seqno=c.hotel_seqno(+)
    and to_char(a.CHECKINDTE, 'YYYYMM') = P_YYYYMM
    --and a.COUNT_SEQNO in  (27, 114, 36)
    --and c.dept_seqno in (select dept_seqno from department where rel_code in (select dept_seqno from department where (dept_seqno = 4 or rel_code = 4)) and deptlevel=2 and actflag = 'Y')
    group by c.dept_seqno, to_char(a.CHECKINDTE, 'YYYYMM')
    ) b
    where a.deptseq=b.dept_seqno(+);*/
    
    
    /*FN24 ALL*/
  /* with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno,  get_deptnamelevel1(deptseq, 'T') deptnamelevel1, get_deptnamelevel2(deptseq, 'T') deptnamelevel2, get_deptnamelevel3(deptseq, 'T') deptnamelevel3, 
    amount, rlc, deptlevel  from departmentlevel a,
    (
    select c.dept_seqno, count('X') amount  
    from fn_alienlist a, fn_addressnotify b, fn_hotel c where a.addrn_seqno=b.addrn_seqno(+) and b.hotel_seqno=c.hotel_seqno(+)
    --and to_char(a.CHECKINDTE, 'YYYYMM') between '201108' and '201302'
    and to_char(a.CREATE_DATE, 'YYYYMM') = P_YYYYMM
    and substr(a.CREATE_BY, 3, 1)  in ('H','B','A','G')
    group by c.dept_seqno
    ) b
    where a.deptseq=b.dept_seqno(+);    */

    /*FN24 ALL DEPTLEVEL 2
    
    with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno,  get_deptnamelevel1(deptseq, 'T') deptnamelevel1, get_deptnamelevel2(deptseq, 'T') deptnamelevel2, get_deptnamelevel3(deptseq, 'T') deptnamelevel3, 
    amount, rlc, deptlevel  from departmentlevel a,
    (
    select GET_DEPTSEQNOLEVEL2(c.dept_seqno) dept_seqno, count('X') amount  
    from fn_alienlist a, fn_addressnotify b, fn_hotel c where a.addrn_seqno=b.addrn_seqno(+) and b.hotel_seqno=c.hotel_seqno(+) 
    --and to_char(a.CHECKINDTE, 'YYYYMM') between '201302' and '201302'
    and to_char(a.CREATE_DATE, 'YYYYMM') = P_YYYYMM
    group by GET_DEPTSEQNOLEVEL2(c.dept_seqno) 
    ) b
    where a.deptseq=b.dept_seqno(+); */
    /*FN90*/

  /*with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno,  get_deptnamelevel1(deptseq, 'T') deptnamelevel1, get_deptnamelevel2(deptseq, 'T') deptnamelevel2, get_deptnamelevel3(deptseq, 'T') deptnamelevel3, 
    YYYYMM, amount, rlc, deptlevel  from departmentlevel a,
    (
    select dept_seqno, 
    --to_char(DOCDATE, 'YYYYMM') YYYYMM, count('X') amount from fn_address90
    --where  to_char(DOCDATE, 'YYYYMM') = P_YYYYMM
    --to_char(DOCDATE, 'YYYYMM') YYYYMM, count('X') amount from fn_address90
    to_char(DOCDATE, 'YYYYMM') YYYYMM, count('X') amount from fn_person
    where  to_char(DOCDATE, 'YYYYMM') = P_YYYYMM
    and create_by not in  ('SYSTEM90NDAYS','SYSTEM1','ICONCEPT','SYSTEM90DAYS','ICONCEPT16JAN','BOISYSTEM','SYSTEM90')
    --group by dept_seqno, to_char(DOCDATE, 'YYYYMM')
    --and dept_seqno in (select dept_seqno from department where rel_code in (select dept_seqno from department where (dept_seqno = 4 or rel_code = 4)) and deptlevel=2 and actflag = 'Y')
     group by dept_seqno, to_char(DOCDATE, 'YYYYMM')
    ) b
    where a.deptseq=b.dept_seqno(+);*/
    /*
    with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno,  get_deptnamelevel1(deptseq, 'T') deptnamelevel1, get_deptnamelevel2(deptseq, 'T') deptnamelevel2, get_deptnamelevel3(deptseq, 'T') deptnamelevel3, 
    YYYYMM, amount, rlc, deptlevel  from departmentlevel a,
    (
    select dept_seqno, 
    to_char(DOCDATE, 'YYYYMM') YYYYMM, count('X') amount from fn_address90
    where  to_char(DOCDATE, 'YYYYMM') = P_YYYYMM
    and create_by not in  ('SYSTEM90NDAYS','SYSTEM1','ICONCEPT','SYSTEM90DAYS','ICONCEPT16JAN','BOISYSTEM','SYSTEM90')
    group by dept_seqno, to_char(DOCDATE, 'YYYYMM')
    ) b
    where a.deptseq=b.dept_seqno(+);*/
/*

    select dept_seqno, count('X') amount from (    
    select distinct(a.create_by) create_by, decode(deptlevel, '2', a.dept_seqno, b.rel_code) dept_seqno 
    from fn_address90 a, department b 
    where  to_char(a.CREATE_DATE, 'YYYYMM') = P_YYYYMM
    and a.dept_seqno = b.dept_seqno and a.create_by not in ('SYSTEM90NDAYS','SYSTEM1','ICONCEPT','SYSTEM90DAYS','ICONCEPT16JAN','BOISYSTEM','SYSTEM90')
    ) group by dept_seqno;*/
    /*SEARCH WL
    with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno,  get_deptnamelevel1(deptseq, 'T') deptnamelevel1, get_deptnamelevel2(deptseq, 'T') deptnamelevel2, get_deptnamelevel3(deptseq, 'T') deptnamelevel3, 
    YYYYMM, amount, rlc, deptlevel  from departmentlevel a,
    (
    select GET_DEPTFROMUSERID(userid) dept_seqno, to_char(SEARCH_DATE, 'YYYYMM') YYYYMM, COUNT('X') amount 
    from searchlog where program_id  like 'WLSEARCH%' and to_char(SEARCH_DATE, 'YYYYMM')  = P_YYYYMM
    group by GET_DEPTFROMUSERID(userid), to_char(SEARCH_DATE, 'YYYYMM') 
    ) b
    where a.deptseq=b.dept_seqno(+);  */
    /*REPS
    with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno,  get_deptnamelevel1(deptseq, 'T') deptnamelevel1, get_deptnamelevel2(deptseq, 'T') deptnamelevel2, get_deptnamelevel3(deptseq, 'T') deptnamelevel3, 
    amount, rlc, deptlevel  from departmentlevel a,
    (
    select dept_seqno, to_char(CREATE_DATE, 'yyyymm') YYYYMM, count('X') amount from reps_tm8 
    where to_char(CREATE_DATE, 'yyyymm') = P_YYYYMM 
    AND APPVSTS <> 'C'
    group by dept_seqno, to_char(CREATE_DATE , 'yyyymm')
    ) b
    where a.deptseq=b.dept_seqno(+);   */
    /* SEARCH INOUT THP WL*/
    /* with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno,  get_deptnamelevel1(deptseq, 'T') deptnamelevel1, get_deptnamelevel2(deptseq, 'T') deptnamelevel2, get_deptnamelevel3(deptseq, 'T') deptnamelevel3, 
    amount, rlc, deptlevel  from departmentlevel a,
    (
    select GET_DEPTFROMUSERID(userid) dept_seqno, to_char(SEARCH_DATE, 'YYYYMM') ปีเดือน, COUNT('X') amount 
    --from searchlog where (program_id  like 'THPQRY909%' or program_id  like 'THAIPASSPORT%') and to_char(SEARCH_DATE, 'YYYYMM')  = P_YYYYMM
    from searchlog where (program_id  like 'ENQINOUT%' or program_id  like 'ENQTRAVEL%') and to_char(SEARCH_DATE, 'YYYYMM')  = P_YYYYMM
    --from searchlog where program_id  like 'WLSEARCH%' and to_char(SEARCH_DATE, 'YYYYMM')  = P_YYYYMM
    group by GET_DEPTFROMUSERID(userid), to_char(SEARCH_DATE, 'YYYYMM') 
    ) b
    where a.deptseq=b.dept_seqno(+);     */

    /*
    with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno,  get_deptnamelevel1(deptseq, 'T') deptnamelevel1, get_deptnamelevel2(deptseq, 'T') deptnamelevel2, get_deptnamelevel3(deptseq, 'T') deptnamelevel3, 
    amount, rlc, deptlevel  from departmentlevel a,
    (
    select GET_DEPTFROMUSERID(userid) dept_seqno, to_char(SEARCH_DATE, 'YYYYMM') ปีเดือน, COUNT('X') amount 
    from searchlog where userid in (select user_id from fw_groupuser where group_id in (48, 64)) and to_char(SEARCH_DATE, 'YYYYMM')  = P_YYYYMM
    group by GET_DEPTFROMUSERID(userid), to_char(SEARCH_DATE, 'YYYYMM') 
    ) b
    where a.deptseq=b.dept_seqno(+); 
   */
    /*CRW
    with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno,  get_deptnamelevel1(deptseq, 'T') กองบังคับการ, get_deptnamelevel2(deptseq, 'T') ตมจังหวัด, get_deptnamelevel3(deptseq, 'T') จุดตรวจ, yyyymm, AMOUNT  from departmentlevel a,
    (
    select DEPTCD, DEPTCD dept_seqno, to_char(inoutdte, 'YYYYMM') yyyymm, count('Z') amount 
    from crew
    where to_char(inoutdte, 'YYYYMM') = P_YYYYMM 
    and cardtype = '2'
    group by DEPTCD, to_char(inoutdte, 'YYYYMM')
    ) b
    where a.deptseq=b.DEPTCD(+);
    */
    /*CHNGVISA
    with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno,  get_deptnamelevel1(deptseq, 'T') กองบังคับการ, get_deptnamelevel2(deptseq, 'T') ตมจังหวัด, get_deptnamelevel3(deptseq, 'T') จุดตรวจ, YYYYMM, AMOUNT  from departmentlevel a,
    (
    select udept_seqno, 
    to_char(CREATE_DATE, 'YYYYMM') YYYYMM, count('Z') AMOUNT 
    from CHNG_CHANGEVISALIST
    where to_char(CREATE_DATE, 'YYYYMM') = P_YYYYMM 
    group by udept_seqno, to_char(CREATE_DATE, 'YYYYMM') 
    ) b
    where a.deptseq=b.udept_seqno(+);
    */
    /*DRS
    with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno,  get_deptnamelevel1(deptseq, 'T') กองบังคับการ, get_deptnamelevel2(deptseq, 'T') ตมจังหวัด, get_deptnamelevel3(deptseq, 'T') จุดตรวจ, YYYYMM, AMOUNT  from departmentlevel a,
    (
    select IDCDEPT_SEQNO, 
    to_char(create_date, 'YYYYMM') YYYYMM, count('Z') AMOUNT 
    from DRS_DETENRECORD
    where to_char(create_date, 'YYYYMM') = P_YYYYMM
    group by IDCDEPT_SEQNO, to_char(create_date, 'YYYYMM') 
    ) b
    where a.deptseq=b.IDCDEPT_SEQNO(+) ;
    */
    
    /*FS_FEES
    with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno, deptseq,  get_deptnamelevel1(deptseq, 'T') กองบังคับการ, get_deptnamelevel2(deptseq, 'T') ตมจังหวัด, get_deptnamelevel3(deptseq, 'T') จุดตรวจ, YYYYMM, AMOUNT  from departmentlevel a,
    (
    select dept_seqno, 
    to_char(create_date, 'yyyymm') YYYYMM, count('X') AMOUNT from fs_fees
    where to_char(create_date, 'yyyymm') = P_YYYYMM
    group by dept_seqno, to_char(create_date, 'yyyymm')
    ) b
    where a.deptseq=b.dept_seqno(+) ;*/
    /*FS_FINES
    with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno, deptseq,  get_deptnamelevel1(deptseq, 'T') กองบังคับการ, get_deptnamelevel2(deptseq, 'T') ตมจังหวัด, get_deptnamelevel3(deptseq, 'T') จุดตรวจ, YYYYMM, AMOUNT  from departmentlevel a,
    (
    select dept_seqno, 
    to_char(create_date, 'yyyymm') YYYYMM, count('X') AMOUNT from fs_fines
    where to_char(create_date, 'yyyymm') = P_YYYYMM
    group by dept_seqno, to_char(create_date, 'yyyymm')
    ) b
    where a.deptseq=b.dept_seqno(+) ;*/
    /*VOA */
    /*with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno, deptseq, get_deptnamelevel1(deptseq, 'T') กองบังคับการ, get_deptnamelevel2(deptseq, 'T') ตมจังหวัด, get_deptnamelevel3(deptseq, 'T') จุดตรวจ, YYYYMM, AMOUNT  from departmentlevel a,
    (
    select dept_seqno, to_char(a.create_date, 'yyyymm') YYYYMM, count('X') AMOUNT 
    from voa_voa15 a, voa_voa15list b 
    where a.voa_seqno=b.voa_seqno
    --and to_char(a.create_date, 'yyyymm') = P_YYYYMM
    and to_char(a.voa15_date, 'yyyymmdd') between '20150615' and '20150621'
    and nation_seqno = 45
    group by dept_seqno, to_char(a.create_date, 'yyyymm')
    ) b
    where a.deptseq=b.dept_seqno(+); 
   */
    
    /*INT
    with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno, deptseq, get_deptnamelevel1(deptseq, 'T') กองบังคับการ, get_deptnamelevel2(deptseq, 'T') ตมจังหวัด, get_deptnamelevel3(deptseq, 'T') จุดตรวจ, YYYYMM, AMOUNT  from departmentlevel a,
    (
    select get_DeptFromUseridNOTTYPE9(userid) dept_seqno, to_char(SEARCH_DATE, 'YYYYMM') YYYYMM, COUNT('X') AMOUNT 
    from searchlog where userid in (select user_id from fw_groupuser where group_id in (97, 49) and user_id not in (select user_id from fw_groupuser where group_id in (48, 64))) 
    and to_char(SEARCH_DATE, 'YYYYMM')  =  :P_YYYYMM
    group by get_DeptFromUseridNOTTYPE9(userid), to_char(SEARCH_DATE, 'YYYYMM') 
    ) b
    where a.deptseq=b.dept_seqno(+) ;
    */
    /*INV
    with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno, deptseq, get_deptnamelevel1(deptseq, 'T') กองบังคับการ, get_deptnamelevel2(deptseq, 'T') ตมจังหวัด, get_deptnamelevel3(deptseq, 'T') จุดตรวจ, YYYYMM, AMOUNT  from departmentlevel a,
    (
    select GET_DEPTFROMUSERID(userid) dept_seqno, to_char(SEARCH_DATE, 'YYYYMM') YYYYMM, COUNT('X') AMOUNT 
    from searchlog where userid in (select user_id from fw_groupuser where group_id in (48, 64)) and to_char(SEARCH_DATE, 'YYYYMM')  = P_YYYYMM
    group by GET_DEPTFROMUSERID(userid), to_char(SEARCH_DATE, 'YYYYMM') 
    ) b
    where a.deptseq=b.dept_seqno(+);
    */
    recs c1%rowtype;
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('PISCES_DIR','log_insertDepartmentLevel'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start update department level statictispibics .... !!!');utl_file.fflush(file_ut);
 open c1;
 loop fetch c1 into recs; exit when c1%notfound;
        SQLCOMMAND:= NULL;
        AMOUNT :=0;
        if recs.amount is not null then
            AMOUNT :=recs.amount;
        end if;
        SQLCOMMAND:='UPDATE STATISTICPIBICS SET '||STATISTICFILED||' = '||AMOUNT||' WHERE DEPT_SEQNO = '||recs.dept_seqno;
        --SQLCOMMAND:='UPDATE STATISTICPIBICS_INOUTFN SET '||STATISTICFILED||' = '||AMOUNT||' WHERE DEPT_SEQNO = '||recs.dept_seqno;
        --DBMS_OUTPUT.PUT_LINE(SQLCOMMAND);
        EXECUTE IMMEDIATE(SQLCOMMAND);
   totalrow:=totalrow+1;
   commitrow:=commitrow+1;
   if commitrow = 1000 then
    commitrow:=0;
    --utl_file.put_line(file_ut,sysdateTxt||' Commit Rows'||totalrow);utl_file.fflush(file_ut);
    commit;
   end if;
 end loop; --cursor
 close c1;
 commit;
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End update department level statictispibics .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 /*Exception
  when others then
     utl_file.put_line(file_ut,'Error by tmrunno :'||rec_tm.tmrunno);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');*/
end;

END UPDDEPTSTATISTICPIBICS;
/
  GRANT EXECUTE ON "PIBICSDM2"."UPDDEPTSTATISTICPIBICS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."UPDDEPTSTATISTICPIBICS" TO "BIOSAADM";
