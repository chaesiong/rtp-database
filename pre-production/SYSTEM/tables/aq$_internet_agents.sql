CREATE TABLE "SYSTEM"."AQ$_INTERNET_AGENTS" SHARING=METADATA 
   (	"AGENT_NAME" VARCHAR2(512) NOT NULL ENABLE, 
	"PROTOCOL" NUMBER(*,0) NOT NULL ENABLE, 
	"SPARE1" VARCHAR2(128)
   ) ;
  ALTER TABLE "SYSTEM"."AQ$_INTERNET_AGENTS" ADD PRIMARY KEY ("AGENT_NAME")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SYSTEM"."SYS_C002356" ON "SYSTEM"."AQ$_INTERNET_AGENTS" ("AGENT_NAME") 
  ;
