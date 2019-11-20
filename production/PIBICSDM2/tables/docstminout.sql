CREATE TABLE "PIBICSDM2"."DOCSTMINOUT" 
   (	"DOCSEQNO" NUMBER, 
	"SEQNO" VARCHAR2(100 CHAR), 
	"PERSONID" VARCHAR2(20 CHAR), 
	"CARDTYPE" CHAR(1 CHAR), 
	"TDTCD" VARCHAR2(4 CHAR), 
	"TDTNO" VARCHAR2(60 CHAR), 
	"COUNT_SEQNO" NUMBER, 
	"IMGDOC" BLOB, 
	"REMARK" VARCHAR2(1000 CHAR), 
	"CREUSR" VARCHAR2(30 CHAR), 
	"CREDTE" DATE, 
	"CREDTERM" VARCHAR2(20 CHAR), 
	"UPDUSR" VARCHAR2(30 CHAR), 
	"UPDDTE" DATE, 
	"UPDTERM" VARCHAR2(20 CHAR), 
	"FILEDOC" VARCHAR2(100 CHAR), 
	"DEPT_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."DOCSTMINOUT" ADD CONSTRAINT "DOCSTMINOUT_PK" PRIMARY KEY ("DOCSEQNO")
  USING INDEX  ENABLE;
  CREATE INDEX "PIBICSDM2"."DTM_CREUSR_IDX" ON "PIBICSDM2"."DOCSTMINOUT" ("CREUSR") 
  ;
CREATE INDEX "PIBICSDM2"."DTM_SEQNO_IDX" ON "PIBICSDM2"."DOCSTMINOUT" ("SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."DOCSTMINOUT_PK" ON "PIBICSDM2"."DOCSTMINOUT" ("DOCSEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301037C00008$$" ON "PIBICSDM2"."DOCSTMINOUT" (
  ;
  GRANT SELECT ON "PIBICSDM2"."DOCSTMINOUT" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DOCSTMINOUT" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DOCSTMINOUT" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DOCSTMINOUT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DOCSTMINOUT" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DOCSTMINOUT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DOCSTMINOUT" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DOCSTMINOUT" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DOCSTMINOUT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."DOCSTMINOUT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."DOCSTMINOUT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."DOCSTMINOUT" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."DOCSTMINOUT" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."DOCSTMINOUT" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."DOCSTMINOUT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."DOCSTMINOUT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."DOCSTMINOUT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."DOCSTMINOUT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."DOCSTMINOUT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."DOCSTMINOUT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."DOCSTMINOUT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."DOCSTMINOUT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."DOCSTMINOUT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."DOCSTMINOUT" TO "BIOSAADM";
