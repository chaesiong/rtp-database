CREATE TABLE "PIBICSDM2"."INV_SPSPECIALBEHAVIOR" 
   (	"SPS_SEQNO" NUMBER, 
	"SP_SEQNO" NUMBER, 
	"SPS_SECURITYLEVEL" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"ACTFLAG" CHAR(1 CHAR), 
	"SPS_BEHAVIOR" CLOB, 
	"SPS_REMARK" CLOB
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_SPSPECIALBEHAVIOR" ADD CONSTRAINT "INV_SPSPECIALBEHAVIOR_PK" PRIMARY KEY ("SPS_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SPSPECIALBEHAVIOR" ADD CONSTRAINT "INV_SPSPECIALBEHAVIOR_R01" FOREIGN KEY ("SP_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_SUSPECT" ("SP_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_SPSPECIALBEHAVIOR_PK" ON "PIBICSDM2"."INV_SPSPECIALBEHAVIOR" ("SPS_SEQNO") 
  ;
  ;
  ;
