CREATE TABLE "PIBICSDM2"."ATCHANNEL_PORT_CONFIG" 
   (	"DEPTCD" VARCHAR2(5 CHAR), 
	"CONVCD" VARCHAR2(4 CHAR), 
	"TRAVCD" VARCHAR2(4 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."ATCHANNEL_PORT_CONFIG" ADD CONSTRAINT "ATCHANNEL_PORT_CONFIG_PK" PRIMARY KEY ("DEPTCD")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."ATCHANNEL_PORT_CONFIG_PK" ON "PIBICSDM2"."ATCHANNEL_PORT_CONFIG" ("DEPTCD") 
  ;