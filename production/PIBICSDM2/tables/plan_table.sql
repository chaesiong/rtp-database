CREATE TABLE "PIBICSDM2"."PLAN_TABLE" 
   (	"STATEMENT_ID" VARCHAR2(30 CHAR), 
	"PLAN_ID" NUMBER, 
	"TIMESTAMP" DATE, 
	"REMARKS" VARCHAR2(4000 CHAR), 
	"OPERATION" VARCHAR2(30 CHAR), 
	"OPTIONS" VARCHAR2(255 CHAR), 
	"OBJECT_NODE" VARCHAR2(128 CHAR), 
	"OBJECT_OWNER" VARCHAR2(30 CHAR), 
	"OBJECT_NAME" VARCHAR2(30 CHAR), 
	"OBJECT_ALIAS" VARCHAR2(65 CHAR), 
	"OBJECT_INSTANCE" NUMBER(*,0), 
	"OBJECT_TYPE" VARCHAR2(30 CHAR), 
	"OPTIMIZER" VARCHAR2(255 CHAR), 
	"SEARCH_COLUMNS" NUMBER, 
	"ID" NUMBER(*,0), 
	"PARENT_ID" NUMBER(*,0), 
	"DEPTH" NUMBER(*,0), 
	"POSITION" NUMBER(*,0), 
	"COST" NUMBER(*,0), 
	"CARDINALITY" NUMBER(*,0), 
	"BYTES" NUMBER(*,0), 
	"OTHER_TAG" VARCHAR2(255 CHAR), 
	"PARTITION_START" VARCHAR2(255 CHAR), 
	"PARTITION_STOP" VARCHAR2(255 CHAR), 
	"PARTITION_ID" NUMBER(*,0), 
	"OTHER" LONG, 
	"DISTRIBUTION" VARCHAR2(30 CHAR), 
	"CPU_COST" NUMBER(*,0), 
	"IO_COST" NUMBER(*,0), 
	"TEMP_SPACE" NUMBER(*,0), 
	"ACCESS_PREDICATES" VARCHAR2(4000 CHAR), 
	"FILTER_PREDICATES" VARCHAR2(4000 CHAR), 
	"PROJECTION" VARCHAR2(4000 CHAR), 
	"TIME" NUMBER(*,0), 
	"QBLOCK_NAME" VARCHAR2(30 CHAR), 
	"OTHER_XML" CLOB
   ) ;
  ;
