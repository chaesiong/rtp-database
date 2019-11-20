CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."TF_WL2LOSTPASSPORT" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       TF_WL2LOSTPASSPORT
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        6/2/2009          1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     TF_WL2LOSTPASSPORT
      Sysdate:         6/2/2009
      Date and Time:   6/2/2009, 8:44:47, and 6/2/2009 8:44:47
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
       sysdateTxt varchar2(25);
       sysdateFile varchar2(8);
       processrow number(10);
       file_ut UTL_FILE.FILE_TYPE;
       cursor c1 is 
       select w.wlcd, w.ownerage, w.agcphone, w.emgcont, w.docref, w.seclev, w.operref, w.reasoncd, w.tdcd, w.creusr, w.credte, w.upddte, w.otheragccont,
       wn.wlefirstnm, wn.wlelastnm, wn.wlemiddlenm, wn.wltfirstnm, wn.wltlastnm, wn.wltmiddlenm, wn.birthdte, wn.nationcd, w.sex, wr.remk,
       nvl((select docno from wlindicatecard wl where w.wlcd=wl.wlcd and wl.seqno='0' and wl.idccd='0020'), 'Unknown')as docno
       from watchlist w, watchlistnm wn, wlremark wr 
       where w.wlcd=wn.wlcd and wn.seqno='0' and w.wlcd=wr.wlcd and w.reasoncd = '0076' and (creusr!='P06041' and creusr!='P06039')
       ;
       rec_wl c1%rowtype;
begin
     processrow:=0;
       select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
       select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
       dbms_output.put_line(sysdateTxt||' Start Process lostpassport of Watchlist .... !!!');
       file_ut := UTL_FILE.FOPEN('UTL_DIR','logWL'||sysdateFile||'.txt','W');
       utl_file.put_line(file_ut,sysdateTxt||' Start Process lostpassport of Watchlist .... !!!');
     open c1;
     loop fetch c1 into rec_wl; 
        exit when c1%notfound;
     select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
     utl_file.put_line(file_ut,sysdateTxt||' lppcd :'||rec_wl.wlcd);
     --dbms_output.put_line(' wlcd ::: '||rec_wl.wlcd);
     insert into lostpassport (lppcd, efirstnm, efamilynm, emiddlenm, tfirstnm, tfamilynm, tmiddlenm, birthdate, nationcd, sex, 
     remark, passportno, ownerage, agcphone, emgcont, docref, seclev, operref, reasoncd, tdcd, creusr, credte, upddte, agccont, lpperson) 
        values (rec_wl.wlcd, rec_wl.wlefirstnm, rec_wl.wlelastnm, rec_wl.wlemiddlenm, rec_wl.wltfirstnm, rec_wl.wltlastnm, rec_wl.wltmiddlenm, 
     rec_wl.birthdte, rec_wl.nationcd, rec_wl.sex, rec_wl.remk, rec_wl.docno, rec_wl.ownerage, rec_wl.agcphone, rec_wl.emgcont,
     rec_wl.docref, rec_wl.seclev, rec_wl.operref, rec_wl.reasoncd, rec_wl.tdcd, rec_wl.creusr, rec_wl.credte, rec_wl.upddte, rec_wl.otheragccont, lpperson_seq.nextval);
     processrow:=processrow+1;
     --delete watchlist, watchlistnm, wlindicatecard, wlrelation, wlremark
     --delete wlremark where wlcd=rec_wl.wlcd;
     --delete wlrelation where wlcd=rec_wl.wlcd;
     --delete wlindicatecard where wlcd=rec_wl.wlcd;
     --delete watchlistnm where wlcd=rec_wl.wlcd;
     --delete watchlist where wlcd=rec_wl.wlcd;
     commit;
       end loop;--Loop Cursor
     close c1;
       COMMIT;
       select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
       dbms_output.put_line(sysdateTxt||' Complete Process row '||processrow||' lostpassport of Watchlist  ...!!!!');
       utl_file.put_line(file_ut,sysdateTxt||' Complete Process row '||processrow||' lostpassport of Watchlist  ...!!!!'); 
       UTL_FILE.FCLOSE(file_ut); 
end;
END TF_WL2LOSTPASSPORT; 
/
  GRANT EXECUTE ON "PIBICSDM2"."TF_WL2LOSTPASSPORT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."TF_WL2LOSTPASSPORT" TO "BIOSAADM";
