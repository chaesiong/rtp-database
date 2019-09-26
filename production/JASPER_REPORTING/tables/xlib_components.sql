CREATE TABLE "JASPER_REPORTING"."XLIB_COMPONENTS" 
   (	"COMP_ID" NUMBER, 
	"COMP_NAME" VARCHAR2(100 CHAR), 
	"COMP_VERSION" VARCHAR2(50 CHAR), 
	"COMP_VERSION_LABEL" VARCHAR2(50 CHAR), 
	"COMP_DEPENDS_ON" VARCHAR2(4000 CHAR)
   ) ;
  ALTER TABLE "JASPER_REPORTING"."XLIB_COMPONENTS" ADD CONSTRAINT "XLIB_COMPONENTS_PK" PRIMARY KEY ("COMP_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "JASPER_REPORTING"."XLIB_COMPONENTS" ADD CONSTRAINT "XLIB_COMPONENTS_U01" UNIQUE ("COMP_NAME")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "JASPER_REPORTING"."XLIB_COMPONENTS_PK" ON "JASPER_REPORTING"."XLIB_COMPONENTS" ("COMP_ID") 
  ;
CREATE UNIQUE INDEX "JASPER_REPORTING"."XLIB_COMPONENTS_U01" ON "JASPER_REPORTING"."XLIB_COMPONENTS" ("COMP_NAME") 
  ;
