CREATE TABLE "SERVAPP"."MSCS_EXT_PRO_218_1236" 
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
  ALTER TABLE "SERVAPP"."MSCS_EXT_PRO_218_1236" ADD CONSTRAINT "MSCS_EXT_PRO_218_1236_PK" PRIMARY KEY ("PRO_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."MSCS_EXT_PRO_218_1236_PK" ON "SERVAPP"."MSCS_EXT_PRO_218_1236" ("PRO_SEQNO") 
  ;
  GRANT SELECT ON "SERVAPP"."MSCS_EXT_PRO_218_1236" TO "PIBICSAPP";
  GRANT ALTER ON "SERVAPP"."MSCS_EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT DELETE ON "SERVAPP"."MSCS_EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT INDEX ON "SERVAPP"."MSCS_EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT INSERT ON "SERVAPP"."MSCS_EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT SELECT ON "SERVAPP"."MSCS_EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT UPDATE ON "SERVAPP"."MSCS_EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT REFERENCES ON "SERVAPP"."MSCS_EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT READ ON "SERVAPP"."MSCS_EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "SERVAPP"."MSCS_EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "SERVAPP"."MSCS_EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT DEBUG ON "SERVAPP"."MSCS_EXT_PRO_218_1236" TO "BIOSAADM";
  GRANT FLASHBACK ON "SERVAPP"."MSCS_EXT_PRO_218_1236" TO "BIOSAADM";
