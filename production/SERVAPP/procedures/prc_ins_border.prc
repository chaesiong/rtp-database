CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."PRC_INS_BORDER" AS 
  BEGIN
declare
--sysdateTxt varchar2(25);
--sysdateFile varchar2(8);
cmtrow number(20);
totalrow number(20);
--sdate varchar2(25);
--edate varchar2(25);
--sysdateFile varchar2(8);
--file_ut UTL_FILE.FILE_TYPE;

cursor c1 is
    select t.ININTYPE,t.INTARGETNO,t.INRESCERTNO,t.NATIONCD,case when t.BIRTHDTE is null then null  
            when length(t.BIRTHDTE ) = '4' then to_date(to_char( '01/'|| '01/' || t.BIRTHDTE), 'DD/MM/YYYY')  
            when length(t.BIRTHDTE ) = '8' then to_date(to_char(  '01' || t.BIRTHDTE), 'DD/MM/YYYY')
            when length(birthdte) =10 and
            F_DATE2(birthdte) =0 then null
            else to_date(t.BIRTHDTE,'DD/MM/YYYY') 
            end as BIRTHDTE
            ,t.INPASSPORTEXPDTE,t.EFIRSTNM,t.EFAMILYNM,t.EMIDDLENM,
            t.TFIRSTNM,t.TMIDDLENM,t.TFAMILYNM,
            case when t.SEX like 'F' then 2 when t.SEX like 'M' then 1 else null end as sex
            ,t.BIRTHDTE as dob
            from BIOAPPUSR.TMMAIN_MI t;

rec c1%rowtype;

cursor c2 is
    select t.OUTINTYPE,t.OUTTARGETNO,t.OUTRESCERTNO,t.NATIONCD,case when t.BIRTHDTE is null then null  
        when length(t.BIRTHDTE ) = '4' then to_date(to_char( '01/'|| '01/' || t.BIRTHDTE), 'DD/MM/YYYY')  
        when length(t.BIRTHDTE ) = '8' then to_date(to_char(  '01' || t.BIRTHDTE), 'DD/MM/YYYY')
        when length(birthdte) =10 and
        F_DATE2(birthdte) =0 then null
        else to_date(t.BIRTHDTE,'DD/MM/YYYY') 
        end as BIRTHDTE
        ,t.OUTPASSPORTEXPDTE,t.EFIRSTNM,t.EFAMILYNM,t.EMIDDLENM
        ,t.TFIRSTNM,t.TMIDDLENM,t.TFAMILYNM,
        case when t.SEX like 'F' then 2 when t.SEX like 'M' then 1 else null end as sex,
        t.BIRTHDTE as dob
        from BIOAPPUSR.TMMAIN_MI t;

rec2 c2%rowtype;

begin
cmtrow:=0;totalrow:=0;
open c1;
 loop fetch c1 into rec; exit when c1%notfound;     
 INSERT INTO BIOAPPUSR.BORDERDOCUMENTS (DOCTYPE,DOCNO,ISSUECTRY,NAT,DOB,EXPIRYDATE,GIVENNAME,SURNAME,INS_AT,MIDDLENAME,
     GIVENNAME_THAI,MIDDLENAME_THAI,SURNAME_THAI,CALC_DOB,SEX)
  values (rec.ININTYPE,rec.INTARGETNO,rec.INRESCERTNO,rec.NATIONCD,rec.dob,rec.INPASSPORTEXPDTE,rec.EFIRSTNM,rec.EFAMILYNM,sysdate,rec.EMIDDLENM,
    rec.TFIRSTNM,rec.TMIDDLENM,rec.TFAMILYNM,rec.BIRTHDTE,rec.SEX);    
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
 cmtrow:=0;
open c2;
 loop fetch c2 into rec2; exit when c2%notfound;     
 INSERT INTO BIOAPPUSR.BORDERDOCUMENTS (DOCTYPE,DOCNO,ISSUECTRY,NAT,DOB,EXPIRYDATE,GIVENNAME,SURNAME,INS_AT,MIDDLENAME,
  GIVENNAME_THAI,MIDDLENAME_THAI,SURNAME_THAI,CALC_DOB,SEX)
  values (rec2.OUTINTYPE,rec2.OUTTARGETNO,rec2.OUTRESCERTNO,rec2.NATIONCD,rec2.dob,rec2.OUTPASSPORTEXPDTE,rec2.EFIRSTNM,rec2.EFAMILYNM,sysdate,rec2.EMIDDLENM
    ,rec2.TFIRSTNM,rec2.TMIDDLENM,rec2.TFAMILYNM,rec2.BIRTHDTE,rec2.SEX);    
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
END PRC_INS_BORDER;

/
  GRANT EXECUTE ON "SERVAPP"."PRC_INS_BORDER" TO "BIOSAADM";
