CREATE TABLE "SERVAPP"."MSCS_EXT_DOCNO" 
   (	"DOCNO_SEQNO" NUMBER NOT NULL ENABLE, 
	"DEPT_SEQNO" NUMBER, 
	"RUNNO" NUMBER, 
	"TYPE" CHAR(1 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"F_TEXT" VARCHAR2(20 CHAR), 
	"L_TEXT" VARCHAR2(20 CHAR), 
	"M_TEXT" VARCHAR2(20 CHAR), 
	"N_DIGIT" VARCHAR2(20 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"GOVSECTION" VARCHAR2(50 CHAR), 
	"PROC_TO" VARCHAR2(100 CHAR), 
	"PROC_RUNNO" NUMBER, 
	"TEL" VARCHAR2(20 CHAR), 
	"ZONE_SEQNO" NUMBER, 
	"NO_TEXT" VARCHAR2(20 CHAR), 
	"STATUS_OFFLINE" VARCHAR2(1 CHAR)
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_EXT_DOCNO" ADD CONSTRAINT "MSCS_EXT_DOCNO_PK" PRIMARY KEY ("DOCNO_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."MSCS_EXT_DOCNO_PK" ON "SERVAPP"."MSCS_EXT_DOCNO" ("DOCNO_SEQNO") 
  ;
  GRANT SELECT ON "SERVAPP"."MSCS_EXT_DOCNO" TO "PIBICSAPP";
  GRANT ALTER ON "SERVAPP"."MSCS_EXT_DOCNO" TO "BIOSAADM";
  GRANT DELETE ON "SERVAPP"."MSCS_EXT_DOCNO" TO "BIOSAADM";
  GRANT INDEX ON "SERVAPP"."MSCS_EXT_DOCNO" TO "BIOSAADM";
  GRANT INSERT ON "SERVAPP"."MSCS_EXT_DOCNO" TO "BIOSAADM";
  GRANT SELECT ON "SERVAPP"."MSCS_EXT_DOCNO" TO "BIOSAADM";
  GRANT UPDATE ON "SERVAPP"."MSCS_EXT_DOCNO" TO "BIOSAADM";
  GRANT REFERENCES ON "SERVAPP"."MSCS_EXT_DOCNO" TO "BIOSAADM";
  GRANT READ ON "SERVAPP"."MSCS_EXT_DOCNO" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "SERVAPP"."MSCS_EXT_DOCNO" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "SERVAPP"."MSCS_EXT_DOCNO" TO "BIOSAADM";
  GRANT DEBUG ON "SERVAPP"."MSCS_EXT_DOCNO" TO "BIOSAADM";
  GRANT FLASHBACK ON "SERVAPP"."MSCS_EXT_DOCNO" TO "BIOSAADM";
