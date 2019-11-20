CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."UNPROCESSOT" (v_estimateyear varchar2, v_estimatemonth varchar2, v_unpseqno Number, v_fwUserid varchar2) IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       UnProcessOT
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        16/09/2011   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     UnProcessOT
      Sysdate:         16/09/2011
      Date and Time:   16/09/2011, 10:24:33, and 16/09/2011 10:24:33
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
otacclogseq number(20);
-- Paramenter
unpseqno number(20);
fwversion number(1);
datenow date;
logflag char(1);
fwUserid varchar(20);
acclogseqno number(20);
accplogseqno number(20);
pc_seqno number(20);

file_ut UTL_FILE.FILE_TYPE;
cursor c1 is
    select * from ot_account where estimateyear = v_estimateyear and estimatemonth = v_estimatemonth;
    rec_ot c1%rowtype;      
begin
    totalrow:=0;
    --set Parameter
    unpseqno:=v_unpseqno;
    fwversion:=0;
    select sysdate into datenow from dual;
    logflag:='A';
    fwUserid := v_fwUserid;
    
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_unProcessOT'||sysdateFile||'.txt','W');
    utl_file.put_line(file_ut,sysdateTxt||' Start Un Process OT .... !!!');utl_file.fflush(file_ut); 
    open c1;
    loop fetch c1 into rec_ot; exit when c1%notfound;
    acclogseqno:= GetSEQ_RUNNO('OT_OTACCOUNTLOG');
    
    insert into ot_accountlog (accountlogseqno, accountseqno, estimateyear, estimatemonth, dept_seqno, 
    flagprocess, confirmuser, create_by, create_date, update_by, update_date, log_flag, log_userid, log_date, version, unpseqno) 
    values (acclogseqno, rec_ot.accountseqno, rec_ot.estimateyear, rec_ot.estimatemonth, rec_ot.dept_seqno, 
    rec_ot.flagprocess, rec_ot.confirmuser, rec_ot.create_by, rec_ot.create_date, rec_ot.update_by, rec_ot.update_date, 
    logflag, fwUserid, datenow, fwversion, unpseqno);
    accplogseqno:=0;
   <<otAcPerson_loop>> FOR accp IN
     (
       select * from ot_accountperson where accountseqno = rec_ot.accountseqno
    )
    LOOP
        accplogseqno := GetSEQ_RUNNO('OT_ACCOUNTPERSONLOG');
    
        insert into ot_accountpersonlog (accpersonlogseqno, accountlogseqno, accpersonseqno, accountseqno, profile_seqno, acpreceive, acpairport, acppercent1, acppercent2, 
        acppercent3, acppercent4, acptax, acploan, acprelation, acpdeath, acpother1, acpother2, acpother3, acpother4, acpother5, acpincome, acprate, otdept_seqno, poslevel_seqno, 
        rank_seqno, otfirstnm, otfamilynm, create_by, create_date, update_by, update_date, log_flag, log_userid, log_date, version) 
        values (accplogseqno, acclogseqno, accp.accpersonseqno, accp.accountseqno, accp.profile_seqno, accp.acpreceive, accp.acpairport,
        accp.acppercent1, accp.acppercent2, accp.acppercent3, accp.acppercent4, accp.acptax, accp.acploan, accp.acprelation, accp.acpdeath, accp.acpother1, 
        accp.acpother2, accp.acpother3, accp.acpother4, accp.acpother5, accp.acpincome, accp.acprate, accp.otdept_seqno, accp.poslevel_seqno,
        accp.rank_seqno, accp.otfirstnm, accp.otfamilynm, accp.create_by, accp.create_date, accp.update_by, accp.update_date, logflag ,fwUserid, datenow, fwversion);
    END LOOP;--Loop For otAcPerson_loop
    
      delete ot_accountpersonlog where accountseqno = rec_ot.accountseqno;
      delete ot_accountlog where accountseqno = rec_ot.accountseqno;
    commit; 
    totalrow:=totalrow+1;
    end loop; --cursor
close c1;
    pc_seqno := 0;
    update wf_process_control set pc_calbill = 'N', pc_tenant = 'N' where pc_month = to_number(rec_ot.estimatemonth) and pc_year=rec_ot.estimateyear;
    commit; 
    <<wf_loop>> FOR wf IN
     (
       select * from wf_process_control where pc_month = to_number(v_estimatemonth) and pc_year= v_estimateyear
    )
    LOOP
        pc_seqno := GetSEQ_RUNNO('WF_PROCESS_CONTROL_LOG'); 
        insert into wf_process_control_log (pc_seqno_log, log_date, log_flag, log_userid, pc_seqno, pc_month, pc_year, pc_meterinput, pc_calbill, 
        actflag, version, create_by, create_date, update_by, update_date, pc_tenant) 
        values (pc_seqno, datenow, 'E', fwUserid, wf.pc_seqno, wf.pc_month, wf.pc_year, wf.pc_meterinput, wf.pc_calbill,
        wf.actflag, wf.version, wf.create_by, wf.create_date, wf.update_by, wf.update_date, wf.pc_tenant);
        commit;
    END LOOP;--Loop For wf_loop
    utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    utl_file.put_line(file_ut,sysdateTxt||' End Un Process OT .... !!!');utl_file.fflush(file_ut);
    utl_file.fclose(file_ut);
    Exception
    when others then
      utl_file.put_line(file_ut,'Error by Un Process OT :');utl_file.fflush(file_ut);
      utl_file.fclose(file_ut);
      null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END UnProcessOT;
/
  GRANT EXECUTE ON "PIBICSDM2"."UNPROCESSOT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."UNPROCESSOT" TO "BIOSAADM";
