CREATE TABLE "PIBICSDM2"."BKLMESSAGE" 
   (	"MSEQNO" NUMBER, 
	"MESSAGEDESC" VARCHAR2(400 CHAR)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."WLMESSAGE_PK" ON "PIBICSDM2"."BKLMESSAGE" ("MSEQNO") 
  ;
