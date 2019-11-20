CREATE TABLE "PIBICSDM2"."COUNTRY" 
   (	"COUNT_SEQNO" NUMBER, 
	"COUNTCD" CHAR(3 CHAR), 
	"COUNTTNM" VARCHAR2(60 CHAR), 
	"COUNTENM" VARCHAR2(60 CHAR), 
	"NATIONTNM" VARCHAR2(60 CHAR), 
	"NATIONENM" VARCHAR2(60 CHAR), 
	"CONTINENTCD" CHAR(2 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"ABBCOUNT" VARCHAR2(3 CHAR), 
	"VISAFLAG" VARCHAR2(1 CHAR), 
	"HEALTHCTL" VARCHAR2(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"CONTINENT_SEQNO" NUMBER, 
	"SALARY" NUMBER(10,2), 
	"RPT_SORT" NUMBER, 
	"STATUS_APEC" CHAR(1 CHAR), 
	"FLAGVISARUN" CHAR(4 CHAR), 
	"PCSVISARUN" VARCHAR2(4 CHAR), 
	"COUNTCHNNM" NVARCHAR2(60)
   ) ;
  ALTER TABLE "PIBICSDM2"."COUNTRY" ADD CONSTRAINT "COUNTRY_PK" PRIMARY KEY ("COUNT_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."COUNTRY" ADD CONSTRAINT "COUNTRY_U01" UNIQUE ("COUNTCD")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."COUNTRY" ADD CONSTRAINT "COUNTRY_U02" UNIQUE ("COUNTTNM")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."COUNTRY" ADD CONSTRAINT "COUNTRY_R01" FOREIGN KEY ("CONTINENT_SEQNO")
	  REFERENCES "PIBICSDM2"."CONTINENT" ("CONTINENT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."COUNTRY_PK" ON "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."COUNTRY_U01" ON "PIBICSDM2"."COUNTRY" ("COUNTCD") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."COUNTRY_U02" ON "PIBICSDM2"."COUNTRY" ("COUNTTNM") 
  ;
  GRANT SELECT ON "PIBICSDM2"."COUNTRY" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."COUNTRY" TO "DL_STAGING" WITH GRANT OPTION;
  GRANT SELECT ON "PIBICSDM2"."COUNTRY" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."COUNTRY" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."COUNTRY" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."COUNTRY" TO "DL_BLACKLIST";
  GRANT SELECT ON "PIBICSDM2"."COUNTRY" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."COUNTRY" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."COUNTRY" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."COUNTRY" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."COUNTRY" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."COUNTRY" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "PIBICSDM2"."COUNTRY" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."COUNTRY" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."COUNTRY" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."COUNTRY" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."COUNTRY" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."COUNTRY" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."COUNTRY" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."COUNTRY" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."COUNTRY" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."COUNTRY" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."COUNTRY" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."COUNTRY" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."COUNTRY" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."COUNTRY" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."COUNTRY" TO "BIOSAADM";
