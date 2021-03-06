CREATE TABLE "PIBICSDM2"."EXT_PRO_25_1" 
   (	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"REF_REASON" VARCHAR2(300 CHAR), 
	"DOCITEM1" CHAR(1 CHAR), 
	"IT1_BANKNM" VARCHAR2(100 CHAR), 
	"IT1_TRANSFER_DATE" DATE, 
	"IT1_SUMTOTAL" NUMBER(15,2), 
	"DOCITEM2" CHAR(1 CHAR), 
	"IT2_PROJECTNM" VARCHAR2(100 CHAR), 
	"IT2_OUTCOME" NUMBER(15,2), 
	"DOCITEM3" CHAR(1 CHAR), 
	"IT3_BANKNM" VARCHAR2(100 CHAR), 
	"IT3_SUMTOTAL" NUMBER(15,2), 
	"DOCITEM4" CHAR(1 CHAR), 
	"IT4_FROM" VARCHAR2(100 CHAR), 
	"IT4_SUMTOTAL" NUMBER(15,2), 
	"DOCITEM5" CHAR(1 CHAR), 
	"IT5_OTH" VARCHAR2(100 CHAR), 
	"IT5_SUMTOTAL" NUMBER(15,2), 
	"FACT1" CHAR(1 CHAR), 
	"FACT2" CHAR(1 CHAR), 
	"FACT3" CHAR(1 CHAR), 
	"FACT4" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_25_1" ADD PRIMARY KEY ("PRO_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_25_1" ADD CONSTRAINT "EXT_PRO_25_1_R01" FOREIGN KEY ("PROC_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_PROCESS" ("PROC_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_C00207607" ON "PIBICSDM2"."EXT_PRO_25_1" ("PRO_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_25_1" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_25_1" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_25_1" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_25_1" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_25_1" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_25_1" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_25_1" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_25_1" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_25_1" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_25_1" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_25_1" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_25_1" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_PRO_25_1" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_PRO_25_1" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_PRO_25_1" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_PRO_25_1" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_25_1" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_PRO_25_1" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_PRO_25_1" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_PRO_25_1" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_PRO_25_1" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_PRO_25_1" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_PRO_25_1" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_PRO_25_1" TO "BIOSAADM";
