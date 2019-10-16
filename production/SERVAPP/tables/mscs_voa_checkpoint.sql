CREATE TABLE "SERVAPP"."MSCS_VOA_CHECKPOINT" 
   (	"CP_SEQNO" NUMBER NOT NULL ENABLE, 
	"CP_NO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"FIXTEXT" VARCHAR2(5 CHAR), 
	"VISANO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_VOA_CHECKPOINT" ADD CONSTRAINT "VOA_CHECKPOINT_PK" PRIMARY KEY ("CP_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."VOA_CHECKPOINT_PK" ON "SERVAPP"."MSCS_VOA_CHECKPOINT" ("CP_SEQNO") 
  ;