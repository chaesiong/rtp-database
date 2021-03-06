CREATE TABLE "PIBICSDM2"."DEPARTMENTDPT_LOG" 
   (	"DEPTDPT_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"DEPTDPT_SEQNO" NUMBER, 
	"DEPTDPTNM" VARCHAR2(100 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"DEPTDPTTYPE" VARCHAR2(5 CHAR), 
	"DEPTDPTCD" VARCHAR2(2 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."DEPARTMENTDPT_LOG" ADD CONSTRAINT "DEPARTMENTDPT_LOG_PK" PRIMARY KEY ("DEPTDPT_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."DEPARTMENTDPT_LOG_PK" ON "PIBICSDM2"."DEPARTMENTDPT_LOG" ("DEPTDPT_LOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."DEPARTMENTDPT_LOG" TO "BIOSAADM";
