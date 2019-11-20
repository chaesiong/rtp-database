CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."BEFORINSCRS" (pvcd varchar2,runningno varchar2,year varchar2) return varchar2 is
tmp varchar2(200);
begin
    begin
            select crsperson_seqno into tmp
            from  crs_person
            where rcno_pvcd = pvcd
            and rcno_runningno = runningno
            and rcno_year = year
            and rescerttype_seqno = 2;
            IF tmp IS NOT NULL THEN
                return 'F';
            ELSE
                return 'T';
            END IF;
    Exception When No_Data_Found Then Null ;
    end;
    return 'F';
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."BEFORINSCRS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."BEFORINSCRS" TO "BIOSAADM";
