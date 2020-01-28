CREATE TABLE "PIBICSDM2"."TODOLIST" 
   (	"TD_SEQNO" NUMBER, 
	"TDCD" CHAR(4 CHAR), 
	"TDTNM" VARCHAR2(60 CHAR), 
	"TDENM" VARCHAR2(60 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."TODOLIST" ADD CONSTRAINT "TODOLIST_PK" PRIMARY KEY ("TD_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."TODOLIST" ADD CONSTRAINT "TODOLIST_U01" UNIQUE ("TDCD")
  USING INDEX (CREATE UNIQUE INDEX "PIBICSDM2"."TDCD_PK" ON "PIBICSDM2"."TODOLIST" ("TDCD") 
  )  ENABLE;
  ALTER TABLE "PIBICSDM2"."TODOLIST" ADD CONSTRAINT "TODOLIST_U02" UNIQUE ("TDTNM")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TDCD_PK" ON "PIBICSDM2"."TODOLIST" ("TDCD") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."TODOLIST_PK" ON "PIBICSDM2"."TODOLIST" ("TD_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."TODOLIST_U02" ON "PIBICSDM2"."TODOLIST" ("TDTNM") 
  ;
  GRANT SELECT ON "PIBICSDM2"."TODOLIST" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TODOLIST" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TODOLIST" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TODOLIST" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TODOLIST" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TODOLIST" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TODOLIST" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TODOLIST" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TODOLIST" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TODOLIST" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TODOLIST" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TODOLIST" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TODOLIST" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TODOLIST" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TODOLIST" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TODOLIST" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TODOLIST" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TODOLIST" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TODOLIST" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TODOLIST" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TODOLIST" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TODOLIST" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TODOLIST" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TODOLIST" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TODOLIST" TO "APPSUSR";
