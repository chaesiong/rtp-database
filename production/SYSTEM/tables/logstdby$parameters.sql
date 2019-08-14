CREATE TABLE "SYSTEM"."LOGSTDBY$PARAMETERS" SHARING=METADATA 
   (	"NAME" VARCHAR2(30), 
	"VALUE" VARCHAR2(2000), 
	"TYPE" NUMBER, 
	"SCN" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000)
   ) ;
  GRANT SELECT ON "SYSTEM"."LOGSTDBY$PARAMETERS" TO "SYSBACKUP";
  GRANT DELETE ON "SYSTEM"."LOGSTDBY$PARAMETERS" TO "SYSBACKUP";
  GRANT INSERT ON "SYSTEM"."LOGSTDBY$PARAMETERS" TO "SYSBACKUP";
