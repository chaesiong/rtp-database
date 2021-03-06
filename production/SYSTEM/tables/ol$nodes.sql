CREATE GLOBAL TEMPORARY TABLE "SYSTEM"."OL$NODES" SHARING=METADATA 
   (	"OL_NAME" VARCHAR2(128), 
	"CATEGORY" VARCHAR2(128), 
	"NODE_ID" NUMBER, 
	"PARENT_ID" NUMBER, 
	"NODE_TYPE" NUMBER, 
	"NODE_TEXTLEN" NUMBER, 
	"NODE_TEXTOFF" NUMBER, 
	"NODE_NAME" VARCHAR2(64)
   ) ON COMMIT PRESERVE ROWS ;
  GRANT DELETE ON "SYSTEM"."OL$NODES" TO PUBLIC;
  GRANT INSERT ON "SYSTEM"."OL$NODES" TO PUBLIC;
  GRANT SELECT ON "SYSTEM"."OL$NODES" TO PUBLIC;
  GRANT UPDATE ON "SYSTEM"."OL$NODES" TO PUBLIC;
