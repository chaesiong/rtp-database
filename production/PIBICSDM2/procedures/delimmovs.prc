CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."DELIMMOVS" IS
tmpVar NUMBER;
BEGIN
declare
   begin
   
   DELETE FROM immoverstay WHERE IOVSEQNO 
        IN(
        select ORG.IOVSEQNO
        from immoverstay ORG
        where 
        ORG.PERSONID IN (select personid from immoverstay GROUP BY personid HAVING COUNT('X') > 1)
        AND IOVSEQNO NOT IN(SELECT MAX(FOO.IOVSEQNO) FROM immoverstay FOO GROUP BY FOO.personid HAVING COUNT('X') > 1)
    );
        commit;
   END;
    
END DELIMMOVS;
/
