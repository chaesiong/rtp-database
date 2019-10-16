CREATE TABLE "PIBICSDM2"."VISATYPE_HISTORY" 
   (	"VISATYPE_HISTORYCD" CHAR(4 CHAR), 
	"VISATYPE_HISTORYTNM" VARCHAR2(60 CHAR), 
	"VISATYPE_HISTORYENM" VARCHAR2(60 CHAR), 
	"PERMITTDAYS" NUMBER(*,0) DEFAULT 0, 
	"ACTFLAG" CHAR(1 CHAR), 
	"UPDUSR" CHAR(6 CHAR), 
	"UPDDTE" DATE
   ) ;
  ALTER TABLE "PIBICSDM2"."VISATYPE_HISTORY" ADD CONSTRAINT "VISATYPE_HISTORYCD_PK" PRIMARY KEY ("VISATYPE_HISTORYCD")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."VISATYPE_HISTORYCD_PK" ON "PIBICSDM2"."VISATYPE_HISTORY" ("VISATYPE_HISTORYCD") 
  ;