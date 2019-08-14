CREATE TABLE "SYSTEM"."LOGSTDBY$APPLY_PROGRESS" SHARING=METADATA 
   (	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"COMMIT_SCN" NUMBER, 
	"COMMIT_TIME" DATE, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000)
   ) 
  PARTITION BY RANGE ("COMMIT_SCN") 
 (PARTITION "P0"  VALUES LESS THAN (0) ) ;