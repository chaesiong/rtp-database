CREATE TABLE "PIBICSDM2"."BPDEPTDEFAULT" 
   (	"BPDSEQNO" NUMBER, 
	"CARDTYPE" CHAR(1 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"BPDOCSEQNO" NUMBER, 
	"IPADDRESS" VARCHAR2(20 CHAR), 
	"CHKHISTCARD" CHAR(1 CHAR), 
	"CHKDETEN" CHAR(1 CHAR), 
	"CHKTHAIBL" CHAR(1 CHAR), 
	"CHKIMGSTS" CHAR(1 CHAR), 
	"CHKFGPSTS" CHAR(1 CHAR), 
	"CHKFGPCARDSTS" CHAR(1 CHAR), 
	"CHKONESTOP" CHAR(1 CHAR), 
	"CHKADDCARD" CHAR(1 CHAR), 
	"BPTYPECARD" VARCHAR2(19 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."BPDEPTDEFAULT" ADD CONSTRAINT "BPDEPTDEFAULT_PK" PRIMARY KEY ("BPDSEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."BPDEPTDEFAULT" ADD CONSTRAINT "BPDEPTDEFAULT_R02" FOREIGN KEY ("COUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."BPDEPTDEFAULT" ADD CONSTRAINT "BPDEPTDEFAULT_R03" FOREIGN KEY ("BPDOCSEQNO")
	  REFERENCES "PIBICSDM2"."BPDOCTYPE" ("BPDOCSEQNO") ENABLE;
  CREATE INDEX "PIBICSDM2"."BPD_DEPT_SEQNO_IDX" ON "PIBICSDM2"."BPDEPTDEFAULT" ("DEPT_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."BPDEPTDEFAULT_PK" ON "PIBICSDM2"."BPDEPTDEFAULT" ("BPDSEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."BPDEPTDEFAULT" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTDEFAULT" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTDEFAULT" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTDEFAULT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTDEFAULT" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTDEFAULT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTDEFAULT" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTDEFAULT" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTDEFAULT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTDEFAULT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTDEFAULT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTDEFAULT" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."BPDEPTDEFAULT" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."BPDEPTDEFAULT" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."BPDEPTDEFAULT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."BPDEPTDEFAULT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."BPDEPTDEFAULT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."BPDEPTDEFAULT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."BPDEPTDEFAULT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."BPDEPTDEFAULT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."BPDEPTDEFAULT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."BPDEPTDEFAULT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."BPDEPTDEFAULT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."BPDEPTDEFAULT" TO "BIOSAADM";
