CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."PRC_EXT_MAIN" (
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
        select t.* from pibicsdm2.EXT_PERSON t
        where t.CREATE_DATE  BETWEEN  to_date( startdate, 'DD/MM/YYYY HH24:MI:SS' ) AND  to_date( enddate, 'DD/MM/YYYY HH24:MI:SS' )
        or t.CREATE_DATE is null;
rec1 c1%rowtype;
cursor c2 is
        select t.* from pibicsdm2.EXT_EXTENSION t
        where t.CREATE_DATE  BETWEEN  to_date( startdate, 'DD/MM/YYYY HH24:MI:SS' ) AND  to_date( enddate, 'DD/MM/YYYY HH24:MI:SS' )
        or t.CREATE_DATE is null;
rec2 c2%rowtype;
cursor c3 is
        select t.* from pibicsdm2.EXT_EXTENSIONLIST t
        where t.CREATE_DATE  BETWEEN  to_date( startdate, 'DD/MM/YYYY HH24:MI:SS' ) AND  to_date( enddate, 'DD/MM/YYYY HH24:MI:SS' )
        or t.CREATE_DATE is null;
rec3 c3%rowtype;


begin
cmtrow:=0;totalrow:=0;
open c1;
 loop fetch c1 into rec1; exit when c1%notfound;     
  INSERT INTO SERVAPP.MSCS_EXT_PERSON
    (OPASSPORTNO,CPASSPORTNO,EXT_DATE,DOCNO,TM6NO,EFIRSTNM,EMIDDLENM,EFAMILYNM,SEX,BIRTH_DATE,BIRTH_PLACE,NATION_SEQNO,OPASSPORT_PLACE,
    OPASSPORT_DATE,OPASSPORT_EXPDATE,CPASSPORT_PLACE,CPASSPORT_EXPDATE,CPASSPORT_DATE,IN_DATE,CONV_SEQNO,CONVREGNO,FROMCOUNT,DEPT_SEQNO,VISATYPE_SEQNO,
    VISA_EXPDATE,BUILDING,ADDR,ROAD,PV_SEQNO,AMP_SEQNO,TMB_SEQNO,POSTCODE,TEL,REASON_SEQNO,REASON_DAY,APPROVE_STS,PERMIT_DATE,PERSON_STS,EXT_SEQNO,
    FEESLIP_SEQNO,SEQNO,CREATE_BY,CREATE_DATE,UPDATE_BY,UPDATE_DATE,VERSION,UDEPT_SEQNO,PASSPORT_PIC,STATUSEXT,STATUSEXTDTE,RQS_STS,VISATYPESUB_SEQNO,
    SUFFIX_SEQNO)
  VALUES
    (REC1.OPASSPORTNO,REC1.CPASSPORTNO,REC1.EXT_DATE,REC1.DOCNO,REC1.TM6NO,REC1.EFIRSTNM,REC1.EMIDDLENM,REC1.EFAMILYNM,REC1.SEX,REC1.BIRTH_DATE,
    REC1.BIRTH_PLACE,REC1.NATION_SEQNO,REC1.OPASSPORT_PLACE,REC1.OPASSPORT_DATE,REC1.OPASSPORT_EXPDATE,REC1.CPASSPORT_PLACE,REC1.CPASSPORT_EXPDATE,
    REC1.CPASSPORT_DATE,REC1.IN_DATE,REC1.CONV_SEQNO,REC1.CONVREGNO,REC1.FROMCOUNT,REC1.DEPT_SEQNO,REC1.VISATYPE_SEQNO,REC1.VISA_EXPDATE,
    REC1.BUILDING,REC1.ADDR,REC1.ROAD,REC1.PV_SEQNO,REC1.AMP_SEQNO,REC1.TMB_SEQNO,REC1.POSTCODE,REC1.TEL,REC1.REASON_SEQNO,REC1.REASON_DAY,
    REC1.APPROVE_STS,REC1.PERMIT_DATE,REC1.PERSON_STS,REC1.EXT_SEQNO,REC1.FEESLIP_SEQNO,REC1.SEQNO,REC1.CREATE_BY,REC1.CREATE_DATE,REC1.UPDATE_BY,
    REC1.UPDATE_DATE,REC1.VERSION,REC1.UDEPT_SEQNO,REC1.PASSPORT_PIC,REC1.STATUSEXT,REC1.STATUSEXTDTE,REC1.RQS_STS,REC1.VISATYPESUB_SEQNO,REC1.SUFFIX_SEQNO);    
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
    INSERT INTO SERVAPP.MSCS_EXT_EXTENSION
        (DOCNO,EXT_DATE,APPROVE_STS,ACTFLAG,PERMIT_DATE,WAIT_DATE,NO_DATE,CREATE_BY,CREATE_DATE,UPDATE_BY,UPDATE_DATE,VERSION,IPADDRESS,UIPADDRESS)
    VALUES
        (REC2.DOCNO,REC2.EXT_DATE,REC2.APPROVE_STS,REC2.ACTFLAG,REC2.PERMIT_DATE,REC2.WAIT_DATE,REC2.NO_DATE,REC2.CREATE_BY,REC2.CREATE_DATE,REC2.UPDATE_BY,
        REC2.UPDATE_DATE,REC2.VERSION,REC2.IPADDRESS,REC2.UIPADDRESS);   
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
 open c3;
  loop fetch c3 into rec3; exit when c3%notfound;     
    INSERT INTO SERVAPP.MSCS_EXT_EXTENSIONLIST
        (EXT_SEQNO,EXTPERSON_SEQNO,DOC_NO,REASON_SEQNO,EXT_DAY,PASSPORTNO,EXT_DATE,TM6NO,EFIRSTNM,EMIDDLENM,EFAMILYNM,SEX,BIRTH_DATE,BIRTH_PLACE,NATION_SEQNO,
        PASSPORT_PLACE,PASSPORT_DATE,PASSPORT_EXPDATE,IN_DATE,CONV_SEQNO,CONVREGNO,FROMCOUNT_SEQNO,DEPT_SEQNO,VISATYPE_SEQNO,VISA_EXPDATE,BUILDING,ADDR,
        ROAD,PV_SEQNO,AMP_SEQNO,TMB_SEQNO,POSTCODE,TEL,PERSON_STS,ACTFLAG,FINE_SEQNO1,FINE_SEQNO2,FINE_SEQNO3,FINE_SEQNO4,FEESLIP_SEQNO,APPROVE_STS,
        COMMAND_SEQNO,COMMAND_OTH,PERMIT_DATE,APPROVE_REM,WAITCOMMENT_SEQNO,WAITCOMMENT_OTH,WAIT_DATE,NO_DATE,NO_REM,UDEPT_SEQNO,CPASSPORTNO,CREATE_BY,
        CREATE_DATE,UPDATE_BY,UPDATE_DATE,VERSION,SUFFIX_SEQNO,COUNT_SEQNO,OCC_SEQNO,EXTIMG,PASSPORT_PIC,VISA_DATE,OLD_PERMIT_DATE,COM_SEQNO,FACTTYPE,
        RELATIONSHIP,REASON_VISA,REF_PERSON,REF_TEL,REMARK_BL,FINE_NUMBER1,FINE_NUMBER2,FINE_NUMBER3,FINE_NUMBER4,FINE_NUMBER5,FINE_DAY1,FINE_DAY2,
        FINE_DAY3,FINE_DAY4,FINE_DAY5,FINE_REMARK1,FINE_REMARK2,FINE_REMARK3,FINE_REMARK4,FINE_REMARK5,FINE_STS1,FINE_STS2,FINE_STS3,FINE_STS4,FINE_STS5,
        FLAGSYSTEM,EXTPERSONQ_SEQNO,IPADDRESS,UIPADDRESS,VISATYPESUB_SEQNO,FEE_STS,FINE_DATE1,FINE_DATE2,NOTROLE_REM,CANCEL_REM,PROVE_BY,PROVE_ID,
        T_IDICONCEPT,REMARK,ITEMNO,FLAG_QUEONLINE,STATUS_OFFLINE)
     VALUES
        (REC3.EXT_SEQNO,REC3.EXTPERSON_SEQNO,REC3.DOC_NO,REC3.REASON_SEQNO,REC3.EXT_DAY,REC3.PASSPORTNO,REC3.EXT_DATE,REC3.TM6NO,REC3.EFIRSTNM,
        REC3.EMIDDLENM,REC3.EFAMILYNM,REC3.SEX,REC3.BIRTH_DATE,REC3.BIRTH_PLACE,REC3.NATION_SEQNO,REC3.PASSPORT_PLACE,REC3.PASSPORT_DATE,
        REC3.PASSPORT_EXPDATE,REC3.IN_DATE,REC3.CONV_SEQNO,REC3.CONVREGNO,REC3.FROMCOUNT_SEQNO,REC3.DEPT_SEQNO,REC3.VISATYPE_SEQNO,REC3.VISA_EXPDATE,
        REC3.BUILDING,REC3.ADDR,REC3.ROAD,REC3.PV_SEQNO,REC3.AMP_SEQNO,REC3.TMB_SEQNO,REC3.POSTCODE,REC3.TEL,REC3.PERSON_STS,REC3.ACTFLAG,REC3.FINE_SEQNO1,
        REC3.FINE_SEQNO2,REC3.FINE_SEQNO3,REC3.FINE_SEQNO4,REC3.FEESLIP_SEQNO,REC3.APPROVE_STS,REC3.COMMAND_SEQNO,REC3.COMMAND_OTH,REC3.PERMIT_DATE,
        REC3.APPROVE_REM,REC3.WAITCOMMENT_SEQNO,REC3.WAITCOMMENT_OTH,REC3.WAIT_DATE,REC3.NO_DATE,REC3.NO_REM,REC3.UDEPT_SEQNO,REC3.CPASSPORTNO,
        REC3.CREATE_BY,REC3.CREATE_DATE,REC3.UPDATE_BY,REC3.UPDATE_DATE,REC3.VERSION,REC3.SUFFIX_SEQNO,REC3.COUNT_SEQNO,REC3.OCC_SEQNO,REC3.EXTIMG,
        REC3.PASSPORT_PIC,REC3.VISA_DATE,REC3.OLD_PERMIT_DATE,REC3.COM_SEQNO,REC3.FACTTYPE,REC3.RELATIONSHIP,REC3.REASON_VISA,REC3.REF_PERSON,
        REC3.REF_TEL,REC3.REMARK_BL,REC3.FINE_NUMBER1,REC3.FINE_NUMBER2,REC3.FINE_NUMBER3,REC3.FINE_NUMBER4,REC3.FINE_NUMBER5,REC3.FINE_DAY1,REC3.FINE_DAY2,
        REC3.FINE_DAY3,REC3.FINE_DAY4,REC3.FINE_DAY5,REC3.FINE_REMARK1,REC3.FINE_REMARK2,REC3.FINE_REMARK3,REC3.FINE_REMARK4,REC3.FINE_REMARK5,REC3.FINE_STS1,
        REC3.FINE_STS2,REC3.FINE_STS3,REC3.FINE_STS4,REC3.FINE_STS5,REC3.FLAGSYSTEM,REC3.EXTPERSONQ_SEQNO,REC3.IPADDRESS,REC3.UIPADDRESS,REC3.VISATYPESUB_SEQNO,
        REC3.FEE_STS,REC3.FINE_DATE1,REC3.FINE_DATE2,REC3.NOTROLE_REM,REC3.CANCEL_REM,REC3.PROVE_BY,REC3.PROVE_ID,REC3.T_IDICONCEPT,REC3.REMARK,
        REC3.ITEMNO,REC3.FLAG_QUEONLINE,REC3.STATUS_OFFLINE);    
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
 close c3;
 commit; 
end; 
END PRC_EXT_MAIN;

/
  GRANT EXECUTE ON "SERVAPP"."PRC_EXT_MAIN" TO "BIOSAADM";
