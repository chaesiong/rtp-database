CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESSINOFOUT" IS
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
incount number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    /*
    select wlcd, nationcd2,passportno2, credte from(
    select a.wlcd, a.nationcd nationcd1,a.passportno passportno1,a.credte,b.nationcd nationcd2,b.passportno passportno2,b.inoutdate from
    (
    select wlcd, nationcd,passportno, credte from(
    select a.wlcd, nationcd,b.docno passportno, to_char(a.credte,'YYYYMMDD') credte
    from watchlist a, wlindicatecard b
    where a.wlcd=b.wlcd
    and TO_CHAR(a.credte,'YYYYMMDD') between '20140101' and '20141228'
    and flagcheckpoint is null
    order by to_char(a.credte,'YYYYMMDD') desc
    )
    group by wlcd, nationcd,passportno,credte) a,
    (select nationcd, tdtno passportno ,to_char(inoutdate,'yyyymmdd') inoutdate   
    from vw_tmonline
    where cardtype ='1')b
    where a.nationcd = b.nationcd
    and a.passportno = b.passportno
    and credte <=inoutdate
    )
    where passportno2 not in('0','-','.','00000','394','FRA','303','4','139','00000000000','473')
    --and wlcd not in ('S096141', 'S101831','S098931','S097918')
    group by  wlcd, nationcd2,passportno2, credte
    order by passportno2; 
    
    /*select * from immigration where nationcd in (select countcd from country where continentcd  in ('05')) 
    and cardtype = '1'  and to_char(inoutdte, 'yyyymm') between '201307' and '201312';
    select * from immigration where cardtype = '1' and (nationcd <> 'T03' and visatypecd <> '0010') and to_char(visaexpdte, 'yyyymmdd') < to_char(sysdate, 'yyyymmdd')
    and to_char(visaexpdte, 'yyyymmdd') > '20100201'
    and to_char(inoutdte, 'YYYY') = '2010';*/
    
    /*select passportno tdtno, nationcd, birthdte, to_char(inoutdte, 'YYYYMMDD') inoutdtevisa from  
    visarunlog     where to_char(credte, 'YYYYMMDD') between '20150101' and '20150123'
    and action  = 'S' and passportno is not null
    group by passportno, nationcd, birthdte,  to_char(inoutdte, 'YYYYMMDD');*/    
    
    --select * from testpasstemp where nationcd = 'K02';
        
    select efamilynm, efirstnm, emiddlenm, birthdte, passportno tdtno, creusr, inoutdte, sex, action,  
    get_visatypesbyseq(visatype_seqno, 'T') visatypetnm, get_nationnm(count_seqno, 'T') nationtnm, nationcd, visatype_seqno, count_seqno
    from visarunlog where visatype_seqno in (16, 41, 34)
    and action in ('T','S') 
    --and passportno in ('TH8689338','505592219','TZ0415497')
    and to_char(credte,'YYYYMMDD') between '20150101' and '20150624';       
    
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
    
    incount :=0;
    
    begin
        select count('X') into incount from vw_tmmain a where tdtno = rec_tm.tdtno and nationcd = rec_tm.nationcd and cardtype = '1';
     exception when no_data_found then
        incount := 0;
    end;    
    
    <<itemtm_loop>> for itm in
     (
     select * from (
        --select * from vw_tmmain a where tdtno = rec_tm.intdtno and nationcd = rec_tm.nationcd and cardtype = '2' and deptcd in (select deptcd from department where DEPTLINE = 'M') order by inoutdate desc
        select * from vw_tmmain a where tdtno = rec_tm.tdtno and nationcd = rec_tm.nationcd and cardtype = '1' order by inoutdate asc
     ) where rownum =1
     )
     loop
       /*--if itm.cardtype = '1' then
            insert into travelinvestigate (investigateseq, seq, tm6no, tdtno, efamilynm, efirstnm, emiddlenm, sex, birthdte, nationenm, cardtype, inoutdte, 
            convregno,  depttnm, visa, visaexp, inoutdatetime, nationcd, deptcd, wlcd, wlcd_docno, wlcd_nationcd, wlcd_credte, creusr, credte, remark, amount) 
            values (investigate_seq.nextval,itm.tmrunno, itm.tm6no, itm.tdtno, itm.efamilynm, itm.efirstnm, itm.emiddlenm, itm.sex, itm.birthdte, 
            itm.nationenm, itm.cardtype, itm.inoutdte,itm.convregno, itm.depttnm,itm.visatypecd, to_char(itm.visaexpdte, 'dd/mm/yyyy'), itm.inoutdate, itm.nationcd, itm.deptcd,
            --rec_tm.wlcd, rec_tm.passportno2, rec_tm.nationcd2, to_date(rec_tm.credte, 'YYYYMMDD'), itm.creusr, itm.credte, itm.remark);
            null, rec_tm.tdtno, rec_tm.nationcd, null, itm.creusr, itm.credte, itm.remark, rec_tm.amount);
       --end if;
      */
      
       --insert into travelinvestigate (investigateseq) values (investigate_seq.nextval);
       
        insert into travelinvestigate (investigateseq, efamilynm, sex, birthdte, tdtno, visatype_seqno, inoutdatetime, lastinoutdte, amount, chkuser, action, nation_seqno)
        values (investigate_seq.nextval, 
        decode(rec_tm.efamilynm, null, null,  rec_tm.efamilynm ||' - ') || rec_tm.efirstnm  || decode(rec_tm.emiddlenm, null, null, ' - '|| rec_tm.emiddlenm), 
        rec_tm.sex, rec_tm.birthdte, rec_tm.tdtno, rec_tm.visatype_seqno, rec_tm.inoutdte, itm.inoutdate, incount, rec_tm.creusr, rec_tm.action, rec_tm.count_seqno);
      
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
 --Exception
 -- when others then
  -- null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END PROCESSINOFOUT;
/
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSINOFOUT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSINOFOUT" TO "BIOSAADM";
