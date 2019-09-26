CREATE TABLE "PIBICSDM2"."TMP_SYNC_TRAN_DRS_DETAINEEDESC" 
   (	"DETAINEEDESC_SEQNO" NUMBER, 
	"DETENPERSON_SEQNO" NUMBER, 
	"DETENRECORD_SEQNO" NUMBER, 
	"SKINCOLOR" VARCHAR2(100 CHAR), 
	"HAIRCOLOR" VARCHAR2(100 CHAR), 
	"BODYSHAPE" VARCHAR2(100 CHAR), 
	"TATTOO" VARCHAR2(100 CHAR), 
	"SCAR" VARCHAR2(100 CHAR), 
	"HEIGHT" NUMBER, 
	"WEIGHT" NUMBER, 
	"FACESHAPE" VARCHAR2(100 CHAR), 
	"HAIR" VARCHAR2(100 CHAR), 
	"EYEBROWS" VARCHAR2(100 CHAR), 
	"EYES" VARCHAR2(100 CHAR), 
	"EARS" VARCHAR2(100 CHAR), 
	"MOUTH" VARCHAR2(100 CHAR), 
	"NOSE" VARCHAR2(100 CHAR), 
	"TEETH" VARCHAR2(100 CHAR), 
	"CHIN" VARCHAR2(100 CHAR), 
	"BEARD" VARCHAR2(100 CHAR), 
	"BLOOD" VARCHAR2(15 CHAR), 
	"RMKAPPEARANCE" VARCHAR2(200 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"FRONT_PHOTO" VARCHAR2(200 CHAR), 
	"BACK_PHOTO" VARCHAR2(200 CHAR), 
	"LSIDE_PHOTO" VARCHAR2(200 CHAR), 
	"RSIDE_PHOTO" VARCHAR2(200 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TMP_SYNC_TRAN_DRS_DETAINEEDESC" ADD CONSTRAINT "TMP_SYNC_TRAN_DRS_DETAINEEDESC_PK" PRIMARY KEY ("DETAINEEDESC_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TMP_SYNC_TRAN_DRS_DETAINEEDESC_PK" ON "PIBICSDM2"."TMP_SYNC_TRAN_DRS_DETAINEEDESC" ("DETAINEEDESC_SEQNO") 
  ;
