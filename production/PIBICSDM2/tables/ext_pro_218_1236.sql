CREATE TABLE "PIBICSDM2"."EXT_PRO_218_1236" 
   (	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"WIFENM" VARCHAR2(150 CHAR), 
	"REGIS_DATE" DATE, 
	"REGIS_PLACE" VARCHAR2(200 CHAR), 
	"NUMOFCHILD" NUMBER, 
	"ADDR" VARCHAR2(2500 CHAR), 
	"DEPOSIT" NUMBER(15,2), 
	"SALARY" NUMBER(15,2), 
	"OTH" VARCHAR2(1500 CHAR), 
	"RULE1" CHAR(1 CHAR), 
	"RULE2" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_218_1236" ADD CONSTRAINT "EXT_PRO_218_1236_PK" PRIMARY KEY ("PRO_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_218_1236" ADD CONSTRAINT "EXT_PRO_218_1236_R01" FOREIGN KEY ("PROC_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_PROCESS" ("PROC_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_PRO_218_1236_PK" ON "PIBICSDM2"."EXT_PRO_218_1236" ("PRO_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_1236" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_1236" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_1236" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_1236" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_1236" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_1236" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_1236" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_1236" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_1236" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_1236" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_1236" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_1236" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_PRO_218_1236" TO "BIOSAADM";
