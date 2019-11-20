CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESSTM1BLCHK" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PROCESSTM1BLCHK
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        24/10/2014   Sumet-C       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PROCESSTM1BLCHK
      Sysdate:         24/10/2014
      Date and Time:   24/10/2014, 09:29:32, and 24/10/2014 09:29:32
      Username:        Sumet-C (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
  DECLARE
   extlistSeqno number(20);
   changevisalistSeqno number(20);
   anddSeqno number(20);
   chkext char(1);
   chkchngvisa char(1);
   chkfn90 char(1);
   tmrunnoin varchar2(100);
   tmrunnoout varchar2(100);
   chkin char(1);
   chkout char(1);
   indate timestamp;
   outdate timestamp;
    
    CURSOR c1 IS
    select * from tm1blchk;
    rec_tm1 c1%ROWTYPE;
    
    BEGIN     
        OPEN c1;
        LOOP FETCH c1 INTO rec_tm1; EXIT WHEN c1%NOTFOUND;
            extlistSeqno := null;
            changevisalistSeqno := null;
            anddSeqno := null;
            chkext := null;
            chkchngvisa := null;
            chkfn90 := null;
            tmrunnoin := null;
            tmrunnoout := null;
            chkin := null;
            chkout := null;
            indate := null;
            outdate := null;
            
            BEGIN
                select extlist_seqno into extlistSeqno from ext_extensionlist where passportno = trim(rec_tm1.tdtno) and nation_seqno = rec_tm1.nation_seqno and rownum = 1;
                IF extlistSeqno IS NOT NULL THEN
                    chkext := 'Y';
                END IF;
            EXCEPTION WHEN NO_DATA_FOUND THEN
                chkext := 'N';
            END;
            
            BEGIN
                select changevisalist_seqno into changevisalistSeqno from chng_changevisalist where passportno = trim(rec_tm1.tdtno) and nation_seqno = rec_tm1.nation_seqno and rownum = 1;
                IF changevisalistSeqno IS NOT NULL THEN
                    chkchngvisa := 'Y';
                END IF;
            EXCEPTION WHEN NO_DATA_FOUND THEN
                chkchngvisa := 'N';
            END;
            
            BEGIN
                select andd_seqno into anddSeqno from fn_address90 where passportno = trim(rec_tm1.tdtno) and nation_seqno = rec_tm1.nation_seqno and rownum = 1;
                IF anddSeqno IS NOT NULL THEN
                    chkfn90 := 'Y';
                END IF;
            EXCEPTION WHEN NO_DATA_FOUND THEN
                chkfn90 := 'N';
            END;
            
            BEGIN
                select tmrunno, indte into tmrunnoin, indate from 
                (select tmrunno, indte from tmmain where intdtno = trim(rec_tm1.tdtno) and nationcd = rec_tm1.countcd order by indte desc) 
                where rownum = 1;
                IF tmrunnoin IS NOT NULL THEN
                    chkin := 'Y';
                END IF;
            EXCEPTION WHEN NO_DATA_FOUND THEN
                chkin := 'N';
            END;
            
            BEGIN
                select tmrunno, outdte into tmrunnoout, outdate from 
                (select tmrunno, outdte from tmmain where outtdtno = trim(rec_tm1.tdtno) and nationcd = rec_tm1.countcd order by outdte desc)
                where rownum = 1;
                IF tmrunnoout IS NOT NULL THEN
                    chkout := 'Y';
                END IF;
            EXCEPTION WHEN NO_DATA_FOUND THEN
                chkout := 'N';
            END;
            
            DBMS_OUTPUT.PUT_LINE(rec_tm1.id || '  [passportno : ' || rec_tm1.tdtno || ']  [nationSeqno : ' || rec_tm1.nation_seqno 
            || ']  [chkext : ' || chkext || ']  [chkchagvisa : ' || chkchngvisa || ']  [chkfn90 : ' || chkfn90 || ']'
            || ']  [chkin : ' || chkin || ']  [chkout : ' || chkout || ']  [indate : ' || indate || '] [outdate : ' || outdate || ']');
            update tm1blchk set checkext = chkext, checkchngvisa = chkchngvisa, checkfn90 = chkfn90, checkin = chkin, indte = indate, checkout = chkout, outdte = outdate
            where id = rec_tm1.id and month = rec_tm1.month;
            commit;
            
        END LOOP;
        CLOSE c1;
    
--    EXCEPTION
--        WHEN others THEN
--            DBMS_OUTPUT.PUT_LINE(sqlerrm||'[Re-Gen Error]');
     -- null;--prompt(sqlerrm||'[Re-Gen Error]');
     
    END;
END PROCESSTM1BLCHK;
/
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSTM1BLCHK" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSTM1BLCHK" TO "BIOSAADM";
