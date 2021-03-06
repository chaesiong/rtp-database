CREATE TABLE "SERVAPP"."MSCS_REPS_PERSON" 
   (	"REPSPERSON_SEQNO" NUMBER NOT NULL ENABLE, 
	"FAMILYNM" VARCHAR2(100 CHAR), 
	"FIRSTNM" VARCHAR2(100 CHAR), 
	"MIDDLENM" VARCHAR2(100 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"NATIONAL_SEQNO" NUMBER, 
	"OPASSPORTNO" VARCHAR2(20 CHAR), 
	"OPASSPORT_DATE" DATE, 
	"OPASSPORTEXP_DATE" DATE, 
	"CPASSPORTNO" VARCHAR2(20 CHAR), 
	"CPASSPORT_DATE" DATE, 
	"CPASSPORTEXP_DATE" DATE, 
	"PERMIT_SEQNO" NUMBER, 
	"PERMIT_DATE" DATE, 
	"TM8_SEQNO" NUMBER, 
	"TM8NO" NUMBER, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"TM8CHILD_SEQNO" NUMBER, 
	"APPVSTS" CHAR(1 CHAR), 
	"DOCTYPE" CHAR(1 CHAR), 
	"YEAR" CHAR(4 CHAR), 
	"PERSONFLAG" CHAR(1 CHAR), 
	"VISA_SEQNO" NUMBER, 
	"VISAEND_DATE" DATE, 
	"STATUSENTRY" CHAR(1 CHAR), 
	"STATUSENTRYDTE" DATE, 
	"DOC_DATE" DATE, 
	"DEPT_SEQNO" NUMBER, 
	"ZONE_SEQNO" NUMBER
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_REPS_PERSON" ADD CONSTRAINT "MSCS_REPS_PERSON_PK" PRIMARY KEY ("REPSPERSON_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."MSCS_REPS_PERSON_PK" ON "SERVAPP"."MSCS_REPS_PERSON" ("REPSPERSON_SEQNO") 
  ;
  GRANT SELECT ON "SERVAPP"."MSCS_REPS_PERSON" TO "PIBICSAPP";
  GRANT ALTER ON "SERVAPP"."MSCS_REPS_PERSON" TO "BIOSAADM";
  GRANT DELETE ON "SERVAPP"."MSCS_REPS_PERSON" TO "BIOSAADM";
  GRANT INDEX ON "SERVAPP"."MSCS_REPS_PERSON" TO "BIOSAADM";
  GRANT INSERT ON "SERVAPP"."MSCS_REPS_PERSON" TO "BIOSAADM";
  GRANT SELECT ON "SERVAPP"."MSCS_REPS_PERSON" TO "BIOSAADM";
  GRANT UPDATE ON "SERVAPP"."MSCS_REPS_PERSON" TO "BIOSAADM";
  GRANT REFERENCES ON "SERVAPP"."MSCS_REPS_PERSON" TO "BIOSAADM";
  GRANT READ ON "SERVAPP"."MSCS_REPS_PERSON" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "SERVAPP"."MSCS_REPS_PERSON" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "SERVAPP"."MSCS_REPS_PERSON" TO "BIOSAADM";
  GRANT DEBUG ON "SERVAPP"."MSCS_REPS_PERSON" TO "BIOSAADM";
  GRANT FLASHBACK ON "SERVAPP"."MSCS_REPS_PERSON" TO "BIOSAADM";
