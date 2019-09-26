CREATE TABLE "PIBICSDM2"."FLIGHTNUMBERS_110925" 
   (	"FLIGHTSEQNO" NUMBER, 
	"FLIGHTPREFIX" VARCHAR2(10 CHAR), 
	"FLIGHTNUMBER" VARCHAR2(10 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"ALLFLAG" CHAR(1 CHAR), 
	"CARDTYPE" CHAR(1 CHAR), 
	"FLIGHTSTARTDTE" TIMESTAMP (6), 
	"FLIGHTENDDTE" TIMESTAMP (6), 
	"ACTFLAG" VARCHAR2(10 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
