CREATE TABLE "PIBICSDM2"."WELFARE_HREDOCDT" 
   (	"FSCYEAR" CHAR(4 CHAR), 
	"DEPTCD" CHAR(4 CHAR), 
	"RQTDOCNO" CHAR(20 CHAR), 
	"MONTH" CHAR(2 CHAR), 
	"PMTAMT" NUMBER(10,2), 
	"RQTAMT" NUMBER(10,2), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER
   ) ;
