CREATE TABLE "SERVAPP"."MSCS_EXT_PRO_229" 
   (	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"EXT_DATE" DATE, 
	"EXT_DAY" NUMBER, 
	"REF_REASON" VARCHAR2(300 CHAR), 
	"PROCESS" VARCHAR2(100 CHAR), 
	"OTH" VARCHAR2(1500 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_EXT_PRO_229" ADD CONSTRAINT "MSCS_EXT_PRO_229_PK" PRIMARY KEY ("PRO_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."MSCS_EXT_PRO_229_PK" ON "SERVAPP"."MSCS_EXT_PRO_229" ("PRO_SEQNO") 
  ;
  GRANT SELECT ON "SERVAPP"."MSCS_EXT_PRO_229" TO "PIBICSAPP";
  GRANT ALTER ON "SERVAPP"."MSCS_EXT_PRO_229" TO "BIOSAADM";
  GRANT DELETE ON "SERVAPP"."MSCS_EXT_PRO_229" TO "BIOSAADM";
  GRANT INDEX ON "SERVAPP"."MSCS_EXT_PRO_229" TO "BIOSAADM";
  GRANT INSERT ON "SERVAPP"."MSCS_EXT_PRO_229" TO "BIOSAADM";
  GRANT SELECT ON "SERVAPP"."MSCS_EXT_PRO_229" TO "BIOSAADM";
  GRANT UPDATE ON "SERVAPP"."MSCS_EXT_PRO_229" TO "BIOSAADM";
  GRANT REFERENCES ON "SERVAPP"."MSCS_EXT_PRO_229" TO "BIOSAADM";
  GRANT READ ON "SERVAPP"."MSCS_EXT_PRO_229" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "SERVAPP"."MSCS_EXT_PRO_229" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "SERVAPP"."MSCS_EXT_PRO_229" TO "BIOSAADM";
  GRANT DEBUG ON "SERVAPP"."MSCS_EXT_PRO_229" TO "BIOSAADM";
  GRANT FLASHBACK ON "SERVAPP"."MSCS_EXT_PRO_229" TO "BIOSAADM";
