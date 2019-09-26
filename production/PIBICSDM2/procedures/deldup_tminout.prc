CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."DELDUP_TMINOUT" IS
tmpVar NUMBER;
BEGIN
declare
timenow varchar2(25);
cursor c1 is       
        select * from tminout where seqno in (
        select outseqno from tmmain where to_char(outdte, 'yyyymmdd') = '20130417' and outcreusr <> 'PIS001' 
        );
       rec_tmmain c1%rowtype;
begin
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into timenow from dual;
    dbms_output.put_line(timenow||' Start Process delelte duplicate tminout .... !!!');       
    open c1;
        loop
        fetch c1 into rec_tmmain; exit when c1%notfound;
        --dbms_output.put_line('tmrunno: '||rec_tmmain.tmrunno);
        delete tminout where seqno=rec_tmmain.seqno;
        commit;
        end loop;
    close c1;
    commit;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into timenow from dual;
    dbms_output.put_line(timenow||' Complete Process  delelte duplicate tminout.... !!!');
end;

END DELDUP_TMINOUT;
/
