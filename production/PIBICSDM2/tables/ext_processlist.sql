CREATE TABLE "PIBICSDM2"."EXT_PROCESSLIST" 
   (	"PROCLIST_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"EXTLIST_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_PROCESSLIST" ADD CONSTRAINT "EXT_PROCESSLIST_PK" PRIMARY KEY ("PROCLIST_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_PROCESSLIST" ADD CONSTRAINT "EXT_PROCESSLIST_R02" FOREIGN KEY ("EXTLIST_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_EXTENSIONLIST" ("EXTLIST_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EXT_PROCESSLIST" ADD CONSTRAINT "EXT_PROCESSLIST_R01" FOREIGN KEY ("PROC_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_PROCESS" ("PROC_SEQNO") DISABLE;
  CREATE INDEX "PIBICSDM2"."EXTP_EXTLIST_SEQNO_IDX" ON "PIBICSDM2"."EXT_PROCESSLIST" ("EXTLIST_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."EXTP_PROC_SEQNO_IDX" ON "PIBICSDM2"."EXT_PROCESSLIST" ("PROC_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."EXT_PROCESSLIST_PK" ON "PIBICSDM2"."EXT_PROCESSLIST" ("PROCLIST_SEQNO") 
  ;
