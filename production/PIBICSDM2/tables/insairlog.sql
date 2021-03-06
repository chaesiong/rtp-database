CREATE TABLE "PIBICSDM2"."INSAIRLOG" 
   (	"INSAIRLOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"INSAIR_SEQNO" NUMBER, 
	"TM5_SEQNO" NUMBER, 
	"DEPT_AIR" NUMBER, 
	"FLIGHTNO" VARCHAR2(15 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"TM5LOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."INSAIRLOG" ADD CONSTRAINT "INSAIRLOG_PK" PRIMARY KEY ("INSAIRLOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INSAIRLOG" ADD CONSTRAINT "INSAIRLOG_R01" FOREIGN KEY ("TM5LOG_SEQNO")
	  REFERENCES "PIBICSDM2"."TM5LOG" ("TM5LOG_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INSAIRLOG_PK" ON "PIBICSDM2"."INSAIRLOG" ("INSAIRLOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."INSAIRLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INSAIRLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INSAIRLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INSAIRLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INSAIRLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INSAIRLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INSAIRLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INSAIRLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INSAIRLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INSAIRLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INSAIRLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INSAIRLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INSAIRLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INSAIRLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INSAIRLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INSAIRLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INSAIRLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INSAIRLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INSAIRLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INSAIRLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INSAIRLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INSAIRLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INSAIRLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INSAIRLOG" TO "BIOSAADM";
