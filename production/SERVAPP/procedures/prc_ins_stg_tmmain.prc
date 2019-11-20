CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."PRC_INS_STG_TMMAIN" 
(
  PARAM1 IN VARCHAR2 
) AS 
BEGIN
declare
 cursor c1 is
     select t.EFIRSTNM,t.EMIDDLENM,t.EFAMILYNM,case when t.BIRTHDTE is null then null  
when length(t.BIRTHDTE ) = '4' then to_date(to_char( '01/'|| '01/' || t.BIRTHDTE), 'DD/MM/YYYY')  
when length(t.BIRTHDTE ) = '8' then to_date(to_char(  '01' || t.BIRTHDTE), 'DD/MM/YYYY')
when length(birthdte) =10 and
  F_DATE2(birthdte) =0 then null
else to_date(t.BIRTHDTE,'DD/MM/YYYY') 
end as BIRTHDTE,t.SEX,t.NATIONCD from SERVAPP.TMMAIN_MI t


     ;
rec c1%rowtype;
cmtrow number(20);
totalrow number(20);
begin
cmtrow:=0;totalrow:=0;

open c1;
 loop fetch c1 into rec; exit when c1%notfound; 
     INSERT INTO SERVAPP.PERSON ( FIRST_NAME  ,MIDDLE_NAME ,LAST_NAME ,DATE_OF_BIRTH , SEX  ,BIRTH_COUNTRY)
        values (rec.EFIRSTNM,rec.EMIDDLENM,rec.EFAMILYNM,rec.BIRTHDTE,rec.SEX,rec.NATIONCD);
  cmtrow:=cmtrow+1;
    totalrow:=totalrow+1;
    cmtrow:=cmtrow+1;
    totalrow:=totalrow+1;
    if cmtrow = 1000 then
        --utl_file.put_line(file_ut,sysdateTxt||' Commit:'||cmtrow);utl_file.fflush(file_ut);
        commit;
        cmtrow:=0;
    end if;
 end loop; --cursor
 close c1;
 commit; 
end; 
end PRC_INS_STG_TMMAIN;

/
  GRANT EXECUTE ON "SERVAPP"."PRC_INS_STG_TMMAIN" TO "BIOSAADM";
