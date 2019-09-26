CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEFNADDRESS90" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       migrateFnAddress90
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        23/10/2011   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     migrateFnAddress90
      Sysdate:         23/10/2011
      Date and Time:   23/10/2011, 20:19:39, and 23/10/2011 20:19:39
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
cmtrow number(20);
fnpersonseq number(20);
fnaddressseq number(20);
datenow timestamp(6);
docdatefn number;
checkmaster varchar(10);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    select t_id,passportno, substr(replace(trim(tm6no),' ',''),1,7) tm6no, nameboi(firstname,'L') efamilynm, nameboi(firstname,'M') emiddlenm, nameboi(firstname,'F') efirstnm,
    get_birthdte(dateofbirth) birthdte, get_NationSeqno(citizencountry) nation_seqno, decode(gender, '1', 'M', '2', 'F', NULL)  sex, kindofvisa visatype_seqno,
    get_extarriveby(arriveby) conv_seqno, arrivaldate, to_date(get_MigrateDateExt(replace(arrivaldate, '/','-')), 'yyyy-mm-dd') indte, addressinthailand || ' '||amphoe || ' '||tambol addr ,pv_seqno, 
    get_seqbyaddress(tambol, amphoe, 'A') amp_seqno, get_seqbyaddress(tambol, amphoe, 'T') tmb_seqno,street,tel,
    to_date(get_MigrateDateExt(formdate), 'yyyy-mm-dd') docdate,
    replace(get_birthdte90(formdate),'-','') chkdocdate,to_number(pv_seqno),
    to_date(get_MigrateDateExt(formdate), 'yyyy-mm-dd') + 90 next_date
    from extension90_tmp where passportno = 'MWD031540' and t_id is not null;
    --where transactiontype ='44';  
    --where t_id = '124158';
    rec_fn c1%rowtype;  
