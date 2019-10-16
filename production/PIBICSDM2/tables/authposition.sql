CREATE TABLE "PIBICSDM2"."AUTHPOSITION" 
   (	"AUTHPOSID" NUMBER(10,0), 
	"WKGCD" VARCHAR2(20 CHAR), 
	"POSLEVELID" CHAR(2 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."AUTHPOSITION" ADD CONSTRAINT "AUTHPOSID_PK" PRIMARY KEY ("AUTHPOSID")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."AUTHPOSITION" ADD CONSTRAINT "WKGCD_FK1" FOREIGN KEY ("WKGCD")
	  REFERENCES "PIBICSDM2"."WORKGROUP" ("WKGCD") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."AUTHPOSID_PK" ON "PIBICSDM2"."AUTHPOSITION" ("AUTHPOSID") 
  ;