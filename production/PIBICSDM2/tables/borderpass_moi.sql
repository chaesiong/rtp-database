CREATE TABLE "PIBICSDM2"."BORDERPASS_MOI" 
   (	"SEQNO" NUMBER, 
	"PERSONID" VARCHAR2(20 CHAR), 
	"CITIZENID" VARCHAR2(13 CHAR), 
	"TFIRSTNM" VARCHAR2(100 CHAR), 
	"TFAMILYNM" VARCHAR2(100 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"IMGPERSON" BLOB, 
	"ISSUEBY" VARCHAR2(5 CHAR), 
	"ISSUEDATE" DATE, 
	"BORDERTYPE" CHAR(1 CHAR), 
	"BORDERNO" VARCHAR2(20 CHAR), 
	"REMARK" VARCHAR2(500 CHAR)
   ) ;
  ;
