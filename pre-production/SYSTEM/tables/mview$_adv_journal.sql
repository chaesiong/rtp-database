CREATE TABLE "SYSTEM"."MVIEW$_ADV_JOURNAL" SHARING=METADATA 
   (	"RUNID#" NUMBER NOT NULL ENABLE, 
	"SEQ#" NUMBER NOT NULL ENABLE, 
	"TIMESTAMP" DATE NOT NULL ENABLE, 
	"FLAGS" NUMBER NOT NULL ENABLE, 
	"NUM" NUMBER, 
	"TEXT" LONG, 
	"TEXTLEN" NUMBER
   ) ;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_JOURNAL" ADD CONSTRAINT "MVIEW$_ADV_JOURNAL_PK" PRIMARY KEY ("RUNID#", "SEQ#")
  USING INDEX  ENABLE;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_JOURNAL" ADD CONSTRAINT "MVIEW$_ADV_JOURNAL_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "SYSTEM"."MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_JOURNAL"  IS 'Summary advisor journal table for debugging and information';
  CREATE UNIQUE INDEX "SYSTEM"."MVIEW$_ADV_JOURNAL_PK" ON "SYSTEM"."MVIEW$_ADV_JOURNAL" ("RUNID#", "SEQ#") 
  ;
