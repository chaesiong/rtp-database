CREATE TABLE "PIBICSDM2"."WELFARE_FMC" 
   (	"CITIZENID" CHAR(13 CHAR), 
	"RCITIZENID" CHAR(13 CHAR), 
	"FMCTYPE" CHAR(1 CHAR), 
	"HCFMCWELFARE" CHAR(1 CHAR), 
	"SATURE" VARCHAR2(60 CHAR), 
	"FIRSTNM" VARCHAR2(60 CHAR), 
	"LASTNAM" VARCHAR2(60 CHAR), 
	"OCCUPATION" CHAR(1 CHAR), 
	"POSITION" VARCHAR2(60 CHAR), 
	"WORKPLACE" VARCHAR2(60 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER
   ) ;
