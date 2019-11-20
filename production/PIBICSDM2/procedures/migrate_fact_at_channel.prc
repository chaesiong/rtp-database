CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATE_FACT_AT_CHANNEL" IS
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is

            select  to_date(to_char(inoutdate,'yyyymmdd'),'yyyymmdd') inoutdate,dept_seqno,
            sum(decode((case when chkpointno = 'G09' or chkpointno = 'G10' or chkpointno = 'G11' or chkpointno = 'G12'  then 1 end),null,0,1)) IN_EAST,
            sum(decode((case when chkpointno = 'G13' or chkpointno = 'G14' or chkpointno = 'G15' or chkpointno = 'G16'  then 1 end),null,0,1)) IN_WEST,
            sum(decode((case when chkpointno = 'G01' or chkpointno = 'G02' or chkpointno = 'G03' or chkpointno = 'G04'  then 1 end),null,0,1)) OUT_EAST,
            sum(decode((case when chkpointno = 'G05' or chkpointno = 'G06' or chkpointno = 'G07' or chkpointno = 'G08'  then 1 end),null,0,1)) OUT_WEST
            from vw_tmonline 
            where
             TO_CHAR(INOUTDATE, 'yyyymmdd') =TO_CHAR(TRUNC(SYSDATE-1), 'yyyymmdd')
             --TO_CHAR(INOUTDATE, 'yyyymmdd') between '20180101' and '20180304'     
            group by to_date(to_char(inoutdate,'yyyymmdd'),'yyyymmdd') ,dept_seqno
            order by inoutdate;
   
    recs c1%rowtype;
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('PISCES_DIR','log_MIGRATE_FACT_AT_CHANNEL'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start MIGRATE_FACT_AT_CHANNEL .... !!!');utl_file.fflush(file_ut);
 open c1;
 loop fetch c1 into recs; exit when c1%notfound;

INSERT INTO FACT_ATCHANNEL (AT_SEQNO, INOUTDATE, DEPT_SEQNO, IN_EAST, IN_WEST, OUT_EAST, OUT_WEST) 
VALUES ( AT_SEQNO.nextval, recs.inoutdate, recs.DEPT_SEQNO, recs.IN_EAST, recs.IN_WEST, recs.OUT_EAST, recs.OUT_WEST);    

   totalrow:=totalrow+1;
   commitrow:=commitrow+1;
   if commitrow = 30 then
    commitrow:=0;
    --utl_file.put_line(file_ut,sysdateTxt||' Commit Rows'||totalrow);utl_file.fflush(file_ut);
    commit;
   end if;
 end loop; --cursor
 close c1;
 commit;
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End MIGRATE_FACT_AT_CHANNEL .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 /*Exception
  when others then
     utl_file.put_line(file_ut,'Error by tmrunno :'||rec_tm.tmrunno);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');*/
end;

END MIGRATE_FACT_AT_CHANNEL;
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATE_FACT_AT_CHANNEL" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATE_FACT_AT_CHANNEL" TO "BIOSAADM";
