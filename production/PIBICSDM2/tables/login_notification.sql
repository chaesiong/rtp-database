CREATE TABLE "PIBICSDM2"."LOGIN_NOTIFICATION" 
   (	"PAGE" VARCHAR2(20 CHAR), 
	"MESSAGE" CLOB
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."LOGIN_NOTIFICATION_PK" ON "PIBICSDM2"."LOGIN_NOTIFICATION" ("PAGE") 
  ;
  ;
