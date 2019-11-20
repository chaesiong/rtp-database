CREATE TABLE "PIBICSDM2"."DISC_DEFENDANT" 
   (	"DEF_SEQNO" NUMBER, 
	"DEF_RANK" VARCHAR2(40 CHAR), 
	"DEF_NAME" VARCHAR2(80 CHAR), 
	"DEF_SNAME" VARCHAR2(80 CHAR), 
	"DEF_DEPTABBFMT1" VARCHAR2(200 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"COM_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."DISC_DEFENDANT" ADD FOREIGN KEY ("COM_SEQNO")
	  REFERENCES "PIBICSDM2"."DISC_COMPLAIN" ("COM_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."DISC_DEFENDANT_PK" ON "PIBICSDM2"."DISC_DEFENDANT" ("DEF_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."DISC_DEFENDANT" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DISC_DEFENDANT" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DISC_DEFENDANT" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DISC_DEFENDANT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DISC_DEFENDANT" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DISC_DEFENDANT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DISC_DEFENDANT" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DISC_DEFENDANT" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DISC_DEFENDANT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."DISC_DEFENDANT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."DISC_DEFENDANT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."DISC_DEFENDANT" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."DISC_DEFENDANT" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."DISC_DEFENDANT" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."DISC_DEFENDANT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."DISC_DEFENDANT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."DISC_DEFENDANT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."DISC_DEFENDANT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."DISC_DEFENDANT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."DISC_DEFENDANT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."DISC_DEFENDANT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."DISC_DEFENDANT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."DISC_DEFENDANT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."DISC_DEFENDANT" TO "BIOSAADM";
