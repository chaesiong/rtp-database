CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."AGK_TESTRUNNO" (v_totalRound IN number) IS
tmpVar NUMBER;
BEGIN
declare
    v_totalRow number(20);
    BEGIN
            FOR v_round IN 1..v_totalRound
            LOOP
                UPDATE WLLOGRERUN SET DEPT_SEQNO = v_round;
                 --dbms_output.put_line(v_round);
                --commit;
            END LOOP;
           
    Exception
    WHEN no_data_found THEN
        dbms_output.put_line('NOT DATA FOUND!');
    WHEN others THEN
        dbms_output.put_line('Error!');
   END;
END AGK_TESTRUNNO;
/
  GRANT EXECUTE ON "PIBICSDM2"."AGK_TESTRUNNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."AGK_TESTRUNNO" TO "BIOSAADM";
