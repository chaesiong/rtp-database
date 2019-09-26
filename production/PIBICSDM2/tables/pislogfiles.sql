CREATE TABLE "PIBICSDM2"."PISLOGFILES" 
   (	"PISFILENAME" VARCHAR2(20 CHAR), 
	"IMPORTDTE" DATE, 
	"STARTDTE" DATE, 
	"ENDDTE" DATE
   ) ;
  ALTER TABLE "PIBICSDM2"."PISLOGFILES" ADD CONSTRAINT "PISLOGFILES_PK" PRIMARY KEY ("PISFILENAME")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."PISLOGFILES_PK" ON "PIBICSDM2"."PISLOGFILES" ("PISFILENAME") 
  ;
