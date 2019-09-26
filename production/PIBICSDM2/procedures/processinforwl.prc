CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESSINFORWL" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PROCESSINOFOUT
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2/2/2012          1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PROCESSINOFOUT
      Sysdate:         2/2/2012
      Date and Time:   2/2/2012, 0:33:58, and 2/2/2012 0:33:58
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    
                select b.wlcd,a.nationcd,a.passportno,to_char(b.credte,'YYYYMMDD') credte,b.reasoncd from(
                select nationcd,passportno from(
                (select nationcd,B.DOCNO passportno
                from watchlist a, wlindicatecard b
                where a.wlcd=b.wlcd
                and TO_CHAR(a.credte,'YYYYMMDD') between '20140101' and '20141231'
                group by nationcd,B.DOCNO)
                INTERSECT
                (select nationcd, tdtno passportno from immigration
                where cardtype ='1')
                ) 
                ) a,(select a.wlcd,b.docno, a.nationcd,a.credte,a.reasoncd from watchlist a, wlindicatecard b
                where a.wlcd=b.wlcd) b
                where a.nationcd = b.nationcd
                and a.passportno = b.docno
                and passportno not in('0','-','.','00000','394','FRA','303','4','139','184','00000000000','473'); 
    
    /*select * from immigration where nationcd in (select countcd from country where continentcd  in ('05')) 
    and cardtype = '1'  and to_char(inoutdte, 'yyyymm') between '201307' and '201312';
    select * from immigration where cardtype = '1' and (nationcd <> 'T03' and visatypecd <> '0010') and to_char(visaexpdte, 'yyyymmdd') < to_char(sysdate, 'yyyymmdd')
    and to_char(visaexpdte, 'yyyymmdd') > '20100201'
    and to_char(inoutdte, 'YYYY') = '2010';*/
    
    rec_tm c1%rowtype;  
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_travelInvestigate'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start travel investtgate .... !!!');utl_file.fflush(file_ut); 
 open c1;
    loop fetch c1 into rec_tm; exit when c1%notfound;    
    <<itemtm_loop>> for itm in
     (
     --select * from (
        --select * from vw_tmmain a where tdtno = rec_tm.intdtno and nationcd = rec_tm.nationcd and cardtype = '2' and deptcd in (select deptcd from department where DEPTLINE = 'M') order by inoutdate desc
        select * from vw_tmmain a where tdtno = rec_tm.passportno and nationcd = rec_tm.nationcd order by inoutdate desc
     --) where rownum =1
     )
     loop
       --if itm.cardtype = '1' then
            insert into travelinvestigate (investigateseq, seq, tm6no, tdtno, efamilynm, efirstnm, emiddlenm, sex, birthdte, nationenm, cardtype, inoutdte, 
            convregno,  depttnm, visa, visaexp, inoutdatetime, nationcd, deptcd, wlcd, wlcd_docno, wlcd_nationcd, wlcd_credte,wlcd_reasoncd, creusr, credte, remark) 
            values (investigate_seq.nextval,itm.tmrunno, itm.tm6no, itm.tdtno, itm.efamilynm, itm.efirstnm, itm.emiddlenm, itm.sex, itm.birthdte, 
            itm.nationenm, itm.cardtype, itm.inoutdte,itm.convregno, itm.depttnm,itm.visatypecd, to_char(itm.visaexpdte, 'dd/mm/yyyy'), itm.inoutdate, itm.nationcd, itm.deptcd,
            rec_tm.wlcd, rec_tm.passportno, rec_tm.nationcd, to_date(rec_tm.credte, 'YYYYMMDD'),rec_tm.reasoncd, itm.creusr, itm.credte, itm.remark);
       --end if;
     end loop;
    
    totalrow:=totalrow+1;   
    commitrow:=commitrow+1;
    if commitrow = 100 then
     commitrow:=0;
    --utl_file.put_line(file_ut,sysdateTxt||' Commit Rows'||totalrow);utl_file.fflush(file_ut); 
    commit; 
   end if;   
 end loop; --cursor
 close c1;
 commit; 
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End travel investtgate.... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 Exception
  when others then
   null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END PROCESSINFORWL;
/
