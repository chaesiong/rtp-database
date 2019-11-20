CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."UPDATEIPEXTTENSIONLIST" IS
tmpVar NUMBER;

BEGIN
 declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);

file_ut UTL_FILE.FILE_TYPE;
cursor c1 is

select b.extlist_seqno,a.ipaddress
from ext_extension a,ext_extensionlist b 
where a.ext_seqno = b.ext_seqno
and a.ipaddress is not null  
and b.ipaddress is null 
and to_char(b.create_date,'dd/mm/yyyy') =to_char(sysdate,'dd/mm/yyyy') ;

    recs c1%rowtype;
begin
 totalrow:=0;
 commitrow:=0;
 
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('PISCES_DIR','log_FnDepartmentLevel'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start update department level fn statictispibics .... !!!');utl_file.fflush(file_ut);
 open c1;
 loop fetch c1 into recs; exit when c1%notfound;

 UPDATE Ext_extensionlist set ipaddress = recs.IPADDRESS where extlist_seqno =  recs.extlist_seqno ; 
                
   totalrow:=totalrow+1;
   commitrow:=commitrow+1;
   if commitrow = 1000 then
    commitrow:=0;
    --utl_file.put_line(file_ut,sysdateTxt||' Commit Rows'||totalrow);utl_file.fflush(file_ut);
    commit;
   end if;
 end loop; --cursor
 close c1;
 commit;
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End update department level fn statictispibics .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
/*Exception
  when others then
     utl_file.put_line(file_ut,'Error by tmrunno :'||rec_tm.tmrunno);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;
    --prompt(sqlerrm||'[Re-Gen Error]');*/
end;
END UpdateIpExttensionList;
/
  GRANT EXECUTE ON "PIBICSDM2"."UPDATEIPEXTTENSIONLIST" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."UPDATEIPEXTTENSIONLIST" TO "BIOSAADM";
