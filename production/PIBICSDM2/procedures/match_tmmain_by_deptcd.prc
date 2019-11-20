CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MATCH_TMMAIN_BY_DEPTCD" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       MATCH_TMMAIN_BY_DEPTCD
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        20/3/2009          1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     MATCH_TMMAIN_BY_DEPTCD
      Sysdate:         20/3/2009
      Date and Time:   20/3/2009, 16:12:42, and 20/3/2009 16:12:42
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
       --chk_Commit number(8);
       chk_Break varchar2(1);
       sysdateTxt varchar2(25);
       sysdateFile varchar2(8);
       case_Tmmain varchar2(8);
       v_found varchar2(8);
       file_ut UTL_FILE.FILE_TYPE;
       cursor c1  is 
       select tmmain.*, trim(efirstnm)||trim(emiddlenm)||trim(efamilynm) as ename, trim(intdtno) as chkintdtno, 
       trim(intm6no) as chkintm6no, trim(outtdtno) as chkouttdtno, trim(outtm6no) as chkouttm6no, invisatypecd||outvisatypecd as chkvisa,
       to_number(to_char(indte, 'YYYYMMDDHH24MISS')||to_char(outdte, 'YYYYMMDDHH24MISS')) as inoutdte 
       from tmmain where (outdte is null or indte is null) 
       and (indeptcd = '00064' or outdeptcd='00064') 
       --and rownum <=10
       order by inoutdte;
       rec_tmmain c1%rowtype;
