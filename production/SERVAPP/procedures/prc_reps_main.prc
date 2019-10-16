CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."PRC_REPS_MAIN" (
startdate IN varchar2,
enddate IN varchar2
)
AS 
BEGIN
declare

cmtrow number(20);
totalrow number(20);
sdate varchar2(25);
edate varchar2(25);
cursor c1 is
        select t.* from pibicsdm2.REPS_PERSON t
        where t.CREATE_DATE  BETWEEN  to_date( startdate, 'DD/MM/YYYY HH24:MI:SS' ) AND  to_date( enddate, 'DD/MM/YYYY HH24:MI:SS' )
        or t.CREATE_DATE is null;
rec1 c1%rowtype;
cursor c2 is
        select t.* from pibicsdm2.REPS_TM8 t
        where t.CREATE_DATE  BETWEEN  to_date( startdate, 'DD/MM/YYYY HH24:MI:SS' ) AND  to_date( enddate, 'DD/MM/YYYY HH24:MI:SS' )
        or t.CREATE_DATE is null;
rec2 c2%rowtype;
begin
cmtrow:=0;totalrow:=0;
open c1;
 loop fetch c1 into rec1; exit when c1%notfound;     
  INSERT INTO BIOAPPUSR.MSCS_REPS_PERSON
    (FAMILYNM,FIRSTNM,MIDDLENM,SEX,BIRTH_DATE,NATIONAL_SEQNO,OPASSPORTNO,OPASSPORT_DATE,OPASSPORTEXP_DATE,CPASSPORTNO,CPASSPORT_DATE,CPASSPORTEXP_DATE,
    PERMIT_SEQNO,PERMIT_DATE,TM8_SEQNO,TM8NO,CREATE_DATE,CREATE_BY,UPDATE_DATE,UPDATE_BY,VERSION,TM8CHILD_SEQNO,APPVSTS,DOCTYPE,YEAR,PERSONFLAG,VISA_SEQNO,
    VISAEND_DATE,STATUSENTRY,STATUSENTRYDTE,DOC_DATE,DEPT_SEQNO,ZONE_SEQNO)
  VALUES
    (REC1.FAMILYNM,REC1.FIRSTNM,REC1.MIDDLENM,REC1.SEX,REC1.BIRTH_DATE,REC1.NATIONAL_SEQNO,REC1.OPASSPORTNO,REC1.OPASSPORT_DATE,REC1.OPASSPORTEXP_DATE,
    REC1.CPASSPORTNO,REC1.CPASSPORT_DATE,REC1.CPASSPORTEXP_DATE,REC1.PERMIT_SEQNO,REC1.PERMIT_DATE,REC1.TM8_SEQNO,REC1.TM8NO,REC1.CREATE_DATE,
    REC1.CREATE_BY,REC1.UPDATE_DATE,REC1.UPDATE_BY,REC1.VERSION,REC1.TM8CHILD_SEQNO,REC1.APPVSTS,REC1.DOCTYPE,REC1.YEAR,REC1.PERSONFLAG,REC1.VISA_SEQNO,
    REC1.VISAEND_DATE,REC1.STATUSENTRY,REC1.STATUSENTRYDTE,REC1.DOC_DATE,REC1.DEPT_SEQNO,REC1.ZONE_SEQNO);    
    cmtrow:=cmtrow+1;
    totalrow:=totalrow+1;
    cmtrow:=cmtrow+1;
    totalrow:=totalrow+1;
    if cmtrow = 1000 then
       -- utl_file.put_line(file_ut,sysdateTxt||' Commit:'||cmtrow);utl_file.fflush(file_ut);
        commit;
        cmtrow:=0;
    end if;
 end loop; --cursor
 close c1;
 commit; 
 open c2;
  loop fetch c2 into rec2; exit when c2%notfound;     
    INSERT INTO BIOAPPUSR.MSCS_REPS_TM8
        (TM8NO,YEAR,FEES_SEQNO,WRITTEN,PERSONID,FAMILYNM,FIRSTNM,MIDDLENM,NATIONAL_SEQNO,BIRTH_DATE,SEX,AGE,OCC_SEQNO,BIRTH_PLACE,BIRTHCOUNT_SEQNO,
        PASSPORTNO,PASSPORT_DATE,PASSPORTEXP_DATE,PASSPORTISSUEBY,CHILDNO,ADDR,ROAD,TMB_SEQNO,AMP_SEQNO,PV_SEQNO,VISANO,TDT_SEQNO,VISAISSUE,VISA_DATE,
        OPERMIT_SEQNO,ARRIVE_DATE,OPERMIT_DATE,DOCTYPE,PURPOSECOUNT_SEQNO,CONV_SEQNO,LEAVE_DATE,RETURN_DATE,PURPOSE,APPVSTS,DOC_DATE,DEPT_SEQNO,PERMIT_STATUS,
        NEWPERMIT_DATE,REASON_SEQNO,REASONDESC,TM6_SEQNO,ENDPERMIT_DATE,CREATE_DATE,CREATE_BY,UPDATE_DATE,UPDATE_BY,VERSION,OVISATYPE_SEQNO,TODAY_DATE,
        IMGINOUT,TM6NO,APPVSTSBYDATE,APPVSTSBYDEPT_SEQNO,FLAG_BOI,IPADDRESS,UIPADDRESS,T_IDICONCEPT,ZONE_SEQNO,SUFFIX_SEQNO,EXTLIST_SEQNO,MANUALTM8,
        REPSPERSON_SEQNO,TELEPHONE,IMG_PERSON,FLAG_QUEONLINE,PD_SEQNO)
    VALUES
        (REC2.TM8NO,REC2.YEAR,REC2.FEES_SEQNO,REC2.WRITTEN,REC2.PERSONID,REC2.FAMILYNM,REC2.FIRSTNM,REC2.MIDDLENM,REC2.NATIONAL_SEQNO,REC2.BIRTH_DATE,
        REC2.SEX,REC2.AGE,REC2.OCC_SEQNO,REC2.BIRTH_PLACE,REC2.BIRTHCOUNT_SEQNO,REC2.PASSPORTNO,REC2.PASSPORT_DATE,REC2.PASSPORTEXP_DATE,REC2.PASSPORTISSUEBY,
        REC2.CHILDNO,REC2.ADDR,REC2.ROAD,REC2.TMB_SEQNO,REC2.AMP_SEQNO,REC2.PV_SEQNO,REC2.VISANO,REC2.TDT_SEQNO,REC2.VISAISSUE,REC2.VISA_DATE,REC2.OPERMIT_SEQNO,
        REC2.ARRIVE_DATE,REC2.OPERMIT_DATE,REC2.DOCTYPE,REC2.PURPOSECOUNT_SEQNO,REC2.CONV_SEQNO,REC2.LEAVE_DATE,REC2.RETURN_DATE,REC2.PURPOSE,REC2.APPVSTS,
        REC2.DOC_DATE,REC2.DEPT_SEQNO,REC2.PERMIT_STATUS,REC2.NEWPERMIT_DATE,REC2.REASON_SEQNO,REC2.REASONDESC,REC2.TM6_SEQNO,REC2.ENDPERMIT_DATE,REC2.CREATE_DATE,
        REC2.CREATE_BY,REC2.UPDATE_DATE,REC2.UPDATE_BY,REC2.VERSION,REC2.OVISATYPE_SEQNO,REC2.TODAY_DATE,REC2.IMGINOUT,REC2.TM6NO,REC2.APPVSTSBYDATE,REC2.APPVSTSBYDEPT_SEQNO,
        REC2.FLAG_BOI,REC2.IPADDRESS,REC2.UIPADDRESS,REC2.T_IDICONCEPT,REC2.ZONE_SEQNO,REC2.SUFFIX_SEQNO,REC2.EXTLIST_SEQNO,REC2.MANUALTM8,REC2.REPSPERSON_SEQNO,
        REC2.TELEPHONE,REC2.IMG_PERSON,REC2.FLAG_QUEONLINE,REC2.PD_SEQNO);   
        cmtrow:=cmtrow+1;
        totalrow:=totalrow+1;
        cmtrow:=cmtrow+1;
        totalrow:=totalrow+1;
    if cmtrow = 1000 then
       -- utl_file.put_line(file_ut,sysdateTxt||' Commit:'||cmtrow);utl_file.fflush(file_ut);
        commit;
        cmtrow:=0;
    end if;
  end loop; --cursor
 close c2;
 commit; 
end; 
END PRC_REPS_MAIN;

/