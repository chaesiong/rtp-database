CREATE TABLE "SERVAPP"."MSCS_TM2_COPY" 
   (	"TM2_SEQNO" NUMBER NOT NULL ENABLE, 
	"CONV_SEQNO" NUMBER, 
	"IODTE" TIMESTAMP (6), 
	"CARDTYPE" CHAR(1 CHAR), 
	"CONVNM" VARCHAR2(250 CHAR), 
	"CONVNATIONCD" NUMBER, 
	"CONVREGNO" VARCHAR2(50 CHAR), 
	"CONVOWNER" VARCHAR2(250 CHAR), 
	"TM2DEPT" NUMBER, 
	"IOCOUNTCD" NUMBER, 
	"IOPORTNM" VARCHAR2(250 CHAR), 
	"TM5_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"TM2NO" VARCHAR2(20 CHAR), 
	"TM2DTE" DATE, 
	"TM2USR" VARCHAR2(250 CHAR), 
	"FLIGHTNO" VARCHAR2(25), 
	"CONVCODE" VARCHAR2(20), 
	"IONOTE" VARCHAR2(250), 
	"IODEPT" NUMBER, 
	"IODEPTTH" NUMBER, 
	"AMOUNT_CRW" NUMBER, 
	"AMOUNT_PSG" NUMBER, 
	"AMOUNT_IO" NUMBER, 
	"AMOUNT_T" NUMBER, 
	"AMOUNT_S" NUMBER, 
	"CONVTYPE_SEQNO" NUMBER, 
	"ACTFLAG" CHAR(1), 
	"TM2MAIN_SEQNO" NUMBER, 
	"NOTE" VARCHAR2(500), 
	"CREATE_IP" VARCHAR2(25), 
	"UPDATE_IP" VARCHAR2(25), 
	"SHIFT_SEQNO" NUMBER, 
	"PD_SEQNO" NUMBER, 
	"ZONE_SEQNO" NUMBER, 
	"HEALTHFLAG" CHAR(1), 
	"PIBICSPK" NUMBER
   ) ;
  GRANT SELECT ON "SERVAPP"."MSCS_TM2_COPY" TO "PIBICSAPP";
  GRANT ALTER ON "SERVAPP"."MSCS_TM2_COPY" TO "BIOSAADM";
  GRANT DELETE ON "SERVAPP"."MSCS_TM2_COPY" TO "BIOSAADM";
  GRANT INDEX ON "SERVAPP"."MSCS_TM2_COPY" TO "BIOSAADM";
  GRANT INSERT ON "SERVAPP"."MSCS_TM2_COPY" TO "BIOSAADM";
  GRANT SELECT ON "SERVAPP"."MSCS_TM2_COPY" TO "BIOSAADM";
  GRANT UPDATE ON "SERVAPP"."MSCS_TM2_COPY" TO "BIOSAADM";
  GRANT REFERENCES ON "SERVAPP"."MSCS_TM2_COPY" TO "BIOSAADM";
  GRANT READ ON "SERVAPP"."MSCS_TM2_COPY" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "SERVAPP"."MSCS_TM2_COPY" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "SERVAPP"."MSCS_TM2_COPY" TO "BIOSAADM";
  GRANT DEBUG ON "SERVAPP"."MSCS_TM2_COPY" TO "BIOSAADM";
  GRANT FLASHBACK ON "SERVAPP"."MSCS_TM2_COPY" TO "BIOSAADM";
