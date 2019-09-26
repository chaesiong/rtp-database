CREATE TABLE "PIBICSDM2"."TMP_BACKUP_MAS_INDICATECARD" 
   (	"IDC_SEQNO" NUMBER, 
	"IDCCD" CHAR(4 CHAR), 
	"IDCTNM" VARCHAR2(60 CHAR), 
	"IDCENM" VARCHAR2(60 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"BK_IDCCD" VARCHAR2(4 CHAR)
   ) ;
