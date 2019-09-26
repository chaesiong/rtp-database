CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MATCH_ITIMS" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       MATCH_ITIMS
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        02/10/2008          1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     MATCH_ITIMS
      Sysdate:         02/10/2008
      Date and Time:   02/10/2008, 17:24:16, and 02/10/2008 17:24:16
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
    --chk_Commit number(8);
    chk_Break varchar2(1);
    sysdateTxt varchar2(25);
    sysdateFile varchar2(8);
    case_Tmmain varchar2(12); 
    v_found varchar2(8);
    file_ut UTL_FILE.FILE_TYPE;
    cursor c1  is 
    select tmmain_tmp.*, trim(efirstnm)||trim(emiddlenm)||trim(efamilynm) as ename, trim(intdtno) as chkintdtno, 
    trim(intm6no) as chkintm6no, trim(outtdtno) as chkouttdtno, trim(outtm6no) as chkouttm6no, invisatypecd||outvisatypecd as chkvisa,
    to_number(to_char(indte, 'YYYYMMDDHH24MISS')||to_char(outdte, 'YYYYMMDDHH24MISS')) as inoutdte 
    from tmmain_tmp where flagmatch is null --where rownum <=10
    order by inoutdte;
    rec_tmmain c1%rowtype;  
begin
  --chk_Commit := 0;
  select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
  select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
  --dbms_output.put_line(sysdateTxt||' Start Process Match Tmmain .... !!!');
  file_ut := UTL_FILE.FOPEN('UTL_DIR','logMatch'||sysdateFile||'.txt','W');
  utl_file.put_line(file_ut,sysdateTxt||' Start Process Match Tmmain .... !!!');
  open c1;
     loop 
     fetch c1 into rec_tmmain; 
    exit when c1%notfound;
    v_found := 'NOTFOUND';
    --chk_Commit := chk_Commit+1;
   -- Check case data  Inter or NotInter 
   IF ((rec_tmmain.nationcd = 'T03' and (rec_tmmain.indte is null and rec_tmmain.outdte is not null))  or (rec_tmmain.nationcd <> 'T03' and rec_tmmain.chkvisa='0009' and (rec_tmmain.indte is null and rec_tmmain.outdte is not null))) THEN
      --dbms_output.put_line('Case OUT_NOTINTER ::: '||rec_tmmain.tmrunno);
      case_Tmmain:='OUT_NOTINTER';
   ELSIF (rec_tmmain.nationcd <> 'T03' and rec_tmmain.tfamilynm is null and (rec_tmmain.outdte is null and rec_tmmain.indte is not null)) THEN
      --dbms_output.put_line('Case IN_INTER ::: '||rec_tmmain.tmrunno);
      case_Tmmain:='IN_INTER';
   ELSIF ((rec_tmmain.nationcd = 'T03' and (rec_tmmain.indte is not null and rec_tmmain.outdte is null))  or (rec_tmmain.nationcd <> 'T03' and rec_tmmain.chkvisa='0009' and (rec_tmmain.indte is not null and rec_tmmain.outdte is null))) THEN
      --dbms_output.put_line('Case IN_NOTINTER ::: '||rec_tmmain.tmrunno);
      case_Tmmain:='IN_NOTINTER';
   ELSIF (rec_tmmain.nationcd <> 'T03' and rec_tmmain.tfamilynm is null and (rec_tmmain.outdte is not null and rec_tmmain.indte is null)) THEN
      --dbms_output.put_line('Case OUT_INTER ::: '||rec_tmmain.tmrunno);
      case_Tmmain:='OUT_INTER';
   ELSE
      --dbms_output.put_line('Case NOTCASE ::: '||rec_tmmain.tmrunno);
      case_Tmmain:='NOTCASE';
   END IF;
   -- Start Process Match Tmmain
   --##### START Case INTER Process #####
   IF(case_Tmmain='IN_INTER') THEN   
     <<itemInter1_loop>> FOR itemInter1 IN
     (
       select * from tmmain
       where (outtm6no=rec_tmmain.chkintm6no) and  (efirstnm||emiddlenm||efamilynm=rec_tmmain.ename)
       and (indte is null and outdte is not null) order by outdte desc
     )
     LOOP
      IF itemInter1.outdte >= rec_tmmain.indte THEN
      --dbms_output.put_line('OK Case INTER 1 '||rec_tmmain.tmrunno||' inseqno = '||rec_tmmain.inseqno||' Upd tmrunno ='||itemInter1.tmrunno);
      utl_file.put_line(file_ut,sysdateTxt||'--> OK Case INTER 1 '||rec_tmmain.tmrunno||' inseqno = '||rec_tmmain.inseqno||' Upd tmrunno ='||itemInter1.tmrunno);
      --UPDATE TMMAIN Where tmrunno with IN  = rec_tmmain.tmrunno      
      UPDATE tmmain set inseqno=rec_tmmain.inseqno, indte=rec_tmmain.indte,
      indeptcd=rec_tmmain.indeptcd, intravcd =rec_tmmain.intravcd, inconvcd =rec_tmmain.inconvcd,
      inconvregno =rec_tmmain.inconvregno, intdtcd =rec_tmmain.intdtcd, intdtno =rec_tmmain.intdtno,
      intm6no=rec_tmmain.intm6no,invisatypecd =rec_tmmain.invisatypecd, inpermitcd =rec_tmmain.inpermitcd,
      inpermitdte=rec_tmmain.inpermitdte,inpassportdte=rec_tmmain.inpassportdte,inpassportisu=rec_tmmain.inpassportisu,
      inpassportexpdte=rec_tmmain.inpassportexpdte,inchkpointno=rec_tmmain.inchkpointno,
      increusr=rec_tmmain.increusr,incredte=rec_tmmain.incredte,incredterm=rec_tmmain.incredterm,
      inupdusr=rec_tmmain.inupdusr,inupddte=rec_tmmain.inupddte,inupdterm=rec_tmmain.inupdterm,
      inprocessusr=rec_tmmain.inprocessusr,inprocessdte=rec_tmmain.inprocessdte,inprocessterm=rec_tmmain.inprocessterm,
      matchprocessusr='ADMIN1',matchprocessdte=sysdate,matchprocessterm='192.168.100.2',
      invisaexpdte=rec_tmmain.invisaexpdte,inintype=rec_tmmain.inintype,intargetno=rec_tmmain.intargetno,
      inremark=rec_tmmain.inremark,inrescertno=rec_tmmain.inrescertno,inimg=rec_tmmain.inimg,extid=rec_tmmain.extid
      where tmrunno=itemInter1.tmrunno;
      --DELETE TMMAIN Where tmrunno with OUT  = itemInter1.tmrunno
      --DELETE tmmain where tmrunno=itemInter1.tmrunno;
      chk_Break := 'Y';
      v_found := 'FOUND';
      END IF;
      Exit itemInter1_loop When chk_Break='Y'; -- Break For Loop itemInter1
     END LOOP;--Loop For itemInter1
     IF chk_Break <> 'Y' THEN
      <<itemInter2_loop>> FOR itemInter2 IN
      (
       select * from tmmain
       where (outtdtno=rec_tmmain.chkintdtno) and (outtm6no=rec_tmmain.chkintm6no)
       and (indte is null and outdte is not null) order by outdte desc
      )
      LOOP
         IF itemInter2.outdte >= rec_tmmain.indte THEN
       --dbms_output.put_line('OK Case INTER 2 '||rec_tmmain.tmrunno||' inseqno = '||rec_tmmain.inseqno||' Upd tmrunno ='||itemInter2.tmrunno);
    utl_file.put_line(file_ut,sysdateTxt||'--> OK Case INTER 2 '||rec_tmmain.tmrunno||' inseqno = '||rec_tmmain.inseqno||' Upd tmrunno ='||itemInter2.tmrunno);
       --UPDATE TMMAIN Where tmrunno with IN  = rec_tmmain.tmrunno
         UPDATE tmmain set inseqno=rec_tmmain.inseqno, indte=rec_tmmain.indte,
         indeptcd=rec_tmmain.indeptcd, intravcd =rec_tmmain.intravcd, inconvcd =rec_tmmain.inconvcd,
         inconvregno =rec_tmmain.inconvregno, intdtcd =rec_tmmain.intdtcd, intdtno =rec_tmmain.intdtno,
         intm6no=rec_tmmain.intm6no,invisatypecd =rec_tmmain.invisatypecd, inpermitcd =rec_tmmain.inpermitcd,
         inpermitdte=rec_tmmain.inpermitdte,inpassportdte=rec_tmmain.inpassportdte,inpassportisu=rec_tmmain.inpassportisu,
         inpassportexpdte=rec_tmmain.inpassportexpdte,inchkpointno=rec_tmmain.inchkpointno,
         increusr=rec_tmmain.increusr,incredte=rec_tmmain.incredte,incredterm=rec_tmmain.incredterm,
         inupdusr=rec_tmmain.inupdusr,inupddte=rec_tmmain.inupddte,inupdterm=rec_tmmain.inupdterm,
         inprocessusr=rec_tmmain.inprocessusr,inprocessdte=rec_tmmain.inprocessdte,inprocessterm=rec_tmmain.inprocessterm,
         matchprocessusr='ADMIN1',matchprocessdte=sysdate,matchprocessterm='192.168.100.2',
         invisaexpdte=rec_tmmain.invisaexpdte,inintype=rec_tmmain.inintype,intargetno=rec_tmmain.intargetno,
         inremark=rec_tmmain.inremark,inrescertno=rec_tmmain.inrescertno,inimg=rec_tmmain.inimg,extid=rec_tmmain.extid 
         where  tmrunno=itemInter2.tmrunno;
       --DELETE TMMAIN Where tmrunno with OUT  = itemInter2.tmrunno
       --DELETE tmmain where tmrunno=itemInter2.tmrunno;
       chk_Break := 'Y';
       v_found := 'FOUND';
       End IF;
       Exit itemInter2_loop When chk_Break='Y'; -- Break For Loop itemInter2
      END LOOP;--Loop For itemInter2
     END IF;
     -- ##### END Case IN_INTER Process #####'
     -- ##### START Case OUT_INTER Process #####'
   ELSIF(case_Tmmain='OUT_INTER') THEN   
     <<itemInter3_loop>> FOR itemInter3 IN
     (
        select * from tmmain
        where (intm6no=rec_tmmain.chkouttm6no) and (efirstnm||emiddlenm||efamilynm=rec_tmmain.ename) 
        and (indte is not null and outdte is null) order by indte desc
     )
     LOOP
      IF itemInter3.indte <= rec_tmmain.outdte THEN
      --dbms_output.put_line('OK Case OUT_INTER 1 '||rec_tmmain.tmrunno||' outseqno = '||rec_tmmain.outseqno||' Upd tmrunno ='||itemInter3.tmrunno);
     utl_file.put_line(file_ut,sysdateTxt||'--> OK Case OUT_INTER 1 '||rec_tmmain.tmrunno||' outseqno = '||rec_tmmain.outseqno||' Upd tmrunno ='||itemInter3.tmrunno);
      --UPDATE TMMAIN Where tmrunno with IN  = rec_tmmain.tmrunno      
      UPDATE tmmain set outseqno =rec_tmmain.outseqno, outdte=rec_tmmain.outdte,
      outdeptcd=rec_tmmain.outdeptcd, outtravcd =rec_tmmain.outtravcd, outconvcd =rec_tmmain.outconvcd,
      outconvregno =rec_tmmain.outconvregno, outtdtcd =rec_tmmain.outtdtcd, outtdtno =rec_tmmain.outtdtno,
      outtm6no=rec_tmmain.outtm6no,outvisatypecd =rec_tmmain.outvisatypecd, outpermitcd =rec_tmmain.outpermitcd,
      outpermitdte=rec_tmmain.outpermitdte,outpassportdte=rec_tmmain.outpassportdte,outpassportisu=rec_tmmain.outpassportisu,
      outpassportexpdte=rec_tmmain.outpassportexpdte,outchkpointno=rec_tmmain.outchkpointno,
      outcreusr=rec_tmmain.outcreusr,outcredte=rec_tmmain.outcredte,outcredterm=rec_tmmain.outcredterm,
      outupdusr=rec_tmmain.outupdusr,outupddte=rec_tmmain.outupddte,outupdterm=rec_tmmain.outupdterm,
      outprocessusr=rec_tmmain.outprocessusr,outprocessdte=rec_tmmain.outprocessdte,outprocessterm=rec_tmmain.outprocessterm,
      matchprocessusr='ADMIN1',matchprocessdte=sysdate,matchprocessterm='192.168.100.2',
      outvisaexpdte=rec_tmmain.outvisaexpdte,outintype=rec_tmmain.outintype,outtargetno=rec_tmmain.outtargetno,
      outremark=rec_tmmain.outremark,outrescertno=rec_tmmain.outrescertno,outimg=rec_tmmain.outimg,extid=rec_tmmain.extid 
      where  tmrunno=itemInter3.tmrunno;
      --DELETE TMMAIN Where tmrunno with OUT  = itemInter1.tmrunno
      --DELETE tmmain where tmrunno=itemInter1.tmrunno;
      chk_Break := 'Y';
      v_found := 'FOUND';
      END IF;
      Exit itemInter3_loop When chk_Break='Y'; -- Break For Loop itemInter3
     END LOOP;--Loop For itemInter1
     IF chk_Break <> 'Y' THEN
      <<itemInter4_loop>> FOR itemInter4 IN
      (
       select * from tmmain
       where(intdtno=rec_tmmain.chkouttdtno) and (intm6no=rec_tmmain.chkouttm6no)
       and (indte is not null and outdte is null) order by indte desc    
      )
      LOOP
         IF itemInter4.indte <= rec_tmmain.outdte THEN
       --dbms_output.put_line('OK Case OUT_INTER 2 '||rec_tmmain.tmrunno||' outseqno = '||rec_tmmain.outseqno||' Upd tmrunno ='||itemInter4.tmrunno);
    utl_file.put_line(file_ut,sysdateTxt||'--> OK Case OUT_INTER 2 '||rec_tmmain.tmrunno||' outseqno = '||rec_tmmain.outseqno||' Upd tmrunno ='||itemInter4.tmrunno);
       --UPDATE TMMAIN Where tmrunno with IN  = rec_tmmain.tmrunno
         UPDATE tmmain set outseqno =rec_tmmain.outseqno, outdte=rec_tmmain.outdte,
         outdeptcd=rec_tmmain.outdeptcd, outtravcd =rec_tmmain.outtravcd, outconvcd =rec_tmmain.outconvcd,
         outconvregno =rec_tmmain.outconvregno, outtdtcd =rec_tmmain.outtdtcd, outtdtno =rec_tmmain.outtdtno,
         outtm6no=rec_tmmain.outtm6no,outvisatypecd =rec_tmmain.outvisatypecd, outpermitcd =rec_tmmain.outpermitcd,
         outpermitdte=rec_tmmain.outpermitdte,outpassportdte=rec_tmmain.outpassportdte,outpassportisu=rec_tmmain.outpassportisu,
         outpassportexpdte=rec_tmmain.outpassportexpdte,outchkpointno=rec_tmmain.outchkpointno,
         outcreusr=rec_tmmain.outcreusr,outcredte=rec_tmmain.outcredte,outcredterm=rec_tmmain.outcredterm,
         outupdusr=rec_tmmain.outupdusr,outupddte=rec_tmmain.outupddte,outupdterm=rec_tmmain.outupdterm,
         outprocessusr=rec_tmmain.outprocessusr,outprocessdte=rec_tmmain.outprocessdte,outprocessterm=rec_tmmain.outprocessterm,
         matchprocessusr='ADMIN1',matchprocessdte=sysdate,matchprocessterm='192.168.100.2',
         outvisaexpdte=rec_tmmain.outvisaexpdte,outintype=rec_tmmain.outintype,outtargetno=rec_tmmain.outtargetno,
         outremark=rec_tmmain.outremark,outrescertno=rec_tmmain.outrescertno,outimg=rec_tmmain.outimg,extid=rec_tmmain.extid 
         where  tmrunno=itemInter4.tmrunno;
       --DELETE TMMAIN Where tmrunno with OUT  = itemInter2.tmrunno
       --DELETE tmmain where tmrunno=itemInter2.tmrunno;
       chk_Break := 'Y';
       v_found := 'FOUND';
       End IF;
       Exit itemInter4_loop When chk_Break='Y'; -- Break For Loop itemInter4
      END LOOP;--Loop For itemInter4
     END IF;
   -- ##### END Case OUT_INTER Process #####'     
   -- ##### START Case OUT_NOTINTER Process #####'
   ELSIF(case_Tmmain='OUT_NOTINTER') THEN   
     <<itemNotInter1_loop>> FOR itemNotInter1 IN
     (
       select * from tmmain
       where (intm6no=rec_tmmain.chkouttm6no) and (efirstnm||emiddlenm||efamilynm=rec_tmmain.ename)
       and (indte is not null and outdte is null) order by indte desc
     )
     LOOP
      IF itemNotInter1.indte >= rec_tmmain.outdte THEN
      --dbms_output.put_line('OK Case OUT_NOTINTER 1 '||rec_tmmain.tmrunno||' outseqno = '||rec_tmmain.outseqno||' Upd tmrunno ='||itemNotInter1.tmrunno);
   utl_file.put_line(file_ut,sysdateTxt||'--> OK Case OUT_NOTINTER 1 '||rec_tmmain.tmrunno||' outseqno = '||rec_tmmain.outseqno||' Upd tmrunno ='||itemNotInter1.tmrunno);
      --UPDATE TMMAIN Where tmrunno with IN  = rec_tmmain.tmrunno
      UPDATE tmmain set outseqno =rec_tmmain.outseqno, outdte=rec_tmmain.outdte,
      outdeptcd=rec_tmmain.outdeptcd, outtravcd =rec_tmmain.outtravcd, outconvcd =rec_tmmain.outconvcd,
      outconvregno =rec_tmmain.outconvregno, outtdtcd =rec_tmmain.outtdtcd, outtdtno =rec_tmmain.outtdtno,
      outtm6no=rec_tmmain.outtm6no,outvisatypecd =rec_tmmain.outvisatypecd, outpermitcd =rec_tmmain.outpermitcd,
      outpermitdte=rec_tmmain.outpermitdte,outpassportdte=rec_tmmain.outpassportdte,outpassportisu=rec_tmmain.outpassportisu,
      outpassportexpdte=rec_tmmain.outpassportexpdte,outchkpointno=rec_tmmain.outchkpointno,
      outcreusr=rec_tmmain.outcreusr,outcredte=rec_tmmain.outcredte,outcredterm=rec_tmmain.outcredterm,
      outupdusr=rec_tmmain.outupdusr,outupddte=rec_tmmain.outupddte,outupdterm=rec_tmmain.outupdterm,
      outprocessusr=rec_tmmain.outprocessusr,outprocessdte=rec_tmmain.outprocessdte,outprocessterm=rec_tmmain.outprocessterm,
      matchprocessusr='ADMIN1',matchprocessdte=sysdate,matchprocessterm='192.168.100.2',
      outvisaexpdte=rec_tmmain.outvisaexpdte,outintype=rec_tmmain.outintype,outtargetno=rec_tmmain.outtargetno,
      outremark=rec_tmmain.outremark,outrescertno=rec_tmmain.outrescertno,outimg=rec_tmmain.outimg,extid=rec_tmmain.extid 
      where  tmrunno=itemNotInter1.tmrunno;
      --DELETE TMMAIN Where tmrunno with IN  = itemNotInter1.tmrunno
      --DELETE tmmain where tmrunno=itemNotInter1.tmrunno;
      chk_Break := 'Y';
      v_found := 'FOUND';
      END IF;
      Exit itemNotInter1_loop When chk_Break='Y'; -- Break For Loop itemNotInter1
     END LOOP;--Loop For itemNotInter1
     IF chk_Break <> 'Y' THEN
      <<itemNotInter2_loop>> FOR itemNotInter2 IN
      (
        select * from tmmain
        where (intdtno=rec_tmmain.chkouttdtno) and (intm6no=rec_tmmain.chkouttm6no)
        and (indte is not null and outdte is null) order by indte desc
      )
      LOOP
         IF itemNotInter2.indte >= rec_tmmain.outdte THEN
       --dbms_output.put_line('OK Case OUT_NOTINTER 2 '||rec_tmmain.tmrunno||' outseqno = '||rec_tmmain.outseqno||' Upd tmrunno ='||itemNotInter2.tmrunno);
    utl_file.put_line(file_ut,sysdateTxt||'--> OK Case OUT_NOTINTER 2 '||rec_tmmain.tmrunno||' outseqno = '||rec_tmmain.outseqno||' Upd tmrunno ='||itemNotInter2.tmrunno);
       --UPDATE TMMAIN Where tmrunno with IN  = rec_tmmain.tmrunno
       UPDATE tmmain set outseqno =rec_tmmain.outseqno, outdte=rec_tmmain.outdte,
       outdeptcd=rec_tmmain.outdeptcd, outtravcd =rec_tmmain.outtravcd, outconvcd =rec_tmmain.outconvcd,
       outconvregno =rec_tmmain.outconvregno, outtdtcd =rec_tmmain.outtdtcd, outtdtno =rec_tmmain.outtdtno,
       outtm6no=rec_tmmain.outtm6no,outvisatypecd =rec_tmmain.outvisatypecd, outpermitcd =rec_tmmain.outpermitcd,
       outpermitdte=rec_tmmain.outpermitdte,outpassportdte=rec_tmmain.outpassportdte,outpassportisu=rec_tmmain.outpassportisu,
       outpassportexpdte=rec_tmmain.outpassportexpdte,outchkpointno=rec_tmmain.outchkpointno,
       outcreusr=rec_tmmain.outcreusr,outcredte=rec_tmmain.outcredte,outcredterm=rec_tmmain.outcredterm,
       outupdusr=rec_tmmain.outupdusr,outupddte=rec_tmmain.outupddte,outupdterm=rec_tmmain.outupdterm,
       outprocessusr=rec_tmmain.outprocessusr,outprocessdte=rec_tmmain.outprocessdte,outprocessterm=rec_tmmain.outprocessterm,
       matchprocessusr='ADMIN1',matchprocessdte=sysdate,matchprocessterm='192.168.100.2',
       outvisaexpdte=rec_tmmain.outvisaexpdte,outintype=rec_tmmain.outintype,outtargetno=rec_tmmain.outtargetno,
       outremark=rec_tmmain.outremark,outrescertno=rec_tmmain.outrescertno,outimg=rec_tmmain.outimg,extid=rec_tmmain.extid 
       where tmrunno=itemNotInter2.tmrunno;
       --DELETE TMMAIN Where tmrunno with IN  = itemNotInter2.tmrunno
       --DELETE tmmain where tmrunno=itemNotInter2.tmrunno;
       chk_Break := 'Y';
       v_found := 'FOUND';
       End IF;
       Exit itemNotInter2_loop When chk_Break='Y'; -- Break For Loop itemNotInter2
      END LOOP;--Loop For itemNotInter2
     END IF;
   -- ##### END Case OUT_NOTINTER Process #####'
   -- ##### START Case IN_NOTINTER Process #####'
   ELSIF(case_Tmmain='IN_NOTINTER') THEN   
     <<itemNotInter3_loop>> FOR itemNotInter3 IN
     (
       select * from tmmain
       where (outtm6no=rec_tmmain.chkintm6no) and (efirstnm||emiddlenm||efamilynm=rec_tmmain.ename)
       and (indte is null and outdte is not null) order by outdte desc
     )
     LOOP
      IF itemNotInter3.outdte <= rec_tmmain.indte THEN
      --dbms_output.put_line('OK Case IN_NOTINTER 1 '||rec_tmmain.tmrunno||' inseqno = '||rec_tmmain.inseqno||' Upd tmrunno ='||itemNotInter3.tmrunno);
     utl_file.put_line(file_ut,sysdateTxt||'--> OK Case IN_NOTINTER 1 '||rec_tmmain.tmrunno||' inseqno = '||rec_tmmain.inseqno||' Upd tmrunno ='||itemNotInter3.tmrunno);
      --UPDATE TMMAIN Where tmrunno with IN  = rec_tmmain.tmrunno
         UPDATE tmmain set inseqno=rec_tmmain.inseqno, indte=rec_tmmain.indte,
         indeptcd=rec_tmmain.indeptcd, intravcd =rec_tmmain.intravcd, inconvcd =rec_tmmain.inconvcd,
         inconvregno =rec_tmmain.inconvregno, intdtcd =rec_tmmain.intdtcd, intdtno =rec_tmmain.intdtno,
         intm6no=rec_tmmain.intm6no,invisatypecd =rec_tmmain.invisatypecd, inpermitcd =rec_tmmain.inpermitcd,
         inpermitdte=rec_tmmain.inpermitdte,inpassportdte=rec_tmmain.inpassportdte,inpassportisu=rec_tmmain.inpassportisu,
         inpassportexpdte=rec_tmmain.inpassportexpdte,inchkpointno=rec_tmmain.inchkpointno,
         increusr=rec_tmmain.increusr,incredte=rec_tmmain.incredte,incredterm=rec_tmmain.incredterm,
         inupdusr=rec_tmmain.inupdusr,inupddte=rec_tmmain.inupddte,inupdterm=rec_tmmain.inupdterm,
         inprocessusr=rec_tmmain.inprocessusr,inprocessdte=rec_tmmain.inprocessdte,inprocessterm=rec_tmmain.inprocessterm,
         matchprocessusr='ADMIN1',matchprocessdte=sysdate,matchprocessterm='192.168.100.2',
         invisaexpdte=rec_tmmain.invisaexpdte,inintype=rec_tmmain.inintype,intargetno=rec_tmmain.intargetno,
         inremark=rec_tmmain.inremark,inrescertno=rec_tmmain.inrescertno,inimg=rec_tmmain.inimg,extid=rec_tmmain.extid
         where  tmrunno=itemNotInter3.tmrunno;
      --DELETE TMMAIN Where tmrunno with IN  = itemNotInter1.tmrunno
      --DELETE tmmain where tmrunno=itemNotInter1.tmrunno;
      chk_Break := 'Y';
      v_found := 'FOUND';
      END IF;
      Exit itemNotInter3_loop When chk_Break='Y'; -- Break For Loop itemNotInter3
     END LOOP;--Loop For itemNotInter3
     IF chk_Break <> 'Y' THEN
      <<itemNotInter4_loop>> FOR itemNotInter4 IN
      (
       select * from tmmain
       where (outtdtno=rec_tmmain.chkintdtno) and (outtm6no=rec_tmmain.chkintm6no)
       and (indte is null and outdte is not null)  order by outdte desc   
      )
      LOOP
         IF itemNotInter4.outdte <= rec_tmmain.indte THEN
       --dbms_output.put_line('OK Case IN_NOTINTER 2 '||rec_tmmain.tmrunno||' inseqno = '||rec_tmmain.inseqno||' Upd tmrunno ='||itemNotInter4.tmrunno);
    utl_file.put_line(file_ut,sysdateTxt||'--> OK Case IN_NOTINTER 2 '||rec_tmmain.tmrunno||' inseqno = '||rec_tmmain.inseqno||' Upd tmrunno ='||itemNotInter4.tmrunno);
       --UPDATE TMMAIN Where tmrunno with IN  = rec_tmmain.tmrunno
         UPDATE tmmain set inseqno=rec_tmmain.inseqno, indte=rec_tmmain.indte,
         indeptcd=rec_tmmain.indeptcd, intravcd =rec_tmmain.intravcd, inconvcd =rec_tmmain.inconvcd,
         inconvregno =rec_tmmain.inconvregno, intdtcd =rec_tmmain.intdtcd, intdtno =rec_tmmain.intdtno,
         intm6no=rec_tmmain.intm6no,invisatypecd =rec_tmmain.invisatypecd, inpermitcd =rec_tmmain.inpermitcd,
         inpermitdte=rec_tmmain.inpermitdte,inpassportdte=rec_tmmain.inpassportdte,inpassportisu=rec_tmmain.inpassportisu,
         inpassportexpdte=rec_tmmain.inpassportexpdte,inchkpointno=rec_tmmain.inchkpointno,
         increusr=rec_tmmain.increusr,incredte=rec_tmmain.incredte,incredterm=rec_tmmain.incredterm,
         inupdusr=rec_tmmain.inupdusr,inupddte=rec_tmmain.inupddte,inupdterm=rec_tmmain.inupdterm,
         inprocessusr=rec_tmmain.inprocessusr,inprocessdte=rec_tmmain.inprocessdte,inprocessterm=rec_tmmain.inprocessterm,
         matchprocessusr='ADMIN1',matchprocessdte=sysdate,matchprocessterm='192.168.100.2',
         invisaexpdte=rec_tmmain.invisaexpdte,inintype=rec_tmmain.inintype,intargetno=rec_tmmain.intargetno,
         inremark=rec_tmmain.inremark,inrescertno=rec_tmmain.inrescertno,inimg=rec_tmmain.inimg,extid=rec_tmmain.extid 
         where  tmrunno=itemNotInter4.tmrunno;
       --DELETE TMMAIN Where tmrunno with IN  = itemNotInter2.tmrunno
       --DELETE tmmain where tmrunno=itemNotInter2.tmrunno;
       chk_Break := 'Y';
       v_found := 'FOUND';
       End IF;
       Exit itemNotInter4_loop When chk_Break='Y'; -- Break For Loop itemNotInter4
      END LOOP;--Loop For itemNotInter2
     END IF;
   -- ##### END Case OUT_NOTINTER Process #####'
   ELSIF(case_Tmmain='NOTCASE') THEN    
       v_found := 'NOTFOUND';
   END IF;
   IF v_found = 'NOTFOUND' THEN
       --dbms_output.put_line('Case NOTCASE, NOTFOUND ::: ' ||rec_tmmain.tmrunno);
    utl_file.put_line(file_ut,sysdateTxt||'--> Case NOTCASE, NOTFOUND ::: ' ||rec_tmmain.tmrunno);
       --update tmmain set flagmatch='N',matchprocessusr='ADMIN1', matchprocessdte=sysdate, matchprocessterm='192.168.100.2' where tmrunno = rec_tmmain.tmrunno; 
    insert into tmmain (tmrunno, personid, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, nationcd, inseqno, indte, indeptcd, intravcd, inconvcd, inconvregno, 
    intdtcd, intdtno, intm6no, invisatypecd, inpermitcd, inpermitdte, inpassportdte, inpassportisu, inpassportexpdte, visano, visaissue, visadte, visabyrights, inchkpointno, increusr, incredte, 
    incredterm, inupdusr, inupddte, inupdterm, inprocessusr, inprocessdte, inprocessterm, xtndeptcd, xtnaddress, xtntype, inputxtndeptcd, appdte, outseqno, outdte, outdeptcd, outtravcd, 
    outconvcd, outconvregno, outtdtcd, outtdtno, outtm6no, outvisatypecd, outpermitcd, outpermitdte, outpassportdte, outpassportisu, outpassportexpdte, outchkpointno, outcreusr, outcredte, 
    outcredterm, outupdusr, outupddte, outupdterm, outprocessusr, outprocessdte, outprocessterm, matchprocessusr, matchprocessdte, matchprocessterm, tfsndxnm, tlsndxnm, tmsndxnm, 
    efsndxnm, elsndxnm, emsndxnm, birthdte, invisaexpdte, outvisaexpdte, inintype, outintype, intargetno, outtargetno, inremark, outremark,inrescertno,outrescertno,inimg,outimg,extid) 
     values (rec_tmmain.tmrunno, rec_tmmain.personid,rec_tmmain.tfirstnm, rec_tmmain.tmiddlenm, rec_tmmain.tfamilynm, rec_tmmain.efirstnm, rec_tmmain.emiddlenm, rec_tmmain.efamilynm, 
    rec_tmmain.sex, rec_tmmain.nationcd, rec_tmmain.inseqno, rec_tmmain.indte, rec_tmmain.indeptcd, rec_tmmain.intravcd, rec_tmmain.inconvcd, rec_tmmain.inconvregno, 
    rec_tmmain.intdtcd, rec_tmmain.intdtno, rec_tmmain.intm6no, rec_tmmain.invisatypecd, rec_tmmain.inpermitcd, rec_tmmain.inpermitdte, rec_tmmain.inpassportdte, 
    rec_tmmain.inpassportisu, rec_tmmain.inpassportexpdte, rec_tmmain.visano, rec_tmmain.visaissue, rec_tmmain.visadte, rec_tmmain.visabyrights, rec_tmmain.inchkpointno, 
    rec_tmmain.increusr, rec_tmmain.incredte, rec_tmmain.incredterm, rec_tmmain.inupdusr, rec_tmmain.inupddte, rec_tmmain.inupdterm, rec_tmmain.inprocessusr, rec_tmmain.inprocessdte, 
    rec_tmmain.inprocessterm, rec_tmmain.xtndeptcd, rec_tmmain.xtnaddress, rec_tmmain.xtntype, rec_tmmain.inputxtndeptcd, rec_tmmain.appdte, rec_tmmain.outseqno, rec_tmmain.outdte, 
    rec_tmmain.outdeptcd, rec_tmmain.outtravcd, rec_tmmain.outconvcd, rec_tmmain.outconvregno, rec_tmmain.outtdtcd, rec_tmmain.outtdtno, rec_tmmain.outtm6no, 
    rec_tmmain.outvisatypecd, rec_tmmain.outpermitcd, rec_tmmain.outpermitdte, rec_tmmain.outpassportdte, rec_tmmain.outpassportisu, rec_tmmain.outpassportexpdte, 
    rec_tmmain.outchkpointno, rec_tmmain.outcreusr, rec_tmmain.outcredte, rec_tmmain.outcredterm, rec_tmmain.outupdusr, rec_tmmain.outupddte, rec_tmmain.outupdterm, 
    rec_tmmain.outprocessusr, rec_tmmain.outprocessdte, rec_tmmain.outprocessterm, 'ADMIN1', sysdate, '192.168.100.2', 
    rec_tmmain.tfsndxnm, rec_tmmain.tlsndxnm, rec_tmmain.tmsndxnm, rec_tmmain.efsndxnm, rec_tmmain.elsndxnm, rec_tmmain.emsndxnm, rec_tmmain.birthdte, rec_tmmain.invisaexpdte, 
    rec_tmmain.outvisaexpdte, rec_tmmain.inintype, rec_tmmain.outintype, rec_tmmain.intargetno, rec_tmmain.outtargetno, rec_tmmain.inremark, rec_tmmain.outremark,rec_tmmain.inrescertno,
    rec_tmmain.outrescertno,rec_tmmain.inimg,rec_tmmain.outimg,rec_tmmain.extid); 
   END IF;
   chk_Break := 'N';
   update tmmain_tmp set flagmatch='Y',matchprocessusr='ADMIN1', matchprocessdte=sysdate, matchprocessterm='192.168.100.2' where tmrunno = rec_tmmain.tmrunno;     
   --IF chk_Commit = 50000 THEN
    --dbms_output.put_line('commit ' ||chk_Commit);
     COMMIT;
    --chk_Commit := 0;
   --END IF; -- Check Commit 100000;
  END LOOP;--Loop Cursor
  --Delete Data Tmmain_tmp
  Delete tmmain_tmp;
  close c1;
  COMMIT;
  select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
  --dbms_output.put_line(sysdateTxt||' Complete Match Tmmain  ...!!!!');
  utl_file.put_line(file_ut,sysdateTxt||' Complete Match Tmmain  ...!!!!'); 
  UTL_FILE.FCLOSE(file_ut); 
  Exception When DUP_VAL_ON_INDEX then  
  update tmmain_tmp set flagmatch='D',matchprocessusr='ADMIN11', matchprocessdte=sysdate, matchprocessterm='192.168.100.2' where tmrunno = rec_tmmain.tmrunno;
  utl_file.put_line(file_ut,sysdateTxt||' Problem Match Tmmain Dup '|| rec_tmmain.tmrunno ||'  ...!!!!'); 
  UTL_FILE.FCLOSE(file_ut); 
END;

END MATCH_ITIMS; 
/
