CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."INS_EXT2" IS
 
       
       --select tmrunno from tmmain@tmdb 
/******************************************************************************
   NAME:       INS_EXT1
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        16/3/2011          1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     INS_EXT2 update  extension
      Sysdate:         16/3/2011
      Date and Time:   16/3/2011, 13:29:48, and 16/3/2011 13:29:48
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
   
/*<TOAD_FILE_CHUNK>*/ 
declare 
   person_seqno integer;
   extseqno  integer;
   extlistseqno  integer;
   extpersonseqno integer;
   createby varchar(10);
   nationseqno integer;
   convseqno integer;
   deptseqno integer;
   udeptseqno integer;
   visatypeseqno integer;
   pvseqno integer;
   ampseqno integer;
   tmbseqno integer; 
   
    CURSOR ext IS
       select * from extension@tmdb  where     TO_CHAR(upddte, 'DD-MON-YYYY')  =  TO_CHAR(sysdate-1, 'DD-MON-YYYY')    ;
begin 
     createby := 'SYSTEM';
     
    
    FOR ext_rec in ext
    LOOP     
         select max(count_seqno) into nationseqno from country where countcd = ext_rec.nationcd;
         select max(conv_seqno) into convseqno from conveyance where convcd = ext_rec.travcd;
          
         select max(visatype_seqno) into visatypeseqno from visatype where visatypecd = ext_rec.visatypecd;
         select max(pv_seqno) into pvseqno from province where pvcd = ext_rec.statecd;
         select max(amp_seqno) into ampseqno from ampur where ampcd = ext_rec.city;
         select max(tmb_seqno) into tmbseqno from tambon where tmbcd = ext_rec.district;
          select max(dept_seqno_c) into udeptseqno from department_mapping where deptcd_o = ext_rec.deptcd;
          select max(dept_seqno_c) into deptseqno from department_mapping where deptcd_o = ext_rec.indeptcd;
       
        select max( extlist_seqno ), max(ext_seqno),max(extperson_seqno) into extlistseqno,extseqno,extpersonseqno  from ext_extensionlist where passportno = ext_rec.passportno and nation_seqno = nation_seqno and doc_no =ext_rec.transno and ext_date = ext_rec.transdte and tm6no = ext_rec.tm6no ;
        -- Update   EXT_EXTENSIONLIST  
        update ext_extensionlist
        set update_by=createby,update_date=SYSDATE,version=1,doc_no=ext_rec.transno,ext_day=ext_rec.extday,passportno=ext_rec.passportno,ext_date=ext_rec.transdte,
        tm6no=ext_rec.tm6no,efirstnm=ext_rec.efirstnm,emiddlenm=ext_rec.emiddlenm,efamilynm=ext_rec.elastnm,sex=ext_rec.sex,birth_date=ext_rec.birthdte,birth_place=ext_rec.birthplace,
        passport_place=ext_rec.passportissue,passport_date=ext_rec.passportdte,passport_expdate = ext_rec.passportexpdte,in_date=ext_rec.indte,convregno=ext_rec.convregno,visa_expdate=ext_rec.visaexpdte,
        addr=ext_rec.addr,road=ext_rec.road,tel=ext_rec.teleno,permit_date=ext_rec.extexpdte,approve_rem=ext_rec.appremark,waitcomment_oth=ext_rec.waitremark,wait_date=ext_rec.waitdte,no_date=ext_rec.extexpdte,
        no_rem=ext_rec.reasonreject,nation_seqno=nationseqno,conv_seqno=convseqno,dept_seqno=deptseqno,visatype_seqno=visatypeseqno,pv_seqno=pvseqno,amp_seqno=ampseqno,tmb_seqno=tmbseqno,
        approve_sts=ext_rec.resultstatus,cpassportno=ext_rec.passportno,visa_date=ext_rec.visaexpdte,udept_seqno = udeptseqno
        where (extlist_seqno =  extlistseqno);
         --dbms_output.put_line(' 1..............seqno --> '||extlistseqno ||'..........indept '||ext_rec.indeptcd||' --> '||deptseqno);    
        -- Update   EXT_EXTENSION
        update  ext_extension
        set update_by=createby,update_date=SYSDATE,version=1,docno=ext_rec.transno,ext_date=ext_rec.transdte,
             approve_sts = ext_rec.resultstatus, actflag = ext_rec.status, permit_date = ext_rec.extexpdte, wait_date = ext_rec.waitdte, no_date = ext_rec.extexpdte
        where ext_seqno= extseqno;
    
        --select  extperson_seqno  into extpersonseqno  from ext_person  where cpassportno = ext_rec.passportno and nation_seqno = nation_seqno;
        -- Upate   EXT_PERSON
        update  ext_person set 
            update_by=createby,update_date=SYSDATE,version=1,opassportno=ext_rec.passportno,cpassportno = ext_rec.passportno,ext_date=ext_rec.transdte,docno=ext_rec.transno,tm6no=ext_rec.tm6no,
            efirstnm=ext_rec.efirstnm,emiddlenm=ext_rec.emiddlenm,efamilynm=ext_rec.elastnm,sex=ext_rec.sex,birth_date=ext_rec.birthdte,birth_place=ext_rec.birthplace,opassport_place = ext_rec.passportissue,opassport_date=ext_rec.passportdte,opassport_expdate=ext_rec.passportexpdte,
            cpassport_place = ext_rec.passportissue,cpassport_date=ext_rec.passportdte,cpassport_expdate=ext_rec.passportexpdte,in_date=ext_rec.indte,convregno=ext_rec.convregno,visa_expdate=ext_rec.visaexpdte,
            addr=ext_rec.addr,road =ext_rec.road ,tel = ext_rec.teleno,reason_day = ext_rec.extday,permit_date=ext_rec.extexpdte,nation_seqno=nation_seqno,conv_seqno=conv_seqno,
            dept_seqno=dept_seqno,visatype_seqno=visatype_seqno,pv_seqno=pv_seqno,amp_seqno=amp_seqno,tmb_seqno=tmb_seqno
        where extperson_seqno = extpersonseqno;
    END LOOP;
    commit;
  
end;

END INS_EXT2; 
/