begin
    cmtrow:=0;totalrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;

    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_migrateFnAddress90.txt','W');
    utl_file.put_line(file_ut,sysdateTxt||' Start Transfer migrate Fn_Address90 .... !!!');utl_file.fflush(file_ut);
    open c1;
    loop fetch c1 into rec_fn; exit when c1%notfound;
    --utl_file.put_line(file_ut,sysdateTxt||' fn_person efamilynm:'||rec_fn.efamilynm|| ' efirstnm:'|| rec_fn.efirstnm ||' emiddlenm:'||
    --' nation_seqno:'||rec_fn.nation_seqno||' sex:'||rec_fn.sex||' sex:'||rec_fn.sex||' birthdte:'||rec_fn.birthdte );utl_file.fflush(file_ut);
    --check master fn_person
   checkmaster:='FOUND';
   begin
 
    if  (rec_fn.efirstnm is not null)  then
        select fnperson_seqno into fnpersonseq from fn_person where 
        nation_seqno = rec_fn.nation_seqno and passportno = rec_fn.passportno  and create_by like 'SYSTEM90%' and rownum = 1;                                                              
    else
         select fnperson_seqno into fnpersonseq from fn_person where 
         nation_seqno = rec_fn.nation_seqno and passportno = rec_fn.passportno  and create_by like 'SYSTEM90%' and rownum = 1;
    end if; 
    --exception when no_data_found then
    --    fnpersonseq:= GetSEQ_RUNNO('FN_PERSON');
    --    checkmaster:='NOTFOUND';
        --utl_file.put_line(file_ut,sysdateTxt||' GetSEQ_RUNNO checkmaster: '||checkmaster);utl_file.fflush(file_ut);
    end; 
 
 
    datenow:=sysdate;
    if checkmaster = 'NOTFOUND' then
        utl_file.put_line(file_ut,sysdateTxt||' INSERT FN_PERSON fnpersonseq:'||fnpersonseq);utl_file.fflush(file_ut);
       /* insert into fn_person (
        fnperson_seqno, passportno, tm6no, 
        efamilynm, emiddlenm, efirstnm, 
        birthdate, nation_seqno, sex, 
        visatype_seqno, indte, conv_seqno, 
        addr, pv_seqno, amp_seqno, 
        tmb_seqno, docdate, create_date, 
        create_by, update_date, update_by, version, next_date) 
        values (
        fnpersonseq, rec_fn.passportno, rec_fn.tm6no, 
        rec_fn.efamilynm, rec_fn.emiddlenm, rec_fn.efirstnm, 
        rec_fn.birthdte, rec_fn.nation_seqno, rec_fn.sex, 
        rec_fn.visatype_seqno, rec_fn.indte, rec_fn.conv_seqno, rec_fn.addr, rec_fn.pv_seqno, rec_fn.amp_seqno, 
        rec_fn.tmb_seqno, rec_fn.docdate, datenow, 'SYSTEM90DAYS', datenow, 'SYSTEM90DAYS', 0, rec_fn.next_date);*/
    else
        begin
            select to_number(to_char(docdate, 'YYYYMMDD')) into docdatefn from fn_person where fnperson_seqno=fnpersonseq;
        end;
        --utl_file.put_line(file_ut,sysdateTxt||' UPDATE FN_PERSON docdatefn: '||docdatefn);utl_file.fflush(file_ut);
        --utl_file.put_line(file_ut,sysdateTxt||' UPDATE FN_PERSON rec_fn.chkdocdate: '||rec_fn.chkdocdate);utl_file.fflush(file_ut);
        
        if rec_fn.chkdocdate >= docdatefn then 
            --utl_file.put_line(file_ut,sysdateTxt||' UPDATE FN_PERSON REAL: '||docdatefn);utl_file.fflush(file_ut);
            update fn_person set passportno = rec_fn.passportno, tm6no = rec_fn.tm6no, efamilynm = rec_fn.efamilynm,
            emiddlenm = rec_fn.emiddlenm, efirstnm = rec_fn.efirstnm, birthdate = rec_fn.birthdte, nation_seqno  = rec_fn.nation_seqno, sex = rec_fn.sex,
            visatype_seqno = rec_fn.visatype_seqno, indte = rec_fn.indte, conv_seqno = rec_fn.conv_seqno, 
            addr = rec_fn.addr, pv_seqno = rec_fn.pv_seqno, amp_seqno = rec_fn.amp_seqno,
            tmb_seqno = rec_fn.tmb_seqno, docdate = rec_fn.docdate, create_date = datenow, create_by = 'SYSTEM90DAYSED', update_date = datenow, update_by = 'SYSTEM90DAYSED',
            version = '0', next_date = rec_fn.next_date where fnperson_seqno = fnpersonseq;
        end if;
    end if;
    
    /*fnaddressseq:=GetSEQ_RUNNO('FN_ADDRESS90');
    insert into fn_address90 (andd_seqno, passportno, tm6no, efamilynm, emiddlenm, efirstnm, birthdate, nation_seqno, sex, visatype_seqno, indte, conv_seqno, 
    addr, pv_seqno, amp_seqno, tmb_seqno, docdate, fnperson_seqno, create_date, create_by, update_date, update_by, version) 
    values (fnaddressseq, rec_fn.passportno, rec_fn.tm6no, rec_fn.efamilynm, rec_fn.emiddlenm, rec_fn.efirstnm, rec_fn.birthdte, rec_fn.nation_seqno,
    rec_fn.sex, rec_fn.visatype_seqno, rec_fn.indte, rec_fn.conv_seqno, rec_fn.addr, rec_fn.pv_seqno, rec_fn.amp_seqno,
    rec_fn.tmb_seqno, rec_fn.docdate, fnpersonseq, datenow, 'SYSTEM90DAYS', datenow, 'SYSTEM90DAYS', 0);*/

    totalrow:=totalrow+1;
    cmtrow:=cmtrow+1;
    if cmtrow = 100 then
        utl_file.put_line(file_ut,sysdateTxt||' Commit:'||totalrow);utl_file.fflush(file_ut);
        commit;
        cmtrow:=0;
    end if;   
 end loop; --cursor
 close c1;
 COMMIT;
 utl_file.put_line(file_ut,'total record Transfer migrate extension90 :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End Transfer migrate extension90 .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
  --Exception
     -- when others then
        --utl_file.put_line(file_ut,'Error  :'||rec_fn.t_id);utl_file.fflush(file_ut);
        -- null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END migrateFnAddress90; 
/
