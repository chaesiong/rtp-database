CREATE TABLE "SERVAPP"."MSCS_REPS_CHANGEPASSPORTHIST" 
   (	"PASSHIST_SEQNO" NUMBER NOT NULL ENABLE, 
	"MOVESTAMP_SEQNO" NUMBER, 
	"REPSPERSON_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORT_PIC" VARCHAR2(50 CHAR), 
	"PASSPORT_IMG" BLOB, 
	"ISSUE_DATE" DATE, 
	"ISSUE_PLACE" VARCHAR2(100 CHAR), 
	"EXP_DATE" DATE, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"FLAG" CHAR(1 CHAR), 
	"COUNT_SEQNO" NUMBER, 
	"FAMILYENM" VARCHAR2(30 CHAR), 
	"FIRSTENM" VARCHAR2(30 CHAR), 
	"MIDDLEENM" VARCHAR2(30 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"IPADDRESS" VARCHAR2(20 CHAR), 
	"UIPADDRESS" VARCHAR2(20 CHAR)
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_REPS_CHANGEPASSPORTHIST" ADD CONSTRAINT "MSCS_REPS_CHANGEPASSPORTHIST_PK" PRIMARY KEY ("PASSHIST_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."MSCS_REPS_CHANGEPASSPORTHIST_PK" ON "SERVAPP"."MSCS_REPS_CHANGEPASSPORTHIST" ("PASSHIST_SEQNO") 
  ;
CREATE UNIQUE INDEX "SERVAPP"."SYS_IL0000549300C00006$$" ON "SERVAPP"."MSCS_REPS_CHANGEPASSPORTHIST" (
  ;
  GRANT ALTER ON "SERVAPP"."MSCS_REPS_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT DELETE ON "SERVAPP"."MSCS_REPS_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT INDEX ON "SERVAPP"."MSCS_REPS_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT INSERT ON "SERVAPP"."MSCS_REPS_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT SELECT ON "SERVAPP"."MSCS_REPS_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT UPDATE ON "SERVAPP"."MSCS_REPS_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT REFERENCES ON "SERVAPP"."MSCS_REPS_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT READ ON "SERVAPP"."MSCS_REPS_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "SERVAPP"."MSCS_REPS_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "SERVAPP"."MSCS_REPS_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT DEBUG ON "SERVAPP"."MSCS_REPS_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT FLASHBACK ON "SERVAPP"."MSCS_REPS_CHANGEPASSPORTHIST" TO "BIOSAADM";
