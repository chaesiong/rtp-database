CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."INS_EXT1" IS
 
       
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
      Object Name:     INS_EXT1
      Sysdate:         16/3/2011
      Date and Time:   16/3/2011, 13:29:48, and 16/3/2011 13:29:48
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
   
declare
   person_seqno integer;
   extension_seqno integer;
   extensionlist_seqno integer;
   max_extseqno  integer;
   createby varchar(10);
   nation_seqno integer;
   conv_seqno integer;
   dept_seqno integer;
   visatype_seqno integer;
   pv_seqno integer;
   amp_seqno integer;
   tmb_seqno integer;
   udept_seqno integer;
    CURSOR ext IS
      --select * from extension@tmdb where extid >0 and extid <= 10000  order by transdte asc ;
      --transdte between TO_DATE('01-03-2009', 'dd-mm-yyyy') and  TO_DATE('02-03-2009', 'dd-mm-yyyy') 
       select * from extension@tmdb where   TO_CHAR(credte, 'DD-MON-YYYY')  =  TO_CHAR(sysdate-1, 'DD-MON-YYYY')   order by transdte asc ;
       
       --select tmrunno from tmmain@tmdb 
begin
     createby := 'SYSTEM';
       
     
     select   max(ext_seqno) into max_extseqno  from ext_extension;
     
     
    FOR ext_rec in ext
    LOOP
   
    
        if (ext_rec.efirstnm is not null) then
         select max(count_seqno) into nation_seqno from country where countcd = ext_rec.nationcd;
         select max(conv_seqno) into conv_seqno from conveyance where convcd = ext_rec.travcd;
         select max(dept_seqno_c) into dept_seqno from department_mapping where deptcd_o = ext_rec.indeptcd;
         select max(visatype_seqno) into visatype_seqno from visatype where visatypecd = ext_rec.visatypecd;
         select max(pv_seqno) into pv_seqno from province where pvcd = ext_rec.statecd;
         select max(amp_seqno) into amp_seqno from ampur where ampcd = ext_rec.city;
         select max(tmb_seqno) into tmb_seqno from tambon where tmbcd = ext_rec.district;
         select max(dept_seqno_c) into udept_seqno from department_mapping where deptcd_o = ext_rec.deptcd;
       
    
        select runno into extension_seqno from seq_runno where tablenm = 'EXT_EXTENSION';
        -- Insert EXT_EXTENSION
       insert into ext_extension
        (create_by,create_date,update_by,update_date,version,ext_seqno,docno,ext_date,approve_sts,actflag,permit_date,wait_date,no_date) values 
        (createby,SYSDATE,createby,SYSDATE,1,extension_seqno,ext_rec.transno,ext_rec.transdte,ext_rec.resultstatus,ext_rec.status,ext_rec.extexpdte,ext_rec.waitdte,ext_rec.extexpdte);--
       
        select   max(ext_seqno) into max_extseqno  from ext_extension;
        
        -- check EXT_PERSON
        select count_seqno into nation_seqno from country where countcd = ext_rec.nationcd;
          
        select max(extperson_seqno) into person_seqno from ext_person  where (cpassportno = ext_rec.passportno )   and (nation_seqno = nation_seqno) ;
        
        IF person_seqno > 0 THEN
            --dbms_output.put_line(' Delete ' );     
            delete from ext_person   where extperson_seqno = person_seqno;
        ELSE
           -- dbms_output.put_line(' Insert New' );    
           
           select runno into person_seqno from seq_runno where tablenm = 'EXT_PERSON';
           --select EXTPERSON_SEQ.nextval into person_seqno from dual; 
       END IF;
            -- Insert EXT_PERSON
            insert into ext_person
            (create_by,create_date,update_by,update_date,version,extperson_seqno,opassportno,cpassportno,ext_date,docno,tm6no,efirstnm,emiddlenm,efamilynm,sex,birth_date,birth_place,opassport_place,opassport_date,opassport_expdate,cpassport_place,cpassport_date,cpassport_expdate,in_date, convregno,visa_expdate,addr,road,tel,reason_day,permit_date,ext_seqno,nation_seqno,conv_seqno,dept_seqno,visatype_seqno,pv_seqno,amp_seqno,tmb_seqno,approve_sts,person_sts)
            values
            (createby,SYSDATE,createby,SYSDATE,1,person_seqno,ext_rec.passportno,ext_rec.passportno,ext_rec.transdte,ext_rec.transno,ext_rec.tm6no,ext_rec.efirstnm,ext_rec.emiddlenm,ext_rec.elastnm,ext_rec.sex,ext_rec.birthdte,ext_rec.birthplace,ext_rec.passportissue,ext_rec.passportdte,ext_rec.passportexpdte,ext_rec.passportissue,ext_rec.passportdte,ext_rec.passportexpdte,ext_rec.indte,ext_rec.convregno,ext_rec.visaexpdte,ext_rec.addr,ext_rec.road,ext_rec.teleno,ext_rec.extday,ext_rec.extexpdte,max_extseqno,nation_seqno,conv_seqno,dept_seqno,visatype_seqno,pv_seqno,amp_seqno,tmb_seqno,ext_rec.resultstatus,'A');
           
        -- select max(extperson_seqno) into person_seqno from ext_person  where (cpassportno = ext_rec.passportno )   and (nation_seqno = nation_seqno) ;
           
           select runno into extensionlist_seqno from seq_runno where tablenm = 'EXT_EXTENSIONLIST' ;
        --Insert EXT_EXTENSIONLIST
           insert into ext_extensionlist 
            (create_by,create_date,update_by,update_date,version,extlist_seqno,ext_seqno,doc_no,ext_day,passportno,ext_date,tm6no,efirstnm,emiddlenm,efamilynm,sex,birth_date,birth_place,passport_place,passport_date,passport_expdate,in_date,convregno,visa_expdate,addr,road,tel,permit_date,approve_rem,waitcomment_oth,wait_date,no_date ,no_rem,nation_seqno,conv_seqno,dept_seqno,visatype_seqno,pv_seqno,amp_seqno,tmb_seqno,approve_sts,
            extpersonq_seqno,person_sts,actflag,cpassportno,visa_date,flagsystem,udept_seqno)
            values  
            (createby,SYSDATE,createby,SYSDATE,1,extensionlist_seqno,max_extseqno,ext_rec.transno,ext_rec.extday,ext_rec.passportno,ext_rec.transdte, ext_rec.tm6no,ext_rec.efirstnm,ext_rec.emiddlenm,ext_rec.elastnm,ext_rec.sex,ext_rec.birthdte,ext_rec.birthplace,ext_rec.passportissue,ext_rec.passportdte,ext_rec.passportexpdte,ext_rec.indte,ext_rec.convregno,ext_rec.visaexpdte, ext_rec.addr,ext_rec.road,ext_rec.teleno,ext_rec.extexpdte,ext_rec.appremark ,ext_rec.waitremark,ext_rec.waitdte,ext_rec.extexpdte ,ext_rec.reasonreject,nation_seqno,conv_seqno,dept_seqno,visatype_seqno,pv_seqno,amp_seqno,tmb_seqno,ext_rec.resultstatus,
            person_seqno,'A','A',ext_rec.passportno,ext_rec.visaexpdte,'EXT',udept_seqno);
           --dbms_output.put_line(ext_rec.extid || ' udept_seqno' || udept_seqno);     
            
             
        end if;
        update seq_runno set runno = person_seqno+1 where tablenm = 'EXT_PERSON';
        update seq_runno set runno = extension_seqno+1 where tablenm = 'EXT_EXTENSION';
        update seq_runno set runno = extensionlist_seqno+1 where tablenm = 'EXT_EXTENSIONLIST';
        commit;
    END LOOP;
    --dbms_output.put_line(' --> '||person_seqno );     
    update ext_extensionlist 
    set extperson_seqno = extpersonq_seqno
    where extperson_seqno is null;
    commit; 
end;

END INS_EXT1; 
/
  GRANT EXECUTE ON "PIBICSDM2"."INS_EXT1" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."INS_EXT1" TO "BIOSAADM";
