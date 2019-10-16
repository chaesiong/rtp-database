CREATE TABLE "PIBICSDM2"."SECTION" 
   (	"SECTION_SEQNO" NUMBER, 
	"SECTIONNM" VARCHAR2(50 CHAR), 
	"SECTIONDESC" VARCHAR2(250 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 1
   ) ;
  ALTER TABLE "PIBICSDM2"."SECTION" ADD PRIMARY KEY ("SECTION_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SECTION_PK" ON "PIBICSDM2"."SECTION" ("SECTION_SEQNO") 
  ;