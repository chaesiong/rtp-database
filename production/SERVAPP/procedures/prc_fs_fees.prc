CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."PRC_FS_FEES" 
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
select b.* from (select distinct t.* from pibicsdm2.fs_fees t,BIOAPPUSR.mscs_fs_fees a
where  t.FEES_SEQNO <> a.FEES_SEQNO) b
where b.CREATE_DATE  BETWEEN  to_date( startdate, 'DD/MM/YYYY HH24:MI:SS' ) AND  to_date( enddate, 'DD/MM/YYYY HH24:MI:SS' )
        or b.CREATE_DATE is null;
rec c1%rowtype;


begin
cmtrow:=0;totalrow:=0;
open c1;
 loop fetch c1 into rec; exit when c1%notfound;     
 INSERT INTO BIOAPPUSR.mscs_fs_fees (FEES_SEQNO,VISATYPE_SEQNO,VERSION,UPDATE_IP,UPDATE_DATE,UPDATE_BY,TM6NO,SUFFIX_SEQNO,SLIPTYPE,SEX,PRINTFLAG,
    PASSPORTNO,NATION_SEQNO,INDTE,FLAG_SYSTEM,FEESSTATUS,FEESREMARK,FEESNO,FEESLIPTOTAL,FEESLIPNO,FEESLIPDATE,FEESLIPBOOKNO,
    EMIDDLENM,EFIRSTNM,EFAMILYNM,DEPT_SEQNO,CREATE_IP,CREATE_DATE,CREATE_BY,CONV_SEQNO,CONVREGNO,BIRTHDTE,APPROVE_BY)
  values (rec.FEES_SEQNO,rec.VISATYPE_SEQNO,rec.VERSION,rec.UPDATE_IP,rec.UPDATE_DATE,rec.UPDATE_BY,rec.TM6NO,rec.SUFFIX_SEQNO,rec.SLIPTYPE,rec.SEX,rec.PRINTFLAG,
    rec.PASSPORTNO,rec.NATION_SEQNO,rec.INDTE,rec.FLAG_SYSTEM,rec.FEESSTATUS,rec.FEESREMARK,rec.FEESNO,rec.FEESLIPTOTAL,rec.FEESLIPNO,rec.FEESLIPDATE,rec.FEESLIPBOOKNO,
    rec.EMIDDLENM,rec.EFIRSTNM,rec.EFAMILYNM,rec.DEPT_SEQNO,rec.CREATE_IP,rec.CREATE_DATE,rec.CREATE_BY,rec.CONV_SEQNO,rec.CONVREGNO,
    case when rec.BIRTHDTE is null then null  
        when length(rec.BIRTHDTE ) = '4' then to_date(to_char( '01/'|| '01/' || rec.BIRTHDTE), 'DD/MM/YYYY')  
        when length(rec.BIRTHDTE ) = '8' then to_date(to_char(  '01' || rec.BIRTHDTE), 'DD/MM/YYYY')
        when length(rec.BIRTHDTE) =10 and
        F_DATE2(rec.BIRTHDTE) =0 then null
        else to_date(rec.BIRTHDTE,'DD/MM/YYYY') 
        end,rec.APPROVE_BY);    
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


end; 
END PRC_FS_FEES;

/
  GRANT EXECUTE ON "SERVAPP"."PRC_FS_FEES" TO "BIOSAADM";
