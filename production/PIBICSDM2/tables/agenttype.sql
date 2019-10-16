CREATE TABLE "PIBICSDM2"."AGENTTYPE" 
   (	"AGENTTYPE_SEQNO" NUMBER, 
	"AGENTTYPENM" VARCHAR2(200 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."AGENTTYPE" ADD CONSTRAINT "AGENTTYPE_PK" PRIMARY KEY ("AGENTTYPE_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."AGENTTYPE_PK" ON "PIBICSDM2"."AGENTTYPE" ("AGENTTYPE_SEQNO") 
  ;