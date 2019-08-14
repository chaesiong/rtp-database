CREATE TABLE "DL_BORDERCONTROL"."XLIB_COMPONENTS" 
   (	"COMP_ID" NUMBER NOT NULL ENABLE, 
	"COMP_NAME" VARCHAR2(100 CHAR), 
	"COMP_VERSION" VARCHAR2(50 CHAR), 
	"COMP_VERSION_LABEL" VARCHAR2(50 CHAR), 
	"COMP_DEPENDS_ON" VARCHAR2(4000 CHAR)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."XLIB_COMPONENTS" ADD CONSTRAINT "XLIB_COMPONENTS_PK" PRIMARY KEY ("COMP_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."XLIB_COMPONENTS" ADD CONSTRAINT "XLIB_COMPONENTS_U01" UNIQUE ("COMP_NAME")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."XLIB_COMPONENTS"."COMP_ID" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."XLIB_COMPONENTS"."COMP_NAME" IS 'Name of Component';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."XLIB_COMPONENTS"."COMP_VERSION" IS 'Version of Component';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."XLIB_COMPONENTS"."COMP_VERSION_LABEL" IS 'Version Lable of Component';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."XLIB_COMPONENTS"."COMP_DEPENDS_ON" IS 'Dependencies of Component';
   COMMENT ON TABLE "DL_BORDERCONTROL"."XLIB_COMPONENTS"  IS 'Not in use';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."XLIB_COMPONENTS_PK" ON "DL_BORDERCONTROL"."XLIB_COMPONENTS" ("COMP_ID") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."XLIB_COMPONENTS_U01" ON "DL_BORDERCONTROL"."XLIB_COMPONENTS" ("COMP_NAME") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."XLIB_COMPONENTS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."XLIB_COMPONENTS" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."XLIB_COMPONENTS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."XLIB_COMPONENTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."XLIB_COMPONENTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."XLIB_COMPONENTS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."XLIB_COMPONENTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."XLIB_COMPONENTS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."XLIB_COMPONENTS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."XLIB_COMPONENTS" TO "APPSUP";
