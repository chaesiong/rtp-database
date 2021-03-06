CREATE TABLE "SYSTEM"."MVIEW$_ADV_FILTERINSTANCE" SHARING=METADATA 
   (	"RUNID#" NUMBER NOT NULL ENABLE, 
	"FILTERID#" NUMBER, 
	"SUBFILTERNUM#" NUMBER, 
	"SUBFILTERTYPE" NUMBER, 
	"STR_VALUE" VARCHAR2(1028), 
	"NUM_VALUE1" NUMBER, 
	"NUM_VALUE2" NUMBER, 
	"DATE_VALUE1" DATE, 
	"DATE_VALUE2" DATE
   ) ;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_FILTERINSTANCE" ADD CONSTRAINT "MVIEW$_ADV_FILTERINSTANCE_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "SYSTEM"."MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_FILTERINSTANCE"  IS 'Table for workload filter instance definition';
