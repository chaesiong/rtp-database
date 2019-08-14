CREATE TABLE "SYSTEM"."LOGSTDBY$APPLY_MILESTONE" SHARING=METADATA 
   (	"SESSION_ID" NUMBER NOT NULL ENABLE, 
	"COMMIT_SCN" NUMBER NOT NULL ENABLE, 
	"COMMIT_TIME" DATE, 
	"SYNCH_SCN" NUMBER NOT NULL ENABLE, 
	"EPOCH" NUMBER NOT NULL ENABLE, 
	"PROCESSED_SCN" NUMBER NOT NULL ENABLE, 
	"PROCESSED_TIME" DATE, 
	"FETCHLWM_SCN" NUMBER DEFAULT (0) NOT NULL ENABLE, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000), 
	"FLAGS" NUMBER, 
	"LWM_UPD_TIME" DATE, 
	"SPARE4" NUMBER, 
	"SPARE5" NUMBER, 
	"SPARE6" NUMBER, 
	"SPARE7" DATE, 
	"PTO_RECOVERY_SCN" NUMBER, 
	"PTO_RECOVERY_INCARNATION" NUMBER
   ) ;