CREATE TABLE "SERVAPP"."MSCS_TM5" 
   (	"TM5_SEQNO" NUMBER NOT NULL ENABLE, 
	"INDEPT_SEQNO" NUMBER, 
	"INSTYPE" CHAR(1 CHAR), 
	"INSSTATUS" CHAR(1 CHAR), 
	"FLAG" CHAR(1 CHAR), 
	"AMOUNT" NUMBER, 
	"TM2_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 1, 
	"ACTFLAG" CHAR(1 CHAR), 
	"CHKDEPT_SEQNO" NUMBER, 
	"NOTE" VARCHAR2(250 CHAR), 
	"GUARANTOR" VARCHAR2(250 CHAR)
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_TM5" ADD CONSTRAINT "TM5_PK" PRIMARY KEY ("TM5_SEQNO")
  USING INDEX (CREATE UNIQUE INDEX "SERVAPP"."MSCS_TM5_PK" ON "SERVAPP"."MSCS_TM5" ("TM5_SEQNO") 
  )  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."MSCS_TM5_PK" ON "SERVAPP"."MSCS_TM5" ("TM5_SEQNO") 
  ;
  GRANT SELECT ON "SERVAPP"."MSCS_TM5" TO "PIBICSAPP";
  GRANT ALTER ON "SERVAPP"."MSCS_TM5" TO "BIOSAADM";
  GRANT DELETE ON "SERVAPP"."MSCS_TM5" TO "BIOSAADM";
  GRANT INDEX ON "SERVAPP"."MSCS_TM5" TO "BIOSAADM";
  GRANT INSERT ON "SERVAPP"."MSCS_TM5" TO "BIOSAADM";
  GRANT SELECT ON "SERVAPP"."MSCS_TM5" TO "BIOSAADM";
  GRANT UPDATE ON "SERVAPP"."MSCS_TM5" TO "BIOSAADM";
  GRANT REFERENCES ON "SERVAPP"."MSCS_TM5" TO "BIOSAADM";
  GRANT READ ON "SERVAPP"."MSCS_TM5" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "SERVAPP"."MSCS_TM5" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "SERVAPP"."MSCS_TM5" TO "BIOSAADM";
  GRANT DEBUG ON "SERVAPP"."MSCS_TM5" TO "BIOSAADM";
  GRANT FLASHBACK ON "SERVAPP"."MSCS_TM5" TO "BIOSAADM";
