CREATE TABLE "SERVAPP"."MSCS_INSAIR" 
   (	"INSAIR_SEQNO" NUMBER NOT NULL ENABLE, 
	"TM5_SEQNO" NUMBER, 
	"DEPT_AIR" NUMBER, 
	"FLIGHTNO" VARCHAR2(15 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_INSAIR" ADD CONSTRAINT "INSAIR_PK" PRIMARY KEY ("INSAIR_SEQNO")
  USING INDEX (CREATE UNIQUE INDEX "SERVAPP"."MSCS_INSAIR_PK" ON "SERVAPP"."MSCS_INSAIR" ("INSAIR_SEQNO") 
  )  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."MSCS_INSAIR_PK" ON "SERVAPP"."MSCS_INSAIR" ("INSAIR_SEQNO") 
  ;
