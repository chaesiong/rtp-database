CREATE TABLE "PIBICSDM2"."OVS_COUNTER" 
   (	"NAME" VARCHAR2(50 CHAR), 
	"VALUE" NUMBER(10,0)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."PK_OVS_COUNTER" ON "PIBICSDM2"."OVS_COUNTER" ("NAME") 
  ;