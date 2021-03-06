CREATE TABLE "SYSTEM"."MVIEW$_ADV_BASETABLE" SHARING=METADATA 
   (	"COLLECTIONID#" NUMBER NOT NULL ENABLE, 
	"QUERYID#" NUMBER NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128), 
	"TABLE_NAME" VARCHAR2(128), 
	"TABLE_TYPE" NUMBER
   ) ;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_BASETABLE" ADD CONSTRAINT "MVIEW$_ADV_BASETABLE_FK" FOREIGN KEY ("QUERYID#")
	  REFERENCES "SYSTEM"."MVIEW$_ADV_WORKLOAD" ("QUERYID#") ENABLE;
   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_BASETABLE"  IS 'Base tables refered by a query';
  CREATE INDEX "SYSTEM"."MVIEW$_ADV_BASETABLE_IDX_01" ON "SYSTEM"."MVIEW$_ADV_BASETABLE" ("QUERYID#") 
  ;
