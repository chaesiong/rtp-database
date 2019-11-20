CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."PRC_FS_MAIN" 
(
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
        select t.*,case when t.BIRTHDTE is null then null  
        when length(t.BIRTHDTE ) = '4' then to_date(to_char( '01/'|| '01/' || t.BIRTHDTE), 'DD/MM/YYYY')  
        when length(t.BIRTHDTE ) = '8' then to_date(to_char(  '01' || t.BIRTHDTE), 'DD/MM/YYYY')
        when length(t.birthdte) =10 and
        F_DATE2(t.birthdte) =0 then null
        else to_date(t.BIRTHDTE,'DD/MM/YYYY') 
        end as BOD from pibicsdm2.fs_fees t
        where t.CREATE_DATE  BETWEEN  to_date( startdate, 'DD/MM/YYYY HH24:MI:SS' ) AND  to_date( enddate, 'DD/MM/YYYY HH24:MI:SS' )
        or t.CREATE_DATE is null;
rec c1%rowtype;
cursor c2 is
        select t.* from pibicsdm2.fs_feesdetail t
        where t.CREATE_DATE  BETWEEN  to_date( startdate, 'DD/MM/YYYY HH24:MI:SS' ) AND  to_date( enddate, 'DD/MM/YYYY HH24:MI:SS' )
        or t.CREATE_DATE is null;
rec2 c2%rowtype;
cursor c3 is
        select t.* from pibicsdm2.fs_fines t
        where t.CREATE_DATE  BETWEEN  to_date( startdate, 'DD/MM/YYYY HH24:MI:SS' ) AND  to_date( enddate, 'DD/MM/YYYY HH24:MI:SS' )
        or t.CREATE_DATE is null;
rec3 c3%rowtype;
cursor c4 is
        select t.* from pibicsdm2.fs_finesdetail t
        where t.CREATE_DATE  BETWEEN  to_date( startdate, 'DD/MM/YYYY HH24:MI:SS' ) AND  to_date( enddate, 'DD/MM/YYYY HH24:MI:SS' )
        or t.CREATE_DATE is null;
rec4 c4%rowtype;

begin
cmtrow:=0;totalrow:=0;
open c1;
 loop fetch c1 into rec; exit when c1%notfound;     
  INSERT INTO BIOAPPUSR.mscs_fs_fees (VISATYPE_SEQNO,VERSION,UPDATE_IP,UPDATE_DATE,UPDATE_BY,TM6NO,SUFFIX_SEQNO,SLIPTYPE,SEX,PRINTFLAG,
    PASSPORTNO,NATION_SEQNO,INDTE,FLAG_SYSTEM,FEESSTATUS,FEESREMARK,FEESNO,FEESLIPTOTAL,FEESLIPNO,FEESLIPDATE,FEESLIPBOOKNO,
    EMIDDLENM,EFIRSTNM,EFAMILYNM,DEPT_SEQNO,CREATE_IP,CREATE_DATE,CREATE_BY,CONV_SEQNO,CONVREGNO,BIRTHDTE,APPROVE_BY)
  values (rec.VISATYPE_SEQNO,rec.VERSION,rec.UPDATE_IP,rec.UPDATE_DATE,rec.UPDATE_BY,rec.TM6NO,rec.SUFFIX_SEQNO,rec.SLIPTYPE,rec.SEX,rec.PRINTFLAG,
    rec.PASSPORTNO,rec.NATION_SEQNO,rec.INDTE,rec.FLAG_SYSTEM,rec.FEESSTATUS,rec.FEESREMARK,rec.FEESNO,rec.FEESLIPTOTAL,rec.FEESLIPNO,rec.FEESLIPDATE,rec.FEESLIPBOOKNO,
    rec.EMIDDLENM,rec.EFIRSTNM,rec.EFAMILYNM,rec.DEPT_SEQNO,rec.CREATE_IP,rec.CREATE_DATE,rec.CREATE_BY,rec.CONV_SEQNO,rec.CONVREGNO,rec.bod,rec.APPROVE_BY);    
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
    INSERT INTO BIOAPPUSR.fs_feesdetail (VERSION,UPDATE_IP,UPDATE_DATE,UPDATE_BY,PRATE_SEQNO,FEES_SEQNO,FEESLIPAMOUNT,CREATE_IP,
      CREATE_DATE,CREATE_BY)
    values (rec2.VERSION,rec2.UPDATE_IP,rec2.UPDATE_DATE,rec2.UPDATE_BY,rec2.PRATE_SEQNO,rec2.FEES_SEQNO,rec2.FEESLIPAMOUNT,rec2.CREATE_IP,
      rec2.CREATE_DATE,rec2.CREATE_BY);    
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
    INSERT INTO BIOAPPUSR.FS_FINES 
        (FINESNO,FINESLIPNO,FINESLIPBOOKNO,FINESLIPDATE,PRINTFLAG,FINESLIPAMOUNT,CHARGEDOF,CHARGENO,DEPT_SEQNO,PASSPORTNO,TM6NO,EFIRSTNM,
        EMIDDLENM,EFAMILYNM,SEX,BIRTHDTE,NATION_SEQNO,CONV_SEQNO,CONVREGNO,INDTE,VISATYPE_SEQNO,VISAEXPDTE,OUTDTE,FINESTATUS,FINESREMARK,FLAG_SYSTEM,
        CREATE_BY,CREATE_DATE,CREATE_IP,UPDATE_BY,UPDATE_DATE,UPDATE_IP,VERSION,PERMIT_SEQNO,PERMIT_DATE,SLIPTYPE,SUFFIX_SEQNO,TFAMILYNM,TFIRSTNM,STAFF_SEQNO)
    VALUES
        (REC3.FINESNO,REC3.FINESLIPNO,REC3.FINESLIPBOOKNO,REC3.FINESLIPDATE,REC3.PRINTFLAG,REC3.FINESLIPAMOUNT,REC3.CHARGEDOF,REC3.CHARGENO,
        REC3.DEPT_SEQNO,REC3.PASSPORTNO,REC3.TM6NO,REC3.EFIRSTNM,REC3.EMIDDLENM,REC3.EFAMILYNM,REC3.SEX,REC3.BIRTHDTE,REC3.NATION_SEQNO,REC3.CONV_SEQNO,
        REC3.CONVREGNO,REC3.INDTE,REC3.VISATYPE_SEQNO,REC3.VISAEXPDTE,REC3.OUTDTE,REC3.FINESTATUS,REC3.FINESREMARK,REC3.FLAG_SYSTEM,REC3.CREATE_BY,
        REC3.CREATE_DATE,REC3.CREATE_IP,REC3.UPDATE_BY,REC3.UPDATE_DATE,REC3.UPDATE_IP,REC3.VERSION,REC3.PERMIT_SEQNO,REC3.PERMIT_DATE,REC3.SLIPTYPE,
        REC3.SUFFIX_SEQNO,REC3.TFAMILYNM,REC3.TFIRSTNM,REC3.STAFF_SEQNO);    
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
 open c4;
  loop fetch c4 into rec4; exit when c4%notfound;     
    INSERT INTO BIOAPPUSR.FS_FINESDETAIL
        (FINES_SEQNO,PRATE_SEQNO,FINESLIPAMOUNT,OVERSTAYDAY,CREATE_BY,CREATE_DATE,CREATE_IP,UPDATE_BY,UPDATE_DATE,UPDATE_IP,VERSION)
    VALUES
        (REC4.FINES_SEQNO,REC4.PRATE_SEQNO,REC4.FINESLIPAMOUNT,REC4.OVERSTAYDAY,REC4.CREATE_BY,REC4.CREATE_DATE,REC4.CREATE_IP,REC4.UPDATE_BY,
        REC4.UPDATE_DATE,REC4.UPDATE_IP,REC4.VERSION); 
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
 close c4;
 commit; 
end; 
END PRC_FS_MAIN;

/
  GRANT EXECUTE ON "SERVAPP"."PRC_FS_MAIN" TO "BIOSAADM";
