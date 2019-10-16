CREATE TABLE "PIBICSDM2"."WF_HEALTHHEADER" 
   (	"HH_SEQNO" NUMBER, 
	"PROFILE_SEQNO" NUMBER, 
	"HH_DOCDATE" DATE, 
	"HH_FISCALYEAR" CHAR(4 CHAR), 
	"HH_TOTALAMT" NUMBER, 
	"HH_TOTALITEM" NUMBER, 
	"HH_COVERDOCSTATUS" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"HH_RUNNINGNO" VARCHAR2(5 CHAR), 
	"HH_YEAR" VARCHAR2(4 CHAR), 
	"NAME" VARCHAR2(30 CHAR), 
	"SNAME" VARCHAR2(30 CHAR), 
	"RANK_SEQNO" VARCHAR2(3 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"POS_SEQNO" VARCHAR2(8 CHAR), 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"USER_DEPT_SEQNO" NUMBER, 
	"USER_DEPTCD" CHAR(3 CHAR), 
	"PAID_STATUS" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."WF_HEALTHHEADER" ADD CONSTRAINT "WF_HEALTHHEADER_PK" PRIMARY KEY ("HH_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."WF_HEALTHHEADER_PK" ON "PIBICSDM2"."WF_HEALTHHEADER" ("HH_SEQNO") 
  ;