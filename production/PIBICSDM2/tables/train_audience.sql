CREATE TABLE "PIBICSDM2"."TRAIN_AUDIENCE" 
   (	"AUD_SEQNO" NUMBER, 
	"COURSE_SEQNO" NUMBER, 
	"PROFILE_SEQNO" NUMBER, 
	"AUD_ATTENDSTATUS" CHAR(1 CHAR), 
	"AUD_ATTREMARK" VARCHAR2(100 CHAR), 
	"AUD_PASSSTATUS" CHAR(1 CHAR), 
	"AUD_FULLSCORE" NUMBER(10,2), 
	"AUD_PRESCORE" NUMBER(10,2), 
	"AUD_PREPERCENT" NUMBER(10,2), 
	"AUD_POSTSCORE" NUMBER(10,2), 
	"AUD_POSTPERCENT" NUMBER(10,2), 
	"AUD_DIFFSCORE" NUMBER(10,2), 
	"VERSION" NUMBER DEFAULT 1, 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"RANK_SEQNO" VARCHAR2(3 CHAR), 
	"POS_CODE" VARCHAR2(8 CHAR), 
	"NAME" VARCHAR2(25 CHAR), 
	"SNAME" VARCHAR2(25 CHAR), 
	"AUD_PREFULLSCORE" NUMBER(10,2)
   ) ;
  ALTER TABLE "PIBICSDM2"."TRAIN_AUDIENCE" ADD CONSTRAINT "TRAIN_AUDIENCE_PK" PRIMARY KEY ("AUD_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."TRAIN_AUDIENCE" ADD CONSTRAINT "TRAIN_AUDIENCE_R01" FOREIGN KEY ("COURSE_SEQNO")
	  REFERENCES "PIBICSDM2"."TRAIN_COURSE" ("COURSE_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."TRAIN_AUDIENCE" ADD CONSTRAINT "TRAIN_AUDIENCE_R02" FOREIGN KEY ("PROFILE_SEQNO")
	  REFERENCES "PIBICSDM2"."HR_PROFILE" ("PROFILE_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TRAIN_AUDIENCE_PK" ON "PIBICSDM2"."TRAIN_AUDIENCE" ("AUD_SEQNO") 
  ;
