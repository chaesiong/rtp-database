CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."TF_TM62TMMAIN" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       TF_TM62TMMAIN
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        08/12/2011   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     TF_TM62TMMAIN
      Sysdate:         08/12/2011
      Date and Time:   08/12/2011, 21:17:19, and 08/12/2011 21:17:19
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(20);
totalrow number(20);
cmtrow number(20);
personseq number(20);
personidtext varchar2(30);
personidfordup varchar2(20);
tmmain_personid varchar2(30);
checkduptmrunno varchar2(30);
permitdays date;
datenow date;
chk_inoutdte number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    select * from tm6inout where flagprocess is null  order by tm6seqno;
    --select * from tm6inout where to_char(credte, 'yyyymmdd') = '20111129' order by tm6seqno;
    --select * from tm6inout where tm6seqno in (342588,342640,342643,342716,342717) order by tm6seqno;
    rec_tm c1%rowtype;  
begin
    cmtrow:=0;totalrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDDHH24MI') into sysdateFile from dual;

    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_TF_Tm6inout 2 Tmmain'||sysdateFile||'.txt','W');
    utl_file.put_line(file_ut,sysdateTxt||' Start Transfer Tm6inout 2 Tmmain .... !!!');utl_file.fflush(file_ut);
    open c1;
    loop fetch c1 into rec_tm; exit when c1%notfound;
      personidtext:= null;
      checkduptmrunno := null;
      begin
          if (rec_tm.cardtype = '1') then
                if (rec_tm.efamilynm is not null) and (rec_tm.efirstnm is not null) and (rec_tm.emiddlenm is not null) then
                    --utl_file.put_line(flog_handler, 'start checkdup  case name 1 ' || rec_tm.efamilynm|| ' ' ||rec_tm.efirstnm || ' ' ||rec_tm.emiddlenm||' '||rec_tm.inoutdte);
                    select tmrunno into checkduptmrunno from tmmain t1 where 
                    efamilynm = rec_tm.efamilynm and efirstnm =  rec_tm.efirstnm and emiddlenm =  rec_tm.emiddlenm and 
                    t1.birthdte = rec_tm.birthdte and t1.sex = rec_tm.sex and t1.nationcd = rec_tm.nationcd and t1.indeptcd = rec_tm.deptcd and
                    intdtno = rec_tm.tdtno and intm6no = rec_tm.tm6no and 
                    to_char(t1.indte, 'YYYYMMDD') = to_char(rec_tm.inoutdte, 'YYYYMMDD') and rownum=1;                                            
                elsif (rec_tm.efamilynm is not null) and (rec_tm.efirstnm is not null) and (rec_tm.emiddlenm is null) then
                    --utl_file.put_line(flog_handler, 'start checkdup  case name 2 ' || rec_tm.efamilynm|| ' ' ||rec_tm.efirstnm || ' ' ||rec_tm.emiddlenm||' '||rec_tm.inoutdte);
                    select tmrunno into checkduptmrunno from tmmain t1 where 
                    efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm and emiddlenm is null and 
                    t1.birthdte = rec_tm.birthdte and t1.sex = rec_tm.sex and t1.nationcd = rec_tm.nationcd and t1.indeptcd = rec_tm.deptcd and 
                    intdtno = rec_tm.tdtno and intm6no = rec_tm.tm6no and 
                    to_char(t1.indte, 'YYYYMMDD') = to_char(rec_tm.inoutdte, 'YYYYMMDD') and rownum=1;       
                elsif (rec_tm.efamilynm is not null) and (rec_tm.efirstnm is null) and (rec_tm.emiddlenm is null) then
                    --utl_file.put_line(flog_handler, 'start checkdup  case name 3 ' || rec_tm.efamilynm|| ' ' ||rec_tm.efirstnm || ' ' ||rec_tm.emiddlenm||' '||rec_tm.inoutdte); 
                    select tmrunno into checkduptmrunno from tmmain t1 where 
                    efamilynm = rec_tm.efamilynm and efirstnm is null and emiddlenm is null and 
                    t1.birthdte = rec_tm.birthdte and t1.sex = rec_tm.sex and t1.nationcd = rec_tm.nationcd and t1.indeptcd = rec_tm.deptcd and 
                    intdtno = rec_tm.tdtno and intm6no = rec_tm.tm6no and 
                    to_char(t1.indte, 'YYYYMMDD') = to_char(rec_tm.inoutdte, 'YYYYMMDD') and rownum=1;             
                elsif (rec_tm.efamilynm is  null) and (rec_tm.efirstnm is not null) and (rec_tm.emiddlenm is null)   then                                        
                    --utl_file.put_line(flog_handler, 'start checkdup  case name 4 ' || rec_tm.efamilynm|| ' ' ||rec_tm.efirstnm || ' ' ||rec_tm.emiddlenm);
                    select tmrunno into checkduptmrunno from tmmain t1 where 
                    efamilynm is null and efirstnm = rec_tm.efirstnm and emiddlenm is null and 
                    t1.birthdte = rec_tm.birthdte and t1.sex = rec_tm.sex and t1.nationcd = rec_tm.nationcd and t1.indeptcd = rec_tm.deptcd and 
                    intdtno = rec_tm.tdtno and intm6no = rec_tm.tm6no and 
                    to_char(t1.indte, 'YYYYMMDD') = to_char(rec_tm.inoutdte, 'YYYYMMDD') and rownum=1;                          
                end if;     
            elsif (rec_tm.cardtype = '2') then
                if (rec_tm.efamilynm is not null) and (rec_tm.efirstnm is not null) and (rec_tm.emiddlenm is not null) then
                    --utl_file.put_line(flog_handler, 'start checkdup  case name 1 ' || rec_tm.efamilynm|| ' ' ||rec_tm.efirstnm || ' ' ||rec_tm.emiddlenm ||' '||rec_tm.inoutdte);
                    select tmrunno into checkduptmrunno from tmmain t1 where 
                    efamilynm = rec_tm.efamilynm and efirstnm =  rec_tm.efirstnm and emiddlenm =  rec_tm.emiddlenm and 
                    t1.birthdte = rec_tm.birthdte and t1.sex = rec_tm.sex and t1.nationcd = rec_tm.nationcd and t1.outdeptcd = rec_tm.deptcd and
                    outtdtno = rec_tm.tdtno and outtm6no = rec_tm.tm6no and 
                    to_char(t1.outdte, 'YYYYMMDD') = to_char(rec_tm.inoutdte, 'YYYYMMDD') and rownum=1;             
                elsif (rec_tm.efamilynm is not null) and (rec_tm.efirstnm is not null) and (rec_tm.emiddlenm is null) then
                    --utl_file.put_line(flog_handler, 'start checkdup  case name 2 ' || rec_tm.efamilynm|| ' ' ||rec_tm.efirstnm || ' ' ||rec_tm.emiddlenm||' '||rec_tm.inoutdte);
                    select tmrunno into checkduptmrunno from tmmain t1 where 
                    efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm and emiddlenm is null and 
                    t1.birthdte = rec_tm.birthdte and t1.sex = rec_tm.sex and t1.nationcd = rec_tm.nationcd and t1.outdeptcd = rec_tm.deptcd and 
                    outtdtno = rec_tm.tdtno and outtm6no = rec_tm.tm6no and 
                    to_char(t1.outdte, 'YYYYMMDD') = to_char(rec_tm.inoutdte, 'YYYYMMDD') and rownum=1;                         
                elsif (rec_tm.efamilynm is not null) and (rec_tm.efirstnm is null) and (rec_tm.emiddlenm is null) then
                    --utl_file.put_line(flog_handler, 'start checkdup  case name 3 ' || rec_tm.efamilynm|| ' ' ||rec_tm.efirstnm || ' ' ||rec_tm.emiddlenm||' '||rec_tm.inoutdte);
                    select tmrunno into checkduptmrunno from tmmain t1 where 
                    efamilynm = rec_tm.efamilynm and efirstnm is null and emiddlenm is null and 
                    t1.birthdte = rec_tm.birthdte and t1.sex = rec_tm.sex and t1.nationcd = rec_tm.nationcd and t1.outdeptcd = rec_tm.deptcd and 
                    outtdtno = rec_tm.tdtno and outtm6no = rec_tm.tm6no and 
                    to_char(t1.outdte, 'YYYYMMDD') = to_char(rec_tm.inoutdte, 'YYYYMMDD') and rownum=1;                          
                elsif (rec_tm.efamilynm is  null) and (rec_tm.efirstnm is not null) and (rec_tm.emiddlenm is null) then
                    --utl_file.put_line(flog_handler, 'start checkdup  case name 4 ' || rec_tm.efamilynm|| ' ' ||rec_tm.efirstnm || ' ' ||rec_tm.emiddlenm);
                    select tmrunno into checkduptmrunno from tmmain t1 where 
                    efamilynm is null and efirstnm = rec_tm.efirstnm and emiddlenm is null and 
                    t1.birthdte = rec_tm.birthdte and t1.sex = rec_tm.sex and t1.nationcd = rec_tm.nationcd and t1.outdeptcd = rec_tm.deptcd and 
                    outtdtno = rec_tm.tdtno and outtm6no = rec_tm.tm6no and 
                    to_char(t1.outdte, 'YYYYMMDD') = to_char(rec_tm.inoutdte, 'YYYYMMDD') and rownum=1;                         
                end if; 
            end if;
            --utl_file.put_line(flog_handler, '   checkduptmrunno = ' || checkduptmrunno);
            if (checkduptmrunno is not null) then                                    
                utl_file.put_line(file_ut,'Duplicate data '|| rec_tm.efamilynm|| ' ' ||rec_tm.efirstnm || ' ' ||rec_tm.emiddlenm || ' ' ||rec_tm.sex 
                || ' ' ||rec_tm.nationcd || ' ' ||rec_tm.birthdte || ' ' ||rec_tm.tdtno || ' ' ||rec_tm.tm6no || ' ' || to_char(rec_tm.inoutdte, 'YYYYMMDD'));utl_file.fflush(file_ut);
                --insert into pislogdetails values(pldseqno.nextval, rec.filename, 'ERROR DUPLICATE RECORD', buf, sysdate);
                update tm6inout set flagprocess = 'Y' where tm6seqno = rec_tm.tm6seqno;
                continue;
            end if;
      exception when no_data_found then
            checkduptmrunno := null;
      end;
      
    personidtext:='TM6'||rec_tm.tm6seqno;
    begin
        chk_inoutdte :=0;
        if (rec_tm.efamilynm is not null) and (rec_tm.efirstnm is not null) and (rec_tm.emiddlenm is not null) then
            --utl_file.put_line(flog_handler, 'start checkdup  case name 1 ' || rec_tm.efamilynm|| ' ' ||rec_tm.efirstnm || ' ' ||rec_tm.emiddlenm);
            select personid, to_number(to_char(inoutdte, 'YYYYMMDD'))  into personidfordup, chk_inoutdte from immigration where 
            efamilynm = rec_tm.efamilynm and efirstnm =  rec_tm.efirstnm and emiddlenm =  rec_tm.emiddlenm  and 
            nationcd =rec_tm.nationcd and sex = rec_tm.sex and birthdte = rec_tm.birthdte and rownum = 1;                                        
        elsif (rec_tm.efamilynm is not null) and (rec_tm.efirstnm is not null) and (rec_tm.emiddlenm is null) then
            --utl_file.put_line(flog_handler, 'start checkdup  case name 2 ' || rec_tm.efamilynm|| ' ' ||rec_tm.efirstnm || ' ' ||rec_tm.emiddlenm);
            select personid, to_number(to_char(inoutdte, 'YYYYMMDD'))  into personidfordup, chk_inoutdte from immigration where
            efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm and emiddlenm is null and 
            nationcd =rec_tm.nationcd and sex = rec_tm.sex and birthdte = rec_tm.birthdte and rownum = 1;                                          
        elsif (rec_tm.efamilynm is not null) and (rec_tm.efirstnm is null) and (rec_tm.emiddlenm is null) then
            --utl_file.put_line(flog_handler, 'start checkdup  case name 3 ' || rec_tm.efamilynm|| ' ' ||rec_tm.efirstnm || ' ' ||rec_tm.emiddlenm);
            select personid, to_number(to_char(inoutdte, 'YYYYMMDD'))  into personidfordup, chk_inoutdte from immigration where
            efamilynm =rec_tm.efamilynm and efirstnm is null and emiddlenm is null and 
            nationcd =rec_tm.nationcd and sex = rec_tm.sex and birthdte = rec_tm.birthdte and rownum = 1;                                          
        elsif (rec_tm.efamilynm is  null) and (rec_tm.efirstnm is not null) and (rec_tm.emiddlenm is null)   then
            --utl_file.put_line(flog_handler, 'start checkdup  case name 4 ' || namesplit(1)|| ' ' ||namesplit(2) || ' ' ||namesplit(3));
            select personid, to_number(to_char(inoutdte, 'YYYYMMDD'))  into personidfordup, chk_inoutdte from immigration where
            efamilynm is null and efirstnm = rec_tm.efirstnm and emiddlenm is null and 
            nationcd =rec_tm.nationcd and sex = rec_tm.sex and birthdte = rec_tm.birthdte and rownum = 1;                    
       end if;                                    
        tmmain_personid := personidfordup;  
      exception when no_data_found then
            personidfordup := null;
            --GET PERSONID
            --select 'TM6' || tm6excelseq.nextval into personidtext from dual;
            tmmain_personid := personidtext;
      end; 

    datenow:=sysdate;
    
    begin
    permitdays := null;
    if (rec_tm.cardtype='1') and (rec_tm.nationcd <> 'T03') and (rec_tm.visatypecd is not null) then
          select rec_tm.inoutdte + visatype.permittdays -1 into permitdays from visatype
          where visatype.visatypecd = rec_tm.visatypecd and visatype.permittdays > 0;                                    
    end if;
    exception when no_data_found then
    permitdays := null;
    end;    
    
    if personidfordup is null then     
          insert into immigration (personid, tm6no, inoutdte, cardtype, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, 
          visatypecd, visaexpdte, updusr, upddte, updterm, deptcd, convcd, convregno, status, create_by, create_date, update_by, update_date, version, passportexpdte, remark) 
          values(personidtext, rec_tm.tm6no, rec_tm.inoutdte, rec_tm.cardtype, 
          rec_tm.efirstnm, rec_tm.emiddlenm, rec_tm.efamilynm, rec_tm.sex, rec_tm.birthdte, rec_tm.nationcd, rec_tm.tdtcd, rec_tm.tdtno, rec_tm.visatypecd, 
          to_date(nvl(to_char(permitdays, 'YYYYMMDD'), null), 'YYYYMMDD', 'NLS_CALENDAR=GREGORIAN'), rec_tm.creusr, datenow, '192.169.1.12', rec_tm.deptcd,
          rec_tm.convcd, rec_tm.convregno, '0', 'TM6001', datenow, 'TM6001', datenow, 0, rec_tm.passportexpdte, rec_tm.remark); 
    else
          --check indte
          --continue when (to_number(rec_tm.date_import || rec_tm.time) >=chk_inoutdte);
          --utl_file.put_line(flog_handler, 'chk_inoutdte ' || chk_inoutdte); 
          --utl_file.put_line(flog_handler, 'chk rec_tm.date_import || rec_tm.time ' || rec_tm.date_import || rec_tm.time);  
         if to_number(to_char(rec_tm.inoutdte, 'YYYYMMDD')) >= chk_inoutdte then
          --dbms_output.put_line('UPDATE LINE 1 '||PERSONIDTEXT);
          --generate sql for update immigration                                                                                                                                                            
            update immigration set personid =  personidfordup, tm6no = rec_tm.tm6no, inoutdte = rec_tm.inoutdte,
            cardtype = rec_tm.cardtype, efirstnm = rec_tm.efirstnm, emiddlenm = rec_tm.emiddlenm, efamilynm = rec_tm.efamilynm, sex = rec_tm.sex, birthdte = rec_tm.birthdte, 
            nationcd=rec_tm.nationcd, tdtcd = rec_tm.tdtcd, tdtno = rec_tm.tdtno, visatypecd = rec_tm.visatypecd, 
            visaexpdte = to_date(nvl(to_char(permitdays, 'YYYYMMDD'), null), 'YYYYMMDD', 'NLS_CALENDAR=GREGORIAN'), updusr = rec_tm.creusr, 
            upddte = sysdate, updterm =  '192.169.1.12', deptcd = rec_tm.deptcd, 
            imginout = null, convcd = rec_tm.convcd, convregno = rec_tm.convregno, passportexpdte = rec_tm.passportexpdte, remark = rec_tm.remark where personid = personidfordup;    
           end if;
    end if;
    
  if (rec_tm.cardtype='1') then                                   
        insert into tmmain (intm6no, indeptcd, indte, nationcd, inconvcd, inconvregno, efamilynm, efirstnm, emiddlenm, invisatypecd, sex, birthdte, 
        intdtno, increusr, intargetno, inintype, personid, intdtcd, intravcd, invisaexpdte, incredte, incredterm, tmrunno, efsndxnm, elsndxnm, emsndxnm, instatus, typedata, inpassportexpdte, inremark) 
        values (rec_tm.tm6no, rec_tm.deptcd, rec_tm.inoutdte, rec_tm.nationcd,
        rec_tm.convcd, rec_tm.convregno, rec_tm.efamilynm, rec_tm.efirstnm, rec_tm.emiddlenm, rec_tm.visatypecd, rec_tm.sex, rec_tm.birthdte, rec_tm.tdtno,
        rec_tm.creusr, null, 'N', tmmain_personid, rec_tm.tdtcd, '0001', to_date(nvl(to_char(permitdays, 'YYYYMMDD'), null), 'YYYYMMDD', 'NLS_CALENDAR=GREGORIAN'),
        sysdate, '192.169.1.12', personidtext, getcdgsoundex(rec_tm.efirstnm), getcdgsoundex(rec_tm.efamilynm), getcdgsoundex(rec_tm.emiddlenm), '0',rec_tm.typedata, rec_tm.passportexpdte, rec_tm.remark);                                 
  else
        insert into tmmain (outtm6no, outdeptcd, outdte, nationcd, outconvcd, outconvregno, efamilynm, efirstnm, emiddlenm, outvisatypecd, sex, birthdte, 
        outtdtno, outcreusr, outtargetno, outintype, personid, outtdtcd, outtravcd, outvisaexpdte, outcredte, outcredterm, tmrunno, efsndxnm, elsndxnm, emsndxnm, 
        outstatus, typedata, outpassportexpdte, outremark) 
        values (rec_tm.tm6no, rec_tm.deptcd, rec_tm.inoutdte, rec_tm.nationcd,
        rec_tm.convcd, rec_tm.convregno, rec_tm.efamilynm, rec_tm.efirstnm, rec_tm.emiddlenm, rec_tm.visatypecd, rec_tm.sex, rec_tm.birthdte, rec_tm.tdtno,
        rec_tm.creusr, null, 'N', tmmain_personid, rec_tm.tdtcd, '0001', to_date(nvl(to_char(permitdays, 'YYYYMMDD'), null), 'YYYYMMDD', 'NLS_CALENDAR=GREGORIAN'),
        sysdate, '192.169.1.12', personidtext, getcdgsoundex(rec_tm.efirstnm), getcdgsoundex(rec_tm.efamilynm), getcdgsoundex(rec_tm.emiddlenm), '0', rec_tm.typedata, rec_tm.passportexpdte, rec_tm.remark);                 
  end if;
    
    update tm6inout set flagprocess = 'Y' where tm6seqno = rec_tm.tm6seqno;
    totalrow:=totalrow+1;
    cmtrow:=cmtrow+1;
    if cmtrow = 100 then
        --utl_file.put_line(file_ut,sysdateTxt||' Commit:'||totalrow);utl_file.fflush(file_ut);
        commit;
        cmtrow:=0;
    end if;   
 end loop; --cursor
 close c1;
 COMMIT;
 utl_file.put_line(file_ut,'total record Transfer Tm6inout 2 Tmmain :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End Transfer Tm6inout 2 Tmmain .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
  --Exception
     -- when others then
        --utl_file.put_line(file_ut,'Error  :'||rec_fn.t_id);utl_file.fflush(file_ut);
        -- null;--prompt(sqlerrm||'[Re-Gen Error]');
end;


END TF_TM62TMMAIN;
/
  GRANT EXECUTE ON "PIBICSDM2"."TF_TM62TMMAIN" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."TF_TM62TMMAIN" TO "BIOSAADM";
