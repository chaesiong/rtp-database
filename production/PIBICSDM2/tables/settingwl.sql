CREATE TABLE "PIBICSDM2"."SETTINGWL" 
   (	"SEQNO" NUMBER, 
	"AGCPHONE" VARCHAR2(100 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."SETTINGWL" ADD CONSTRAINT "SETTINGWL_PK" PRIMARY KEY ("SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SETTINGWL_PK" ON "PIBICSDM2"."SETTINGWL" ("SEQNO") 
  ;
