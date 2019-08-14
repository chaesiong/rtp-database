CREATE TABLE "SYSTEM"."ROLLING$EVENTS" SHARING=METADATA 
   (	"EVENTID" NUMBER, 
	"INSTID" NUMBER, 
	"REVISION" NUMBER, 
	"EVENT_TIME" TIMESTAMP (6), 
	"TYPE" VARCHAR2(16), 
	"STATUS" NUMBER, 
	"MESSAGE" VARCHAR2(256), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(128)
   ) ;
