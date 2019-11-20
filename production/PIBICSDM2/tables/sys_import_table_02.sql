CREATE TABLE "PIBICSDM2"."SYS_IMPORT_TABLE_02" 
   (	"PROCESS_ORDER" NUMBER, 
	"DUPLICATE" NUMBER, 
	"DUMP_FILEID" NUMBER, 
	"DUMP_POSITION" NUMBER, 
	"DUMP_LENGTH" NUMBER, 
	"DUMP_ORIG_LENGTH" NUMBER, 
	"DUMP_ALLOCATION" NUMBER, 
	"COMPLETED_ROWS" NUMBER, 
	"ERROR_COUNT" NUMBER, 
	"ELAPSED_TIME" NUMBER, 
	"OBJECT_TYPE_PATH" VARCHAR2(200 CHAR), 
	"OBJECT_PATH_SEQNO" NUMBER, 
	"OBJECT_TYPE" VARCHAR2(30 CHAR), 
	"IN_PROGRESS" CHAR(1 CHAR), 
	"OBJECT_NAME" VARCHAR2(500 CHAR), 
	"OBJECT_LONG_NAME" VARCHAR2(4000 CHAR), 
	"OBJECT_SCHEMA" VARCHAR2(30 CHAR), 
	"ORIGINAL_OBJECT_SCHEMA" VARCHAR2(30 CHAR), 
	"ORIGINAL_OBJECT_NAME" VARCHAR2(4000 CHAR), 
	"PARTITION_NAME" VARCHAR2(30 CHAR), 
	"SUBPARTITION_NAME" VARCHAR2(30 CHAR), 
	"DATAOBJ_NUM" NUMBER, 
	"FLAGS" NUMBER, 
	"PROPERTY" NUMBER, 
	"TRIGFLAG" NUMBER, 
	"CREATION_LEVEL" NUMBER, 
	"COMPLETION_TIME" DATE, 
	"OBJECT_TABLESPACE" VARCHAR2(30 CHAR), 
	"SIZE_ESTIMATE" NUMBER, 
	"OBJECT_ROW" NUMBER, 
	"PROCESSING_STATE" CHAR(1 CHAR), 
	"PROCESSING_STATUS" CHAR(1 CHAR), 
	"BASE_PROCESS_ORDER" NUMBER, 
	"BASE_OBJECT_TYPE" VARCHAR2(30 CHAR), 
	"BASE_OBJECT_NAME" VARCHAR2(30 CHAR), 
	"BASE_OBJECT_SCHEMA" VARCHAR2(30 CHAR), 
	"ANCESTOR_PROCESS_ORDER" NUMBER, 
	"DOMAIN_PROCESS_ORDER" NUMBER, 
	"PARALLELIZATION" NUMBER, 
	"UNLOAD_METHOD" NUMBER, 
	"LOAD_METHOD" NUMBER, 
	"GRANULES" NUMBER, 
	"SCN" NUMBER, 
	"GRANTOR" VARCHAR2(30 CHAR), 
	"XML_CLOB" CLOB, 
	"PARENT_PROCESS_ORDER" NUMBER, 
	"NAME" VARCHAR2(30 CHAR), 
	"VALUE_T" VARCHAR2(4000 CHAR), 
	"VALUE_N" NUMBER, 
	"IS_DEFAULT" NUMBER, 
	"FILE_TYPE" NUMBER, 
	"USER_DIRECTORY" VARCHAR2(4000 CHAR), 
	"USER_FILE_NAME" VARCHAR2(4000 CHAR), 
	"FILE_NAME" VARCHAR2(4000 CHAR), 
	"EXTEND_SIZE" NUMBER, 
	"FILE_MAX_SIZE" NUMBER, 
	"PROCESS_NAME" VARCHAR2(30 CHAR), 
	"LAST_UPDATE" DATE, 
	"WORK_ITEM" VARCHAR2(30 CHAR), 
	"OBJECT_NUMBER" NUMBER, 
	"COMPLETED_BYTES" NUMBER, 
	"TOTAL_BYTES" NUMBER, 
	"METADATA_IO" NUMBER, 
	"DATA_IO" NUMBER, 
	"CUMULATIVE_TIME" NUMBER, 
	"PACKET_NUMBER" NUMBER, 
	"INSTANCE_ID" NUMBER, 
	"OLD_VALUE" VARCHAR2(4000 CHAR), 
	"SEED" NUMBER, 
	"LAST_FILE" NUMBER, 
	"USER_NAME" VARCHAR2(30 CHAR), 
	"OPERATION" VARCHAR2(30 CHAR), 
	"JOB_MODE" VARCHAR2(30 CHAR), 
	"QUEUE_TABNUM" NUMBER, 
	"CONTROL_QUEUE" VARCHAR2(30 CHAR), 
	"STATUS_QUEUE" VARCHAR2(30 CHAR), 
	"REMOTE_LINK" VARCHAR2(4000 CHAR), 
	"VERSION" NUMBER, 
	"JOB_VERSION" VARCHAR2(30 CHAR), 
	"DB_VERSION" VARCHAR2(30 CHAR), 
	"TIMEZONE" VARCHAR2(64 CHAR), 
	"STATE" VARCHAR2(30 CHAR), 
	"PHASE" NUMBER, 
	"GUID" RAW(16), 
	"START_TIME" DATE, 
	"BLOCK_SIZE" NUMBER, 
	"METADATA_BUFFER_SIZE" NUMBER, 
	"DATA_BUFFER_SIZE" NUMBER, 
	"DEGREE" NUMBER, 
	"PLATFORM" VARCHAR2(101 CHAR), 
	"ABORT_STEP" NUMBER, 
	"INSTANCE" VARCHAR2(60 CHAR), 
	"CLUSTER_OK" NUMBER, 
	"SERVICE_NAME" VARCHAR2(100 CHAR), 
	"OBJECT_INT_OID" VARCHAR2(32 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."SYS_IMPORT_TABLE_02" ADD UNIQUE ("PROCESS_ORDER", "DUPLICATE")
  USING INDEX  ENABLE;
  CREATE INDEX "PIBICSDM2"."SYS_MTABLE_00001E25D_IND_1" ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" ("OBJECT_SCHEMA", "OBJECT_NAME", "OBJECT_TYPE") 
  ;
CREATE INDEX "PIBICSDM2"."SYS_MTABLE_00001E25D_IND_2" ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" ("BASE_PROCESS_ORDER") 
  ;
CREATE INDEX "PIBICSDM2"."SYS_MTABLE_00001E25D_IND_3" ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" ("OBJECT_PATH_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_C00206903" ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" ("PROCESS_ORDER", "DUPLICATE") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000302028C00045$$" ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" (
  ;
  GRANT SELECT ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."SYS_IMPORT_TABLE_02" TO "BIOSAADM";
