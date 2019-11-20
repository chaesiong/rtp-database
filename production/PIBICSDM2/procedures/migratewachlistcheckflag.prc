CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEWACHLISTCHECKFLAG" is
tmpvar number;
begin
declare
    sysdatetxt varchar2(25);
    sysdatefile varchar2(8);
    totalrow number(20);
    cmtrow number(20);
    updrow number(20);
    file_ut utl_file.file_type;
    cursor c1  is 
    select * from watchlist where (birthdte is null or birthdte = '0000');
    rec_wl c1%rowtype;
begin
    cmtrow:=0;totalrow:=0;updrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdatetxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdatefile from dual;
    file_ut := utl_file.fopen('LOGS_DIR','logMigrateWatchlistChkFlag'||sysdatefile||'.txt','W');
    utl_file.put_line(file_ut,sysdatetxt||' Start Migrate Watchlist Check Flag .... !!!');     
    open c1;
    loop fetch c1 into rec_wl; exit when c1%notfound; 
        update watchlist set flagcheckpoint = 'Y'  where wlcd = rec_wl.wlcd;
    updrow:=updrow+1;
    totalrow:=totalrow+1;
    cmtrow:=cmtrow+1;
    if cmtrow = 100 then
        utl_file.put_line(file_ut,sysdatetxt||' Commit:'||cmtrow);utl_file.fflush(file_ut);
        commit;
        cmtrow:=0;
    end if;  
    end loop;--Loop Cursor
    close c1; 
    commit;
    utl_file.put_line(file_ut,'Total Update Watchlist  :'||updrow);utl_file.fflush(file_ut);
    utl_file.put_line(file_ut,'Total Repair Watchlist  :'||totalrow);utl_file.fflush(file_ut);
    utl_file.put_line(file_ut,sysdatetxt||' Complete Migrate Watchlist Check Flag  ...!!!!'); 
    utl_file.fclose(file_ut); 
end;

end migratewachlistcheckflag;
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEWACHLISTCHECKFLAG" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEWACHLISTCHECKFLAG" TO "BIOSAADM";
