CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."DELDUP_PROCESSFINES" IS
tmpVar NUMBER;

BEGIN
declare
timenow varchar2(25);
cursor c1 is       

        select efamilynm, efirstnm, emiddlenm, sex, nationcd, birthdte, Count('X') cnt, to_char(max(inoutdte), 'YYYYMMDDHH24MI') maxinoutdte, min(tmovsseqno) mintmovsseqno
        from processfines
        group by efamilynm, efirstnm, emiddlenm, sex, nationcd, birthdte
        having count('X') > 1;
        
       rec_tmmain c1%rowtype;
begin
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into timenow from dual;
    --dbms_output.put_line(timenow||' Start Process delelte duplicate Tmmain_tmp .... !!!');       
    open c1;
        loop
        fetch c1 into rec_tmmain; exit when c1%notfound;
        
            delete processfines where efamilynm||efirstnm||emiddlenm = rec_tmmain.efamilynm||rec_tmmain.efirstnm||rec_tmmain.emiddlenm and sex = rec_tmmain.sex 
            and nationcd = rec_tmmain.nationcd and birthdte = rec_tmmain.birthdte and to_char(inoutdte, 'YYYYMMDDHH24MI') <>  rec_tmmain.maxinoutdte;
            IF SQL%NOTFOUND THEN
                delete processfines where tmovsseqno = rec_tmmain.mintmovsseqno;
            END IF;
        
            commit;
        end loop;
    close c1;
    commit;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into timenow from dual;
    --dbms_output.put_line(timenow||' Complete Process  delelte duplicate Tmmain_tmp .... !!!');
end;

END DELDUP_PROCESSFINES;
/
  GRANT EXECUTE ON "PIBICSDM2"."DELDUP_PROCESSFINES" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."DELDUP_PROCESSFINES" TO "BIOSAADM";
