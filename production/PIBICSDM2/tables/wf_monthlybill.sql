CREATE TABLE "PIBICSDM2"."WF_MONTHLYBILL" 
   (	"MON_SEQNO" NUMBER, 
	"MON_MONTH" NUMBER, 
	"MON_YEAR" CHAR(4 CHAR), 
	"MON_WATERAMT" NUMBER, 
	"MON_CLEANAMT" NUMBER, 
	"MON_PROPAMT" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"BD_ID" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."WF_MONTHLYBILL" ADD CONSTRAINT "WF_MONTHLYSET_PK" PRIMARY KEY ("MON_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."WF_MONTHLYSET_PK" ON "PIBICSDM2"."WF_MONTHLYBILL" ("MON_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."WF_MONTHLYBILL" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WF_MONTHLYBILL" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_MONTHLYBILL" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WF_MONTHLYBILL" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_MONTHLYBILL" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_MONTHLYBILL" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_MONTHLYBILL" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WF_MONTHLYBILL" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WF_MONTHLYBILL" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."WF_MONTHLYBILL" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."WF_MONTHLYBILL" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."WF_MONTHLYBILL" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."WF_MONTHLYBILL" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."WF_MONTHLYBILL" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."WF_MONTHLYBILL" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."WF_MONTHLYBILL" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."WF_MONTHLYBILL" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."WF_MONTHLYBILL" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."WF_MONTHLYBILL" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."WF_MONTHLYBILL" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."WF_MONTHLYBILL" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."WF_MONTHLYBILL" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."WF_MONTHLYBILL" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."WF_MONTHLYBILL" TO "BIOSAADM";
