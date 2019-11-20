CREATE TABLE "SERVAPP"."MSCS_EXT_SUBCOMMITTEE" 
   (	"SUBCOMMITTEE_SEQNO" NUMBER NOT NULL ENABLE, 
	"PROC_SEQNO" NUMBER, 
	"SMEETING_NO" VARCHAR2(20 CHAR), 
	"SMEETING_DATE" DATE, 
	"SREMARK" VARCHAR2(1000 CHAR), 
	"SRESOLVE" CHAR(1 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"SR_DETAIL" VARCHAR2(200 CHAR), 
	"SDATE" DATE
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_EXT_SUBCOMMITTEE" ADD CONSTRAINT "EXT_SUBCOMMITEE_PK" PRIMARY KEY ("SUBCOMMITTEE_SEQNO")
  USING INDEX (CREATE UNIQUE INDEX "SERVAPP"."MSCS_EXT_SUBCOMMITEE_PK" ON "SERVAPP"."MSCS_EXT_SUBCOMMITTEE" ("SUBCOMMITTEE_SEQNO") 
  )  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."MSCS_EXT_SUBCOMMITEE_PK" ON "SERVAPP"."MSCS_EXT_SUBCOMMITTEE" ("SUBCOMMITTEE_SEQNO") 
  ;
  GRANT SELECT ON "SERVAPP"."MSCS_EXT_SUBCOMMITTEE" TO "PIBICSAPP";
  GRANT ALTER ON "SERVAPP"."MSCS_EXT_SUBCOMMITTEE" TO "BIOSAADM";
  GRANT DELETE ON "SERVAPP"."MSCS_EXT_SUBCOMMITTEE" TO "BIOSAADM";
  GRANT INDEX ON "SERVAPP"."MSCS_EXT_SUBCOMMITTEE" TO "BIOSAADM";
  GRANT INSERT ON "SERVAPP"."MSCS_EXT_SUBCOMMITTEE" TO "BIOSAADM";
  GRANT SELECT ON "SERVAPP"."MSCS_EXT_SUBCOMMITTEE" TO "BIOSAADM";
  GRANT UPDATE ON "SERVAPP"."MSCS_EXT_SUBCOMMITTEE" TO "BIOSAADM";
  GRANT REFERENCES ON "SERVAPP"."MSCS_EXT_SUBCOMMITTEE" TO "BIOSAADM";
  GRANT READ ON "SERVAPP"."MSCS_EXT_SUBCOMMITTEE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "SERVAPP"."MSCS_EXT_SUBCOMMITTEE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "SERVAPP"."MSCS_EXT_SUBCOMMITTEE" TO "BIOSAADM";
  GRANT DEBUG ON "SERVAPP"."MSCS_EXT_SUBCOMMITTEE" TO "BIOSAADM";
  GRANT FLASHBACK ON "SERVAPP"."MSCS_EXT_SUBCOMMITTEE" TO "BIOSAADM";
