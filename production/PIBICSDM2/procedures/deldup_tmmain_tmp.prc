CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."DELDUP_TMMAIN_TMP" IS
tmpVar NUMBER;
BEGIN
declare
timenow varchar2(25);
cursor c1 is       
       select tmrunno from tmmain_tmp where tmrunno not in(select maxtmno from (
       select max(tmrunno) as maxtmno, count(*) cntrow, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, indte, outdte, 
       indeptcd, outdeptcd, intdtno, outtdtno, intm6no, outtm6no from tmmain_tmp  group by efirstnm, emiddlenm, efamilynm, sex, birthdte, 
       nationcd, indte, outdte, indeptcd, outdeptcd, intdtno, outtdtno, intm6no, outtm6no));
       rec_tmmain c1%rowtype;
begin
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into timenow from dual;
    dbms_output.put_line(timenow||' Start Process delelte duplicate Tmmain_tmp .... !!!');       
    open c1;
        loop
        fetch c1 into rec_tmmain; exit when c1%notfound;
        --dbms_output.put_line('tmrunno: '||rec_tmmain.tmrunno);
        delete tmmain_tmp where tmrunno=rec_tmmain.tmrunno;
        commit;
        end loop;
    close c1;
    commit;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into timenow from dual;
    dbms_output.put_line(timenow||' Complete Process  delelte duplicate Tmmain_tmp .... !!!');
end;

END DELDUP_TMMAIN_TMP; 
/
  GRANT EXECUTE ON "PIBICSDM2"."DELDUP_TMMAIN_TMP" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."DELDUP_TMMAIN_TMP" TO "BIOSAADM";
