CREATE GLOBAL TEMPORARY TABLE "SYSTEM"."OL$" SHARING=METADATA 
   (	"OL_NAME" VARCHAR2(128), 
	"SQL_TEXT" LONG, 
	"TEXTLEN" NUMBER, 
	"SIGNATURE" RAW(16), 
	"HASH_VALUE" NUMBER, 
	"HASH_VALUE2" NUMBER, 
	"CATEGORY" VARCHAR2(128), 
	"VERSION" VARCHAR2(64), 
	"CREATOR" VARCHAR2(128), 
	"TIMESTAMP" DATE, 
	"FLAGS" NUMBER, 
	"HINTCOUNT" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" VARCHAR2(1000)
   ) ON COMMIT PRESERVE ROWS ;
  CREATE UNIQUE INDEX "SYSTEM"."OL$NAME" ON "SYSTEM"."OL$" ("OL_NAME") ;
CREATE UNIQUE INDEX "SYSTEM"."OL$SIGNATURE" ON "SYSTEM"."OL$" ("SIGNATURE", "CATEGORY") ;
  GRANT DELETE ON "SYSTEM"."OL$" TO PUBLIC;
  GRANT INSERT ON "SYSTEM"."OL$" TO PUBLIC;
  GRANT SELECT ON "SYSTEM"."OL$" TO PUBLIC;
  GRANT UPDATE ON "SYSTEM"."OL$" TO PUBLIC;