begin
     --chk_Commit := 0;
     select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
     --dbms_output.put_line(sysdateTxt||' Start Process Match Tmmain .... !!!');
     file_ut := UTL_FILE.FOPEN('UTL_DIR','logMatch'||sysdateFile||'.txt','W');
     utl_file.put_line(file_ut,sysdateTxt||' Start Process Match Tmmain By Deptcd .... !!!');     
     open c1;
           loop 
              fetch c1 into rec_tmmain; 
            exit when c1%notfound;
            v_found := 'NOTFOUND';
            --chk_Commit := chk_Commit+1;
            -- Check case data  Inter or NotInter 
            IF ((rec_tmmain.nationcd = 'T03' and rec_tmmain.indte is null)  or (rec_tmmain.nationcd <> 'T03' and rec_tmmain.chkvisa='0009' and rec_tmmain.indte is null)) THEN
               --dbms_output.put_line('Case NOTINTER ::: '||rec_tmmain.tmrunno);
               case_Tmmain:='NOTINTER';
            ELSIF (rec_tmmain.nationcd <> 'T03' and rec_tmmain.chkvisa!='0009' and rec_tmmain.outdte is null) THEN
               --dbms_output.put_line('Case INTER ::: '||rec_tmmain.tmrunno);
               case_Tmmain:='INTER';
            ELSE
               --dbms_output.put_line('Case NOTCASE ::: '||rec_tmmain.tmrunno);
               case_Tmmain:='NOTCASE';
            END IF;
            -- Start Process Match Tmmain
            IF(case_Tmmain='INTER') THEN
            --##### START Case INTER Process #####
              <<itemInter1_loop>> FOR itemInter1 IN
              (
               select * from tmmain
               where (outtm6no=rec_tmmain.chkintm6no) and  (efirstnm||emiddlenm||efamilynm=rec_tmmain.ename)
               and (indte is null and outdte is not null) order by outdte desc
              )
              LOOP
                  IF itemInter1.outdte >= rec_tmmain.indte THEN
                  --dbms_output.put_line('OK Case INTER 1 '||rec_tmmain.tmrunno||' tdtno = '||itemInter1.outtdtno||' tm6no = '||itemInter1.outtm6no||' Del tmrunno ='||itemInter1.tmrunno);
                  --UPDATE TMMAIN Where tmrunno with IN  = rec_tmmain.tmrunno
                  utl_file.put_line(file_ut,sysdateTxt||'--> OK Case INTER 1 '||rec_tmmain.tmrunno||' inseqno = '||rec_tmmain.inseqno||' Upd tmrunno ='||itemInter1.tmrunno);
                  UPDATE tmmain set inseqno=rec_tmmain.inseqno, indte=rec_tmmain.indte,
                  indeptcd=rec_tmmain.indeptcd, intravcd =rec_tmmain.intravcd, inconvcd =rec_tmmain.inconvcd,
                  inconvregno =rec_tmmain.inconvregno, intdtcd =rec_tmmain.intdtcd, intdtno =rec_tmmain.intdtno,
                  intm6no=rec_tmmain.intm6no,invisatypecd =rec_tmmain.invisatypecd, inpermitcd =rec_tmmain.inpermitcd,
                  inpermitdte=rec_tmmain.inpermitdte,inpassportdte=rec_tmmain.inpassportdte,inpassportisu=rec_tmmain.inpassportisu,
                  inpassportexpdte=rec_tmmain.inpassportexpdte,inchkpointno=rec_tmmain.inchkpointno,
                  increusr=rec_tmmain.increusr,incredte=rec_tmmain.incredte,incredterm=rec_tmmain.incredterm,
                  inupdusr=rec_tmmain.inupdusr,inupddte=rec_tmmain.inupddte,inupdterm=rec_tmmain.inupdterm,
                  inprocessusr=rec_tmmain.inprocessusr,inprocessdte=rec_tmmain.inprocessdte,inprocessterm=rec_tmmain.inprocessterm,
                  matchprocessusr='ADMIN1',matchprocessdte=sysdate,matchprocessterm='192.168.100.4',
                  invisaexpdte=rec_tmmain.invisaexpdte,inintype=rec_tmmain.inintype,intargetno=rec_tmmain.intargetno,
                  inremark=rec_tmmain.inremark,inrescertno=rec_tmmain.inrescertno,inimg=rec_tmmain.inimg,extid=rec_tmmain.extid
                  where tmrunno=itemInter1.tmrunno;
                  DELETE tmmain where tmrunno=rec_tmmain.tmrunno;
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
                      --dbms_output.put_line('OK Case INTER 2 '||rec_tmmain.tmrunno||' tdtno = '||itemInter2.outtdtno||' tm6no = '||itemInter2.outtm6no||' Del tmrunno ='||itemInter2.tmrunno);
                      --UPDATE TMMAIN Where tmrunno with IN  = rec_tmmain.tmrunno
                      utl_file.put_line(file_ut,sysdateTxt||'--> OK Case INTER 2 '||rec_tmmain.tmrunno||' inseqno = '||rec_tmmain.inseqno||' Upd tmrunno ='||itemInter2.tmrunno);
                      UPDATE tmmain set inseqno=rec_tmmain.inseqno, indte=rec_tmmain.indte,
                      indeptcd=rec_tmmain.indeptcd, intravcd =rec_tmmain.intravcd, inconvcd =rec_tmmain.inconvcd,
                      inconvregno =rec_tmmain.inconvregno, intdtcd =rec_tmmain.intdtcd, intdtno =rec_tmmain.intdtno,
                      intm6no=rec_tmmain.intm6no,invisatypecd =rec_tmmain.invisatypecd, inpermitcd =rec_tmmain.inpermitcd,
                      inpermitdte=rec_tmmain.inpermitdte,inpassportdte=rec_tmmain.inpassportdte,inpassportisu=rec_tmmain.inpassportisu,
                      inpassportexpdte=rec_tmmain.inpassportexpdte,inchkpointno=rec_tmmain.inchkpointno,
                      increusr=rec_tmmain.increusr,incredte=rec_tmmain.incredte,incredterm=rec_tmmain.incredterm,
                      inupdusr=rec_tmmain.inupdusr,inupddte=rec_tmmain.inupddte,inupdterm=rec_tmmain.inupdterm,
                      inprocessusr=rec_tmmain.inprocessusr,inprocessdte=rec_tmmain.inprocessdte,inprocessterm=rec_tmmain.inprocessterm,
                      matchprocessusr='ADMIN1',matchprocessdte=sysdate,matchprocessterm='192.168.100.4',
                      invisaexpdte=rec_tmmain.invisaexpdte,inintype=rec_tmmain.inintype,intargetno=rec_tmmain.intargetno,
                      inremark=rec_tmmain.inremark,inrescertno=rec_tmmain.inrescertno,inimg=rec_tmmain.inimg,extid=rec_tmmain.extid 
                      where  tmrunno=itemInter2.tmrunno;
                      DELETE tmmain where tmrunno=rec_tmmain.tmrunno;
                      chk_Break := 'Y';
                      v_found := 'FOUND';
                      End IF;
                      Exit itemInter2_loop When chk_Break='Y'; -- Break For Loop itemInter2
                  END LOOP;--Loop For itemInter2
              END IF;
              -- ##### END Case INTER Process #####'
            ELSIF(case_Tmmain='NOTINTER') THEN
            -- ##### START Case NOTINTER Process #####'
              <<itemNotInter1_loop>> FOR itemNotInter1 IN
              (
               select * from tmmain
               where (intm6no=rec_tmmain.chkouttm6no) and (efirstnm||emiddlenm||efamilynm=rec_tmmain.ename)
               and (indte is not null and outdte is null) order by indte desc
              )
              LOOP
                  IF itemNotInter1.indte >= rec_tmmain.outdte THEN
                  --dbms_output.put_line('OK Case NOTINTER 1 '||rec_tmmain.tmrunno||' tdtno = '||itemNotInter1.intdtno||' tm6no = '||itemNotInter1.intm6no||' Del tmrunno ='||itemNotInter1.tmrunno);
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
                  matchprocessusr='ADMIN1',matchprocessdte=sysdate,matchprocessterm='192.168.100.4',
                  outvisaexpdte=rec_tmmain.outvisaexpdte,outintype=rec_tmmain.outintype,outtargetno=rec_tmmain.outtargetno,
                  outremark=rec_tmmain.outremark,outrescertno=rec_tmmain.outrescertno,outimg=rec_tmmain.outimg,extid=rec_tmmain.extid 
                   where  tmrunno=itemNotInter1.tmrunno;
                  --DELETE TMMAIN Where tmrunno with IN  = itemNotInter1.tmrunno
                  DELETE tmmain where tmrunno=rec_tmmain.tmrunno;
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
                      IF itemNotInter2.indte > rec_tmmain.outdte THEN
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
                       matchprocessusr='ADMIN1',matchprocessdte=sysdate,matchprocessterm='192.168.100.4',
                       outvisaexpdte=rec_tmmain.outvisaexpdte,outintype=rec_tmmain.outintype,outtargetno=rec_tmmain.outtargetno,
                       outremark=rec_tmmain.outremark,outrescertno=rec_tmmain.outrescertno,outimg=rec_tmmain.outimg,extid=rec_tmmain.extid 
                       where tmrunno=itemNotInter2.tmrunno;
                       DELETE tmmain where tmrunno=rec_tmmain.tmrunno;
                      chk_Break := 'Y';
                      v_found := 'FOUND';
                      End IF;
                      Exit itemNotInter2_loop When chk_Break='Y'; -- Break For Loop itemNotInter2
                  END LOOP;--Loop For itemNotInter2
              END IF;
            ELSIF(case_Tmmain='NOTCASE') THEN             
                v_found := 'NOTFOUND';
            END IF;
            IF v_found = 'NOTFOUND' THEN
                --dbms_output.put_line('Case NOTCASE, NOTFOUND ::: ' ||rec_tmmain.tmrunno);
                update tmmain set flagmatch='N',matchprocessusr='ADMIN1', matchprocessdte=sysdate, matchprocessterm='192.168.100.4' where tmrunno = rec_tmmain.tmrunno; 
            END IF;
            chk_Break := 'N';
            --IF chk_Commit = 50000 THEN
                --dbms_output.put_line('commit ' ||chk_Commit);
                 COMMIT;
                --chk_Commit := 0;
            --END IF; -- Check Commit 100000;
        END LOOP;--Loop Cursor
     close c1; 
     COMMIT;
      utl_file.put_line(file_ut,sysdateTxt||' Complete Match Tmmain By Deptcd  ...!!!!'); 
      UTL_FILE.FCLOSE(file_ut); 
END;
END MATCH_TMMAIN_BY_DEPTCD; 
/
  GRANT EXECUTE ON "PIBICSDM2"."MATCH_TMMAIN_BY_DEPTCD" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MATCH_TMMAIN_BY_DEPTCD" TO "BIOSAADM";
