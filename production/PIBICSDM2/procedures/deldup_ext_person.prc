CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."DELDUP_EXT_PERSON" IS
tmpVar NUMBER;
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(20);
timenow varchar2(25);
totalrow number(20);
file_ut UTL_FILE.FILE_TYPE;
cursor c1 is       
       select * from (
        select nation_seqno, opassportno,create_by,  count('X') cnt, max(extperson_seqno) maxtm, min(extperson_seqno) mintm from ext_person 
        where create_by in('ICPEXT','SYSTEM','BOISYSTEM') and opassportno not in( select a.OPASSPORTNO from ext_person a, EXT_MOVESTAMP b 
        where a.EXTPERSON_SEQNO = b.EXTPERSON_SEQNO) and opassportno is not null --and nation_seqno is not null 
        group by nation_seqno, opassportno,create_by) where cnt = 2 ;
       rec_person c1%rowtype;
begin
     totalrow:=0;
     select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
     select to_char(sysdate,'YYYYMMDDHH24MI') into sysdateFile from dual;
     file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_Deldup_ext_person'||sysdateFile||'.txt','W');
     utl_file.put_line(file_ut,sysdateTxt||' Start migrate duplicate data pibics@Extperson .... !!!');utl_file.fflush(file_ut);    
    open c1;
        loop
        fetch c1 into rec_person; exit when c1%notfound;
        <<itemTm_loop>> FOR person IN
            (
                select * from ext_person where extperson_seqno = rec_person.mintm
            )
            LOOP           
                delete ext_person where extperson_seqno = person.extperson_seqno;
                totalrow:=totalrow+1;
            END LOOP
        commit;
        end loop;
    close c1;
    commit;
     utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
     select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
     utl_file.put_line(file_ut,sysdateTxt||' End Process  migrate duplicate data pibics@Extperson .... !!!');utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
end;

END DELDUP_EXT_PERSON;
/
  GRANT EXECUTE ON "PIBICSDM2"."DELDUP_EXT_PERSON" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."DELDUP_EXT_PERSON" TO "BIOSAADM";
