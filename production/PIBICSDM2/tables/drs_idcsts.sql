CREATE TABLE "PIBICSDM2"."DRS_IDCSTS" 
   (	"IDCSTS_SEQNO" NUMBER, 
	"IDCSTSCD" CHAR(2 CHAR), 
	"IDCSTS_DESC" VARCHAR2(100 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."DRS_IDCSTS" ADD CONSTRAINT "DRS_IDCSTS_PK" PRIMARY KEY ("IDCSTS_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."DRS_IDCSTS_PK" ON "PIBICSDM2"."DRS_IDCSTS" ("IDCSTS_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."DRS_IDCSTS_U01" ON "PIBICSDM2"."DRS_IDCSTS" ("IDCSTS_DESC") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."DRS_IDCSTS_U02" ON "PIBICSDM2"."DRS_IDCSTS" ("IDCSTSCD") 
  ;
