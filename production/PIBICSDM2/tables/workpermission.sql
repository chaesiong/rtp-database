CREATE TABLE "PIBICSDM2"."WORKPERMISSION" 
   (	"WORKPERID" NUMBER(10,0), 
	"FAID" NUMBER(10,0), 
	"WKGCD" VARCHAR2(20 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."WORKPERMISSION" ADD CONSTRAINT "WORKPERID_PK" PRIMARY KEY ("WORKPERID")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."WORKPERMISSION" ADD CONSTRAINT "WKGCD_FK2" FOREIGN KEY ("WKGCD")
	  REFERENCES "PIBICSDM2"."WORKGROUP" ("WKGCD") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."WORKPERID_PK" ON "PIBICSDM2"."WORKPERMISSION" ("WORKPERID") 
  ;